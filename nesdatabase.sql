-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2020 at 10:57 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nesdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `idEmpleado` varchar(70) NOT NULL,
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

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`id`, `idEmpleado`, `curp`, `calle`, `colonia`, `ciudad`, `telefono`, `numero`, `codigoPostal`, `estado`, `createdAt`, `updatedAt`, `bandera`, `nombre`) VALUES
(1, '944uo8b3mbtg56fo7cqmq6lox>1lc<w>3c6bpg<<6vgwflel0j515u1<<6^c98$aw00m37', NULL, 'ni me acuerdo', 'el obispo', '0', '4371009565', 15, 99700, 'zacatecas', '2020-10-07 00:33:42', '2020-10-07 00:35:50', 1, 'Neto'),
(2, '6d^oj<0amjz!<8!kjq!9m$et0bv~puxv4v3^x$pdovjiy5t>j~^cnb0s4ho<5s$xsnza0l', NULL, 'quien sabe', 'ni pedo', 'tota', '4371092637', 33, 99700, 'jalisco', '2020-10-09 17:33:40', '2020-10-09 17:33:40', 1, 'abc'),
(3, 's3hxh2yz<<9x>4y1h!zj$>51x1u378x$xtjrtsr~rrnt>^kymyf6>m8n9igiq!hrlh0yqm', '4da56sddsaas456asd', 'no se ', 'morones', 'tltlenango', '4371022637', 32, 33000, 'zacatecas', '2020-10-09 17:37:38', '2020-10-09 17:37:38', 1, 'juan camaney');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `clave` varchar(70) NOT NULL,
  `seccion` varchar(2) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `linea` varchar(100) NOT NULL,
  `serie` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `garantia` varchar(4) DEFAULT NULL,
  `idProveedor` varchar(80) DEFAULT NULL,
  `unidadMedida` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `bandera` int(1) NOT NULL DEFAULT 1,
  `iva` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `clave`, `seccion`, `marca`, `linea`, `serie`, `descripcion`, `garantia`, `idProveedor`, `unidadMedida`, `createdAt`, `updatedAt`, `bandera`, `iva`) VALUES
(1, '1235', 'bo', 'link bits', 'bluetooth', 'z15', 'Bocina Bluetooth 15 pulgadas link bits', 'G', NULL, 'pieza', '2020-10-07 00:38:06', '2020-10-07 00:38:06', 1, 1),
(2, '9358', 'A', 'asus', 'L1', '3a936', 'es una lapes una lap es una lapes una lapes una lapes una lapes una lap', 's/g', '98', 'pieza', '2020-10-09 18:46:57', '2020-10-09 18:46:57', 1, 1),
(3, '6das4d5as4d6a', 'G', 'Toshiba', 'algo', '99', 'aa', '', '98', 'pieza', '2020-10-09 18:49:40', '2020-10-09 18:49:40', 1, 0),
(4, '55', 'A', 'AllienWare', 'A', '1', 'lap gamer', '', '98wefhods9qwu0efihods9us9sc', 'Pieza', '2020-10-09 18:52:22', '2020-10-09 18:52:22', 1, 0),
(5, '79', 'F', 'a', '+', '54', 'dasdasd', '', 'cxdqarjpxtbbyfibnlawwfehdnjpffhrkzpbjwhazatgrdzpueiqgpxxdjpjbetwwbcufz', 'paquete', '2020-10-09 19:03:59', '2020-10-09 19:03:59', 1, 0),
(6, 'eq64w54e', 'E', 'lenovo', 'G', '50-45', 'lap', '', 'cxdqarjpxtbbyfibnlawwfehdnjpffhrkzpbjwhazatgrdzpueiqgpxxdjpjbetwwbcufz', 'pieza', '2020-10-09 19:16:22', '2020-10-09 19:16:22', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `idProveedor` varchar(70) NOT NULL,
  `numero` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `municipio` varchar(250) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `numeroDomicilio` int(4) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` text DEFAULT NULL,
  `rfc` varchar(20) NOT NULL,
  `bandera` int(1) NOT NULL DEFAULT 1,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`id`, `idProveedor`, `numero`, `nombre`, `municipio`, `calle`, `numeroDomicilio`, `telefono`, `correo`, `rfc`, `bandera`, `updatedAt`, `createdAt`) VALUES
(1, '98wefhods9qwu0efihods9us9sc', 1, 'link bits', 'jalisco', 'jalisco', 15, '3334562198', 'jalssahd@hotmail.es', 'ads4ada5s4d', 0, '2020-10-07 00:39:16', '2020-10-07 00:39:16'),
(2, '98wefhods9qwu0efihods9us9sc', 33, 'nueva empresa', 'tlalte', 'sierra de charcas', 55, '4546546546', 'dsaskdj@mail.com', 'as46d5asd', 0, '2020-10-09 18:41:23', '2020-10-09 18:41:23'),
(3, '98wefhods9qwu0efihods9us9sc', 33, 'uno', 'guanatos', 'alguna,la que seaa', 43, '333008721', 'jchl_1c@mail.com', 'às6d45sd46a', 0, '2020-10-09 18:56:30', '2020-10-09 18:56:30'),
(4, '98wefhods9qwu0efihods9us9sc', 33, 'uno', 'guanatos', 'alguna,la que seaa', 43, '333008721', 'jchl_1c@mail.com', 'às6d45sd46a', 0, '2020-10-09 18:57:38', '2020-10-09 18:57:38'),
(5, '98wefhods9qwu0efihods9us9sc', 34, '88', 'askdalsdk', 'sskadjlaks', 555, '789456230', 'ads@as.com', 'asd', 0, '2020-10-09 18:58:35', '2020-10-09 18:58:35'),
(6, 'cxdqarjpxtbbyfibnlawwfehdnjpffhrkzpbjwhazatgrdzpueiqgpxxdjpjbetwwbcufz', 97987, 'ahora si', 'tlalte', 'sierra de charca', 35, '798200565', 'algo@gmail.com', 'sd4a65sd4as65d', 1, '2020-10-09 19:00:58', '2020-10-09 19:00:58');

-- --------------------------------------------------------

--
-- Table structure for table `sucursales`
--

CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL,
  `idSucursal` varchar(70) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `numero` int(4) NOT NULL,
  `referencia` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `bandera` int(1) NOT NULL DEFAULT 1,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sucursales`
--

INSERT INTO `sucursales` (`id`, `idSucursal`, `nombre`, `colonia`, `calle`, `numero`, `referencia`, `createdAt`, `bandera`, `updatedAt`) VALUES
(1, '5srrtl1sy8cav~yl04^2et3y>lqj~8sics8061>dnja2774ch3~497>f7>pgexzzt2uz^<', 'Parian', 'Centro', 'Josefa Ortiz', 15, 'Referencia aqui: Fachada Amarilla', '2020-10-07 00:09:12', 1, '2020-10-07 00:09:12'),
(2, 'y7j2fgz5nlccj7>p$9c<sgz226qfi8r5p1adznhvtykiys^ly6u687f3l4gr4h>hcorvwx', 'Cyber Jurez', 'Centro', 'Juarez', 40, 'Referencia aqui: Contra esquina del tazon', '2020-10-07 00:11:15', 1, '2020-10-07 00:11:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

create table ventasProceso(
    idVenta varchar(70) NOT NULL,
    idSession varchar(250) not null,
    idUsuario varchar(70) NOT NULL,
    idSucursal 
)

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
