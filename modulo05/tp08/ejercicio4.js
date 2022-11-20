const fs = require("fs");
var personasJSON = fs.readFileSync("./personas.json", "utf-8");

var persona = JSON.parse(personasJSON);
var getNombre = function (array){ // ponemos array o cualquier nombre de variable para volver dinamica a la funcion
    for(i=0; i<array['personas'].length; i++){ // recorre todos el objeto persona y el array de 5 objetos en su interior
        if(array['personas'][i]['localidad'] === "Posadas"){ 
            console.log(array['personas'][i]['nombre'] + ' ' + array['personas'][i]["apellido"]);
        }
    };
}
//llamando a la funcion getNombre
getNombre(persona);





