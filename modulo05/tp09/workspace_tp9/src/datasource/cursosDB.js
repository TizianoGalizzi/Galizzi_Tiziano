const sqlConnection = require("../config/dbConnection");
// Funcionalidades de: Crear(alta), Borrar logicamente(baja, cambio de estado a 0) y modificacion


cursosDb = {}

//Dar de alta
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

// Modificacion de datos del curso

cursosDb.modify = function(curso,idcurso, funCallback){
    let {nombre,descripcion,estado} = curso;
    let query = `UPDATE cursos SET nombre = '${nombre}', descripcion = '${descripcion}', estado = '${estado}' WHERE idcurso = ${idcurso} ; `;
    sqlConnection.query(query, function (err,result){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de modify cursos?");
        }else{
            funCallback(undefined, {
                message: `Se ha modificado con exito el curso ${nombre}`,
                details: result
            });
        }
    })
}

// Dar de baja logica

cursosDb.logicDel = function(idcurso, funCallback){
    let id = idcurso;
    let query = `UPDATE cursos SET estado = '0' WHERE idcurso = ${id} ; `;
    sqlConnection.query(query, function (err,result){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de logicDelete cursos?");
        }else{
            funCallback(undefined, {
                message: `Se ha dado de baja con exito el curso con id: ${idcurso}`,
                details: result
            });
        }
    })
}


module.exports = cursosDb;