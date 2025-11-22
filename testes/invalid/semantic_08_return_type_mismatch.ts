// Erro Semântico: Tipo de retorno incompatível
// Deve gerar erro: função retorna tipo diferente do declarado

function getAge(): number {
    return "25";  // ERRO: esperado number, recebeu string
}

let idade: number = getAge();
console.log(idade);
