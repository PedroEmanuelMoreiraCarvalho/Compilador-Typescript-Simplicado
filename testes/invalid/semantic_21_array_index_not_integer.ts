const arr : number[] = [10, 20, 30];

// Tentando acessar o array com um índice não inteiro
console.log(arr["1.5"]); // undefined

// Tentando atribuir usando índice não inteiro
arr[2.7] = 40;
console.log(arr[parseInt(2.7)]); // 40, mas não é um índice válido de array

// Tentando acessar usando uma string não numérica
console.log(arr["foo"]); // undefined