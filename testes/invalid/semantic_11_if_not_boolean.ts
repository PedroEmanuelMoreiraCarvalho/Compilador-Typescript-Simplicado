// Erro Semântico: Condição if não é booleana
// Deve gerar erro: condição deve ser do tipo boolean

let x: number = 10;

if (x) {  // ERRO: x é number, não boolean
    console.log("OK");
}
