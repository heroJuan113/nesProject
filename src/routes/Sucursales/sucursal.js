const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');

router.get('/add/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;

    const usuariosCorrectos = await dbConnection.query('select usuario , idUsuario from usuarios where idUsuario=? ', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {


        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('sucursales/agregar', { usuariosCorrectos, idSession });
});
router.post('/add/:idUsuario/:idSession', async(req, res) => {

    const { idUsuario, idSession } = req.params;
    const { nombre, colonia, calle, numero, referencia } = req.body;
    const newSucursal = {
        idSucursal: idSucursal1(),
        nombre,
        colonia,
        calle,
        numero,
        referencia
    }

    const sucursales = await dbConnection.query('insert into sucursales set ?', newSucursal);
    res.redirect('/sucursales/' + idUsuario + '/' + idSession);
});
router.get('/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;

    const usuariosCorrectos = await dbConnection.query('select usuario , idUsuario from usuarios where idUsuario=? ', idUsuario);
    const sucursales = await dbConnection.query('select * from sucursales where bandera=1');
    for (let i = 0; i < sucursales.length; i++) {

        sucursales[i].idUsuario = idUsuario;
        sucursales[i].idSession = idSession;
    }
    for (let i = 0; i < usuariosCorrectos.length; i++) {


        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('sucursales/listar', { usuariosCorrectos, sucursales, idSession ,idUsuario});
});
router.get('/eliminar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;
    const sucursales = await dbConnection.query('update sucursales set bandera=0 where idSucursal = ? ', id);
    res.redirect('/sucursales/' + idUsuario + '/' + idSession);
});

router.get('/editar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;

    const sucursal = await dbConnection.query('select * from sucursales where bandera=1 and ' +
        'idSucursal = ? ', id);
    const usuariosCorrectos = await dbConnection.query('select usuario , idUsuario from usuarios where idUsuario=? ', idUsuario);
    for (let i = 0; i < sucursal.length; i++) {

        sucursal[i].idUsuario = idUsuario;
        sucursal[i].idSession = idSession;
    }
    for (let i = 0; i < usuariosCorrectos.length; i++) {


        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('sucursales/editar', { usuariosCorrectos, idSession, sucursal });
});

router.post('/editar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;
    const { nombre, colonia, calle, numero, referencia } = req.body;
    const sucursalActualizada = {
        nombre,
        colonia,
        calle,
        numero,
        referencia
    }
    await dbConnection.query('update sucursales set updatedAt=CURRENT_TIMESTAMP, ? where idSucursal = ? ', [sucursalActualizada, id]);


    res.redirect('/sucursales/' + idUsuario + '/' + idSession);
});

function idSucursal1() {
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
    const{idUsuario , idSession}=req.params;

    const sucursal = await dbConnection.query('select * from sucursales where bandera=1');
    
    const usuariosCorrectos = await dbConnection.query('select usuario , idUsuario from usuarios where idUsuario=? ', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('sucursales/tabla', { sucursal,usuariosCorrectos ,idUsuario, idSession  });
});

router.get('/visualizar/:id/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;

    const sucursal = await dbConnection.query("select  * from sucursales where bandera=1 and idSucursal = ?", [id]);
    const usuariosCorrectos = await dbConnection.query('select usuario , idUsuario from usuarios where idUsuario=? ', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('sucursales/visualizar/', { sucursal, usuariosCorrectos  ,idUsuario,idSession});
});
module.exports = router;