# Compilador TypeScript Simplificado

Compilador completo para a linguagem TypeScript Simplificado, desenvolvido com ANTLR4 e Python. Implementa as três fases principais de um front-end de compilador: análise léxica, sintática e semântica.

## Características

### Análise Léxica
- Tokenização completa da linguagem
- Identificação de palavras-chave, operadores e literais
- Detecção de caracteres inválidos com número de linha

### Análise Sintática  
- Parser gerado pelo ANTLR4
- Verificação de estrutura gramatical
- Detecção de erros sintáticos com número de linha e coluna

### Análise Semântica
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
- **Operadores tipados**: Verificação de tipos em operações aritméticas, lógicas e de comparação
- **Estruturas de controle**: Verificação de tipos em condições (`if`, `while`)

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
```

### Verificar instalação

```bash
python -c "import antlr4; print('✓ ANTLR4 instalado com sucesso!')"
```

## Como Usar

### Executando o Compilador

**Sintaxe básica:**
```bash
python main.py <arquivo.ts>
```

**Com modo debug (mostra tabela de símbolos e árvore sintática):**
```bash
python main.py <arquivo.ts> --debug
# ou
python main.py <arquivo.ts> -d
```

### Exemplos de Uso

```bash
# Compilar programa válido
python main.py testes/valid/01_hello_world.ts

# Compilar programa com erro semântico
python main.py testes/invalid/semantic_01_use_before_init.ts

# Compilar com informações de debug
python main.py testes/valid/08_function.ts --debug
```

### Executando Todos os Testes

```bash
python run_tests.py
```

Este script executa automaticamente todos os casos de teste (válidos e inválidos) e gera um relatório completo de resultados.

## Estrutura do Projeto

```
.
├── gen/                          # Arquivos gerados pelo ANTLR
│   ├── TypeScriptSimplificado.g4
│   ├── TypeScriptSimplificadoLexer.py
│   ├── TypeScriptSimplificadoParser.py
│   └── TypeScriptSimplificadoListener.py
├── testes/
│   ├── valid/                    # 16 programas válidos
│   │   ├── 01_hello_world.ts
│   │   ├── 08_function.ts
│   │   ├── 14_scope_blocks.ts
│   │   └── ...
│   └── invalid/                  # 24 programas com erros
│       ├── 01_lexical_error_char.ts         # Erro léxico
│       ├── 03_syntax_error_semicolon.ts     # Erro sintático
│       ├── semantic_01_use_before_init.ts   # Erro semântico
│       └── ...
├── main.py                       # Compilador principal
├── semantic_analyzer.py          # Analisador semântico
├── run_tests.py                  # Script de testes automatizado
├── README.md                     # Esta documentação
└── docs/
    └── typescript-simplificado-spec.md  # Especificação da linguagem
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
2. **Escopo de Função**: Criado ao entrar em declaração de função
3. **Escopo de Bloco**: Criado para blocos `{}`, `if`, `while`, `for`

A busca de símbolos é **hierárquica**: 
- Procura no escopo atual
- Se não encontrar, procura no escopo pai
- Continua recursivamente até o escopo global

## Exemplos de Saída

### Compilação com Sucesso

```
=== Compilando: testes/valid/08_function.ts ===

✓ Análise Léxica: SUCESSO
  Total de tokens: 45

✓ Análise Sintática: SUCESSO
  Árvore sintática gerada com sucesso!

=== Análise Semântica ===
✓ Análise Semântica: SUCESSO
  Todas as verificações semânticas passaram!

==================================================
✅ COMPILAÇÃO CONCLUÍDA COM SUCESSO!
==================================================
```

### Erro Semântico Detectado

```
=== Compilando: testes/invalid/semantic_01_use_before_init.ts ===

✓ Análise Léxica: SUCESSO
  Total de tokens: 21

✓ Análise Sintática: SUCESSO
  Árvore sintática gerada com sucesso!

=== Análise Semântica ===

❌ ERRO SEMÂNTICO detectado!

=== ERROS SEMÂNTICOS ===
  Erro semântico na linha 5: Variável 'x' está sendo usada antes 
  de ser inicializada (declarada na linha 4)
==================================================
```

### Modo Debug

```bash
python main.py testes/valid/15_scope_functions.ts --debug
```

Mostra:
- Tabela de símbolos completa
- Estrutura de escopos
- Árvore sintática detalhada

## Casos de Teste

### Testes Válidos (16 arquivos)

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

### Testes Inválidos (24 arquivos)

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

#### Erros Semânticos (12)
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

## Especificação da Linguagem

Para detalhes completos sobre a sintaxe e semântica da linguagem, consulte:

```
docs/typescript-simplificado-spec.md
```

## Uso Didático

Este compilador foi desenvolvido para fins educacionais na disciplina de **Compiladores**. A estrutura do código é **didática e bem comentada**, facilitando o entendimento de:

- Como funcionam as três fases de compilação (léxica, sintática, semântica)
- Implementação de tabelas de símbolos hierárquicas
- Gerenciamento de escopos com estruturas de dados simples (dicionários)
- Verificação de tipos estática
- Uso do padrão Visitor/Listener do ANTLR4
- Tratamento e reporte de erros em cada fase

## Autores

Desenvolvido como parte do Trabalho Final da disciplina de Compiladores - UFPI

## Licença

Este projeto é de código aberto para fins educacionais.
