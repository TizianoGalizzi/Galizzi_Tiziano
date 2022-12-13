const sqlConnection = require("../config/dbConnection");



sedesDb = {}

sedesDb.create = function (sede, funCallback){
    let {nombre,direccion,localidad,cod_postal,telcontacto1, telcontacto2,estado} = sede;
    let query = `INSERT INTO sedes (nombre,direccion,localidad,cod_postal,telcontacto1, telcontacto2,estado) VALUES ('${nombre}','${direccion}','${localidad}','${cod_postal}','${telcontacto1}','${telcontacto2}','${estado}')`
    sqlConnection.query(query, function(err,result){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de create sedes?")
        }else{
            funCallback(undefined,{
                message: `Se ha creado con exito la sede ${nombre}`,
                details: result
            });
        }
    })
}

sedesDb.logDel = function (id, funCallback){
    let query = `UPDATE sedes SET estado = '0' WHERE idsede = ${id}`
    sqlConnection.query(query, function(err,result){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de logDel sedes?")
        }else{
            funCallback(undefined,{
                message: `Se ha dado de baja con exito la sede con id: ${id}`,
                details: result
            });
        }
    })
}

sedesDb.modify = function (sede, id, funCallback){
    let {nombre,direccion,localidad,cod_postal,telcontacto1, telcontacto2,estado} = sede;
    let query = `UPDATE sedes SET nombre = '${nombre}', direccion = '${direccion}', localidad = '${localidad}', cod_postal = '${cod_postal}', telcontacto1 = '${telcontacto1}', telcontacto2 = '${telcontacto2}',estado = '${estado}' WHERE idsede = ${id}`
    sqlConnection.query(query, function(err,result){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de modify sedes?")
        }else{
            funCallback(undefined,{
                message: `Se ha actualizado con exito la sede ${nombre}`,
                details: result
            });
        } 
    })
}



cursosDb.create = function (curso, funCallback){
    let {nombre,descripcion,estado} = curso;
    let query = `INSERT INTO cursos (nombre,descripcion,estado) VALUES ('${nombre}', '${descripcion}','${estado}')`;
    sqlConnection.query(query, function (err,result,fields){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de create cursos?")
        }else{
            funCallback(undefined,{
                message: `Se ha creado con exito el curso ${nombre}`,
                details: result
            });
        }

    })
};

module.exports = sedesDb;