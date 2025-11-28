# Compilador TypeScript Simplificado

Compilador completo para a linguagem TypeScript Simplificado, desenvolvido com ANTLR4 e Python. Implementa as três fases principais de um front-end de compilador: análise léxica, sintática e semântica.

O código está completo na plataforma GitHub: https://github.com/PedroEmanuelMoreiraCarvalho/Compilador-Typescript-Simplicado

## Especificação da Linguagem

Para detalhes completos sobre a sintaxe e semântica da linguagem, consulte:

```
Trabalho Final - Especificação.pdf
```

A especificação da linguagem foi modificada:
- Anteriormente foi pensado em verificar todos os fluxos de uma função para garantir que pelo menos um caminho retornasse um valor. 
- Agora, a verificação é feita apenas na declaração direta de retorno (deve obrigatoriamente ter retorno no final), simplificando a análise semântica.

## Características

### Análise Léxica
- Tokenização completa da linguagem
- Identificação de palavras-chave, operadores e literais
- Detecção de caracteres inválidos com número de linha

### Análise Sintática  
- Parser gerado pelo ANTLR4
- Verificação de estrutura gramatical
- Detecção de erros sintáticos com número de linha e coluna

### Análise Semântica (Padrão Visitor)
- **Verificação de tipos**: Compatibilidade em atribuições, operações e chamadas de função
- **Gerenciamento de escopos**: Escopo global e de bloco hierárquico
- **Regras de let/const**: 
  - `let`: Inicialização opcional, mas uso requer atribuição prévia
  - `const`: Inicialização obrigatória e imutabilidade
- **Declarações duplicadas**: Detecção de redeclaração no mesmo escopo
- **Uso antes de inicialização**: Análise estática de fluxo de dados
- **Verificação de funções**: 
  - Tipos de parâmetros e retorno
  - Número correto de argumentos
  - Compatibilidade de tipos em chamadas
  - Validação de `parseInt`/`parseFloat` (apenas `string`)
- **Verificação de arrays**:
  - Compatibilidade de tipos em `number[]` vs `string[]`
  - Verificação de tipo em atribuições a elementos
  - Validação de índices (devem ser inteiros, não floats)
  - Propriedade `.length` apenas em arrays
- **Operadores tipados**: Verificação de tipos em operações aritméticas, lógicas e de comparação
- **Estruturas de controle**: Verificação de tipos em condições (`if`, `while`)

### Geração de Código (Backend - LLVM IR)
- **Código intermediário LLVM**: Geração de LLVM IR otimizado
- **Suporte a variáveis globais e locais**: Escopo correto no IR
- **Funções nativas**: Integração com `printf`, `sqrt`, `pow`, `atoi`, `atof`
- **Estruturas de controle**: `if/else`, `while`, `for` com labels adequados
- **Arrays dinâmicos**: Alocação e acesso com `malloc`/`free`
- **Compilação para executável**: Uso do `clang` para gerar binários nativos

## Tipos e Recursos Suportados

- **Tipos básicos**: `number`, `string`, `boolean`, `void`
- **Arrays**: `number[]`, `string[]`
- **Declarações**: `let` e `const` com tipagem explícita
- **Estruturas de controle**: `if/else`, `while`, `for`
- **Funções**: Declaração com tipos de parâmetros e retorno
- **Funções nativas**: 
  - `console.log()` (múltiplos argumentos)
  - `Math.sqrt()`, `Math.pow()`
  - `parseInt()`, `parseFloat()`
  - Propriedade `.length`
- **Operadores**: 
  - Aritméticos: `+`, `-`, `*`, `/`, `%`, `**`
  - Lógicos: `&&`, `||`, `!`
  - Comparação: `==`, `!=`, `<`, `>`, `<=`, `>=`

## Instalação

### Pré-requisitos

```bash
# Python 3.7 ou superior
python --version

# Instalar ANTLR4 runtime para Python
pip install antlr4-python3-runtime

# Para backend (geração de código):
pip install llvmlite

# Clang (para compilar IR para executável)
# macOS: já vem instalado com Xcode Command Line Tools
# Linux: sudo apt-get install clang
# Windows: instale LLVM (https://releases.llvm.org/)
```

### Verificar instalação

