-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2021 a las 08:38:45
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nesdatabase`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

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
  `nombre` varchar(100) NOT NULL,
  `idSession` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositos`
--

CREATE TABLE `depositos` (
  `idSession` varchar(250) DEFAULT NULL,
  `idDeposito` varchar(100) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `deposito` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `folio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
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
  `nombre` varchar(100) NOT NULL,
  `idSession` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `idEmpleado`, `curp`, `calle`, `colonia`, `ciudad`, `telefono`, `numero`, `codigoPostal`, `estado`, `createdAt`, `updatedAt`, `bandera`, `nombre`, `idSession`) VALUES
(1, '944uo8b3mbtg56fo7cqmq6lox>1lc<w>3c6bpg<<6vgwflel0j515u1<<6^c98$aw00m37', NULL, 'ni me acuerdo', 'el obispo', '0', '4371009565', 15, 99700, 'zacatecas', '2020-10-07 05:33:42', '2020-10-07 05:35:50', 0, 'Neto', ''),
(2, '6d^oj<0amjz!<8!kjq!9m$et0bv~puxv4v3^x$pdovjiy5t>j~^cnb0s4ho<5s$xsnza0l', NULL, 'quien sabe', 'ni pedo', 'tota', '4371092637', 33, 99700, 'jalisco', '2020-10-09 22:33:40', '2020-10-09 22:33:40', 0, 'abc', ''),
(3, 's3hxh2yz<<9x>4y1h!zj$>51x1u378x$xtjrtsr~rrnt>^kymyf6>m8n9igiq!hrlh0yqm', '4da56sddsaas456asd', 'no se ', 'morones', 'tltlenango', '4371022637', 32, 33000, 'zacatecas', '2020-10-09 22:37:38', '2020-10-09 22:37:38', 0, 'juan camaney', ''),
(4, '!qk5072o219qks$7m0d$561csjio>ulw~8w$dfhtwdug!rqb!adl4sjpp~u<ws2~3l89b9', 'jalh3-1e0wsa-0d9', 'sierra de charcas ', 'morones', 'tlaltenango', '8909808909', 35, 99800, 'zacatecas', '2020-10-31 00:42:44', '2020-10-31 00:42:44', 0, 'juan carlos haro lopez', ''),
(5, '!78!x>w5hlnuf4ib7>j^6be5e!admu>3cx<d^g64bnej9vp2h>>!ks1oao4~<o4~~ejsda', 'jalh3-1e0wsa-0d9', 'sierra de charcas ', 'morones', 'tlaltenango', '8909808909', 35, 99800, 'zacatecas', '2020-10-31 00:43:17', '2020-10-31 00:43:17', 0, 'juan carlos haro lopez', ''),
(6, 'f6hj401e99!z1d!~a$omulxqe!2vk99e5008yb32sthz3ewi4e70c02jm$cfny9cov<7o$', 'jalh3-1e0wsa-0d9', 'sierra de charcas ', 'morones', 'tlaltenango', '8909808909', 35, 99800, 'zacatecas', '2020-10-31 00:43:41', '2020-10-31 00:43:41', 0, 'juan carlos haro lopez', ''),
(11, '', 'askldjasld', 'sadlkdjas', 'jskaldsjald', 'jdskaldjalsk', '7986451223', 6, 2199, 'ksljdlakj', '2020-10-31 00:52:14', '2020-10-31 00:52:14', 1, 'otro', ''),
(12, 'z!xmlEVC2dc~>$EaIpZlGIdowlaKjJ>kB3dOwZ^HDmMgAR1sXff1RsaAZT>G8gPS<JL2St', 'askldjasld', 'sadlkdjas', 'jskaldsjald', 'jdskaldjalsk', '7986451223', 6, 2199, 'ksljdlakj', '2020-10-31 00:52:56', '2020-10-31 00:52:56', 0, 'otro dos', ''),
(13, 'D8nwn<mIZzH0!Cwo$wGRa!Vqdcp0jkiW$HjSrxKGQ>!!Q$duUtFYVli!SqeibgY>LfkzAS', '', 'charcas', 'valle verde', 'tlaltenango', '', 5, 99700, 'zacatecas', '2020-10-31 04:22:52', '2020-10-31 04:22:52', 0, 'carlos', ''),
(14, 'R~9c2NMIY^<Pp^yuxP7pu54u~D47wSHVBF5CKrtwW52hZXgUmYoRYuut1onye6zLG~8W0K', 'hal', 'charcas', 'morones', 'tlalterrancho', '3003401734', 53, 99700, 'zacatecas jallisco', '2021-04-14 07:23:13', '2021-04-14 07:23:23', 0, 'juan camaney', ''),
(15, 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'adasdkgkl;k', 'moroes', 'quie sabe', 'zacatuercas', '4657892123', 29, 559700, 'zacatecas', '2021-04-17 22:54:29', '2021-04-17 22:54:29', 1, 'juan', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idSucursal` varchar(70) NOT NULL,
  `idSession` varchar(250) NOT NULL,
  `clave` varchar(70) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `costo` decimal(10,0) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `gastos` decimal(10,0) DEFAULT NULL,
  `factura` decimal(10,0) DEFAULT NULL,
  `utilidad` decimal(10,0) DEFAULT NULL,
  `precioVenta` decimal(10,0) DEFAULT NULL,
  `idProducto` varchar(70) NOT NULL,
  `stockMinimo` int(11) DEFAULT NULL,
  `stockMaximo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idSucursal`, `idSession`, `clave`, `tipo`, `costo`, `existencia`, `gastos`, `factura`, `utilidad`, `precioVenta`, `idProducto`, `stockMinimo`, `stockMaximo`) VALUES
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', '0ccjyv2yr7dknowdf$2x<<nhvs7bm8i4qsyn^hoy^$~sje5lkny86ce18g6u903>72q>gc$>crb9zsqu1<sb8gr72b7hbyf<!xqpx9w07vugnwz7!s7>lxuolrcvrde<<3>l$s4c3w$nlo<830d^seu5jan50c~ci$nes$bt~f~ps25flo4s^irjn4mi5s67^uv>jqbjucl9!k7$f4wf~<g71yn2!6izh7e<ylaq6<6aonw3~5^30dpnv', '4895174126146', 'empresa', '300', 6, '0', '123', '50', '450', 'u0hwoy046^n$~^6!zgyttnz!f5^8qd^s^hsap38pi8ggo<sp0kv91agf^kw3~>i8vqomm<', 10, 3),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', '<eahvzjfhha8^eo>cgaiag$79uaq>k~9<802lmyg0fkgtkz>e3e3bg^<hz>q!wh$$<d1r2t2d1g7rmttox9ckzum$w6241krf0^j!ehqkb5^g0t5go!^p<5rnk4jhhk7k~kvtwd!~gg~90es>jt9a^<7q0b9xylog41ur9u!pi>d8gf14j$ilkjdu^i6d1uwm>zrqdq4u$n3rfudk!d9joyh1$lce807a~8uf5kkc^zvg~!6vvmf$!t9u', '271219', 'empresa', '220', 6, '0', '0', '40', '350', 'a1d11^lzg~q54y>a9ia01pkt<>0dy2i!4<n4~~th!gzvgr~>jz$auo34~0iosq01z5^j$u', 3, 6),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', '<eahvzjfhha8^eo>cgaiag$79uaq>k~9<802lmyg0fkgtkz>e3e3bg^<hz>q!wh$$<d1r2t2d1g7rmttox9ckzum$w6241krf0^j!ehqkb5^g0t5go!^p<5rnk4jhhk7k~kvtwd!~gg~90es>jt9a^<7q0b9xylog41ur9u!pi>d8gf14j$ilkjdu^i6d1uwm>zrqdq4u$n3rfudk!d9joyh1$lce807a~8uf5kkc^zvg~!6vvmf$!t9u', '271219', 'venta', '220', 5, '100', '9999999999', '0', '350', 'udy3$hve7ovi!ebej^xokojmuw<z8tq>$frg4<e^udvma^<0$fjftziac9mz1<6e6qha2w', 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesoventas`
--

