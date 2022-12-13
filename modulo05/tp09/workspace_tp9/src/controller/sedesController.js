require("rootpath")();
const express = require('express');
const app = express();

const sedesDb = require("../datasource/sedesDB.js");


app.put("/", create); //alta
app.post("/:idsede", logDel); //baja
app.put("/:idsede", modify) //modificacion


function create (req,res){
    sedesDb.create(req.body, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        }
    })
}


function logDel (req,res){
    sedesDb.logDel(req.params.idsede, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        }
    })
}

function modify (req,res){
    sedesDb.modify(req.body, req.params.idsede, function(err,result){
        if (err){
            res.status(500).send(err);
        }else{
            res.json(result);
        }
    })
}

module.exports = app;