```bash
python -c "import antlr4; print('✓ ANTLR4 instalado com sucesso!')"
python -c "import llvmlite; print('✓ llvmlite instalado com sucesso!')"
clang --version  # Verifica se clang está disponível
```

## Como Usar

### Executando o Compilador

O projeto possui dois programas principais:

#### `main-frontend.py` - Apenas Front-end
Executa **apenas** as fases de análise léxica, sintática e semântica. Não gera código LLVM.

```bash
python main-frontend.py <arquivo.ts> [--debug]
```

#### `main.py` - Compilador Completo
Executa **todas** as fases: front-end + geração de código LLVM IR + compilação para executável.

**Sintaxe:**
```bash
python main.py <arquivo.ts> [opções]
```

**Opções:**
- `--debug, -d`: Ativa modo de depuração (mostra tabela de símbolos)
- `--show-ir`: Exibe o código LLVM IR gerado no console
- `--gen-llvm`: Salva o LLVM IR em arquivo `.ll`
- `--compile, -c`: Compila para binário executável
- `--run, -r`: Compila e executa o programa
- `--output, -o <nome>`: Define nome do executável

### Exemplos de Uso

```bash
# Apenas análise (front-end)
python main-frontend.py testes/valid/01_hello_world.ts

# Análise completa (front-end + backend)
python main.py testes/valid/01_hello_world.ts

# Gerar e visualizar LLVM IR
python main.py testes/valid/08_function.ts --show-ir

# Compilar para executável
python main.py testes/valid/08_function.ts --compile

# Compilar e executar
python main.py testes/valid/08_function.ts --run

# Com modo debug
python main.py testes/valid/15_scope_functions.ts --debug --run
```

### Executando Testes Automatizados

O projeto possui dois scripts de teste:

#### `run_tests.py` - Testes de Front-end
Executa **todos** os testes (válidos e inválidos) verificando apenas análise léxica, sintática e semântica.

```bash
python run_tests.py
```

Testa 20 programas válidos + 33 programas inválidos = **53 testes**

#### `run_tests_backend.py` - Testes de Backend
Executa **apenas testes válidos** para verificar geração de código e compilação.

```bash
python run_tests_backend.py
```

Compila e executa os 20 programas válidos + 1 programa inválido (para verificar detecção de erros).

## Estrutura do Projeto

```
.
├── gen/                          # Arquivos gerados pelo ANTLR
│   ├── TypeScriptSimplificado.g4
│   ├── TypeScriptSimplificadoLexer.py
│   ├── TypeScriptSimplificadoParser.py
│   └── TypeScriptSimplificadoVisitor.py
├── testes/
│   ├── valid/                    # 20 programas válidos
│   │   ├── 01_hello_world.ts
│   │   ├── 08_function.ts
│   │   ├── 14_scope_blocks.ts
│   │   └── ...
│   └── invalid/                  # 33 programas com erros
│       ├── 01_lexical_error_char.ts         # Erro léxico
│       ├── 03_syntax_error_semicolon.ts     # Erro sintático
│       ├── semantic_01_use_before_init.ts   # Erro semântico
│       └── ...
├── outputs-ll/                   # LLVM IR gerado (.ll)
├── outputs-o/                    # Executáveis compilados
├── main-frontend.py              # Compilador front-end (análise apenas)
├── main.py                       # Compilador completo (front + back)
├── semantic_analyzer.py          # Analisador semântico
├── code_generator.py             # Gerador de código LLVM IR
├── run_tests.py                  # Testes front-end (todos)
├── run_tests_backend.py          # Testes backend (válidos)
└── README.md                     # Esta documentação
```

## Arquitetura do Analisador Semântico

### Tabela de Símbolos Hierárquica

O analisador semântico utiliza uma estrutura de **Tabela de Símbolos Hierárquica** para gerenciar escopos:

```python
class SymbolTable:
    """
    Tabela de símbolos com suporte a escopos hierárquicos
    """
    symbols: dict       # {nome: Symbol} - símbolos do escopo atual
    parent: SymbolTable # Referência ao escopo pai (None para global)
    scope_name: str     # Nome do escopo (para debug)
```

O analisador mantém uma lista `all_scopes` que rastreia todos os escopos criados durante a análise, permitindo a visualização completa da hierarquia de escopos no modo debug, mesmo após a saída dos escopos de função e bloco.

