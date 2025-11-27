// Exemplo 10: Arrays
let numeros: number[] = [1, 2, 3, 4, 5];
let nomes: string[] = ["Ana", "Bruno", "Carlos"];

let primeiro: number = numeros[0];
let tamanho: number = numeros.length;

console.log("Primeiro:", primeiro);
console.log("Tamanho:", tamanho);

console.log("Terceiro número:", numeros[2]);
console.log("Primeiro nome:", nomes[0]);

numeros[2] = 10;
nomes[0] = "Alice";

console.log("Terceiro número atualizado:", numeros[2]);
console.log("Primeiro nome atualizado:", nomes[0]);