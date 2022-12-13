require("rootpath")();
const express = require('express');
const app = express();

const materiasDb = require("../datasource/materiasDB.js");

app.put("/", create) //alta
app.post("/:idmateria", logDel)//baja
app.put("/:idmateria", modify )//modificacion

function create(req,res){
   materiasDb.create(req.body,function(err,result){
    if (err){
        res.status(500).send(err);
    }else{
        res.json(result);
    };
   }); 
}

function logDel(req,res){
    materiasDb.logDel(req.params.idmateria, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        };
    
    })
}

function modify(req,res){
    materiasDb.modify(req.body,req.params.idmateria, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        };
    })
}

module.exports = app;