// Erro Semântico: Redeclaração de variável no mesmo escopo
// Deve gerar erro: variável já foi declarada

let x: number = 10;
let x: string = "teste";  // ERRO: 'x' já foi declarada

console.log(x);
