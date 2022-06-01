const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');

router.get('/nuevo/:idUsuario/:idSession', async(req, res) => {
    let empleado = await dbConnection.query('select * from empleados where bandera=1');
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario = ? ', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('empleados/agregar', { usuariosCorrectos, idUsuario, idSession, empleado });
});
router.post('/add/:idUsuario/:idSession', async(req, res) => {
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
    idempleado = idempleado1(70);
    const newempleado = {
        idempleado,
       
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
    const { idUsuario, idSession } = req.params;
    await dbConnection.query('insert into empleados set ?', newempleado);
    const usuarioEmpleado = {
        idUsuario: idempleado,
        usuario: nombre,
        pass: idempleado1(14),
        tipoUsuario: 'empleado',
        usuarioPhone: telefono
    };
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario = ?', idUsuario);
    await dbConnection.query('insert into usuarios set ?', usuarioEmpleado);
    res.redirect('/empleados/' + idUsuario + '/' + idSession);
});




router.get('/:idUsuario/:idSession', async(req, res) => {
    const empleados = await dbConnection.query('select * from empleados where bandera=1');

    const { idUsuario, idSession } = req.params;

    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario = ?', idUsuario);
    for (let i = 0; i < empleados.length; i++) {
        empleados[i].idUsuario = idUsuario;
        empleados[i].idSession = idSession;
    }
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('empleados/listar', { usuariosCorrectos, idUsuario, idSession, empleados });
});





router.get('/eliminar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;
    const empleados = await dbConnection.query('update empleados set bandera=0 where idempleado = ? ', id);

    res.redirect('/empleados/' + idUsuario + '/' + idSession);
});

router.get('/editar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;

    const empleado = await dbConnection.query('select * from empleados where bandera=1 and ' +
        'idempleado = ? ', id);
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario = ?', idUsuario);
    for (i = 0; i < empleado.length; i++) {
        empleado[i].idUsuario = idUsuario;
        empleado[i].idSession = idSession;
    }
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('empleados/editar', { usuariosCorrectos, idUsuario, idSession, empleado });
});

router.post('/editar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;
    const {
        nombre,
        curp,
        calle,
        colonia,
        ciudad,
        telefono,
        numero,
        codigoPostal,
        estado
    } = req.body;
    const empleadoActualizada = {
        curp,
        calle,
        nombre,
        colonia,
        ciudad,
        telefono,
        numero,
        codigoPostal,
        estado
    }
    const empleados = await dbConnection.query('update empleados set updatedAt=CURRENT_TIMESTAMP, ? where idempleado = ? ', [empleadoActualizada, id]);
    res.redirect('/empleados/' + idUsuario + '/' + idSession);
});

function idempleado1() {
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

function idempleado1(longitud) {
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
router.get('/tabla/:idUsuario/:idSession', async(req, res) => {
    const empleado = await dbConnection.query('select * from empleados where bandera=1');
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario= ?', idUsuario);

    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    for (let i = 0; i < empleado.length; i++) {
        empleado[i].idUsuario = idUsuario;
        empleado[i].idSession = idSession;
    }
    res.render('empleados/tabla', { usuariosCorrectos, idUsuario, idSession, empleado });
});

router.get('/visualizar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;

    const empleado = await dbConnection.query("select  * from empleados where bandera=1 and idempleado = ?", [id]);
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario= ?', idUsuario);

    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    for (let i = 0; i < empleado.length; i++) {
        empleado[i].idUsuario = idUsuario;
        empleado[i].idSession = idSession;
    }
    res.render('empleados/visualizar', { usuariosCorrectos, idusuario, idSession, empleado });
});

router.get('/asignacion/:idUsuario/:idSession', async(req, res) => {
    const {idUsuario,idSession}=req.params;
    const empleados = await dbConnection.query('select  * from empleados ');
    const sucursales = await dbConnection.query('select * from sucursales where bandera =1 ');
    let dato = [];
    for (let index = 0; index < empleados.length; index++) {
        dato.push({
            nombre: empleados[index].nombre,
            banderaEmpleado: true,
            banderaSucursal: false
        });
    }

    for (let index = 0; index < sucursales.length; index++) {
        dato.push({
            nombre: sucursales[index].nombre,
            banderaEmpleado: false,
            banderaSucursal: true
        });

    }
    console.log(sucursales);
    for (let i = 0; i < sucursales.length; i++) {
        sucursales[i].idUsuario = idUsuario;
        sucursales[i].idSession = idSession;
    }
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario= ?', idUsuario);

    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }

    res.render('empleados/asignacion', { usuariosCorrectos, idUsuario, idSession, dato });
});
router.get('/recuperacion/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario= ?', idUsuario);

    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }

    res.render('contrasenas/recuperacion', { usuariosCorrectos, idUsuario, idSession });

});
router.get('/recuperar/:idUsuario/:idSession', async() => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario= ?', idUsuario);

    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    res.send('hola ,, recuperando la contrasena');
});
module.exports = router;