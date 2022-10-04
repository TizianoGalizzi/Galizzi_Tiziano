//CONSIGNA: Crea una función que genere 100 números aleatorios entre 1 y 100 que no se repitan y luego imprima por pantalla usando document.write(text).
    //************Incompleto************ (no supe como establecer la condicion para que no se repitiera el numero aleatorio)
function random(){
    var numbers = [];
    var lengt = 0;
    for (var i = 1; i<=100; i++){
        random_num = Math.floor(Math.random() * 100) + 1;
        for(var cont = 0; cont<=lengt; cont++){
            while (random_num == numbers[cont]){
                    random_num = Math.floor(Math.random() * 100) + 1;    
            }
                numbers.push(random_num);

          


        }
        lengt = lengt +1;
    }
    for(i=1; i<=100; i++){
    document.write( "Numero " +i + ": " + numbers[i] + "<br>");
    }

}
random();