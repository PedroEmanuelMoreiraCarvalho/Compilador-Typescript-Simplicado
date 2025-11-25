// Teste de escopo: variáveis em funções
// Este programa deve compilar com sucesso

let global: number = 100;

function teste(parametro: number): number {
    let local: number = 10;
    
    // Acessa variável global
    let resultado: number = global + local + parametro;
    
    if(global > 50){
        let cinco: number = 5;
        if(global < 100){
            resultado = resultado + cinco;
        }
        resultado = resultado + cinco;
    }

    return resultado;
}

let valor: number = teste(5);
console.log(valor);

// local e parametro não são visíveis aqui
console.log(global);
