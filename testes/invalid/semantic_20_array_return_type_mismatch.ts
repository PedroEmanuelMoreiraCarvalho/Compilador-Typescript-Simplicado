// Erro: Retornar array do tipo errado

function criarNumeros(): number[] {
    let palavras: string[] = ["um", "dois", "três"];
    return palavras;  // ERRO: esperado number[], mas retorna string[]
}

let arr: number[] = criarNumeros();
console.log(arr[0]);
