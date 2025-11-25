// Teste de arrays como parâmetros e retorno de funções

function somarArray(valores: number[]): number {
    let total: number = 0;
    for (let i: number = 0; i < valores.length; i = i + 1) {
        total = total + valores[i];
    }
    return total;
}

function criarArray(): number[] {
    let arr: number[] = [10, 20, 30];
    return arr;
}

let meuArray: number[] = [5, 10, 15, 20];
let resultado: number = somarArray(meuArray);

let novoArray: number[] = criarArray();
let soma: number = somarArray(novoArray);

console.log("Resultado:", resultado);
console.log("Soma do novo array:", soma);