CREATE TABLE `procesoventas` (
  `idSucursal` varchar(70) NOT NULL,
  `idUsuario` varchar(70) NOT NULL,
  `idProducto` varchar(70) DEFAULT NULL,
  `idSession` varchar(250) NOT NULL,
  `idServicio` varchar(70) NOT NULL,
  `cantidad` int(4) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `precio` decimal(8,0) NOT NULL,
  `tipoVenta` int(1) NOT NULL,
  `idProceso` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `procesoventas`
--

INSERT INTO `procesoventas` (`idSucursal`, `idUsuario`, `idProducto`, `idSession`, `idServicio`, `cantidad`, `CreatedAt`, `precio`, `tipoVenta`, `idProceso`) VALUES
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'u0hwoy046^n$~^6!zgyttnz!f5^8qd^s^hsap38pi8ggo<sp0kv91agf^kw3~>i8vqomm<', 'pxlypyim6344zduv8qbw>zm5u6bj0vqpvv2jy2ht<>dwn^bics~q26kihx8io54qbaa8!!1$<kkk!!c$7k<3y65<h>6a1n5oh8ll7o~o!<8cr^62qm^cbp~srwop65mbi50f89l5y6v9008vge2c4qo4i~yr^burm1q4s<hka<9e7mwyxuf5ovcx0qzzvj!o<~~fg6~!7z3z6ykjkein15w!r3$s8v86g7$paf!kr3ej56mixo<<qm33f', '', 1, '2021-05-02 06:33:39', '450', 2, 'fgIInQMSxUd8QwmmNK$up9BFFpeTF9ZTHkxneE85SSZcxMH4MIn>0D!hY$CqHlZEHB<2uU'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'u0hwoy046^n$~^6!zgyttnz!f5^8qd^s^hsap38pi8ggo<sp0kv91agf^kw3~>i8vqomm<', 'pxlypyim6344zduv8qbw>zm5u6bj0vqpvv2jy2ht<>dwn^bics~q26kihx8io54qbaa8!!1$<kkk!!c$7k<3y65<h>6a1n5oh8ll7o~o!<8cr^62qm^cbp~srwop65mbi50f89l5y6v9008vge2c4qo4i~yr^burm1q4s<hka<9e7mwyxuf5ovcx0qzzvj!o<~~fg6~!7z3z6ykjkein15w!r3$s8v86g7$paf!kr3ej56mixo<<qm33f', '', 1, '2021-05-02 06:35:11', '450', 2, 'TKqXluF9i40MDSN3$uSr!dBgEohv1Y64P~WzcXMF>vSw1bOdPzRyELeXCj<mMqIDwDSRyC'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'a1d11^lzg~q54y>a9ia01pkt<>0dy2i!4<n4~~th!gzvgr~>jz$auo34~0iosq01z5^j$u', 'pxlypyim6344zduv8qbw>zm5u6bj0vqpvv2jy2ht<>dwn^bics~q26kihx8io54qbaa8!!1$<kkk!!c$7k<3y65<h>6a1n5oh8ll7o~o!<8cr^62qm^cbp~srwop65mbi50f89l5y6v9008vge2c4qo4i~yr^burm1q4s<hka<9e7mwyxuf5ovcx0qzzvj!o<~~fg6~!7z3z6ykjkein15w!r3$s8v86g7$paf!kr3ej56mixo<<qm33f', '', 4, '2021-05-02 06:36:35', '350', 2, '^GqQNdoCgJV1Oy0Z3lszTF6GSt8P9nQqs5tMl8!ghn6p2MzuDT$gphF$cr~bRo^W$N<L5S'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'u0hwoy046^n$~^6!zgyttnz!f5^8qd^s^hsap38pi8ggo<sp0kv91agf^kw3~>i8vqomm<', 'pxlypyim6344zduv8qbw>zm5u6bj0vqpvv2jy2ht<>dwn^bics~q26kihx8io54qbaa8!!1$<kkk!!c$7k<3y65<h>6a1n5oh8ll7o~o!<8cr^62qm^cbp~srwop65mbi50f89l5y6v9008vge2c4qo4i~yr^burm1q4s<hka<9e7mwyxuf5ovcx0qzzvj!o<~~fg6~!7z3z6ykjkein15w!r3$s8v86g7$paf!kr3ej56mixo<<qm33f', '', 1, '2021-05-02 06:37:27', '450', 2, 't!$X<wd1!XCLAETOqreot0Bhkyzj43<<ks^9ths>U5FivjAjHwBDWGtQSkFNafiTHIj00O'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'a1d11^lzg~q54y>a9ia01pkt<>0dy2i!4<n4~~th!gzvgr~>jz$auo34~0iosq01z5^j$u', 'pxlypyim6344zduv8qbw>zm5u6bj0vqpvv2jy2ht<>dwn^bics~q26kihx8io54qbaa8!!1$<kkk!!c$7k<3y65<h>6a1n5oh8ll7o~o!<8cr^62qm^cbp~srwop65mbi50f89l5y6v9008vge2c4qo4i~yr^burm1q4s<hka<9e7mwyxuf5ovcx0qzzvj!o<~~fg6~!7z3z6ykjkein15w!r3$s8v86g7$paf!kr3ej56mixo<<qm33f', '', 3, '2021-05-02 06:45:39', '350', 2, 'gYEtojl<L7kg!8<3KTDhR<9NgGzxSg42EARkVf~LYC!wR129TPgR<YRDlHV<k2syk3EcDi'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '', 'pxlypyim6344zduv8qbw>zm5u6bj0vqpvv2jy2ht<>dwn^bics~q26kihx8io54qbaa8!!1$<kkk!!c$7k<3y65<h>6a1n5oh8ll7o~o!<8cr^62qm^cbp~srwop65mbi50f89l5y6v9008vge2c4qo4i~yr^burm1q4s<hka<9e7mwyxuf5ovcx0qzzvj!o<~~fg6~!7z3z6ykjkein15w!r3$s8v86g7$paf!kr3ej56mixo<<qm33f', 'mqsU07FfxzJ!JJ!Kjsu>3Kntj!zcIQVaEl2U1YyjvjFIwTtsoRf6jg3^BPE5SX7G~yatiS', 15, '2021-05-02 06:48:11', '1', 1, '^ufT3Azp$zhOvQ49Nmom5Mu3j!IXaZ!2lxsD9hk0yX<lvdxLWPu4zy8C39kyAw>No04TUa'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'udy3$hve7ovi!ebej^xokojmuw<z8tq>$frg4<e^udvma^<0$fjftziac9mz1<6e6qha2w', 'pxlypyim6344zduv8qbw>zm5u6bj0vqpvv2jy2ht<>dwn^bics~q26kihx8io54qbaa8!!1$<kkk!!c$7k<3y65<h>6a1n5oh8ll7o~o!<8cr^62qm^cbp~srwop65mbi50f89l5y6v9008vge2c4qo4i~yr^burm1q4s<hka<9e7mwyxuf5ovcx0qzzvj!o<~~fg6~!7z3z6ykjkein15w!r3$s8v86g7$paf!kr3ej56mixo<<qm33f', '', 1, '2021-05-02 06:48:42', '350', 2, 'SwvhrY7gDuRI2VGEd38SH0yCk!wzGUoC^pGqdRhzyp<tuWKb576fZyUsEb4k>8hC4UF9m$'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'udy3$hve7ovi!ebej^xokojmuw<z8tq>$frg4<e^udvma^<0$fjftziac9mz1<6e6qha2w', 'pxlypyim6344zduv8qbw>zm5u6bj0vqpvv2jy2ht<>dwn^bics~q26kihx8io54qbaa8!!1$<kkk!!c$7k<3y65<h>6a1n5oh8ll7o~o!<8cr^62qm^cbp~srwop65mbi50f89l5y6v9008vge2c4qo4i~yr^burm1q4s<hka<9e7mwyxuf5ovcx0qzzvj!o<~~fg6~!7z3z6ykjkein15w!r3$s8v86g7$paf!kr3ej56mixo<<qm33f', '', 5, '2021-05-02 06:52:15', '350', 2, 'Nc^cYc!5G8IEX52W~R0PUtTLPK~Z2HUJtaxrZRuubqaledTN>whf^bwJQ37A~fv3eSJMNE'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '', '28x3xg4uaabk>$5oefs<c$t9zu7ll!e1j3!poczjf4j8>$2v9~qib!^lzhienab<ka3pxugqaq1$mh9h>wn8jck>r<xf$dq28c3t>8>byeuk!fxzqc$j9!24hcrgha5uej6nkel>b7xoe$<s143uulttkq7egun9z$janbs3m<0hn18cby7imskhc~vara22hu9ldb7oi>>3w120e7><0fl0xa5oertb4tznhupd7of^77~ihp9k1^y06', 'mqsU07FfxzJ!JJ!Kjsu>3Kntj!zcIQVaEl2U1YyjvjFIwTtsoRf6jg3^BPE5SX7G~yatiS', 1, '2021-05-02 19:56:34', '1', 1, 'cUc!rtRfiJ7DAeA1y>bSzk<7$AreuXPEsf8l5RK8c5C7NoeDCSw8Mk0JCJcRoGyAti~rx^'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '', '28x3xg4uaabk>$5oefs<c$t9zu7ll!e1j3!poczjf4j8>$2v9~qib!^lzhienab<ka3pxugqaq1$mh9h>wn8jck>r<xf$dq28c3t>8>byeuk!fxzqc$j9!24hcrgha5uej6nkel>b7xoe$<s143uulttkq7egun9z$janbs3m<0hn18cby7imskhc~vara22hu9ldb7oi>>3w120e7><0fl0xa5oertb4tznhupd7of^77~ihp9k1^y06', 'mqsU07FfxzJ!JJ!Kjsu>3Kntj!zcIQVaEl2U1YyjvjFIwTtsoRf6jg3^BPE5SX7G~yatiS', 1, '2021-05-02 19:56:40', '1', 1, 'h~$4LzEV$VD~d1OF~iM<iB2MZnQwYAuf0FgPChzQSNNsH9mGEYm<JPeCHkF9ZhZ10iePjB'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'a1d11^lzg~q54y>a9ia01pkt<>0dy2i!4<n4~~th!gzvgr~>jz$auo34~0iosq01z5^j$u', '28x3xg4uaabk>$5oefs<c$t9zu7ll!e1j3!poczjf4j8>$2v9~qib!^lzhienab<ka3pxugqaq1$mh9h>wn8jck>r<xf$dq28c3t>8>byeuk!fxzqc$j9!24hcrgha5uej6nkel>b7xoe$<s143uulttkq7egun9z$janbs3m<0hn18cby7imskhc~vara22hu9ldb7oi>>3w120e7><0fl0xa5oertb4tznhupd7of^77~ihp9k1^y06', '', 1, '2021-05-02 20:06:03', '350', 2, 'x>ZkJo~Qmb49O2eP9dkT!Dclkl!JMiwOZ7ZQ0hWwdTv35AECSmYfOu4~W~hYqceuFFSiP1'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '', '28x3xg4uaabk>$5oefs<c$t9zu7ll!e1j3!poczjf4j8>$2v9~qib!^lzhienab<ka3pxugqaq1$mh9h>wn8jck>r<xf$dq28c3t>8>byeuk!fxzqc$j9!24hcrgha5uej6nkel>b7xoe$<s143uulttkq7egun9z$janbs3m<0hn18cby7imskhc~vara22hu9ldb7oi>>3w120e7><0fl0xa5oertb4tznhupd7of^77~ihp9k1^y06', 'mqsU07FfxzJ!JJ!Kjsu>3Kntj!zcIQVaEl2U1YyjvjFIwTtsoRf6jg3^BPE5SX7G~yatiS', 1, '2021-05-02 20:09:17', '1', 1, 'I6mok1QYfg8e1lwCID$dv$fGyyR7jMA!t37K1vtC7bIFL7xsULk9ypwd2uAPfKf0SAp0pV'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '', '28x3xg4uaabk>$5oefs<c$t9zu7ll!e1j3!poczjf4j8>$2v9~qib!^lzhienab<ka3pxugqaq1$mh9h>wn8jck>r<xf$dq28c3t>8>byeuk!fxzqc$j9!24hcrgha5uej6nkel>b7xoe$<s143uulttkq7egun9z$janbs3m<0hn18cby7imskhc~vara22hu9ldb7oi>>3w120e7><0fl0xa5oertb4tznhupd7of^77~ihp9k1^y06', 'mqsU07FfxzJ!JJ!Kjsu>3Kntj!zcIQVaEl2U1YyjvjFIwTtsoRf6jg3^BPE5SX7G~yatiS', 1, '2021-05-02 20:32:14', '1', 1, 'YY8ai~9uXprgxsj$L!a>^j7UgS>Sy^s!5u~^PrHRTx>bj~YLt$C$hdiU3aMSNcZu<Q6aPL'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '', 'q8ti1dj92^ff<nc838~q82<<0xotv~8o89w9!a2q!me9iteut1u7h73!3nzj<obwz~yw9^bp1sr$rohi8ij$s1gyfu3!rto>094y4uf078fkhozrifstczgjy7ao6oe5rt<8>u8n6s$wck1klcvqw>n5~wzf0vm>kwsyu$k953zseik$e0o2c8q6~^cmfv~ob8ag6t6hu$he3tkaw~tqljx91ch0qyh6c94<s>l4j~tj<vy$rrlw6iik!', 'g<yMiBO4MwAa^06RCUUXGolOpmCcEmiTEoPai21E25lWobk!Wa$!Rm!EJzPk6niZ!NnKF!', 1, '2021-05-03 05:45:21', '0', 1, '~GYmpWvUn2SxxFl34cyCUS2bxA<7vxNpLpqKHlS>sw6Gc9ji0KHODKDVEv<^i!Lm97dwBH'),
('wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'u0hwoy046^n$~^6!zgyttnz!f5^8qd^s^hsap38pi8ggo<sp0kv91agf^kw3~>i8vqomm<', 'q8ti1dj92^ff<nc838~q82<<0xotv~8o89w9!a2q!me9iteut1u7h73!3nzj<obwz~yw9^bp1sr$rohi8ij$s1gyfu3!rto>094y4uf078fkhozrifstczgjy7ao6oe5rt<8>u8n6s$wck1klcvqw>n5~wzf0vm>kwsyu$k953zseik$e0o2c8q6~^cmfv~ob8ag6t6hu$he3tkaw~tqljx91ch0qyh6c94<s>l4j~tj<vy$rrlw6iik!', '', 6, '2021-05-03 05:47:28', '450', 2, 'NSmpjKziLnpLP95rRJxesG^Bt5^wknqgPQ2sKde~dme>Wgd$kwX9bXDfPH1io>>68Hllk~');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
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
  `iva` int(1) NOT NULL,
  `idProducto` varchar(70) NOT NULL,
  `idSession` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `clave`, `seccion`, `marca`, `linea`, `serie`, `descripcion`, `garantia`, `idProveedor`, `unidadMedida`, `createdAt`, `updatedAt`, `bandera`, `iva`, `idProducto`, `idSession`) VALUES
