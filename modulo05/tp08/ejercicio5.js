//capaz de leer el archivo departamentos.json.
// Luego recorrer e imprimir nombre + puesto de los empleados de tecnologia.

const fs = require("fs");

var JsonData = fs.readFileSync("./departamentos.json");

var departamentos = JSON.parse(JsonData); 
/*
var getEmpleado = function (array, puesto){
    for(i=0; i<array[puesto].length ; i++){
        if(array[puesto][i]['empleados']){
            for(c=0; c<array[puesto][i]['empleados'].length; c++){
                console.log(array[puesto]['empleados'][c]['nombre'] + ' ' + array[puesto]['empleados'][c]['puesto']);
           }
        }
   //     if(array['tecnologia'][i] === array['tecnologia'][i]['empleados']){

        //}    
     
        
                
    };
}
*/
var getEmpleado = function (array, dep){ //dep = departamento
    for(i=0; i<array[dep].length; i++){
        console.log(array[dep][i]['nombre'] + ' ' + array[dep][i]["puesto"]);
    }
}

getEmpleado(departamentos, "tecnologia");


