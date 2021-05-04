const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');


router.get('/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where idUsuario = ?', idUsuario);

    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }

    const Sucursal = await dbConnection.query('select idSession,idSucursal from sessiones where idSession = ?', idSession);
    var idSucursal = '';
    for (let i = 0; i < Sucursal.length; i++) {
        idSucursal = Sucursal[i].idSucursal;
    }
    const servicios = await dbConnection.query('select * from servicios where idSucursal = ?', idSucursal);
    for (let i = 0; i < servicios.length; i++) {
        servicios[i].idUsuario = idUsuario;
        servicios[i].idSession = idSession;
    }
    //    console.log('servicios', servicios);
    //res.send(servicios);
    res.render('servicios/servicios', { usuariosCorrectos, idUsuario, idSession, servicios });
});
router.get('/nuevo/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where idUsuario = ?', idUsuario);

    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('servicios/agregar', { usuariosCorrectos, idUsuario, idSession });
});
router.post('/nuevo/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const { claveServicio, nombre, precio, porcentaje, descripcion } = req.body;
    const Sucursal = await dbConnection.query('select idSession,idSucursal from sessiones where idSession = ?', idSession);
    var idSucursal = '';
    for (let i = 0; i < Sucursal.length; i++) {
        idSucursal = Sucursal[i].idSucursal;
    }
    const nuevoServicio = {
        idServicio: idServicio(70),
        idSession: idSession,
        idSucursal: idSucursal,
        claveServicio: claveServicio,
        nombre: nombre,
        precio: precio,
        porcentaje: porcentaje,
        descripcion: descripcion
    };
    await dbConnection.query('insert into servicios set ?', nuevoServicio);
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where idUsuario = ?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.redirect('/servicios/' + idUsuario + '/' + idSession);
});



function idServicio(longitud) {

    let minusculas = [
        'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
        'z', 'x', 'c', 'v', 'b', 'n', 'm',
        '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '~', '!', "$", "^", "<", ">", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H",
        "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"
    ];
    let secretId = '';

    for (i = 0; i < longitud; i++) {
        let posAle = Math.floor(Math.random() * ((minusculas.length) + 0));
        secretId += minusculas[posAle];
    }
    return secretId;
}

module.exports = router;