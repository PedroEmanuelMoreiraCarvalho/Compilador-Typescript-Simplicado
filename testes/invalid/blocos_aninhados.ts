// funções aninhadas em TypeScript (é pra dar erro)
function externa(x: number): number {
    let y: number = 10; // Erro: conflito de nomes
    function externa(y: number): number {
        return x + y;
    }
    return externa(x * 2);
}

let resultado: number = externa(5);
console.log(resultado);