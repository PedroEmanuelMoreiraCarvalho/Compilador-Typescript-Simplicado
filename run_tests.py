#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para executar todos os testes do compilador
"""

import os
import sys
import subprocess
from pathlib import Path

def run_test(file_path, expected_success=True):
    """
    Executa um teste e verifica o resultado
    """
    print(f"\n{'='*60}")
    print(f"Testando: {file_path}")
    print('='*60)
    
    try:
        result = subprocess.run(
            [sys.executable, "main.py", str(file_path)],
            capture_output=True,
            text=True,
            encoding='utf-8',
            errors='replace'  # Substitui caracteres inválidos em vez de falhar
        )
        
        success = (result.returncode == 0)
        
        # Imprime a saída
        if result.stdout:
            print(result.stdout)
        if result.stderr:
            print(result.stderr, file=sys.stderr)
        
        # Verifica se o resultado é o esperado
        if success == expected_success:
            status = "✅ PASSOU"
        else:
            status = "❌ FALHOU"
            if expected_success:
                status += " (esperava SUCESSO, obteve ERRO)"
            else:
                status += " (esperava ERRO, obteve SUCESSO)"
        
        print(f"\n{status}")
        return success == expected_success
        
    except Exception as e:
        print(f"❌ ERRO ao executar teste: {e}")
        return False

def main():
    """
    Executa todos os testes
    """
    base_path = Path(__file__).parent
    
    print("="*60)
    print("EXECUTANDO TODOS OS TESTES DO COMPILADOR")
    print("="*60)
    
    # Testes válidos (devem passar)
    valid_tests = sorted((base_path / "testes" / "valid").glob("*.ts"))
    
    # Testes inválidos (devem falhar)
    invalid_tests = sorted((base_path / "testes" / "invalid").glob("*.ts"))
    
    results = {
        "valid_passed": 0,
        "valid_failed": 0,
        "invalid_passed": 0,
        "invalid_failed": 0
    }
    
    # Executa testes válidos
    print("\n" + "="*60)
    print("TESTES COM PROGRAMAS VÁLIDOS")
    print("="*60)
    
    for test_file in valid_tests:
        if run_test(test_file, expected_success=True):
            results["valid_passed"] += 1
        else:
            results["valid_failed"] += 1
    
    # Executa testes inválidos
    print("\n" + "="*60)
    print("TESTES COM PROGRAMAS INVÁLIDOS (erros esperados)")
    print("="*60)
    
    for test_file in invalid_tests:
        if run_test(test_file, expected_success=False):
            results["invalid_passed"] += 1
        else:
            results["invalid_failed"] += 1
    
    # Resumo final
    print("\n" + "="*60)
    print("RESUMO DOS TESTES")
    print("="*60)
    
    total_valid = results["valid_passed"] + results["valid_failed"]
    total_invalid = results["invalid_passed"] + results["invalid_failed"]
    total_tests = total_valid + total_invalid
    total_passed = results["valid_passed"] + results["invalid_passed"]
    
    print(f"\nTestes Válidos:")
    print(f"  ✅ Passaram: {results['valid_passed']}/{total_valid}")
    print(f"  ❌ Falharam: {results['valid_failed']}/{total_valid}")
    
    print(f"\nTestes Inválidos:")
    print(f"  ✅ Passaram: {results['invalid_passed']}/{total_invalid}")
    print(f"  ❌ Falharam: {results['invalid_failed']}/{total_invalid}")
    
    print(f"\nTotal Geral:")
    print(f"  ✅ Passaram: {total_passed}/{total_tests}")
    print(f"  ❌ Falharam: {total_tests - total_passed}/{total_tests}")
    
    success_rate = (total_passed / total_tests * 100) if total_tests > 0 else 0
    print(f"\n  Taxa de sucesso: {success_rate:.1f}%")
    
    print("\n" + "="*60)
    
    return 0 if total_passed == total_tests else 1

if __name__ == "__main__":
    sys.exit(main())
