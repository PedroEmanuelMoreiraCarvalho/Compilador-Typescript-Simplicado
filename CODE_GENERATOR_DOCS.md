# Documentação do Compilador TypeScript Simplificado

## Índice
1. [Visão Geral](#visão-geral)
2. [Arquitetura do Compilador](#arquitetura-do-compilador)
3. [Fases da Compilação](#fases-da-compilação)
4. [Gerador de Código LLVM](#gerador-de-código-llvm)
5. [Tipos e Representações](#tipos-e-representações)
6. [Estruturas de Controle](#estruturas-de-controle)
7. [Funções Nativas](#funções-nativas)
8. [Como Usar](#como-usar)
9. [Exemplos](#exemplos)

---

## Visão Geral

Este é um **compilador completo** para a linguagem **TypeScript Simplificado**, desenvolvido em Python usando ANTLR4 e llvmlite. O compilador implementa todas as fases de um compilador tradicional:

```
Código Fonte (.ts)
    ↓
[Análise Léxica] → Tokens
    ↓
[Análise Sintática] → AST (Árvore Sintática Abstrata)
    ↓
[Análise Semântica] → AST Validada
    ↓
[Geração de Código] → LLVM IR (.ll)
    ↓
[Compilação] → Executável (via clang)
    ↓
[Execução] → Saída do Programa
```

---

## Arquitetura do Compilador

### Componentes Principais

```
compilador/
├── main.py                           # Programa principal
├── code_generator.py                 # Gerador de código LLVM IR
├── semantic_analyzer.py              # Analisador semântico
└── gen/                              # Arquivos gerados pelo ANTLR
    ├── TypeScriptSimplificado.g4     # Gramática ANTLR
    ├── TypeScriptSimplificadoLexer.py
    ├── TypeScriptSimplificadoParser.py
    └── TypeScriptSimplificadoVisitor.py
```

### Fluxo de Dados

```
┌─────────────────┐
│  Arquivo .ts    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│     Lexer       │ ← TypeScriptSimplificadoLexer
│  (Tokenização)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│     Parser      │ ← TypeScriptSimplificadoParser
│   (AST Build)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Semantic      │ ← SemanticAnalyzer
│   Analyzer      │   (Visitor Pattern)
│  (Validação)    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│     Code        │ ← LLVMCodeGenerator
│   Generator     │   (Visitor Pattern)
│   (LLVM IR)     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│     clang       │
│  (Compilação)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Executável    │
└─────────────────┘
```

---

## Fases da Compilação

### 1. Análise Léxica (Lexer)

**Responsabilidade**: Transformar o código fonte em uma sequência de tokens.

**Implementação**: `TypeScriptSimplificadoLexer` (gerado pelo ANTLR)

**Exemplo**:
```typescript
let x: number = 42;
```

**Tokens gerados**:
```
LET, ID(x), COLON, NUMBER, ASSIGN, NUMBER_LITERAL(42), SEMI
```

### 2. Análise Sintática (Parser)

**Responsabilidade**: Construir a Árvore Sintática Abstrata (AST) verificando a estrutura gramatical.

**Implementação**: `TypeScriptSimplificadoParser` (gerado pelo ANTLR)

**AST gerada** (simplificada):
```
program
  └── statement (varDeclStmt)
      └── variableDecl (letDecl)
          ├── ID: "x"
          ├── typeAnnotation: "number"
          └── expression
              └── literal: 42
```

### 3. Análise Semântica

**Responsabilidade**: Validar regras semânticas da linguagem.

**Implementação**: `SemanticAnalyzer` (Visitor Pattern)

**Verificações realizadas**:
- ✓ Tipos compatíveis em atribuições
- ✓ Variáveis declaradas antes do uso
- ✓ Uso de variáveis após inicialização
- ✓ Imutabilidade de `const`
- ✓ Redeclarações no mesmo escopo
- ✓ Tipos de parâmetros e retorno de funções
- ✓ Tipos em operações (aritméticas, lógicas, comparação)
- ✓ Tipos em estruturas de controle (if, while)
- ✓ Arrays com tipos compatíveis

**Estrutura de Dados**: Tabela de Símbolos Hierárquica

```python
class Symbol:
    name: str              # Nome do identificador
    symbol_type: str       # Tipo ('number', 'string', 'boolean', etc.)
    is_const: bool         # Se é constante
    is_initialized: bool   # Se foi inicializado
    line: int              # Linha de declaração

class SymbolTable:
    symbols: dict          # Símbolos no escopo atual
    parent: SymbolTable    # Escopo pai
    scope_name: str        # Nome do escopo (debug)
```

### 4. Geração de Código LLVM IR

**Responsabilidade**: Transformar a AST em código intermediário LLVM.

**Implementação**: `LLVMCodeGenerator` (Visitor Pattern + llvmlite)

**Processo**:
1. Criar módulo LLVM
2. Declarar funções externas (printf, sqrt, pow, etc.)
3. Criar função `main`
4. Gerar IR para cada statement e expressão
5. Gerenciar escopos e variáveis (allocas)
6. Controlar fluxo de execução (branches, blocos)

---

## Gerador de Código LLVM

### Estrutura Principal

```python
class LLVMCodeGenerator(TypeScriptSimplificadoVisitor):
    def __init__(self, semantic_analyzer):
        self.module = ir.Module(name="typescript_module")
        self.builder = ir.IRBuilder()
        self.symbol_table = [{}]  # Pilha de escopos
        self.current_function = None
        
        # Tipos LLVM
        self.i32 = ir.IntType(32)
        self.i64 = ir.IntType(64)
        self.i1 = ir.IntType(1)
        self.i8 = ir.IntType(8)
        self.double = ir.DoubleType()
        self.void = ir.VoidType()
        self.i8_ptr = self.i8.as_pointer()
```

### Gerenciamento de Escopos

O gerador mantém uma **pilha de escopos** para variáveis locais:

```python
self.symbol_table = [
    {},  # Escopo global (índice 0)
    {},  # Escopo de função (índice 1)
    {},  # Escopo de bloco (índice 2)
]
```

**Operações**:
- `push_scope()`: Cria novo escopo ao entrar em função/bloco
- `pop_scope()`: Remove escopo ao sair de função/bloco
- `lookup_variable()`: Busca variável do escopo mais interno ao global

### Alocação de Variáveis

Todas as variáveis locais são alocadas no **bloco de entrada** da função usando `alloca`:

```llvm
define i32 @main() {
entry:
  %x = alloca double        ; Variável x: number
  %y = alloca i1            ; Variável y: boolean
  %arr = alloca {i64, double*}  ; Array de numbers
  ; ... resto do código
}
```

**Vantagens**:
- Facilita otimizações (mem2reg)
- Variáveis têm endereços de memória estáveis
- Suporta escopo aninhado

---

## Tipos e Representações

### Tipos Básicos

| Tipo TS      | Tipo LLVM | Tamanho | Descrição |
|--------------|-----------|---------|-----------|
| `number`     | `double`  | 64 bits | Ponto flutuante dupla precisão |
| `boolean`    | `i1`      | 1 bit   | Valor booleano |
| `string`     | `i8*`     | Ponteiro | Ponteiro para string C (char*) |
| `void`       | `void`    | -       | Sem valor de retorno |

### Tipos Derivados (Arrays)

Arrays são representados como **structs** contendo tamanho e ponteiro para dados:

#### Array de Numbers (`number[]`)

```llvm
{i64, double*}
```

**Estrutura**:
- Campo 0: `i64` - Tamanho do array
- Campo 1: `double*` - Ponteiro para dados

**Exemplo de criação**:
```typescript
let arr: number[] = [1.0, 2.0, 3.0];
```

**IR gerado**:
```llvm
; Alocar memória para 3 doubles
%size = mul i64 3, 8                    ; 3 elementos * 8 bytes
%ptr = call i8* @malloc(i64 %size)
%data = bitcast i8* %ptr to double*

; Armazenar elementos
%elem0 = getelementptr double, double* %data, i64 0
store double 1.0, double* %elem0
%elem1 = getelementptr double, double* %data, i64 1
store double 2.0, double* %elem1
; ...

; Criar struct
%array = insertvalue {i64, double*} undef, i64 3, 0
%array2 = insertvalue {i64, double*} %array, double* %data, 1
```

#### Array de Strings (`string[]`)

```llvm
{i64, i8**}
```

**Estrutura**:
- Campo 0: `i64` - Tamanho do array
- Campo 1: `i8**` - Ponteiro para ponteiros de strings

### Operações com Arrays

#### Acesso a Elemento

```typescript
let x: number = arr[2];
```

**IR gerado**:
```llvm
%array = load {i64, double*}, {i64, double*}* %arr
%data = extractvalue {i64, double*} %array, 1
%elem_ptr = getelementptr double, double* %data, i64 2
%x = load double, double* %elem_ptr
```

#### Propriedade `.length`

```typescript
let len: number = arr.length;
```

**IR gerado**:
```llvm
%array = load {i64, double*}, {i64, double*}* %arr
%length_i64 = extractvalue {i64, double*} %array, 0
%len = sitofp i64 %length_i64 to double  ; Converte para number
```

---

## Estruturas de Controle

### If/Else

```typescript
if (x > 0) {
    console.log(x);
} else {
    console.log(-x);
}
```

**IR gerado**:
```llvm
  %cond = fcmp ogt double %x, 0.0
  br i1 %cond, label %if_then, label %if_else

if_then:
  ; código do then
  br label %if_merge

if_else:
  ; código do else
  br label %if_merge

if_merge:
  ; continua execução
```

**Blocos criados**:
- `if_then`: Código executado se condição é verdadeira
- `if_else`: Código executado se condição é falsa
- `if_merge`: Ponto de convergência após if/else

### While

```typescript
while (i < 10) {
    i = i + 1;
}
```

**IR gerado**:
```llvm
  br label %while_cond

while_cond:
  %i_val = load double, double* %i
  %cond = fcmp olt double %i_val, 10.0
  br i1 %cond, label %while_body, label %while_end

while_body:
  ; código do corpo
  %new_i = fadd double %i_val, 1.0
  store double %new_i, double* %i
  br label %while_cond

while_end:
  ; continua execução
```

**Blocos criados**:
- `while_cond`: Avaliação da condição
- `while_body`: Corpo do loop
- `while_end`: Saída do loop

### For

```typescript
for (let i: number = 0; i < 10; i = i + 1) {
    console.log(i);
}
```

**IR gerado**:
```llvm
  ; Inicialização
  %i = alloca double
  store double 0.0, double* %i
  br label %for_cond

for_cond:
  %i_val = load double, double* %i
  %cond = fcmp olt double %i_val, 10.0
  br i1 %cond, label %for_body, label %for_end

for_body:
  ; código do corpo
  br label %for_update

for_update:
  %new_i = fadd double %i_val, 1.0
  store double %new_i, double* %i
  br label %for_cond

for_end:
  ; continua execução
```

**Blocos criados**:
- `for_cond`: Avaliação da condição
- `for_body`: Corpo do loop
- `for_update`: Incremento/atualização
- `for_end`: Saída do loop

---

## Funções Nativas

### console.log()

Implementado usando `printf` da biblioteca C.

**Suporta múltiplos tipos**:
- `number`: Formato `%g\n`
- `string`: Formato `%s\n`
- `boolean`: Formato `%s\n` (converte para "true"/"false")

**Exemplo**:
```typescript
console.log(42);
console.log("Hello");
console.log(true);
```

**IR gerado**:
```llvm
; Para number
%fmt = getelementptr [4 x i8], [4 x i8]* @fmt_number, i32 0, i32 0
call i32 (i8*, ...) @printf(i8* %fmt, double 42.0)

; Para string
%fmt = getelementptr [4 x i8], [4 x i8]* @fmt_string, i32 0, i32 0
call i32 (i8*, ...) @printf(i8* %fmt, i8* %str)

; Para boolean
%str = select i1 %bool, i8* @str_true, i8* @str_false
%fmt = getelementptr [4 x i8], [4 x i8]* @fmt_bool, i32 0, i32 0
call i32 (i8*, ...) @printf(i8* %fmt, i8* %str)
```

### Math.sqrt()

```typescript
let result: number = Math.sqrt(16);
```

**IR gerado**:
```llvm
%result = call double @sqrt(double 16.0)
```

Chama a função `sqrt` da biblioteca `libm`.

### Math.pow()

```typescript
let result: number = Math.pow(2, 3);
```

**IR gerado**:
```llvm
%result = call double @pow(double 2.0, double 3.0)
```

Chama a função `pow` da biblioteca `libm`.

### parseInt()

```typescript
let num: number = parseInt("42");
```

**IR gerado**:
```llvm
%int_val = call i32 @atoi(i8* %str)
%num = sitofp i32 %int_val to double
```

Converte string para inteiro usando `atoi`, depois converte para `double`.

### parseFloat()

```typescript
let num: number = parseFloat("3.14");
```

**IR gerado**:
```llvm
%num = call double @atof(i8* %str)
```

Converte string para double usando `atof`.

---

## Como Usar

### Instalação de Dependências

```bash
# Python 3.7+
pip install antlr4-python3-runtime llvmlite

# LLVM/Clang (para compilação)
# Windows: Baixar de https://releases.llvm.org/
# Linux: sudo apt install clang
# macOS: brew install llvm
```

### Execução

#### 1. Apenas Análise (Léxica + Sintática + Semântica)

```bash
python main.py programa.ts
```

**Saída esperada**:
```
======================================================================
Compilando: programa.ts
======================================================================

=== FASE 1: Análise Léxica, Sintática e Semântica ===

✓ Análise Léxica: OK
✓ Análise Sintática: OK
✓ Análise Semântica: OK

======================================================================
✓ COMPILAÇÃO CONCLUÍDA (apenas análise)
======================================================================
```

#### 2. Gerar LLVM IR

```bash
python main.py programa.ts --gen-llvm
```

Gera arquivo `outputs-ll/programa.ll` com o código IR.

#### 3. Mostrar IR no Console

```bash
python main.py programa.ts --show-ir
```

#### 4. Compilar para Executável

```bash
python main.py programa.ts --compile
```

Gera executável em `outputs-o/programa`.

#### 5. Compilar e Executar

```bash
python main.py programa.ts --run
```

Compila e executa imediatamente, mostrando a saída.

#### 6. Modo Debug

```bash
python main.py programa.ts --debug
```

Mostra tabela de símbolos e informações detalhadas.

#### 7. Especificar Nome do Executável

```bash
python main.py programa.ts --compile -o meu_programa
```

### Opções Completas

```
usage: main.py [-h] [--debug] [--show-ir] [--gen-llvm] [--output OUTPUT]
               [--compile] [--run]
               arquivo

positional arguments:
  arquivo               Arquivo TypeScript Simplificado (.ts)

optional arguments:
  -h, --help            show this help message and exit
  --debug, -d           Ativa modo de depuração
  --show-ir             Mostra o código IR gerado no console
  --gen-llvm            Gera arquivo LLVM IR (.ll)
  --output OUTPUT, -o OUTPUT
                        Nome do arquivo executável de saída
  --compile, -c         Compila para binário executável
  --run, -r             Compila e executa o programa
```

---

## Exemplos

### Exemplo 1: Hello World

**Código** (`hello.ts`):
```typescript
console.log("Hello, World!");
```

**Compilar e executar**:
```bash
python main.py hello.ts --run
```

**Saída**:
```
======================================================================
Compilando: hello.ts
======================================================================

=== FASE 1: Análise Léxica, Sintática e Semântica ===

✓ Análise Léxica: OK
✓ Análise Sintática: OK
✓ Análise Semântica: OK

=== FASE 2: Geração de Código LLVM IR ===

✓ Código LLVM IR gerado com sucesso
✓ IR salvo em: outputs-ll/hello.ll

=== FASE 3: Compilação para Binário ===

✓ Executável gerado: outputs-o/hello

=== FASE 4: Execução ===

----------------------------------------------------------------------
Hello, World!
----------------------------------------------------------------------

Programa terminou com código: 0

======================================================================
✓ COMPILAÇÃO CONCLUÍDA COM SUCESSO
======================================================================
```

### Exemplo 2: Função Matemática

**Código** (`math.ts`):
```typescript
function factorial(n: number): number {
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

let result: number = factorial(5);
console.log(result);
```

**LLVM IR gerado** (simplificado):
```llvm
define double @factorial(double %n) {
entry:
  %n.addr = alloca double
  store double %n, double* %n.addr
  %n.val = load double, double* %n.addr
  %cond = fcmp ole double %n.val, 1.0
  br i1 %cond, label %if_then, label %if_else

if_then:
  ret double 1.0

if_else:
  %n.val2 = load double, double* %n.addr
  %n_minus_1 = fsub double %n.val2, 1.0
  %rec = call double @factorial(double %n_minus_1)
  %result = fmul double %n.val2, %rec
  ret double %result
}

define i32 @main() {
entry:
  %result = alloca double
  %fact = call double @factorial(double 5.0)
  store double %fact, double* %result
  ; ... console.log
  ret i32 0
}
```

### Exemplo 3: Arrays

**Código** (`arrays.ts`):
```typescript
let numbers: number[] = [1, 2, 3, 4, 5];
let sum: number = 0;

for (let i: number = 0; i < numbers.length; i = i + 1) {
    sum = sum + numbers[i];
}

console.log(sum);
```

**Execução**:
```bash
python main.py arrays.ts --run
```

**Saída**:
```
15
```

### Exemplo 4: Estruturas de Controle

**Código** (`control.ts`):
```typescript
function isPrime(n: number): boolean {
    if (n <= 1) {
        return false;
    }
    
    let i: number = 2;
    while (i * i <= n) {
        if (n % i == 0) {
            return false;
        }
        i = i + 1;
    }
    
    return true;
}

for (let num: number = 2; num <= 20; num = num + 1) {
    if (isPrime(num)) {
        console.log(num);
    }
}
```

**Saída**:
```
2
3
5
7
11
13
17
19
```

### Exemplo 5: Erro Semântico

**Código** (`error.ts`):
```typescript
let x: number;
let y: number = x + 1;  // Erro: x não foi inicializado
```

**Saída**:
```
======================================================================
Compilando: error.ts
======================================================================

=== FASE 1: Análise Léxica, Sintática e Semântica ===

✓ Análise Léxica: OK
✓ Análise Sintática: OK

❌ ERROS SEMÂNTICOS ENCONTRADOS:

  • Erro semântico na linha 2: Variável 'x' está sendo usada antes de ser inicializada (declarada na linha 1)

======================================================================
COMPILAÇÃO FALHOU
======================================================================
```

---

## Conclusão

Este compilador demonstra a implementação completa de um frontend e backend de compilador, transformando código TypeScript Simplificado em executáveis nativos através de LLVM IR. A arquitetura modular permite fácil extensão e manutenção, seguindo boas práticas de engenharia de compiladores.

### Pontos Fortes

✅ **Completo**: Implementa todas as fases da compilação
✅ **Robusto**: Análise semântica completa com verificação de tipos
✅ **Eficiente**: Usa LLVM IR para otimizações e geração de código nativo
✅ **Extensível**: Arquitetura modular baseada no padrão Visitor
✅ **Educacional**: Código bem documentado e estruturado

### Limitações e Melhorias Futuras

- ❌ Strings: Comparação de strings não implementada completamente
- ❌ Arrays: Sem verificação de bounds em tempo de execução
- ❌ Garbage Collection: Memória alocada não é liberada
- ❌ Otimizações: Não implementa passes de otimização LLVM

### Referências

- [ANTLR4 Documentation](https://github.com/antlr/antlr4/blob/master/doc/index.md)
- [LLVM Language Reference](https://llvm.org/docs/LangRef.html)
- [llvmlite Documentation](https://llvmlite.readthedocs.io/)
