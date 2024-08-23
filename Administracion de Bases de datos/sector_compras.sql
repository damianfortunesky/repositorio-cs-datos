-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2023 at 06:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sector_compras`
--

-- --------------------------------------------------------

--
-- Table structure for table `alicuotas_iva`
--

CREATE TABLE `alicuotas_iva` (
  `pk_alicuota_IVA` int(11) NOT NULL,
  `alicuota_IVA` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `cantidadcomprasproveedores`
-- (See below for the actual view)
--
CREATE TABLE `cantidadcomprasproveedores` (
`pk_proveedor` int(11)
,`razon_social_proveedor` varchar(100)
,`cantidad_compras` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cantidadproveedoresporrubro`
-- (See below for the actual view)
--
CREATE TABLE `cantidadproveedoresporrubro` (
`rubro` varchar(50)
,`CantidadProveedores` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `centros_de_costos`
--

CREATE TABLE `centros_de_costos` (
  `pk_centro_costo` int(11) NOT NULL,
  `centro_costo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `codigos_postales`
--

CREATE TABLE `codigos_postales` (
  `pk_codigo_postal` int(11) NOT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `fk_localidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compras`
--

CREATE TABLE `compras` (
  `pk_compra` int(11) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `punto_venta_comprobante` varchar(10) DEFAULT NULL,
  `numero_comprobante` varchar(20) DEFAULT NULL,
  `percepcion_IIBB` decimal(10,2) DEFAULT NULL,
  `percepcion_IVA` decimal(10,2) DEFAULT NULL,
  `NoGravado` decimal(10,2) DEFAULT NULL,
  `fk_tipo_comprobante` int(11) DEFAULT NULL,
  `fk_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `condiciones_iva`
--

CREATE TABLE `condiciones_iva` (
  `pk_condicion_IVA` int(11) NOT NULL,
  `condicion_IVA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `datosproveedores`
-- (See below for the actual view)
--
CREATE TABLE `datosproveedores` (
`pk_proveedor` int(11)
,`razon_social_proveedor` varchar(100)
,`calle_proveedor` varchar(100)
,`altura_proveedor` int(11)
,`telefono_proveedor` varchar(20)
,`mail_proveedor` varchar(100)
,`tipo_contribuyente` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_pagos`
--

CREATE TABLE `detalle_pagos` (
  `pk_detalle_pagos` int(11) NOT NULL,
  `monto_pago` decimal(10,2) DEFAULT NULL,
  `fk_pago` int(11) DEFAULT NULL,
  `fk_medio_pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localidades`
--

CREATE TABLE `localidades` (
  `pk_localidad` int(11) NOT NULL,
  `localidad` varchar(40) DEFAULT NULL,
  `fk_provincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medios_pagos`
--

CREATE TABLE `medios_pagos` (
  `pk_medio_pago` int(11) NOT NULL,
  `medio_de_pago` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `pk_pago` int(11) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `numero_recibo` varchar(20) DEFAULT NULL,
  `fk_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `pk_pedido` int(11) NOT NULL,
  `cantidad_producto` int(11) DEFAULT NULL,
  `precio_unitario_producto` decimal(10,2) DEFAULT NULL,
  `fk_compra` int(11) DEFAULT NULL,
  `fk_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `pk_producto` int(11) NOT NULL,
  `producto` varchar(50) DEFAULT NULL,
  `fk_alicuota_IVA` int(11) DEFAULT NULL,
  `fk_centro_costo` int(11) DEFAULT NULL,
  `fk_unidad_medida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `pk_proveedor` int(11) NOT NULL,
  `CUIT_proveedor` varchar(11) DEFAULT NULL,
  `razon_social_proveedor` varchar(100) DEFAULT NULL,
  `calle_proveedor` varchar(100) DEFAULT NULL,
  `altura_proveedor` int(11) DEFAULT NULL,
  `piso_proveedor` int(11) DEFAULT NULL,
  `dto_proveedor` varchar(10) DEFAULT NULL,
  `telefono_proveedor` varchar(20) DEFAULT NULL,
  `mail_proveedor` varchar(100) DEFAULT NULL,
  `fk_tipo_contribuyente` int(11) DEFAULT NULL,
  `fk_rubro` int(11) DEFAULT NULL,
  `fk_condicion_IVA` int(11) DEFAULT NULL,
  `fk_codigo_postal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `proveedoresporregion`
-- (See below for the actual view)
--
CREATE TABLE `proveedoresporregion` (
`provincia` varchar(20)
,`localidad` varchar(40)
,`rubro` varchar(50)
,`razon_social_proveedor` varchar(100)
,`CUIT_proveedor` varchar(11)
,`dto_proveedor` varchar(10)
,`telefono_proveedor` varchar(20)
,`mail_proveedor` varchar(100)
,`calle_proveedor` varchar(100)
,`altura_proveedor` int(11)
,`piso_proveedor` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `proveedoresporrubro`
-- (See below for the actual view)
--
CREATE TABLE `proveedoresporrubro` (
`rubro` varchar(50)
,`CUIT_proveedor` varchar(11)
,`razon_social_proveedor` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `proveedoressincompras`
-- (See below for the actual view)
--
CREATE TABLE `proveedoressincompras` (
`pk_proveedor` int(11)
,`razon_social_proveedor` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--

CREATE TABLE `provincias` (
  `pk_provincia` int(11) NOT NULL,
  `provincia` varchar(20) DEFAULT NULL,
  `codigo_provincia` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rubros`
--

CREATE TABLE `rubros` (
  `pk_rubro` int(11) NOT NULL,
  `rubro` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_comprobantes`
--

CREATE TABLE `tipos_comprobantes` (
  `pk_tipo_comprobante` int(11) NOT NULL,
  `tipo_comprobante` varchar(50) DEFAULT NULL,
  `es_credito` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_contribuyentes`
--

CREATE TABLE `tipos_contribuyentes` (
  `pk_tipo_contribuyente` int(11) NOT NULL,
  `tipo_contribuyente` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unidades_medidas`
--

CREATE TABLE `unidades_medidas` (
  `pk_unidad_medida` int(11) NOT NULL,
  `unidad_medida` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vistacompras`
-- (See below for the actual view)
--
CREATE TABLE `vistacompras` (
`fecha_compra` date
,`numero_comprobante` varchar(20)
,`punto_venta_comprobante` varchar(10)
,`percepcion_IVA` decimal(10,2)
,`percepcion_IIBB` decimal(10,2)
,`NoGravado` decimal(10,2)
,`tipo_comprobante` varchar(50)
,`es_credito` varchar(1)
,`CUIT_proveedor` varchar(11)
,`razon_social_proveedor` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `cantidadcomprasproveedores`
--
DROP TABLE IF EXISTS `cantidadcomprasproveedores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cantidadcomprasproveedores`  AS SELECT `p`.`pk_proveedor` AS `pk_proveedor`, `p`.`razon_social_proveedor` AS `razon_social_proveedor`, count(0) AS `cantidad_compras` FROM (`proveedores` `p` join `compras` `c` on(`p`.`pk_proveedor` = `c`.`fk_proveedor`)) GROUP BY `p`.`razon_social_proveedor` ;

-- --------------------------------------------------------

--
-- Structure for view `cantidadproveedoresporrubro`
--
DROP TABLE IF EXISTS `cantidadproveedoresporrubro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cantidadproveedoresporrubro`  AS SELECT `r`.`rubro` AS `rubro`, count(`p`.`CUIT_proveedor`) AS `CantidadProveedores` FROM (`proveedores` `p` join `rubros` `r` on(`p`.`fk_rubro` = `r`.`pk_rubro`)) GROUP BY `r`.`rubro` ;

-- --------------------------------------------------------

--
-- Structure for view `datosproveedores`
--
DROP TABLE IF EXISTS `datosproveedores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `datosproveedores`  AS SELECT `p`.`pk_proveedor` AS `pk_proveedor`, `p`.`razon_social_proveedor` AS `razon_social_proveedor`, `p`.`calle_proveedor` AS `calle_proveedor`, `p`.`altura_proveedor` AS `altura_proveedor`, `p`.`telefono_proveedor` AS `telefono_proveedor`, `p`.`mail_proveedor` AS `mail_proveedor`, `tc`.`tipo_contribuyente` AS `tipo_contribuyente` FROM (`proveedores` `p` join `tipos_contribuyentes` `tc` on(`p`.`fk_tipo_contribuyente` = `tc`.`pk_tipo_contribuyente`)) ;

-- --------------------------------------------------------

--
-- Structure for view `proveedoresporregion`
--
DROP TABLE IF EXISTS `proveedoresporregion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proveedoresporregion`  AS SELECT `prv`.`provincia` AS `provincia`, `l`.`localidad` AS `localidad`, `r`.`rubro` AS `rubro`, `p`.`razon_social_proveedor` AS `razon_social_proveedor`, `p`.`CUIT_proveedor` AS `CUIT_proveedor`, `p`.`dto_proveedor` AS `dto_proveedor`, `p`.`telefono_proveedor` AS `telefono_proveedor`, `p`.`mail_proveedor` AS `mail_proveedor`, `p`.`calle_proveedor` AS `calle_proveedor`, `p`.`altura_proveedor` AS `altura_proveedor`, `p`.`piso_proveedor` AS `piso_proveedor` FROM ((((`proveedores` `p` join `rubros` `r` on(`p`.`fk_rubro` = `r`.`pk_rubro`)) join `codigos_postales` `cp` on(`p`.`fk_codigo_postal` = `cp`.`pk_codigo_postal`)) join `localidades` `l` on(`cp`.`fk_localidad` = `l`.`pk_localidad`)) join `provincias` `prv` on(`prv`.`pk_provincia` = `l`.`fk_provincia`)) ;

-- --------------------------------------------------------

--
-- Structure for view `proveedoresporrubro`
--
DROP TABLE IF EXISTS `proveedoresporrubro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proveedoresporrubro`  AS SELECT `r`.`rubro` AS `rubro`, `p`.`CUIT_proveedor` AS `CUIT_proveedor`, `p`.`razon_social_proveedor` AS `razon_social_proveedor` FROM (`proveedores` `p` join `rubros` `r` on(`p`.`fk_rubro` = `r`.`pk_rubro`)) ;

-- --------------------------------------------------------

--
-- Structure for view `proveedoressincompras`
--
DROP TABLE IF EXISTS `proveedoressincompras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proveedoressincompras`  AS SELECT `prv`.`pk_proveedor` AS `pk_proveedor`, `prv`.`razon_social_proveedor` AS `razon_social_proveedor` FROM (`proveedores` `prv` left join `compras` `c` on(`c`.`fk_proveedor` = `prv`.`pk_proveedor`)) WHERE `c`.`pk_compra` is null ;

-- --------------------------------------------------------

--
-- Structure for view `vistacompras`
--
DROP TABLE IF EXISTS `vistacompras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistacompras`  AS SELECT `c`.`fecha_compra` AS `fecha_compra`, `c`.`numero_comprobante` AS `numero_comprobante`, `c`.`punto_venta_comprobante` AS `punto_venta_comprobante`, `c`.`percepcion_IVA` AS `percepcion_IVA`, `c`.`percepcion_IIBB` AS `percepcion_IIBB`, `c`.`NoGravado` AS `NoGravado`, `tc`.`tipo_comprobante` AS `tipo_comprobante`, `tc`.`es_credito` AS `es_credito`, `p`.`CUIT_proveedor` AS `CUIT_proveedor`, `p`.`razon_social_proveedor` AS `razon_social_proveedor` FROM ((`compras` `c` join `proveedores` `p` on(`c`.`fk_proveedor` = `p`.`pk_proveedor`)) join `tipos_comprobantes` `tc` on(`c`.`fk_tipo_comprobante` = `tc`.`pk_tipo_comprobante`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alicuotas_iva`
--
ALTER TABLE `alicuotas_iva`
  ADD PRIMARY KEY (`pk_alicuota_IVA`);

--
-- Indexes for table `centros_de_costos`
--
ALTER TABLE `centros_de_costos`
  ADD PRIMARY KEY (`pk_centro_costo`);

--
-- Indexes for table `codigos_postales`
--
ALTER TABLE `codigos_postales`
  ADD PRIMARY KEY (`pk_codigo_postal`),
  ADD KEY `fk_localidad` (`fk_localidad`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`pk_compra`),
  ADD KEY `fk_tipo_comprobante` (`fk_tipo_comprobante`),
  ADD KEY `fk_proveedor` (`fk_proveedor`);

--
-- Indexes for table `condiciones_iva`
--
ALTER TABLE `condiciones_iva`
  ADD PRIMARY KEY (`pk_condicion_IVA`);

--
-- Indexes for table `detalle_pagos`
--
ALTER TABLE `detalle_pagos`
  ADD PRIMARY KEY (`pk_detalle_pagos`),
  ADD KEY `fk_pago` (`fk_pago`);

--
-- Indexes for table `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`pk_localidad`),
  ADD KEY `fk_provincia` (`fk_provincia`);

--
-- Indexes for table `medios_pagos`
--
ALTER TABLE `medios_pagos`
  ADD PRIMARY KEY (`pk_medio_pago`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`pk_pago`),
  ADD KEY `fk_proveedor` (`fk_proveedor`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pk_pedido`),
  ADD KEY `fk_compra` (`fk_compra`),
  ADD KEY `fk_producto` (`fk_producto`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`pk_producto`),
  ADD KEY `fk_alicuota_IVA` (`fk_alicuota_IVA`),
  ADD KEY `fk_centro_costo` (`fk_centro_costo`),
  ADD KEY `fk_unidad_medida` (`fk_unidad_medida`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`pk_proveedor`),
  ADD KEY `fk_tipo_contribuyente` (`fk_tipo_contribuyente`),
  ADD KEY `fk_rubro` (`fk_rubro`),
  ADD KEY `fk_condicion_IVA` (`fk_condicion_IVA`),
  ADD KEY `fk_codigo_postal` (`fk_codigo_postal`);

--
-- Indexes for table `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`pk_provincia`);

--
-- Indexes for table `rubros`
--
ALTER TABLE `rubros`
  ADD PRIMARY KEY (`pk_rubro`);

--
-- Indexes for table `tipos_comprobantes`
--
ALTER TABLE `tipos_comprobantes`
  ADD PRIMARY KEY (`pk_tipo_comprobante`);

--
-- Indexes for table `tipos_contribuyentes`
--
ALTER TABLE `tipos_contribuyentes`
  ADD PRIMARY KEY (`pk_tipo_contribuyente`);

--
-- Indexes for table `unidades_medidas`
--
ALTER TABLE `unidades_medidas`
  ADD PRIMARY KEY (`pk_unidad_medida`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `codigos_postales`
--
ALTER TABLE `codigos_postales`
  ADD CONSTRAINT `codigos_postales_ibfk_1` FOREIGN KEY (`fk_localidad`) REFERENCES `localidades` (`pk_localidad`);

--
-- Constraints for table `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`fk_tipo_comprobante`) REFERENCES `tipos_comprobantes` (`pk_tipo_comprobante`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`fk_proveedor`) REFERENCES `proveedores` (`pk_proveedor`);

--
-- Constraints for table `detalle_pagos`
--
ALTER TABLE `detalle_pagos`
  ADD CONSTRAINT `detalle_pagos_ibfk_1` FOREIGN KEY (`fk_pago`) REFERENCES `pagos` (`pk_pago`);

--
-- Constraints for table `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`fk_provincia`) REFERENCES `provincias` (`pk_provincia`);

--
-- Constraints for table `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`fk_proveedor`) REFERENCES `proveedores` (`pk_proveedor`);

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`fk_compra`) REFERENCES `compras` (`pk_compra`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`fk_producto`) REFERENCES `productos` (`pk_producto`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`fk_alicuota_IVA`) REFERENCES `alicuotas_iva` (`pk_alicuota_IVA`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`fk_centro_costo`) REFERENCES `centros_de_costos` (`pk_centro_costo`),
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`fk_unidad_medida`) REFERENCES `unidades_medidas` (`pk_unidad_medida`);

--
-- Constraints for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`fk_tipo_contribuyente`) REFERENCES `tipos_contribuyentes` (`pk_tipo_contribuyente`),
  ADD CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`fk_rubro`) REFERENCES `rubros` (`pk_rubro`),
  ADD CONSTRAINT `proveedores_ibfk_3` FOREIGN KEY (`fk_condicion_IVA`) REFERENCES `condiciones_iva` (`pk_condicion_IVA`),
  ADD CONSTRAINT `proveedores_ibfk_4` FOREIGN KEY (`fk_codigo_postal`) REFERENCES `codigos_postales` (`pk_codigo_postal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
