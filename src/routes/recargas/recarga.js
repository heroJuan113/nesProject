const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');
router.get('/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera = 1 and idUsuario=?', idUsuario);
    for (var i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    const recargas = await dbConnection.query('select * from recargas where idSession =?', idSession);
    res.render('recargas/nueva', { usuariosCorrectos, idUsuario, idSession });
});


router.post('/nueva/:idUsuario/:idSession', async(req, res) => {
    const { folio, monto, numero } = req.body;
    const { idUsuario, idSession } = req.params;
    const nuevaRecarga = {
        idSession: idSession,
        idRecarga: idRecargas(),
        monto: monto,
        folio: folio,
        numero: numero
    };
    await dbConnection.query('insert into recargas set ? ', nuevaRecarga);

    res.redirect('/recargas/' + idUsuario + '/' + idSession);
});

function idRecargas() {
    let minusculas = [
        'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
        'z', 'x', 'c', 'v', 'b', 'n', 'm',
        '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '~', '!', "$", "^", "<", ">"
    ];
    let secretId = '';

    for (i = 0; i < 100; i++) {
        let posAle = Math.floor(Math.random() * ((minusculas.length) + 0));
        secretId += minusculas[posAle];
    }

    return secretId;
}

router.get('/nuevo/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera = 1 and idUsuario=?', idUsuario);
    for (var i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('recargas/deposito', { usuariosCorrectos, idUsuario, idSession });
});


router.post('/nuevo/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const { saldo, deposito, folio } = req.body;
    const nuevoDeposito = {
        idDeposito: idDepositos(100),
        idSession: idSession,
        saldo: saldo,
        deposito: deposito,
        folio: folio
    }
    await dbConnection.query('insert into depositos set ?', nuevoDeposito);
    res.redirect('/recargas/nuevo/' + idUsuario + '/' + idSession);
});

function idDepositos(longitud) {
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
    /// alert(secretId);

    return secretId;
}
module.exports = router;