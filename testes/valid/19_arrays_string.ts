// Teste completo com arrays de strings

let nomes: string[] = ["Ana", "Bruno", "Carlos"];
let frutas: string[] = ["maçã", "banana", "laranja", "uva"];

// Acesso por índice
let segundoNome: string = nomes[1];
let primeiraFruta: string = frutas[0];

console.log("Segundo nome:", segundoNome);
console.log("Primeira fruta:", primeiraFruta);

// Atribuição de elementos
nomes[1] = "Beatriz";
frutas[0] = "abacaxi";

// Usar length
let totalNomes: number = nomes.length;
let totalFrutas: number = frutas.length;

console.log("Segundo nome atualizado:", nomes[1]);
console.log("Primeira fruta atualizada:", frutas[0]);
console.log("Total de nomes:", totalNomes);
console.log("Total de frutas:", totalFrutas);
