//let b: number = 10;

function sub1(x: number): number { 
    let y : number = x + b; // Erro: 'b' não está definido neste escopo
    return y;
}

function sub2(): number {
    let b: number = 20;
    let z: number = b + 10;
    if (z > 25){
        b = b + 5;
        if (b > 30){
            z = z + 5;
        }
    }
    sub1(z);
    return z;
}

function main(): number {
    let b: number = 5;
    let result1: number = sub1(15);
    let result2: number = sub2();
    return result1 + result2;
}

const resultmain: number = main();
console.log(resultmain);