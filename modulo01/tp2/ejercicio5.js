//EJERCICIO 5
function distincion(txt){
    if (txt === txt.toUpperCase()){ //si el texto completo esta en mayuscula
        alert("EL texto esta formado solo por mayusculas");
    }
    if (txt === txt.toLowerCase()){ //si el texto completo esta en minuscula
        alert("EL texto esta formado solo por minusculas");
    }
    else{ //si no es ninguno de los anteriores entonces:
    var minus = 0; 
    var mayus = 0;
    for(i=0; i<txt.length ; i++){ //for loop que recorra el texto en la totalidad de sus caracteres
        if (txt[i] == txt[i].toUpperCase()){ //considerando al texto como un array de caracteres; compara cada caracter del texto para ver si es mayuscula o no.
            mayus = mayus+1;  //en caso de ser mayuscula el caracter comparado, al contador mayus se le añaden puntos
        }
        else{
             minus = minus +1 //si no es mayuscula, sera minuscula. Entonces, se suman puntos al contador minus
        }
    }
    if ((mayus>=1 && minus>=1)){  //Al finalizar el loop, se crea una condicion if, en el que ambos contadores deben ser mayores o iguales a 1 para considerarse como un texto formado por mayusculas y minusculas
        alert("El texto esta formado por mayusculas y minusculas")
    }
    }
}

txt = prompt("ingrese una cadena de texto");
distincion(txt);