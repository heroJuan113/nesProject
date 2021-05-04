const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');

router.get('/nuevo/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where idUsuario = ?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('proveedores/agregar', { usuariosCorrectos, idSession, idUsuario });
});
router.post('/add/:idUsuario/:idSession', async(req, res) => {
    const { numero, nombre, municipio, calle, numeroDomicilio, telefono, correo, rfc } = req.body;
   
    const { idUsuario, idSession } = req.params;
    idProveedor = idProveedor1();
    const newProveedor = {
        idProveedor,
        numero,
        nombre,
        municipio,
        calle,
        numeroDomicilio,
        telefono,
        correo,
        rfc
    };
    await dbConnection.query('insert into proveedores set ?', newProveedor);
    res.redirect('/proveedores' + "/" + idUsuario + "/" + idSession);
});
router.get('/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const proveedores = await dbConnection.query('select * from proveedores where bandera=1');
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario = ?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    for (let i = 0; i < proveedores.length; i++) {
        proveedores[i].idUsuario = idUsuario;
        proveedores[i].idSession = idSession;

    }
    res.render('proveedores/listar', { usuariosCorrectos, idUsuario, idSession, proveedores });
});
router.get('/eliminar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;
    const sucursales = await dbConnection.query('update proveedores set bandera=0 where id = ? ', id);

    res.redirect('/proveedores/' + idUsuario + "/" + idSession);
});

router.get('/editar/:id/:idUsuario/:idSession', async(req, res) => {

    const { id, idUsuario, idSession } = req.params;
    const proveedores = await dbConnection.query('select * from proveedores where bandera=1 and ' +
        'id = ? ', id);
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario = ?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    for (let i = 0; i < proveedores.length; i++) {
        proveedores[i].idUsuario = idUsuario;
        proveedores[i].idSession = idSession;

    }
    res.render('proveedores/editar', { usuariosCorrectos, idUsuario, idSession, proveedores });
});

router.post('/editar/:id/:idUsuario/:idSession', async(req, res) => {
    console.log('actualizando   ');
    const { id, idUsuario, idSession } = req.params;
    const { numero, nombre, municipio, calle, numeroDomicilio, telefono, correo, rfc } = req.body;
    const proveedorActualizado = {
        numero,
        nombre,
        municipio,
        calle,
        numeroDomicilio,
        telefono,
        correo,
        rfc
    }
    const proveedores = await dbConnection.query('update proveedores set updatedAt=CURRENT_TIMESTAMP, ? where id = ? ', [proveedorActualizado, id]);
    res.redirect('/proveedores' + "/" + idUsuario + "/" + idSession);
});

router.get('/buscar/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const proveedores = await dbConnection.query('select * from proveedores where bandera=1');
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario = ?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('proveedores/mostrar', { usuariosCorrectos, idUsuario, idSession, proveedores });
});

function idProveedor1() {
    let minusculas = [
        'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
        'z', 'x', 'c', 'v', 'b', 'n', 'm'
    ];

    let secretId = '';

    for (i = 0; i < 70; i++) {
        let posAle = Math.floor(Math.random() * ((minusculas.length) + 0));
        secretId += minusculas[posAle];
    }

    return secretId;
}

module.exports = router;