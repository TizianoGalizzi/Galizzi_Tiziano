const sqlConnection = require("../config/dbConnection");

usuariosDb = {};

usuariosDb.create = function(usuario, funCallback){
    let {nickname,email,password,estado} = usuario;
    let query = `INSERT INTO usuarios (nickname,email,password,estado) VALUES ('${nickname}', '${email}','${password}','${estado}')`;
    sqlConnection.query(query, function (err,result,fields){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de create usuarios?")
        }else{
            funCallback(undefined,{
                message: `Se ha creado con exito el usuario ${nickname}`,
                details: result
            });
        }

    }) 
};

usuariosDb.modify = function (usuario, id, funCallback){
    let {nickname,email,password,estado} = usuario;
    let query = `UPDATE usuarios SET nickname = '${nickname}', email = '${email}', password = '${password}', estado = '${estado}' WHERE idusuario = ${id}`;
    sqlConnection.query(query, function(err,result){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de modify usuarios?")
        }else{
            funCallback(undefined,{
                message: `Se ha modificado con exito el usuario ${nickname}`,
                details: result
            });
        }
    })
}

usuariosDb.logDel = function(id, funCallback){
    let query = `UPDATE usuarios SET estado = '0' WHERE idusuario = ${id}`;
    sqlConnection.query(query, function (err,result){
        if(err){
            funCallback({
                message: "Surgio un problema, contactese con el administrador. Gracias.",
                details: err
            });
            console.log(err);
            console.log("Error en la query de logDel usuarios?")
        }else{
            funCallback(undefined,{
                message: `Se ha dado de baja con exito el usuario con id ${id}`,
                details: result
            });
        }
    })    

};

module.exports = usuariosDb;