### Classe Symbol

Cada símbolo na tabela armazena informações completas:

```python
class Symbol:
    name: str           # Nome do identificador
    symbol_type: str    # Tipo: 'number', 'string', 'boolean', etc.
    is_const: bool      # True para const, False para let
    is_initialized: bool # Se já recebeu atribuição
    is_function: bool   # Se é uma função
    return_type: str    # Tipo de retorno (apenas funções)
    params: list        # Lista de parâmetros (apenas funções)
    line: int           # Linha de declaração (para mensagens de erro)
```

### Gerenciamento de Escopos

1. **Escopo Global**: Criado no início da análise, persiste durante toda a compilação
2. **Escopo de Função**: Criado ao entrar em declaração de função (nomeado `function_<nome>`)
3. **Escopo de Bloco**: Criado para blocos `{}`, `if`, `while`, `for`

A busca de símbolos é **hierárquica**: 
- Procura no escopo atual
- Se não encontrar, procura no escopo pai
- Continua recursivamente até o escopo global

A visualização da tabela de símbolos no modo debug mostra a hierarquia completa com indentação:
- Escopos filhos são indentados sob seus pais
- Parâmetros de função são declarados no escopo da função
- Variáveis locais permanecem isoladas em seus escopos

## Exemplos de Saída

### Compilação com Sucesso

```
=== Compilando: testes/valid/08_function.ts ===

[OK] Analise Lexica: SUCESSO
  Total de tokens: 45

[OK] Analise Sintatica: SUCESSO
  Árvore sintática gerada com sucesso!

=== Análise Semântica ===
[OK] Analise Semantica: SUCESSO
  Todas as verificações semânticas passaram!

==================================================
[SUCESSO] COMPILACAO CONCLUIDA COM SUCESSO!
==================================================
```

### Erro Semântico Detectado

```
=== Compilando: testes/invalid/semantic_01_use_before_init.ts ===

[OK] Analise Lexica: SUCESSO
  Total de tokens: 21

[OK] Analise Sintatica: SUCESSO
  Árvore sintática gerada com sucesso!

=== Análise Semântica ===

[ERRO] ERRO SEMANTICO detectado!

=== ERROS SEMÂNTICOS ===
  Erro semântico na linha 5: Variável 'x' está sendo usada antes 
  de ser inicializada (declarada na linha 4)
==================================================
```

### Erro de Tipo em Operação

```
=== Compilando: testes/invalid/semantic_06_wrong_operator_type.ts ===

[OK] Analise Lexica: SUCESSO
  Total de tokens: 24

[OK] Analise Sintatica: SUCESSO
  Árvore sintática gerada com sucesso!

=== Análise Semântica ===

[ERRO] ERRO SEMANTICO detectado!

=== ERROS SEMÂNTICOS ===
  Erro semântico na linha 5: Operador '+' requer operandos do tipo 'number', 
  mas o lado esquerdo é 'string'
==================================================
```

### Modo Debug

```bash
python main.py testes/valid/15_scope_functions.ts --debug
```

Mostra:
- Árvore sintática detalhada (impressão hierárquica da AST)
- Tabela de símbolos completa com todos os escopos
- Estrutura de escopos hierárquica (global, funções e blocos)
- Símbolos declarados em cada escopo com seus tipos e estados

Exemplo de saída com --debug:

```
=== Árvore Sintática ===
REGRA: program
  REGRA: statement
    REGRA: variableDecl
      TOKEN: let (tipo: LET)
      TOKEN: global (tipo: ID)
      ...

=== TABELA DE SÍMBOLOS ===
Escopo: global
  let global: number (initialized)
  Function teste(parametro: number): number
  let valor: number (initialized)
  Escopo: function_teste
    let parametro: number (initialized)
    let local: number (initialized)
    let resultado: number (initialized)
```

## Casos de Teste

### Testes Válidos (20 arquivos)

