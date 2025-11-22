// Erro Semântico: Const sem inicialização
// Deve gerar erro: constante deve ser inicializada

const MAX: number;  // ERRO: const deve ter valor inicial

MAX = 100;
console.log(MAX);
