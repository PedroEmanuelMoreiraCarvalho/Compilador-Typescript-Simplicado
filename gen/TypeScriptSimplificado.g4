grammar TypeScriptSimplificado;

// ============================================================
// REGRAS DO PARSER
// ============================================================

// Ponto de entrada do programa
program
    : (statement | functionDecl)* EOF
    ;

// ============================================================
// DECLARAÇÕES DE FUNÇÕES
// ============================================================

functionDecl
    : FUNCTION ID LPAREN paramList? RPAREN COLON returnType block
    ;

returnType
    : typeAnnotation
    | VOID
    ;

paramList
    : param (COMMA param)*
    ;

param
    : ID COLON typeAnnotation
    ;

// ============================================================
// TIPOS
// ============================================================

typeAnnotation
    : NUMBER                                    # numberType
    | STRING                                    # stringType
    | BOOLEAN                                   # booleanType
    | NUMBER LBRACK RBRACK                      # numberArrayType
    | STRING LBRACK RBRACK                      # stringArrayType
    ;

// ============================================================
// STATEMENTS (SENTENÇAS)
// ============================================================

statement
    : variableDecl SEMI                         # varDeclStmt
    | assignmentStmt SEMI                       # assignStmt
    | ifStatement                               # ifStmt
    | whileStatement                            # whileStmt
    | forStatement                              # forStmt
    | returnStatement SEMI                      # retStmt
    | consoleLogStmt SEMI                       # consoleStmt
    | expressionStmt SEMI                       # exprStmt
    | block                                     # blockStmt
    ;

block
    : LBRACE statement* RBRACE
    ;

// ============================================================
// DECLARAÇÕES DE VARIÁVEIS E CONSTANTES
// ============================================================

variableDecl
    : LET ID COLON typeAnnotation (ASSIGN expression)?       # letDecl
    | CONST ID COLON typeAnnotation ASSIGN expression        # constDecl
    ;

// ============================================================
// ATRIBUIÇÃO
// ============================================================

assignmentStmt
    : lvalue ASSIGN expression
    ;

lvalue
    : ID                                        # idLvalue
    | ID LBRACK expression RBRACK               # arrayAccessLvalue
    | ID DOT LENGTH                             # lengthAccessLvalue
    ;

// ============================================================
// ESTRUTURAS DE CONTROLE
// ============================================================

ifStatement
    : IF LPAREN expression RPAREN statement (ELSE statement)?
    ;

whileStatement
    : WHILE LPAREN expression RPAREN statement
    ;

forStatement
    : FOR LPAREN forInit? SEMI expression? SEMI forUpdate? RPAREN statement
    ;

forInit
    : variableDecl
    | assignmentStmt
    ;

forUpdate
    : assignmentStmt
    ;

returnStatement
    : RETURN expression?
    ;

consoleLogStmt
    : CONSOLE DOT LOG LPAREN expressionList? RPAREN
    ;

expressionStmt
    : expression
    ;

// ============================================================
// EXPRESSÕES
// ============================================================

expressionList
    : expression (COMMA expression)*
    ;

// Precedência de operadores (do menor para o maior):
// ||  (OR lógico)
// &&  (AND lógico)
// ==, !=  (igualdade)
// <, >, <=, >=  (comparação)
// +, -  (aditivo)
// *, /, %  (multiplicativo)
// **  (potência)
// !, - (unários)
// primários

expression
    : logicalOrExpr
    ;

logicalOrExpr
    : logicalOrExpr OR logicalAndExpr           # orExpr
    | logicalAndExpr                            # orPass
    ;

logicalAndExpr
    : logicalAndExpr AND equalityExpr           # andExpr
    | equalityExpr                              # andPass
    ;

equalityExpr
    : equalityExpr EQ relationalExpr            # eqExpr
    | equalityExpr NEQ relationalExpr           # neqExpr
    | relationalExpr                            # eqPass
    ;

relationalExpr
    : relationalExpr GT additiveExpr            # gtExpr
    | relationalExpr LT additiveExpr            # ltExpr
    | relationalExpr GE additiveExpr            # geExpr
    | relationalExpr LE additiveExpr            # leExpr
    | additiveExpr                              # relPass
    ;

additiveExpr
    : additiveExpr PLUS multiplicativeExpr      # addExpr
    | additiveExpr MINUS multiplicativeExpr     # subExpr
    | multiplicativeExpr                        # addPass
    ;

