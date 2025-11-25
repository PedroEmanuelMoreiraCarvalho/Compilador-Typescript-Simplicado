// Teste completo com arrays de strings

let nomes: string[] = ["Ana", "Bruno", "Carlos"];
let frutas: string[] = ["maçã", "banana", "laranja", "uva"];

// Acesso por índice
let primeiroNome: string = nomes[0];
let segundaFruta: string = frutas[1];

// Atribuição de elementos
nomes[1] = "Beatriz";
frutas[0] = "abacaxi";

// Usar length
let totalNomes: number = nomes.length;
let totalFrutas: number = frutas.length;

console.log("Primeiro nome:", primeiroNome);
console.log("Total de nomes:", totalNomes);
console.log("Total de frutas:", totalFrutas);
