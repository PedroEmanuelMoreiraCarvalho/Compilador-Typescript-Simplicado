// Erro Semântico: Função void retornando valor
// Deve gerar erro: função void não deve retornar valor

function imprimirMensagem(msg: string): void {
    return msg;  // ERRO: função void não deve retornar valor
}

imprimirMensagem("Olá");
