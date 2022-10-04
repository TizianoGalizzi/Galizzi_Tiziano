//EJERCICIO 4
function par_impar(num){
    if(num % 2 == 0){
        alert("El numero ingresado es par");
    }
    if(num % 2 !== 0){
        alert("El numero ingresado es impar");
    }
}

num = prompt("Ingrese un numero"); //se pide un numero, el cual sera asignado a la variable num, que a su vez es el parametro de la funcion
par_impar(num); //invocamos a la funcion, la cual en su contenido tiene alerts dependiendo del caso
