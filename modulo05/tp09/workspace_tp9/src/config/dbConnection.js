const mysql = require('mysql2');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var sqlConnection = mysql.createConnection(config.database);

sqlConnection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente");
    }
});

module.exports = sqlConnection;