// Teste de escopo: variáveis em blocos diferentes
// Este programa deve compilar com sucesso

let x: number = 10;

if (x > 5) {
    let y: number = 20;  // y existe apenas neste bloco
    console.log(x);  // x visível aqui (escopo pai)
    console.log(y);
}

// y não é mais visível aqui
let y: number = 30;  // OK: y diferente do bloco if
console.log(x);
console.log(y);
