// Erro Semântico: Operador aplicado a tipo incorreto
// Deve gerar erro: operador aritmético aplicado a string

let nome: string = "João";
let resultado: number = nome + 10;  // ERRO: '+' requer operandos numéricos

console.log(resultado);
