#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Analisador Semântico para TypeScript Simplificado
Implementado usando o padrão Visitor do ANTLR4

Este módulo implementa as verificações semânticas necessárias:
- Verificação de tipos
- Gerenciamento de escopos (global e de bloco)
- Uso de variáveis antes de atribuição
- Imutabilidade de const
- Declarações duplicadas
- Verificação de retorno de funções
- Compatibilidade de tipos em operações
"""

import sys
from gen.TypeScriptSimplificadoParser import TypeScriptSimplificadoParser
from gen.TypeScriptSimplificadoListener import TypeScriptSimplificadoListener
from antlr4 import *


class SemanticError(Exception):
    """
    Exceção personalizada para erros semânticos
    """
    def __init__(self, message, line, column=0):
        self.message = message
        self.line = line
        self.column = column
        super().__init__(self.message)
    
    def __str__(self):
        return f"Erro semântico na linha {self.line}: {self.message}"


class Symbol:
    """
    Representa um símbolo na tabela de símbolos
    
    Atributos:
        name: Nome do identificador
        symbol_type: Tipo do símbolo ('number', 'string', 'boolean', 'number[]', 'string[]', 'void', 'function')
        is_const: Se é uma constante (const) ou variável (let)
        is_initialized: Se já foi atribuído um valor
        is_function: Se é uma função
        return_type: Tipo de retorno (apenas para funções)
        params: Lista de parâmetros (apenas para funções)
        line: Linha onde foi declarado
    """
    def __init__(self, name, symbol_type, is_const=False, is_initialized=False, 
                 is_function=False, return_type=None, params=None, line=0):
        self.name = name
        self.symbol_type = symbol_type
        self.is_const = is_const
        self.is_initialized = is_initialized
        self.is_function = is_function
        self.return_type = return_type
        self.params = params if params else []
        self.line = line
    
    def __repr__(self):
        if self.is_function:
            params_str = ", ".join([f"{p['name']}: {p['type']}" for p in self.params])
            return f"Function {self.name}({params_str}): {self.return_type}"
        const_str = "const" if self.is_const else "let"
        init_str = "initialized" if self.is_initialized else "uninitialized"
        return f"{const_str} {self.name}: {self.symbol_type} ({init_str})"


class SymbolTable:
    """
    Tabela de símbolos hierárquica para gerenciamento de escopos
    
    Esta estrutura mantém um dicionário de símbolos para cada escopo,
    com referência ao escopo pai para busca hierárquica.
    
    Estrutura:
        symbols: dict - Dicionário {nome: Symbol} dos símbolos no escopo atual
        parent: SymbolTable - Referência ao escopo pai (None para escopo global)
        scope_name: str - Nome do escopo (para debug)
    """
    def __init__(self, parent=None, scope_name="global"):
        self.symbols = {}  # Dicionário de símbolos locais
        self.parent = parent  # Referência ao escopo pai
        self.scope_name = scope_name
    
    def declare(self, symbol):
        """
        Declara um novo símbolo no escopo atual
        
        Args:
            symbol: Objeto Symbol a ser declarado
        
        Raises:
            SemanticError: Se o símbolo já existe no escopo atual
        """
        if symbol.name in self.symbols:
            existing = self.symbols[symbol.name]
            raise SemanticError(
                f"Identificador '{symbol.name}' já foi declarado na linha {existing.line}",
                symbol.line
            )
        self.symbols[symbol.name] = symbol
    
    def lookup(self, name, current_scope_only=False):
        """
        Busca um símbolo na tabela (no escopo atual ou nos pais)
        
        Args:
            name: Nome do símbolo a buscar
            current_scope_only: Se True, busca apenas no escopo atual
        
        Returns:
            Symbol ou None se não encontrado
        """
        if name in self.symbols:
            return self.symbols[name]
        
        # Se não achou no escopo atual, procura no pai (se houver)
        if not current_scope_only and self.parent:
            return self.parent.lookup(name)
        
        return None
    
    def update_initialization(self, name, line):
        """
        Marca uma variável como inicializada
        
        Args:
            name: Nome da variável
            line: Linha onde ocorreu a atribuição
        
        Raises:
            SemanticError: Se a variável não existe ou é constante sendo reatribuída
        """
        symbol = self.lookup(name)
        if not symbol:
            raise SemanticError(f"Variável '{name}' não foi declarada", line)
        
        # Verifica se está tentando reatribuir uma constante
        if symbol.is_const and symbol.is_initialized:
            raise SemanticError(
                f"Não é possível reatribuir a constante '{name}' (declarada na linha {symbol.line})",
                line
            )
        
        symbol.is_initialized = True
    
    def __repr__(self):
        result = f"\n=== Escopo: {self.scope_name} ===\n"
        for name, symbol in self.symbols.items():
            result += f"  {symbol}\n"
        return result


class SemanticAnalyzer(TypeScriptSimplificadoListener):
    """
    Analisador Semântico usando padrão Listener do ANTLR4
    
    Realiza verificações semânticas durante a travessia da AST:
    - Declaração e uso de variáveis
    - Verificação de tipos
    - Gerenciamento de escopos
    - Regras de const/let
    - Verificação de retorno de funções
    """
    
    def __init__(self):
        self.symbol_table = SymbolTable(scope_name="global")
        self.current_function = None  # Função sendo analisada
        self.errors = []
        self.debug = False  # Ativa mensagens de debug
    
    def add_error(self, message, ctx):
        """
        Adiciona um erro semântico à lista
        """
        line = ctx.start.line if ctx else 0
        error = SemanticError(message, line)
        self.errors.append(error)
        if self.debug:
            print(f"[DEBUG] {error}", file=sys.stderr)
    
    def enter_scope(self, scope_name="block"):
        """
        Entra em um novo escopo (cria um novo nível na tabela de símbolos)
        """
        if self.debug:
            print(f"[DEBUG] Entrando no escopo: {scope_name}")
        self.symbol_table = SymbolTable(parent=self.symbol_table, scope_name=scope_name)
    
    def exit_scope(self):
        """
        Sai do escopo atual (volta para o escopo pai)
        """
        if self.debug:
            print(f"[DEBUG] Saindo do escopo: {self.symbol_table.scope_name}")
            print(self.symbol_table)
        
        if self.symbol_table.parent:
            self.symbol_table = self.symbol_table.parent
    
    def get_type(self, ctx):
        """
        Obtém o tipo de uma expressão ou declaração
        
        Returns:
            String com o tipo ('number', 'string', 'boolean', 'number[]', 'string[]', 'void')
        """
        if ctx is None:
            return "void"
        
        # Tipos literais
        if isinstance(ctx, TypeScriptSimplificadoParser.NumberLiteralContext):
            return "number"
        elif isinstance(ctx, TypeScriptSimplificadoParser.StringLiteralContext):
            return "string"
        elif isinstance(ctx, TypeScriptSimplificadoParser.TrueLiteralContext) or \
             isinstance(ctx, TypeScriptSimplificadoParser.FalseLiteralContext):
            return "boolean"
        
        # Array literal
        elif isinstance(ctx, TypeScriptSimplificadoParser.ArrayLitExprContext):
            # Inferir tipo baseado nos elementos (simplificado)
            expr_list = ctx.arrayLiteral().expressionList()
            if expr_list and expr_list.expression():
                first_type = self.get_type(expr_list.expression(0))
                if first_type in ["number", "string"]:
                    return f"{first_type}[]"
            return "number[]"  # Default
        
        # Identificador (variável)
        elif isinstance(ctx, TypeScriptSimplificadoParser.IdExprContext):
            var_name = ctx.ID().getText()
            symbol = self.symbol_table.lookup(var_name)
            if symbol:
                return symbol.symbol_type
            return "unknown"
        
        # Acesso a array
        elif isinstance(ctx, TypeScriptSimplificadoParser.ArrayAccessExprContext):
            array_type = self.get_type(ctx.getChild(0))
            if array_type.endswith("[]"):
                return array_type[:-2]  # Remove '[]'
            return "unknown"
        
        # Propriedade .length
        elif isinstance(ctx, TypeScriptSimplificadoParser.LengthExprContext):
            return "number"
        
        # Operações aritméticas
        elif isinstance(ctx, (TypeScriptSimplificadoParser.AddExprContext,
                            TypeScriptSimplificadoParser.SubExprContext,
                            TypeScriptSimplificadoParser.MulExprContext,
                            TypeScriptSimplificadoParser.DivExprContext,
                            TypeScriptSimplificadoParser.ModExprContext,
                            TypeScriptSimplificadoParser.PowExprContext,
                            TypeScriptSimplificadoParser.NegExprContext)):
            return "number"
        
        # Operações de comparação e lógicas
        elif isinstance(ctx, (TypeScriptSimplificadoParser.EqExprContext,
                            TypeScriptSimplificadoParser.NeqExprContext,
                            TypeScriptSimplificadoParser.GtExprContext,
                            TypeScriptSimplificadoParser.LtExprContext,
                            TypeScriptSimplificadoParser.GeExprContext,
                            TypeScriptSimplificadoParser.LeExprContext,
                            TypeScriptSimplificadoParser.AndExprContext,
                            TypeScriptSimplificadoParser.OrExprContext,
                            TypeScriptSimplificadoParser.NotExprContext)):
            return "boolean"
        
        # Chamadas de função
        elif isinstance(ctx, TypeScriptSimplificadoParser.FuncCallExprContext):
            func_name = ctx.functionCall().ID().getText()
            symbol = self.symbol_table.lookup(func_name)
            if symbol and symbol.is_function:
                return symbol.return_type
            return "unknown"
        
        # Funções Math
        elif isinstance(ctx, TypeScriptSimplificadoParser.MathFuncCallExprContext):
            return "number"
        
        # Funções de conversão
        elif isinstance(ctx, TypeScriptSimplificadoParser.ConvFuncCallExprContext):
            return "number"
        
        # Expressão entre parênteses
        elif isinstance(ctx, TypeScriptSimplificadoParser.ParenExprContext):
            return self.get_type(ctx.expression())
        
        # Passar por contextos intermediários
        elif hasattr(ctx, 'expression') and callable(ctx.expression):
            return self.get_type(ctx.expression())
        
        return "unknown"
    
    def type_compatible(self, type1, type2):
        """
        Verifica se dois tipos são compatíveis
        """
        if type1 == "unknown" or type2 == "unknown":
            return True  # Não verifica tipos desconhecidos
        return type1 == type2
    
    # ========================================================================
    # LISTENERS - Declarações de Funções
    # ========================================================================
    
    def enterFunctionDecl(self, ctx: TypeScriptSimplificadoParser.FunctionDeclContext):
        """
        Entrada em declaração de função
        """
        func_name = ctx.ID().getText()
        line = ctx.start.line
        
        # Determina o tipo de retorno
        return_type_ctx = ctx.returnType()
        if return_type_ctx.VOID():
            return_type = "void"
        else:
            return_type = self.get_type_annotation(return_type_ctx.typeAnnotation())
        
        # Coleta os parâmetros
        params = []
        if ctx.paramList():
            for param_ctx in ctx.paramList().param():
                param_name = param_ctx.ID().getText()
                param_type = self.get_type_annotation(param_ctx.typeAnnotation())
                params.append({"name": param_name, "type": param_type})
        
        # Declara a função no escopo global
        symbol = Symbol(
            name=func_name,
            symbol_type="function",
            is_function=True,
            return_type=return_type,
            params=params,
            line=line
        )
        
        try:
            self.symbol_table.declare(symbol)
        except SemanticError as e:
            self.add_error(str(e), ctx)
        
        # Entra no escopo da função
        self.enter_scope(f"function_{func_name}")
        self.current_function = symbol
        
        # Declara os parâmetros no escopo da função
        for param in params:
            param_symbol = Symbol(
                name=param["name"],
                symbol_type=param["type"],
                is_initialized=True,  # Parâmetros já vêm inicializados
                line=line
            )
            try:
                self.symbol_table.declare(param_symbol)
            except SemanticError as e:
                self.add_error(str(e), ctx)
    
    def exitFunctionDecl(self, ctx: TypeScriptSimplificadoParser.FunctionDeclContext):
        """
        Saída de declaração de função
        """
        # TODO: Verificar se função com retorno tem return em todos os caminhos
        self.exit_scope()
        self.current_function = None
    
    def get_type_annotation(self, ctx):
        """
        Extrai o tipo de uma anotação de tipo
        """
        if isinstance(ctx, TypeScriptSimplificadoParser.NumberTypeContext):
            return "number"
        elif isinstance(ctx, TypeScriptSimplificadoParser.StringTypeContext):
            return "string"
        elif isinstance(ctx, TypeScriptSimplificadoParser.BooleanTypeContext):
            return "boolean"
        elif isinstance(ctx, TypeScriptSimplificadoParser.NumberArrayTypeContext):
            return "number[]"
        elif isinstance(ctx, TypeScriptSimplificadoParser.StringArrayTypeContext):
            return "string[]"
        return "unknown"
    
    # ========================================================================
    # LISTENERS - Declarações de Variáveis
    # ========================================================================
    
    def enterLetDecl(self, ctx: TypeScriptSimplificadoParser.LetDeclContext):
        """
        Declaração de variável com let
        """
        var_name = ctx.ID().getText()
        var_type = self.get_type_annotation(ctx.typeAnnotation())
        line = ctx.start.line
        
        # Verifica se tem inicialização
        has_init = ctx.expression() is not None
        
        # Verifica tipo da inicialização se presente
        if has_init:
            init_type = self.get_type(ctx.expression())
            if not self.type_compatible(var_type, init_type):
                self.add_error(
                    f"Tipo incompatível na inicialização de '{var_name}': "
                    f"esperado '{var_type}', mas recebeu '{init_type}'",
                    ctx
                )
        
        # Declara a variável
        symbol = Symbol(
            name=var_name,
            symbol_type=var_type,
            is_const=False,
            is_initialized=has_init,
            line=line
        )
        
        try:
            self.symbol_table.declare(symbol)
        except SemanticError as e:
            self.add_error(str(e), ctx)
    
    def enterConstDecl(self, ctx: TypeScriptSimplificadoParser.ConstDeclContext):
        """
        Declaração de constante com const
        """
        const_name = ctx.ID().getText()
        const_type = self.get_type_annotation(ctx.typeAnnotation())
        line = ctx.start.line
        
        # const DEVE ter inicialização
        if ctx.expression() is None:
            self.add_error(f"Constante '{const_name}' deve ser inicializada", ctx)
            return
        
        # Verifica tipo da inicialização
        init_type = self.get_type(ctx.expression())
        if not self.type_compatible(const_type, init_type):
            self.add_error(
                f"Tipo incompatível na inicialização de '{const_name}': "
                f"esperado '{const_type}', mas recebeu '{init_type}'",
                ctx
            )
        
        # Declara a constante
        symbol = Symbol(
            name=const_name,
            symbol_type=const_type,
            is_const=True,
            is_initialized=True,
            line=line
        )
        
        try:
            self.symbol_table.declare(symbol)
        except SemanticError as e:
            self.add_error(str(e), ctx)
    
    # ========================================================================
    # LISTENERS - Atribuições
    # ========================================================================
    
    def enterAssignmentStmt(self, ctx: TypeScriptSimplificadoParser.AssignmentStmtContext):
        """
        Atribuição de valor a variável
        """
        lvalue = ctx.lvalue()
        line = ctx.start.line
        
        # Pega o nome da variável (simplificado - apenas IDs simples por ora)
        if isinstance(lvalue, TypeScriptSimplificadoParser.IdLvalueContext):
            var_name = lvalue.ID().getText()
            
            # Verifica se a variável existe
            symbol = self.symbol_table.lookup(var_name)
            if not symbol:
                self.add_error(f"Variável '{var_name}' não foi declarada", ctx)
                return
            
            # Verifica tipo da expressão
            expr_type = self.get_type(ctx.expression())
            if not self.type_compatible(symbol.symbol_type, expr_type):
                self.add_error(
                    f"Tipo incompatível na atribuição a '{var_name}': "
                    f"esperado '{symbol.symbol_type}', mas recebeu '{expr_type}'",
                    ctx
                )
            
            # Marca como inicializada (verifica const)
            try:
                self.symbol_table.update_initialization(var_name, line)
            except SemanticError as e:
                self.add_error(str(e), ctx)
    
    # ========================================================================
    # LISTENERS - Uso de Variáveis
    # ========================================================================
    
    def enterIdExpr(self, ctx: TypeScriptSimplificadoParser.IdExprContext):
        """
        Uso de uma variável/identificador em expressão
        """
        var_name = ctx.ID().getText()
        line = ctx.start.line
        
        # Verifica se a variável foi declarada
        symbol = self.symbol_table.lookup(var_name)
        if not symbol:
            self.add_error(f"Variável '{var_name}' não foi declarada", ctx)
            return
        
        # Verifica se foi inicializada (apenas para variáveis, não funções)
        if not symbol.is_function and not symbol.is_initialized:
            self.add_error(
                f"Variável '{var_name}' está sendo usada antes de ser inicializada "
                f"(declarada na linha {symbol.line})",
                ctx
            )
    
    # ========================================================================
    # LISTENERS - Chamadas de Função
    # ========================================================================
    
    def enterFuncCallExpr(self, ctx: TypeScriptSimplificadoParser.FuncCallExprContext):
        """
        Chamada de função
        """
        func_name = ctx.functionCall().ID().getText()
        line = ctx.start.line
        
        # Verifica se a função foi declarada
        symbol = self.symbol_table.lookup(func_name)
        if not symbol:
            self.add_error(f"Função '{func_name}' não foi declarada", ctx)
            return
        
        if not symbol.is_function:
            self.add_error(f"'{func_name}' não é uma função", ctx)
            return
        
        # Verifica número de argumentos
        arg_list = ctx.functionCall().argumentList()
        num_args = 0
        if arg_list:
            num_args = len(arg_list.expression())
        
        num_params = len(symbol.params)
        if num_args != num_params:
            self.add_error(
                f"Função '{func_name}' espera {num_params} argumento(s), "
                f"mas recebeu {num_args}",
                ctx
            )
            return
        
        # Verifica tipos dos argumentos
        if arg_list:
            for i, arg_expr in enumerate(arg_list.expression()):
                arg_type = self.get_type(arg_expr)
                expected_type = symbol.params[i]["type"]
                if not self.type_compatible(expected_type, arg_type):
                    self.add_error(
                        f"Argumento {i+1} de '{func_name}': "
                        f"esperado '{expected_type}', mas recebeu '{arg_type}'",
                        ctx
                    )
    
    # ========================================================================
    # LISTENERS - Estruturas de Controle (Escopos)
    # ========================================================================
    
    def enterBlock(self, ctx: TypeScriptSimplificadoParser.BlockContext):
        """
        Entrada em bloco de código
        """
        # Apenas cria novo escopo se não for bloco de função (que já criou)
        parent = ctx.parentCtx
        if not isinstance(parent, TypeScriptSimplificadoParser.FunctionDeclContext):
            self.enter_scope("block")
    
    def exitBlock(self, ctx: TypeScriptSimplificadoParser.BlockContext):
        """
        Saída de bloco de código
        """
        parent = ctx.parentCtx
        if not isinstance(parent, TypeScriptSimplificadoParser.FunctionDeclContext):
            self.exit_scope()
    
    def enterIfStatement(self, ctx: TypeScriptSimplificadoParser.IfStatementContext):
        """
        Verifica condição do if
        """
        condition_type = self.get_type(ctx.expression())
        if condition_type != "boolean" and condition_type != "unknown":
            self.add_error(
                f"Condição do 'if' deve ser do tipo 'boolean', mas é '{condition_type}'",
                ctx
            )
    
    def enterWhileStatement(self, ctx: TypeScriptSimplificadoParser.WhileStatementContext):
        """
        Verifica condição do while
        """
        condition_type = self.get_type(ctx.expression())
        if condition_type != "boolean" and condition_type != "unknown":
            self.add_error(
                f"Condição do 'while' deve ser do tipo 'boolean', mas é '{condition_type}'",
                ctx
            )
    
    # ========================================================================
    # LISTENERS - Return
    # ========================================================================
    
    def enterReturnStatement(self, ctx: TypeScriptSimplificadoParser.ReturnStatementContext):
        """
        Verifica statement return
        """
        if not self.current_function:
            self.add_error("'return' fora de uma função", ctx)
            return
        
        # Verifica tipo de retorno
        has_expr = ctx.expression() is not None
        
        if self.current_function.return_type == "void":
            if has_expr:
                self.add_error(
                    f"Função '{self.current_function.name}' é 'void' e não deve retornar valor",
                    ctx
                )
        else:
            if not has_expr:
                self.add_error(
                    f"Função '{self.current_function.name}' deve retornar um valor do tipo "
                    f"'{self.current_function.return_type}'",
                    ctx
                )
            else:
                return_type = self.get_type(ctx.expression())
                if not self.type_compatible(self.current_function.return_type, return_type):
                    self.add_error(
                        f"Tipo de retorno incompatível: esperado '{self.current_function.return_type}', "
                        f"mas recebeu '{return_type}'",
                        ctx
                    )
    
    # ========================================================================
    # VERIFICAÇÃO DE OPERADORES
    # ========================================================================
    
    def enterAddExpr(self, ctx: TypeScriptSimplificadoParser.AddExprContext):
        """Verifica operador +"""
        self.check_binary_numeric_op(ctx, "+")
    
    def enterSubExpr(self, ctx: TypeScriptSimplificadoParser.SubExprContext):
        """Verifica operador -"""
        self.check_binary_numeric_op(ctx, "-")
    
    def enterMulExpr(self, ctx: TypeScriptSimplificadoParser.MulExprContext):
        """Verifica operador *"""
        self.check_binary_numeric_op(ctx, "*")
    
    def enterDivExpr(self, ctx: TypeScriptSimplificadoParser.DivExprContext):
        """Verifica operador /"""
        self.check_binary_numeric_op(ctx, "/")
    
    def enterModExpr(self, ctx: TypeScriptSimplificadoParser.ModExprContext):
        """Verifica operador %"""
        self.check_binary_numeric_op(ctx, "%")
    
    def enterPowExpr(self, ctx: TypeScriptSimplificadoParser.PowExprContext):
        """Verifica operador **"""
        self.check_binary_numeric_op(ctx, "**")
    
    def enterNegExpr(self, ctx: TypeScriptSimplificadoParser.NegExprContext):
        """Verifica operador unário -"""
        operand_type = self.get_type(ctx.unaryExpr())
        if operand_type != "number" and operand_type != "unknown":
            self.add_error(
                f"Operador unário '-' requer operando do tipo 'number', mas recebeu '{operand_type}'",
                ctx
            )
    
    def check_binary_numeric_op(self, ctx, op):
        """
        Verifica operadores binários numéricos
        """
        left_type = self.get_type(ctx.getChild(0))
        right_type = self.get_type(ctx.getChild(2))
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '{op}' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '{op}' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
    
    def enterAndExpr(self, ctx: TypeScriptSimplificadoParser.AndExprContext):
        """Verifica operador &&"""
        self.check_binary_boolean_op(ctx, "&&")
    
    def enterOrExpr(self, ctx: TypeScriptSimplificadoParser.OrExprContext):
        """Verifica operador ||"""
        self.check_binary_boolean_op(ctx, "||")
    
    def enterNotExpr(self, ctx: TypeScriptSimplificadoParser.NotExprContext):
        """Verifica operador !"""
        operand_type = self.get_type(ctx.unaryExpr())
        if operand_type != "boolean" and operand_type != "unknown":
            self.add_error(
                f"Operador '!' requer operando do tipo 'boolean', mas recebeu '{operand_type}'",
                ctx
            )
    
    def check_binary_boolean_op(self, ctx, op):
        """
        Verifica operadores binários booleanos
        """
        left_type = self.get_type(ctx.getChild(0))
        right_type = self.get_type(ctx.getChild(2))
        
        if left_type != "boolean" and left_type != "unknown":
            self.add_error(
                f"Operador '{op}' requer operandos do tipo 'boolean', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "boolean" and right_type != "unknown":
            self.add_error(
                f"Operador '{op}' requer operandos do tipo 'boolean', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
    
    # ========================================================================
    # MÉTODOS PÚBLICOS
    # ========================================================================
    
    def has_errors(self):
        """
        Verifica se houve erros semânticos
        """
        return len(self.errors) > 0
    
    def print_errors(self):
        """
        Imprime todos os erros semânticos encontrados
        """
        if self.has_errors():
            print("\n=== ERROS SEMÂNTICOS ===", file=sys.stderr)
            for error in self.errors:
                print(f"  {error}", file=sys.stderr)
            print("=" * 50, file=sys.stderr)
    
    def get_symbol_table_dump(self):
        """
        Retorna representação em string da tabela de símbolos
        """
        result = "\n=== TABELA DE SÍMBOLOS ===\n"
        
        def dump_scope(scope, indent=0):
            res = "  " * indent + f"Escopo: {scope.scope_name}\n"
            for name, symbol in scope.symbols.items():
                res += "  " * (indent + 1) + f"{symbol}\n"
            return res
        
        # Percorre até o escopo global
        current = self.symbol_table
        scopes = []
        while current:
            scopes.append(current)
            current = current.parent
        
        # Imprime do global para o local
        for scope in reversed(scopes):
            result += dump_scope(scope)
        
        return result
