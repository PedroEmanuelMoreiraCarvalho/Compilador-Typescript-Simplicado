// Erro: Usar tipo não-numérico como índice de array

let valores: number[] = [10, 20, 30];
let texto: string = "abc";

let elemento: number = valores[texto];  // ERRO: índice deve ser number
