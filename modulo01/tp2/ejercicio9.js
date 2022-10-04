//CONSIGNA: Crear un programa que recibe las notas de un alumno, todos los números deben ser naturales <11. Debe calcular el promedio. 
//Por último imprimir en pantalla si el valor de media es < 5 “Reprobado”,  entre 6 y 8 “Aprobado” y si es mayor a 8 “Sobresaliente”

cant = prompt("Ingrese la cantidad de notas a promediar");
var promedio = 0;
var notas = 0;
for (var i= 1; i<=cant ; i++){
    
    notas=prompt("Ingrese nota " +i); //pedimos las notas al usuario y se almacenan a modo de string.
    if(notas>10 || notas<0){
        while (notas>10 || notas<0){ //Si el usuario ingresa un numero no valido (0< o  >10), ingresara a un bucle while donde tendra que poner una nota mayor que 0 y menor que 10 para continuar
            notas=prompt("Ingrese nota " +i); 
        }
    }
    notas = parseInt(notas); //convertimos las notas del tipo string a number utilizando la funcion parseInt()
    if(notas<=10 || notas>=0){
     promedio = notas + promedio; //se suman todas las notas
    }
    
}

promedio = promedio/cant;

if (promedio<5){
    alert("Reprobado");
}
if (promedio>=6 && promedio<=8){
    alert("Aprobado");
}else{
    alert("Sobresaliente");
}