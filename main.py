#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Compilador TypeScript Simplificado - Frontend e Backend Completo

Este é o programa principal que integra todas as fases da compilação:
1. Análise Léxica (Lexer)
2. Análise Sintática (Parser)
3. Análise Semântica (Semantic Analyzer)
4. Geração de Código (Code Generator - LLVM IR)
5. Compilação para Executável (clang)

Uso:
    python main.py <arquivo.ts> [opções]

Opções:
    --debug, -d          Ativa modo de depuração
    --show-ir            Mostra o código IR gerado no console
    --gen-llvm           Gera arquivo LLVM IR (.ll)
    --output, -o         Nome do arquivo executável de saída
    --compile, -c        Compila para binário executável
    --run, -r            Compila e executa o programa
"""

import sys
import argparse
import os

from antlr4 import CommonTokenStream, FileStream
from antlr4.error.ErrorListener import ErrorListener

# Importar componentes do compilador
from gen.TypeScriptSimplificadoLexer import TypeScriptSimplificadoLexer
from gen.TypeScriptSimplificadoParser import TypeScriptSimplificadoParser
from semantic_analyzer import SemanticAnalyzer
from code_generator import LLVMCodeGenerator


class CompilerErrorListener(ErrorListener):
    """
    Listener personalizado para capturar erros sintáticos.
    """
    def __init__(self):
        super().__init__()
        self.errors = []
    
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        error_msg = f"Erro sintático na linha {line}:{column} - {msg}"
        self.errors.append(error_msg)


def analyze_file(filename: str):
    """
    Realiza análise léxica, sintática e semântica de um arquivo.
    
    Args:
        filename: Caminho do arquivo a ser analisado
        
    Returns:
        Tupla (syntax_errors, semantic_errors, tree, semantic_analyzer)
    """
    # Criar input stream
    input_stream = FileStream(filename, encoding='utf-8')
    
    # Análise Léxica
    lexer = TypeScriptSimplificadoLexer(input_stream)
    
    # Capturar erros léxicos
    lexer_errors = []
    original_error = lexer.removeErrorListeners
    
    class LexerErrorListener(ErrorListener):
        def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
            lexer_errors.append(f"Erro léxico na linha {line}:{column} - {msg}")
    
    lexer.removeErrorListeners()
    lexer.addErrorListener(LexerErrorListener())
    
    # Criar token stream
    tokens = CommonTokenStream(lexer)
    
    # Se houver erros léxicos, retornar
    if lexer_errors:
        return lexer_errors, [], None, None
    
    # Análise Sintática
    parser = TypeScriptSimplificadoParser(tokens)
    
    # Remover listeners padrão e adicionar o nosso
    parser.removeErrorListeners()
    error_listener = CompilerErrorListener()
    parser.addErrorListener(error_listener)
    
    # Parse
    tree = parser.program()
    
    # Se houver erros sintáticos, retornar
    if error_listener.errors:
        return error_listener.errors, [], None, None
    
    # Análise Semântica
    semantic = SemanticAnalyzer()
    semantic.visit(tree)
    
    # Retornar erros semânticos se houver
    semantic_errors = [str(e) for e in semantic.errors]
    
    return [], semantic_errors, tree, semantic


def main():
    """
    Função principal do compilador.
    """
    # Configurar argumentos
    parser = argparse.ArgumentParser(
        description='Compilador TypeScript Simplificado',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Exemplos:
  python main.py programa.ts                    # Apenas análise
  python main.py programa.ts --show-ir          # Mostra IR gerado
  python main.py programa.ts --compile          # Compila para executável
  python main.py programa.ts --run              # Compila e executa
  python main.py programa.ts -o meu_programa    # Define nome do executável
        """
    )
    
    parser.add_argument('arquivo', help='Arquivo TypeScript Simplificado (.ts)')
    parser.add_argument('--debug', '-d', action='store_true', 
                       help='Ativa modo de depuração')
    parser.add_argument('--show-ir', action='store_true', 
                       help='Mostra o código IR gerado no console')
    parser.add_argument('--gen-llvm', action='store_true', 
                       help='Gera arquivo LLVM IR (.ll)')
    parser.add_argument('--output', '-o', default=None, 
                       help='Nome do arquivo executável de saída')
    parser.add_argument('--compile', '-c', action='store_true', 
                       help='Compila para binário executável')
    parser.add_argument('--run', '-r', action='store_true', 
                       help='Compila e executa o programa')
    
    args = parser.parse_args()
    
    # Verificar se arquivo existe
    if not os.path.exists(args.arquivo):
        print(f"Erro: Arquivo '{args.arquivo}' não encontrado.", file=sys.stderr)
        return 1
    
    # Criar diretórios de saída se não existirem
    os.makedirs('outputs-ll', exist_ok=True)
    os.makedirs('outputs-o', exist_ok=True)
    
    # Determinar nome base do arquivo
    base_name = os.path.splitext(os.path.basename(args.arquivo))[0]
    if args.output is None:
        args.output = f'outputs-o/{base_name}'
    
    print("=" * 70)
    print(f"Compilando: {args.arquivo}")
    print("=" * 70)
    
    # ========================================================================
    # FASE 1: ANÁLISE LÉXICA, SINTÁTICA E SEMÂNTICA
    # ========================================================================
    
    print("\n=== FASE 1: Análise Léxica, Sintática e Semântica ===\n")
    
    syntax_errors, semantic_errors, tree, semantic = analyze_file(args.arquivo)
    
    # Verificar erros sintáticos
    if syntax_errors:
        print("❌ ERROS SINTÁTICOS ENCONTRADOS:\n", file=sys.stderr)
        for error in syntax_errors:
            print(f"  • {error}", file=sys.stderr)
        print("\n" + "=" * 70)
        print("COMPILAÇÃO FALHOU")
        print("=" * 70)
        return 1
    
    print("✓ Análise Léxica: OK")
    print("✓ Análise Sintática: OK")
    
    # Verificar erros semânticos
    if semantic_errors:
        print("\n❌ ERROS SEMÂNTICOS ENCONTRADOS:\n", file=sys.stderr)
        for error in semantic_errors:
            print(f"  • {error}", file=sys.stderr)
        
        # Mostrar tabela de símbolos em modo debug
        if args.debug:
            print("\n" + semantic.get_symbol_table_dump(), file=sys.stderr)
        
        print("\n" + "=" * 70)
        print("COMPILAÇÃO FALHOU")
        print("=" * 70)
        return 1
    
    print("✓ Análise Semântica: OK")
    
    # Mostrar informações de debug se solicitado
    if args.debug:
        print("\n" + semantic.get_symbol_table_dump())
    
    # ========================================================================
    # FASE 2: GERAÇÃO DE CÓDIGO LLVM IR
    # ========================================================================
    
    # Apenas gerar código se houver flags que requerem isso
    should_generate = args.gen_llvm or args.show_ir or args.compile or args.run
    
    if not should_generate:
        print("\n" + "=" * 70)
        print("✓ COMPILAÇÃO CONCLUÍDA (apenas análise)")
        print("=" * 70)
        return 0
    
    print("\n=== FASE 2: Geração de Código LLVM IR ===\n")
    
    try:
        # Criar gerador de código
        codegen = LLVMCodeGenerator(semantic)
        
        # Gerar IR
        codegen.visit(tree)
        
        print("✓ Código LLVM IR gerado com sucesso")
        
        # Mostrar IR se solicitado
        if args.show_ir:
            print("\n" + "-" * 70)
            print("CÓDIGO LLVM IR:")
            print("-" * 70)
            print(codegen.get_ir())
            print("-" * 70)
        
        # Salvar IR em arquivo se solicitado
        ir_file = f"outputs-ll/{base_name}.ll"
        if args.gen_llvm or args.compile or args.run:
            codegen.save_ir(ir_file)
            print(f"✓ IR salvo em: {ir_file}")
        
        # ====================================================================
        # FASE 3: COMPILAÇÃO PARA BINÁRIO
        # ====================================================================
        
        if args.compile or args.run:
            print("\n=== FASE 3: Compilação para Binário ===\n")
            
            try:
                binary = codegen.compile_to_binary(ir_file, args.output)
                print(f"✓ Executável gerado: {binary}")
                
                # ============================================================
                # FASE 4: EXECUÇÃO
                # ============================================================
                
                if args.run:
                    print("\n=== FASE 4: Execução ===\n")
                    print("-" * 70)
                    
                    import subprocess
                    
                    # Executar no Windows ou Unix
                    if sys.platform == "win32":
                        result = subprocess.run([binary], capture_output=True, text=True)
                    else:
                        result = subprocess.run([f'./{binary}'], capture_output=True, text=True)
                    
                    # Mostrar saída do programa
                    if result.stdout:
                        print(result.stdout, end='')
                    
                    # Mostrar erros se houver
                    if result.stderr:
                        print("STDERR:", file=sys.stderr)
                        print(result.stderr, file=sys.stderr)
                    
                    print("-" * 70)
                    
                    # Mostrar código de retorno
                    exit_code = result.returncode
                    print(f"\nPrograma terminou com código: {exit_code}")
            
            except Exception as e:
                print(f"\n❌ Erro na compilação: {e}", file=sys.stderr)
                if args.debug:
                    import traceback
                    traceback.print_exc()
                return 1
        
        # Sucesso
        print("\n" + "=" * 70)
        print("✓ COMPILAÇÃO CONCLUÍDA COM SUCESSO")
        print("=" * 70)
        return 0
    
    except Exception as e:
        print(f"\n❌ Erro na geração de código: {e}", file=sys.stderr)
        if args.debug:
            import traceback
            traceback.print_exc()
        print("\n" + "=" * 70)
        print("COMPILAÇÃO FALHOU")
        print("=" * 70)
        return 1


if __name__ == '__main__':
    sys.exit(main())
