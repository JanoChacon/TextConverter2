-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2017 a las 04:32:18
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `textconverter`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE `archivo` (
  `nombre` varchar(255) DEFAULT NULL,
  `texto` mediumtext,
  `id_archivo` int(10) NOT NULL,
  `id_paquete` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `archivo`
--

INSERT INTO `archivo` (`nombre`, `texto`, `id_archivo`, `id_paquete`) VALUES
('archivo1', 'texto de ejemplo 1', 1, 1),
('archivo2', 'phpMyAdmin', 2, 1),
('archivo3', 'texto de ejemplo numero 43', 3, 2),
('archivo4', 'otro texto de ejemplo ', 4, 1),
('archivo 5', 'texto de ejemplo del archivo 5', 5, 4),
('archivo 6', 'texto de ejemplo numero 6 para el archivo 6', 6, 3),
('Propiedades y métricas de Calidad en desarrollo de software.docx', 'Propiedades y métricas de Calidad en desarrollo de software\n\nNombre: Alejandro Chacón Acuña\nCarrera: Ingeniería Informática\nCorreo: a.chacon01@ufromail.cl\n\n\nEn el desarrollo de proyectos informáticos uno de los puntos más importantes es el aseguramiento de la calidad del producto. La calidad de un software es un elemento diferenciador entre las diferentes empresas que se dedican a confeccionar software, para ello, se han creado diferentes tipos de metodologías, modelos y frameworks los cuales, contienen diferentes tipos de métricas que permiten evaluar la calidad de un sistema. \nA través de las métricas de calidad de software se puede entender, predecir y controlar el desarrollo de un producto software, esto además de ver el nivel de mantenimiento que se le puede otorgar a este, ya que, estas contemplan la totalidad del ciclo de vida del desarrollo.\nEn este trabajo, se identificaran diferentes propiedades y características de calidad que debe cumplir un producto software, además de diferentes métricas para medir la implementación de estas.\n\nPropiedades de calidad:\nEn la búsqueda de las propiedades de calidad, se identificaron diferentes modelos, siendo dos de ellos de donde se obtendrían los principales factores de calidad trabajados en este documento: los factores de calidad de McCall y el modelo ISO 9126, este último, es un derivado del primero. \n\nFuncionabilidad: \nSe refiere a la capacidad del software para proporcionar funciones que solventen las necesidades del usuario, esto según las condiciones especificadas.\nMétricas utilizadas para medir la funcionalidad:\nPunto de función: permiten traducir el tamaño de funcionalidades de software a un número, a través de la suma ponderadas de las características que este tiene.\n\nConfiabilidad: \nPara que un software pueda ser confiable, necesita poder seguir funcionando sin presencia de errores, bugs u otras eventualidades, esto bajo ciertas condiciones establecidas y por un cierto periodo de tiempo. Para que un software sea considerado confiable, este tiene que responder a las necesidades del usuario cuando él lo desee.\n\n\n\nMétricas utilizadas para medir la Confiabilidad:\nMTBF: Tiempo Medio Entre Fallas \nMTTR: Tiempo Medio Para Reparación.\n\nUsabilidad: \nLa usabilidad es la cualidad que tiene un sistema por la que permite a sus usuarios alcanzar objetivos específicos de manera eficiente, eficaz y satisfactoria.\nMétricas utilizadas para medir la Usabilidad:\nExactitud: Número de errores cometidos por los sujetos de prueba y si estos fueron recuperables o no al usar los datos o procedimientos adecuados. \nRecuerdo: Qué tanto recuerda el usuario después de un periodo sin usar la aplicación.\nSUMI: cuestionario para valorar la calidad de uso de un sistema o de un prototipo.\n\nPortabilidad: \nEs la propiedad del software que posee para ejecutarse en diferentes plataformas y dispositivos.\nMétricas utilizadas para medir la Portabilidad:\nTasa de portabilidad: 1 – (ET/ER)\nET son los recursos necesarios para mover la aplicación al nuevo entorno.\nER es una medida de los recursos requeridos para crear el sistema para el entorno residente.\n\nCompatibilidad: \nCapacidad de dos o más sistemas o componentes para intercambiar información y/o llevar a cabo sus funciones requeridas cuando comparten el mismo entorno hardware o software. (Definición ISO 25010).\nMétricas utilizadas para medir la Compatibilidad: \nintercambiabilidad de los datos: X = 1(A/B) Cuenta el número de casos en donde las funciones de las interfaces son usadas y han fallado.\nA: número de casos donde la interfaz falla por contacto con otro software en el sistema.\nB: número de casos donde el usuario intenta el intercambio de datos.\n\n\n\n\nMantenibilidad: \nPara que un producto de software pueda ser mantenido, necesita tener la capacidad de poder ser analizado y modificado a través del tiempo.\nMétricas utilizadas para medir la Mantenibilidad: \nÍndice de mantenibilidad (IM): está dado como una ecuación polinómica compuesta por variables predictoras.\nComplejidad ciclomática: analiza el programa según el flujo independiente de las líneas de código.\n\n\n\nReferencias\n\nCarlos Alberto, P. L. (s.f.). Aplicación del modelo de madurez de capacidad (CMM) en la empresa BNYCS. \nGonzalez-Disla, R. R. (2016). METRICA DE COMPLEJIDAD DEL SOFTWARE Y PROCESOS COGNITIVOS. \nISO/IEC 25000 - Calidad de un producto Software. (2017). Obtenido de ISO 25010: http://iso25000.com/index.php/normas-iso-25000/iso-25010\nMesa, S. P. (2007). Construcción de una herramienta para evaluar la calidad de producto software. Medellín: EAFIT.\nW3II. (s.f.). Obtenido de CMMI Tutorial: http://www.w3ii.com/es/cmmi/cmmi_maturity_levels.html\n\n\n', 13, 4),
('curriculum_vitae.pdf', 'ALEJANDRO CHACÓN ACUÑA \nESTUDIANTE | INGENIERÍA INFORMÁTICA \nCV \n LOS SAUCES #304, VILLA EL CARMEN | LAUTARO \n \n \nOBJETIVO \nDATOS PERSONALES \nReforzar y poner a prueba mis \n? RUT: 18774787-2 \nconocimientos en las ciencias \n? FECHA DE NACIMIENTO: 16-08-1994 \nde la computación, diseño y \n? ESTADO CIVIL: SOLTERO \ndesarrollo de aplicaciones \n? NACIONALIDAD: CHILENA \ninformáticas.  \nEXPERIENCIA \nAPTITUDES \n \n \nANALISTA PRIMARIO • OBSERVATORIO VOLCANOLÓGICO LOS ANDES DEL \n? Conocimientos en \nSUR • 2017 \nprogramación con principal \n \natención del lenguaje Java. \nIdentificación, clasificación y registro de las actividades de los \n \nvolcanes de Chile para su posterior análisis.  \n? Manejo de base de datos \n \nMySQL y MongoDB. \nConocimientos básicos de \nPHP y Javascript (con \nFramework JQuery).   \nEDUCACIÓN \n \n? Nociones en confección de \nmodelos y diagramas para \n \nel desarrollo de software. \nLICENCIA DE ENSEÑANZA MEDIA • 2012 • LICEO HC JORGE TEILLIER \n \nSANDOVAL \n? Manejo de Ingles Pre-\nLicenciatura en liceo de carácter humanista científico, con preparación \nIntermedio. \npara el mundo universitario. \n \n \n? Suite de Office (Publisher, \nPower Point, Excel, \n 2013 HASTA LA FECHA • UNIVERSIDAD DE LA FRONTERA \nAccess). \nIngeniero Informático en formación, cursando cuarto año de la \n \ncarrera. \n? GNU/LINUX Básico. \n \n \n \n? Mantención de \nComputadores. \n \n \n \n \nA.CHACON01@UFROMAIL.CL (+569) 91715219 \n ', 14, 1),
('Texto a extraer.doc', 'Texto a extraer\r\n\r\n', 15, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `nombre` varchar(255) DEFAULT NULL,
  `id_paquete` int(10) NOT NULL,
  `id_proyecto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`nombre`, `id_paquete`, `id_proyecto`) VALUES
('paquete1-1', 1, 1),
('paquete1-2', 2, 1),
('paquete3-1', 3, 3),
('paquete2', 4, 2),
('paquetetito', 10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `nombre` varchar(255) DEFAULT NULL,
  `id_proyecto` int(10) NOT NULL,
  `id_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`nombre`, `id_proyecto`, `id_usuario`) VALUES
('proyecto1', 1, 'alejandro'),
('proyecto2', 2, 'alejandro'),
('proyecto3', 3, 'alejandro'),
('proyecto4', 4, 'alejandro'),
('Proyecto 6', 7, 'MrSuarez'),
('Proyecto  5', 9, 'alejandro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` varchar(20) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `pass`) VALUES
('  ', '123'),
('alejandro', '123'),
('Mauricio', '123'),
('MrSuarez', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD PRIMARY KEY (`id_archivo`),
  ADD KEY `FKArchivo392732` (`id_paquete`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`id_paquete`),
  ADD KEY `FKPaquete690536` (`id_proyecto`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `FKProyecto599886` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivo`
--
ALTER TABLE `archivo`
  MODIFY `id_archivo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `paquete`
--
ALTER TABLE `paquete`
  MODIFY `id_paquete` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id_proyecto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD CONSTRAINT `FKArchivo392732` FOREIGN KEY (`id_paquete`) REFERENCES `paquete` (`id_paquete`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD CONSTRAINT `FKPaquete690536` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `FKProyecto599886` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
