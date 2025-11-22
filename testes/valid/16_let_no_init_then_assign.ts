// Teste: let sem inicialização mas com atribuição antes de uso
// Este programa deve compilar com sucesso

let x: number;
x = 10;  // Atribui antes de usar

let y: number = x + 5;  // OK: x já foi inicializada
console.log(y);
