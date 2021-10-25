-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2021 a las 23:29:49
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_trd`
--
CREATE DATABASE IF NOT EXISTS `base_trd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `base_trd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `AREA_ID` int(30) NOT NULL,
  `AREA_DESCRIPCION` varchar(500) NOT NULL,
  `AREA_ESTADO` int(10) NOT NULL,
  `PROC_ID` int(10) NOT NULL,
  `AREA_REGISTRADORPOR` varchar(500) NOT NULL,
  `AREA_FECHACAMBIO` date NOT NULL,
  `AREA_INTERNA` int(10) NOT NULL,
  `TRD_ID` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trd_serie`
--

CREATE TABLE `trd_serie` (
  `TRD_ID_SERIE` varchar(500) NOT NULL,
  `TR_DESC_SERIE` varchar(500) NOT NULL,
  `TRD_EST_SERIE` int(10) NOT NULL,
  `TRD_ID` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trd_subserie`
--

CREATE TABLE `trd_subserie` (
  `TRD_ID_SUB` varchar(100) NOT NULL,
  `TRD_ID_DESC` varchar(500) NOT NULL,
  `TRD_ID_SERIE` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trd_udec`
--

CREATE TABLE `trd_udec` (
  `TRD_ID` varchar(500) NOT NULL,
  `TRD_DESCRIPCION` varchar(500) NOT NULL,
  `TRD_ESTADO` int(10) NOT NULL,
  `TRD_REGISTRADOPOR` int(50) NOT NULL,
  `TRD_FECHACAMBIO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`AREA_ID`),
  ADD KEY `Clave` (`TRD_ID`);

--
-- Indices de la tabla `trd_serie`
--
ALTER TABLE `trd_serie`
  ADD PRIMARY KEY (`TRD_ID_SERIE`),
  ADD KEY `TRD_ID` (`TRD_ID`);

--
-- Indices de la tabla `trd_subserie`
--
ALTER TABLE `trd_subserie`
  ADD PRIMARY KEY (`TRD_ID_SUB`),
  ADD KEY `TRD_ID_SERIE` (`TRD_ID_SERIE`);

--
-- Indices de la tabla `trd_udec`
--
ALTER TABLE `trd_udec`
  ADD PRIMARY KEY (`TRD_ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `Clave` FOREIGN KEY (`TRD_ID`) REFERENCES `trd_udec` (`TRD_ID`);

--
-- Filtros para la tabla `trd_serie`
--
ALTER TABLE `trd_serie`
  ADD CONSTRAINT `trd_serie_ibfk_1` FOREIGN KEY (`TRD_ID`) REFERENCES `trd_udec` (`TRD_ID`);

--
-- Filtros para la tabla `trd_subserie`
--
ALTER TABLE `trd_subserie`
  ADD CONSTRAINT `trd_subserie_ibfk_1` FOREIGN KEY (`TRD_ID_SERIE`) REFERENCES `trd_serie` (`TRD_ID_SERIE`);
--
-- Base de datos: `bdcolegio`
--
CREATE DATABASE IF NOT EXISTS `bdcolegio` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bdcolegio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `IDCARGO` int(11) NOT NULL,
  `NOMBRECARGO` varchar(50) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`IDCARGO`, `NOMBRECARGO`, `ESTADO`) VALUES
(3, 'ADMINISTADOR', b'1'),
(20, 'NIDIA MONROY', b'1'),
(21, 'asdasd', b'1'),
(22, 'DOCENTE', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `SEXO` char(2) DEFAULT NULL,
  `TELEFONO` char(10) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `TIPODOCUMENTO` char(2) DEFAULT NULL,
  `NUMDOCUMENTO` char(15) DEFAULT NULL,
  `IDUSUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDUSUARIO` int(11) NOT NULL,
  `NOMBREUSUARIO` varchar(50) DEFAULT NULL,
  `CLAVE` varchar(15) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL,
  `IDCARGO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDUSUARIO`, `NOMBREUSUARIO`, `CLAVE`, `ESTADO`, `IDCARGO`) VALUES
(1, 'deibyasierra', '@dmin_201/*', b'1', 3),
(2, 'ednavargas', 'Prueba', b'1', 1),
(3, 'deibyasierra', '123456', b'1', 2),
(4, 'prueba', '123456', b'1', 1),
(5, 'deiby', '123456', b'1', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IDCARGO`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDUSUARIO` (`IDUSUARIO`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `IDCARGO` (`IDCARGO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `IDCARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuarios` (`IDUSUARIO`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`IDCARGO`) REFERENCES `cargo` (`IDCARGO`);
--
-- Base de datos: `bdgymcultural`
--
CREATE DATABASE IF NOT EXISTS `bdgymcultural` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bdgymcultural`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `Codigo_cargo` int(11) NOT NULL,
  `Nombre_cargo` varchar(50) DEFAULT NULL,
  `Registradopore_cargo` varchar(100) DEFAULT NULL,
  `Fecha_modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`Codigo_cargo`, `Nombre_cargo`, `Registradopore_cargo`, `Fecha_modificacion`) VALUES
(2, 'EDUCADORA ESPECIAL', NULL, '2021-09-27'),
(3, 'DOCENTE', NULL, '2021-09-27'),
(4, 'ADMINISTADOR', NULL, '2021-09-27'),
(5, 'PSICOLOGO', NULL, '2021-09-27');

--
-- Disparadores `cargos`
--
DELIMITER $$
CREATE TRIGGER `CARGO_NO_APTO` BEFORE UPDATE ON `cargos` FOR EACH ROW BEGIN
IF(NEW.Nombre_cargo = 'ESTUDIANTE') THEN
   SET NEW.Nombre_cargo=OLD.Nombre_cargo;
   ELSEIF(NEW.Nombre_cargo = 'FUNCIONARIO') THEN
          SET NEW.Nombre_cargo = 'ADMINISTRATIVO';
          END IF;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `INSERTAR_CARGO` BEFORE UPDATE ON `cargos` FOR EACH ROW BEGIN
IF(NEW.Nombre_cargo ='DOCENTES') THEN 
SET NEW.Nombre_cargo =OLD.Nombre_cargo;
ELSEIF(NEW.Nombre_cargo= 'MAESTRO') THEN
SET NEW.Nombre_cargo='DOCENTE ESPECIAL';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosfamiliares`
--

CREATE TABLE `datosfamiliares` (
  `Codigo` int(11) NOT NULL,
  `NombreMadre` varchar(150) NOT NULL,
  `NombrePadre` varchar(150) NOT NULL,
  `OcupacionMadre` varchar(150) NOT NULL,
  `OcupacionPadre` varchar(150) NOT NULL,
  `NivelEducativoPadre` varchar(150) NOT NULL,
  `NivelEducativoMadre` varchar(150) NOT NULL,
  `Nhermanos` varchar(150) NOT NULL,
  `LugarOcupa` varchar(150) NOT NULL,
  `ConformacionFamiliar` varchar(150) NOT NULL,
  `identificacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `datosfamiliares`
--

INSERT INTO `datosfamiliares` (`Codigo`, `NombreMadre`, `NombrePadre`, `OcupacionMadre`, `OcupacionPadre`, `NivelEducativoPadre`, `NivelEducativoMadre`, `Nhermanos`, `LugarOcupa`, `ConformacionFamiliar`, `identificacion`) VALUES
(1, 'NIDIA ', 'ARMANDO', 'MODISTA', 'CONSTRUCTOR', 'PRIMARIA', 'BACHILLER', '5', '4', 'PADRE,MADRE,HERMANOS', '101012');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosmedicos`
--

CREATE TABLE `datosmedicos` (
  `CodigoDatosMedicos` int(11) NOT NULL,
  `discapacidad` varchar(150) NOT NULL,
  `Entidad` varchar(150) NOT NULL,
  `discapacidadBasica` varchar(150) NOT NULL,
  `Diagnostico` varchar(150) NOT NULL,
  `Identificacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `datosmedicos`
--

INSERT INTO `datosmedicos` (`CodigoDatosMedicos`, `discapacidad`, `Entidad`, `discapacidadBasica`, `Diagnostico`, `Identificacion`) VALUES
(1, 'AUDITIVA', 'CONVIDA', 'AUDITIVA/CRITICA', 'PROCESO DE ENSEÑANZA', '101012');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosvaloracion`
--

CREATE TABLE `datosvaloracion` (
  `Codigo_Valoracion` int(11) NOT NULL,
  `Acompa` varchar(150) NOT NULL,
  `Parentesco` varchar(150) NOT NULL,
  `Radicado` varchar(150) NOT NULL,
  `Fecha_Radicado` date NOT NULL,
  `documentos` varchar(150) NOT NULL,
  `ObservacionesValoracion` varchar(150) NOT NULL,
  `Datos_Academicos` varchar(150) NOT NULL,
  `Observaciones_Finales` varchar(150) NOT NULL,
  `Codigo_solicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Identificacion_empleado` varchar(35) NOT NULL,
  `Nombre_empleado` varchar(100) DEFAULT NULL,
  `Apellido_empleado` varchar(100) DEFAULT NULL,
  `Correo_empleado` varchar(100) DEFAULT NULL,
  `Telefono_empleado` varchar(35) DEFAULT NULL,
  `Estudios_empleado` varchar(100) DEFAULT NULL,
  `Codigo_usuario` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Identificacion_empleado`, `Nombre_empleado`, `Apellido_empleado`, `Correo_empleado`, `Telefono_empleado`, `Estudios_empleado`, `Codigo_usuario`) VALUES
('1073704700', 'DEIBY', 'ARMANDO', 'deibysierra@gmail.com', '3005374308', 'INGENIERO', '1073704700'),
('2331', '', 'aad', '', '', '', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `Identificacion_estudiante` varchar(50) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Apellido` varchar(150) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  `Barrio` varchar(100) NOT NULL,
  `Edad` varchar(15) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Correo` varchar(150) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `TipoVivienda` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`Identificacion_estudiante`, `Nombre`, `Apellido`, `FechaNacimiento`, `Ciudad`, `Barrio`, `Edad`, `Direccion`, `Correo`, `Telefono`, `TipoVivienda`) VALUES
('101012', 'DEIBY', 'SIERRA', '2021-10-06', 'SOACHA', 'UBATE', '26', 'CALLE 10 N 2 A 12', 'DEIBYSIERRA@GMAIL.COM', 3005374, 'PROPIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(500) NOT NULL,
  `Apellido` varchar(500) NOT NULL,
  `Codigo_solicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Id`, `Nombre`, `Apellido`, `Codigo_solicitud`) VALUES
(8, 'deiby', 'sierra', 4),
(9, 'aa', 'add', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `Codigo_solicitud` int(11) NOT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `Identificacion_estudiante` varchar(50) NOT NULL,
  `Identificacion_empleado` varchar(35) NOT NULL,
  `Estado` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`Codigo_solicitud`, `fecha_solicitud`, `Identificacion_estudiante`, `Identificacion_empleado`, `Estado`) VALUES
(4, '2021-10-14', '101012', '1073704700', 'ACTIVA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Codigo_Usuario` varchar(100) NOT NULL,
  `Nombre_usuario` varchar(100) DEFAULT NULL,
  `Contraseña_usuario` varchar(100) DEFAULT NULL,
  `Registradopor_usuario` varchar(100) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Codigo_cargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Codigo_Usuario`, `Nombre_usuario`, `Contraseña_usuario`, `Registradopor_usuario`, `Fecha`, `Codigo_cargo`) VALUES
('', '1073704700', '12345678', NULL, '2021-10-15', 4),
('1000129896', 'deibyasierra', '@dmin_201/*', NULL, '2021-10-06', 4),
('1073704700', 'ADMIN', 'ADMIN', NULL, '2021-10-05', 4),
('123456', 'dsierra', '123456', NULL, '2021-10-14', 4),
('2331', 'deibyasierra', '@dmin_201/*', NULL, '2021-10-06', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`Codigo_cargo`);

--
-- Indices de la tabla `datosfamiliares`
--
ALTER TABLE `datosfamiliares`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `DatosFamiliares-Estudiante` (`identificacion`);

--
-- Indices de la tabla `datosmedicos`
--
ALTER TABLE `datosmedicos`
  ADD PRIMARY KEY (`CodigoDatosMedicos`),
  ADD KEY `DatosMedicos-Estudiante` (`Identificacion`);

--
-- Indices de la tabla `datosvaloracion`
--
ALTER TABLE `datosvaloracion`
  ADD PRIMARY KEY (`Codigo_Valoracion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Identificacion_empleado`),
  ADD KEY `Codigo_usuario` (`Codigo_usuario`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`Identificacion_estudiante`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`Codigo_solicitud`),
  ADD KEY `SOLI-EMPLE` (`Identificacion_empleado`),
  ADD KEY `SOLI-ESTU` (`Identificacion_estudiante`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Codigo_Usuario`),
  ADD KEY `Codigo_cargo` (`Codigo_cargo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `Codigo_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `datosfamiliares`
--
ALTER TABLE `datosfamiliares`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `datosmedicos`
--
ALTER TABLE `datosmedicos`
  MODIFY `CodigoDatosMedicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `datosvaloracion`
--
ALTER TABLE `datosvaloracion`
  MODIFY `Codigo_Valoracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `Codigo_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datosfamiliares`
--
ALTER TABLE `datosfamiliares`
  ADD CONSTRAINT `DatosFamiliares-Estudiante` FOREIGN KEY (`identificacion`) REFERENCES `estudiante` (`Identificacion_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datosmedicos`
--
ALTER TABLE `datosmedicos`
  ADD CONSTRAINT `DatosMedicos-Estudiante` FOREIGN KEY (`Identificacion`) REFERENCES `estudiante` (`Identificacion_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado-usuario` FOREIGN KEY (`Identificacion_empleado`) REFERENCES `usuario` (`Codigo_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `SOLI-EMPLE` FOREIGN KEY (`Identificacion_empleado`) REFERENCES `empleado` (`Identificacion_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SOLI-ESTU` FOREIGN KEY (`Identificacion_estudiante`) REFERENCES `estudiante` (`Identificacion_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Codigo_cargo`) REFERENCES `cargos` (`Codigo_cargo`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `bdsys`
--
CREATE DATABASE IF NOT EXISTS `bdsys` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bdsys`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `IDCARGO` int(11) NOT NULL,
  `NOMBRECARGO` varchar(20) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`IDCARGO`, `NOMBRECARGO`, `ESTADO`) VALUES
(1, 'DOCENTE', b'1'),
(2, 'MAESTRO', b'1'),
(3, 'COLEGA', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IDEMPLEADO` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL,
  `TELEFONO` char(9) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `TIPODOCUMENTO` char(1) DEFAULT NULL,
  `NUMERODOCUMENTO` char(11) DEFAULT NULL,
  `IDUSUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSUARIO` int(11) NOT NULL,
  `NOMBREUSUARIO` varchar(20) DEFAULT NULL,
  `CLAVE` varchar(10) DEFAULT NULL,
  `ESTADO` bit(1) DEFAULT NULL,
  `IDCARGO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `NOMBREUSUARIO`, `CLAVE`, `ESTADO`, `IDCARGO`) VALUES
(1, 'deibyasierra', '@dmin_201/', b'1', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IDCARGO`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IDEMPLEADO`),
  ADD KEY `FK_EMPLEADO_USU` (`IDUSUARIO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `FK_USUARIO_CARGO` (`IDCARGO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `IDCARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `IDEMPLEADO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_EMPLEADO_USU` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_USUARIO_CARGO` FOREIGN KEY (`IDCARGO`) REFERENCES `cargo` (`IDCARGO`);
--
-- Base de datos: `challenge-sofka`
--
CREATE DATABASE IF NOT EXISTS `challenge-sofka` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `challenge-sofka`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sofka_categoria`
--

CREATE TABLE `sofka_categoria` (
  `cate_id` int(11) NOT NULL,
  `cate_descripcion` varchar(50) NOT NULL,
  `cate_fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sofka_categoria`
--

INSERT INTO `sofka_categoria` (`cate_id`, `cate_descripcion`, `cate_fecha_registro`) VALUES
(1, 'HISTORIA', '2021-10-25'),
(2, 'MATEMATICAS', '2021-10-25'),
(3, 'BIOLOGIA', '2021-10-25'),
(4, 'INFORMATICA', '2021-10-25'),
(5, 'DEPORTES', '2021-10-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sofka_jugador`
--

CREATE TABLE `sofka_jugador` (
  `juga_id` int(11) NOT NULL,
  `juga_nombre` varchar(100) NOT NULL,
  `juga_fechaRegistro` date NOT NULL,
  `juga_acumulado` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sofka_jugador`
--

INSERT INTO `sofka_jugador` (`juga_id`, `juga_nombre`, `juga_fechaRegistro`, `juga_acumulado`) VALUES
(1, 'JUAN GABRIEL BUENAVENTURA', '2021-10-25', 0),
(2, 'GONZALEZ VANEGAS', '2021-10-25', 50000),
(3, 'JUAN GABRIEL BUENAVENTURA', '2021-10-25', 120000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sofka_preguntas`
--

CREATE TABLE `sofka_preguntas` (
  `preg_id` int(11) NOT NULL,
  `preg_descripcion` varchar(500) NOT NULL,
  `preg_fecha_registro` date NOT NULL,
  `cate_id` int(11) NOT NULL,
  `preg_dificultad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sofka_preguntas`
--

INSERT INTO `sofka_preguntas` (`preg_id`, `preg_descripcion`, `preg_fecha_registro`, `cate_id`, `preg_dificultad`) VALUES
(1, 'En qué año descubrió Cristóbal Colón, América.', '0000-00-00', 1, 'BAJA'),
(2, '¿De qué nacionalidad era Adolf Hitler?', '0000-00-00', 1, 'MEDIA-BAJA'),
(3, '¿Quién dijo que la tierra giraba alrededor del sol?', '0000-00-00', 1, 'MEDIA'),
(4, '¿Qué función tenían las pirámides de Egipto?', '0000-00-00', 1, 'ALTA'),
(5, 'Qué volcán devastó Pompeya.', '0000-00-00', 1, 'MUY ALTA'),
(6, 'Adivina cuantos años tengo sabiendo que la tercera parte de ellos menos 1 es igual a la sexta parte', '0000-00-00', 2, 'MEDIA-BAJA'),
(7, 'Cuanto equivale PI', '0000-00-00', 2, 'BAJA'),
(8, 'Que formula es es dos veces el radiopor ?', '0000-00-00', 2, 'MEDIA'),
(9, 'POR UN BOLSO HEMOS PAGADO 50 EUROS, M?S EL 21% DE IVA. ?CU?NTO HEMOS TENIDO QUE PAGAR EN TOTAL?', '0000-00-00', 2, 'ALTA'),
(10, '(-3)? + (-2)? - (-3)? + (-1)? =', '0000-00-00', 2, 'MUY ALTA'),
(11, 'Las algas y protozoos pertenecen al reino : ', '0000-00-00', 3, 'BAJA'),
(12, 'La adenina y la guanina son bases nitrogenadas:', '0000-00-00', 3, 'MEDIA'),
(13, 'Las sustancias organicas elementales que solo son usadas en cantidades diminutas por el cuerpo son llamadas:', '0000-00-00', 3, 'MEDIA-BAJA'),
(14, 'La tercera etapa en el desarrollo de los animales es:', '0000-00-00', 3, 'ALTA'),
(15, 'Los hijos varones de una madre daltonica y de un padre no daltonico\r\nseran: ', '0000-00-00', 3, 'MUY ALTA'),
(16, '¿Cual de estos no es un navegador?', '0000-00-00', 4, 'BAJA'),
(17, 'Cual de la siguiente opciones no es un motor de busqueda?', '0000-00-00', 4, 'MEDIA-BAJA'),
(18, 'El termino hw se refiere a componentes f?sicos de la computadora, como el monitor, el teclado, los chips de memoria y el disco duro.', '0000-00-00', 4, 'MEDIA'),
(19, 'El esquema de datos formación se corresponde con el esquema de acción:', '2021-10-25', 4, 'ALTA'),
(20, 'PREGUNTA: En C/C++, dentro de un subprograma, un argumento:\r\n', '2021-10-25', 4, 'MUY ALTA'),
(21, '¿Cuántos kilómetros se corren aproximadamente en una maratón?\r\n', '2021-10-25', 5, 'BAJA'),
(22, 'Si hablamos del jugador boya, estamos hablando de\r\n', '2021-10-25', 5, 'MEDIA-BAJA'),
(23, '¿Cómo se llama en tenis un punto de saque directo?\r\n', '2021-10-25', 5, 'MEDIA'),
(24, 'En balonmano, si un equipo no tiene intención clara de atacar y pretende perder tiempo, el arbitro puede pitar…\r\n', '2021-10-24', 5, 'ALTA'),
(25, '¿Con cuántos jugadores en pista juega un equipo de voleibol?\r\n', '2021-10-25', 5, 'MUY ALTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sofka_respuestas`
--

CREATE TABLE `sofka_respuestas` (
  `resp_id` int(11) NOT NULL,
  `resp_descripcion` varchar(500) NOT NULL,
  `resp_correcta` varchar(100) NOT NULL,
  `preg_id` int(11) NOT NULL,
  `resp_opc2` varchar(100) NOT NULL,
  `resp_opc3` varchar(100) NOT NULL,
  `resp_opc4` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sofka_respuestas`
--

INSERT INTO `sofka_respuestas` (`resp_id`, `resp_descripcion`, `resp_correcta`, `preg_id`, `resp_opc2`, `resp_opc3`, `resp_opc4`) VALUES
(1, '1492', '1492', 1, '1592', '1498', '1491'),
(2, 'ARISTARCO DE SAMOS', 'ARISTARCO DE SAMOS', 3, 'GALILEO GALILEI', 'NICOLAS COPERNICO', 'TODOS LOS ANTERIORES'),
(3, 'ERAN MONUMENTOS EN HONOR A LOS DIOSES.', 'ERAN MONUMENTOS FUNERARIOS.', 4, 'ERAN MONUMENTOS EN HONOR A LOS DIOSES.', 'ERAN MONUMENTOS PARA HONRAR EN VIDA A SUS FARAONES.', 'ERAN MONUMENTOS EN HONOR A LOS ANIMALES.'),
(4, 'EL ETNA', 'EL VESUBIO', 5, 'EL VESUBIO', 'EL SANTA HELENA', 'EL NEVADO DEL RUIZ'),
(5, 'COLOMBIANA', 'ALEMAN', 2, 'FRANCES', 'ITALIANO', 'ALEMAN'),
(6, '10', '6', 6, '6', '8', '7'),
(7, '3,141516', '3,141516', 7, '3,141594', '3,141595', '3,141596'),
(8, 'DIAMETRO DE UN CIRCULO', 'SUPERFICIE DE UN CIRCULO', 8, 'SUPERFICIE DE UN CIRCULO', 'VOLUMEN DE UN CILINDRO', 'SUPERFICIE CUADRATICA'),
(9, '60', '60,50', 9, '60,50', '61', '65'),
(10, '-10', '-9', 10, '-9', '-11', '-15'),
(11, 'ANIMALIA', 'PROTISTA', 11, 'FUNGI', 'PLANTAE', 'PROTISTA'),
(12, 'PIRIMIDINAS', 'PURINAS', 12, 'PURINAS', 'PIROXINAS', 'CITOSINAS'),
(13, 'ELEMENTOS TRAZA', 'ELEMENTOS TRAZA', 13, 'HORMONAS', 'MINERALES', 'VITAMINAS'),
(14, 'GASTRULACION', 'ORGANOGONESIS', 14, 'ORGANOGONESIS', 'SEGMENTACION', 'MADURACION'),
(15, '50 % DALTONICOS Y 50 % NORMALES.', 'TODOS DALTONICOS', 15, '50 % DALTONICOS Y 50 % NORMALES.', 'TODOS DALTONICOS', '100 % NORMALES'),
(16, 'MOZILA', 'TURBONET', 16, 'CHROME', 'OPERA', 'TURBONET'),
(17, 'YAHOO', 'MICROSOFT OFFICE', 17, 'GOOGLE ', 'MICROSOFT OFFICE', 'BING'),
(18, 'FIRMWARE', 'HARDWARE', 18, 'SALIDA', 'SOFTWARE', 'HARDWARE'),
(19, 'SECUENCIA', 'ITERACION', 19, 'ITERACION', 'SELECCION', 'TUPLA'),
(20, 'NO PUEDE CAMBIAR DE TIPO', 'NO PUEDE CAMBIAR DE TIPO', 20, 'PUEDE CAMBIAR DE TIPO SI SE PASA POR VALOR', 'PUEDE CAMBIAR DE TIPO SI SE PASA POR REFERENCIA', 'NUNCA PUEDE CAMBIAR DE VALOR'),
(21, '42', '42', 21, '65', '15', '19'),
(22, 'WATERPOLO', 'WATERPOLO', 22, 'VOLEIBOL', 'HOCKEY SOBRE PATINES', 'FUTBOL'),
(23, 'ACE', 'ACE', 23, 'LOVE', 'REVES', 'DERECHO'),
(24, 'GOL', 'PASIVO', 24, 'PASIVO', 'PASOS', 'FALTA'),
(25, '6', '6', 25, '7', '8', '9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sofka_ronda`
--

CREATE TABLE `sofka_ronda` (
  `rond_id` int(11) NOT NULL,
  `rond_descripcion` int(100) NOT NULL,
  `rond_premio` double NOT NULL,
  `preg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sofka_ronda`
--

INSERT INTO `sofka_ronda` (`rond_id`, `rond_descripcion`, `rond_premio`, `preg_id`) VALUES
(1, 1, 50000, 1),
(2, 1, 50000, 7),
(4, 1, 50000, 11),
(5, 1, 50000, 16),
(6, 1, 50000, 21),
(7, 2, 70000, 2),
(8, 2, 70000, 6),
(9, 2, 70000, 13),
(10, 2, 70000, 17),
(11, 2, 70000, 22),
(12, 3, 100000, 3),
(13, 3, 100000, 8),
(14, 3, 100000, 12),
(15, 3, 100000, 18),
(16, 3, 100000, 23),
(17, 4, 150000, 4),
(18, 4, 150000, 9),
(19, 4, 150000, 14),
(20, 4, 150000, 19),
(21, 4, 150000, 24),
(22, 5, 200000, 5),
(23, 5, 200000, 10),
(24, 5, 200000, 15),
(25, 5, 200000, 20),
(26, 5, 200000, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sofka_ronda_jugador`
--

CREATE TABLE `sofka_ronda_jugador` (
  `id_ronda_jugador` int(11) NOT NULL,
  `juga_id` int(11) NOT NULL,
  `rond_id` int(11) NOT NULL,
  `fecha_juego` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sofka_categoria`
--
ALTER TABLE `sofka_categoria`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indices de la tabla `sofka_jugador`
--
ALTER TABLE `sofka_jugador`
  ADD PRIMARY KEY (`juga_id`);

--
-- Indices de la tabla `sofka_preguntas`
--
ALTER TABLE `sofka_preguntas`
  ADD PRIMARY KEY (`preg_id`),
  ADD KEY `pregunta-categoria` (`cate_id`);

--
-- Indices de la tabla `sofka_respuestas`
--
ALTER TABLE `sofka_respuestas`
  ADD PRIMARY KEY (`resp_id`),
  ADD KEY `Respuesta-Pregunta` (`preg_id`);

--
-- Indices de la tabla `sofka_ronda`
--
ALTER TABLE `sofka_ronda`
  ADD PRIMARY KEY (`rond_id`),
  ADD KEY `ronda_pregunta` (`preg_id`);

--
-- Indices de la tabla `sofka_ronda_jugador`
--
ALTER TABLE `sofka_ronda_jugador`
  ADD PRIMARY KEY (`id_ronda_jugador`),
  ADD KEY `jugador_ronda` (`juga_id`),
  ADD KEY `ronda_ronda_jugador` (`rond_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sofka_categoria`
--
ALTER TABLE `sofka_categoria`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sofka_jugador`
--
ALTER TABLE `sofka_jugador`
  MODIFY `juga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sofka_preguntas`
--
ALTER TABLE `sofka_preguntas`
  MODIFY `preg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `sofka_respuestas`
--
ALTER TABLE `sofka_respuestas`
  MODIFY `resp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `sofka_ronda`
--
ALTER TABLE `sofka_ronda`
  MODIFY `rond_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `sofka_ronda_jugador`
--
ALTER TABLE `sofka_ronda_jugador`
  MODIFY `id_ronda_jugador` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sofka_preguntas`
--
ALTER TABLE `sofka_preguntas`
  ADD CONSTRAINT `pregunta-categoria` FOREIGN KEY (`cate_id`) REFERENCES `sofka_categoria` (`cate_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sofka_respuestas`
--
ALTER TABLE `sofka_respuestas`
  ADD CONSTRAINT `Respuesta-Pregunta` FOREIGN KEY (`preg_id`) REFERENCES `sofka_preguntas` (`preg_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sofka_ronda`
--
ALTER TABLE `sofka_ronda`
  ADD CONSTRAINT `ronda_pregunta` FOREIGN KEY (`preg_id`) REFERENCES `sofka_preguntas` (`preg_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sofka_ronda_jugador`
--
ALTER TABLE `sofka_ronda_jugador`
  ADD CONSTRAINT `jugador_ronda` FOREIGN KEY (`juga_id`) REFERENCES `sofka_jugador` (`juga_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ronda_ronda_jugador` FOREIGN KEY (`rond_id`) REFERENCES `sofka_ronda` (`rond_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `curso_sql`
--
CREATE DATABASE IF NOT EXISTS `curso_sql` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `curso_sql`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `CÓDIGOCLIENTE` varchar(4) NOT NULL,
  `EMPRESA` varchar(24) DEFAULT NULL,
  `DIRECCIÓN` varchar(19) DEFAULT NULL,
  `POBLACIÓN` varchar(9) DEFAULT NULL,
  `TELÉFONO` int(9) DEFAULT NULL,
  `RESPONSABLE` varchar(17) DEFAULT NULL,
  `HISTORIAL` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`CÓDIGOCLIENTE`, `EMPRESA`, `DIRECCIÓN`, `POBLACIÓN`, `TELÉFONO`, `RESPONSABLE`, `HISTORIAL`) VALUES
('CT01', 'BELTRÁN E HIJOS', 'LAS FUENTES 78', 'MADRID', 914456435, 'ANGEL MARTÍNEZ', NULL),
('CT02', 'LA MODERNA', 'LA PALOMA 123', 'OVIEDO', 985323434, 'JUAN GARCÍA', NULL),
('CT03', 'EL ESPAÑOLITO', 'MOTORES 34', 'BARCELONA', 934565343, 'ANA FERNÁNDEZ', NULL),
('CT04', 'EXPORTASA', 'VALLECAS 34', 'MADRID', 913452378, 'ELVIRA GÓMEZ', NULL),
('CT06', 'CONFECCIONES AMPARO', 'LOS MOROS 23', 'GIJÓN', 985754332, 'LUÍS ÁLVAREZ', NULL),
('CT07', 'LA CASA DEL JUGUETE', 'AMÉRICA 45', 'MADRID', 912649987, 'ELÍAS PÉREZ', NULL),
('CT08', 'JUGUETERÍA SUÁREZ', 'PARIS 123', 'BARCELONA', 933457866, 'JUAN GARCÍA', NULL),
('CT09', 'ALMACÉN POPULAR', 'LAS FUENTES 124', 'BILBAO', 942347127, 'JOSÉ ÁLVAREZ', NULL),
('CT10', 'FERETERÍA EL CLAVO', 'PASEO DE ÁLAMOS 78', 'MADRID', 914354866, 'MANUEL MENÉNDEZ', NULL),
('CT11', 'JUGUETES MARTÍNEZ', 'VIA LAYETANA 245', 'BARCELONA', 936628554, 'FRANCISCO CUEVAS', NULL),
('CT12', 'FERNÁNDEZ SL', 'PASEO DEL MAR 45', 'SANTANDER', 942049586, 'ELISA COLLADO', NULL),
('CT13', 'CONFECCIONES ARTÍMEZ', 'GENERAL PERÓN 45', 'A CORUÑA', 981345239, 'ESTEBAN PASCUAL', NULL),
('CT14', 'DEPORTES GARCÍA', 'GUZMÁN EL BUENO 45', 'MADRID', 913299475, 'ANA JIMÉNEZ', NULL),
('CT15', 'EXCLUSIVAS FERNÁNDEZ', 'LLOBREGAT 250', 'BARCELONA', 939558365, 'LUISA FERNÁNDEZ', NULL),
('CT16', 'DEPORTES MORÁN', 'AUTONOMÍA 45', 'LUGO', 982986944, 'JOSÉ MANZANO', NULL),
('CT17', 'BAZAR FRANCISCO', 'CARMEN 45', 'ZAMORA', 980495288, 'CARLOS BELTRÁN', NULL),
('CT18', 'JUGUETES LA SONRISA', 'LA BAÑEZA 67', 'LEÓN', 987945368, 'FAUSTINO PÉREZ', NULL),
('CT19', 'CONFECCIONES GALÁN', 'FUENCARRAL 78', 'MADRID', 913859234, 'JUAN GARCÍA', NULL),
('CT20', 'LA CURTIDORA', 'OLIVARES 3', 'MÁLAGA', 953756259, 'MARÍA GÓMEZ', NULL),
('CT21', 'LÍNEA JOVEN', 'SIERPES 78', 'SEVILLA', 953452567, 'ASUNCIÓN SALADO', NULL),
('CT22', 'BAZAR EL BARAT', 'DIAGONAL 56', 'BARCELONA', 936692866, 'ELISA DAPENA', NULL),
('CT23', 'EL PALACIO DE LA MODA', 'ORTEGA Y GASSET 129', 'MADRID', 927785235, 'LAURA CARRASCO', NULL),
('CT24', 'SÁEZ Y CÍA', 'INFANTA MERCEDS 23', 'SEVILLA', 954869234, 'MANUEL GUERRA', NULL),
('CT25', 'DEPORTES EL MADRILEÑO', 'CASTILLA 345', 'ZARAGOZA', 976388934, 'CARLOS GONZÁLEZ', NULL),
('CT26', 'FERRETERÍA LA ESCOBA', 'ORENSE 7', 'MADRID', 918459346, 'JOSÉ GARCÍA', NULL),
('CT27', 'JUGUETES EL BARATO', 'VÍA AUGUSTA 245', 'BARCELONA', 933486984, 'ELVIRA IGLESIAS', NULL),
('CT28', 'CONFECCIONES HERMINIA', 'CORRIDA 345', 'GIJÓN', 985597315, 'ABEL GONZÁLEZ', NULL),
('CT30', 'BAZAR EL ARGENTINO', 'ATOCHA 55', 'MADRID', 912495973, 'ADRIÁN ÁLVAREZ', NULL),
('CT31', 'LA TIENDA ELEGANTE', 'EL COMENDADOR 67', 'ZARAGOZA', 975694035, 'JOSÉ PASCUAL', NULL),
('CT32', 'DEPORTES NAUTICOS GARCÍA', 'JUAN FERNÁNDEZ 89', 'ÁVILA', 920268648, 'JUAN CONRADO', NULL),
('CT33', 'CONFECCIONES RUIZ', 'LLOBREGAT 345', 'BARCELONA', 934587615, 'CARLOS SANZ', NULL),
('CT34', 'BAZAR LA FARAONA', 'CASTILLA Y LEÓN 34', 'MADRID', 915483627, 'ANGEL SANTAMARÍA', NULL),
('CT35', 'FERRETERÍA EL MARTILLO', 'CASTELLANOS 205', 'SALAMANCA', 923548965, 'JOAQUÍN FERNANDEZ', NULL),
('CT36', 'JUGUETES EDUCATIVOS SANZ', 'ORENSE 89', 'MADRID', 916872354, 'PEDRO IGLESIAS', NULL),
('CT37', 'ALMACENES FERNANDEZ', 'ANTÓN 67', 'TERUEL', 978564025, 'MARIA ARDANZA', NULL),
('CT38', 'CONFECCIONES MÓNICA', 'MOTORES 67', 'BARCELONA', 935681245, 'PEDRO SERRANO', NULL),
('CT39', 'FERRETERÍA LIMA', 'VALLECAS 45', 'MADRID', 913532785, 'LUIS GARCÍA', NULL),
('CT40', 'DEPORTES EL BRASILEÑO', 'ABEL MARTÍNEZ 67', 'SALAMANCA', 921548762, 'CARLOS GÓMEZ', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `NÚMERODEPEDIDO` int(4) NOT NULL,
  `CÓDIGOCLIENTE` varchar(4) DEFAULT NULL,
  `FECHADEPEDIDO` varchar(10) DEFAULT NULL,
  `FORMADEPAGO` varchar(8) DEFAULT NULL,
  `DESCUENTO` decimal(3,2) DEFAULT NULL,
  `ENVIADO` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`NÚMERODEPEDIDO`, `CÓDIGOCLIENTE`, `FECHADEPEDIDO`, `FORMADEPAGO`, `DESCUENTO`, `ENVIADO`) VALUES
(1, 'CT01', '11/03/2000', 'CONTADO', '0.02', 'VERDADERO'),
(3, 'CT23', '18/03/2000', 'APLAZADO', '0.06', 'FALSO'),
(5, 'CT25', '31/03/2000', 'CONTADO', '0.09', 'FALSO'),
(7, 'CT12', '12/04/2000', 'CONTADO', '0.07', 'FALSO'),
(8, 'CT01', '15/04/2000', 'TARJETA', '0.02', 'VERDADERO'),
(9, 'CT21', '21/04/2000', 'CONTADO', '0.04', 'FALSO'),
(11, 'CT04', '1/05/2001', 'CONTADO', '0.08', 'VERDADERO'),
(12, 'CT06', '19/05/2001', 'CONTADO', '0.09', 'VERDADERO'),
(13, 'CT13', '30/04/2000', 'APLAZADO', '0.03', 'FALSO'),
(16, 'CT25', '11/05/2001', 'CONTADO', '0.12', 'FALSO'),
(19, 'CT10', '22/05/2002', 'CONTADO', '0.07', 'VERDADERO'),
(21, 'CT16', '28/05/2001', 'CONTADO', '0.03', 'FALSO'),
(22, 'CT07', '31/05/2000', 'TARJETA', '0.05', 'VERDADERO'),
(25, 'CT18', '2/06/2000', 'CONTADO', '0.06', 'FALSO'),
(26, 'CT09', '4/06/2001', 'APLAZADO', '0.07', 'VERDADERO'),
(27, 'CT34', '6/06/2000', 'CONTADO', '0.04', 'FALSO'),
(28, 'CT28', '8/06/2000', 'APLAZADO', '0.08', 'FALSO'),
(29, 'CT30', '2/04/2001', 'TARJETA', '0.06', 'FALSO'),
(30, 'CT02', '15/08/2000', 'CONTADO', '0.06', 'VERDADERO'),
(31, 'CT30', '8/06/2000', 'TARJETA', '0.05', 'VERDADERO'),
(32, 'CT14', '20/06/2001', 'APLAZADO', '0.06', 'FALSO'),
(34, 'CT26', '23/06/2002', 'TARJETA', '0.05', 'FALSO'),
(35, 'CT26', '30/06/2001', 'CONTADO', '0.06', 'FALSO'),
(37, 'CT24', '2/07/2001', 'TARJETA', '0.03', 'VERDADERO'),
(39, 'CT20', '8/07/2001', 'TARJETA', '0.06', 'VERDADERO'),
(40, 'CT04', '12/07/2002', 'CONTADO', '0.12', 'FALSO'),
(42, 'CT34', '15/07/2002', 'APLAZADO', '0.07', 'VERDADERO'),
(43, 'CT09', '18/07/2001', 'CONTADO', '0.07', 'FALSO'),
(44, 'CT34', '20/07/2002', 'APLAZADO', '0.04', 'FALSO'),
(45, 'CT30', '22/07/2002', 'TARJETA', '0.07', 'FALSO'),
(46, 'CT31', '25/07/2002', 'CONTADO', '0.06', 'FALSO'),
(47, 'CT34', '31/07/2000', 'APLAZADO', '0.08', 'FALSO'),
(48, 'CT18', '30/08/2002', 'CONTADO', '0.03', 'FALSO'),
(49, 'CT28', '2/09/2002', 'CONTADO', '0.03', 'FALSO'),
(50, 'CT09', '5/09/2002', 'APLAZADO', '0.08', 'FALSO'),
(51, 'CT09', '5/09/2002', 'CONTADO', '0.05', 'VERDADERO'),
(63, 'CT28', '10/09/2000', 'CONTADO', '0.09', 'FALSO'),
(72, 'CT01', '18/08/2002', 'CONTADO', '0.05', 'VERDADERO'),
(73, 'CT01', '2/08/2001', 'CONTADO', '0.07', 'FALSO'),
(74, 'CT01', '17/09/2002', 'APLAZADO', '0.08', 'FALSO'),
(75, 'CT01', '30/09/2002', 'TARJETA', '0.12', 'FALSO'),
(76, 'CT01', '19/10/2002', 'CONTADO', '0.04', 'VERDADERO'),
(77, 'CT01', '28/10/2000', 'CONTADO', '0.05', 'FALSO'),
(79, 'CT34', '12/12/2000', 'CONTADO', '0.05', 'FALSO'),
(85, 'CT04', '23/12/2002', 'TARJETA', '0.04', 'FALSO'),
(86, 'CT09', '24/12/2001', 'APLAZADO', '0.03', 'FALSO'),
(98, 'CT01', '27/12/2001', 'CONTADO', '0.08', 'VERDADERO'),
(102, 'CT06', '12/01/2001', 'CONTADO', '0.07', 'VERDADERO'),
(103, 'CT02', '24/01/2001', 'CONTADO', '0.04', 'FALSO'),
(105, 'CT30', '1/01/2001', 'APLAZADO', '0.09', 'FALSO'),
(5005, 'CT30', '10/08/2002', 'TARJETA', '0.00', 'VERDADERO'),
(5050, 'CT30', '27/03/2002', 'TARJETA', '0.00', 'VERDADERO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `CÓDIGOARTÍCULO` varchar(4) DEFAULT NULL,
  `SECCIÓN` varchar(10) DEFAULT NULL,
  `NOMBREARTÍCULO` varchar(19) DEFAULT NULL,
  `PRECIO` decimal(10,0) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `IMPORTADO` varchar(9) DEFAULT NULL,
  `PAÍSDEORIGEN` varchar(9) DEFAULT NULL,
  `FOTO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`CÓDIGOARTÍCULO`, `SECCIÓN`, `NOMBREARTÍCULO`, `PRECIO`, `FECHA`, `IMPORTADO`, `PAÍSDEORIGEN`, `FOTO`) VALUES
('AR01', 'FERRETERÍA', 'DESTORNILLADOR', '7', '2000-10-22', 'FALSO', 'ESPAÑA', NULL),
('AR02', 'CONFECCIÓN', 'TRAJE CABALLERO', '285', '2002-03-11', 'VERDADERO', 'ITALIA', NULL),
('AR03', 'JUGUETERÍA', 'COCHE TELEDIRIGIDO', '159', '2002-05-26', 'VERDADERO', 'MARRUECOS', NULL),
('AR04', 'DEPORTES', 'RAQUETA TENIS', '93', '2000-03-20', 'VERDADERO', 'USA', NULL),
('AR06', 'DEPORTES', 'MANCUERNAS', '60', '2000-09-13', 'VERDADERO', 'USA', NULL),
('AR07', 'CONFECCIÓN', 'SERRUCHO', '30', '2001-03-23', 'VERDADERO', 'FRANCIA', NULL),
('AR08', 'JUGUETERÍA', 'CORREPASILLOS', '103', '2000-04-11', 'VERDADERO', 'JAPÓN', NULL),
('AR09', 'CONFECCIÓN', 'PANTALÓN SEÑORA', '174', '2000-01-10', 'VERDADERO', 'MARRUECOS', NULL),
('AR10', 'JUGUETERÍA', 'CONSOLA VIDEO', '443', '2002-09-24', 'VERDADERO', 'USA', NULL),
('AR11', 'CERÁMICA', 'TUBOS', '168', '2000-02-04', 'VERDADERO', 'CHINA', NULL),
('AR12', 'FERRETERÍA', 'LLAVE INGLESA', '24', '2001-05-23', 'VERDADERO', 'USA', NULL),
('AR13', 'CONFECCIÓN', 'CAMISA CABALLERO', '67', '2002-08-11', 'FALSO', 'ESPAÑA', NULL),
('AR14', 'JUGUETERÍA', 'TREN ELÉCTRICO', '1505', '2001-07-03', 'VERDADERO', 'JAPÓN', NULL),
('AR15', 'CERÁMICA', 'PLATO DECORATIVO', '54', '2000-06-07', 'VERDADERO', 'CHINA', NULL),
('AR16', 'FERRETERÍA', 'ALICATES', '7', '2000-04-17', 'VERDADERO', 'ITALIA', NULL),
('AR17', 'JUGUETERÍA', 'MUÑECA ANDADORA', '105', '2001-01-04', 'FALSO', 'ESPAÑA', NULL),
('AR18', 'DEPORTES', 'PISTOLA OLÍMPICA', '47', '2001-02-02', 'VERDADERO', 'SUECIA', NULL),
('AR19', 'CONFECCIÓN', 'BLUSA SRA.', '101', '2000-03-18', 'VERDADERO', 'CHINA', NULL),
('AR20', 'CERÁMICA', 'JUEGO DE TE', '43', '2001-01-15', 'VERDADERO', 'CHINA', NULL),
('AR21', 'CERÁMICA', 'CENICERO', '20', '2001-07-02', 'VERDADERO', 'JAPÓN', NULL),
('AR22', 'FERRETERÍA', 'MARTILLO', '11', '2001-09-04', 'FALSO', 'ESPAÑA', NULL),
('AR23', 'CONFECCIÓN', 'CAZADORA PIEL', '523', '2001-07-10', 'VERDADERO', 'ITALIA', NULL),
('AR24', 'DEPORTES', 'BALÓN RUGBY', '112', '2000-11-11', 'VERDADERO', 'USA', NULL),
('AR25', 'DEPORTES', 'BALÓN BALONCESTO', '75', '2001-06-25', 'VERDADERO', 'JAPÓN', NULL),
('AR26', 'JUGUETERÍA', 'FUERTE DE SOLDADOS', '144', '2000-11-25', 'VERDADERO', 'JAPÓN', NULL),
('AR27', 'CONFECCIÓN', 'ABRIGO CABALLERO', '500000', '2002-04-05', 'VERDADERO', 'ITALIA', NULL),
('AR28', 'DEPORTES', 'BALÓN FÚTBOL', '44', '2002-07-04', 'FALSO', 'ESPAÑA', NULL),
('AR29', 'CONFECCIÓN', 'ABRIGO SRA', '360', '2001-05-03', 'VERDADERO', 'MARRUECOS', NULL),
('AR30', 'FERRETERÍA', 'DESTORNILLADOR', '9', '2002-02-20', 'VERDADERO', 'FRANCIA', NULL),
('AR31', 'JUGUETERÍA', 'PISTOLA CON SONIDOS', '57', '2001-04-15', 'FALSO', 'ESPAÑA', NULL),
('AR32', 'DEPORTES', 'CRONÓMETRO', '439', '2002-01-03', 'VERDADERO', 'USA', NULL),
('AR33', 'CERÁMICA', 'MACETA', '29', '2000-02-23', 'FALSO', 'ESPAÑA', NULL),
('AR34', 'OFICINA', 'PIE DE LÁMPARA', '40', '2001-05-27', 'VERDADERO', 'TURQUÍA', NULL),
('AR35', 'FERRETERÍA', 'LIMA GRANDE', '22', '2002-08-10', 'FALSO', 'ESPAÑA', NULL),
('AR36', 'FERRETERÍA', 'JUEGO DE BROCAS', '15', '2002-07-04', 'VERDADERO', 'TAIWÁN', NULL),
('AR37', 'CONFECCIÓN', 'CINTURÓN DE PIEL', '4', '2002-05-12', 'FALSO', 'ESPAÑA', NULL),
('AR38', 'DEPORTES', 'CAÑA DE PESCA', '270', '2000-02-14', 'VERDADERO', 'USA', NULL),
('AR39', 'CERÁMICA', 'JARRA CHINA', '128', '2002-09-02', 'VERDADERO', 'CHINA', NULL),
('AR40', 'DEPORTES', 'BOTA ALPINISMO', '144', '2002-05-05', 'FALSO', 'ESPAÑA', NULL),
('AR41', 'DEPORTES', 'PALAS DE PING PONG', '22', '2002-02-02', 'FALSO', 'ESPAÑA', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CÓDIGOCLIENTE`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`NÚMERODEPEDIDO`),
  ADD KEY `Pedidos_Cliente` (`CÓDIGOCLIENTE`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `Pedidos_Cliente` FOREIGN KEY (`CÓDIGOCLIENTE`) REFERENCES `clientes` (`CÓDIGOCLIENTE`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'plantilla', '{\"quick_or_custom\":\"quick\",\"what\":\"csv\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continÃºa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continÃºa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"bdgymcultural\",\"table\":\"empleado\"},{\"db\":\"challenge-sofka\",\"table\":\"sofka_jugador\"},{\"db\":\"challenge-sofka\",\"table\":\"sofka_ronda\"},{\"db\":\"challenge-sofka\",\"table\":\"sofka_respuestas\"},{\"db\":\"challenge-sofka\",\"table\":\"sofka_preguntas\"},{\"db\":\"challenge-sofka\",\"table\":\"sofka_categoria\"},{\"db\":\"challenge-sofka\",\"table\":\"sofka_ronda_jugador\"},{\"db\":\"curso_sql\",\"table\":\"pedidos\"},{\"db\":\"bdgymcultural\",\"table\":\"estudiante\"},{\"db\":\"bdgymcultural\",\"table\":\"usuario\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('base_trd', 'area', 'TRD_ID'),
('bdgymcultural', 'datosfamiliares', 'NombreMadre'),
('bdgymcultural', 'datosmedicos', 'discapacidad'),
('bdgymcultural', 'datosvaloracion', 'Acompa'),
('bdgymcultural', 'empleado', 'Identificacion_empleado'),
('bdgymcultural', 'solicitud', 'Identificacion_estudiante'),
('bdgymcultural', 'usuario', 'Codigo_Usuario'),
('challenge-sofka', 'sofka_preguntas', 'preg_descripcion'),
('challenge-sofka', 'sofka_respuestas', 'resp_descripcion'),
('challenge-sofka', 'sofka_ronda', 'rond_descripcion'),
('curso_sql', 'pedidos', 'CÃ“DIGOCLIENTE'),
('prueba', 'trd_serie', 'TRD_ID'),
('prueba', 'trd_subserie', 'TRD_DESC'),
('prueba', 'trd_udec', 'TRD_DESCRIPCION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'bdcolegio', 'usuarios', '{\"CREATE_TIME\":\"2021-07-08 09:12:15\",\"sorted_col\":\"`IDUSUARIO`  DESC\"}', '2021-08-30 15:25:02'),
('root', 'bdgymcultural', 'cargos', '{\"sorted_col\":\"`cargos`.`Nombre_cargo` ASC\"}', '2021-09-30 17:12:48'),
('root', 'challenge-sofka', 'sofka_ronda', '{\"CREATE_TIME\":\"2021-10-24 00:42:50\",\"col_order\":[1,0,2],\"col_visib\":[1,1,1]}', '2021-10-25 18:44:54'),
('root', 'curso_sql', 'pedidos', '{\"sorted_col\":\"`pedidos`.`C\\u00d3DIGOCLIENTE` ASC\"}', '2021-09-24 23:22:46'),
('root', 'curso_sql', 'productos', '[]', '2021-09-24 17:21:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-10-25 21:29:03', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\",\"NavigationWidth\":348}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `prueba`
--
CREATE DATABASE IF NOT EXISTS `prueba` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prueba`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `AREA_ID` int(50) NOT NULL,
  `AREA_DESCRIPCION` varchar(500) NOT NULL,
  `AREA_ESTADO` int(10) NOT NULL,
  `PROC_ID` int(50) NOT NULL,
  `AREA_REGISTRADOPOR` varchar(500) NOT NULL,
  `AREA_FECHACAMBIO` date NOT NULL,
  `AREA_INTERNA` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`AREA_ID`, `AREA_DESCRIPCION`, `AREA_ESTADO`, `PROC_ID`, `AREA_REGISTRADOPOR`, `AREA_FECHACAMBIO`, `AREA_INTERNA`) VALUES
(2, 'RECTORIA', 1, 1, '123456', '2021-07-23', 1),
(23, 'OFICINA DE CONTABILIDAD', 1, 1, '12345678', '2021-07-23', 1),
(24, 'OFICINA DE TESORERIA', 1, 1, '12345678', '2021-07-23', 1),
(25, 'OFICINA DE APOYO FINANCIERO', 1, 1, '12345678', '2021-07-23', 1),
(31, 'OFICINA DE COMPRAS', 1, 1, '12345678', '2021-07-23', 1),
(209, 'VICERRECTORIA ADMINISTRATIVA Y FINANCIERA', 1, 1, '123456', '2021-07-23', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trd_serie`
--

CREATE TABLE `trd_serie` (
  `TRD_ID_SERIE` double NOT NULL,
  `TRD_DESC_SERIE` varchar(500) NOT NULL,
  `TRD_EST_SERIE` int(10) NOT NULL,
  `TRD_ID` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trd_serie`
--

INSERT INTO `trd_serie` (`TRD_ID_SERIE`, `TRD_DESC_SERIE`, `TRD_EST_SERIE`, `TRD_ID`) VALUES
(12.12, 'INFORMES', 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trd_subserie`
--

CREATE TABLE `trd_subserie` (
  `TRD_ID_SUB` double NOT NULL,
  `TRD_DESC` varchar(500) NOT NULL,
  `TRD_ID_SERIE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trd_udec`
--

CREATE TABLE `trd_udec` (
  `TRD_ID` double NOT NULL,
  `TRD_DESCRIPCION` varchar(500) NOT NULL,
  `TRD_ESTADO` int(10) NOT NULL,
  `TRD_REGISTRADOPOR` int(50) NOT NULL,
  `TRD_FECHACAMBIO` date NOT NULL,
  `AREA_ID` int(50) NOT NULL,
  `TRD_VERSION` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trd_udec`
--

INSERT INTO `trd_udec` (`TRD_ID`, `TRD_DESCRIPCION`, `TRD_ESTADO`, `TRD_REGISTRADOPOR`, `TRD_FECHACAMBIO`, `AREA_ID`, `TRD_VERSION`) VALUES
(10, 'RECTORIA', 1, 12345678, '2021-07-23', 2, 4),
(31, 'CONTABILIDAD', 1, 12345678, '2021-07-23', 23, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`AREA_ID`);

--
-- Indices de la tabla `trd_serie`
--
ALTER TABLE `trd_serie`
  ADD PRIMARY KEY (`TRD_ID_SERIE`),
  ADD UNIQUE KEY `TRD_ID` (`TRD_ID`);

--
-- Indices de la tabla `trd_subserie`
--
ALTER TABLE `trd_subserie`
  ADD PRIMARY KEY (`TRD_ID_SUB`),
  ADD KEY `TRD_ID_SERIE` (`TRD_ID_SERIE`);

--
-- Indices de la tabla `trd_udec`
--
ALTER TABLE `trd_udec`
  ADD PRIMARY KEY (`TRD_ID`),
  ADD KEY `AREA_ID` (`AREA_ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `trd_serie`
--
ALTER TABLE `trd_serie`
  ADD CONSTRAINT `trd_serie_ibfk_1` FOREIGN KEY (`TRD_ID`) REFERENCES `trd_udec` (`TRD_ID`);

--
-- Filtros para la tabla `trd_subserie`
--
ALTER TABLE `trd_subserie`
  ADD CONSTRAINT `trd_subserie_ibfk_1` FOREIGN KEY (`TRD_ID_SERIE`) REFERENCES `trd_serie` (`TRD_ID_SERIE`);

--
-- Filtros para la tabla `trd_udec`
--
ALTER TABLE `trd_udec`
  ADD CONSTRAINT `trd_udec_ibfk_1` FOREIGN KEY (`AREA_ID`) REFERENCES `area` (`AREA_ID`);
--
-- Base de datos: `registro`
--
CREATE DATABASE IF NOT EXISTS `registro` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `registro`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Id` int(11) NOT NULL,
  `DNI` int(11) NOT NULL,
  `NOMBRES` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Id`, `DNI`, `NOMBRES`) VALUES
(1, 1023, 'katherine '),
(10, 1021, 'DEIBY SIERRA '),
(12, 1021, 'DEIBY SIERRA ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id`);
--
-- Base de datos: `registros`
--
CREATE DATABASE IF NOT EXISTS `registros` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `registros`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

CREATE TABLE `series` (
  `id_serie` varchar(250) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `version` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `series`
--

INSERT INTO `series` (`id_serie`, `descripcion`, `fecha`, `version`) VALUES
('12', 'CONTABILIDAD', '2021-07-23', 4),
('13', 'SISTEMAS', '2021-07-23', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subserie`
--

CREATE TABLE `subserie` (
  `id_sub` varchar(250) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_serie` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subserie`
--

INSERT INTO `subserie` (`id_sub`, `descripcion`, `id_serie`) VALUES
('12.1', 'FORMATOS', '12'),
('12.2', 'CIRCULARES', '12'),
('13.1', 'CIRCULARES', '13'),
('13.39', 'INFORMES', '13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id_serie`);

--
-- Indices de la tabla `subserie`
--
ALTER TABLE `subserie`
  ADD PRIMARY KEY (`id_sub`),
  ADD KEY `id_serie` (`id_serie`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `subserie`
--
ALTER TABLE `subserie`
  ADD CONSTRAINT `subserie_ibfk_1` FOREIGN KEY (`id_serie`) REFERENCES `series` (`id_serie`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
