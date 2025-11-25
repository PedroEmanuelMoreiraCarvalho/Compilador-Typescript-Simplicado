// Erro: Usar .length em variável que não é array

let numero: number = 42;

let tamanho: number = numero.length;  // ERRO: .length só funciona em arrays

console.log(tamanho);
