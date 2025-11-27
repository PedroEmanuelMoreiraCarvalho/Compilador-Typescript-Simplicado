// Teste completo com arrays de strings

let nomes: string[] = ["Ana", "Bruno", "Carlos"];
let frutas: string[] = ["maçã", "banana", "laranja", "uva"];

// Acesso por índice
let primeiroNome: string = nomes[0];
let segundaFruta: string = frutas[1];

console.log("Segundo nome:", nomes[1]);
console.log("Primeira fruta:", frutas[0]);

// Atribuição de elementos
nomes[1] = "Beatriz";
frutas[0] = "abacaxi";

// Usar length
let totalNomes: number = nomes.length;
let totalFrutas: number = frutas.length;

console.log("Segundo nome atualizado:", primeiroNome[1]);
console.log("Primeira fruta atualizada:", frutas[0])
console.log("Total de nomes:", totalNomes);
console.log("Total de frutas:", totalFrutas);
