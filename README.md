# Compilador TypeScript Simplificado

Implementação do front-end de um compilador para a linguagem **TypeScript Simplificado**, incluindo análise léxica e sintática.

## 📋 Requisitos

- Python 3.7 ou superior
- ANTLR4 Runtime para Python

## 🔧 Instalação

### 1. Instalar dependências Python

```bash
pip install antlr4-python3-runtime
```

### 2. Verificar instalação

```bash
python --version
python -c "import antlr4; print('ANTLR4 instalado com sucesso!')"
```

## 🚀 Uso

### Executar o compilador em um arquivo

```bash
python main.py <arquivo.ts>
```

**Exemplo:**
```bash
python main.py testes/valid/01_hello_world.ts
```

### Executar todos os testes

```bash
python run_tests.py
```

## 📁 Estrutura do Projeto

```
.
├── main.py                          # Script principal do compilador
├── run_tests.py                     # Script para executar todos os testes
├── gen/                             # Arquivos gerados pelo ANTLR4
│   ├── TypeScriptSimplificado.g4    # Gramática ANTLR4
│   ├── TypeScriptSimplificadoLexer.py
│   ├── TypeScriptSimplificadoParser.py
│   └── ...
└── testes/                          # Casos de teste
    ├── valid/                       # Programas válidos (devem compilar)
    │   ├── 01_hello_world.ts
    │   ├── 02_declarations.ts
    │   └── ...
    └── invalid/                     # Programas com erros
        ├── 01_lexical_error_char.ts
        ├── 02_lexical_error_string.ts
        └── ...
```

## ✅ Exemplos de Uso

### Exemplo 1: Programa Válido (Sucesso)

**Arquivo:** `testes/valid/01_hello_world.ts`
```typescript
let mensagem: string = "Hello, TypeScript Simplificado!";
console.log(mensagem);
```

**Execução:**
```bash
python main.py testes/valid/01_hello_world.ts
```

**Saída esperada:**
```
=== Compilando: testes/valid/01_hello_world.ts ===

✓ Análise Léxica: SUCESSO
  Total de tokens: X

✓ Análise Sintática: SUCESSO
  Árvore sintática gerada com sucesso!

==================================================
✅ COMPILAÇÃO CONCLUÍDA COM SUCESSO!
==================================================
```

### Exemplo 2: Programa com Erro Sintático

**Arquivo:** `testes/invalid/03_syntax_error_semicolon.ts`
```typescript
let x: number = 10
let y: number = 20;
```

**Execução:**
```bash
python main.py testes/invalid/03_syntax_error_semicolon.ts
```

**Saída esperada:**
```
=== Compilando: testes/invalid/03_syntax_error_semicolon.ts ===

✓ Análise Léxica: SUCESSO
  Total de tokens: X

Erro sintático na linha 2, coluna 0: ...

❌ ERRO SINTÁTICO detectado!
```

## 📝 Casos de Teste

### Programas Válidos (13 arquivos)

1. **01_hello_world.ts** - Hello World básico
2. **02_declarations.ts** - Declarações let e const
3. **03_arithmetic.ts** - Operações aritméticas
4. **04_logical_ops.ts** - Operações lógicas e comparações
5. **05_if_else.ts** - Estrutura if-else
6. **06_while.ts** - Loop while
7. **07_for.ts** - Loop for
8. **08_function.ts** - Função simples com retorno
9. **09_void_function.ts** - Função void
10. **10_arrays.ts** - Manipulação de arrays
11. **11_math_functions.ts** - Funções Math
12. **12_type_conversion.ts** - Conversão de tipos
13. **13_complete_program.ts** - Programa completo

### Programas com Erros (12 arquivos)

**Erros Léxicos:**
- **01_lexical_error_char.ts** - Caractere inválido (@)
- **02_lexical_error_string.ts** - String não fechada

**Erros Sintáticos:**
- **03_syntax_error_semicolon.ts** - Falta ponto e vírgula
- **04_syntax_error_no_type.ts** - Declaração sem tipo
- **05_syntax_error_paren.ts** - Parênteses não fechado
- **06_syntax_error_if.ts** - If sem condição
- **07_syntax_error_function.ts** - Função sem tipo de retorno
- **08_syntax_error_array.ts** - Array sem fechar colchetes
- **09_syntax_error_while.ts** - While sem condição
- **10_syntax_error_for.ts** - For malformado
- **11_syntax_error_const.ts** - Const sem inicialização
- **12_syntax_error_brace.ts** - Chaves não fechadas

## 🎯 Funcionalidades Implementadas

### Análise Léxica
- ✅ Reconhecimento de tokens (palavras-chave, identificadores, operadores, literais)
- ✅ Detecção de erros léxicos (caracteres inválidos, strings malformadas)
- ✅ Suporte a comentários de linha (`//`) e bloco (`/* */`)

### Análise Sintática
- ✅ Parsing completo da gramática TypeScript Simplificado
- ✅ Detecção de erros sintáticos com número de linha
- ✅ Geração de árvore sintática abstrata (AST)
- ✅ Suporte a todas as estruturas da linguagem:
  - Declarações (let, const)
  - Funções (function, return)
  - Estruturas de controle (if, while, for)
  - Operadores (aritméticos, lógicos, comparação)
  - Arrays e acesso por índice
  - Funções nativas (console.log, Math, conversões)

## 🔍 Detalhes da Implementação

### ErrorListener Customizado

O compilador usa um `CustomErrorListener` que:
- Captura erros léxicos e sintáticos
- Reporta o número da linha e coluna do erro
- Fornece mensagem descritiva do problema
- Impede a execução em caso de erros

### Saídas do Compilador

- **Sucesso:** Código de saída 0, mensagem de sucesso
- **Erro Léxico:** Código de saída 1, mensagem indicando linha do erro
- **Erro Sintático:** Código de saída 1, mensagem indicando linha e coluna do erro

## 📚 Especificação da Linguagem

Consulte o arquivo `docs/typescript-simplificado-spec.md` para detalhes completos sobre:
- Tipos de dados (number, string, boolean, void, arrays)
- Operadores e precedência
- Estruturas de controle
- Funções e escopo
- Funções nativas

## 🛠️ Desenvolvimento

### Regenerar arquivos ANTLR4 (se modificar a gramática)

```bash
cd gen
antlr4 -Dlanguage=Python3 -visitor TypeScriptSimplificado.g4
```

## 👥 Autores

Trabalho Final - Disciplina de Compiladores
UFPI - 6º Período

## 📄 Licença

Este projeto é parte de uma atividade acadêmica.
