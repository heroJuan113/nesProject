const express = require("express");
const morgan = require("morgan");
const expresshbs = require("express-handlebars");
const path = require("path");
const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session');
const { database } = require('./keys');

const app = express();

//configuraciones
app.set('port', 3000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', expresshbs({
    defaultLayout: 'main',
    layoutDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');
//midlewares
app.use(session({
    secret: 'nesSession',
    resave: false,
    saveUninitialized: false,
    // store: new MySQLStore(database)
}));
app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use('/css', express.static(__dirname + '/node_modules/bootstrap/dist/css'));
app.use('/js', express.static(__dirname + '/node_modules/jquery/dist'));
app.use('/js', express.static(__dirname + '/node_modules/popper.js/dist'));
app.use('/js', express.static(__dirname + '/node_modules/bootstrap/dist/js'));

//variables globales 
app.use((req, res, next) => {
    app.locals.success = req.flash('success');
    app.locals.mensajeDanger = req.flash('mensajeDanger');
    next();
});
app.use('/sucursales', require('./routes/Sucursales/sucursal'));
app.use('/proveedores', require('./routes/Proveedores/proveedor'));
app.use('/productos', require('./routes/Productos/producto'));
app.use('/empleados', require('./routes/Empleados/empleado'));
app.use('/clientes', require('./routes/Clientes/cliente'));
app.use('/contrasenas', require('./routes/Contrasenas/index'));
app.use(require('./routes/Session/inicio'));
app.use('/ventas', require('./routes/Ventas/venta'));
app.use('/inventario', require('./routes/inventario/inventario'));
app.use('/servicios', require('./routes/servicios/servicio'));
app.use('/recargas', require('./routes/recargas/recarga'));
app.use('/reportes', require('./routes/reportes/venta'));
app.use('/importarExcel', require('./routes/importarExcel/importarExcel'));
//archivos publicos
app.use(express.static(path.join(__dirname, 'public'))); 

//niciar el servidor    
app.listen(app.get('port'), () => {
    
})