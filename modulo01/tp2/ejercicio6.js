//EJERCICIO 6
//CONSIGNA: Escribir un script que muestre la posición de la primera vocal de un texto introducido por teclado.Por ejemplo: perro = “e” es la letra Nº2 ; árbol = “a” es la letra Nº1.

txt = prompt("Ingrese un texto");
var vocales = ["a", "e", "i","o","u"];

for (i= 0; i < txt.length ; i++){ //"for loop main"; recorre la palabra ingresada por teclado
    for(cont = 0; cont<5; cont++){ //recorre letra por letra la palabra ingresada y la compara con las distintas vocales del array "vocales[]"
        if(vocales[cont] === txt[i]){   
          alert(txt + "=" +  vocales[cont]  + "  es la letra Nº" + (i+1)); //al encontrar la coincidencia, muestra en pantalla la posicion de la vocal en la palabra.
          var brek = 1; //contador brek para romper con el for loop main 
            break; //break para que no siga viendo por otras vocales que no fueran la primera coincidencia.
             
        }
if (brek == 1){ //condicion if que permite romper con el bucle y dejar de analizar la palabra completa
    break;  
}
    }
}