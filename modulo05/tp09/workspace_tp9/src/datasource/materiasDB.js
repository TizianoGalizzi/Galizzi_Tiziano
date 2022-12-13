const sqlConnection = require("../config/dbConnection");

materiasDb = {};


//dar de alta
materiasDb.create = function (materias, funCallback){
    let {nombre,objetivo,plan_estudio,estado} = materias;
    let query = `INSERT INTO materias (nombre,objetivo,plan_estudio,estado) VALUES ('${nombre}', '${objetivo}','${plan_estudio}','${estado}')`;
    sqlConnection.query(query, function (err,result,fields){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de create materias?")
        }else{
            funCallback(undefined,{
                message: `Se ha creado con exito la materia ${nombre}`,
                details: result
            });
        }

    })
};


//baja

materiasDb.logDel = function(id, funCallback){
    let idcurso = id;
    let query = `UPDATE materias SET estado = '0' WHERE idmateria= ${idcurso} `;
    sqlConnection.query(query, function (err,result){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
                console.log("Error en la query de logDel materias?") 
        }else{
            funCallback(undefined,{
                message: `Se ha dado de baja con exito la materia con id ${idcurso}`,
                details: result
            })
        }

    });
}

//modificacion

materiasDb.modify = function(materias,idmateria,funCallback){
    let {nombre,objetivo,plan_estudio,estado} = materias;
    let query = `UPDATE materias SET nombre = '${nombre}', objetivo = '${objetivo}',plan_estudio = '${plan_estudio}',estado ='${estado}' WHERE idmateria = '${idmateria}'`;
    sqlConnection.query(query, function (err,result){
        if(err){
            funCallback(err);
        }else{
            funCallback(undefined,{
                message: `Se ha modificado correctamente la materia ${nombre}`,
                details: result
            })
        }
    })

}
module.exports = materiasDb;