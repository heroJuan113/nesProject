const express = require("express");
const morgan = require("morgan");
const expresshbs = require("express-handlebars");
const path = require("path");
const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session');
const { database } = require('./src/keys.js');

const app = express();

console.log(database.PORT);
app.set('PORT', database.PORT);
app.set('views', path.join( './src/views'));
app.engine('.hbs', expresshbs({
    defaultLayout: 'main',
    layoutDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./src/lib/handlebars.js')
}));
app.set('view engine', '.hbs');
//midlewares

app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use('/css', express.static(__dirname + '/node_modules/bootstrap/dist/css'));
app.use('/js', express.static(__dirname + '/node_modules/jquery/dist'));
app.use('/js', express.static(__dirname + '/node_modules/popper.js/dist'));
app.use('/js', express.static(__dirname + '/node_modules/bootstrap/dist/js'));

//variables globales 
/*
app.use((req, res, next) => {
    app.locals.success = req.flash('success');
    app.locals.mensajeDanger = req.flash('mensajeDanger');
    next();
});*/
app.use('/sucursales', require('./src/routes/Sucursales/sucursal'));
app.use('/proveedores', require('./src/routes/proveedores/proveedor'));
/*
app.use('/productos', require('./src/routes/Productos/producto'));
app.use('/empleados', require('./src/routes/Empleados/empleado'));
app.use('/clientes', require('./src/routes/Clientes/cliente'));
app.use('/contrasenas', require('./src/routes/Contrasenas/index'));
*/
app.use('/',require('./src/routes/session/inicio'));
/*
app.use('/ventas', require('./src/routes/Ventas/venta'));
app.use('/inventario', require('./src/routes/inventario/inventario'));
app.use('/servicios', require('./src/routes/servicios/servicio'));
app.use('/recargas', require('./src/routes/recargas/recarga'));
app.use('/reportes', require('./src/routes/reportes/venta'));
app.use('/importarExcel', require('./src/routes/importarExcel/importarExcel'));
*/
//archivos publicos
app.use(express.static(path.join(__dirname, 'public'))); 

//niciar el servidor    
app.listen(app.get('PORT'), () => {
    console.log("iniciado")
})