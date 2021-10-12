-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2021 a las 22:45:42
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citas_medicas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` char(5) NOT NULL,
  `medico` int(11) NOT NULL,
  `aps` char(6) NOT NULL,
  `paciente` char(20) NOT NULL,
  `servicio` char(10) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `idUsuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `codigo` char(6) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` char(30) NOT NULL,
  `contacto` varchar(50) NOT NULL,
  `tipoEntidad` char(10) NOT NULL,
  `manual` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `codigo` char(3) NOT NULL,
  `nombre` char(50) NOT NULL,
  `nivel` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manuales`
--

CREATE TABLE `manuales` (
  `codigo` char(2) NOT NULL,
  `nombre` char(50) NOT NULL,
  `base` float NOT NULL,
  `anno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `idMedico` int(11) NOT NULL,
  `documento` char(15) NOT NULL,
  `recmedico` char(20) NOT NULL,
  `nombres` char(40) NOT NULL,
  `apellidos` char(40) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` char(30) NOT NULL,
  `especialidad` char(3) NOT NULL,
  `firma` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciantes_fotos`
--

CREATE TABLE `paciantes_fotos` (
  `documento` char(20) NOT NULL,
  `foto` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `documento` char(20) NOT NULL,
  `tipoDoc` char(2) NOT NULL,
  `pApellidos` char(20) NOT NULL,
  `sApellido` char(20) NOT NULL,
  `pNombre` char(20) NOT NULL,
  `sNombre` char(20) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` char(30) NOT NULL,
  `eps` char(6) NOT NULL,
  `genero` char(1) NOT NULL,
  `discapacidad` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `codigo` char(10) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE `tarifas` (
  `idRegistro` int(11) NOT NULL,
  `codManual` char(2) NOT NULL,
  `codServicio` char(10) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` char(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idUsuarios` (`idUsuarios`),
  ADD KEY `medico` (`medico`,`aps`,`paciente`,`servicio`),
  ADD KEY `servicio` (`servicio`),
  ADD KEY `aps` (`aps`),
  ADD KEY `paciente` (`paciente`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `manual` (`manual`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `manuales`
--
ALTER TABLE `manuales`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`idMedico`),
  ADD KEY `especialidad` (`especialidad`);

--
-- Indices de la tabla `paciantes_fotos`
--
ALTER TABLE `paciantes_fotos`
  ADD KEY `documento` (`documento`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `eps` (`eps`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `codServicio` (`codServicio`),
  ADD KEY `codManual` (`codManual`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`servicio`) REFERENCES `servicios` (`codigo`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`medico`) REFERENCES `medicos` (`idMedico`),
  ADD CONSTRAINT `citas_ibfk_4` FOREIGN KEY (`aps`) REFERENCES `eps` (`codigo`),
  ADD CONSTRAINT `citas_ibfk_5` FOREIGN KEY (`paciente`) REFERENCES `pacientes` (`documento`);

--
-- Filtros para la tabla `eps`
--
ALTER TABLE `eps`
  ADD CONSTRAINT `eps_ibfk_1` FOREIGN KEY (`manual`) REFERENCES `manuales` (`codigo`);

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`especialidad`) REFERENCES `especialidades` (`codigo`);

--
-- Filtros para la tabla `paciantes_fotos`
--
ALTER TABLE `paciantes_fotos`
  ADD CONSTRAINT `paciantes_fotos_ibfk_1` FOREIGN KEY (`documento`) REFERENCES `pacientes` (`documento`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`eps`) REFERENCES `eps` (`codigo`);

--
-- Filtros para la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD CONSTRAINT `tarifas_ibfk_1` FOREIGN KEY (`codServicio`) REFERENCES `servicios` (`codigo`),
  ADD CONSTRAINT `tarifas_ibfk_2` FOREIGN KEY (`codManual`) REFERENCES `manuales` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