| Arquivo | Descrição |
|---------|-----------|
| `01_hello_world.ts` | Hello World básico |
| `02_declarations.ts` | Declarações let e const |
| `03_arithmetic.ts` | Operações aritméticas |
| `04_logical_ops.ts` | Operadores lógicos |
| `05_if_else.ts` | Estrutura if/else |
| `06_while.ts` | Loop while |
| `07_for.ts` | Loop for |
| `08_function.ts` | Funções com retorno |
| `09_void_function.ts` | Funções void |
| `10_arrays.ts` | Arrays e acesso |
| `11_math_functions.ts` | Funções Math |
| `12_type_conversion.ts` | parseInt/parseFloat |
| `13_complete_program.ts` | Programa completo |
| `14_scope_blocks.ts` | Escopos de bloco |
| `15_scope_functions.ts` | Escopos de função |
| `16_let_no_init_then_assign.ts` | let sem init |
| `17_teste.ts` | Programa de teste |
| `18_arrays_number.ts` | Arrays de números completo |
| `19_arrays_string.ts` | Arrays de strings completo |
| `20_arrays_functions.ts` | Arrays como parâmetros/retorno |

### Testes Inválidos (32 arquivos)

#### Erros Léxicos (2)
- `01_lexical_error_char.ts` - Caractere inválido
- `02_lexical_error_string.ts` - String malformada

#### Erros Sintáticos (10)
- `03_syntax_error_semicolon.ts` - Falta ponto-e-vírgula
- `04_syntax_error_no_type.ts` - Declaração sem tipo
- `05_syntax_error_paren.ts` - Parênteses desbalanceados
- `06_syntax_error_if.ts` - Estrutura if incompleta
- `07_syntax_error_function.ts` - Função malformada
- `08_syntax_error_array.ts` - Array malformado
- `09_syntax_error_while.ts` - While incompleto
- `10_syntax_error_for.ts` - For malformado
- `11_syntax_error_const.ts` - Const malformado
- `12_syntax_error_brace.ts` - Chaves desbalanceadas

#### Erros Semânticos (20)

**Erros gerais:**
- `semantic_01_use_before_init.ts` - Uso antes de inicialização
- `semantic_02_const_reassignment.ts` - Reatribuição de const
- `semantic_03_type_mismatch.ts` - Tipos incompatíveis
- `semantic_04_undeclared_variable.ts` - Variável não declarada
- `semantic_05_redeclaration.ts` - Redeclaração de variável
- `semantic_06_wrong_operator_type.ts` - Operador em tipo errado
- `semantic_07_const_no_init.ts` - Const sem inicialização
- `semantic_08_return_type_mismatch.ts` - Retorno incompatível
- `semantic_09_wrong_arg_count.ts` - Número errado de argumentos
- `semantic_10_wrong_arg_type.ts` - Tipo errado de argumento
- `semantic_11_if_not_boolean.ts` - Condição não-booleana
- `semantic_12_void_return_value.ts` - Void retornando valor

**Erros específicos de arrays:**
- `semantic_13_array_type_mismatch.ts` - Atribuir array de tipo incompatível
- `semantic_14_array_element_type.ts` - Tipo errado em elemento de array
- `semantic_15_array_index_not_number.ts` - Índice de array não numérico
- `semantic_16_array_wrong_init_type.ts` - Inicializar array com tipo errado
- `semantic_17_array_function_param_mismatch.ts` - Array de tipo errado como parâmetro
- `semantic_18_length_on_non_array.ts` - Usar .length em não-array
- `semantic_19_array_access_on_non_array.ts` - Acessar índice em não-array
- `semantic_20_array_return_type_mismatch.ts` - Retornar array de tipo errado

## Uso Didático

Este compilador foi desenvolvido para fins educacionais na disciplina de **Compiladores**. A estrutura do código é **didática e bem comentada**, facilitando o entendimento de:

- Como funcionam as três fases de compilação (léxica, sintática, semântica)
- Implementação de tabelas de símbolos hierárquicas
- Gerenciamento de escopos com estruturas de dados simples (dicionários)
- Verificação de tipos estática
- Uso do padrão **Visitor** do ANTLR4 para análise semântica
- Tratamento e reporte de erros em cada fase
- Inferência e propagação de tipos através da árvore sintática

## Autores

[Gabriel Lopes](https://github.com/G4brielLB)
[José Victor](https://github.com/vickminari)
[Pedro Emanuel](https://github.com/PedroEmanuelMoreiraCarvalho)

Desenvolvido como parte do Trabalho Final da disciplina de Compiladores - UFPI

## Licença

Este projeto é de código aberto para fins educacionais.
