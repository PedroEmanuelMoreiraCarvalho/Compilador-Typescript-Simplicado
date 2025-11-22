// Erro Semântico: Reatribuição de constante
// Deve gerar erro: tentativa de modificar uma const

const PI: number = 3.14159;
console.log(PI);

PI = 3.14;  // ERRO: não pode reatribuir constante

console.log(PI);
