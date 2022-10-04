//EJERCICIO 3
var factor= 0;
document.write("Calculador de factoriales");
num = prompt("Ingrese un numero"); // se le pide al usuario que ingrese un numero
for (i=1; i<num ; i++){
    if(i == 1){ //con el if en esta linea se pretende establecer el punto de inicio a calcular del factorial, al asignarle a factor el valor del numero deseado (num)
    factor = num;
    factor = factor*i;
    }
    factor = factor*i; 
}

alert( "<br>" + "El factorial de " + num + " es " + factor);