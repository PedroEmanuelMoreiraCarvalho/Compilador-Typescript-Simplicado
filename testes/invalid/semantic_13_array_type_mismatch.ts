// Erro: Tentar atribuir array de strings a variável de array de números

let numeros: number[] = [1, 2, 3];
let palavras: string[] = ["um", "dois", "três"];

numeros = palavras;  // ERRO: tipo incompatível
