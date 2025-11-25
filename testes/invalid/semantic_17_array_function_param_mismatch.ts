// Erro: Passar array do tipo errado para função

function processarNumeros(valores: number[]): number {
    let soma: number = 0;
    for (let i: number = 0; i < valores.length; i = i + 1) {
        soma = soma + valores[i];
    }
    return soma;
}

let palavras: string[] = ["a", "b", "c"];
let resultado: number = processarNumeros(palavras);  // ERRO: esperado number[], recebeu string[]

console.log(resultado);
