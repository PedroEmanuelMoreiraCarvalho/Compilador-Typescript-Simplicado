// Erro Semântico: Uso de variável antes de atribuição
// Deve gerar erro: variável 'x' usada antes de ser inicializada

let x: number;
let y: number = x + 10;  // ERRO: x não foi inicializada

console.log(y);
