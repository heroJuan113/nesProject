create database nesdatabase;
use  database nesdatabase;
create table sucursales;


create table sucursales (
  id int(3)(11) NOT NULL,
  idSucursal varchar(70) NOT NULL,
  nombre varchar(100) NOT NULL,
  colonia varchar(100) not null,
  calle varchar(100) not null,
  numero int(4) not null,
  referencia text 
);

alter table sucursales
  add  createdAt  timestamp not null DEFAULT current_timestamp;

alter table sucursales
  add  bandera  int(1) not null default 1;

  alter table sucursales
  add  updatedAt  timestamp not null DEFAULT CURRENT_TIMESTAMP;


      create table empleados (
      id int(11) NOT NULL,
      idEmpleado varchar(70) NOT NULL,
      curp varchar(18),
      calle varchar(100) NOT NULL,
      colonia varchar(100) not null,
      
      ciudad int(4) not null,
      telefono varchar(10),
      numero int(9),
      codigoPostal int(5)not null,
      estado varchar(50),
      createdAt timestamp not null DEFAULT current_timestamp,
      updatedAt timestamp not null DEFAULT current_timestamp,
      bandera int(1) default 1
      );


      
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `idCliente` varchar(70) NOT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `calle` varchar(100) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `numero` int(9) DEFAULT NULL,
  `codigoPostal` int(5) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `bandera` int(1) DEFAULT 1,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

            create table usuarios(
            idUsuario varchar(70),
            usuario varchar(100),
            pass varchar(32),
            tipoUsuario int () default 0,
            createdAt timestamp NOT NULL DEFAULT current_timestamp(),
            updatedAt timestamp NOT NULL DEFAULT current_timestamp(),
            bandera int(1) default 1
            )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

alter table usuarios add
  usuarioPhone int(1);

            create table sessiones(
              idSession varchar(250) not null unique,
              idUsuario varchar(70) not null,
              createdAt timestamp not null default current_timestamp(),
              closed TIMESTAMP NOT null default CURRENT_TIMESTAMP(),
              idSucursal varchar(70) not null,
              bandera int(1) not null default 1
            );
create table inventario(
     idSucursal varchar(70) NOT NULL,
     idSession varchar(250) not null,
     clave  varchar(70) not null,
     tipo varchar(10),
     costo decimal,
     existencia int,
     gastos decimal,
     factura decimal,
      utilidad decimal,
      precioVenta decimal  
);

alter table inventario add(
  clave varchar(70) 
  );

alter table inventario add(
  idProducto varchar(70) not null
);

alter table productos add(
   idProducto varchar(70) not null
);


alter table inventario add(
  stockMinimo int ,
  stockMaximo int
);
create table servicios(
  idServicio varchar(70) not null,
  idSession varchar(250) not null,
  claveServicio varchar(25)not null,
  nombre varchar (50) not null, 
  precio decimal not null,
  porcentaje decimal,
  descripcion varchar(300),
  createdAt timestamp NOT NULL DEFAULT current_timestamp(),
  updatedAt timestamp NOT NULL DEFAULT current_timestamp()
);

alter table servicios add
  idSucursal varchar(70);


  create table recargas(
    idSession varchar(250),
    idRecarga varchar(100),
    monto int,
    folio varchar(50) unique,
    createdAt timestamp NOT NULL DEFAULT current_timestamp()
  );
  alter table recargas add
    numero int(10);


  create table depositos(
    idSession varchar(250),
    idDeposito varchar(100),
    saldo int,
    deposito int, 
    createdAt timestamp NOT NULL DEFAULT current_timestamp(),
  folio varchar(50) not null
  );

  alter table folio add
    folio varchar(50) not null;
  

  alter table clientes add 
    idSession varchar(250) not null;

  alter table empleados add
  idSession varchar(250) not null;

  alter table productos add
  idSession varchar(250) not null;

  alter table proveedores add
  idSession varchar(250) not null;
  
  alter table sucursales add 
  idSession varchar(250) not null;

  alter table usuarios add
  idSession varchar(250) not null;


  create table procesoventas(
    idSucursal varchar(70) NOT NULL ,
    idUsuario varchar(70) not null,
    idProducto varchar(70),
    idSession varchar(250) not null  ,
    idServicio varchar(70) not null,
    cantidad int(4), 
    CreatedAt timestamp not null DEFAULT current_timestamp  
  )
  truncate table procesoventas
  alter table procesoventas add
  precio decimal(8) not null

  alter table procesoventas add
  tipoVenta int(1)not null


  alter table procesoventas
  add idProceso varchar(70) not null,