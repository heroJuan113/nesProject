const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');
router.get('/', async(req, res) => {
    let sucursales = await dbConnection.query('select * from sucursales where bandera =1');

    res.render('inicioSession/inicio', { sucursales });
});
router.post('/principal', async(req, res) => {
  
    let { usuario, contrasena, sucursales } = req.body;
    let usuariosCorrectos = await dbConnection.query('select * from usuarios where  usuario =? and pass=?', [usuario, contrasena]);
    let encontrados = 0;


    usuariosCorrectos.forEach(usuarioActual => {
        encontrados += 1;
    });
    if (encontrados == 0) {
        usuariosCorrectos = await dbConnection.query('select * from usuarios where  usuarioPhone =? and pass=?', [usuario, contrasena], (req) => {
            res.redirect('http://127.0.0.1:4000/');
        });
        //const idUsuario='';
        dato = [];
           }
    let idSessionCreatd = idSession();
    console.log('id Session created \t' +idSessionCreatd);
    if (encontrados == 1) {
        let idUsuario;
        const idSucursal = req.body.sucursales;
        usuariosCorrectos.forEach(usuarioActual => {
            encontrados += 1;
            idUsuario = usuarioActual.idUsuario;

        });
        let nuevaSession = [];

        nuevaSession = {
            idSession: idSessionCreatd,
            idUsuario:idUsuario,
            idSucursal:idSucursal
        };
        
        await dbConnection.query('insert into sessiones set ? ', nuevaSession);
        const idSession = idSessionCreatd;
        for (let i = 0; i < usuariosCorrectos.length; i++) {
            usuariosCorrectos[i].idSession = idSessionCreatd;
        }
        res.render('inicioSession/principal', { usuariosCorrectos, idSession });

    }

});

function idSession() {
    let minusculas = [
        'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
        'z', 'x', 'c', 'v', 'b', 'n', 'm',
        '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '~', '!', "$", "^", "<", ">"
    ];
    let secretId = '';

    for (i = 0; i < 249; i++) {
        let posAle = Math.floor(Math.random() * ((minusculas.length) + 0));
        secretId += minusculas[posAle];
    }

    return secretId;
}
module.exports = router;