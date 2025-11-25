// Teste completo com arrays de números

let numeros: number[] = [1, 2, 3, 4, 5];
let soma: number = 0;

// Acesso por índice
let primeiro: number = numeros[0];
let ultimo: number = numeros[4];

// Atribuição de elementos
numeros[2] = 10;

// Loop com array
for (let i: number = 0; i < numeros.length; i = i + 1) {
    soma = soma + numeros[i];
}

console.log("Soma dos elementos:", soma);
console.log("Tamanho do array:", numeros.length);
