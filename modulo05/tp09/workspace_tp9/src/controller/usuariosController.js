require("rootpath")();
const express = require('express');
const app = express();

const usuariosDb = require("../datasource/usuariosDB.js");


app.put("/", create); //alta
app.post("/:idusuario", logDel) //baja
app.put("/:idusuario", modify) //modificacion

function create(req,res){
    usuariosDb.create(req.body, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        }
    });
};

function logDel(req,res){
    usuariosDb.logDel(req.params.idusuario, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        }
    })
};

function modify(req,res){
    usuariosDb.modify(req.body,req.params.idusuario, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        }
    })
}



module.exports = app;