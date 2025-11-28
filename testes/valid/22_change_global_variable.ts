let flag : boolean = true;

function alterarFlag() : void {
    if (flag) {
        flag = false;
    } else {
        flag = true;
    }
}

console.log("Valor inicial da flag:", flag);
alterarFlag();
console.log("Valor da flag após alteração:", flag);
alterarFlag();
console.log("Valor da flag após segunda alteração:", flag);