multiplicativeExpr
    : multiplicativeExpr TIMES powerExpr        # mulExpr
    | multiplicativeExpr DIV powerExpr          # divExpr
    | multiplicativeExpr MOD powerExpr          # modExpr
    | powerExpr                                 # mulPass
    ;

powerExpr
    : unaryExpr POW powerExpr                   # powExpr
    | unaryExpr                                 # powPass
    ;

unaryExpr
    : NOT unaryExpr                             # notExpr
    | MINUS unaryExpr                           # negExpr
    | primaryExpr                               # unaryPass
    ;

primaryExpr
    : literal                                   # literalExpr
    | ID                                        # idExpr
    | ID LBRACK expression RBRACK               # arrayAccessExpr
    | ID DOT LENGTH                             # lengthExpr
    | functionCall                              # funcCallExpr
    | mathFunctionCall                          # mathFuncCallExpr
    | conversionFunctionCall                    # convFuncCallExpr
    | arrayLiteral                              # arrayLitExpr
    | LPAREN expression RPAREN                  # parenExpr
    ;

// ============================================================
// LITERAIS
// ============================================================

literal
    : NUMBER_LITERAL                            # numberLiteral
    | STRING_LITERAL                            # stringLiteral
    | TRUE                                      # trueLiteral
    | FALSE                                     # falseLiteral
    ;

arrayLiteral
    : LBRACK expressionList? RBRACK
    ;

// ============================================================
// CHAMADAS DE FUNÇÃO
// ============================================================

functionCall
    : ID LPAREN argumentList? RPAREN
    ;

argumentList
    : expression (COMMA expression)*
    ;

// Funções Math
mathFunctionCall
    : MATH DOT SQRT LPAREN expression RPAREN    # mathSqrtCall
    | MATH DOT POWFUNC LPAREN expression COMMA expression RPAREN  # mathPowCall
    ;

// Funções de conversão
conversionFunctionCall
    : PARSEINT LPAREN expression RPAREN         # parseIntCall
    | PARSEFLOAT LPAREN expression RPAREN       # parseFloatCall
    ;

// ============================================================
// REGRAS LÉXICAS (TOKENS)
// ============================================================

// Palavras-chave
LET         : 'let';
CONST       : 'const';
FUNCTION    : 'function';
RETURN      : 'return';
IF          : 'if';
ELSE        : 'else';
WHILE       : 'while';
FOR         : 'for';

// Tipos
NUMBER      : 'number';
STRING      : 'string';
BOOLEAN     : 'boolean';
VOID        : 'void';

// Valores booleanos
TRUE        : 'true';
FALSE       : 'false';

// Funções nativas
CONSOLE     : 'console';
LOG         : 'log';
MATH        : 'Math';
SQRT        : 'sqrt';
POWFUNC     : 'pow';
PARSEINT    : 'parseInt';
PARSEFLOAT  : 'parseFloat';

// Propriedades
LENGTH      : 'length';

// Operadores
ASSIGN      : '=';
PLUS        : '+';
MINUS       : '-';
TIMES       : '*';
DIV         : '/';
MOD         : '%';
POW         : '**';
EQ          : '==';
NEQ         : '!=';
GT          : '>';
LT          : '<';
GE          : '>=';
LE          : '<=';
AND         : '&&';
OR          : '||';
NOT         : '!';

// Delimitadores
LPAREN      : '(';
RPAREN      : ')';
LBRACK      : '[';
RBRACK      : ']';
LBRACE      : '{';
RBRACE      : '}';
SEMI        : ';';
COMMA       : ',';
DOT         : '.';
COLON       : ':';

// Identificadores
ID          : [a-zA-Z_][a-zA-Z_0-9]*;

// Literais numéricos (inteiros e ponto flutuante)
NUMBER_LITERAL
    : [0-9]+ ('.' [0-9]+)?
    | [0-9]+ '.' [0-9]+
    ;

// Literais de string (aspas duplas ou simples)
STRING_LITERAL
    : '"' (~["\\\r\n] | '\\' .)* '"'
    | '\'' (~['\\\r\n] | '\\' .)* '\''
    ;

// Espaços em branco e comentários
WS          : [ \t\r\n]+ -> skip;

// Comentários de linha
LINE_COMMENT
    : '//' ~[\r\n]* -> skip;

// Comentários de bloco
BLOCK_COMMENT
    : '/*' .*? '*/' -> skip;
