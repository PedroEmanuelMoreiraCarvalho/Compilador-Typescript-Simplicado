#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Compilador TypeScript Simplificado - Front-end
Análise Léxica e Sintática

Uso: python main.py <arquivo.ts>
"""

import sys
from antlr4 import *
from antlr4.error.ErrorListener import ErrorListener
from antlr4.tree.Tree import TerminalNode
from gen.TypeScriptSimplificadoLexer import TypeScriptSimplificadoLexer
from gen.TypeScriptSimplificadoParser import TypeScriptSimplificadoParser
from semantic_analyzer import SemanticAnalyzer


class CustomErrorListener(ErrorListener):
    """
    ErrorListener customizado para capturar erros léxicos e sintáticos
    e reportá-los de forma clara com número de linha.
    """
    
    def __init__(self):
        super(CustomErrorListener, self).__init__()
        self.errors = []
    
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        """
        Captura erros de sintaxe durante o parsing
        """
        error_msg = f"Erro sintático na linha {line}, coluna {column}: {msg}"
        self.errors.append(error_msg)
        print(error_msg, file=sys.stderr)
    
    def has_errors(self):
        """
        Verifica se houve algum erro
        """
        return len(self.errors) > 0


class TreePrinter:
    """
    Visitor simples para imprimir a árvore sintática de forma hierárquica
    """
    
    @staticmethod
    def print_tree(tree, parser, indent=0):
        """
        Imprime a árvore sintática recursivamente
        """
        if isinstance(tree, TerminalNode):
            # Nó terminal (token)
            token = tree.getSymbol()
            print("  " * indent + f"TOKEN: {token.text} (tipo: {parser.symbolicNames[token.type]})")
        else:
            # Nó não-terminal (regra)
            rule_name = parser.ruleNames[tree.getRuleIndex()]
            print("  " * indent + f"REGRA: {rule_name}")
            
            # Recursivamente imprime os filhos
            for i in range(tree.getChildCount()):
                TreePrinter.print_tree(tree.getChild(i), parser, indent + 1)


def compile_file(file_path):
    """
    Compila um arquivo TypeScript Simplificado
    
    Args:
        file_path: Caminho para o arquivo .ts
    
    Returns:
        True se a compilação foi bem-sucedida, False caso contrário
    """
    try:
        # Lê o arquivo de entrada
        with open(file_path, 'r', encoding='utf-8') as file:
            input_code = file.read()
        
        print(f"=== Compilando: {file_path} ===\n")
        
        # Cria o stream de entrada
        input_stream = InputStream(input_code)
        
        # === ANÁLISE LÉXICA ===
        lexer = TypeScriptSimplificadoLexer(input_stream)
        
        # Adiciona listener de erros customizado ao lexer
        lexer.removeErrorListeners()
        lexer_error_listener = CustomErrorListener()
        lexer.addErrorListener(lexer_error_listener)
        
        # Gera os tokens
        token_stream = CommonTokenStream(lexer)
        token_stream.fill()
        
        # Verifica erros léxicos
        if lexer_error_listener.has_errors():
            print("\n[ERRO] ERRO LEXICO detectado!")
            return False
        
        # Imprime tokens encontrados
        print("[OK] Analise Lexica: SUCESSO")
        print(f"  Total de tokens: {len(token_stream.tokens)}\n")
        
        # === ANÁLISE SINTÁTICA ===
        parser = TypeScriptSimplificadoParser(token_stream)
        
        # Adiciona listener de erros customizado ao parser
        parser.removeErrorListeners()
        parser_error_listener = CustomErrorListener()
        parser.addErrorListener(parser_error_listener)
        
        # Parseia o programa (começa pela regra 'program')
        tree = parser.program()
        
        # Verifica erros sintáticos
        if parser_error_listener.has_errors():
            print("\n[ERRO] ERRO SINTATICO detectado!")
            return False
        
        print("[OK] Analise Sintatica: SUCESSO")
        print(f"  Árvore sintática gerada com sucesso!\n")
        
        # === ANÁLISE SEMÂNTICA ===
        print("=== Análise Semântica ===")
        semantic_analyzer = SemanticAnalyzer()
        
        # Percorre a árvore com o Visitor
        semantic_analyzer.visit(tree)
        
        # Verifica erros semânticos
        if semantic_analyzer.has_errors():
            print("\n[ERRO] ERRO SEMANTICO detectado!")
            semantic_analyzer.print_errors()
            return False
        
        print("[OK] Analise Semantica: SUCESSO")
        print(f"  Todas as verificações semânticas passaram!\n")
        
        # Opcional: Imprime a tabela de símbolos e árvore
        if "--debug" in sys.argv or "-d" in sys.argv:
            print("\n=== Árvore Sintática ===")
            TreePrinter.print_tree(tree, parser)
            print(semantic_analyzer.get_symbol_table_dump())
        
        print("\n" + "="*50)
        print("[SUCESSO] COMPILACAO CONCLUIDA COM SUCESSO!")
        print("="*50)
        
        return True
        
    except FileNotFoundError:
        print(f"[ERRO] Arquivo '{file_path}' nao encontrado!", file=sys.stderr)
        return False
    except Exception as e:
        print(f"[ERRO] ERRO INESPERADO: {str(e)}", file=sys.stderr)
        import traceback
        traceback.print_exc()
        return False


def main():
    """
    Função principal - processa argumentos e inicia compilação
    """
    # Verifica argumentos
    args = [arg for arg in sys.argv[1:] if not arg.startswith("-")]
    
    if len(args) != 1:
        print("Uso: python main.py <arquivo.ts> [opções]", file=sys.stderr)
        print("\nOpções:", file=sys.stderr)
        print("  --debug, -d    Mostra informações detalhadas (tabela de símbolos e árvore)", file=sys.stderr)
        print("\nExemplo:", file=sys.stderr)
        print("  python main.py testes/valid/hello.ts", file=sys.stderr)
        print("  python main.py testes/valid/hello.ts --debug", file=sys.stderr)
        sys.exit(1)
    
    file_path = args[0]
    
    # Compila o arquivo
    success = compile_file(file_path)
    
    # Retorna código de saída apropriado
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
