#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Gerador de Código LLVM IR para TypeScript Simplificado

Este módulo converte a AST analisada semanticamente em código intermediário LLVM.
Usa a biblioteca llvmlite para construir o IR de forma programática.

Características:
- Suporte a tipos básicos: number (double), string (i8*), boolean (i1)
- Suporte a arrays: number[], string[]
- Declarações let e const
- Funções com parâmetros e retorno
- Estruturas de controle: if/else, while, for
- Operadores aritméticos, lógicos e de comparação
- Funções nativas: console.log, Math.sqrt, Math.pow, parseInt, parseFloat
"""

import os
import sys
import subprocess
from typing import Dict, List, Optional, Any
from llvmlite import ir
from llvmlite import binding as llvm

# Importar o parser e visitor
from antlr4 import CommonTokenStream, FileStream
from gen.TypeScriptSimplificadoLexer import TypeScriptSimplificadoLexer
from gen.TypeScriptSimplificadoParser import TypeScriptSimplificadoParser
from gen.TypeScriptSimplificadoVisitor import TypeScriptSimplificadoVisitor
from semantic_analyzer import SemanticAnalyzer


class LLVMCodeGenerator(TypeScriptSimplificadoVisitor):
    """
    Gera código LLVM IR a partir da AST.
    
    Funciona em conjunto com o SemanticAnalyzer para garantir que
    o código está semanticamente correto antes de gerar IR.
    """
    
    def __init__(self, semantic_analyzer: SemanticAnalyzer):
        """
        Inicializa o gerador de código.
        
        Args:
            semantic_analyzer: Analisador semântico que já analisou o código
        """
        self.semantic = semantic_analyzer
        
        # Criar módulo LLVM
        self.module = ir.Module(name="typescript_module")
        
        # Tipos LLVM básicos
        self.i32 = ir.IntType(32)       # int (para índices)
        self.i64 = ir.IntType(64)       # long
        self.i1 = ir.IntType(1)         # bool
        self.i8 = ir.IntType(8)         # byte
        self.double = ir.DoubleType()   # number (double precision)
        self.void = ir.VoidType()
        self.i8_ptr = self.i8.as_pointer()  # string (char*)
        
        # Mapeamento de variáveis para seus valores LLVM (alloca ou global)
        # Cada escopo tem seu próprio dicionário
        self.symbol_table: List[Dict[str, Any]] = [{}]
        
        # Função atual sendo gerada
        self.current_function: Optional[ir.Function] = None
        self.builder: Optional[ir.IRBuilder] = None
        
        # Bloco atual (para controle de fluxo)
        self.current_block: Optional[ir.Block] = None
        
        # Contador para nomes únicos de labels
        self.label_counter = 0
        
        # Declarar funções externas
        self._declare_external_functions()
        
        # Criar strings de formato globais para printf
        self._create_format_strings()
    
    def _declare_external_functions(self):
        """
        Declara funções externas (printf, scanf, sqrt, pow, etc.)
        """
        # printf: int printf(char*, ...)
        printf_ty = ir.FunctionType(self.i32, [self.i8_ptr], var_arg=True)
        self.printf = ir.Function(self.module, printf_ty, name="printf")
        
        # puts: int puts(char*)
        puts_ty = ir.FunctionType(self.i32, [self.i8_ptr])
        self.puts = ir.Function(self.module, puts_ty, name="puts")
        
        # sqrt: double sqrt(double)
        sqrt_ty = ir.FunctionType(self.double, [self.double])
        self.sqrt_func = ir.Function(self.module, sqrt_ty, name="sqrt")
        
        # pow: double pow(double, double)
        pow_ty = ir.FunctionType(self.double, [self.double, self.double])
        self.pow_func = ir.Function(self.module, pow_ty, name="pow")
        
        # atoi: int atoi(char*)
        atoi_ty = ir.FunctionType(self.i32, [self.i8_ptr])
        self.atoi = ir.Function(self.module, atoi_ty, name="atoi")
        
        # atof: double atof(char*)
        atof_ty = ir.FunctionType(self.double, [self.i8_ptr])
        self.atof = ir.Function(self.module, atof_ty, name="atof")
        
        # malloc: void* malloc(size_t)
        malloc_ty = ir.FunctionType(self.i8_ptr, [self.i64])
        self.malloc = ir.Function(self.module, malloc_ty, name="malloc")
    
    def _create_format_strings(self):
        """
        Cria strings de formato globais para printf.
        """
        # String de formato para números: "%g\n"
        fmt_str = "%g\n\0"
        c_fmt = ir.Constant(ir.ArrayType(self.i8, len(fmt_str)),
                           bytearray(fmt_str.encode("utf8")))
        self.fmt_number = ir.GlobalVariable(self.module, c_fmt.type, name="fmt_number")
        self.fmt_number.linkage = 'internal'
        self.fmt_number.global_constant = True
        self.fmt_number.initializer = c_fmt
        
        # String de formato para strings: "%s\n"
        fmt_str = "%s\n\0"
        c_fmt = ir.Constant(ir.ArrayType(self.i8, len(fmt_str)),
                           bytearray(fmt_str.encode("utf8")))
        self.fmt_string = ir.GlobalVariable(self.module, c_fmt.type, name="fmt_string")
        self.fmt_string.linkage = 'internal'
        self.fmt_string.global_constant = True
        self.fmt_string.initializer = c_fmt
        
        # String de formato para booleanos: "%s\n"
        fmt_str = "%s\n\0"
        c_fmt = ir.Constant(ir.ArrayType(self.i8, len(fmt_str)),
                           bytearray(fmt_str.encode("utf8")))
        self.fmt_bool = ir.GlobalVariable(self.module, c_fmt.type, name="fmt_bool")
        self.fmt_bool.linkage = 'internal'
        self.fmt_bool.global_constant = True
        self.fmt_bool.initializer = c_fmt
        
        # Strings "true" e "false"
        true_str = "true\0"
        c_true = ir.Constant(ir.ArrayType(self.i8, len(true_str)),
                            bytearray(true_str.encode("utf8")))
        self.str_true = ir.GlobalVariable(self.module, c_true.type, name="str_true")
        self.str_true.linkage = 'internal'
        self.str_true.global_constant = True
        self.str_true.initializer = c_true
        
        false_str = "false\0"
        c_false = ir.Constant(ir.ArrayType(self.i8, len(false_str)),
                             bytearray(false_str.encode("utf8")))
        self.str_false = ir.GlobalVariable(self.module, c_false.type, name="str_false")
        self.str_false.linkage = 'internal'
        self.str_false.global_constant = True
        self.str_false.initializer = c_false
    
    def _llvm_type(self, type_str: str) -> ir.Type:
        """
        Converte uma string de tipo para tipo LLVM.
        
        Args:
            type_str: Tipo como string ('number', 'string', 'boolean', 'number[]', 'string[]', 'void')
            
        Returns:
            Tipo LLVM correspondente
        """
        if type_str == "number":
            return self.double
        elif type_str == "string":
            return self.i8_ptr
        elif type_str == "boolean":
            return self.i1
        elif type_str == "number[]":
            # Array de doubles: {i64 length, double* data}
            return ir.LiteralStructType([self.i64, self.double.as_pointer()])
        elif type_str == "string[]":
            # Array de strings: {i64 length, i8** data}
            return ir.LiteralStructType([self.i64, self.i8_ptr.as_pointer()])
        elif type_str == "void":
            return self.void
        else:
            raise ValueError(f"Tipo desconhecido: {type_str}")
    
    def _create_entry_block_alloca(self, name: str, ty: ir.Type) -> ir.AllocaInstr:
        """
        Cria uma instrução alloca no bloco de entrada da função.
        
        É uma boa prática colocar todas as allocas no início da função
        para facilitar otimizações posteriores.
        
        Args:
            name: Nome da variável
            ty: Tipo LLVM da variável
            
        Returns:
            Instrução alloca criada
        """
        # Salvar posição atual do builder
        current_block = self.builder.block
        
        # Ir para o início do bloco de entrada
        entry_block = self.current_function.entry_basic_block
        if len(entry_block.instructions) > 0:
            self.builder.position_before(entry_block.instructions[0])
        else:
            self.builder.position_at_end(entry_block)
        
        # Criar alloca
        alloca = self.builder.alloca(ty, name=name)
        
        # Voltar para posição original
        self.builder.position_at_end(current_block)
        
        return alloca
    
    def push_scope(self):
        """Cria um novo escopo de variáveis."""
        self.symbol_table.append({})
    
    def pop_scope(self):
        """Remove o escopo atual."""
        if len(self.symbol_table) > 1:
            self.symbol_table.pop()
    
    def declare_variable(self, name: str, type_str: str, value: Optional[ir.Value] = None):
        """
        Declara uma variável no escopo atual.
        
        Args:
            name: Nome da variável
            type_str: Tipo da variável como string
            value: Valor inicial (opcional)
        """
        llvm_ty = self._llvm_type(type_str)
        
        # Se estamos no escopo global (apenas um escopo na tabela), criar variável global
        if len(self.symbol_table) == 1:
            # Criar variável global
            global_var = ir.GlobalVariable(self.module, llvm_ty, name=name)
            global_var.linkage = 'internal'
            
            # Inicializar com zero ou valor fornecido
            if value is not None and isinstance(value, ir.Constant):
                global_var.initializer = value
            else:
                # Inicializar com zero
                if llvm_ty == self.double:
                    global_var.initializer = ir.Constant(self.double, 0.0)
                elif llvm_ty == self.i1:
                    global_var.initializer = ir.Constant(self.i1, 0)
                elif llvm_ty == self.i8_ptr:
                    global_var.initializer = ir.Constant(self.i8_ptr, None)
                else:
                    global_var.initializer = ir.Constant(llvm_ty, None)
            
            # Se o valor não é constante, precisa ser armazenado no main
            if value is not None and not isinstance(value, ir.Constant):
                self.builder.store(value, global_var)
            
            self.symbol_table[-1][name] = global_var
        else:
            # Variável local - usar alloca
            alloca = self._create_entry_block_alloca(name, llvm_ty)
            
            # Inicializa se houver valor
            if value is not None:
                self.builder.store(value, alloca)
            
            self.symbol_table[-1][name] = alloca
    
    def lookup_variable(self, name: str) -> Optional[Any]:
        """
        Busca uma variável nos escopos (do mais interno ao mais externo).
        
        Args:
            name: Nome da variável
            
        Returns:
            Instrução alloca/global da variável, ou None se não encontrada
        """
        for scope in reversed(self.symbol_table):
            if name in scope:
                return scope[name]
        return None
    
    def _get_unique_label(self, prefix: str) -> str:
        """
        Gera um nome único para um label.
        """
        label = f"{prefix}_{self.label_counter}"
        self.label_counter += 1
        return label
    
    def _create_string_constant(self, text: str) -> ir.Constant:
        """
        Cria uma string constante global.
        
        Args:
            text: Texto da string (sem o terminador nulo)
            
        Returns:
            Ponteiro para a string
        """
        # Adiciona terminador nulo
        text_bytes = (text + '\0').encode('utf8')
        
        # Cria constante de array
        c_str = ir.Constant(ir.ArrayType(self.i8, len(text_bytes)),
                           bytearray(text_bytes))
        
        # Cria variável global
        global_str = ir.GlobalVariable(self.module, c_str.type, 
                                       name=self._get_unique_label("str"))
        global_str.linkage = 'internal'
        global_str.global_constant = True
        global_str.initializer = c_str
        
        return global_str
    
    def _string_literal_to_ptr(self, text: str) -> ir.Value:
        """
        Converte um literal de string para um ponteiro i8*.
        
        Args:
            text: Texto da string (com aspas)
            
        Returns:
            Ponteiro i8* para a string
        """
        # Remove aspas
        text = text[1:-1]
        
        # Processa escapes simples
        text = text.replace('\\n', '\n')
        text = text.replace('\\t', '\t')
        text = text.replace('\\r', '\r')
        text = text.replace('\\\\', '\\')
        text = text.replace('\\"', '"')
        text = text.replace("\\'", "'")
        
        # Cria string constante
        global_str = self._create_string_constant(text)
        
        # Retorna ponteiro para o primeiro elemento
        zero = ir.Constant(self.i32, 0)
        return self.builder.gep(global_str, [zero, zero], inbounds=True)
    
    # ========================================================================
    # VISITOR - Programa
    # ========================================================================
    
    def visitProgram(self, ctx: TypeScriptSimplificadoParser.ProgramContext):
        """
        Visita o programa inteiro.
        Cria a função main e processa declarações globais e funções.
        """
        # Criar função main
        main_type = ir.FunctionType(self.i32, [])
        main_func = ir.Function(self.module, main_type, name="main")
        block = main_func.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)
        self.current_function = main_func
        self.current_block = block
        
        # Processar statements e funções
        for child in ctx.children:
            if child is not None and hasattr(child, 'accept'):
                child.accept(self)
        
        # Adicionar return 0 no final do main
        self.builder.ret(ir.Constant(self.i32, 0))
        
        return None
    
    # ========================================================================
    # VISITOR - Declarações de Funções
    # ========================================================================
    
    def visitFunctionDecl(self, ctx: TypeScriptSimplificadoParser.FunctionDeclContext):
        """
        Visita declaração de função.
        """
        func_name = ctx.ID().getText()
        
        # Determinar tipo de retorno
        return_type_ctx = ctx.returnType()
        if return_type_ctx.VOID():
            return_type = self.void
            return_type_str = "void"
        else:
            type_annotation = return_type_ctx.typeAnnotation()
            return_type_str = self.semantic.get_type_annotation(type_annotation)
            return_type = self._llvm_type(return_type_str)
        
        # Coletar parâmetros
        param_types = []
        param_names = []
        param_type_strs = []
        
        if ctx.paramList():
            for param_ctx in ctx.paramList().param():
                param_name = param_ctx.ID().getText()
                param_type_str = self.semantic.get_type_annotation(param_ctx.typeAnnotation())
                param_type = self._llvm_type(param_type_str)
                
                param_names.append(param_name)
                param_types.append(param_type)
                param_type_strs.append(param_type_str)
        
        # Criar função
        func_type = ir.FunctionType(return_type, param_types)
        func = ir.Function(self.module, func_type, name=func_name)
        
        # Salvar contexto da função main
        old_function = self.current_function
        old_builder = self.builder
        old_block = self.current_block
        
        # Configurar nova função
        self.current_function = func
        block = func.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)
        self.current_block = block
        
        # Criar novo escopo para a função
        self.push_scope()
        
        # Adicionar função à tabela de símbolos global
        self.symbol_table[0][func_name] = func
        
        # Declarar parâmetros no escopo da função
        for i, (param_name, param_type, param_type_str) in enumerate(zip(param_names, param_types, param_type_strs)):
            # Criar alloca para o parâmetro
            alloca = self._create_entry_block_alloca(param_name, param_type)
            # Copiar valor do argumento para a alloca
            self.builder.store(func.args[i], alloca)
            # Adicionar à tabela de símbolos
            self.symbol_table[-1][param_name] = alloca
        
        # Visitar corpo da função
        self.visit(ctx.block())
        
        # Adicionar return implícito se necessário
        if not self.builder.block.is_terminated:
            if return_type_str == "void":
                self.builder.ret_void()
            else:
                # Funções não-void devem sempre retornar algo
                # O analisador semântico já verificou isso
                if return_type_str == "number":
                    self.builder.ret(ir.Constant(self.double, 0.0))
                elif return_type_str == "boolean":
                    self.builder.ret(ir.Constant(self.i1, 0))
                elif return_type_str == "string":
                    null_ptr = ir.Constant(self.i8_ptr, None)
                    self.builder.ret(null_ptr)
        
        # Sair do escopo da função
        self.pop_scope()
        
        # Restaurar contexto
        self.current_function = old_function
        self.builder = old_builder
        self.current_block = old_block
        
        return None
    
    # ========================================================================
    # VISITOR - Statements
    # ========================================================================
    
    def visitBlock(self, ctx: TypeScriptSimplificadoParser.BlockContext):
        """
        Visita bloco de código.
        """
        # Criar novo escopo
        self.push_scope()
        
        # Visitar statements
        for stmt in ctx.statement():
            if stmt is not None:
                self.visit(stmt)
        
        # Sair do escopo
        self.pop_scope()
        
        return None
    
    def visitLetDecl(self, ctx: TypeScriptSimplificadoParser.LetDeclContext):
        """
        Visita declaração de variável com let.
        """
        var_name = ctx.ID().getText()
        var_type_str = self.semantic.get_type_annotation(ctx.typeAnnotation())
        
        # Avaliar inicialização se presente
        value = None
        if ctx.expression():
            value = self.visit(ctx.expression())
        
        # Declarar variável
        self.declare_variable(var_name, var_type_str, value)
        
        return None
    
    def visitConstDecl(self, ctx: TypeScriptSimplificadoParser.ConstDeclContext):
        """
        Visita declaração de constante com const.
        """
        const_name = ctx.ID().getText()
        const_type_str = self.semantic.get_type_annotation(ctx.typeAnnotation())
        
        # Avaliar inicialização (const sempre tem)
        value = self.visit(ctx.expression())
        
        # Declarar constante (mesmo tratamento que let no IR)
        self.declare_variable(const_name, const_type_str, value)
        
        return None
    
    def visitAssignmentStmt(self, ctx: TypeScriptSimplificadoParser.AssignmentStmtContext):
        """
        Visita atribuição.
        """
        lvalue = ctx.lvalue()
        expr_value = self.visit(ctx.expression())
        
        if isinstance(lvalue, TypeScriptSimplificadoParser.IdLvalueContext):
            # Atribuição simples a variável
            var_name = lvalue.ID().getText()
            var_ptr = self.lookup_variable(var_name)
            if var_ptr:
                self.builder.store(expr_value, var_ptr)
        
        elif isinstance(lvalue, TypeScriptSimplificadoParser.ArrayAccessLvalueContext):
            # Atribuição a elemento de array
            var_name = lvalue.ID().getText()
            array_ptr = self.lookup_variable(var_name)
            
            if array_ptr:
                # Carregar estrutura do array
                array_val = self.builder.load(array_ptr)
                
                # Extrair ponteiro de dados (segundo elemento)
                data_ptr = self.builder.extract_value(array_val, 1)
                
                # Calcular índice
                index = self.visit(lvalue.expression())
                
                # Converter índice para i64 se necessário
                if index.type == self.double:
                    index = self.builder.fptosi(index, self.i64)
                elif index.type == self.i32:
                    index = self.builder.sext(index, self.i64)
                
                # Obter ponteiro para elemento
                element_ptr = self.builder.gep(data_ptr, [index])
                
                # Armazenar valor
                self.builder.store(expr_value, element_ptr)
        
        return None
    
    def visitIfStatement(self, ctx: TypeScriptSimplificadoParser.IfStatementContext):
        """
        Visita statement if/else.
        """
        # Avaliar condição
        condition = self.visit(ctx.expression())
        
        # Criar blocos
        then_block = self.current_function.append_basic_block(self._get_unique_label("if_then"))
        else_block = self.current_function.append_basic_block(self._get_unique_label("if_else"))
        merge_block = self.current_function.append_basic_block(self._get_unique_label("if_merge"))
        
        # Branch condicional
        self.builder.cbranch(condition, then_block, else_block)
        
        # Bloco then
        self.builder.position_at_end(then_block)
        self.current_block = then_block
        self.visit(ctx.statement(0))
        if not self.builder.block.is_terminated:
            self.builder.branch(merge_block)
        
        # Bloco else
        self.builder.position_at_end(else_block)
        self.current_block = else_block
        if len(ctx.statement()) > 1:
            self.visit(ctx.statement(1))
        if not self.builder.block.is_terminated:
            self.builder.branch(merge_block)
        
        # Bloco merge
        self.builder.position_at_end(merge_block)
        self.current_block = merge_block
        
        return None
    
    def visitWhileStatement(self, ctx: TypeScriptSimplificadoParser.WhileStatementContext):
        """
        Visita statement while.
        """
        # Criar blocos
        cond_block = self.current_function.append_basic_block(self._get_unique_label("while_cond"))
        body_block = self.current_function.append_basic_block(self._get_unique_label("while_body"))
        end_block = self.current_function.append_basic_block(self._get_unique_label("while_end"))
        
        # Branch para condição
        self.builder.branch(cond_block)
        
        # Bloco de condição
        self.builder.position_at_end(cond_block)
        self.current_block = cond_block
        condition = self.visit(ctx.expression())
        self.builder.cbranch(condition, body_block, end_block)
        
        # Bloco do corpo
        self.builder.position_at_end(body_block)
        self.current_block = body_block
        self.visit(ctx.statement())
        if not self.builder.block.is_terminated:
            self.builder.branch(cond_block)
        
        # Bloco final
        self.builder.position_at_end(end_block)
        self.current_block = end_block
        
        return None
    
    def visitForStatement(self, ctx: TypeScriptSimplificadoParser.ForStatementContext):
        """
        Visita statement for.
        """
        # Criar novo escopo para o for
        self.push_scope()
        
        # Inicialização
        if ctx.forInit():
            self.visit(ctx.forInit())
        
        # Criar blocos
        cond_block = self.current_function.append_basic_block(self._get_unique_label("for_cond"))
        body_block = self.current_function.append_basic_block(self._get_unique_label("for_body"))
        update_block = self.current_function.append_basic_block(self._get_unique_label("for_update"))
        end_block = self.current_function.append_basic_block(self._get_unique_label("for_end"))
        
        # Branch para condição
        self.builder.branch(cond_block)
        
        # Bloco de condição
        self.builder.position_at_end(cond_block)
        self.current_block = cond_block
        if ctx.expression():
            condition = self.visit(ctx.expression())
        else:
            condition = ir.Constant(self.i1, 1)  # true
        self.builder.cbranch(condition, body_block, end_block)
        
        # Bloco do corpo
        self.builder.position_at_end(body_block)
        self.current_block = body_block
        self.visit(ctx.statement())
        if not self.builder.block.is_terminated:
            self.builder.branch(update_block)
        
        # Bloco de atualização
        self.builder.position_at_end(update_block)
        self.current_block = update_block
        if ctx.forUpdate():
            self.visit(ctx.forUpdate())
        self.builder.branch(cond_block)
        
        # Bloco final
        self.builder.position_at_end(end_block)
        self.current_block = end_block
        
        # Sair do escopo
        self.pop_scope()
        
        return None
    
    def visitReturnStatement(self, ctx: TypeScriptSimplificadoParser.ReturnStatementContext):
        """
        Visita statement return.
        """
        if ctx.expression():
            value = self.visit(ctx.expression())
            self.builder.ret(value)
        else:
            self.builder.ret_void()
        
        return None
    
    def visitConsoleLogStmt(self, ctx: TypeScriptSimplificadoParser.ConsoleLogStmtContext):
        """
        Visita console.log().
        """
        expr_list = ctx.expressionList()
        
        if expr_list:
            for expr in expr_list.expression():
                value = self.visit(expr)
                
                # Determinar tipo e formatar saída
                if value.type == self.double:
                    # number
                    fmt_ptr = self.builder.gep(self.fmt_number, 
                                              [ir.Constant(self.i32, 0), ir.Constant(self.i32, 0)])
                    self.builder.call(self.printf, [fmt_ptr, value])
                
                elif value.type == self.i8_ptr:
                    # string
                    fmt_ptr = self.builder.gep(self.fmt_string,
                                              [ir.Constant(self.i32, 0), ir.Constant(self.i32, 0)])
                    self.builder.call(self.printf, [fmt_ptr, value])
                
                elif value.type == self.i1:
                    # boolean
                    true_ptr = self.builder.gep(self.str_true,
                                               [ir.Constant(self.i32, 0), ir.Constant(self.i32, 0)])
                    false_ptr = self.builder.gep(self.str_false,
                                                [ir.Constant(self.i32, 0), ir.Constant(self.i32, 0)])
                    str_ptr = self.builder.select(value, true_ptr, false_ptr)
                    fmt_ptr = self.builder.gep(self.fmt_bool,
                                              [ir.Constant(self.i32, 0), ir.Constant(self.i32, 0)])
                    self.builder.call(self.printf, [fmt_ptr, str_ptr])
        
        return None
    
    # ========================================================================
    # VISITOR - Expressões - Literais
    # ========================================================================
    
    def visitNumberLiteral(self, ctx: TypeScriptSimplificadoParser.NumberLiteralContext):
        """
        Visita literal numérico.
        """
        text = ctx.NUMBER_LITERAL().getText()
        value = float(text)
        return ir.Constant(self.double, value)
    
    def visitStringLiteral(self, ctx: TypeScriptSimplificadoParser.StringLiteralContext):
        """
        Visita literal de string.
        """
        text = ctx.STRING_LITERAL().getText()
        return self._string_literal_to_ptr(text)
    
    def visitTrueLiteral(self, ctx: TypeScriptSimplificadoParser.TrueLiteralContext):
        """
        Visita literal true.
        """
        return ir.Constant(self.i1, 1)
    
    def visitFalseLiteral(self, ctx: TypeScriptSimplificadoParser.FalseLiteralContext):
        """
        Visita literal false.
        """
        return ir.Constant(self.i1, 0)
    
    def visitArrayLitExpr(self, ctx: TypeScriptSimplificadoParser.ArrayLitExprContext):
        """
        Visita literal de array.
        """
        expr_list = ctx.arrayLiteral().expressionList()
        
        if expr_list:
            expressions = expr_list.expression()
            num_elements = len(expressions)
            
            # Avaliar primeiro elemento para determinar tipo
            if num_elements > 0:
                first_val = self.visit(expressions[0])
                element_type = first_val.type
                
                # Alocar memória para o array
                size = ir.Constant(self.i64, num_elements)
                element_size = ir.Constant(self.i64, element_type.width // 8 if hasattr(element_type, 'width') else 8)
                total_size = self.builder.mul(size, element_size)
                data_ptr_i8 = self.builder.call(self.malloc, [total_size])
                data_ptr = self.builder.bitcast(data_ptr_i8, element_type.as_pointer())
                
                # Armazenar elementos
                for i, expr in enumerate(expressions):
                    value = self.visit(expr)
                    idx = ir.Constant(self.i64, i)
                    elem_ptr = self.builder.gep(data_ptr, [idx])
                    self.builder.store(value, elem_ptr)
                
                # Criar estrutura do array: {length, data_ptr}
                array_struct = ir.Constant(ir.LiteralStructType([self.i64, data_ptr.type]), ir.Undefined)
                array_struct = self.builder.insert_value(array_struct, size, 0)
                array_struct = self.builder.insert_value(array_struct, data_ptr, 1)
                
                return array_struct
        
        # Array vazio
        if ctx.getText().startswith('['):
            # Criar array vazio de numbers por padrão
            zero = ir.Constant(self.i64, 0)
            null_ptr = ir.Constant(self.double.as_pointer(), None)
            array_struct = ir.Constant(ir.LiteralStructType([self.i64, self.double.as_pointer()]), ir.Undefined)
            array_struct = self.builder.insert_value(array_struct, zero, 0)
            array_struct = self.builder.insert_value(array_struct, null_ptr, 1)
            return array_struct
    
    # ========================================================================
    # VISITOR - Expressões - Identificadores e Acesso
    # ========================================================================
    
    def visitIdExpr(self, ctx: TypeScriptSimplificadoParser.IdExprContext):
        """
        Visita identificador em expressão.
        """
        var_name = ctx.ID().getText()
        var_ptr = self.lookup_variable(var_name)
        
        if var_ptr:
            # Se for função, retornar a função
            if isinstance(var_ptr, ir.Function):
                return var_ptr
            # Caso contrário, carregar valor
            return self.builder.load(var_ptr)
        
        return None
    
    def visitArrayAccessExpr(self, ctx: TypeScriptSimplificadoParser.ArrayAccessExprContext):
        """
        Visita acesso a elemento de array.
        """
        var_name = ctx.ID().getText()
        array_ptr = self.lookup_variable(var_name)
        
        if array_ptr:
            # Carregar estrutura do array
            array_val = self.builder.load(array_ptr)
            
            # Extrair ponteiro de dados
            data_ptr = self.builder.extract_value(array_val, 1)
            
            # Calcular índice
            index = self.visit(ctx.expression())
            
            # Converter índice para i64
            if index.type == self.double:
                index = self.builder.fptosi(index, self.i64)
            elif index.type == self.i32:
                index = self.builder.sext(index, self.i64)
            
            # Obter ponteiro para elemento
            element_ptr = self.builder.gep(data_ptr, [index])
            
            # Carregar elemento
            return self.builder.load(element_ptr)
        
        return None
    
    def visitLengthExpr(self, ctx: TypeScriptSimplificadoParser.LengthExprContext):
        """
        Visita acesso à propriedade .length.
        """
        var_name = ctx.ID().getText()
        array_ptr = self.lookup_variable(var_name)
        
        if array_ptr:
            # Carregar estrutura do array
            array_val = self.builder.load(array_ptr)
            
            # Extrair length (primeiro elemento)
            length = self.builder.extract_value(array_val, 0)
            
            # Converter para double
            return self.builder.sitofp(length, self.double)
        
        return None
    
    # ========================================================================
    # VISITOR - Expressões - Chamadas de Função
    # ========================================================================
    
    def visitFuncCallExpr(self, ctx: TypeScriptSimplificadoParser.FuncCallExprContext):
        """
        Visita chamada de função definida pelo usuário.
        """
        func_name = ctx.functionCall().ID().getText()
        func = self.lookup_variable(func_name)
        
        if func:
            # Avaliar argumentos
            args = []
            arg_list = ctx.functionCall().argumentList()
            if arg_list:
                for expr in arg_list.expression():
                    args.append(self.visit(expr))
            
            # Chamar função
            return self.builder.call(func, args)
        
        return None
    
    def visitMathSqrtCall(self, ctx: TypeScriptSimplificadoParser.MathSqrtCallContext):
        """
        Visita Math.sqrt().
        """
        arg = self.visit(ctx.expression())
        return self.builder.call(self.sqrt_func, [arg])
    
    def visitMathPowCall(self, ctx: TypeScriptSimplificadoParser.MathPowCallContext):
        """
        Visita Math.pow().
        """
        base = self.visit(ctx.expression(0))
        exponent = self.visit(ctx.expression(1))
        return self.builder.call(self.pow_func, [base, exponent])
    
    def visitParseIntCall(self, ctx: TypeScriptSimplificadoParser.ParseIntCallContext):
        """
        Visita parseInt().
        """
        arg = self.visit(ctx.expression())
        # parseInt retorna int, mas precisamos converter para double
        int_val = self.builder.call(self.atoi, [arg])
        return self.builder.sitofp(int_val, self.double)
    
    def visitParseFloatCall(self, ctx: TypeScriptSimplificadoParser.ParseFloatCallContext):
        """
        Visita parseFloat().
        """
        arg = self.visit(ctx.expression())
        return self.builder.call(self.atof, [arg])
    
    # ========================================================================
    # VISITOR - Expressões - Operadores Aritméticos
    # ========================================================================
    
    def visitAddExpr(self, ctx: TypeScriptSimplificadoParser.AddExprContext):
        """Visita operador +"""
        left = self.visit(ctx.additiveExpr())
        right = self.visit(ctx.multiplicativeExpr())
        return self.builder.fadd(left, right)
    
    def visitSubExpr(self, ctx: TypeScriptSimplificadoParser.SubExprContext):
        """Visita operador -"""
        left = self.visit(ctx.additiveExpr())
        right = self.visit(ctx.multiplicativeExpr())
        return self.builder.fsub(left, right)
    
    def visitMulExpr(self, ctx: TypeScriptSimplificadoParser.MulExprContext):
        """Visita operador *"""
        left = self.visit(ctx.multiplicativeExpr())
        right = self.visit(ctx.powerExpr())
        return self.builder.fmul(left, right)
    
    def visitDivExpr(self, ctx: TypeScriptSimplificadoParser.DivExprContext):
        """Visita operador /"""
        left = self.visit(ctx.multiplicativeExpr())
        right = self.visit(ctx.powerExpr())
        return self.builder.fdiv(left, right)
    
    def visitModExpr(self, ctx: TypeScriptSimplificadoParser.ModExprContext):
        """Visita operador %"""
        left = self.visit(ctx.multiplicativeExpr())
        right = self.visit(ctx.powerExpr())
        return self.builder.frem(left, right)
    
    def visitPowExpr(self, ctx: TypeScriptSimplificadoParser.PowExprContext):
        """Visita operador **"""
        left = self.visit(ctx.unaryExpr())
        right = self.visit(ctx.powerExpr())
        return self.builder.call(self.pow_func, [left, right])
    
    def visitNegExpr(self, ctx: TypeScriptSimplificadoParser.NegExprContext):
        """Visita operador unário -"""
        operand = self.visit(ctx.unaryExpr())
        zero = ir.Constant(self.double, 0.0)
        return self.builder.fsub(zero, operand)
    
    # ========================================================================
    # VISITOR - Expressões - Operadores Lógicos
    # ========================================================================
    
    def visitAndExpr(self, ctx: TypeScriptSimplificadoParser.AndExprContext):
        """Visita operador &&"""
        left = self.visit(ctx.logicalAndExpr())
        right = self.visit(ctx.equalityExpr())
        return self.builder.and_(left, right)
    
    def visitOrExpr(self, ctx: TypeScriptSimplificadoParser.OrExprContext):
        """Visita operador ||"""
        left = self.visit(ctx.logicalOrExpr())
        right = self.visit(ctx.logicalAndExpr())
        return self.builder.or_(left, right)
    
    def visitNotExpr(self, ctx: TypeScriptSimplificadoParser.NotExprContext):
        """Visita operador !"""
        operand = self.visit(ctx.unaryExpr())
        return self.builder.not_(operand)
    
    # ========================================================================
    # VISITOR - Expressões - Operadores de Comparação
    # ========================================================================
    
    def visitEqExpr(self, ctx: TypeScriptSimplificadoParser.EqExprContext):
        """Visita operador =="""
        left = self.visit(ctx.equalityExpr())
        right = self.visit(ctx.relationalExpr())
        
        if left.type == self.double:
            return self.builder.fcmp_ordered('==', left, right)
        elif left.type == self.i1:
            return self.builder.icmp_signed('==', left, right)
        else:
            # string comparison (não implementado completamente)
            return self.builder.icmp_signed('==', left, right)
    
    def visitNeqExpr(self, ctx: TypeScriptSimplificadoParser.NeqExprContext):
        """Visita operador !="""
        left = self.visit(ctx.equalityExpr())
        right = self.visit(ctx.relationalExpr())
        
        if left.type == self.double:
            return self.builder.fcmp_ordered('!=', left, right)
        elif left.type == self.i1:
            return self.builder.icmp_signed('!=', left, right)
        else:
            return self.builder.icmp_signed('!=', left, right)
    
    def visitGtExpr(self, ctx: TypeScriptSimplificadoParser.GtExprContext):
        """Visita operador >"""
        left = self.visit(ctx.relationalExpr())
        right = self.visit(ctx.additiveExpr())
        return self.builder.fcmp_ordered('>', left, right)
    
    def visitLtExpr(self, ctx: TypeScriptSimplificadoParser.LtExprContext):
        """Visita operador <"""
        left = self.visit(ctx.relationalExpr())
        right = self.visit(ctx.additiveExpr())
        return self.builder.fcmp_ordered('<', left, right)
    
    def visitGeExpr(self, ctx: TypeScriptSimplificadoParser.GeExprContext):
        """Visita operador >="""
        left = self.visit(ctx.relationalExpr())
        right = self.visit(ctx.additiveExpr())
        return self.builder.fcmp_ordered('>=', left, right)
    
    def visitLeExpr(self, ctx: TypeScriptSimplificadoParser.LeExprContext):
        """Visita operador <="""
        left = self.visit(ctx.relationalExpr())
        right = self.visit(ctx.additiveExpr())
        return self.builder.fcmp_ordered('<=', left, right)
    
    # ========================================================================
    # VISITOR - Pass-through
    # ========================================================================
    
    def visitParenExpr(self, ctx: TypeScriptSimplificadoParser.ParenExprContext):
        """Visita expressão entre parênteses"""
        return self.visit(ctx.expression())
    
    def visitExpression(self, ctx: TypeScriptSimplificadoParser.ExpressionContext):
        """Pass-through"""
        return self.visit(ctx.logicalOrExpr())
    
    def visitOrPass(self, ctx: TypeScriptSimplificadoParser.OrPassContext):
        """Pass-through"""
        return self.visit(ctx.logicalAndExpr())
    
    def visitAndPass(self, ctx: TypeScriptSimplificadoParser.AndPassContext):
        """Pass-through"""
        return self.visit(ctx.equalityExpr())
    
    def visitEqPass(self, ctx: TypeScriptSimplificadoParser.EqPassContext):
        """Pass-through"""
        return self.visit(ctx.relationalExpr())
    
    def visitRelPass(self, ctx: TypeScriptSimplificadoParser.RelPassContext):
        """Pass-through"""
        return self.visit(ctx.additiveExpr())
    
    def visitAddPass(self, ctx: TypeScriptSimplificadoParser.AddPassContext):
        """Pass-through"""
        return self.visit(ctx.multiplicativeExpr())
    
    def visitMulPass(self, ctx: TypeScriptSimplificadoParser.MulPassContext):
        """Pass-through"""
        return self.visit(ctx.powerExpr())
    
    def visitPowPass(self, ctx: TypeScriptSimplificadoParser.PowPassContext):
        """Pass-through"""
        return self.visit(ctx.unaryExpr())
    
    def visitUnaryPass(self, ctx: TypeScriptSimplificadoParser.UnaryPassContext):
        """Pass-through"""
        return self.visit(ctx.primaryExpr())
    
    def visitLiteralExpr(self, ctx: TypeScriptSimplificadoParser.LiteralExprContext):
        """Pass-through"""
        return self.visit(ctx.literal())
    
    # ========================================================================
    # MÉTODOS PÚBLICOS
    # ========================================================================
    
    def get_ir(self) -> str:
        """
        Retorna o código LLVM IR como string.
        """
        return str(self.module)
    
    def save_ir(self, filename: str):
        """
        Salva o código LLVM IR em um arquivo.
        """
        with open(filename, 'w') as f:
            f.write(self.get_ir())
    
    def compile_to_binary(self, ir_file: str, output_file: str = "output") -> str:
        """
        Compila o IR para binário executável usando clang.
        
        Args:
            ir_file: Caminho do arquivo .ll
            output_file: Nome do executável de saída
            
        Returns:
            Nome do arquivo executável gerado
        """
        try:
            # Compilar com clang
            subprocess.run(
                ["clang", ir_file, "-o", output_file, "-lm"],
                check=True,
                capture_output=True,
                text=True
            )
            return output_file
        except subprocess.CalledProcessError as e:
            print(f"Erro ao compilar: {e.stderr}", file=sys.stderr)
            raise
        except FileNotFoundError:
            print("clang não encontrado. Instale o LLVM/Clang.", file=sys.stderr)
            raise
