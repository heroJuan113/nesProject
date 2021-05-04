const express = require('express');
const router = express.Router();
const dbConnection = require('../../database');

router.get('/altas/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;

    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario=?', idUsuario);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }
    res.render('inventario/altasFormulario', { usuariosCorrectos, idUsuario, idSession });
});


router.post('/busqueda/:idUsuario/:idSession', async(req, res) => {

    if (!String.prototype.trim) {
        (function() {
            var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
            String.prototype.trim = function() {
                return this.replace(rtrim, '');
            };
        })();
    }
    const { idUsuario, idSession } = req.params;
    let { clave } = req.body;
    clave = clave.trim();
    const sucursal = await dbConnection.query('select idSucursal from sessiones where bandera=1 and idSession=?', idSession);
    const productos = await dbConnection.query('select descripcion ,idProducto from productos where bandera=1 and clave = ? ', clave);
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario=?', idUsuario);
    let idSucursal = '';
    let descripcion = '';
    for (let i = 0; i < sucursal.length; i++) {
        idSucursal = sucursal[i].idSucursal;
    }
    let idProducto = '';
    for (let i = 0; i < productos.length; i++) {

        descripcion = productos[i].descripcion;
        idProducto = productos[i].idProducto;
    }
    console.log('idProducto', idProducto);
    for (let i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idUsuario = idUsuario;
        usuariosCorrectos[i].idSession = idSession;
    }

    res.render('inventario/altasFormulario', { usuariosCorrectos, idUsuario, idSession, descripcion, clave, idProducto });
});
router.post('/registro/:idUsuario/:idSession/:clave/:idProducto', async(req, res) => {
    const { tipo, costo, existencia, factura, gastos, utilidad, precioVenta, stockMinimo, stockMaximo } = req.body;
    const { idSession, idUsuario, clave, idProducto } = req.params;
    let idSucursal = '';
    Sucursal = await dbConnection.query('select idSucursal from sessiones where bandera=1 and idSession=?', idSession);
    for (let i = 0; i < Sucursal.length; i++) {
        idSucursal = Sucursal[i].idSucursal;

    }
    const nuevoInventario = {
        idSession: idSession,
        idSucursal: idSucursal,
        idProducto: idProducto,
        clave: clave,
        tipo: tipo,
        costo: costo,
        existencia: existencia,
        factura: factura,
        gastos: gastos,
        utilidad: utilidad,
        precioVenta: precioVenta,
        stockMinimo: stockMinimo,
        stockMaximo: stockMaximo
    }
    await dbConnection.query('insert into inventario set?', nuevoInventario);

    res.redirect('http://127.0.0.1:4000/inventario/altas/' + idUsuario + '/' + idSession);
});

router.get('/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario =?', idUsuario);

    for (var i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idSession = idSession;
        usuariosCorrectos[i].idUsuario = idUsuario;
    }

    res.render('inventario/corte', { usuariosCorrectos, idUsuario, idSession });
});
router.get('/existencia/empresa/:idUsuario/:idSession', async(req, res) => {
    const { idUsuario, idSession } = req.params;
    const infoSession = await dbConnection.query('select idSucursal  from sessiones where idUsuario = ? and idSession = ?', [idUsuario, idSession]);
    let sucursal = "";
    for (let i = 0; i < infoSession.length; i++) {
        sucursal = infoSession[i].idSucursal;
    }
    const usuariosCorrectos = await dbConnection.query('select * from usuarios where bandera=1 and idUsuario =?', idUsuario);

    for (var i = 0; i < usuariosCorrectos.length; i++) {
        usuariosCorrectos[i].idSession = idSession;
        usuariosCorrectos[i].idUsuario = idUsuario;
    }
    let productos = await dbConnection.query('select * from inventario where tipo="empresa" and idSucursal=  ?', sucursal);
    for (let i = 0; i < productos.length; i++) {
        productos[i].idSession = idSession;
        productos[i].idUsuario = idUsuario;

    }
    res.render('inventario/empresa', { usuariosCorrectos, idUsuario, idSession, productos });
});

module.exports = router;