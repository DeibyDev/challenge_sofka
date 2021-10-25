-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2021 a las 23:32:29
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
-- Base de datos: `challenge-sofka`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GUADAR_CATEGORIA` (IN `cate_descripcion` VARCHAR(100), IN `juga_fecha_registro` DATE)  BEGIN
    INSERT INTO sofka_categoria(cate_descripcion,juga_fecha_registro)
	VALUES(cate_descripcion,juga_fecha_registro);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GUADAR_JUGADOR` (IN `juga_acumulado` DOUBLE, IN `juga_fechaRegistro` DATE, IN `juga_nombre` VARCHAR(100))  BEGIN
    INSERT INTO sofka_jugador(juga_acumulado,juga_fechaRegistro,juga_nombre)
	VALUES(juga_acumulado,juga_fechaRegistro,juga_nombre);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GUADAR_PREGUNTAS` (IN `cate_id` INT(11), IN `preg_descripcion` VARCHAR(500), IN `preg_fecha_registro` DATE, IN `preg_dificultad` VARCHAR(50))  BEGIN
    INSERT INTO sofka_preguntas(cate_id,preg_descripcion,preg_fecha_registro,preg_dificultad)
	VALUES(cate_id,preg_descripcion,preg_fecha_registro,preg_dificultad);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GUADAR_RESPUESTAS` (IN `preg_id` INT(11), IN `resp_correcta` VARCHAR(100), IN `resp_descripcion` VARCHAR(100), IN `resp_opc2` VARCHAR(100), IN `resp_opc3` VARCHAR(100), IN `resp_opc4` VARCHAR(100))  BEGIN
    INSERT INTO sofka_respuestas(preg_id,resp_correcta,resp_descripcion,resp_opc2
                                ,resp_opc3,resp_opc4)
	VALUES(preg_id,resp_correcta,resp_descripcion,resp_opc2,resp_opc3,resp_opc4);
       END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GUADAR_RONDA` (IN `preg_id` INT(11), IN `rond_descripcion` VARCHAR(100), IN `rond_premio` VARCHAR(100))  BEGIN
    INSERT INTO sofka_ronda(preg_id,rond_descripcion,rond_premio)
	VALUES(preg_id,rond_descripcion,rond_premio);
       END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GUADAR_RONDA_JUGADOR` (IN `id_ronda_jugador` INT(11), IN `juga_id` INT(11), IN `rond_id` INT(11), IN `fecha_juego` DATE)  BEGIN
    INSERT INTO sofka_ronda_jugador(id_ronda_jugador,juga_id,rond_id,fecha_juego)
	VALUES(id_ronda_jugador,juga_id,rond_id,fecha_juego);
       END$$

DELIMITER ;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
