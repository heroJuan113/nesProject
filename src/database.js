const mysql = require('mysql');
const { promisify } = require('util');
const { database } = require('./keys');

const pool = mysql.createPool(database);
pool.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('Conexion se ha perdido');
        }
        else if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('Demasiadas conexiones  activas en este momento');
        }
        else if (err.code === 'ECONNREFUSED') {
            console.error('conexion rechazada ');
        } else if (err.code === 'ER_ACCESS_DENIED_ERROR') {
            console.error('Error en las credenciales');
        }
    }
    else if (connection) {
        connection.release();
        console.log('base de datos conectada');
    }
});
pool.query = promisify(pool.query);
module.exports = pool;