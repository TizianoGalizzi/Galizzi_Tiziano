require("rootpath")();
const express = require('express');
const app = express();
const morgan = require('morgan');
const nodemon = require('nodemon');
const config = require("./src/config/config.json");
// const sqlConnection = require("./src/config/dbConnection.js")

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(morgan('tiny'));
morgan(':method :url :status :res[content-length] - :response-time ms');
  

// Pagina de inicio
app.get("/", function (req, res) {
    res.send("Inicio");
});

//Atendiendo a todos los endpoints dirigidos a personas(alta baja y modificacion)
const personaCont = require("./src/controller/personaController");
app.use("api/personas", personaCont)

//Atendiendo a todos los endpoints dirigidos a cursos (alta baja y modificacion)
const cursosCont = require("./src/controller/cursosController");
app.use("/api/cursos", cursosCont);

//Atendiendo a todos los endpoints dirigidos a cursos (alta baja y modificacion)
const materiasCont = require("./src/controller/materiasController")
app.use("/api/materias", materiasCont)

//Atendiendo a todos los endpoints dirigidos a cursos (alta baja y modificacion)
const usuariosCont = require("./src/controller/usuariosController.js")
app.use("/api/usuarios", usuariosCont)

//Atendiendo a todos los endpoints dirigidos a cursos (alta baja y modificacion)
const sedesCont = require("./src/controller/sedesController");
app.use("/api/sedes", sedesCont)

app.listen(config.server.port, function (err) {
    if (err) {
        console.log(err);
    } else {
        console.log(`Server iniciado en puerto:${config.server.port}`);
    }
});
