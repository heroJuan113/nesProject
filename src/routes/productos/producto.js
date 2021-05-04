const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');

router.get('/nuevo/:idUsuario/:idSession', async(req, res) => {
    const proveedores = await dbConnection.query('select idProveedor , nombre from proveedores where bandera=1');
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario= ?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idSession = idSession;
        usuariosCorrectos[i].idUsuario = idUsuario;
    }
    for (let i = 0; i < proveedores.length; i++) {
        proveedores[i].idUsuario = idUsuario;
        proveedores[i].idSession = idSession;
    }
    res.render('productos/agregar', { usuariosCorrectos, idUsuario, idSession, proveedores });
});
router.post('/nuevo/:idUsuario/:idSession', async(req, res) => {
    const {
        clave,
        seccion,
        marca,
        linea,
        serie,
        descripcion,
        garantia,
        idProveedor,
        unidadMedida
    } = req.body;

    const newProducto = {
        idProducto: idProducto(),
        clave,
        seccion,
        marca,
        linea,
        serie,
        descripcion,
        garantia,
        idProveedor,
        unidadMedida,
        iva: getIva(req)
    };
    const { idUsuario, idSession } = req.params;
    await dbConnection.query('insert into productos set ?', newProducto);

    res.redirect('/productos/' + idUsuario + '/' + idSession);
});
router.get('/:idUsuario/:idSession', async(req, res) => {
    const productos = await dbConnection.query('select * from productos where bandera=1');
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario= ?', idUsuario);
    for (let i = 0; i < productos.length; i++) {
        productos[i].idUsuario = idUsuario;
        productos[i].idSession = idSession;
    }
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('productos/listar', { usuariosCorrectos, idUsuario, idSession, productos });
});
router.get('/eliminar/:id/:idUsuario/:idSession', async(req, res) => {
    
    const { id, idUsuario, idSession } = req.params;
    const productos = await dbConnection.query('update productos set bandera=0 where id = ? ', id);
    console.log('eliminando producto ' ,id);
    res.redirect('/productos/' + idUsuario + '/' + idSession);
});

router.get('/editar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;
    const proveedores = await dbConnection.query('select idProveedor , nombre from proveedores where bandera=1');
    const producto = await dbConnection.query('select *  from productos where bandera=1 and ' +
        'id = ? ', id);


    for (let i = 0; i < producto.length; i++) {
        producto[i].proveedores = proveedores;
        producto[i].idUsuario = idUsuario;
        producto[i].idSession = idSession;
    }
    const usuariosCorrectos = await dbConnection.query("select * from usuarios where bandera=1 and idUsuario=?", idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;

    }
    res.render('productos/editar', { usuariosCorrectos, idUsuario, idSession, producto });
});

router.post('/editar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;
    const {
        clave,
        seccion,
        marca,
        linea,
        serie,
        descripcion,
        garantia,
        idProveedor,
        unidadMedida,
        iva
    } = req.body;
    const productoActualizado = {
        clave,
        seccion,
        marca,
        linea,
        serie,
        descripcion,
        garantia,
        idProveedor,
        unidadMedida,
        iva
    }
    const productos = await dbConnection.query('update productos set updatedAt=CURRENT_TIMESTAMP, ? where id = ? ', [productoActualizado, id]);
    res.redirect('/productos/' + idUsuario + '/' + idSession);
});

function getIva(req) {
    const iva = 0;
    if (req.body.iva) {
        const { iva } = req.body
        return iva;
    }
    return iva;
}



function idProducto() {
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
    const producto = await dbConnection.query('select * from productos where bandera=1');
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera =1 and idUsuario =?', idUsuario);
    for (let i = 0; i < producto.length; i++) {
        producto[i].idUsuario = idUsuario;
        producto[i].idSession = idSession;

    }
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('productos/tabla', { usuariosCorrectos, idUsuario, idSession, producto });
});

router.get('/visualizar/:id/:idUsuario/:idSession', async(req, res) => {
    const { id, idUsuario, idSession } = req.params;

    const producto = await dbConnection.query("select  * from productos where bandera=1 and idSucursal = ?", [id]);
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario = ? ', idUsuario);
    res.render('productos/visualizar', { producto });
});

router.get('/buscar', async(req, res) => {
    const productos = await dbConnection.query('select * from productos where bandera=1');
    res.render('productos/mostrar', { productos });
});
module.exports = router;