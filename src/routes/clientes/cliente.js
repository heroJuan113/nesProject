const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');

router.get('/nuevo/:idUsuario/:idSession', async(req, res) => {
    let cliente = await dbConnection.query('select * from clientes where bandera=1');
    const { idUsuario, idSession } = req.params;

    console.log('codigo de session ' + idSession);
    let usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario=?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    console.log('usuarios correcctos ' + usuariosCorrectos);
    for (let i = 0; i < cliente.length; i++) {
        cliente[i].idUsuario = idUsuario;
        cliente[i].idSession = idSession;
    }
    console.log('clientes ', cliente);

    res.render('clientes/agregar', { usuariosCorrectos, idUsuario, idSession, cliente });
});
router.post('/nuevo/:idUsuario/:idSession', async(req, res) => {
    const {
        nombre,
        calle,
        colonia,
        ciudad,
        curp,
        telefono,
        numero,
        codigoPostal,
        estado
    } = req.body;
    idcliente = idcliente1();
    const newcliente = {
        idcliente,
        curp,
        nombre,
        calle,
        colonia,
        ciudad,
        telefono,
        numero,
        codigoPostal,
        estado
    };

    await dbConnection.query('insert into clientes set ?', newcliente);
    const { idUsuario, idSession } = req.params;
    res.redirect('/clientes/' + idUsuario + '/' + idSession);
});
router.get('/:idUsuario/:idSession', async(req, res) => {
    const clientes = await dbConnection.query('select * from clientes where bandera=1');
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario=?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    for (let i = 0; i < clientes.length; i++) {
        clientes[i].idUsuario = idUsuario;
        clientes[i].idSession = idSession;
    }
    res.render('clientes/listar', { usuariosCorrectos, idUsuario, idSession, clientes });
});
router.get('/eliminar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;
    const clientes = await dbConnection.query('update clientes set bandera=0 where idcliente = ? ', id);
    res.redirect('/clientes/' + idUsuario + '/' + idSession);
});

router.get('/editar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id } = req.params;

    const cliente = await dbConnection.query('select * from clientes where bandera=1 and ' +
        'idcliente = ? ', id);
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario=?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    for (let i = 0; i < cliente.length; i++) {
        cliente[i].idUsuario = idUsuario;
        cliente[i].idSession = idSession;
    }
    res.render('clientes/editar', { usuariosCorrectos, idUsuario, idSession, cliente });
});

router.post('/editar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;
    const {
        nombre,
        calle,
        colonia,
        ciudad,
        telefono,
        numero,
        codigoPostal,
        estado
    } = req.body;
    const clienteActualizada = {
        calle,
        nombre,
        colonia,
        ciudad,
        telefono,
        numero,
        codigoPostal,
        estado
    }
    const clientes = await dbConnection.query('update clientes set updatedAt=CURRENT_TIMESTAMP, ? where idcliente = ? ', [clienteActualizada, id]);
    res.redirect('/clientes/' + idUsuario + '/' + idSession);
});

function idcliente1() {
    let minusculas = [
        'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
        'z', 'x', 'c', 'v', 'b', 'n', 'm',
        '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '~', '!', "$", "^", "<", ">"
    ];
    let secretId = '';

    for (i = 0; i < 70; i++) {
        let posAle = Math.floor(Math.random() * ((minusculas.length) + 0));
        secretId += minusculas[posAle];
    }

    return secretId;
}
router.get('/tabla/:idUsuario/:idSession', async(req, res) => {
    const cliente = await dbConnection.query('select * from clientes where bandera=1');
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario=?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    for (let i = 0; i < cliente.length; i++) {
        cliente[i].idUsuario = idUsuario;
        cliente[i].idSession = idSession;
    }
    res.render('clientes/tabla', { usuariosCorrectos, idUsuario, idSession, cliente });
});

router.get('/visualizar/:id/:idUsuario', async(req, res) => {
    const { id } = req.params;

    const cliente = await dbConnection.query("select  * from clientes where bandera=1 and idcliente = ?", [id]);
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario=?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    for (let i = 0; i < cliente.length; i++) {
        cliente[i].idUsuario = idUsuario;
        cliente[i].idSession = idSession;
    }
    res.render('clientes/visualizar', { usuariosCorrectos, idUsuario, idSession, cliente });
});
module.exports = router;