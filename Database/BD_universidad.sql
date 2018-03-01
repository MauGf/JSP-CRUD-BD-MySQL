-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-02-2018 a las 03:46:26
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `universidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `clave_alumno` mediumint(8) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `Notas` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='alumnos de la escuela';

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`clave_alumno`, `nombre`, `Notas`) VALUES
(1, 'Luis Perez', 10),
(2, 'Juan Lopez', 8),
(3, 'Ana Esmeralda Gonzalez', 6),
(4, 'Laura Sanchez', 8),
(5, 'Antonio Ruiz', 9),
(6, 'Pedro Jimenez', 7),
(7, 'Fernando Juarez', 10),
(8, 'Antonio  Lopez', 8),
(9, 'Uriel Gonzalez', 6),
(10, 'Alvaro Sanchez', 8),
(11, 'Agustin  el Tin Ruiz', 9),
(12, 'Jaime Antonio Zepeda', 7),
(13, 'Kamila Alexandra Garcia', 9),
(14, 'Jose Aristides Garcia', 9),
(15, 'Jessica Elisa Flores', 8),
(16, 'Claudia Estela Hernandez', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contra` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `contra`, `usertype`) VALUES
(1, 'Mauricio', '827ccb0eea8a706c4c34a16891f84e7b', 'Administardor'),
(2, 'Antonio', '827ccb0eea8a706c4c34a16891f84e7b', 'Asistente'),
(3, 'Kamila', '827ccb0eea8a706c4c34a16891f84e7b', 'Registro Academico'),
(4, 'Carlos', '827ccb0eea8a706c4c34a16891f84e7b', 'Nuevo Ingreso');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`clave_alumno`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `clave_alumno` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
