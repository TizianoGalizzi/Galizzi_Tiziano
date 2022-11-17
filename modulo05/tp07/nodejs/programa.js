var sumar =(num1,num2)=>{
    resultado = num1+num2;
    console.log("el resultado de la suma es: " + resultado);
};

var multiplicar = (num1,num2)=>{
    resultado = num1 * num2;
    console.log("El resultado de la multiplicacion es : " +resultado);
}

// al exportar un objeto json, nos permite utilizar las distintas
// propiedades en su interior, las cuales pueden tener como valor
// funciones, como es el caso de la operacion de sumar
module.exports = {
    "sumar": sumar,
    "multiplicar": multiplicar
}

