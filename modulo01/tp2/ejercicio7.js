//CONSIGNA: Escribir una función que reciba un texto y lo devuelva al revés.
function reverse(txt){
//ej: hola
var texto = txt; //"texto" es una copia de txt, que servira como referencia a la hora de reemplazar caracteres entre cada uno e invertir la palabra original

var cont = -1; //cont servira para indicar la posicion de la copia, comienza en -1 para ir a la par que el recorrido
for (var i= txt.length; i>-1 ; i-- ){ //i = cantidad de caracteres de "hola" (4) como los arrays comienzan en 0, el array de "hola" va de 0-3. Por lo que en la condicion ira -1 para que el for loop permita que se reemplacen todos los caracteres
    
    txt = txt.replace(txt[i],texto[cont]); //reemplaza el ultimo valor de hola txt(3-0) con el primer valor de hola texto(0-3) 
    cont = cont +1;
    
};
document.write(txt); 

}
txt = prompt("Ingrese un texto para devolverlo al reves.");
reverse(txt)//aca invocamos a la funcion reverse()
