/*  1.	Determinar cuál de los elementos de texto es mayor, es decir el que contenga más letras.
    2.	Imprimir los elementos de menor a mayor cantidad de letras.
    3	Determinar el resultado de las cuatro operaciones matemáticas realizadas con los dos elementos numéricos.
*/

var verdadero, char;
var valores = [verdadero, false, 2, "hola",
"mundo", 3, char];
var stringArray = []; //declaramos array para strings
for (var i=1; i<valores.length; i++){
    if( typeof valores[i] === "string"){ //En el if, se evalua el tipo de dato del array valores. En caso de coincidir, el elemento de texto es añadido a un nuevo array solo de elementos de texto
        stringArray.push(valores[i]);
    }
}
//2.
document.write("Elementos de menor a mayor cantidad de letras: " + stringArray.sort(function(a,b){return a.length - b.length})); //Metodo .sort que compara el valor a y b y los ordena en consecuencia.
//De querer invertir el sentido del ordenamiento, habria que cambiar de posicion la a con la b.


