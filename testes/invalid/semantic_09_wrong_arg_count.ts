// Erro Semântico: Número incorreto de argumentos
// Deve gerar erro: chamada de função com número errado de argumentos

function soma(a: number, b: number): number {
    return a + b;
}

let resultado: number = soma(10);  // ERRO: falta argumento
console.log(resultado);
