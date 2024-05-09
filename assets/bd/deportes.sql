-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-02-2024 a las 14:13:16
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `deportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE `deportes` (
  `dte_id` int(11) NOT NULL,
  `dte_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`dte_id`, `dte_nombre`) VALUES
(7, 'Badminton'),
(4, 'Baloncesto'),
(3, 'Balonmano'),
(8, 'equitacion'),
(1, 'Futbol'),
(5, 'Golf'),
(6, 'Natacion'),
(2, 'Padel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportistas`
--

CREATE TABLE `deportistas` (
  `dta_id` int(11) NOT NULL,
  `dta_nombre` varchar(50) NOT NULL,
  `dta_fnac` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `deportistas`
--

INSERT INTO `deportistas` (`dta_id`, `dta_nombre`, `dta_fnac`) VALUES
(1, 'Aigneis Luchetti', '2020-01-04'),
(2, 'Tibold Mansfield', '1999-07-07'),
(3, 'Venita Fishlee', '2019-04-05'),
(4, 'Pattie Rudgerd', '2011-11-19'),
(5, 'Marcelline Eldershaw', '1990-02-25'),
(6, 'Rachelle Coggan', '2001-11-27'),
(7, 'Drucill Bice', '1985-03-28'),
(8, 'Ruy Moulding', '2021-11-08'),
(9, 'Hamel Hubbucke', '1991-08-04'),
(10, 'Alexei Gammill', '2018-07-27'),
(11, 'Clarisse Ficken', '2017-11-07'),
(12, 'Eulalie Devita', '1999-10-29'),
(13, 'Ichabod Sheer', '1985-05-12'),
(14, 'Perl Doveston', '1989-10-31'),
(15, 'Fayina Armfield', '1981-04-17'),
(16, 'Brigit Prandini', '1982-11-09'),
(17, 'Angelico Aldwich', '2016-06-05'),
(18, 'Tedie Gormley', '2014-10-18'),
(19, 'Hermy Petrakov', '1992-10-28'),
(20, 'Washington Lackeye', '1998-09-03'),
(21, 'Boyce Floodgate', '1990-09-27'),
(22, 'Randa Dickon', '2008-01-08'),
(23, 'Sean De Bischop', '1982-02-27'),
(24, 'Therese McGucken', '1995-10-10'),
(25, 'Anissa Cranke', '1982-10-15'),
(26, 'Ellynn Jahnisch', '1990-06-30'),
(27, 'Anneliese Endricci', '2004-09-01'),
(28, 'Annabel Bridger', '2006-02-27'),
(29, 'Cecily January 1st', '2016-11-09'),
(30, 'Arleta Shorten', '2011-11-15'),
(31, 'Perrine Connealy', '1985-08-07'),
(32, 'Harri Rathbone', '2011-12-22'),
(33, 'Nikolas Vaadeland', '1983-10-20'),
(34, 'Perren Kean', '1989-01-12'),
(35, 'Reine Tomkiss', '1996-09-24'),
(36, 'Hayes Greenrodd', '2004-12-31'),
(37, 'Fidelio Gethings', '1997-01-06'),
(38, 'Estevan Rozalski', '1996-07-12'),
(39, 'Phyllis Moreland', '2016-04-18'),
(40, 'Geoffry Matiewe', '1991-04-04'),
(41, 'Tito Balme', '1984-11-21'),
(42, 'Codi McEntee', '1990-08-05'),
(43, 'Melody Peel', '2001-08-04'),
(44, 'Laurianne Mirando', '2013-01-03'),
(45, 'Aleece Kruschev', '2023-03-26'),
(46, 'Raimund Shortcliffe', '2021-03-13'),
(47, 'Claudie Eakeley', '2018-05-31'),
(48, 'Farrel Jakoubec', '1999-06-22'),
(49, 'Else Eagell', '2023-04-21'),
(50, 'Hank Dougill', '2008-06-18'),
(51, 'Pepe', '1998-12-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportistas_deportes`
--

CREATE TABLE `deportistas_deportes` (
  `dd_dta_id` int(11) NOT NULL,
  `dd_dte_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `deportistas_deportes`
--

INSERT INTO `deportistas_deportes` (`dd_dta_id`, `dd_dte_id`) VALUES
(7, 4),
(9, 7),
(24, 3),
(25, 3),
(27, 5),
(28, 1),
(28, 4),
(28, 8),
(32, 7),
(39, 8),
(40, 4),
(45, 4),
(48, 5),
(51, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_alias` varchar(50) NOT NULL,
  `usu_password` varchar(50) NOT NULL,
  `usu_admin` tinyint(1) NOT NULL,
  `usu_foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_alias`, `usu_password`, `usu_admin`, `usu_foto`) VALUES
(1, 'administrador', '91f5167c34c400758115c2a6826ec2e3', 1, 'u11.gif'),
(2, 'usuario', 'f8032d5cae3de20fcec887f395ec9a6a', 0, 'u08.gif');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD PRIMARY KEY (`dte_id`),
  ADD UNIQUE KEY `dte_nombre` (`dte_nombre`);

--
-- Indices de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  ADD PRIMARY KEY (`dta_id`),
  ADD UNIQUE KEY `dta_nombre` (`dta_nombre`);

--
-- Indices de la tabla `deportistas_deportes`
--
ALTER TABLE `deportistas_deportes`
  ADD PRIMARY KEY (`dd_dta_id`,`dd_dte_id`),
  ADD KEY `r-deportes` (`dd_dte_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `deportes`
--
ALTER TABLE `deportes`
  MODIFY `dte_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  MODIFY `dta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deportistas_deportes`
--
ALTER TABLE `deportistas_deportes`
  ADD CONSTRAINT `r-deportes` FOREIGN KEY (`dd_dte_id`) REFERENCES `deportes` (`dte_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `r-deportistas` FOREIGN KEY (`dd_dta_id`) REFERENCES `deportistas` (`dta_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
