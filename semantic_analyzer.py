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
from gen.TypeScriptSimplificadoVisitor import TypeScriptSimplificadoVisitor


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


class SemanticAnalyzer(TypeScriptSimplificadoVisitor):
    """
    Analisador Semântico usando padrão Visitor do ANTLR4
    
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
        self.all_scopes = [self.symbol_table]  # Rastreia todos os escopos criados
    
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
        self.all_scopes.append(self.symbol_table)  # Rastreia o novo escopo
    
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
        Obtém o tipo de uma expressão ou declaração através de visita
        
        Returns:
            String com o tipo ('number', 'string', 'boolean', 'number[]', 'string[]', 'void')
        """
        if ctx is None:
            return "void"
        
        # Visita o contexto e retorna o tipo
        return self.visit(ctx)
    
    def type_compatible(self, type1, type2):
        """
        Verifica se dois tipos são compatíveis
        """
        if type1 == "unknown" or type2 == "unknown":
            return True  # Não verifica tipos desconhecidos
        return type1 == type2
    
    def _is_integer_expression(self, ctx):
        """
        Verifica se uma expressão é certamente um valor inteiro.
        
        Retorna False se a expressão contém:
        - Literais decimais (1.5, 2.3, etc)
        - Divisões (que podem resultar em float)
        - Outras operações com floats
        
        Retorna True para:
        - Literais inteiros (1, 2, 100)
        - Variáveis (não podemos garantir, mas permitimos)
        - Operações +, -, *, %, ** entre inteiros
        """
        # Caso base: literal numérico
        if isinstance(ctx, TypeScriptSimplificadoParser.NumberLiteralContext):
            num_text = ctx.NUMBER_LITERAL().getText()
            # Verifica se tem ponto decimal
            return '.' not in num_text
        
        # Literal inteiro direto dentro de primaryExpr
        if hasattr(ctx, 'literal'):
            literal_ctx = ctx.literal()
            if literal_ctx and isinstance(literal_ctx, TypeScriptSimplificadoParser.NumberLiteralContext):
                num_text = literal_ctx.NUMBER_LITERAL().getText()
                return '.' not in num_text
        
        # Variáveis e identificadores: assumimos que podem ser inteiros
        if isinstance(ctx, TypeScriptSimplificadoParser.IdExprContext):
            return True
        
        # Divisão sempre pode resultar em float
        if isinstance(ctx, TypeScriptSimplificadoParser.DivExprContext):
            return False
        
        # Operações aritméticas: recursivamente verifica operandos
        if isinstance(ctx, (TypeScriptSimplificadoParser.AddExprContext,
                           TypeScriptSimplificadoParser.SubExprContext,
                           TypeScriptSimplificadoParser.MulExprContext,
                           TypeScriptSimplificadoParser.ModExprContext)):
            # Obtém os dois operandos
            left = ctx.getChild(0)
            right = ctx.getChild(2) if ctx.getChildCount() > 2 else ctx.getChild(1)
            return self._is_integer_expression(left) and self._is_integer_expression(right)
        
        # Expressão entre parênteses
        if isinstance(ctx, TypeScriptSimplificadoParser.ParenExprContext):
            return self._is_integer_expression(ctx.expression())
        
        # Expressões pass-through
        if isinstance(ctx, TypeScriptSimplificadoParser.ExpressionContext):
            return self._is_integer_expression(ctx.logicalOrExpr())
        
        if isinstance(ctx, TypeScriptSimplificadoParser.OrPassContext):
            return self._is_integer_expression(ctx.logicalAndExpr())
        
        if isinstance(ctx, TypeScriptSimplificadoParser.AndPassContext):
            return self._is_integer_expression(ctx.equalityExpr())
        
        if isinstance(ctx, TypeScriptSimplificadoParser.EqPassContext):
            return self._is_integer_expression(ctx.relationalExpr())
        
        if isinstance(ctx, TypeScriptSimplificadoParser.RelPassContext):
            return self._is_integer_expression(ctx.additiveExpr())
        
        if isinstance(ctx, TypeScriptSimplificadoParser.AddPassContext):
            return self._is_integer_expression(ctx.multiplicativeExpr())
        
        if isinstance(ctx, TypeScriptSimplificadoParser.MulPassContext):
            return self._is_integer_expression(ctx.powerExpr())
        
        if isinstance(ctx, TypeScriptSimplificadoParser.PowPassContext):
            return self._is_integer_expression(ctx.unaryExpr())
        
        if isinstance(ctx, TypeScriptSimplificadoParser.UnaryPassContext):
            return self._is_integer_expression(ctx.primaryExpr())
        
        if isinstance(ctx, TypeScriptSimplificadoParser.LiteralExprContext):
            return self._is_integer_expression(ctx.literal())
        
        # Chamadas de função, arrays, etc: não podemos garantir
        return True  # Assume que pode ser inteiro
    
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
    # VISITOR - Programa
    # ========================================================================
    
    def visitProgram(self, ctx: TypeScriptSimplificadoParser.ProgramContext):
        """
        Visita o programa inteiro
        """
        # Primeira passagem: coleta assinaturas de funções
        for child in ctx.children:
            if isinstance(child, TypeScriptSimplificadoParser.FunctionDeclContext):
                self._collect_func_signature(child)
        
        # Segunda passagem: visita todos os filhos (funções e statements)
        return self.visitChildren(ctx)
    
    def _collect_func_signature(self, ctx: TypeScriptSimplificadoParser.FunctionDeclContext):
        """
        Coleta a assinatura de uma função sem processar o corpo
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
    
    # ========================================================================
    # VISITOR - Declarações de Funções
    # ========================================================================
    
    def visitFunctionDecl(self, ctx: TypeScriptSimplificadoParser.FunctionDeclContext):
        """
        Visita declaração de função
        """
        func_name = ctx.ID().getText()
        line = ctx.start.line
        
        # Busca a função já declarada
        symbol = self.symbol_table.lookup(func_name)
        
        # Entra no escopo da função
        self.enter_scope(f"function_{func_name}")
        self.current_function = symbol
        
        # Declara os parâmetros no escopo da função
        if symbol and ctx.paramList():
            for param in symbol.params:
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
        
        # Visita o corpo da função
        self.visit(ctx.block())
        
        # Sai do escopo da função
        self.exit_scope()
        self.current_function = None
        
        return None
    
    # ========================================================================
    # VISITOR - Declarações de Variáveis
    # ========================================================================
    
    def visitLetDecl(self, ctx: TypeScriptSimplificadoParser.LetDeclContext):
        """
        Visita declaração de variável com let
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
        
        return None
    
    def visitConstDecl(self, ctx: TypeScriptSimplificadoParser.ConstDeclContext):
        """
        Visita declaração de constante com const
        """
        const_name = ctx.ID().getText()
        const_type = self.get_type_annotation(ctx.typeAnnotation())
        line = ctx.start.line
        
        # const DEVE ter inicialização
        if ctx.expression() is None:
            self.add_error(f"Constante '{const_name}' deve ser inicializada", ctx)
            return None
        
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
        
        return None
    
    # ========================================================================
    # VISITOR - Atribuições
    # ========================================================================
    
    def visitAssignmentStmt(self, ctx: TypeScriptSimplificadoParser.AssignmentStmtContext):
        """
        Visita atribuição de valor a variável
        """
        lvalue = ctx.lvalue()
        line = ctx.start.line
        
        # Pega o nome da variável
        if isinstance(lvalue, TypeScriptSimplificadoParser.IdLvalueContext):
            var_name = lvalue.ID().getText()
            
            # Verifica se a variável existe
            symbol = self.symbol_table.lookup(var_name)
            if not symbol:
                self.add_error(f"Variável '{var_name}' não foi declarada", ctx)
                return None
            
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
        
        elif isinstance(lvalue, TypeScriptSimplificadoParser.ArrayAccessLvalueContext):
            # Atribuição a elemento de array
            var_name = lvalue.ID().getText()
            symbol = self.symbol_table.lookup(var_name)
            if not symbol:
                self.add_error(f"Array '{var_name}' não foi declarado", ctx)
                return None
            
            # Verifica se é um array
            if not symbol.symbol_type.endswith("[]"):
                self.add_error(f"'{var_name}' não é um array", ctx)
                return None
            
            # Verifica tipo do índice
            index_expr = lvalue.expression()
            index_type = self.get_type(index_expr)
            if index_type != "number" and index_type != "unknown":
                self.add_error(
                    f"Índice de array deve ser do tipo 'number', mas é '{index_type}'",
                    ctx
                )
            
            # Verifica se o índice é uma expressão que pode resultar em float
            if not self._is_integer_expression(index_expr):
                self.add_error(
                    f"Índice de array deve ser um valor inteiro. "
                    f"Evite usar operações com decimais como índice",
                    ctx
                )
            
            # Verifica tipo do elemento
            element_type = symbol.symbol_type[:-2]  # Remove []
            expr_type = self.get_type(ctx.expression())
            if not self.type_compatible(element_type, expr_type):
                self.add_error(
                    f"Tipo incompatível na atribuição ao array '{var_name}': "
                    f"esperado '{element_type}', mas recebeu '{expr_type}'",
                    ctx
                )
        
        return None
    
    # ========================================================================
    # VISITOR - Estruturas de Controle
    # ========================================================================
    
    def visitBlock(self, ctx: TypeScriptSimplificadoParser.BlockContext):
        """
        Visita bloco de código
        """
        # Apenas cria novo escopo se não for bloco de função (que já criou)
        parent = ctx.parentCtx
        if not isinstance(parent, TypeScriptSimplificadoParser.FunctionDeclContext):
            self.enter_scope("block")
        
        # Visita statements do bloco
        self.visitChildren(ctx)
        
        if not isinstance(parent, TypeScriptSimplificadoParser.FunctionDeclContext):
            self.exit_scope()
        
        return None
    
    def visitIfStatement(self, ctx: TypeScriptSimplificadoParser.IfStatementContext):
        """
        Visita statement if
        """
        # Verifica condição
        condition_type = self.get_type(ctx.expression())
        if condition_type != "boolean" and condition_type != "unknown":
            self.add_error(
                f"Condição do 'if' deve ser do tipo 'boolean', mas é '{condition_type}'",
                ctx
            )
        
        # Visita statements
        return self.visitChildren(ctx)
    
    def visitWhileStatement(self, ctx: TypeScriptSimplificadoParser.WhileStatementContext):
        """
        Visita statement while
        """
        # Verifica condição
        condition_type = self.get_type(ctx.expression())
        if condition_type != "boolean" and condition_type != "unknown":
            self.add_error(
                f"Condição do 'while' deve ser do tipo 'boolean', mas é '{condition_type}'",
                ctx
            )
        
        # Visita statement do corpo
        return self.visitChildren(ctx)
    
    def visitForStatement(self, ctx: TypeScriptSimplificadoParser.ForStatementContext):
        """
        Visita statement for
        """
        # Cria escopo para o for
        self.enter_scope("for")
        
        # Visita componentes do for
        if ctx.forInit():
            self.visit(ctx.forInit())
        
        if ctx.expression():
            condition_type = self.get_type(ctx.expression())
            if condition_type != "boolean" and condition_type != "unknown":
                self.add_error(
                    f"Condição do 'for' deve ser do tipo 'boolean', mas é '{condition_type}'",
                    ctx
                )
        
        if ctx.forUpdate():
            self.visit(ctx.forUpdate())
        
        # Visita corpo do for
        if ctx.statement():
            self.visit(ctx.statement())
        
        self.exit_scope()
        return None
    
    def visitReturnStatement(self, ctx: TypeScriptSimplificadoParser.ReturnStatementContext):
        """
        Visita statement return
        """
        if not self.current_function:
            self.add_error("'return' fora de uma função", ctx)
            return None
        
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
        
        return None
    
    # ========================================================================
    # VISITOR - Expressões - Literais
    # ========================================================================
    
    def visitNumberLiteral(self, ctx: TypeScriptSimplificadoParser.NumberLiteralContext):
        """Retorna tipo de literal numérico"""
        return "number"
    
    def visitStringLiteral(self, ctx: TypeScriptSimplificadoParser.StringLiteralContext):
        """Retorna tipo de literal string"""
        return "string"
    
    def visitTrueLiteral(self, ctx: TypeScriptSimplificadoParser.TrueLiteralContext):
        """Retorna tipo de literal true"""
        return "boolean"
    
    def visitFalseLiteral(self, ctx: TypeScriptSimplificadoParser.FalseLiteralContext):
        """Retorna tipo de literal false"""
        return "boolean"
    
    # ========================================================================
    # VISITOR - Expressões - Identificadores
    # ========================================================================
    
    def visitIdExpr(self, ctx: TypeScriptSimplificadoParser.IdExprContext):
        """
        Visita uso de identificador em expressão
        """
        var_name = ctx.ID().getText()
        line = ctx.start.line
        
        # Verifica se a variável foi declarada
        symbol = self.symbol_table.lookup(var_name)
        if not symbol:
            self.add_error(f"Variável '{var_name}' não foi declarada", ctx)
            return "unknown"
        
        # Verifica se foi inicializada (apenas para variáveis, não funções)
        if not symbol.is_function and not symbol.is_initialized:
            self.add_error(
                f"Variável '{var_name}' está sendo usada antes de ser inicializada "
                f"(declarada na linha {symbol.line})",
                ctx
            )
        
        return symbol.symbol_type
    
    # ========================================================================
    # VISITOR - Expressões - Arrays
    # ========================================================================
    
    def visitArrayLitExpr(self, ctx: TypeScriptSimplificadoParser.ArrayLitExprContext):
        """
        Visita literal de array
        """
        expr_list = ctx.arrayLiteral().expressionList()
        if expr_list and expr_list.expression():
            first_type = self.get_type(expr_list.expression(0))
            if first_type in ["number", "string"]:
                return f"{first_type}[]"
        return "number[]"  # Default
    
    def visitArrayAccessExpr(self, ctx: TypeScriptSimplificadoParser.ArrayAccessExprContext):
        """
        Visita acesso a elemento de array
        """
        var_name = ctx.ID().getText()
        symbol = self.symbol_table.lookup(var_name)
        
        if not symbol:
            self.add_error(f"Array '{var_name}' não foi declarado", ctx)
            return "unknown"
        
        if not symbol.symbol_type.endswith("[]"):
            self.add_error(f"'{var_name}' não é um array", ctx)
            return "unknown"
        
        # Verifica tipo do índice
        index_type = self.get_type(ctx.expression())
        if index_type != "number" and index_type != "unknown":
            self.add_error(
                f"Índice de array deve ser do tipo 'number', mas é '{index_type}'",
                ctx
            )
        
        # Verifica se o índice é uma expressão que pode resultar em float
        index_expr = ctx.expression()
        if not self._is_integer_expression(index_expr):
            self.add_error(
                f"Índice de array deve ser um valor inteiro. "
                f"Evite usar operações com decimais como índice",
                ctx
            )
        
        # Retorna tipo do elemento
        return symbol.symbol_type[:-2]  # Remove []
    
    def visitLengthExpr(self, ctx: TypeScriptSimplificadoParser.LengthExprContext):
        """
        Visita acesso à propriedade .length
        """
        var_name = ctx.ID().getText()
        symbol = self.symbol_table.lookup(var_name)
        
        if not symbol:
            self.add_error(f"Variável '{var_name}' não foi declarada", ctx)
            return "unknown"
        
        if not symbol.symbol_type.endswith("[]"):
            self.add_error(f"Propriedade 'length' só pode ser usada em arrays", ctx)
            return "unknown"
        
        return "number"
    
    # ========================================================================
    # VISITOR - Expressões - Chamadas de Função
    # ========================================================================
    
    def visitFuncCallExpr(self, ctx: TypeScriptSimplificadoParser.FuncCallExprContext):
        """
        Visita chamada de função
        """
        func_name = ctx.functionCall().ID().getText()
        line = ctx.start.line
        
        # Verifica se a função foi declarada
        symbol = self.symbol_table.lookup(func_name)
        if not symbol:
            self.add_error(f"Função '{func_name}' não foi declarada", ctx)
            return "unknown"
        
        if not symbol.is_function:
            self.add_error(f"'{func_name}' não é uma função", ctx)
            return "unknown"
        
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
            return symbol.return_type
        
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
        
        return symbol.return_type
    
    def visitMathFuncCallExpr(self, ctx: TypeScriptSimplificadoParser.MathFuncCallExprContext):
        """
        Visita chamada de função Math
        """
        # Verifica tipos dos argumentos
        math_call = ctx.mathFunctionCall()
        
        if isinstance(math_call, TypeScriptSimplificadoParser.MathSqrtCallContext):
            arg_type = self.get_type(math_call.expression())
            if arg_type != "number" and arg_type != "unknown":
                self.add_error(
                    f"Math.sqrt() espera argumento do tipo 'number', mas recebeu '{arg_type}'",
                    ctx
                )
        elif isinstance(math_call, TypeScriptSimplificadoParser.MathPowCallContext):
            base_type = self.get_type(math_call.expression(0))
            exp_type = self.get_type(math_call.expression(1))
            if base_type != "number" and base_type != "unknown":
                self.add_error(
                    f"Math.pow() espera primeiro argumento do tipo 'number', mas recebeu '{base_type}'",
                    ctx
                )
            if exp_type != "number" and exp_type != "unknown":
                self.add_error(
                    f"Math.pow() espera segundo argumento do tipo 'number', mas recebeu '{exp_type}'",
                    ctx
                )
        
        return "number"
    
    def visitConvFuncCallExpr(self, ctx: TypeScriptSimplificadoParser.ConvFuncCallExprContext):
        """
        Visita chamada de função de conversão
        """
        # Verifica o tipo de função de conversão
        conv_call = ctx.conversionFunctionCall()
        
        if isinstance(conv_call, TypeScriptSimplificadoParser.ParseIntCallContext):
            # parseInt(string) -> number
            arg_type = self.get_type(conv_call.expression())
            if arg_type != "string" and arg_type != "unknown":
                self.add_error(
                    f"parseInt() espera argumento do tipo 'string', mas recebeu '{arg_type}'",
                    ctx
                )
        elif isinstance(conv_call, TypeScriptSimplificadoParser.ParseFloatCallContext):
            # parseFloat(string) -> number
            arg_type = self.get_type(conv_call.expression())
            if arg_type != "string" and arg_type != "unknown":
                self.add_error(
                    f"parseFloat() espera argumento do tipo 'string', mas recebeu '{arg_type}'",
                    ctx
                )
        
        # parseInt e parseFloat sempre retornam number
        return "number"
    
    # ========================================================================
    # VISITOR - Expressões - Operadores Aritméticos
    # ========================================================================
    
    def visitAddExpr(self, ctx: TypeScriptSimplificadoParser.AddExprContext):
        """Visita operador +"""
        left_type = self.get_type(ctx.additiveExpr())
        right_type = self.get_type(ctx.multiplicativeExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '+' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '+' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "number"
    
    def visitSubExpr(self, ctx: TypeScriptSimplificadoParser.SubExprContext):
        """Visita operador -"""
        left_type = self.get_type(ctx.additiveExpr())
        right_type = self.get_type(ctx.multiplicativeExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '-' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '-' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "number"
    
    def visitMulExpr(self, ctx: TypeScriptSimplificadoParser.MulExprContext):
        """Visita operador *"""
        left_type = self.get_type(ctx.multiplicativeExpr())
        right_type = self.get_type(ctx.powerExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '*' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '*' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "number"
    
    def visitDivExpr(self, ctx: TypeScriptSimplificadoParser.DivExprContext):
        """Visita operador /"""
        left_type = self.get_type(ctx.multiplicativeExpr())
        right_type = self.get_type(ctx.powerExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '/' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '/' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "number"
    
    def visitModExpr(self, ctx: TypeScriptSimplificadoParser.ModExprContext):
        """Visita operador %"""
        left_type = self.get_type(ctx.multiplicativeExpr())
        right_type = self.get_type(ctx.powerExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '%' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '%' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "number"
    
    def visitPowExpr(self, ctx: TypeScriptSimplificadoParser.PowExprContext):
        """Visita operador **"""
        left_type = self.get_type(ctx.unaryExpr())
        right_type = self.get_type(ctx.powerExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '**' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '**' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "number"
    
    def visitNegExpr(self, ctx: TypeScriptSimplificadoParser.NegExprContext):
        """Visita operador unário -"""
        operand_type = self.get_type(ctx.unaryExpr())
        if operand_type != "number" and operand_type != "unknown":
            self.add_error(
                f"Operador unário '-' requer operando do tipo 'number', mas recebeu '{operand_type}'",
                ctx
            )
        return "number"
    
    # ========================================================================
    # VISITOR - Expressões - Operadores Lógicos
    # ========================================================================
    
    def visitAndExpr(self, ctx: TypeScriptSimplificadoParser.AndExprContext):
        """Visita operador &&"""
        left_type = self.get_type(ctx.logicalAndExpr())
        right_type = self.get_type(ctx.equalityExpr())
        
        if left_type != "boolean" and left_type != "unknown":
            self.add_error(
                f"Operador '&&' requer operandos do tipo 'boolean', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "boolean" and right_type != "unknown":
            self.add_error(
                f"Operador '&&' requer operandos do tipo 'boolean', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "boolean"
    
    def visitOrExpr(self, ctx: TypeScriptSimplificadoParser.OrExprContext):
        """Visita operador ||"""
        left_type = self.get_type(ctx.logicalOrExpr())
        right_type = self.get_type(ctx.logicalAndExpr())
        
        if left_type != "boolean" and left_type != "unknown":
            self.add_error(
                f"Operador '||' requer operandos do tipo 'boolean', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "boolean" and right_type != "unknown":
            self.add_error(
                f"Operador '||' requer operandos do tipo 'boolean', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "boolean"
    
    def visitNotExpr(self, ctx: TypeScriptSimplificadoParser.NotExprContext):
        """Visita operador !"""
        operand_type = self.get_type(ctx.unaryExpr())
        if operand_type != "boolean" and operand_type != "unknown":
            self.add_error(
                f"Operador '!' requer operando do tipo 'boolean', mas recebeu '{operand_type}'",
                ctx
            )
        return "boolean"
    
    # ========================================================================
    # VISITOR - Expressões - Operadores de Comparação
    # ========================================================================
    
    def visitEqExpr(self, ctx: TypeScriptSimplificadoParser.EqExprContext):
        """Visita operador =="""
        # Comparação de igualdade permite qualquer tipo, mas devem ser compatíveis
        return "boolean"
    
    def visitNeqExpr(self, ctx: TypeScriptSimplificadoParser.NeqExprContext):
        """Visita operador !="""
        return "boolean"
    
    def visitGtExpr(self, ctx: TypeScriptSimplificadoParser.GtExprContext):
        """Visita operador >"""
        left_type = self.get_type(ctx.relationalExpr())
        right_type = self.get_type(ctx.additiveExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '>' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '>' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "boolean"
    
    def visitLtExpr(self, ctx: TypeScriptSimplificadoParser.LtExprContext):
        """Visita operador <"""
        left_type = self.get_type(ctx.relationalExpr())
        right_type = self.get_type(ctx.additiveExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '<' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '<' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "boolean"
    
    def visitGeExpr(self, ctx: TypeScriptSimplificadoParser.GeExprContext):
        """Visita operador >="""
        left_type = self.get_type(ctx.relationalExpr())
        right_type = self.get_type(ctx.additiveExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '>=' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '>=' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "boolean"
    
    def visitLeExpr(self, ctx: TypeScriptSimplificadoParser.LeExprContext):
        """Visita operador <="""
        left_type = self.get_type(ctx.relationalExpr())
        right_type = self.get_type(ctx.additiveExpr())
        
        if left_type != "number" and left_type != "unknown":
            self.add_error(
                f"Operador '<=' requer operandos do tipo 'number', "
                f"mas o lado esquerdo é '{left_type}'",
                ctx
            )
        
        if right_type != "number" and right_type != "unknown":
            self.add_error(
                f"Operador '<=' requer operandos do tipo 'number', "
                f"mas o lado direito é '{right_type}'",
                ctx
            )
        
        return "boolean"
    
    # ========================================================================
    # VISITOR - Expressões - Pass-through (contextos intermediários)
    # ========================================================================
    
    def visitParenExpr(self, ctx: TypeScriptSimplificadoParser.ParenExprContext):
        """Visita expressão entre parênteses"""
        return self.get_type(ctx.expression())
    
    def visitExpression(self, ctx: TypeScriptSimplificadoParser.ExpressionContext):
        """Pass-through para logicalOrExpr"""
        return self.get_type(ctx.logicalOrExpr())
    
    def visitOrPass(self, ctx: TypeScriptSimplificadoParser.OrPassContext):
        """Pass-through para logicalAndExpr"""
        return self.get_type(ctx.logicalAndExpr())
    
    def visitAndPass(self, ctx: TypeScriptSimplificadoParser.AndPassContext):
        """Pass-through para equalityExpr"""
        return self.get_type(ctx.equalityExpr())
    
    def visitEqPass(self, ctx: TypeScriptSimplificadoParser.EqPassContext):
        """Pass-through para relationalExpr"""
        return self.get_type(ctx.relationalExpr())
    
    def visitRelPass(self, ctx: TypeScriptSimplificadoParser.RelPassContext):
        """Pass-through para additiveExpr"""
        return self.get_type(ctx.additiveExpr())
    
    def visitAddPass(self, ctx: TypeScriptSimplificadoParser.AddPassContext):
        """Pass-through para multiplicativeExpr"""
        return self.get_type(ctx.multiplicativeExpr())
    
    def visitMulPass(self, ctx: TypeScriptSimplificadoParser.MulPassContext):
        """Pass-through para powerExpr"""
        return self.get_type(ctx.powerExpr())
    
    def visitPowPass(self, ctx: TypeScriptSimplificadoParser.PowPassContext):
        """Pass-through para unaryExpr"""
        return self.get_type(ctx.unaryExpr())
    
    def visitUnaryPass(self, ctx: TypeScriptSimplificadoParser.UnaryPassContext):
        """Pass-through para primaryExpr"""
        return self.get_type(ctx.primaryExpr())
    
    def visitLiteralExpr(self, ctx: TypeScriptSimplificadoParser.LiteralExprContext):
        """Pass-through para literal"""
        return self.get_type(ctx.literal())
    
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
        
        def dump_scope_tree(scope, indent=0):
            """Recursivamente imprime o escopo e seus filhos"""
            res = dump_scope(scope, indent)
            
            # Encontra escopos filhos deste escopo
            for child_scope in self.all_scopes:
                if child_scope.parent == scope:
                    res += dump_scope_tree(child_scope, indent + 1)
            
            return res
        
        # Começa pelo escopo global
        global_scope = self.all_scopes[0]
        result += dump_scope_tree(global_scope)
        
        return result
