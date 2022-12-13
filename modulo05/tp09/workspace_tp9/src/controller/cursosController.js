require("rootpath")();
const express = require('express');
const app = express();

const cursosDb = require("../datasource/cursosDB.js");


app.put("/", create);
app.put("/:idcurso", modify);
app.post("/:idcurso", logDel); //eliminacion logica


function create(req,res){
    cursosDb.create(req.body,function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        }
    })
}

function modify(req,res){
    cursosDb.modify(req.body, req.params.idcurso, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        }
    });
}

function logDel(req,res){
    cursosDb.logicDel(req.params.idcurso, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        }
    });
}

module.exports = app;

