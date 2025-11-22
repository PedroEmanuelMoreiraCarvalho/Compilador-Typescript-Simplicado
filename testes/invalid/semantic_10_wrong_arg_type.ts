// Erro Semântico: Tipo de argumento incompatível
// Deve gerar erro: argumento de tipo incorreto

function cumprimentar(nome: string, idade: number): void {
    console.log("Olá", nome, "você tem", idade, "anos");
}

cumprimentar(25, "João");  // ERRO: argumentos invertidos