(1, '4895174126146', 'A', 'link bits', 'vb', '001', 'bocina bluetooth', '', NULL, 'pieza', '2021-04-24 16:53:32', '2021-04-24 16:53:32', 1, 0, 'u0hwoy046^n$~^6!zgyttnz!f5^8qd^s^hsap38pi8ggo<sp0kv91agf^kw3~>i8vqomm<', ''),
(2, '271219', 'C', 'Dell', 'AC', '031', '\r\n\r\nCargador para computadora portatil', '', NULL, 'pieza', '2021-04-29 19:54:11', '2021-04-29 19:54:11', 1, 0, 'a1d11^lzg~q54y>a9ia01pkt<>0dy2i!4<n4~~th!gzvgr~>jz$auo34~0iosq01z5^j$u', ''),
(3, '271219', 'C', 'HP', 'DC', '9823', 'Cargador para computadora portatil de marca hp', '', NULL, 'pieza', '2021-04-29 19:56:15', '2021-04-29 19:56:15', 1, 0, 'udy3$hve7ovi!ebej^xokojmuw<z8tq>$frg4<e^udvma^<0$fjftziac9mz1<6e6qha2w', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
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
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `idSession` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recargas`
--

CREATE TABLE `recargas` (
  `idSession` varchar(250) DEFAULT NULL,
  `idRecarga` varchar(100) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `folio` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `numero` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicio` varchar(70) NOT NULL,
  `idSession` varchar(250) NOT NULL,
  `claveServicio` varchar(25) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `porcentaje` decimal(10,0) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `idSucursal` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicio`, `idSession`, `claveServicio`, `nombre`, `precio`, `porcentaje`, `descripcion`, `createdAt`, `updatedAt`, `idSucursal`) VALUES
('mqsU07FfxzJ!JJ!Kjsu>3Kntj!zcIQVaEl2U1YyjvjFIwTtsoRf6jg3^BPE5SX7G~yatiS', '!>6~5k5^ct2baov$cf4340hs9fh2zl2rk<d7qenirdd4q~35e<jttv32jxe7iybe>ya4$u>dpfkugo0y6of2x~>skbx0d7>xa<lvc3<>a5v^jnvyikdu4l4az1jvw<p4vf7gfq256ln<t~cmlm^t5fi<>d4a>5a^fmrb!0dvrzd0>7fdg5>czp4z<javkf3ukc~kp>yrfyys4nr^mda5i5r6evta4!<ys~3wd$fnqd774tmhjb!4aqu84', '101', 'impresion negro', '1', '15', 'Impresion de una hoja en escala de grises solo por una cara', '2021-04-20 06:11:15', '2021-04-20 06:11:15', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z'),
('9BKjPX1a55N$Xt$<KROmbNMtnXUi55h8rQgI>FQBAFxzJ0tPtsmTlCSrHh1E3DJVpL^quG', 'w$y~b0crityp6ga79>j89d28x33o7xs3l~4rofwvwwnq6~6~!oflfvt>$pncgpavbydgaf!s~fnyxn2xeu$~idq<<t>bf83xo60wmj04s~f9x2qgl852>1<ymg1$ywovmn92>$8n9<hw9ap02dwwpb0665ef2tw4gei94cuw$ti^ctlxa5s1h9zb^y$e<mq$cd^r2ot8uyxch4m91vjohjmf>zgg<~txrawtnvzmush<lmojgub~oyhco', '101', 'impresion negro', '1', '10', 'impresión de una hoja en escala de grises , solo por una cara', '2021-04-20 06:13:20', '2021-04-20 06:13:20', '6qr737uiu3i~rgo9ow51wmo3m^2zx$<!7z~^2r27ngt27ln8e6bmtf2wv~oz!l<6o!0e4l'),
('9Jg<UhfM1UFhi0VPn$OpWllEN6cj>s^C1Jemt2htv2LmU9FyptiKXRxp~qLj^uMRODwFkc', '~ue2^>6<vd~xv737th33wlv15bmi4r<<>rg~^9p!evc3eicg3ibu>guw9!dfv5vx412>cwtdh6t5s2pq9b5m13hce88168$xwz<q0~ip4on<txlihcz<2qipecw5481fm1b4~qf85^m19ucnq!trrp5a2nx<^ttgl7o~4hj>2owxuvq~ja!lpy<>9r~i>v9affbc79fv$ux01gqybavnvxz4rg9ce7<0j^klbkqf4v!sqbez4q^xqh9g8', '102', 'impresion color', '4', '5', 'impresion a color de una sola cara de cada hoja', '2021-04-20 06:33:12', '2021-04-20 06:33:12', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z'),
('g<yMiBO4MwAa^06RCUUXGolOpmCcEmiTEoPai21E25lWobk!Wa$!Rm!EJzPk6niZ!NnKF!', 'v7cnhe5h89bey5djtm~93n~e$>ilv9d^2c80$pr!935wximijq$vvsle8>gb<gkt5fvz0$bnefs518kkp9a!ysm4s20~f^3fse5zsdwbjkbjdyv~6dwaeenr5^w^h^khkg1romg5gdyicj$k0z99xn20fdb9x3io6q8e1mj^h9ra!487js7rt7a>nwh3uuyt0isbwu4^qi3fp8y9umhvj<jl9m3mdqgs$w87rmfi838tvqa8camud2<r7', '103', 'Scann', '0', '0', 'Scanner de una pagina', '2021-04-21 15:31:25', '2021-04-21 15:31:25', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z'),
('Y2~DnuXsvsp1Fi4KmlQAFXjJ4QdTJqEIckla0GHupapK^mo>$3Tt5A74Lv9D~nwcq8EdIJ', '~2!fh9>!fvgg0t9p>lvs1c93qs0fce~$079e^xpdy>6$571a!y^u^0gkpsn19xzmwb~~ldvvlyk^pmxkoeshbpn~<yol2sc~f6rp!q^mn9vq2dxgxriua72~$euq>r8vy~s~ls8^hxgx02c>4az$egvc4zt<81!~j2x87be>sorhego4wm3h$ylvwr9tbcolyzgz3<m7t0b!!^3>9dv>fzlhv!gafe><mfa1<vda9>iu91tngo7f^^5ea', '', '', '0', '103', '', '2021-04-21 22:30:08', '2021-04-21 22:30:08', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z'),
('Op1fFr44qCEWSr>Ugsty7RY59$J^B<bmq^0V>FeBZ0Nanzc7yRf8XC79nuLSrkWczh^OkW', '~2!fh9>!fvgg0t9p>lvs1c93qs0fce~$079e^xpdy>6$571a!y^u^0gkpsn19xzmwb~~ldvvlyk^pmxkoeshbpn~<yol2sc~f6rp!q^mn9vq2dxgxriua72~$euq>r8vy~s~ls8^hxgx02c>4az$egvc4zt<81!~j2x87be>sorhego4wm3h$ylvwr9tbcolyzgz3<m7t0b!!^3>9dv>fzlhv!gafe><mfa1<vda9>iu91tngo7f^^5ea', '104', 'copia color', '5', '10', 'Copia a color de una pagina , o un solo lado', '2021-04-21 22:31:48', '2021-04-21 22:31:48', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessiones`
--

CREATE TABLE `sessiones` (
  `idSession` varchar(250) NOT NULL,
  `idUsuario` varchar(70) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `closed` timestamp NOT NULL DEFAULT current_timestamp(),
  `idSucursal` varchar(70) NOT NULL,
  `bandera` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessiones`
--

INSERT INTO `sessiones` (`idSession`, `idUsuario`, `createdAt`, `closed`, `idSucursal`, `bandera`) VALUES
('!>6~5k5^ct2baov$cf4340hs9fh2zl2rk<d7qenirdd4q~35e<jttv32jxe7iybe>ya4$u>dpfkugo0y6of2x~>skbx0d7>xa<lvc3<>a5v^jnvyikdu4l4az1jvw<p4vf7gfq256ln<t~cmlm^t5fi<>d4a>5a^fmrb!0dvrzd0>7fdg5>czp4z<javkf3ukc~kp>yrfyys4nr^mda5i5r6evta4!<ys~3wd$fnqd774tmhjb!4aqu84', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-20 05:56:43', '2021-04-20 05:56:43', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('!v<$x!h52nnpnx^iy4szb$b0kw02al5gs2b!rfm^rguzy62t5mq0f~iq74gyr5u$e~2$7>he0y4^fhiow3xzve0!s8lf~a63l78v0q073xwzr6ej5yx<d$6t2yxa7ldxtioq8zx0tvc0ey~5og5ibrrw9rmpls0bou^!^o5!qfzecbzy>4$h!ojtrc<fil!3>>e7t5~l7psffcdd4xyk64$a4v~e0apnx7sh78lh2wtq>ia5fwvy5xxq3', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-28 22:49:21', '2021-04-28 22:49:21', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('$j38>7l>xc<!t8nd$$9xkn1v3v9^ym69e1ttih^2bz7pg>pik8hc6$bs76bv16!iiz6tj>d8a>e6s9ixy!y^3!p~p8nxx5!4u0<e3lgt3j^1^6>m7wzcropm4dmsomgnrl6c<$618mr7~0w16ixjnzz<dm0kleoa!9b33g1joluj2k05^ljnvbkl8$62phg4hsj2>3y5u$qfz3v6mf3awmf0uhd9sa5co5zv4dr9khm6w^4he3~aqxesm', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-05-02 19:54:19', '2021-05-02 19:54:19', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('0ccjyv2yr7dknowdf$2x<<nhvs7bm8i4qsyn^hoy^$~sje5lkny86ce18g6u903>72q>gc$>crb9zsqu1<sb8gr72b7hbyf<!xqpx9w07vugnwz7!s7>lxuolrcvrde<<3>l$s4c3w$nlo<830d^seu5jan50c~ci$nes$bt~f~ps25flo4s^irjn4mi5s67^uv>jqbjucl9!k7$f4wf~<g71yn2!6izh7e<ylaq6<6aonw3~5^30dpnv', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-24 05:49:30', '2021-04-24 05:49:30', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('0w6o5hz7qouacx3>rjkj<j<dg4^819>9kc3yxkry^byoy27qvltxgffgja7$x>3j0cgnzi5xitu7svz!14pmkjp!k~$g1qh0ea08g20c4~us93n37!nzepntsn8mjss~$>45ai!eha8~cnaufxm92vm~yix0pgrq4^gx0a^>$4vlj~z3vrxr><359hg<a4!lucidi7j5uj$5atu$lukm7x8kk6wvzf>n9ahm5ypp^pvg^qv>gbew1dd9n', 'D8nwn<mIZzH0!Cwo$wGRa!Vqdcp0jkiW$HjSrxKGQ>!!Q$duUtFYVli!SqeibgY>LfkzAS', '2021-04-17 22:28:43', '2021-04-17 22:28:43', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('28x3xg4uaabk>$5oefs<c$t9zu7ll!e1j3!poczjf4j8>$2v9~qib!^lzhienab<ka3pxugqaq1$mh9h>wn8jck>r<xf$dq28c3t>8>byeuk!fxzqc$j9!24hcrgha5uej6nkel>b7xoe$<s143uulttkq7egun9z$janbs3m<0hn18cby7imskhc~vara22hu9ldb7oi>>3w120e7><0fl0xa5oertb4tznhupd7of^77~ihp9k1^y06', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-05-02 19:56:18', '2021-05-02 19:56:18', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('39u22a6ye>>$dy7ixo9xv~6ow7qrnmb<s$~^m$$pgb6<ya8kep$gyrb53npoiusxh8endv^m1i<6<8<kf^q3ky~v5g~lpyyhnij<at<9p^xi9tl^bo9s65d3>f8ltmb6ei!kff0uxpvgto<st1>vnaimc6~tgd8nbi!<m98ruutk!48tdkr~70zh57z2p2wjmcefqvq4nurga6ja<gwklelc!~dai7~ghnyki<^l!6lw!fqdp9v<jq^an', 'D8nwn<mIZzH0!Cwo$wGRa!Vqdcp0jkiW$HjSrxKGQ>!!Q$duUtFYVli!SqeibgY>LfkzAS', '2021-04-14 07:20:32', '2021-04-14 07:20:32', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('550l1w5slx7v5ez6^4~g3jl!a83h62mm1qshu>b^red>l93fr!sbibznb>>mshek9~6>blr4642tt^lcim>v<395yd!21qj>zq6q94tkl<o!~pm0hjr<d8^wm7c~vu>~o>ho1b1iq7a5qjn$<~uuu2g098rjze2pcnhp^vh5w9mq~gy$jlnzf8a0ppsjljymoh>jy$xc8eohu4kirxni9uh4!rhj^wqssabxb4fh8t!szdb7xlcefw35t', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-22 14:38:59', '2021-04-22 14:38:59', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('5o3gr^np<~72wv620ziki>0vde^~i56hc0g!krjj7sl~p!ghhl8ild>f66cnbb982e3l<zdmo118~eqpuso!^bu!elmeg<vjsrgaj>n$nmj6p74gczaif!bxopc0tsxy2782cq37gmu35ukyiohu71ff1t5t0sn0no6gg$<29432^621u$oshfm9$>fd7x<!j>$mxdvuz^abwea~i!i9ihza7ik2zft86l>xtvv722$~jwrfsrk0b0d2^', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-27 17:54:56', '2021-04-27 17:54:56', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('74kk16liuryh<6th15g5do2~gkm4mwc^26<v2!jsxn47vddr$8ou9q5k8$^qswv8~3be8qg0~s<p51hus0bm!chvdap3j~wy0oqi><8l~>wtn0yf$jcd6!ady6av!h6evel~5y90s0erb$yhfgrao3jpgc308i^!1ya2cg$4ghvfe~2u$pfbnvp5$mfdg9afvp8^p~7hp$s>~ct13l8fp8pmt^7ad^98cudx<<>gg>1k<u>cf18p<7bbf', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-05-02 19:55:09', '2021-05-02 19:55:09', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('7jq1ag3jrsbak77mdm1kecmk7xz<aij2o~x>iywqufrvj~!xs~jqar^~cqm6xft88bny!in<pyww$q~ie7b1wse<307g6f^uwx2rb2d7o0verh^yaa1s6oel2tz0uz26fu!!vzbp$a3~0lt2vt7nb3!z3p$liu4~vv8!4y0nrivob>2kp~iggh77kenp<urjq^7$x0p9f<kohioemvkoevygo!898syn7lxo!7zlanck~q64~24dswuo5', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-21 04:46:22', '2021-04-21 04:46:22', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('<eahvzjfhha8^eo>cgaiag$79uaq>k~9<802lmyg0fkgtkz>e3e3bg^<hz>q!wh$$<d1r2t2d1g7rmttox9ckzum$w6241krf0^j!ehqkb5^g0t5go!^p<5rnk4jhhk7k~kvtwd!~gg~90es>jt9a^<7q0b9xylog41ur9u!pi>d8gf14j$ilkjdu^i6d1uwm>zrqdq4u$n3rfudk!d9joyh1$lce807a~8uf5kkc^zvg~!6vvmf$!t9u', 'R~9c2NMIY^<Pp^yuxP7pu54u~D47wSHVBF5CKrtwW52hZXgUmYoRYuut1onye6zLG~8W0K', '2021-04-29 19:52:33', '2021-04-29 19:52:33', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('dhwfu9unqwzg<rnt0hq1c~!i9fr4lhfamkiffjpgj92w~ri01$u$v3$zy>9l9yw03wmg~!b0lzpxee7~qb7iuvihn4sp0~h16dv8$zqn300pipqetmfy6un!^74f1<lg~mn6ns6>!qlegxvi5m8>x7zsu$pc>8<puvamxika~wifg2kt~75zd>tuk>x$4ph3n1kzt4zlyxmny7jbky4oeq8n50<<6>tw>r90o$amum6lypwygo~4crxbg', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-24 20:32:05', '2021-04-24 20:32:05', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('f8viff2fmarlqxd5f9$6a1m5c~wr44v284n8gd7mtv^8zdujj!jeun46b6qzy>o60vs6zgf6bgrvh>yy5ywdo63g!fs1s>!<d6c6jod>el75r~7la<vgtag3t20yinchbfwhganw>xrhh~4ea6jbo9epj1a6!tpop95!0t>~nr1rns9cc54ku~2dgvnrr8va09opvxucsth13j8y7ugz$>fq$6!s4nt!ymmi>30a0<f6^^gr0mx!qmya4', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-20 06:46:55', '2021-04-20 06:46:55', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('gc$6wohjubos^txwd~szn1uq6nlf$wz~p^1uw<6~n5a9e8k3iplp35!pj87zy06mj31bbipa^ikb!ymp<~7cuucsnmk7^ej$bk3jjt7uzth4d0jj>>206a<!n$krx0wy<zvqfc9!1ide<4qnnhd9v8$heyuh<w1i3u6b5yrjnrh5<v>$<h4!dtxl69hkw9at4eorfj7m8<ssd0t$ov1d3a>tn1q35bgjp4ymse2kufe4eo2iju^ar!gyf', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-23 18:05:00', '2021-04-23 18:05:00', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('gqcs1pzp1oj4vr!6!$d2gn^>czfwvcgse33bv0ki6mk39!2a7lrcmv6o$$n59pxecr3vpj7dyl5eklg00^vuw$c8go^2i044~>0n$6gz$!$6ve67v>zek2<8zmviwfq9<~gh0jn$i8$$dk<hmxr7bu00n!fubmc0xkfwrt4cg6ru9~$p2r2<4njt86hz^qs$9qe67eh8!yajl9mr3qr3y1tl~!a1z!0n0wiuk^rq^h$eq!vd9h$byoiz8', 'D8nwn<mIZzH0!Cwo$wGRa!Vqdcp0jkiW$HjSrxKGQ>!!Q$duUtFYVli!SqeibgY>LfkzAS', '2021-04-14 20:33:08', '2021-04-14 20:33:08', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('hi>1<qyedr7qy<v>oa6uli$9r8u84!au4333!ncqgs~fcmloj!42v2uy<q703k^fsgeddo$s4l5w9y7ubur9hb4^lkdnp8augnghf0zhtanw^0o3z^p3fsu!smz3!n75>ivtbk2~wwl>viae84ncn5nhxbl88t<x4ofs9jwm6znkhw~s1l1g55wkx6dlxv!obb^hlweq!ah^gmq6cznn$mda!nxwq<4aki$lxf0!6c$5<0whbat1m8<26', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-20 05:51:04', '2021-04-20 05:51:04', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('k4bobggjqjur!3^5^^k<k>hssk2zvqegb~x8c8qslry5$i8kbh~mm73nnkjem0idi<qj8$nn0l1fstm5nlkvo>~vp~!l36xwg7kiybm>gyy3igkou$kx3d4o$q^iqi<u^g$!vsa~kzltwzge2iqwkq1~em^htz>x4^>j04efwa^gmzfqo~yes25hpt14z4nu2xw>~vsnyjiirs00^^b>p<gujgh50$yvd>7lpjz5f6!8ec16y^kcdtsdk', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-20 05:50:28', '2021-04-20 05:50:28', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('o>><um^8ynu5y42ad9h3c~ykgt9gx312jtwhygq$yf<mjql6izri~<<16m97u6z5x8gs>xlrwxan99h3uyyo4no5kzqqfr<3r$bv<9s~a3>3e>f^tn72>vmpywgn~426fjj3b7g2anc2<u3a91<>>zwhnx<dx3ilk4f6ohd$~45syt8fet^xmnlbr48yr1ejlxbe>1!xc<zk1^<c4aqfh0t!zp88bi49q~6vojv6x0vkeola!htjmt2e1', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-20 05:53:42', '2021-04-20 05:53:42', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('oygvdax8bgmt~l5ww8n4>a2xali5~p5vcu$<jkzp$e2kvk~1r2jncza6x$xco4nuwg8tf62j!3apdopvts02kj^s>r4wa9yy^f9tggdsygwzczvanhxc60wl3k0xbai7kwd9h4x8iiorr>8d21sx~htmf9o^hsnxdu9^k3xppk5j0k<~q7stw4u~crv$z7zdohwsb0wfg0dz3h~bs7tdo!2svfn!o8t!d3uz1w>9dgszma!!>qcdk3yhx', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-21 06:16:10', '2021-04-21 06:16:10', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('p4j9w9ybb!5fmbg2mx3h0^ebokvd329^nrhc5c2bpx19>wkfbdu$t~wwpaq!$rxd7vdly^vbvse4ltff>n>xax$c7yoco8apj2r8<$p<!3~t3<<nq$y3y!~!m9d^o9e3^bfd!0~gnvjegm5zjz3yrk2~lvgtvuyb6ckzjw8hvhu!81j6wcec8!nj~pfwx~drc7<7lt4god3x4~t>$k^2oml641n$fse!ax0^7hkzh4p38lx25pod4evj8', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-05-01 03:55:22', '2021-05-01 03:55:22', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('pdd>gvamrw24l02~y3d4uv0ufbki>^evlxxseku!8q3!d7r2^9np6w3admlxvw66j3v6lzrzo<kzqt9radiwt0hrpvutl0l^$gat$cj5m>n15byra>o!surr4od$p$nvu27nkdd>!$~a3pc<0oc6>h^tias>oegct2i4ng1>n63zn0zabxr>wo4v7bzds8o3pby7mraga990uwea3f~^18dblf0z$nrzp$!pg!b8$hn<om0iny4p5hz6>', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-17 23:00:36', '2021-04-17 23:00:36', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('pxlypyim6344zduv8qbw>zm5u6bj0vqpvv2jy2ht<>dwn^bics~q26kihx8io54qbaa8!!1$<kkk!!c$7k<3y65<h>6a1n5oh8ll7o~o!<8cr^62qm^cbp~srwop65mbi50f89l5y6v9008vge2c4qo4i~yr^burm1q4s<hka<9e7mwyxuf5ovcx0qzzvj!o<~~fg6~!7z3z6ykjkein15w!r3$s8v86g7$paf!kr3ej56mixo<<qm33f', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-05-02 05:20:52', '2021-05-02 05:20:52', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('q8ti1dj92^ff<nc838~q82<<0xotv~8o89w9!a2q!me9iteut1u7h73!3nzj<obwz~yw9^bp1sr$rohi8ij$s1gyfu3!rto>094y4uf078fkhozrifstczgjy7ao6oe5rt<8>u8n6s$wck1klcvqw>n5~wzf0vm>kwsyu$k953zseik$e0o2c8q6~^cmfv~ob8ag6t6hu$he3tkaw~tqljx91ch0qyh6c94<s>l4j~tj<vy$rrlw6iik!', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-05-02 22:46:10', '2021-05-02 22:46:10', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('rorzw2!^6t7j8o4!sgzi!l4n341f0yxm>rgis7bnn3>wdu1m<c>f1g4a00^>7tgf15p52z>l09q0rv1~v7vzo2^4f4e>mc9c4~6bt!alpldi25b97lsh4^njx1uc!jernx26rn!a$e!1~kvuk<zd$9~zb$j4dm79r98zt^!^f42gpjgal30ck>j92gngdku!tr5q<nbipsmj7^7twuobi3w<pi9t2gca$us6y9j1~!vpcq51oz4d9vvxt', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-29 19:51:58', '2021-04-29 19:51:58', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('ski8jprhj$iccxw7cifivs2gncdb^4ewom<nomz8zdzqno5$~whd~vaedfo^rhrxvosvm^w>6x9con9~aj^>f^1g2g25eukvkwu68k<nkn^d~k~yfuxmcszqmrkz^>ma<zi2gtp8!h0c<t4$6hfeb48~t0349eod2$yjhym$sn>nc5y$bbhszo993x2odb51o>w8nwhn~w~zynk46>r1i9o2grg$7szoqymtbg5^jx~r1680yd>qevr$i', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-29 16:19:49', '2021-04-29 16:19:49', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('v7cnhe5h89bey5djtm~93n~e$>ilv9d^2c80$pr!935wximijq$vvsle8>gb<gkt5fvz0$bnefs518kkp9a!ysm4s20~f^3fse5zsdwbjkbjdyv~6dwaeenr5^w^h^khkg1romg5gdyicj$k0z99xn20fdb9x3io6q8e1mj^h9ra!487js7rt7a>nwh3uuyt0isbwu4^qi3fp8y9umhvj<jl9m3mdqgs$w87rmfi838tvqa8camud2<r7', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-21 15:26:31', '2021-04-21 15:26:31', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('v^xf52464ql$b6>dk~4p!nx6as9a0h!z3in26w7c<ln8vamga$xcbipf!61l66!$2~w1l^y^0wn0rzpnbk~ijgjh53dzt>>i3smx96e2wxt^px$qwedog$jt4ex^8ke37^<0uw1223u6tivo8lnt$6zwznxg!3p3k~uif78myr5cbbw!m7bc<$$$p$f!21u$2v0pb6lykf!dij9zipkcxna6dgs>lz^ox72b2p36wt>09i6tqi>zt8tc2', 'D8nwn<mIZzH0!Cwo$wGRa!Vqdcp0jkiW$HjSrxKGQ>!!Q$duUtFYVli!SqeibgY>LfkzAS', '2021-04-16 19:43:53', '2021-04-16 19:43:53', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('w$y~b0crityp6ga79>j89d28x33o7xs3l~4rofwvwwnq6~6~!oflfvt>$pncgpavbydgaf!s~fnyxn2xeu$~idq<<t>bf83xo60wmj04s~f9x2qgl852>1<ymg1$ywovmn92>$8n9<hw9ap02dwwpb0665ef2tw4gei94cuw$ti^ctlxa5s1h9zb^y$e<mq$cd^r2ot8uyxch4m91vjohjmf>zgg<~txrawtnvzmush<lmojgub~oyhco', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-20 06:12:06', '2021-04-20 06:12:06', '6qr737uiu3i~rgo9ow51wmo3m^2zx$<!7z~^2r27ngt27ln8e6bmtf2wv~oz!l<6o!0e4l', 1),
('whaus1os1g0u2>01rmo~~1mx>xa51s>367jmnbaglb<^nol>hz20i1wo4v0a20$gsx>d47^ydlxh3r>4brkq^ea2dpayh~4yjir$vibnc!piec>ijwim>$hy<be7<bg!f~dbt1e76smii^$cz!ui^<e26z9j>hitot58o2f<6yby3tmxd>9jkfzptrth8xj>nhaeo<4!abeheee6>^uyzq8imeftn1~s9ox2u$u>~v4$ho0b4$2>8snqq', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-21 22:37:52', '2021-04-21 22:37:52', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('ytkmwd5wop~kydiwglu6f9>duejmdwd^d>1br8171s0~43idj~cftvdbh9~phtm~f8ibqy0101imzh99q$f~r~dkf6tg2c^wd0mw^b$oh1mpn^8hbm>98qy2q4q4!4c0~59m<$e9q^yl6cqs9ao^zynyl0qb^9es$$fuaa6n9i$o1<ayb1yci9mpts4ndj5jqy>m2$q!^tp~xy83spfu8alh3zpie3pouq6!fx>w6g6u61pg5acsf9~1c', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-24 22:39:59', '2021-04-24 22:39:59', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('yxdpc7pzwtg2gzv^f^w1bf0jr!9lp485x>2$ob8885je363v>r2hpiby4r7meulfyb8en6hvv0y>afy6qvadytuv>txc7rduml3ny8q^0wf8ak51fz9vap^e7$4kj>e>>v91fl~qnitjgrlmgu!5dqr0z6wc2cxh!uw3upr9$82aruz>3pf$y2gj7fs~dabb3pfhow!qd^^llp4hgjl1twh17l1^>^ag<rb7oknmsj0^04qbgomqddxa3', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-22 14:58:51', '2021-04-22 14:58:51', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('y~l3q5a25>f77q>$dzlq34ivjrcwn$ftila8^h6^5hh67zsuex^rgn^u08x1vktnnul30g0n~l4ck!8rq4k!$2j0o6lr^h<q<x<v^smiwqoa46aeddl5yu!yjgxls8496vrx~3zpofwzvejfobtwbf<>d9reptx~f1<e6mjjkres<i1gu3>0bq3bd<<gn3regfiasrp3y7be1qrt0ukh0i349s~cnv>i^1u3y1q>bfrh4u$m<^g815hv8', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-20 05:55:35', '2021-04-20 05:55:35', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('~2!fh9>!fvgg0t9p>lvs1c93qs0fce~$079e^xpdy>6$571a!y^u^0gkpsn19xzmwb~~ldvvlyk^pmxkoeshbpn~<yol2sc~f6rp!q^mn9vq2dxgxriua72~$euq>r8vy~s~ls8^hxgx02c>4az$egvc4zt<81!~j2x87be>sorhego4wm3h$ylvwr9tbcolyzgz3<m7t0b!!^3>9dv>fzlhv!gafe><mfa1<vda9>iu91tngo7f^^5ea', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-21 22:29:19', '2021-04-21 22:29:19', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('~p<m3p8a6y9$~^!rpq7p9^ggmy9r7kf38u^~chijy<fgr8y1v4amxf2^w>uvo1kjirr8!u5w05a9q217vf^1>xqb19dccnaui$0ovx71e^287zs<u895>~yj0tpz^p~<1h0yh>w6z6i5b9dpgnd2sql5868u5t3vozwb6x<91$py0rv^>7y5jh9712evx72w>31m^os2dw52eg!<5gjp5jbvzqlftvs55ls4vjepdgtuu~t<e9ko3u3cu', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-17 22:54:58', '2021-04-17 22:54:58', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('~ue2^>6<vd~xv737th33wlv15bmi4r<<>rg~^9p!evc3eicg3ibu>guw9!dfv5vx412>cwtdh6t5s2pq9b5m13hce88168$xwz<q0~ip4on<txlihcz<2qipecw5481fm1b4~qf85^m19ucnq!trrp5a2nx<^ttgl7o~4hj>2owxuvq~ja!lpy<>9r~i>v9affbc79fv$ux01gqybavnvxz4rg9ce7<0j^klbkqf4v!sqbez4q^xqh9g8', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-20 06:27:39', '2021-04-20 06:27:39', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1),
('~zeqipr^r>sjhc$^j>rl0ar~ne3~akk5qma8sku~r5g1v$^ljcgrtf$7brurh>ukuklfx<ke^f81~11vaumpirwt809l^x<edh!frz35dyp0mo^<z62v!sou6uen65gyrte6hj3tt^49hj2xel~9u1u>ksaedcw2!i^14<7~>5t6f6!21o^c^t44932zarxwstthn7y3d!t~9k6>yq2f7m9p!d0$m313bnmotji>$d8y995qtt~duvhn9', 't2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', '2021-04-22 19:08:28', '2021-04-22 19:08:28', 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
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
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `idSession` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `idSucursal`, `nombre`, `colonia`, `calle`, `numero`, `referencia`, `createdAt`, `bandera`, `updatedAt`, `idSession`) VALUES
(1, '5srrtl1sy8cav~yl04^2et3y>lqj~8sics8061>dnja2774ch3~497>f7>pgexzzt2uz^<', 'Parian', 'Centro', 'Josefa Ortiz', 15, 'Referencia aqui: Fachada Amarilla', '2020-10-07 05:09:12', 0, '2020-10-07 05:09:12', ''),
(2, 'y7j2fgz5nlccj7>p$9c<sgz226qfi8r5p1adznhvtykiys^ly6u687f3l4gr4h>hcorvwx', 'Cyber Jurez', 'Centro', 'Juarez', 40, 'Referencia aqui: Contra esquina del tazon', '2020-10-07 05:11:15', 0, '2020-10-07 05:11:40', ''),
(3, 'se!9naxmn4d06f~6kz>z811f8a!wzup>^ca0j<<^u43mx42ryw$yy$97t8<0~2759juecu', 'Cyber Ness Parian', 'centro', 'juares', 57, 'junto a la entrada/salida del parian', '2020-10-28 00:54:55', 0, '2020-10-28 00:54:55', ''),
(4, 'wrb$y6g7z8$r71^rrfgeu!c!8769in0~70vxo>soq7w0guat~20qa!4!elgoj~!bk!322z', 'Parian', 'centro', 'juarez', 5, 'a un lado de entrada/salida al parian', '2020-10-31 04:12:53', 1, '2021-04-14 07:20:52', ''),
(5, 'hqkow7j$ejyps6wy<yno7h5s<d9n6jr^f9^pgwl5g75k4za~9aq8au0m4!yc0cn>gl3~pg', 'Cyber Juárez', 'Centro', 'Juárez', 1, 'Esquina', '2020-10-31 07:38:38', 0, '2020-10-31 07:39:37', ''),
(6, '6qr737uiu3i~rgo9ow51wmo3m^2zx$<!7z~^2r27ngt27ln8e6bmtf2wv~oz!l<6o!0e4l', 'una ', 'centro', 'alguna', 6, 'bla bla bla', '2021-04-14 07:21:30', 1, '2021-04-14 07:21:38', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` varchar(70) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `pass` varchar(32) DEFAULT NULL,
  `tipoUsuario` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `bandera` int(1) DEFAULT 1,
  `usuarioPhone` int(10) DEFAULT NULL,
  `idSession` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuario`, `pass`, `tipoUsuario`, `createdAt`, `updatedAt`, `bandera`, `usuarioPhone`, `idSession`) VALUES
('D8nwn<mIZzH0!Cwo$wGRa!Vqdcp0jkiW$HjSrxKGQ>!!Q$duUtFYVli!SqeibgY>LfkzAS', 'carlos', '>y6CmlnQLNbqee', 0, '2020-10-31 04:22:52', '2020-10-31 04:22:52', 1, 0, ''),
('R~9c2NMIY^<Pp^yuxP7pu54u~D47wSHVBF5CKrtwW52hZXgUmYoRYuut1onye6zLG~8W0K', 'juan camaney', 'mLLV!z!nL!KiQI', 0, '2021-04-14 07:23:13', '2021-04-14 07:23:13', 1, 2147483647, ''),
('t2V<JOUJfT8Bw^Hvd>AoP3ORenF^aB7IBvILgFsB5wfn9QYwZJ9PSP5CCG2fyIVP2MS<b7', 'juan', 'tKXnfu2Z6h>0Gn', 0, '2021-04-17 22:54:29', '2021-04-17 22:54:29', 1, 2147483647, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recargas`
--
ALTER TABLE `recargas`
  ADD UNIQUE KEY `folio` (`folio`);

--
-- Indices de la tabla `sessiones`
--
ALTER TABLE `sessiones`
  ADD UNIQUE KEY `idSession` (`idSession`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
