//READFILESYNC
const fs = require("fs");
var rawdata = fs.readFileSync("../tp07/personas.json", "utf-8"); //accediendo al objeto JSON en el directorio del tp07

 
console.log(rawdata); // Logueamos rawdata tal como fue leido (esto nos devuelve el objeto como string)

//readFileSync devuelve la informacion en string.

console.log(JSON.stringify(rawdata));// convierte la informacion del objeto JSON en string... al intentar volver string un valor que ya es un string, nos suelta otro string ilegible
console.log(JSON.parse(rawdata)); //convierte la informacion del objeto JSON(en forma de string) en objeto JSON

