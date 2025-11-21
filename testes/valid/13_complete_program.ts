// Exemplo 13: Programa completo - Cálculo de média
function calcularMedia(n1: number, n2: number, n3: number): number {
    let soma: number = n1 + n2 + n3;
    let media: number = soma / 3;
    return media;
}

function verificarAprovacao(media: number): void {
    if (media >= 7) {
        console.log("Aprovado! Média:", media);
    } else {
        if (media >= 5) {
            console.log("Recuperação! Média:", media);
        } else {
            console.log("Reprovado! Média:", media);
        }
    }
}

let nota1: number = 8.5;
let nota2: number = 7.0;
let nota3: number = 9.0;

let mediaFinal: number = calcularMedia(nota1, nota2, nota3);
verificarAprovacao(mediaFinal);
