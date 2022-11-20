const fs = require("fs");

fs.readFile("../tp07/personas.json", (err,data)=>{
    if(err){
        console.log({
            message: "hubo un error ",
            details: err
        })
    }else{
        console.log(data);
        // Por defecto, ReadFile nos devuelve la informacion en tipo de valor Buffer(tipo de dato que sirve para transcribir la informacion que se encuentra en binario)
        // por lo tanto, al realizar un console.log sobre el valor sin alteraciones, nos devuelve numeros con letras (BUFFER)
        console.log(JSON.parse(data)); //JSON.parse interpreta la data en buffer y la transcribe a su informacion de origen, la cual es un objeto JSON
        console.log(JSON.stringify(data)); //JSON.stringify nos devuelve la informacion de buffer en modo de objeto, mostrandonos todo su contenido.
    };
})
