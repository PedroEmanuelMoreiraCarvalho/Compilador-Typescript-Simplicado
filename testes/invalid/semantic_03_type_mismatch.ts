// Erro Semântico: Tipo incompatível na atribuição
// Deve gerar erro: tentativa de atribuir string a number

let idade: number = 25;
idade = "vinte e cinco";  // ERRO: tipo incompatível

console.log(idade);
