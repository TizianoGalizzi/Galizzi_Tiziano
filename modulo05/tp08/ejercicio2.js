//REQUIRE
const jsonDataRAW = require("../tp07/personas.json");

 console.log(jsonDataRAW); // si realizamos un console.log del jsonDataRAW, este nos devolvera un objeto tal como queriamos en un principio
 console.log(JSON.stringify(jsonDataRAW)); // JSON.stringify convierte el contenido del objeto JSON a string
// console.log(JSON.parse(jsonDataRAW)); // JSON.parse convierte contenido de string a JSON, pero al ser ya un objeto, nos suelta un SintaxError
console.log(JSON.parse(JSON.stringify(jsonDataRAW))) // en esta linea, nos aseguramos que el contenido sea un string, para que la funcion .parse funcione correctamente
// y no de error al tratar de convertir en JSON informacion que ya es un objeto. Con esto comprobamos entonces que un JSON.parse no puede realizarse sobre un valor
// que ya es un objeto


