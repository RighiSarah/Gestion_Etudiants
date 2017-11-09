-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 05 Décembre 2016 à 14:51
-- Version du serveur :  10.1.16-MariaDB
-- Version de PHP :  7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `base_suivi_etu`
--

/*DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets` ()  begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;*/
----------------------------------------------------------

--
-- Structure de la table `appartenir`
--

CREATE TABLE `appartenir` (
  `NumUE` int(11) NOT NULL,
  `idFormation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `appartenir`
--

INSERT INTO `appartenir` (`NumUE`, `idFormation`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(33, 4),
(34, 5),
(34, 6),
(34, 9),
(34, 10),
(34, 11),
(35, 5),
(35, 6),
(36, 5),
(36, 6),
(36, 9),
(36, 10),
(36, 11),
(37, 5),
(37, 6),
(38, 5),
(38, 6),
(38, 9),
(38, 10),
(38, 11),
(39, 7),
(40, 7),
(41, 7),
(42, 7),
(43, 8),
(44, 8),
(45, 8),
(46, 8),
(47, 8),
(48, 8),
(49, 8),
(50, 9),
(50, 10),
(51, 9),
(51, 10),
(52, 11),
(53, 11);

-- --------------------------------------------------------

--
-- Structure de la table `association_40`
--

CREATE TABLE `association_40` (
  `idRole` int(11) NOT NULL,
  `idModule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `association_40`
--

INSERT INTO `association_40` (`idRole`, `idModule`) VALUES
(1, 1),
(1, 2),
(1, 6),
(1, 8),
(1, 11),
(1, 12),
(1, 13),
(2, 2),
(2, 6),
(2, 8),
(2, 11),
(2, 12),
(2, 13),
(3, 2),
(3, 6),
(4, 2),
(4, 6),
(4, 12),
(4, 13),
(5, 6),
(5, 11);

-- --------------------------------------------------------

--
-- Structure de la table `batiment`
--

CREATE TABLE `batiment` (
  `idBatiment` int(11) NOT NULL,
  `DesignationBatiment` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `AdresseBatiment` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `bibliographie`
--

CREATE TABLE `bibliographie` (
  `idBiblio` int(11) NOT NULL,
  `titreBiblio` varchar(250) DEFAULT NULL,
  `auteurBiblio` varchar(150) DEFAULT NULL,
  `editeurBiblio` varchar(150) DEFAULT NULL,
  `anneeBiblio` int(11) DEFAULT NULL,
  `idSyllabus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `choisir`
--

CREATE TABLE `choisir` (
  `NumEtudiant` int(11) NOT NULL,
  `NumUE` int(11) NOT NULL,
  `anneeChoisir` varchar(20) NOT NULL DEFAULT '',
  `noteChoisir` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `choisir`
--

INSERT INTO `choisir` (`NumEtudiant`, `NumUE`, `anneeChoisir`, `noteChoisir`) VALUES
(97, 34, '2011', 0),
(97, 35, '2011', 0),
(97, 36, '2011', 0),
(97, 37, '2011', 0),
(97, 38, '2011', 0),
(98, 34, '2011', 0),
(98, 35, '2011', 0),
(98, 36, '2011', 0),
(98, 37, '2011', 0),
(98, 38, '2011', 0),
(99, 34, '2011', 0),
(99, 35, '2011', 0),
(99, 36, '2011', 0),
(99, 37, '2011', 0),
(99, 38, '2011', 0),
(100, 34, '2011', 0),
(100, 35, '2011', 0),
(100, 36, '2011', 0),
(100, 37, '2011', 0),
(100, 38, '2011', 0),
(101, 34, '2011', 0),
(101, 35, '2011', 0),
(101, 36, '2011', 0),
(101, 37, '2011', 0),
(101, 38, '2011', 0),
(102, 34, '2011', 0),
(102, 35, '2011', 0),
(102, 36, '2011', 0),
(102, 37, '2011', 0),
(102, 38, '2011', 0),
(103, 34, '2011', 0),
(103, 35, '2011', 0),
(103, 36, '2011', 0),
(103, 37, '2011', 0),
(103, 38, '2011', 0),
(104, 34, '2011', 0),
(104, 35, '2011', 0),
(104, 36, '2011', 0),
(104, 37, '2011', 0),
(104, 38, '2011', 0),
(105, 34, '2011', 0),
(105, 35, '2011', 0),
(105, 36, '2011', 0),
(105, 37, '2011', 0),
(105, 38, '2011', 0),
(106, 34, '2011', 0),
(106, 35, '2011', 0),
(106, 36, '2011', 0),
(106, 37, '2011', 0),
(106, 38, '2011', 0),
(107, 34, '2011', 0),
(107, 35, '2011', 0),
(107, 36, '2011', 0),
(107, 37, '2011', 0),
(107, 38, '2011', 0),
(108, 34, '2011', 0),
(108, 35, '2011', 0),
(108, 36, '2011', 0),
(108, 37, '2011', 0),
(108, 38, '2011', 0),
(109, 34, '2011', 0),
(109, 35, '2011', 0),
(109, 36, '2011', 0),
(109, 37, '2011', 0),
(109, 38, '2011', 0),
(110, 34, '2011', 0),
(110, 35, '2011', 0),
(110, 36, '2011', 0),
(110, 37, '2011', 0),
(110, 38, '2011', 0),
(111, 34, '2011', 0),
(111, 35, '2011', 0),
(111, 36, '2011', 0),
(111, 37, '2011', 0),
(111, 38, '2011', 0),
(112, 34, '2011', 0),
(112, 35, '2011', 0),
(112, 36, '2011', 0),
(112, 37, '2011', 0),
(112, 38, '2011', 0),
(113, 34, '2011', 0),
(113, 35, '2011', 0),
(113, 36, '2011', 0),
(113, 37, '2011', 0),
(113, 38, '2011', 0),
(114, 34, '2011', 0),
(114, 35, '2011', 0),
(114, 36, '2011', 0),
(114, 37, '2011', 0),
(114, 38, '2011', 0),
(115, 34, '2011', 0),
(115, 35, '2011', 0),
(115, 36, '2011', 0),
(115, 37, '2011', 0),
(115, 38, '2011', 0),
(116, 34, '2011', 0),
(116, 35, '2011', 0),
(116, 36, '2011', 0),
(116, 37, '2011', 0),
(116, 38, '2011', 0),
(117, 34, '2011', 0),
(117, 35, '2011', 0),
(117, 36, '2011', 0),
(117, 37, '2011', 0),
(117, 38, '2011', 0),
(118, 34, '2011', 0),
(118, 35, '2011', 0),
(118, 36, '2011', 0),
(118, 37, '2011', 0),
(118, 38, '2011', 0),
(119, 34, '2011', 0),
(119, 35, '2011', 0),
(119, 36, '2011', 0),
(119, 37, '2011', 0),
(119, 38, '2011', 0),
(120, 34, '2011', 0),
(120, 35, '2011', 0),
(120, 36, '2011', 0),
(120, 37, '2011', 0),
(120, 38, '2011', 0),
(121, 34, '2011', 0),
(121, 35, '2011', 0),
(121, 36, '2011', 0),
(121, 37, '2011', 0),
(121, 38, '2011', 0),
(122, 34, '2011', 0),
(122, 35, '2011', 0),
(122, 36, '2011', 0),
(122, 37, '2011', 0),
(122, 38, '2011', 0),
(123, 34, '2011', 0),
(123, 35, '2011', 0),
(123, 36, '2011', 0),
(123, 37, '2011', 0),
(123, 38, '2011', 0),
(124, 34, '2011', 0),
(124, 35, '2011', 0),
(124, 36, '2011', 0),
(124, 37, '2011', 0),
(124, 38, '2011', 0),
(125, 34, '2011', 0),
(125, 35, '2011', 0),
(125, 36, '2011', 0),
(125, 37, '2011', 0),
(125, 38, '2011', 0),
(126, 34, '2011', 0),
(126, 35, '2011', 0),
(126, 36, '2011', 0),
(126, 37, '2011', 0),
(126, 38, '2011', 0),
(127, 34, '2011', 0),
(127, 35, '2011', 0),
(127, 36, '2011', 0),
(127, 37, '2011', 0),
(127, 38, '2011', 0),
(128, 34, '2011', 0),
(128, 35, '2011', 0),
(128, 36, '2011', 0),
(128, 37, '2011', 0),
(128, 38, '2011', 0),
(129, 34, '2011', 0),
(129, 35, '2011', 0),
(129, 36, '2011', 0),
(129, 37, '2011', 0),
(129, 38, '2011', 0),
(130, 34, '2011', 0),
(130, 35, '2011', 0),
(130, 36, '2011', 0),
(130, 37, '2011', 0),
(130, 38, '2011', 0),
(131, 34, '2011', 0),
(131, 35, '2011', 0),
(131, 36, '2011', 0),
(131, 37, '2011', 0),
(131, 38, '2011', 0),
(132, 34, '2011', 0),
(132, 35, '2011', 0),
(132, 36, '2011', 0),
(132, 37, '2011', 0),
(132, 38, '2011', 0),
(133, 34, '2011', 0),
(133, 35, '2011', 0),
(133, 36, '2011', 0),
(133, 37, '2011', 0),
(133, 38, '2011', 0),
(134, 34, '2011', 0),
(134, 35, '2011', 0),
(134, 36, '2011', 0),
(134, 37, '2011', 0),
(134, 38, '2011', 0),
(135, 34, '2011', 0),
(135, 35, '2011', 0),
(135, 36, '2011', 0),
(135, 37, '2011', 0),
(135, 38, '2011', 0),
(136, 34, '2011', 0),
(136, 35, '2011', 0),
(136, 36, '2011', 0),
(136, 37, '2011', 0),
(136, 38, '2011', 0),
(137, 34, '2011', 0),
(137, 35, '2011', 0),
(137, 36, '2011', 0),
(137, 37, '2011', 0),
(137, 38, '2011', 0),
(139, 13, '2011', 0),
(139, 14, '2011', 0),
(139, 15, '2011', 0),
(139, 16, '2011', 0),
(139, 17, '2011', 0),
(139, 18, '2011', 0),
(140, 13, '2011', 0),
(140, 14, '2011', 0),
(140, 15, '2011', 0),
(140, 16, '2011', 0),
(140, 17, '2011', 0),
(140, 18, '2011', 0),
(141, 13, '2011', 0),
(141, 14, '2011', 0),
(141, 15, '2011', 0),
(141, 16, '2011', 0),
(141, 17, '2011', 0),
(141, 18, '2011', 0),
(142, 13, '2011', 0),
(142, 14, '2011', 0),
(142, 15, '2011', 0),
(142, 16, '2011', 0),
(142, 17, '2011', 0),
(142, 18, '2011', 0),
(143, 13, '2011', 0),
(143, 14, '2011', 0),
(143, 15, '2011', 0),
(143, 16, '2011', 0),
(143, 17, '2011', 0),
(143, 18, '2011', 0),
(144, 13, '2011', 0),
(144, 14, '2011', 0),
(144, 15, '2011', 0),
(144, 16, '2011', 0),
(144, 17, '2011', 0),
(144, 18, '2011', 0),
(145, 13, '2011', 0),
(145, 14, '2011', 0),
(145, 15, '2011', 0),
(145, 16, '2011', 0),
(145, 17, '2011', 0),
(145, 18, '2011', 0),
(146, 13, '2011', 0),
(146, 14, '2011', 0),
(146, 15, '2011', 0),
(146, 16, '2011', 0),
(146, 17, '2011', 0),
(146, 18, '2011', 0),
(147, 13, '2011', 0),
(147, 14, '2011', 0),
(147, 15, '2011', 0),
(147, 16, '2011', 0),
(147, 17, '2011', 0),
(147, 18, '2011', 0),
(148, 13, '2011', 0),
(148, 14, '2011', 0),
(148, 15, '2011', 0),
(148, 16, '2011', 0),
(148, 17, '2011', 0),
(148, 18, '2011', 0),
(149, 13, '2011', 0),
(149, 14, '2011', 0),
(149, 15, '2011', 0),
(149, 16, '2011', 0),
(149, 17, '2011', 0),
(149, 18, '2011', 0),
(150, 13, '2011', 0),
(150, 14, '2011', 0),
(150, 15, '2011', 0),
(150, 16, '2011', 0),
(150, 17, '2011', 0),
(150, 18, '2011', 0),
(151, 13, '2011', 0),
(151, 14, '2011', 0),
(151, 15, '2011', 0),
(151, 16, '2011', 0),
(151, 17, '2011', 0),
(151, 18, '2011', 0),
(152, 13, '2011', 0),
(152, 14, '2011', 0),
(152, 15, '2011', 0),
(152, 16, '2011', 0),
(152, 17, '2011', 0),
(152, 18, '2011', 0),
(153, 13, '2011', 0),
(153, 14, '2011', 0),
(153, 15, '2011', 0),
(153, 16, '2011', 0),
(153, 17, '2011', 0),
(153, 18, '2011', 0),
(154, 13, '2011', 0),
(154, 14, '2011', 0),
(154, 15, '2011', 0),
(154, 16, '2011', 0),
(154, 17, '2011', 0),
(154, 18, '2011', 0),
(155, 13, '2011', 0),
(155, 14, '2011', 0),
(155, 15, '2011', 0),
(155, 16, '2011', 0),
(155, 17, '2011', 0),
(155, 18, '2011', 0),
(156, 13, '2011', 0),
(156, 14, '2011', 0),
(156, 15, '2011', 0),
(156, 16, '2011', 0),
(156, 17, '2011', 0),
(156, 18, '2011', 0),
(157, 13, '2011', 0),
(157, 14, '2011', 0),
(157, 15, '2011', 0),
(157, 16, '2011', 0),
(157, 17, '2011', 0),
(157, 18, '2011', 0),
(158, 13, '2011', 0),
(158, 14, '2011', 0),
(158, 15, '2011', 0),
(158, 16, '2011', 0),
(158, 17, '2011', 0),
(158, 18, '2011', 0),
(159, 13, '2011', 0),
(159, 14, '2011', 0),
(159, 15, '2011', 0),
(159, 16, '2011', 0),
(159, 17, '2011', 0),
(159, 18, '2011', 0),
(160, 13, '2011', 0),
(160, 14, '2011', 0),
(160, 15, '2011', 0),
(160, 16, '2011', 0),
(160, 17, '2011', 0),
(160, 18, '2011', 0),
(161, 13, '2011', 0),
(161, 14, '2011', 0),
(161, 15, '2011', 0),
(161, 16, '2011', 0),
(161, 17, '2011', 0),
(161, 18, '2011', 0),
(162, 13, '2011', 0),
(162, 14, '2011', 0),
(162, 15, '2011', 0),
(162, 16, '2011', 0),
(162, 17, '2011', 0),
(162, 18, '2011', 0),
(163, 13, '2011', 0),
(163, 14, '2011', 0),
(163, 15, '2011', 0),
(163, 16, '2011', 0),
(163, 17, '2011', 0),
(163, 18, '2011', 0),
(164, 13, '2011', 0),
(164, 14, '2011', 0),
(164, 15, '2011', 0),
(164, 16, '2011', 0),
(164, 17, '2011', 0),
(164, 18, '2011', 0),
(264, 34, '2011', 0),
(264, 36, '2011', 0),
(264, 38, '2011', 0),
(264, 50, '2011', 0),
(264, 51, '2011', 0),
(265, 34, '2011', 0),
(265, 36, '2011', 0),
(265, 38, '2011', 0),
(265, 50, '2011', 0),
(265, 51, '2011', 0),
(266, 34, '2011', 0),
(266, 36, '2011', 0),
(266, 38, '2011', 0),
(266, 50, '2011', 0),
(266, 51, '2011', 0),
(267, 34, '2011', 0),
(267, 36, '2011', 0),
(267, 38, '2011', 0),
(267, 50, '2011', 0),
(267, 51, '2011', 0),
(268, 34, '2011', 0),
(268, 36, '2011', 0),
(268, 38, '2011', 0),
(268, 50, '2011', 0),
(268, 51, '2011', 0),
(269, 34, '2011', 0),
(269, 36, '2011', 0),
(269, 38, '2011', 0),
(269, 50, '2011', 0),
(269, 51, '2011', 0),
(270, 34, '2011', 0),
(270, 36, '2011', 0),
(270, 38, '2011', 0),
(270, 50, '2011', 0),
(270, 51, '2011', 0),
(271, 34, '2011', 0),
(271, 36, '2011', 0),
(271, 38, '2011', 0),
(271, 50, '2011', 0),
(271, 51, '2011', 0),
(272, 34, '2011', 0),
(272, 36, '2011', 0),
(272, 38, '2011', 0),
(272, 50, '2011', 0),
(272, 51, '2011', 0),
(273, 34, '2011', 0),
(273, 36, '2011', 0),
(273, 38, '2011', 0),
(273, 50, '2011', 0),
(273, 51, '2011', 0),
(274, 34, '2011', 0),
(274, 36, '2011', 0),
(274, 38, '2011', 0),
(274, 50, '2011', 0),
(274, 51, '2011', 0),
(275, 34, '2011', 0),
(275, 36, '2011', 0),
(275, 38, '2011', 0),
(275, 50, '2011', 0),
(275, 51, '2011', 0),
(276, 34, '2011', 0),
(276, 36, '2011', 0),
(276, 38, '2011', 0),
(276, 50, '2011', 0),
(276, 51, '2011', 0),
(277, 34, '2011', 0),
(277, 36, '2011', 0),
(277, 38, '2011', 0),
(277, 50, '2011', 0),
(277, 51, '2011', 0),
(278, 34, '2011', 0),
(278, 36, '2011', 0),
(278, 38, '2011', 0),
(278, 50, '2011', 0),
(278, 51, '2011', 0),
(279, 34, '2011', 0),
(279, 36, '2011', 0),
(279, 38, '2011', 0),
(279, 50, '2011', 0),
(279, 51, '2011', 0),
(280, 34, '2011', 0),
(280, 36, '2011', 0),
(280, 38, '2011', 0),
(280, 50, '2011', 0),
(280, 51, '2011', 0),
(281, 34, '2011', 0),
(281, 36, '2011', 0),
(281, 38, '2011', 0),
(281, 50, '2011', 0),
(281, 51, '2011', 0),
(282, 34, '2011', 0),
(282, 36, '2011', 0),
(282, 38, '2011', 0),
(282, 50, '2011', 0),
(282, 51, '2011', 0),
(283, 34, '2011', 0),
(283, 36, '2011', 0),
(283, 38, '2011', 0),
(283, 50, '2011', 0),
(283, 51, '2011', 0),
(284, 34, '2011', 0),
(284, 36, '2011', 0),
(284, 38, '2011', 0),
(284, 50, '2011', 0),
(284, 51, '2011', 0),
(285, 34, '2011', 0),
(285, 36, '2011', 0),
(285, 38, '2011', 0),
(285, 50, '2011', 0),
(285, 51, '2011', 0),
(286, 34, '2011', 0),
(286, 36, '2011', 0),
(286, 38, '2011', 0),
(286, 50, '2011', 0),
(286, 51, '2011', 0),
(287, 34, '2011', 0),
(287, 36, '2011', 0),
(287, 38, '2011', 0),
(287, 50, '2011', 0),
(287, 51, '2011', 0),
(288, 34, '2011', 0),
(288, 36, '2011', 0),
(288, 38, '2011', 0),
(288, 50, '2011', 0),
(288, 51, '2011', 0),
(289, 34, '2011', 0),
(289, 36, '2011', 0),
(289, 38, '2011', 0),
(289, 50, '2011', 0),
(289, 51, '2011', 0),
(290, 34, '2011', 0),
(290, 36, '2011', 0),
(290, 38, '2011', 0),
(290, 50, '2011', 0),
(290, 51, '2011', 0),
(291, 34, '2011', 0),
(291, 36, '2011', 0),
(291, 38, '2011', 0),
(291, 50, '2011', 0),
(291, 51, '2011', 0),
(292, 34, '2011', 0),
(292, 36, '2011', 0),
(292, 38, '2011', 0),
(292, 50, '2011', 0),
(292, 51, '2011', 0),
(293, 34, '2011', 0),
(293, 36, '2011', 0),
(293, 38, '2011', 0),
(293, 50, '2011', 0),
(293, 51, '2011', 0),
(294, 34, '2011', 0),
(294, 36, '2011', 0),
(294, 38, '2011', 0),
(294, 50, '2011', 0),
(294, 51, '2011', 0),
(295, 34, '2011', 0),
(295, 36, '2011', 0),
(295, 38, '2011', 0),
(295, 50, '2011', 0),
(295, 51, '2011', 0),
(296, 34, '2011', 0),
(296, 36, '2011', 0),
(296, 38, '2011', 0),
(296, 50, '2011', 0),
(296, 51, '2011', 0),
(297, 34, '2011', 0),
(297, 36, '2011', 0),
(297, 38, '2011', 0),
(297, 50, '2011', 0),
(297, 51, '2011', 0),
(298, 34, '2011', 0),
(298, 36, '2011', 0),
(298, 38, '2011', 0),
(298, 50, '2011', 0),
(298, 51, '2011', 0),
(299, 34, '2011', 0),
(299, 36, '2011', 0),
(299, 38, '2011', 0),
(299, 50, '2011', 0),
(299, 51, '2011', 0),
(300, 34, '2011', 0),
(300, 36, '2011', 0),
(300, 38, '2011', 0),
(300, 50, '2011', 0),
(300, 51, '2011', 0),
(301, 34, '2011', 0),
(301, 36, '2011', 0),
(301, 38, '2011', 0),
(301, 50, '2011', 0),
(301, 51, '2011', 0),
(302, 34, '2011', 0),
(302, 36, '2011', 0),
(302, 38, '2011', 0),
(302, 50, '2011', 0),
(302, 51, '2011', 0),
(303, 34, '2011', 0),
(303, 36, '2011', 0),
(303, 38, '2011', 0),
(303, 50, '2011', 0),
(303, 51, '2011', 0),
(304, 34, '2011', 0),
(304, 36, '2011', 0),
(304, 38, '2011', 0),
(304, 50, '2011', 0),
(304, 51, '2011', 0),
(305, 34, '2011', 0),
(305, 36, '2011', 0),
(305, 38, '2011', 0),
(305, 50, '2011', 0),
(305, 51, '2011', 0),
(306, 34, '2011', 0),
(306, 36, '2011', 0),
(306, 38, '2011', 0),
(306, 50, '2011', 0),
(306, 51, '2011', 0),
(307, 34, '2011', 0),
(307, 36, '2011', 0),
(307, 38, '2011', 0),
(307, 50, '2011', 0),
(307, 51, '2011', 0),
(308, 34, '2011', 0),
(308, 36, '2011', 0),
(308, 38, '2011', 0),
(308, 50, '2011', 0),
(308, 51, '2011', 0),
(309, 34, '2011', 0),
(309, 36, '2011', 0),
(309, 38, '2011', 0),
(309, 50, '2011', 0),
(309, 51, '2011', 0),
(310, 34, '2011', 0),
(310, 36, '2011', 0),
(310, 38, '2011', 0),
(310, 50, '2011', 0),
(310, 51, '2011', 0),
(311, 34, '2011', 0),
(311, 36, '2011', 0),
(311, 38, '2011', 0),
(311, 50, '2011', 0),
(311, 51, '2011', 0),
(312, 34, '2011', 0),
(312, 36, '2011', 0),
(312, 38, '2011', 0),
(312, 50, '2011', 0),
(312, 51, '2011', 0),
(313, 43, '2011', 0),
(313, 44, '2011', 0),
(313, 45, '2011', 0),
(313, 46, '2011', 0),
(313, 47, '2011', 0),
(313, 48, '2011', 0),
(313, 49, '2011', 0),
(314, 43, '2011', 0),
(314, 44, '2011', 0),
(314, 45, '2011', 0),
(314, 46, '2011', 0),
(314, 47, '2011', 0),
(314, 48, '2011', 0),
(314, 49, '2011', 0),
(315, 43, '2011', 0),
(315, 44, '2011', 0),
(315, 45, '2011', 0),
(315, 46, '2011', 0),
(315, 47, '2011', 0),
(315, 48, '2011', 0),
(315, 49, '2011', 0),
(316, 43, '2011', 0),
(316, 44, '2011', 0),
(316, 45, '2011', 0),
(316, 46, '2011', 0),
(316, 47, '2011', 0),
(316, 48, '2011', 0),
(316, 49, '2011', 0),
(317, 43, '2011', 0),
(317, 44, '2011', 0),
(317, 45, '2011', 0),
(317, 46, '2011', 0),
(317, 47, '2011', 0),
(317, 48, '2011', 0),
(317, 49, '2011', 0),
(318, 43, '2011', 0),
(318, 44, '2011', 0),
(318, 45, '2011', 0),
(318, 46, '2011', 0),
(318, 47, '2011', 0),
(318, 48, '2011', 0),
(318, 49, '2011', 0),
(319, 43, '2011', 0),
(319, 44, '2011', 0),
(319, 45, '2011', 0),
(319, 46, '2011', 0),
(319, 47, '2011', 0),
(319, 48, '2011', 0),
(319, 49, '2011', 0),
(320, 43, '2011', 0),
(320, 44, '2011', 0),
(320, 45, '2011', 0),
(320, 46, '2011', 0),
(320, 47, '2011', 0),
(320, 48, '2011', 0),
(320, 49, '2011', 0),
(321, 43, '2011', 0),
(321, 44, '2011', 0),
(321, 45, '2011', 0),
(321, 46, '2011', 0),
(321, 47, '2011', 0),
(321, 48, '2011', 0),
(321, 49, '2011', 0),
(322, 43, '2011', 0),
(322, 44, '2011', 0),
(322, 45, '2011', 0),
(322, 46, '2011', 0),
(322, 47, '2011', 0),
(322, 48, '2011', 0),
(322, 49, '2011', 0),
(323, 43, '2011', 0),
(323, 44, '2011', 0),
(323, 45, '2011', 0),
(323, 46, '2011', 0),
(323, 47, '2011', 0),
(323, 48, '2011', 0),
(323, 49, '2011', 0),
(324, 43, '2011', 0),
(324, 44, '2011', 0),
(324, 45, '2011', 0),
(324, 46, '2011', 0),
(324, 47, '2011', 0),
(324, 48, '2011', 0),
(324, 49, '2011', 0);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id_commentaire` int(11) NOT NULL,
  `date_commentaire` date NOT NULL,
  `libelle` varchar(400) NOT NULL,
  `id_document` int(11) NOT NULL,
  `auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`id_commentaire`, `date_commentaire`, `libelle`, `id_document`, `auteur`) VALUES
(1, '0000-00-00', 'ce schema n''est pas bon	                            ', 16813, 1),
(2, '0000-00-00', 'juste pour test	                         							', 16813, 1),
(3, '0000-00-00', 'juste un test	                            \r\n								', 16813, 1),
(4, '2012-12-01', 'juste un test	                            \r\n								', 16813, 1),
(5, '2012-12-07', 'juste un test	                            \r\n								', 16813, 1);

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE `competence` (
  `idCompetence` int(11) NOT NULL,
  `LibelleCompetence` varchar(100) DEFAULT NULL,
  `idTypeCompetence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `competence`
--

INSERT INTO `competence` (`idCompetence`, `LibelleCompetence`, `idTypeCompetence`) VALUES
(1, 'Présentation', 1),
(2, 'Ponctualité', 1),
(3, 'Intégration', 1),
(4, 'Dynamisme et ténacité', 1),
(5, 'Expression Orale', 1),
(6, 'Expression Ecrite', 1),
(7, 'Capacité de persuasion', 1),
(8, 'Adaptabilité', 1),
(10, 'Maîtrise statistique', 2),
(11, 'Maîtrise informatique', 2),
(12, 'Atteinte des objectifs', 2),
(13, 'Analyse et jugement', 2),
(14, 'Imagination pratique', 2),
(15, 'Prise d''initiative', 2),
(16, 'Esprit de responsabilité', 2),
(18, 'Curiosité et ouverture d''esprit', 2),
(19, 'Test', 2);

-- --------------------------------------------------------

--
-- Structure de la table `comp_stage`
--

CREATE TABLE `comp_stage` (
  `idCompetence` int(11) NOT NULL,
  `NumStage` int(11) NOT NULL,
  `noteCompStage` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `comp_stage`
--

INSERT INTO `comp_stage` (`idCompetence`, `NumStage`, `noteCompStage`) VALUES
(1, 349, NULL),
(2, 349, NULL),
(3, 349, NULL),
(4, 349, NULL),
(5, 349, NULL),
(6, 349, NULL),
(7, 349, NULL),
(8, 349, NULL),
(10, 349, NULL),
(11, 349, NULL),
(12, 349, NULL),
(13, 349, NULL),
(14, 349, NULL),
(15, 349, NULL),
(16, 349, NULL),
(18, 349, NULL),
(19, 349, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comp_syllabus`
--

CREATE TABLE `comp_syllabus` (
  `idCompetence` int(11) NOT NULL,
  `idSyllabus` int(11) NOT NULL,
  `noteCompSyllabus` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comp_travauxgroupe`
--

CREATE TABLE `comp_travauxgroupe` (
  `numTravauxGroupe` int(11) NOT NULL,
  `idCompetence` int(11) NOT NULL,
  `noteCompTravauxGroupe` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comp_travauxind`
--

CREATE TABLE `comp_travauxind` (
  `idCompetence` int(11) NOT NULL,
  `NumTravauxInd` int(11) NOT NULL,
  `noteCompTravauxInd` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `diriger`
--

CREATE TABLE `diriger` (
  `NumEnseignant` int(11) NOT NULL,
  `idFormation` int(11) NOT NULL,
  `dateDiriger` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `diriger`
--

INSERT INTO `diriger` (`NumEnseignant`, `idFormation`, `dateDiriger`) VALUES
(30, 11, NULL),
(34, 3, '2011-01-01'),
(40, 5, '2011-12-12'),
(47, 1, NULL),
(47, 2, NULL),
(61, 9, NULL),
(61, 10, NULL),
(70, 4, NULL),
(92, 8, NULL),
(96, 7, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE `documents` (
  `id_doc` int(5) NOT NULL,
  `titre_doc` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `type_doc` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `description_doc` text COLLATE latin1_general_ci NOT NULL,
  `mots_cles_doc` text COLLATE latin1_general_ci,
  `langue_doc` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `date_publi_doc` text COLLATE latin1_general_ci,
  `date_envoi_doc` text COLLATE latin1_general_ci,
  `nom_fichier` varchar(70) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `documents`
--

INSERT INTO `documents` (`id_doc`, `titre_doc`, `type_doc`, `description_doc`, `mots_cles_doc`, `langue_doc`, `date_publi_doc`, `date_envoi_doc`, `nom_fichier`) VALUES
(16813, 'Schema relationnel', NULL, 'schema relationnel de la base de donnÃ©es', 'schema', 'Francais', '11/19/2012', '11/27/2012', '16813');

-- --------------------------------------------------------

--
-- Structure de la table `documents2etudiants2missions`
--

CREATE TABLE `documents2etudiants2missions` (
  `id_doc` int(5) NOT NULL,
  `id_etu` int(5) NOT NULL,
  `id_mission` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `documents2etudiants2missions`
--

INSERT INTO `documents2etudiants2missions` (`id_doc`, `id_etu`, `id_mission`) VALUES
(16813, 111, 883);

-- --------------------------------------------------------

--
-- Structure de la table `droitpage`
--

CREATE TABLE `droitpage` (
  `idRole` int(11) NOT NULL,
  `idPage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `droitpage`
--

INSERT INTO `droitpage` (`idRole`, `idPage`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 25),
(1, 31),
(1, 32),
(1, 33),
(1, 39),
(1, 40),
(1, 41),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(2, 25),
(2, 31),
(2, 32),
(2, 33),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 53),
(2, 54),
(3, 25),
(3, 48),
(3, 49),
(3, 50),
(3, 54),
(4, 25),
(4, 48),
(4, 49),
(4, 50),
(4, 53),
(4, 54),
(5, 25),
(5, 45),
(5, 48),
(5, 50),
(5, 54);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `NumEnseignant` int(11) NOT NULL,
  `SiteWebEnseignant` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `statusEnseignant` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `affiliationEnseignant` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `enseignant`
--

INSERT INTO `enseignant` (`NumEnseignant`, `SiteWebEnseignant`, `statusEnseignant`, `affiliationEnseignant`) VALUES
(30, 'Null', 'MCF', 'Null'),
(31, 'Null', 'ATER', 'Null'),
(32, 'Null', 'ATER', 'Null'),
(33, 'Null', 'MCF', 'Null'),
(34, 'Null', 'MCF', 'Null'),
(35, 'Null', 'Vacataire', 'Null'),
(36, 'Null', 'Vacataire pro', 'Null'),
(37, 'Null', 'MCF', 'Null'),
(38, 'Null', 'PU', 'Null'),
(39, 'Null', 'Convention', 'Null'),
(40, 'Null', 'PU', 'Null'),
(41, 'Null', 'Convention', 'Null'),
(42, 'Null', 'Convention', 'Null'),
(43, 'Null', 'Vacataire pro', 'Null'),
(44, 'Null', 'Vacataire pro', 'Null'),
(45, 'Null', 'Vacataire pro', 'Null'),
(46, 'Null', 'Vacataire pro', 'Null'),
(47, 'Null', 'PU', 'Null'),
(49, 'Null', 'MCF', 'Null'),
(50, 'Null', 'Vacataire pro', 'Null'),
(51, 'Null', 'Vacataire', 'Null'),
(52, 'Null', 'Vacataire pro', 'Null'),
(53, 'Null', 'Vacataire', 'Null'),
(54, 'Null', 'Vacataire', 'Null'),
(55, 'Null', 'MCF', 'Null'),
(56, 'Null', 'Vacataire pro', 'Null'),
(57, 'Null', 'Vacataire pro', 'Null'),
(58, 'Null', 'Vacataire pro', 'Null'),
(59, 'Null', 'MCF', 'Null'),
(60, 'Null', 'CDU', 'Null'),
(61, 'Null', 'MCF', 'Null'),
(62, 'Null', 'Vacataire pro', 'Null'),
(65, 'Null', 'PAST', 'Null'),
(66, 'Null', 'Vacataire pro', 'Null'),
(67, 'Null', 'PU', 'Null'),
(68, 'Null', 'MCF', 'Null'),
(69, 'Null', 'Vacataire pro', 'Null'),
(70, 'Null', 'PU', 'Null'),
(71, 'Null', 'MCF', 'Null'),
(72, 'Null', 'Vacataire pro', 'Null'),
(73, 'Null', 'Vacataire pro', 'Null'),
(74, 'Null', 'MCF', 'Null'),
(75, 'Null', 'MCF', 'Null'),
(77, 'Null', 'MCF', 'Null'),
(78, 'Null', 'Null', 'Null'),
(79, 'Null', 'Vacataire pro', 'Null'),
(80, 'Null', 'MCF', 'Null'),
(81, 'Null', 'MCF', 'Null'),
(82, 'Null', 'MCF', 'Null'),
(83, 'Null', 'Vacataire pro', 'Null'),
(84, 'Null', 'Vacataire pro', 'Null'),
(85, 'Null', 'CDU', 'Null'),
(86, 'Null', 'MCF', 'Null'),
(87, 'Null', 'MCF', 'Null'),
(88, 'Null', 'MCF', 'Null'),
(89, 'Null', 'MCF', 'Null'),
(90, 'Null', 'Convention', 'Null'),
(91, 'Null', 'Vacataire', 'Null'),
(92, 'Null', 'MCF', 'Null'),
(93, 'Null', 'PU', 'Null'),
(94, 'Null', 'Convention', 'Null'),
(95, 'Null', 'Convention', 'Null'),
(96, 'Null', 'PU', 'Null'),
(342, 'Null', 'Null', 'Null');

-- --------------------------------------------------------

--
-- Structure de la table `enseigner`
--

CREATE TABLE `enseigner` (
  `NumEnseignant` int(11) NOT NULL,
  `idSyllabus` int(11) NOT NULL,
  `annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `enseigner`
--

INSERT INTO `enseigner` (`NumEnseignant`, `idSyllabus`, `annee`) VALUES
(30, 20, 0),
(30, 36, 0),
(30, 45, 0),
(30, 63, 0),
(30, 81, 0),
(30, 111, 0),
(30, 115, 0),
(31, 28, 0),
(31, 47, 0),
(32, 22, 0),
(32, 28, 0),
(33, 23, 0),
(34, 2, 0),
(34, 3, 0),
(34, 4, 0),
(34, 26, 0),
(34, 54, 0),
(34, 57, 0),
(34, 75, 0),
(34, 88, 0),
(34, 95, 0),
(35, 15, 0),
(36, 32, 0),
(37, 63, 0),
(37, 91, 0),
(38, 46, 0),
(38, 87, 0),
(39, 99, 0),
(39, 104, 0),
(40, 26, 0),
(40, 28, 0),
(40, 47, 0),
(40, 57, 0),
(40, 76, 0),
(40, 82, 0),
(40, 94, 0),
(42, 96, 0),
(43, 33, 0),
(44, 74, 0),
(45, 76, 0),
(45, 86, 0),
(46, 93, 0),
(47, 13, 0),
(47, 16, 0),
(47, 22, 0),
(47, 44, 0),
(47, 57, 0),
(47, 84, 0),
(49, 25, 0),
(50, 8, 0),
(51, 110, 0),
(52, 98, 0),
(52, 99, 0),
(53, 10, 0),
(54, 84, 0),
(55, 61, 0),
(55, 66, 0),
(55, 72, 0),
(55, 75, 0),
(55, 88, 0),
(55, 95, 0),
(55, 99, 0),
(56, 99, 0),
(56, 100, 0),
(57, 52, 0),
(58, 29, 0),
(58, 121, 0),
(59, 90, 0),
(60, 47, 0),
(61, 37, 0),
(61, 99, 0),
(61, 116, 0),
(61, 117, 0),
(62, 42, 0),
(62, 102, 0),
(65, 11, 0),
(65, 29, 0),
(66, 106, 0),
(67, 27, 0),
(68, 62, 0),
(69, 83, 0),
(70, 7, 0),
(70, 14, 0),
(70, 18, 0),
(70, 21, 0),
(70, 65, 0),
(70, 68, 0),
(70, 78, 0),
(70, 81, 0),
(70, 89, 0),
(71, 20, 0),
(71, 63, 0),
(71, 75, 0),
(71, 106, 0),
(72, 105, 0),
(72, 120, 0),
(73, 49, 0),
(74, 106, 0),
(75, 87, 0),
(77, 87, 0),
(78, 12, 0),
(79, 43, 0),
(79, 99, 0),
(79, 103, 0),
(80, 6, 0),
(80, 9, 0),
(80, 27, 0),
(80, 51, 0),
(80, 92, 0),
(80, 112, 0),
(80, 113, 0),
(81, 58, 0),
(81, 62, 0),
(83, 109, 0),
(84, 71, 0),
(85, 17, 0),
(86, 19, 0),
(86, 56, 0),
(86, 79, 0),
(87, 24, 0),
(87, 97, 0),
(88, 39, 0),
(89, 41, 0),
(90, 50, 0),
(91, 5, 0),
(92, 31, 0),
(92, 59, 0),
(92, 61, 0),
(92, 69, 0),
(92, 70, 0),
(92, 77, 0),
(92, 108, 0),
(93, 61, 0),
(94, 101, 0),
(94, 118, 0),
(95, 80, 0),
(95, 99, 0),
(95, 117, 0),
(96, 58, 0),
(96, 68, 0),
(342, 1, 0),
(342, 38, 0),
(342, 60, 0),
(342, 64, 0),
(342, 79, 0);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `idEntreprise` int(11) NOT NULL,
  `NomEntreprise` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `AdresseRueEntreprise` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `AdresseCPEntreprise` int(5) DEFAULT NULL,
  `AdresseVilleEntreprise` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `AdressePaysEntreprise` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `TelephoneEntreprise` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FaxEntreprise` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `EmailEntreprise` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TypeEntreprise` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `entreprise`
--

INSERT INTO `entreprise` (`idEntreprise`, `NomEntreprise`, `AdresseRueEntreprise`, `AdresseCPEntreprise`, `AdresseVilleEntreprise`, `AdressePaysEntreprise`, `TelephoneEntreprise`, `FaxEntreprise`, `EmailEntreprise`, `TypeEntreprise`) VALUES
(5, 'LOGICA', '47 rue des Docks', 69009, 'LYON 9EME ARRONDISSE', 'France \r\n', '(0) 4 69 64 60 91', '(0) 4 69 64 60 91', 'vincent.foucteau@logica.com', 'SSII'),
(6, 'Logica', '47 Rue des Docks', 69009, 'LYON 9EME ARRONDISSE', 'France \r\n', '04 69 64 60 00', '04 69 64 60 00', 'melanie.jumas@logica.com', 'SSII'),
(7, 'Business & Decision', '45 quai charles de gaulle', 69006, 'LYON 6EME ARRONDISSE', 'France ', '0437473240', '0437473241', 'contact@businessdecision.com', 'SSII'),
(8, 'Keyrus', 'Le Techlid - ZAC du Sans Souci Route de Paisy', 69760, 'LIMONEST', 'France \r\n', '33 (0)4 37 49 69 49', '33 (0)4 37 49 69 59', 'keyrus-sud-est@keyrus.com', 'Société de services '),
(9, 'keyrus', 'ZAC du Sans Souci Route de Paisy', 69760, 'LIMONEST', 'France \r\n', '04 37 49 69 49', '04 37 49 69 49', 'www.keyrus.fr', 'BI'),
(10, 'Bull Méditerranée (Marseille)', 'Technopôle de Château-Gombert Bât. Euclide 43, Rue Frédéric Joliot-Curie ', 13013, 'CHATEAU GOMBERT', 'France ', '04 91 11 31 00', '04 91 11 31 15', 'http://www.bull.com', 'Société de service'),
(11, 'EDF DIN SEPTEN', '12 AVENUE ANTOINE DUTRIEVOZ', 69100, 'VILLEURBANNE', 'France \r\n', '04 69 65 67 03', '000', 'marion.casteran-casse@edf.fr', 'nsp'),
(12, 'Logica', 'Docksite, 47-49 rue des Docks, CS 20 218', 69007, 'LYON 7EME ARRONDISSE', 'France ', ' +33 (0) 4 69 64 60 ', '0000000000', 'gregory.levigne@logica.com', 'SSII'),
(13, 'Keyrus', 'Le Techlid', 69760, 'LIMONEST', 'France \r\n', '0437496949', '0437496959', 'keyrus-sud-est@keyrus.com', 'Conseil'),
(14, '2B Consulting‏', '35 rue du Val de Marne', 75013, 'PARIS 13EME ARRONDIS', 'France ', '+33 149 08 00 10', '+33 149 08 00 10', 'www.2bconsulting.com', 'Société de service '),
(15, 'Orange Business Services', '13 quai Gailleton', 69002, 'LYON 2EME ARRONDISSE', 'France \r\n', '0678110999', '-', 'francois.dulac@orange.com', '-'),
(16, 'INRA Unité de recherche Mét@risk- Méthodologie d''analyse de risque alimentaire', '2 Place Viala', 34000, 'MONTPELLIER', 'France \n', '04 99 61 22 00', ' 04 99 61 29 00', 'contact@supagro.inra.fr', 'Laboratoire de reche'),
(17, 'Micropole', '4-5 place Charles Hernu', 69100, 'VILLEURBANNE', 'France ', '+33 (0)4 26 99 60 00', '+33 (0)4 26 99 60 01', 'lyon@micropole.com', 'SSII'),
(18, 'Business & Decision', '45 Quai Charles de Gaulle', 69006, 'LYON 6EME ARRONDISSE', 'France ', '04 37 47 32 40', '04 37 47 32 41', ' claire.jombart@businessdecision.com', 'SSII'),
(19, 'MonoUso', 'Barcelone', 8000, 'LES AYVELLES', 'Espagne \r\n', '931158455', '931158455', 'comercial@monouso.es', 'E-commerce'),
(20, 'Orange', '131 Avenue Felix Faure', 69003, 'LYON 3EME ARRONDISSE', 'France ', '04 78 63 02 13', '04 78 63 02 13', 'contact@orange.com', 'Telecom'),
(21, 'Keyrus', '155 rue Anatole France', 92593, 'Paris Levallois-Perr', 'France \r\n', '0141341149 ', '0141341010', 'Fanny.Fradon@keyrus.com', 'SSII'),
(22, 'NEXANS', '29, rue du Pré Gaudry', 69007, 'LYON 7EME ARRONDISSE', 'France \r\n', '04 72 72 58 35', '04 72 72 56 06', 'marine.maginier@nexans.com', 'Privé'),
(23, 'Keolis', '20 rue de Villette, immeuble le Bonnel', 69003, 'LYON 3EME ARRONDISSE', 'France \r\n', '0469668060', '0469668237', 'jptily@keolis-lyon.fr', '/'),
(24, 'NAPSTEC', '12 Rue Moreau', 75012, 'PARIS 12EME ARRONDIS', 'France \r\n', '(+33)(0)1 43 41 00 4', '(+33)(0)1 43 41 01 8', 'epanassie@napstec.com', 'SSII'),
(25, 'Côté Clients', '19 rue David', 69003, 'LYON 3EME ARRONDISSE', 'France \r\n', '0472365800', '0000000000', 'e.lecorps@coteclients.fr', 'entreprise'),
(26, 'VPS DATA', '2 rue Gabriel Bourdarias', 69200, 'VENISSIEUX', 'France \r\n', '0413332525', '0958213362', 'asultana@vps-data.fr', 'société de service'),
(27, 'IFSTTAR', '25, Avenue François Mitterran', 69500, 'BRON', 'France \r\n', '04 72 14 25 40', '04 72 14 25 50', 'sonia.cenille@entpe.fr', 'Laboratoire'),
(28, 'Murex', '8 rue Bellini', 75016, 'PARIS 16EME ARRONDIS', 'France \r\n', '0144053200', '0144053210', 'info@murex.com', 'Informations'),
(29, 'APOLLO SSC', '96 Boulevard Vivier Merle', 69003, 'LYON 3EME ARRONDISSE', 'France \r\n', '0478354570', '0478350398', 'yst@apollossc.com', '...'),
(30, 'TeamWork', '129, rue servient tour du crédit lyonnais', 69003, 'LYON 3EME ARRONDISSE', 'France ', '+33478636325', '+33478636325', 'teamwork@teamwork.net', 'SSII'),
(31, 'NAPSTEC', '16 rue Moreau', 75012, 'PARIS 12EME ARRONDIS', 'France ', '01 43 41 00 41', '0143410180', 'epanassie@napstec.com', 'SSII'),
(32, 'LICIT', '25 avenue françois mitterrand case 24 69675', 69000, 'LYON', 'France \r\n', '+334 78 65 69 07', '+33 (0)4 72 37 68 37', 'romain.billot@ifsttar.fr', 'Laboratoire d''Ingéni'),
(33, 'Clasquin', '235 Cours Lafayette', 69006, 'LYON 6EME ARRONDISSE', 'France \r\n', '0472831700', '0472831700', 'smn.ho@clasquin.com', 'Société de Service'),
(34, 'buzzinbees SAS', '2045 route des Dolines', 6560, 'SOPHIA ANTIPOLIS', 'France \r\n', '06 15 90 76 78', '+33 476 703 054', 'david.mansutti@buzzinbees.com', 'SAS'),
(35, 'IFSTAR', '25 avenue François Mitterrand', 69500, 'BRON', 'France \r\n', '04 72 14 23 00', '04 72 37 68 37', 'umrestte@ifsttar.fr ', 'Etablissement Publiq'),
(36, 'Val Rosay', '133 route de st cyr', 69370, 'ST DIDIER AU MONT D ', 'France ', '0472535289', '0472535288', 'dubourvieux.vincent@laposte.net', 'Structure médicale'),
(37, 'EMC2', 'Espace Agricole Nid de Cygne', 55100, 'BRAS SUR MEUSE', 'France \r\n', '03 29 83 29 29', '0329832999', 'contact@emc2.coop', 'coopérative agricole'),
(38, 'ECOSYS GROUP', '68 rue faubourg saint honoré', 75008, 'PARIS 8EME ARRONDISS', 'France \r\n', '01 53 43 27 66', '0', 'francoise.auberger@ecosysgroup.com', 'conseil'),
(39, 'Keyrus', 'ZAC du Sans Souci Route de Paisy', 69760, 'LIMONEST', 'France \r\n', '04 37 49 69 49', '04 37 49 69 59', 'www.keyrus.com', 'Privée'),
(40, 'Logica', '47-49 rue des Docks', 69336, 'lyon', 'France \r\n', '+33 (0) 4 69 64 62 3', '000000000', 'vincent.foucteau@logica.com', 'SSII'),
(41, 'Division des études', 'Campus Porte des Alpes', 69500, 'BRON', 'France \r\n', '0478772371', '?', 'Annie.Cuzin@univ-lyon2.fr', '?'),
(42, 'APICIL', '1465', 69005, 'LYON 5EME ARRONDISSE', 'France ', '0664070230', '66996', 'insdrame007@hotmail.com', 'mail'),
(43, 'Division Etudes Cellule Apogée ', 'Campus Porte des Alpes 5.av.Pierre Mendès-France ', 69500, 'BRON', 'France \r\n', '04 78 77 23 71', '000000', 'annie.cusin@univ-lyon2.fr', '00000'),
(44, 'Hospices civils de Lyon - Groupement hospitalier Est', 'Boulevard Pinel', 69500, 'BRON', 'France ', '04 24 85 64 22', '04 24 85 64 22', 'catherine.michel@chu-lyon.fr', 'adminsitration'),
(45, 'IFSTTAR Institut français des Sciences et Technologies de Transport, Aménagement', '25 avenue François Mitterrand', 69005, 'LYON 5EME ARRONDISSE', 'France \r\n', '(0)4 72 14 25 43    ', '(33) (0)4 72 37 68 3', 'www.ifsttar.fr', 'EPST'),
(46, 'Tavira', '29 avenue Hoche', 75008, 'PARIS 8EME ARRONDISS', 'France \r\n', '0153430385', '0153430385', 'infos@tavira.fr', 'Conseil'),
(47, 'Patrimmo', '345 rue Garibaldi', 69007, 'LYON 7EME ARRONDISSE', 'France \r\n', '0437420404', '0437426970', 'cduclos@patr-immo.com', 'Immobilier'),
(48, 'Sino-African Consultancy Ltd.', '5 Floor Hong Cheng Xin Tai Plaza No.105 Road Chao Yang District of Beijing,China', 69100, 'VILLEURBANNE', 'France \r\n', '+86 139-1108-1878', '+86 10-59623258', 'gondy@hengbao.com', 'Commerce'),
(49, 'Digital télécom SAS', '100 rue des Fougères', 69009, 'LYON 9EME ARRONDISSE', 'France \r\n', '0482533131', '0482534968', 'contact@digitaltelecom.fr', 'SAS'),
(50, 'verrerie villeurbannaise', '27 rue Léon Blum', 69100, 'VILLEURBANNE', 'France \r\n', '04 72 34 09 48', '04 72 35 16 07', 'cyrille-mauguin@vervil.fr', 'petite entreprise'),
(51, 'DCNS', 'rue choiseul', 56100, 'LORIENT', 'France \r\n', '02 97 12 10 00', 'inconnu', 'inconnu', 'expert naval'),
(52, 'M2M Group', '16, Rue Abdelhak Ben Mehyou,  Quartier Palmiers,  20 100 Casablanca', 20100, 'BILIA', 'Maroc \r\n', '+212 522 43 53 00', '+212 522 47 04 45', 'moreinfo@m2mgroup.com', 'SA');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `NumEtudiant` int(11) NOT NULL,
  `DateInscriptionEtudiant` date DEFAULT NULL,
  `numINEEtudiant` varchar(30) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`NumEtudiant`, `DateInscriptionEtudiant`, `numINEEtudiant`) VALUES
(97, '2011-12-13', 'Null'),
(98, '2011-12-13', 'Null'),
(99, '0000-00-00', 'Null'),
(100, '0000-00-00', 'Null'),
(101, '0000-00-00', 'Null'),
(102, '0000-00-00', 'Null'),
(103, '0000-00-00', 'Null'),
(104, '0000-00-00', 'Null'),
(105, '0000-00-00', 'Null'),
(106, '0000-00-00', 'Null'),
(107, '0000-00-00', 'Null'),
(108, '0000-00-00', 'Null'),
(109, '0000-00-00', 'Null'),
(110, '0000-00-00', 'Null'),
(111, '0000-00-00', 'Null'),
(112, '0000-00-00', 'Null'),
(113, '0000-00-00', 'Null'),
(114, '0000-00-00', 'Null'),
(115, '0000-00-00', 'Null'),
(116, '0000-00-00', 'Null'),
(117, '0000-00-00', 'Null'),
(118, '0000-00-00', 'Null'),
(119, '0000-00-00', 'Null'),
(120, '0000-00-00', 'Null'),
(121, '0000-00-00', 'Null'),
(122, '0000-00-00', 'Null'),
(123, '0000-00-00', 'Null'),
(124, '0000-00-00', 'Null'),
(125, '0000-00-00', 'Null'),
(126, '0000-00-00', 'Null'),
(127, '0000-00-00', 'Null'),
(128, '0000-00-00', 'Null'),
(129, '0000-00-00', 'Null'),
(130, '0000-00-00', 'Null'),
(131, '0000-00-00', 'Null'),
(132, '0000-00-00', 'Null'),
(133, '0000-00-00', 'Null'),
(134, '0000-00-00', 'Null'),
(135, '0000-00-00', 'Null'),
(136, '0000-00-00', 'Null'),
(137, '0000-00-00', 'Null'),
(138, '0000-00-00', 'Null'),
(139, '0000-00-00', 'Null'),
(140, '0000-00-00', 'Null'),
(141, '2011-12-04', 'Null'),
(142, '0000-00-00', 'Null'),
(143, '0000-00-00', 'Null'),
(144, '0000-00-00', 'Null'),
(145, '0000-00-00', 'Null'),
(146, '0000-00-00', 'Null'),
(147, '0000-00-00', 'Null'),
(148, '0000-00-00', 'Null'),
(149, '0000-00-00', 'Null'),
(150, '0000-00-00', 'Null'),
(151, '0000-00-00', 'Null'),
(152, '0000-00-00', 'Null'),
(153, '0000-00-00', 'Null'),
(154, '0000-00-00', 'Null'),
(155, '0000-00-00', 'Null'),
(156, '0000-00-00', 'Null'),
(157, '0000-00-00', 'Null'),
(158, '0000-00-00', 'Null'),
(159, '0000-00-00', 'Null'),
(160, '0000-00-00', 'Null'),
(161, '0000-00-00', 'Null'),
(162, '0000-00-00', 'Null'),
(163, '0000-00-00', 'Null'),
(164, '0000-00-00', 'Null'),
(165, '0000-00-00', 'Null'),
(166, '0000-00-00', 'Null'),
(167, '0000-00-00', 'Null'),
(168, '0000-00-00', 'Null'),
(169, '0000-00-00', 'Null'),
(170, '0000-00-00', 'Null'),
(171, '0000-00-00', 'Null'),
(172, '0000-00-00', 'Null'),
(173, '0000-00-00', 'Null'),
(174, '0000-00-00', 'Null'),
(175, '0000-00-00', 'Null'),
(176, '0000-00-00', 'Null'),
(177, '0000-00-00', 'Null'),
(178, '0000-00-00', 'Null'),
(179, '0000-00-00', 'Null'),
(180, '0000-00-00', 'Null'),
(181, '0000-00-00', 'Null'),
(182, '0000-00-00', 'Null'),
(183, '0000-00-00', 'Null'),
(184, '0000-00-00', 'Null'),
(185, '0000-00-00', 'Null'),
(186, '0000-00-00', 'Null'),
(187, '0000-00-00', 'Null'),
(188, '0000-00-00', 'Null'),
(189, '0000-00-00', 'Null'),
(190, '0000-00-00', 'Null'),
(191, '0000-00-00', 'Null'),
(192, '0000-00-00', 'Null'),
(193, '0000-00-00', 'Null'),
(194, '0000-00-00', 'Null'),
(195, '0000-00-00', 'Null'),
(196, '0000-00-00', 'Null'),
(197, '0000-00-00', 'Null'),
(198, '0000-00-00', 'Null'),
(199, '0000-00-00', 'Null'),
(200, '0000-00-00', 'Null'),
(201, '0000-00-00', 'Null'),
(202, '0000-00-00', 'Null'),
(203, '0000-00-00', 'Null'),
(204, '0000-00-00', 'Null'),
(205, '0000-00-00', 'Null'),
(206, '0000-00-00', 'Null'),
(207, '0000-00-00', 'Null'),
(208, '0000-00-00', 'Null'),
(209, '0000-00-00', 'Null'),
(210, '0000-00-00', 'Null'),
(211, '0000-00-00', 'Null'),
(212, '0000-00-00', 'Null'),
(213, '0000-00-00', 'Null'),
(214, '0000-00-00', 'Null'),
(215, '0000-00-00', 'Null'),
(216, '0000-00-00', 'Null'),
(217, '0000-00-00', 'Null'),
(218, '0000-00-00', 'Null'),
(219, '0000-00-00', 'Null'),
(220, '0000-00-00', 'Null'),
(221, '0000-00-00', 'Null'),
(222, '0000-00-00', 'Null'),
(223, '0000-00-00', 'Null'),
(224, '0000-00-00', 'Null'),
(225, '0000-00-00', 'Null'),
(226, '0000-00-00', 'Null'),
(227, '0000-00-00', 'Null'),
(228, '0000-00-00', 'Null'),
(229, '0000-00-00', 'Null'),
(230, '0000-00-00', 'Null'),
(231, '0000-00-00', 'Null'),
(232, '0000-00-00', 'Null'),
(233, '0000-00-00', 'Null'),
(234, '0000-00-00', 'Null'),
(235, '0000-00-00', 'Null'),
(236, '0000-00-00', 'Null'),
(237, '0000-00-00', 'Null'),
(238, '0000-00-00', 'Null'),
(239, '0000-00-00', 'Null'),
(240, '0000-00-00', 'Null'),
(241, '0000-00-00', 'Null'),
(242, '0000-00-00', 'Null'),
(243, '0000-00-00', 'Null'),
(244, '0000-00-00', 'Null'),
(245, '0000-00-00', 'Null'),
(246, '0000-00-00', 'Null'),
(247, '0000-00-00', 'Null'),
(248, '0000-00-00', 'Null'),
(249, '0000-00-00', 'Null'),
(250, '0000-00-00', 'Null'),
(251, '0000-00-00', 'Null'),
(252, '0000-00-00', 'Null'),
(253, '0000-00-00', 'Null'),
(254, '0000-00-00', 'Null'),
(255, '0000-00-00', 'Null'),
(256, '0000-00-00', 'Null'),
(257, '0000-00-00', 'Null'),
(258, '0000-00-00', 'Null'),
(259, '0000-00-00', 'Null'),
(260, '0000-00-00', 'Null'),
(261, '0000-00-00', 'Null'),
(262, '0000-00-00', 'Null'),
(263, '0000-00-00', 'Null'),
(264, '0000-00-00', 'Null'),
(265, '0000-00-00', 'Null'),
(266, '0000-00-00', 'Null'),
(267, '0000-00-00', 'Null'),
(268, '0000-00-00', 'Null'),
(269, '0000-00-00', 'Null'),
(270, '0000-00-00', 'Null'),
(271, '0000-00-00', 'Null'),
(272, '0000-00-00', 'Null'),
(273, '0000-00-00', 'Null'),
(274, '0000-00-00', 'Null'),
(275, '0000-00-00', 'Null'),
(276, '0000-00-00', 'Null'),
(277, '0000-00-00', 'Null'),
(278, '0000-00-00', 'Null'),
(279, '0000-00-00', 'Null'),
(280, '0000-00-00', 'Null'),
(281, '0000-00-00', 'Null'),
(282, '0000-00-00', 'Null'),
(283, '0000-00-00', 'Null'),
(284, '0000-00-00', 'Null'),
(285, '0000-00-00', 'Null'),
(286, '0000-00-00', 'Null'),
(287, '0000-00-00', 'Null'),
(288, '0000-00-00', 'Null'),
(289, '0000-00-00', 'Null'),
(290, '0000-00-00', 'Null'),
(291, '0000-00-00', 'Null'),
(292, '0000-00-00', 'Null'),
(293, '0000-00-00', 'Null'),
(294, '0000-00-00', 'Null'),
(295, '0000-00-00', 'Null'),
(296, '0000-00-00', 'Null'),
(297, '0000-00-00', 'Null'),
(298, '0000-00-00', 'Null'),
(299, '0000-00-00', 'Null'),
(300, '0000-00-00', 'Null'),
(301, '0000-00-00', 'Null'),
(302, '0000-00-00', 'Null'),
(303, '0000-00-00', 'Null'),
(304, '0000-00-00', 'Null'),
(305, '0000-00-00', 'Null'),
(306, '0000-00-00', 'Null'),
(307, '0000-00-00', 'Null'),
(308, '0000-00-00', 'Null'),
(309, '0000-00-00', 'Null'),
(310, '0000-00-00', 'Null'),
(311, '0000-00-00', 'Null'),
(312, '0000-00-00', 'Null'),
(313, '0000-00-00', 'Null'),
(314, '0000-00-00', 'Null'),
(315, '0000-00-00', 'Null'),
(316, '0000-00-00', 'Null'),
(317, '0000-00-00', 'Null'),
(318, '0000-00-00', 'Null'),
(319, '0000-00-00', 'Null'),
(320, '0000-00-00', 'Null'),
(321, '0000-00-00', 'Null'),
(322, '0000-00-00', 'Null'),
(323, '0000-00-00', 'Null'),
(324, '0000-00-00', 'Null'),
(325, '0000-00-00', 'Null'),
(326, '0000-00-00', 'Null'),
(327, '0000-00-00', 'Null'),
(328, '0000-00-00', 'Null'),
(329, '0000-00-00', 'Null'),
(330, '0000-00-00', 'Null'),
(331, '0000-00-00', 'Null'),
(332, '0000-00-00', 'Null'),
(333, '0000-00-00', 'Null'),
(334, '0000-00-00', 'Null'),
(335, '0000-00-00', 'Null'),
(336, '0000-00-00', 'Null'),
(337, '0000-00-00', 'Null'),
(338, '0000-00-00', 'Null'),
(339, '0000-00-00', 'Null'),
(340, '0000-00-00', 'Null'),
(341, '0000-00-00', 'Null'),
(346, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `idSyllabus` int(11) NOT NULL,
  `NumEtudiant` int(11) NOT NULL,
  `dateEval` date NOT NULL DEFAULT '0000-00-00',
  `noteEval` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `idFormation` int(11) NOT NULL,
  `LibelleFormation` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `ObjectifForm` text COLLATE utf8_bin,
  `DeboucheForm` text COLLATE utf8_bin,
  `NiveauFormation` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ConditionAccesFormation` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `libelleFormation_en` varchar(255) COLLATE utf8_bin NOT NULL,
  `libelleFormation_fr` varchar(255) COLLATE utf8_bin NOT NULL,
  `diminutifFormation_fr` varchar(150) COLLATE utf8_bin NOT NULL,
  `diminutifFormation_en` varchar(150) COLLATE utf8_bin NOT NULL,
  `dureeForm` int(5) NOT NULL,
  `domaineFormation` varchar(200) COLLATE utf8_bin NOT NULL,
  `langueFormation` varchar(50) COLLATE utf8_bin NOT NULL,
  `etabDiplome` varchar(100) COLLATE utf8_bin NOT NULL,
  `etabFormation` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`idFormation`, `LibelleFormation`, `ObjectifForm`, `DeboucheForm`, `NiveauFormation`, `ConditionAccesFormation`, `libelleFormation_en`, `libelleFormation_fr`, `diminutifFormation_fr`, `diminutifFormation_en`, `dureeForm`, `domaineFormation`, `langueFormation`, `etabDiplome`, `etabFormation`) VALUES
(1, 'L1 IDEA', '', '', 'Licence 1', 'Bac', '', 'Licence 1 Informatique Décisionnelle et Économétrie Appliquée', 'L1 IDEA', '', 1, '', 'Fr', '', ''),
(2, 'L2 IDEA', '', '', 'Licence 2', 'Bac+1', '', 'Licence 2 Informatique Décisionnelle et Économétrie Appliquée', 'L2 IDEA', '', 1, '', 'Fr', '', ''),
(3, 'L3 IDEA', '', '', 'Licence 3', 'Bac+2', '', 'Licence 3 Informatique Decisionnelle et Statistique', 'L3 IDEA', '', 1, '', 'Fr', '', ''),
(4, 'M1 INFO', '', '', 'Master 1', 'Bac+3', '', 'Master 1 Informatique', 'M1 INFO', '', 1, '', 'Fr', '', ''),
(5, 'M2 IIDEE', '', '', 'Master 2', 'Bac+4', '', 'Master 2 Ingenierie Informatique de la Decision et de l evaluation Economique', 'M2 IIDEE', '', 1, '', 'Fr', '', ''),
(6, 'M2 IIDEE', '', '', 'Master 2', 'Bac+4', '', 'Master 2 Ingenierie Informatique de la Decision et de l evaluation economique', 'M2 FC IIDEE', '', 1, '', 'Fr', '', ''),
(7, 'M1 DMKM', '', '', 'Master 1', 'Bac+3', 'Master Data Mining and Knowledge Management', 'Master Data Mining and Knowledge Management', 'Master DMKM', '', 1, '', 'Fr', '', ''),
(8, 'M2  ECD', '', '', 'Master 2', 'Bac+4', '', 'Master 2 Extraction des Connaissances a partir des Donnees', 'M2 ECD', '', 1, '', 'Fr', '', ''),
(9, 'M2 OPSIE', '', '', 'Master 2', 'Bac+4', '', 'Master 2 Organisation et Protection des Syst', 'M2 OPSIE', '', 1, '', 'Fr', '', ''),
(10, 'M2 OPSIE', '', '', 'Master 2', 'Bac+4', '', 'Master 2 Organisation et Protection des Syst', 'M2 FC OPSIE', '', 1, '', 'Fr', '', ''),
(11, 'M2 SISE', '', '', 'Master 2', 'Bac+4', '', 'Master 2 Statistique et Informatique Socio economiques', 'M2 SISE', '', 1, '', 'Fr', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `inscrire`
--

CREATE TABLE `inscrire` (
  `NumEtudiant` int(11) NOT NULL,
  `idFormation` int(11) NOT NULL,
  `anneeInscrire` varchar(20) NOT NULL DEFAULT '',
  `valideFormation` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `inscrire`
--

INSERT INTO `inscrire` (`NumEtudiant`, `idFormation`, `anneeInscrire`, `valideFormation`) VALUES
(97, 5, '2011', 1),
(98, 5, '2011', 1),
(99, 5, '2011', 1),
(100, 5, '2011', 0),
(101, 5, '2011', 0),
(102, 5, '2011', 0),
(103, 5, '2011', 0),
(104, 5, '2011', 0),
(105, 5, '2011', 0),
(106, 5, '2011', 0),
(107, 5, '2011', 0),
(108, 5, '2011', 0),
(109, 5, '2011', 0),
(110, 5, '2011', 0),
(111, 5, '2011', 0),
(112, 5, '2011', 0),
(113, 5, '2011', 0),
(114, 5, '2011', 0),
(115, 5, '2011', 0),
(116, 5, '2011', 0),
(117, 5, '2011', 0),
(118, 5, '2011', 0),
(119, 5, '2011', 0),
(120, 5, '2011', 0),
(121, 5, '2011', 0),
(122, 5, '2011', 0),
(123, 5, '2011', 0),
(124, 5, '2011', 0),
(125, 6, '2011', 0),
(126, 6, '2011', 0),
(127, 6, '2011', 0),
(128, 6, '2011', 0),
(129, 6, '2011', 0),
(130, 6, '2011', 0),
(131, 6, '2011', 0),
(132, 6, '2011', 0),
(133, 6, '2011', 0),
(134, 6, '2011', 0),
(135, 6, '2011', 0),
(136, 6, '2011', 0),
(137, 6, '2011', 0),
(138, 6, '2011', 0),
(139, 3, '2011', 0),
(140, 3, '2011', 0),
(141, 3, '2011', 1),
(142, 3, '2011', 0),
(143, 3, '2011', 0),
(144, 3, '2011', 0),
(145, 3, '2011', 0),
(146, 3, '2011', 0),
(147, 3, '2011', 0),
(148, 3, '2011', 0),
(149, 3, '2011', 0),
(150, 3, '2011', 0),
(151, 3, '2011', 0),
(152, 3, '2011', 0),
(153, 3, '2011', 0),
(154, 3, '2011', 0),
(155, 3, '2011', 0),
(156, 3, '2011', 0),
(157, 3, '2011', 0),
(158, 3, '2011', 0),
(159, 3, '2011', 0),
(160, 3, '2011', 0),
(161, 3, '2011', 0),
(162, 3, '2011', 0),
(163, 3, '2011', 0),
(164, 3, '2011', 0),
(165, 4, '2011', 0),
(166, 4, '2011', 0),
(167, 4, '2011', 0),
(168, 4, '2011', 0),
(169, 4, '2011', 0),
(170, 4, '2011', 0),
(171, 4, '2011', 0),
(172, 4, '2011', 0),
(173, 4, '2011', 0),
(174, 4, '2011', 0),
(175, 4, '2011', 0),
(176, 4, '2011', 0),
(177, 4, '2011', 0),
(178, 4, '2011', 0),
(179, 4, '2011', 0),
(180, 4, '2011', 0),
(181, 4, '2011', 0),
(182, 4, '2011', 0),
(183, 4, '2011', 0),
(184, 4, '2011', 0),
(185, 4, '2011', 0),
(186, 4, '2011', 0),
(187, 4, '2011', 0),
(188, 4, '2011', 0),
(189, 4, '2011', 0),
(190, 4, '2011', 0),
(191, 4, '2011', 0),
(192, 4, '2011', 0),
(193, 4, '2011', 0),
(194, 4, '2011', 0),
(195, 4, '2011', 0),
(196, 4, '2011', 0),
(197, 4, '2011', 0),
(198, 4, '2011', 0),
(199, 4, '2011', 0),
(200, 4, '2011', 0),
(201, 4, '2011', 0),
(202, 4, '2011', 0),
(203, 4, '2011', 0),
(204, 4, '2011', 0),
(205, 4, '2011', 0),
(206, 4, '2011', 0),
(207, 4, '2011', 0),
(208, 4, '2011', 0),
(209, 4, '2011', 0),
(210, 4, '2011', 0),
(211, 4, '2011', 0),
(212, 4, '2011', 0),
(213, 4, '2011', 0),
(214, 4, '2011', 0),
(215, 4, '2011', 0),
(216, 4, '2011', 0),
(217, 4, '2011', 0),
(218, 4, '2011', 0),
(219, 4, '2011', 0),
(220, 4, '2011', 0),
(221, 4, '2011', 0),
(222, 4, '2011', 0),
(223, 4, '2011', 0),
(224, 4, '2011', 0),
(225, 4, '2011', 0),
(226, 4, '2011', 0),
(227, 4, '2011', 0),
(228, 4, '2011', 0),
(229, 4, '2011', 0),
(230, 4, '2011', 0),
(231, 4, '2011', 0),
(232, 4, '2011', 0),
(233, 4, '2011', 0),
(234, 4, '2011', 0),
(235, 4, '2011', 0),
(236, 4, '2011', 0),
(237, 4, '2011', 0),
(238, 4, '2011', 0),
(239, 4, '2011', 0),
(240, 4, '2011', 0),
(241, 4, '2011', 0),
(242, 4, '2011', 0),
(243, 11, '2011', 0),
(244, 11, '2011', 0),
(245, 11, '2011', 0),
(246, 11, '2011', 0),
(247, 11, '2011', 0),
(248, 11, '2011', 0),
(249, 11, '2011', 0),
(250, 11, '2011', 0),
(251, 11, '2011', 0),
(252, 11, '2011', 0),
(253, 11, '2011', 0),
(254, 11, '2011', 0),
(255, 11, '2011', 0),
(256, 11, '2011', 0),
(257, 11, '2011', 0),
(258, 11, '2011', 0),
(259, 11, '2011', 0),
(260, 11, '2011', 0),
(261, 11, '2011', 0),
(262, 11, '2011', 0),
(263, 11, '2011', 0),
(264, 9, '2011', 0),
(265, 9, '2011', 0),
(266, 9, '2011', 0),
(267, 9, '2011', 0),
(268, 9, '2011', 0),
(269, 9, '2011', 0),
(270, 9, '2011', 0),
(271, 9, '2011', 0),
(272, 9, '2011', 0),
(273, 9, '2011', 0),
(274, 9, '2011', 0),
(275, 9, '2011', 0),
(276, 9, '2011', 0),
(277, 9, '2011', 0),
(278, 9, '2011', 0),
(279, 9, '2011', 0),
(280, 9, '2011', 0),
(281, 9, '2011', 0),
(282, 9, '2011', 0),
(283, 9, '2011', 0),
(284, 9, '2011', 0),
(285, 9, '2011', 0),
(286, 9, '2011', 0),
(287, 9, '2011', 0),
(288, 10, '2011', 0),
(289, 10, '2011', 0),
(290, 10, '2011', 0),
(291, 10, '2011', 0),
(292, 10, '2011', 0),
(293, 10, '2011', 0),
(294, 10, '2011', 0),
(295, 10, '2011', 0),
(296, 10, '2011', 0),
(297, 10, '2011', 0),
(298, 10, '2011', 0),
(299, 10, '2011', 0),
(300, 10, '2011', 0),
(301, 10, '2011', 0),
(302, 10, '2011', 0),
(303, 10, '2011', 0),
(304, 10, '2011', 0),
(305, 10, '2011', 0),
(306, 10, '2011', 0),
(307, 10, '2011', 0),
(308, 10, '2011', 0),
(309, 10, '2011', 0),
(310, 10, '2011', 0),
(311, 10, '2011', 0),
(312, 10, '2011', 0),
(313, 8, '2011', 0),
(314, 8, '2011', 0),
(315, 8, '2011', 0),
(316, 8, '2011', 0),
(317, 8, '2011', 0),
(318, 8, '2011', 0),
(319, 8, '2011', 0),
(320, 8, '2011', 0),
(321, 8, '2011', 0),
(322, 8, '2011', 0),
(323, 8, '2011', 0),
(324, 7, '2011', 0),
(325, 7, '2011', 0),
(326, 7, '2011', 0),
(327, 7, '2011', 0),
(328, 7, '2011', 0),
(329, 7, '2011', 0),
(330, 7, '2011', 0),
(331, 7, '2011', 0),
(332, 7, '2011', 0),
(333, 7, '2011', 0),
(334, 7, '2011', 0),
(335, 7, '2011', 0),
(336, 7, '2011', 0),
(337, 7, '2011', 0),
(338, 7, '2011', 0),
(339, 7, '2011', 0),
(340, 7, '2011', 0),
(341, 7, '2011', 0),
(346, 9, '2010', 0);

-- --------------------------------------------------------

--
-- Structure de la table `keyword`
--

CREATE TABLE `keyword` (
  `idKeyword` int(11) NOT NULL,
  `libelleKeywords` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `missions`
--

CREATE TABLE `missions` (
  `id_mission` int(5) NOT NULL,
  `id_enseignant` int(11) NOT NULL,
  `date_debut` text COLLATE latin1_general_ci NOT NULL,
  `date_fin` text COLLATE latin1_general_ci NOT NULL,
  `objet_mission` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `mission` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `missions`
--

INSERT INTO `missions` (`id_mission`, `id_enseignant`, `date_debut`, `date_fin`, `objet_mission`, `mission`) VALUES
(883, 40, '11/21/2012', '11/27/2012', 'Projet', 'Gestion des encadrements');

-- --------------------------------------------------------

--
-- Structure de la table `missions2etudiants`
--

CREATE TABLE `missions2etudiants` (
  `id_mission` int(5) NOT NULL,
  `id_etu` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `missions2etudiants`
--

INSERT INTO `missions2etudiants` (`id_mission`, `id_etu`) VALUES
(883, 111);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `idModule` int(11) NOT NULL,
  `nomModule` varchar(100) DEFAULT NULL,
  `route` varchar(100) DEFAULT NULL,
  `etat` varchar(20) DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  `hasCSS` tinyint(1) DEFAULT NULL,
  `hasJS` tinyint(1) DEFAULT NULL,
  `needJquery` tinyint(1) DEFAULT NULL,
  `hasMenu` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `module`
--

INSERT INTO `module` (`idModule`, `nomModule`, `route`, `etat`, `ordre`, `hasCSS`, `hasJS`, `needJquery`, `hasMenu`) VALUES
(1, 'Administration', 'administration', '1', 5, 1, 1, 1, 1),
(2, 'Evaluation de stage', 'EvaluationStage', '1', 2, 1, 0, 0, 0),
(6, 'Paramètres', 'options', '1', 6, 0, 0, 0, 0),
(8, 'Supplements au diplome', 'Supplement_Diplome', '1', 3, 1, 0, 0, 0),
(11, 'Gestion des propositions de stage', 'stage_fiches', '1', 1, 1, 1, 1, 1),
(12, 'Stockage et consultation des travaux', 'StockageTravaux', '1', 4, 1, 1, 1, 1),
(13, 'Gestion des syllabus', 'syllabus', '1', 0, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE `page` (
  `idPage` int(11) NOT NULL,
  `page` varchar(100) DEFAULT NULL,
  `ordrePage` varchar(10) DEFAULT NULL,
  `routePage` varchar(100) DEFAULT NULL,
  `idModule` int(11) NOT NULL,
  `subMenu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`idPage`, `page`, `ordrePage`, `routePage`, `idModule`, `subMenu`) VALUES
(1, 'Arrangement des applications', '2', 'integration/order.php', 1, 5),
(2, 'Ajout d''une application', '0', 'integration/addapp.php', 1, 5),
(3, 'Modification d''une application', '1', 'integration/modapps.php', 1, 5),
(4, 'Administration', '0', 'index.php', 1, 0),
(5, 'Intégration', '1', 'integration', 1, 0),
(6, 'Ajouter un rôle', '1', 'addRole/addRole.php', 1, 4),
(7, 'Ajouter un utilisateur', '0', 'addUser/addTypeUser.php', 1, 4),
(8, 'Administration des rôles', '5', 'adminRole/listRole.php', 1, 4),
(9, 'Administration des utilisateurs', '4', 'adminUser/listUser.php', 1, 4),
(10, 'Administration des accès aux modules', '6', 'adminAcces/listAcces.php', 1, 4),
(11, 'Ajouter un accès aux modules', '2', 'addAcces/addAcces.php', 1, 4),
(12, 'Administration des accès aux pages', '7', 'adminAccesPage/chooseModule.php', 1, 4),
(13, 'Ajouter un accès aux pages', '3', 'addAccesPage/addAccesPage.php', 1, 4),
(25, 'Changer mon mot de passe', '0', 'changeMyPass.php', 6, 0),
(31, ' Edition Supplément au Diplome ', '0', 'edition_supp_diplome.php', 8, 0),
(32, ' Affichage des enseignants ', '1', 'affichage.php?enseignant=1', 8, 0),
(33, ' Affichage des différentes formations ', '2', 'affichage.php?formation=1', 8, 0),
(39, 'Administration des inscriptions', NULL, './adminFormation/listStudent.php', 1, 4),
(40, 'Liste des étudiants par formation', NULL, './adminFormation/listFormation.php', 1, 4),
(41, 'Liste des étudiants par UE', NULL, './adminFormation/chooseFormation.php', 1, 4),
(45, 'Votre fiche', '0', 'fiche-etudiant.php', 11, 0),
(46, 'Créer les fiches pour vos étudiants', '1', 'activer-fiches.php', 11, 0),
(47, 'Rechercher une fiche', '2', 'liste-fiches.php', 11, 0),
(48, 'Recherche de documents', '0', 'Page_recherche.php', 12, 0),
(49, 'Archivage des travaux', '1', 'archivage.php', 12, 0),
(50, 'Nos diplômes', '0', './public_diplome.php', 13, 0),
(51, 'Gestion des diplômes', '1', './gestion-diplome.php', 13, 0),
(52, 'Gestion des syllabus', '2', './gestion-syllabus.php', 13, 0),
(53, 'Mes enseignements', '3', './mes-enseignements.php', 13, 0),
(54, 'Téléchargement des cours', '0', './public_liste_fichier.php', 13, 50);

-- --------------------------------------------------------

--
-- Structure de la table `participer_ens`
--

CREATE TABLE `participer_ens` (
  `NumEnseignant` int(11) NOT NULL,
  `NumSoutenance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `realisergroupe`
--

CREATE TABLE `realisergroupe` (
  `NumEtudiant` int(11) NOT NULL,
  `numTravauxGroupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reunions`
--

CREATE TABLE `reunions` (
  `id_reunion` int(5) NOT NULL,
  `id_mission` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL,
  `date_reunion` date NOT NULL,
  `heure_debut` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `heure_fin` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `objet_reunion` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `lieu` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `reunion` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `reunions`
--

INSERT INTO `reunions` (`id_reunion`, `id_mission`, `id_enseignant`, `date_reunion`, `heure_debut`, `heure_fin`, `objet_reunion`, `lieu`, `reunion`) VALUES
(4, 883, 1, '2016-12-13', '10h00', '11h45', 'Gestion des encadrements', '', 'modifiÃ©'),
(9, 883, 1, '0000-00-00', '18h45', '20h', 'Projet', '', 'dddff'),
(10, 883, 1, '0000-00-00', '18h45', '20h', 'Projet', '', 'hahahahaha'),
(11, 883, 1, '2012-12-25', '18h45', '22/11/', 'Projet', '', 'dffffddfdffdfdfdfdf'),
(12, 883, 1, '2012-12-31', '18h45', '20h', 'Projet', '', 'babdoy'),
(13, 883, 40, '2016-11-18', '7h00', '7h00', '44', '', '4'),
(14, 883, 40, '2016-11-18', '7h00', '7h00', '44', '', '4'),
(15, 883, 40, '2016-11-18', '7h00', '7h00', '5', '', '5'),
(16, 883, 40, '2016-12-24', '10h00', '10h30', 'Test', '', 'description test'),
(17, 883, 40, '2016-12-01', '7h00', '7h00', 'zde', '', 'zdez');

-- --------------------------------------------------------

--
-- Structure de la table `reunions2etudiants`
--

CREATE TABLE `reunions2etudiants` (
  `id_reunion` int(5) NOT NULL,
  `id_etu` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reunions2etudiants`
--

INSERT INTO `reunions2etudiants` (`id_reunion`, `id_etu`) VALUES
(4, 111),
(13, 111),
(13, 111),
(14, 111),
(15, 111),
(16, 111),
(17, 111);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL,
  `nomRole` varchar(20) DEFAULT NULL,
  `descriptionRole` varchar(100) DEFAULT NULL,
  `etat_role` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`idRole`, `nomRole`, `descriptionRole`, `etat_role`) VALUES
(1, 'Administrateur', 'Administrateur de l''intranet', 1),
(2, 'Responsable pedagogi', 'Responsable pedagogique', 1),
(3, 'Tuteur entreprise', 'Tuteur entreprise', 1),
(4, 'Tuteur pedago', 'Tuteur pedagogique', 1),
(5, 'Etudiant', 'Etudiant', 1);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `idSalle` varchar(6) COLLATE utf8_bin NOT NULL,
  `NumeroSalle` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `idBatiment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `souhaitsuperviser`
--

CREATE TABLE `souhaitsuperviser` (
  `NumEnseignant` int(11) NOT NULL,
  `NumStage` int(11) NOT NULL,
  `ordreSouhaitSuperviser` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `souhaitsuperviser`
--

INSERT INTO `souhaitsuperviser` (`NumEnseignant`, `NumStage`, `ordreSouhaitSuperviser`) VALUES
(30, 346, 3),
(30, 408, 3),
(30, 413, 2),
(30, 417, 1),
(32, 356, 2),
(34, 344, 1),
(34, 351, 2),
(34, 353, 2),
(34, 354, 3),
(34, 355, 2),
(34, 356, 3),
(34, 359, 2),
(34, 360, 1),
(34, 361, 3),
(34, 364, 1),
(34, 366, 1),
(34, 369, 2),
(34, 371, 2),
(34, 372, 2),
(34, 379, 2),
(34, 381, 2),
(34, 382, 3),
(34, 387, 2),
(34, 388, 1),
(34, 391, 2),
(34, 395, 1),
(34, 396, 2),
(34, 397, 1),
(34, 398, 1),
(34, 399, 3),
(34, 401, 1),
(34, 402, 1),
(34, 403, 2),
(34, 405, 3),
(34, 407, 1),
(34, 408, 1),
(34, 410, 3),
(34, 411, 2),
(38, 372, 3),
(40, 344, 2),
(40, 349, 3),
(40, 351, 3),
(40, 353, 1),
(40, 354, 1),
(40, 359, 1),
(40, 360, 2),
(40, 361, 1),
(40, 364, 2),
(40, 366, 2),
(40, 369, 1),
(40, 371, 1),
(40, 373, 3),
(40, 376, 3),
(40, 377, 1),
(40, 379, 3),
(40, 382, 1),
(40, 413, 3),
(40, 418, 3),
(45, 376, 2),
(47, 355, 3),
(47, 357, 2),
(47, 386, 1),
(47, 389, 1),
(47, 394, 2),
(47, 395, 2),
(47, 397, 2),
(47, 399, 2),
(47, 401, 3),
(47, 402, 2),
(47, 403, 1),
(47, 407, 2),
(47, 408, 2),
(47, 410, 2),
(47, 411, 1),
(47, 417, 3),
(55, 344, 3),
(55, 346, 2),
(55, 349, 1),
(55, 351, 1),
(55, 354, 2),
(55, 355, 1),
(55, 357, 3),
(55, 358, 1),
(55, 360, 3),
(55, 369, 3),
(55, 371, 3),
(55, 372, 1),
(55, 373, 1),
(55, 377, 2),
(55, 379, 1),
(55, 381, 1),
(55, 382, 2),
(55, 386, 3),
(55, 387, 1),
(55, 388, 2),
(55, 390, 2),
(55, 391, 1),
(55, 395, 3),
(55, 398, 3),
(55, 403, 3),
(55, 411, 3),
(61, 356, 1),
(65, 364, 3),
(67, 418, 2),
(70, 358, 3),
(70, 390, 1),
(70, 392, 1),
(70, 396, 3),
(71, 361, 2),
(71, 392, 3),
(75, 349, 2),
(80, 346, 1),
(80, 353, 3),
(80, 357, 1),
(80, 358, 2),
(80, 359, 3),
(80, 366, 3),
(80, 376, 1),
(80, 377, 3),
(80, 386, 2),
(80, 387, 3),
(80, 389, 2),
(80, 390, 3),
(80, 392, 2),
(80, 394, 3),
(80, 396, 1),
(80, 397, 3),
(80, 398, 2),
(80, 399, 1),
(80, 401, 2),
(80, 407, 3),
(80, 410, 1),
(81, 381, 3),
(85, 388, 3),
(85, 389, 3),
(85, 391, 3),
(85, 394, 1),
(85, 402, 3),
(85, 405, 1),
(92, 417, 2),
(95, 373, 2),
(342, 405, 2),
(342, 413, 1),
(342, 418, 1);

-- --------------------------------------------------------

--
-- Structure de la table `soutenance`
--

CREATE TABLE `soutenance` (
  `NumSoutenance` int(11) NOT NULL,
  `DateSoutenance` datetime DEFAULT NULL,
  `idSalle` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `NumStage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE `stage` (
  `NumStage` int(11) NOT NULL,
  `IntituleStage` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `MissionStage` text COLLATE utf8_bin,
  `DateDebutStage` date DEFAULT NULL,
  `DateFinStage` date DEFAULT NULL,
  `remunerationStage` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `valideStage` tinyint(1) DEFAULT NULL,
  `motifValideStage` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `DatePropositionStage` date DEFAULT NULL,
  `obsResultatStage` text COLLATE utf8_bin,
  `obsFortFaibleStage` text COLLATE utf8_bin,
  `obsEmbaucheStage` text COLLATE utf8_bin,
  `obsCompStage` text COLLATE utf8_bin,
  `langueStage` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `NumEtudiant` int(11) NOT NULL,
  `idEntreprise` int(11) DEFAULT NULL,
  `IdTuteurEntreprise` int(11) DEFAULT NULL,
  `NumSoutenance` int(11) DEFAULT NULL,
  `NumEnseignant` int(11) DEFAULT NULL,
  `idFormation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `stage`
--

INSERT INTO `stage` (`NumStage`, `IntituleStage`, `MissionStage`, `DateDebutStage`, `DateFinStage`, `remunerationStage`, `valideStage`, `motifValideStage`, `DatePropositionStage`, `obsResultatStage`, `obsFortFaibleStage`, `obsEmbaucheStage`, `obsCompStage`, `langueStage`, `NumEtudiant`, `idEntreprise`, `IdTuteurEntreprise`, `NumSoutenance`, `NumEnseignant`, `idFormation`) VALUES
(266, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 165, NULL, NULL, NULL, NULL, 4),
(267, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 166, NULL, NULL, NULL, NULL, 4),
(268, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 167, NULL, NULL, NULL, NULL, 4),
(269, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 168, NULL, NULL, NULL, NULL, 4),
(270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 169, NULL, NULL, NULL, NULL, 4),
(271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170, NULL, NULL, NULL, NULL, 4),
(272, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 171, NULL, NULL, NULL, NULL, 4),
(273, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 172, NULL, NULL, NULL, NULL, 4),
(274, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 173, NULL, NULL, NULL, NULL, 4),
(275, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 174, NULL, NULL, NULL, NULL, 4),
(276, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 175, NULL, NULL, NULL, NULL, 4),
(277, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 176, NULL, NULL, NULL, NULL, 4),
(278, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 177, NULL, NULL, NULL, NULL, 4),
(279, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 178, NULL, NULL, NULL, NULL, 4),
(280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 179, NULL, NULL, NULL, NULL, 4),
(281, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 180, NULL, NULL, NULL, NULL, 4),
(282, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 181, NULL, NULL, NULL, NULL, 4),
(283, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 182, NULL, NULL, NULL, NULL, 4),
(284, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 183, NULL, NULL, NULL, NULL, 4),
(285, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 184, NULL, NULL, NULL, NULL, 4),
(286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 185, NULL, NULL, NULL, NULL, 4),
(287, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 186, NULL, NULL, NULL, NULL, 4),
(288, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 187, NULL, NULL, NULL, NULL, 4),
(289, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 188, NULL, NULL, NULL, NULL, 4),
(290, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 189, NULL, NULL, NULL, NULL, 4),
(291, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 190, NULL, NULL, NULL, NULL, 4),
(292, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 191, NULL, NULL, NULL, NULL, 4),
(293, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 192, NULL, NULL, NULL, NULL, 4),
(294, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 193, NULL, NULL, NULL, NULL, 4),
(295, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 194, NULL, NULL, NULL, NULL, 4),
(296, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 195, NULL, NULL, NULL, NULL, 4),
(297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 196, NULL, NULL, NULL, NULL, 4),
(298, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 197, NULL, NULL, NULL, NULL, 4),
(299, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 198, NULL, NULL, NULL, NULL, 4),
(300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 199, NULL, NULL, NULL, NULL, 4),
(301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, NULL, NULL, NULL, 4),
(302, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, NULL, NULL, NULL, NULL, 4),
(303, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 202, NULL, NULL, NULL, NULL, 4),
(304, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 203, NULL, NULL, NULL, NULL, 4),
(305, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 204, NULL, NULL, NULL, NULL, 4),
(306, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 205, NULL, NULL, NULL, NULL, 4),
(307, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 206, NULL, NULL, NULL, NULL, 4),
(308, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 207, NULL, NULL, NULL, NULL, 4),
(309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 208, NULL, NULL, NULL, NULL, 4),
(310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 209, NULL, NULL, NULL, NULL, 4),
(311, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 210, NULL, NULL, NULL, NULL, 4),
(312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 211, NULL, NULL, NULL, NULL, 4),
(313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 212, NULL, NULL, NULL, NULL, 4),
(314, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 213, NULL, NULL, NULL, NULL, 4),
(315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 214, NULL, NULL, NULL, NULL, 4),
(316, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 215, NULL, NULL, NULL, NULL, 4),
(317, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 216, NULL, NULL, NULL, NULL, 4),
(318, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 217, NULL, NULL, NULL, NULL, 4),
(319, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 218, NULL, NULL, NULL, NULL, 4),
(320, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 219, NULL, NULL, NULL, NULL, 4),
(321, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 220, NULL, NULL, NULL, NULL, 4),
(322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 221, NULL, NULL, NULL, NULL, 4),
(323, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 222, NULL, NULL, NULL, NULL, 4),
(324, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 223, NULL, NULL, NULL, NULL, 4),
(325, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 224, NULL, NULL, NULL, NULL, 4),
(326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 225, NULL, NULL, NULL, NULL, 4),
(327, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 226, NULL, NULL, NULL, NULL, 4),
(328, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 227, NULL, NULL, NULL, NULL, 4),
(329, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 228, NULL, NULL, NULL, NULL, 4),
(330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 229, NULL, NULL, NULL, NULL, 4),
(331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 230, NULL, NULL, NULL, NULL, 4),
(332, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 231, NULL, NULL, NULL, NULL, 4),
(333, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 232, NULL, NULL, NULL, NULL, 4),
(334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 233, NULL, NULL, NULL, NULL, 4),
(335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 234, NULL, NULL, NULL, NULL, 4),
(336, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 235, NULL, NULL, NULL, NULL, 4),
(337, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 236, NULL, NULL, NULL, NULL, 4),
(338, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 237, NULL, NULL, NULL, NULL, 4),
(339, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 238, NULL, NULL, NULL, NULL, 4),
(340, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 239, NULL, NULL, NULL, NULL, 4),
(341, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 240, NULL, NULL, NULL, NULL, 4),
(342, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 241, NULL, NULL, NULL, NULL, 4),
(343, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 242, NULL, NULL, NULL, NULL, 4),
(344, 'Maintenance SAP BW + Migration WAD vers COGNOS', 'Projet : Maintenance SAP BW +\r\nMigration WAD vers COGNOS\r\nDescription de mission : Stagiaire \r\n\r\n\r\nRESUME DE LA MISSION / PRINCIPAUX OBJECTIFS\r\nContexte\r\n\r\nMaintenance SAP BW :\r\nbioMérieux a mis en place une plateforme SAP BW pour faire le reporting au dessus de son système SAP ECC. Cette plateforme est utilisée par des utilisateurs réparties dans le monde entier et implique donc un travail régulièrement en anglais dans un contexte international. \r\n\r\nDe plus, la mise en place étant assez récente (environ 3 ans) les demandes d’évolutions ou de nouveautés sont assez fréquentes et importantes. \r\n\r\nProjet de migration WAD vers COGNOS :\r\nbioMérieux souhaite n’avoir qu’un seul outil de reporting : COGNOS. Aujourd’hui deux outils de reporting sont disponibles : COGNOS pour tout le reporting non SAP et le portail WAD (Web Application Designer) de SAP BW pour les données SAP. \r\n\r\nUn projet de migration des rapports du WAD vers COGNOS a donc été lancé début 2012 (après des tests de connection avec COGNOS 8 puis 10 en 2010 et 2011). Un environnement COGNOS 10.1.1 est donc aujourd’hui plugué sur SAP BW et le mode DQM de COGNOS est utilisé pour lire les requêtes BW. \r\n\r\nCe projet est découpé en deux partie, une partie dite « pilote » jusqu’à mi Juillet et une partie dite de « déploiement » jusqu’à fin 2012. \r\n\r\nLa partie pilote a pour but de tester sur un périmètre restreint la migration des rapports, de capitaliser pour rédiger des bonnes pratiques et de préparer la migration des autres rapports (non dans le périmètre du pilote) : équipe à mettre en place et planning. Le pilote doit aussi mettre en place les supports de formation et l’organisation adéquate en interne du département informatique (comment gérer les nouvelles demandes sachant que deux outils et donc deux équipes sont impliquées). \r\n\r\nLa partie déploiement consistera à migrer les rapports non pris en charge par le pilote. \r\n\r\nLa langue du projet est l’anglais.\r\n\r\n\r\nObjectif de la mission\r\n\r\nLe stagiaire recherché aura pour principales missions de recueillir les besoins des utilisateurs et de créer ou faire évoluer leur reporting en conséquence.\r\n\r\nPour cela le stagiaire sera en charge de :\r\n•	Participer à la promotion du reporting disponible, auprès d’utilisateurs potentiels à convaincre,\r\n•	Travailler sur le projet de migration des reports de l’outil SAP BW vers l’outil IBM COGNOS :\r\no	Recréer et améliorer les reports de l’outil SAP BW dans l’outil IBM COGNOS\r\no	Former les utilisateurs à COGNOS\r\n\r\nLa durée de la mission sera adaptée à la disponibilité de la ressource.  \r\n\r\n\r\nACTIVITES\r\nActivité 1 (Maintien en condition opérationnelle de la plateforme)\r\n\r\nA.	Support à l’équipe (située en Inde) faisant le suivi des chargements\r\nB.	Suivi des performances et mise en place des actions d’améliorations \r\nC.	Documentation des processus mis en place ou à mettre en place pour le maintien en condition opérationnelle\r\n\r\n\r\nActivité 2 (Support aux utilisateurs)\r\n\r\nD.	Accompagnement des utilisateurs dans leur expression de besoin\r\nE.	Formation des utilisateurs\r\nF.	Support aux tests utilisateurs\r\nG.	Réponses aux questions des utilisateurs\r\nActivité 3 (Mise en place des évolutions/corrections)\r\n\r\nH.	Travail en collaboration avec les experts métiers SAP pour définir les solutions\r\nI.	Développement des solutions\r\nJ.	Documentation des solutions\r\nK.	Mise en production des développements\r\n\r\n\r\nActivité 4 (Participation au projet de migration WAD vers COGNOS)\r\n\r\nL.	Création des reports dans COGNOS\r\nM.	Formation des utilisateurs\r\nN.	Support BW au projet\r\n \r\n\r\nCOMPETENCES DEMANDEES\r\nCompétences professionnelles\r\n\r\nCompétences obligatoires\r\n	Capacité à former et à expliquer en Anglais et Français\r\n	Capacité à rendre compte\r\n	Travail en équipe et collaboratif \r\n	Sens du service\r\n\r\nCompétences optionnelles (seraient un +)\r\n	Connaissance des contraintes pharmaceutiques\r\n	Capacité à apporter des solutions \r\n\r\nCompétences techniques\r\n\r\nCompétences obligatoires\r\n	N/A\r\n\r\n\r\nCompétences optionnelles (seraient un +)\r\n	Connaissance de SAP BW\r\n	Connaissance de COGNOS\r\n\r\nNiveau linguistique\r\n\r\n	Français : obligatoire\r\n	Anglais : obligatoire (lu, écrit et parlé)\r\nELEMENTS DE REPONSE\r\n	Interlocuteur IS : Arnaud Cellier-Théron\r\n	Interlocuteur Achats : Sébastien Launay\r\n	Format de la réponse : CV(s) des candidats proposés, avec leur disponibilité (date de démarrage et charge) et leur TJ \r\n	Date de la réponse : réponse attendue pour le 20/04/2012\r\n	Envoi de la réponse : par mail \r\n	Date de la présentation des candidats : suivant disponibilités des profils\r\n	Date de démarrage optimal : démarrage dès que possible\r\n	Lieu de la mission : Craponne \r\n	Durée de la mission : durée du stage\r\n\r\n', '2012-05-01', '2012-09-30', '1400', 1, '', '2012-03-28', NULL, NULL, NULL, NULL, NULL, 97, 30, 30, NULL, 30, 5),
(345, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL, NULL, NULL, 5),
(346, 'Stage / Développeur BI, Intégration de données ou CRM', 'Après un cursus d’intégration à l’entreprise et une formation à des outils décisionnels (intégration de données et/ou restitution), le stagiaire participera à la mise en œuvre d’un SID ou à une des briques le constituant (intégration de données, qualité de données, gestion de référentiel commun, réalisation de tableau de bord, couche de restitution pour reporting ad’hoc,…).\r\nDurant le stage, l’entreprise fera en sorte que le stagiaire puisse avoir une vision globale de l’application et du projet auquel il participe.\r\n', '2012-05-02', '2012-09-30', '1200', 1, '', '2012-03-29', NULL, NULL, NULL, NULL, NULL, 99, 31, 31, NULL, 30, 5),
(347, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, NULL, 5),
(348, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, NULL, 5),
(349, 'Intégrer une équipe de maintenance SAP BI', 'OBJECTIF : Découvrir SAP BI, monter en compétence sur cette technologie et les technologies connexes (SAP BO, Xcelsius..) S’approprier les processus de maintenance au sein d’une équipe de Tierce Maintenance Applicative (TMA), chargée du maintien en condition opérationnelle des applications SAP BI d’un groupe international du secteur pharmaceutique\r\n\r\nMISSIONS :\r\n• Prendre connaissance du périmètre applicatif et technique\r\n• Participer à l’élaboration et la mise en place des solutions techniques en termes de réalisation, tests et rédaction de documents de capitalisation Vous êtes encadré par un Expert technique et un Chef de projet pour intégrer une équipe de 5 à 10 personnes.', '2012-04-23', '2012-09-21', '1000', 1, '', '2012-02-08', '', '', '', '', NULL, 102, 6, 6, NULL, 30, 5),
(350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, NULL, 5),
(351, 'Développement d’un projet Qlikview pour un grand laboratoire pharmaceutique.', 'Dans le cadre d’un projet décisionnel, j''intégrai une équipe de Business & Decision pour le développement d’une application Qlikview. Après avoir participé à la phase spécification avec un consultant expérimenté, je serai en charge du développement d’un module du projet.\r\n\r\nAinsi, je participerai à l’ensemble des étapes et chantiers majeurs d’un projet décisionnel, en intervenant de la phase de spécification jusqu’à la mise en production de l’application.\r\n\r\nJe participerai également aux travaux d’intégration de l’application dans le système d''information global et travaillerez avec l’équipe d’exploitation pour la mise en production (rédaction de la documentation et de la formation de l’application).', '2012-05-02', '2012-09-28', '1000', 1, '', '2012-03-07', NULL, NULL, NULL, NULL, NULL, 104, 18, 18, NULL, 30, 5),
(352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL, NULL, NULL, 5),
(353, 'Consultants décisionnels stagiaires', 'Le sujet du stage sera :\r\n-       Mise en place de procédures ETL (extract, transform, load)\r\n-       Mise en place et paramétrage de la suite logicielle IBM Cognos BI\r\n-       Mise en place et paramétrage de la suite logicielle IBM Cognos TM1\r\n-       Recueil des besoins et contribution aux spécifications fonctionnelles et techniques\r\n-       Assistance technique au cours du déploiement des outils Cognos\r\n-       Participation aux phases de qualification et de tests\r\n\r\n\r\n', '2012-03-30', '2012-09-30', '1500', 1, '', '2012-03-02', NULL, NULL, NULL, NULL, NULL, 106, 14, 14, NULL, 30, 5),
(354, 'CMR/Décisionnel', 'Définition et mise en place d’un reporting décisionnel mensuel de suivi de l’activité du site simul-retraite.fr (analyse des connexions, créations de compte, typologies des prospects, …)\r\nIntégré(e) à l’équipe de développement, sous la responsabilité du responsable du site : \r\n-	Vous étudiez les besoins, concevez et développez les solutions d’alimentations et de connexions avec les différents outils existants ;\r\n-	Vous procédez aux phases de tests techniques et de qualifications en accord avec les exigences internes ;\r\n-	Vous êtes chargé(e) de la mise en production des solutions livrées et de la maintenance évolutive.', '2012-05-02', '2012-09-30', '1365', 2, NULL, '2012-04-26', NULL, NULL, NULL, NULL, NULL, 107, 46, 46, NULL, NULL, 5),
(355, 'Stage Business Intelligence', 'Vous participerez activement à la réalisation de nos projets BI au travers des domaines suivants :\r\n§  Analyse et programme d''un problème informatique\r\n§  La modélisation de bases de données (étoile / flocon / galaxie) ;\r\n§  La réalisation des chaînes d’alimentation ;\r\n§  La conception et réalisation des restitutions BI (reporting opérationnel et décisionnel) ;\r\n§  La recette et le déploiement des solutions réalisées ;\r\n§  La maintenance corrective et évolutive de l’existant du client', '2012-05-02', '2012-09-30', '1000', 2, NULL, '2012-03-12', NULL, NULL, NULL, NULL, NULL, 108, 21, 21, NULL, NULL, 5),
(356, 'Informatique Décisionnelle', 'Au sein groupe Clasquin dans le département Système d’information, vous participez aux opérations courantes gérées par l’équipe Business Intelligence (évolution/création de rapports décisionnels, support utilisateurs, Closing,…) ainsi\r\nqu’à de nouveaux projets (Etude comparative entres Cube multidimensionnels & Table d’agrégat, Migration de rapports existant dans l’environnement IBM Cognos….) et des projets de veille technologique (Etude format HTML5 avec\r\nIBM Cognos).\r\n\r\nAttiré(e) par les domaines techniques autour de l’informatique décisionnelle votre mission se découpera selon les phases suivantes :\r\n\r\n- Appréhender les problématiques métiers du groupe Clasquin en termes de besoin en décisionnel.\r\n- Participer aux missions récurrentes de l’équipe BI (suivant la priorité et l’urgence des demandes).\r\n- Travailler sur des nouveaux projets et veille technologique.', '2012-05-02', '2012-09-28', '600', 2, NULL, '2012-04-01', NULL, NULL, NULL, NULL, NULL, 109, 33, 33, NULL, NULL, 5),
(357, 'Projet BI', 'Intégration sur un projet dans un centre de compétences BI, avec formation sur les outils utilisés : Talend, Datastage, SAP BO XI3, Qlikview, Microsoft SSIS / SSRS...', '2012-05-02', '2012-09-24', '700', 2, NULL, '2012-03-02', NULL, NULL, NULL, NULL, NULL, 110, 13, 13, NULL, NULL, 5),
(358, 'Développeur BI, Intégration de données ou CRM', 'Après un cursus d’intégration à l’entreprise et une formation à des outils décisionnels (intégration de données et/ou restitution), le stagiaire participera à la mise en œuvre d’un SID ou à une des briques le constituant (intégration de données, qualité de données, gestion de référentiel commun, réalisation de tableau de bord, couche de restitution pour reporting ad’hoc,…).\r\nDurant le stage, l’entreprise fera en sorte que le stagiaire puisse avoir une vision globale de l’application et du projet auquel il participe.\r\n', '2012-05-02', '2012-09-30', '1200', 1, '', '2012-03-20', NULL, NULL, NULL, NULL, NULL, 111, 24, 24, NULL, 30, 5),
(359, 'Crédit Agricole NICE', 'Les objectifs seront de :\r\n•        Comprendre comment est pilotée une banque de détail,\r\n•        Maîtriser les outils décisionnels Datastage, Terradata ou  Microstrategy sur lesquels il y aura une formation.\r\nJe rejoindrai une équipe de 20 personnes et serai entourée d’experts techniques et consultants BI.\r\nMISSIONS :\r\n•        Participer à la définition globale de l’architecture logique et technique,\r\n•        Rédiger les spécifications techniques des briques « alimentation » et « restitution »,\r\n•        Développer ces solutions.\r\nJe serai encadrée par un expert technique ou un consultant BI du projet.', '2012-05-02', '2012-09-30', '1000', 1, '', '2012-03-01', NULL, NULL, NULL, NULL, NULL, 112, 12, 12, NULL, 30, 5),
(360, 'maintenance et évolution d’un système décisionnel Oracle/Cognos complet (data warehousing, modélisation, rapports et cubes)', 'OBJECTIF : Prendre en charge des missions de développement\r\ndans une Tierce Maintenance Applicative (TMA), chargée de la\r\ngestion de l’application BI (Business Intelligence) d’un grand\r\ndistributeur de pneu européen.\r\n\r\nMISSIONS :\r\n• Développer les évolutions sur les applicatifs de la TMA\r\n• Analyser et traiter les incidents\r\n• Rédiger les spécifications techniques simples\r\n• Rédiger les cahiers de tests unitaires\r\n• Apprendre et respecter la méthodologie / cycle Projet\r\n• Apprendre le domaine fonctionnel du métier Client', '2012-04-16', '2012-08-31', '1000', 2, NULL, '2012-04-13', NULL, NULL, NULL, NULL, NULL, 113, 40, 40, NULL, NULL, 5),
(361, 'Intégration dans un centre de service BI.', 'Intégration dans une équipe ayant en charge les développements, la qualification et l''exploitation du flux d''alimentation d''un système décisionnel. \r\nParticipation aux phases de modélisation et de spécification avec le client. ', '2012-05-02', '2012-09-16', '1070', 1, '', '2012-02-15', NULL, NULL, NULL, NULL, NULL, 114, 10, 10, NULL, 30, 5),
(362, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL, NULL, NULL, 5),
(363, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL, NULL, NULL, 5),
(364, 'Mise en place de tableau de bord Microstratégy pour un leader de travail temporaire', '- Modélisation du datawarehouse et du datamart,\r\n\r\n- La mise en place des flux d’alimentation avec ETL Oracle Data Integrator : construction des mappings, des règles de gestion, des agrégats…\r\n\r\n- Modélisation dans l’outil de restitution Microstrategy,\r\n\r\n- Construction des tableaux de bords commerciaux,\r\n\r\n- Tests unitaires et d’intégration des développements réalisés,\r\n\r\n- Validation de la solution avec le client,\r\n\r\n- Accompagnement à la mise en production,\r\n\r\n- Transfert de compétence à la Tierce Maintenance Applicative.', '2012-05-02', '2012-09-30', '1000', 1, '', '2012-02-09', NULL, NULL, NULL, NULL, NULL, 117, 7, 7, NULL, 30, 5),
(365, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL, NULL, NULL, 5),
(366, 'Solution Business Intelligence Business Object / PHP', 'Le stage se déroulera en 3 étapes \r\n\r\n1/Etude de la solution actuelle Business Object : \r\n•	Proposer et alimenter de nouvelles tables d’agrégats\r\n•	Simplifier les univers BO avec ces nouvelles tables\r\n\r\n2/Ensuite étudier le remplacement des rapport BO complexe en générant directement des fichiers excel en PHP :\r\n•	Réutiliser les agrégats précédemment construit\r\n•	Réutiliser des objets PHP (tableaux, graphes) pérenne à ce jour car utilisé dans l’ihm temps réel\r\n\r\n3/ Travailler en binôme sur une matrice de prescription globale en fonction des cas d’usage sur les trois outils\r\n•	Business Object\r\n•	BI Microsoft (dont l’étude sera réaliser en parallèle par un autre stagiaire)\r\n•	Ecriture de rapport en développement PHP\r\n\r\nLe stagiaire sera intégré au sein d’une équipe de quatre développeurs qui travaillent depuis 4 ans sur le projet.', '2012-04-10', '2012-09-28', '800', 1, '', '2012-03-08', NULL, NULL, NULL, NULL, NULL, 119, 20, 20, NULL, 30, 5),
(367, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, NULL, 5),
(368, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL, NULL, NULL, 5),
(369, 'non definie', 'non définie', '2012-04-16', '2012-09-30', '700.00', 2, NULL, '2012-02-13', NULL, NULL, NULL, NULL, NULL, 122, 9, 9, NULL, NULL, 5),
(370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL, NULL, NULL, 5),
(371, 'Déploiement d’une solution BI', 'Mission:\r\n - participer au déploiement d’une solution BI, développer les applications décisionnelles pour le Front Office\r\n - concevoir et réaliser les applications Reporting sur la solution MicroStrategy\r\n - prendre part à la phase de spécification et de collecte du besoin auprès des utilisateurs\r\n - maintenir et faire évoluer le Reporting existant\r\n - rédiger des documentations, guide d’utilisateurs \r\n - participer aux phases de tests et de validation', '2012-05-15', '2012-09-30', '500', 1, '', '2012-03-24', NULL, NULL, NULL, NULL, NULL, 124, 28, 28, NULL, 30, 5),
(372, 'Stage en BI', 'Participez à la mise en place du système de pilotage du Crédit Agricole !', '2012-05-02', '2012-09-30', '1000', 2, NULL, '2012-02-07', NULL, NULL, NULL, NULL, NULL, 125, 5, 5, NULL, NULL, 5),
(373, 'mise en place d''un outil de pilotage chez un client de la société', 'Un nouveau client a fait appel à la société VPS DATA (société pour laquelle je travaille) pour réaliser et alimenter mensuellement un outil d’aide à la décision leur permettant de piloter leur activité grâce à des tableaux de bords.\r\n \r\nLa société VPS DATA est une société spécialisée dans le domaine de l''informatique de pointe reposant sur 3 compétences :\r\n-1- l''hébergement de données confidentielles (données de facturation, données de production de médicaments et données médicales)\r\n-2- La création d''outils spécifiques à partir d''applications sur Extranet ou Intranet, sur tablette et sous format papier (PDF)\r\n-3- La mise en œuvre de plan marketing complexe à partir de modèles statistiques et datamining.\r\n \r\nPour ce faire :\r\n- le client réalisera mensuellement une extraction de ses données (clients, articles, ligne de facture) suivant un format défini pendant la phase d’initialisation. Ses données seront hébergées par nos soins dans une BDD et cette BDD sera enrichie mensuellement des données clients et articles (périmètre complet) et lignes de factures (du mois concerné par la transmission)\r\n     o Travail en collaboration avec le dirigeant (technico-commercial) sur :\r\n          § conception et réalisation de l’alimentation d’un entrepôt de données + mise en place de procédures automatisées vérifiant la cohérence globale des données de l’entrepôt. (SQL Serveur)\r\n          § implémentation des processus de transformation et de chargement des données au sein d’une BDD Mysql sur laquelle l’outil web pointera. (SPSS + Mysql)\r\n\r\n-  A partir de ces données le client pourra consulter sur internet des tableaux de bord qui lui permettront de piloter son activité.\r\n     o Travail sous la responsabilité d’un chef de projet développeur web\r\n          § Conception et réalisation de l’application décisionnelle.\r\n \r\nInformations complémentaires de la société : aucune donnée réelle ainsi que le nom du client ne devront figurer sur le mémoire.', '2012-05-07', '2012-09-30', '2300.00', 1, '', '2012-03-21', NULL, NULL, NULL, NULL, NULL, 126, 26, 26, NULL, 30, 5),
(374, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 127, NULL, NULL, NULL, NULL, 5),
(375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 128, NULL, NULL, NULL, NULL, 5),
(376, 'chargé d''études pilotage', 'De la création des indicateurs à leurs mise en place', '2012-05-02', '2012-10-31', '499.8', 1, '', '2012-04-20', NULL, NULL, NULL, NULL, NULL, 129, 42, 42, NULL, 30, 5),
(377, 'Etude et proposition d’une solution d’aide à la décision pour un centre médical de rééducation ', 'Le Val Rosay Etablissement privé à but non lucratif participant au Service Public Hospitalier  est spécialisé dans la prise en charge des patients relevant d’une pathologie orthopédique ou traumatologique, cardiologique et neurologique. Il accueille les patients après une hospitalisation dans le but d’une rééducation.   \r\n\r\nLe centre  s’est doté de 2 logiciels métiers différents :\r\n-	un logiciel gérant l’administratif des patients\r\n-	un logiciel gérant les soins médicaux (dossier patient, prescriptions, diagnostics, le PMSI,…)\r\nIl existe une interface entre ces 2 logiciels.\r\n\r\n\r\nL’un des axes stratégiques consiste à consolider les données de l’ensemble pour concevoir un système décisionnel et ainsi permettre le pilotage de l’activité par la mise en place d’indicateurs automatisés grâce à un outil d’aide à la décision.\r\n\r\n\r\nL’étude proposée se décomposera en 3 phases :\r\n1-	la reprise d’indicateurs existants et le choix d’indicateurs pertinents et une analyse approfondie des besoins et des problématiques rencontrés.\r\n2-	l’intégration des indicateurs dans une solution décisionnelle\r\n3-	analyse et restitution de l’information\r\n\r\nLes étapes de modélisation et d''alimentation concernent les phases 1 et 2.\r\n\r\nA partir de ces données, les gestionnaires de l’établissement pourront consulter les tableaux de bord qui lui permettront de piloter son activité.  \r\n\r\nL’analyse de l’existant étudiera  l’utilisation des outils les plus pertinents.\r\n\r\nLes experts du domaine dans l’entreprise: les médecins, les gestionnaires de l’établissement,…\r\n\r\n\r\n\r\nLieu : Le Val Rosay à St Didier au Mt d’or\r\n\r\n', '2012-05-14', '2012-08-31', '2400', 1, '', '2012-04-06', NULL, NULL, NULL, NULL, NULL, 130, 36, 36, NULL, 40, 5),
(378, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 131, NULL, NULL, NULL, NULL, 5),
(379, 'Infocentre STATS', 'En mission au conseil régional Rhône-Alpes.\r\n\r\nRéalisation d’un projet décisionnel dans son ensemble :\r\n-	recueil de besoin utilisateur (suivi de réunion, …)\r\n-	écriture de spécifications fonctionnelle et technique\r\n-	réalisation du modèle de données\r\n-	alimentation du datawarehouse ainsi que d’un datamart (l’infocentre STATS) à partir de l’ETL ODI\r\n-	développement d’un univers BO qui pointera sur le datamart\r\n-	réalisation de quelques requêtes BO\r\n\r\nEnvironnement fonctionnel : données démographique de la région Rhône-Alpes (données INSEE)\r\n', '2012-05-01', '2012-08-31', '1750', 1, '', '2012-03-06', NULL, NULL, NULL, NULL, NULL, 132, 17, 17, NULL, 30, 5),
(380, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 133, NULL, NULL, NULL, NULL, 5),
(381, ' Stage Développeur Projet B.I', 'Le Centre de services BI Lyon est en charge de réaliser des projets externalisés au forfait pour des clients de KEYRUS..\r\nCes clients ont confié à KEYRUS la réalisation d’applications décisionnelles.\r\nC’est dans ce cadre que nous recherchons un(e) stagiaire d’université ou d’école d’ingénieur à dominante ou option informatique. Intégré dans une équipe mixte fonctionnelle et technique basée à Limonest et sous la responsabilité d’un Chef de projet, il ou elle aura en charge les missions suivantes :\r\n\r\n	Partie fonctionnelle :\r\n	Conception et réalisation de l’alimentation d’un entrepôt ou d’un magasin de données.\r\n	Rédaction et mise à jour de la documentation projet\r\n\r\n	Développement du projet :\r\n	Implémentation des processus d’extraction, de transformation et de chargement de données au sein d’un outil\r\n	Mise en place de procédures automatisées vérifiant la cohérence globale des données de l’entrepôt\r\n	Développement des rapports au moyen d’outils de restitution\r\n\r\n	Connaissances techniques :\r\n	Langages : SQL, Shell unix, JAVA\r\n	SGBD : Access, DB2, Informix, Oracle\r\n	Modélisation : Relationnelle / multidimensionnelle\r\n	Outils : Restitution (Business Objects), ETL (Genio),  Modélisation (Power AMC)\r\n', '2012-05-01', '2012-09-30', '700', 2, NULL, '2012-02-13', NULL, NULL, NULL, NULL, NULL, 134, 8, 8, NULL, NULL, 5),
(382, 'Mise en oeuvre d''un outil de consolidation des données du SIH', 'Dans le cadre de l''étude nationale des coûts à méthodologie commune (ENCC), mettre en oeuvre un outil de consolidation des données du SIH.\r\nTâches à prendre en charge durant le stage :\r\n- collaboration avec les services de la DSII, de la DRFCG et DIM\r\n- Etude fonctionnelle des données afin d''identifier les règles de gestion requises à la consolidation des données \r\n- Analyser les processus et fluxs\r\n- qualité des données\r\n- mise en oeuvre d''un outil de controle des données mettant en évidence les données manquantes, erronées ...\r\n- développement, réalisation, intégration, consolidation des données dans un cube de données (techonologie qlikview)\r\n- mise en oeuvre d''un tableau de bord', '2012-04-23', '2012-08-31', '9999', 1, '', '2012-04-20', NULL, NULL, NULL, NULL, NULL, 135, 44, 44, NULL, 30, 5),
(383, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 136, NULL, NULL, NULL, NULL, 5),
(384, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 137, NULL, NULL, NULL, NULL, 5),
(385, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 138, NULL, NULL, NULL, NULL, 5),
(386, 'Developpeur E-commerce', 'I/ Maintenance et développement des fonctionnalités du front et back office :\r\n- 1/ Développement du programme de parrainage et affiliation,\r\n- 2/ Outils de gestion des coupons : édition, suivi des performances…\r\n- 3/ Gestion des abonnements/désabonnements newsletter et de l’envoi d’emails en masse,\r\n- 4/ Envoi d’emails automatiques.\r\n\r\nII/ Améliorer l’ergonomie apparence graphique du site :\r\n\r\n- 1/ Améliorer l’aspect de nos boutons, visuels et pages.', '2012-05-07', '2012-07-20', '0.00', 1, '', '2012-03-08', NULL, NULL, NULL, NULL, NULL, 139, 19, 19, NULL, 47, 3),
(387, 'Application de construction et de plannification budgétaire', '* Outil d''élaboration et de suivi budgétaire dans le cadre de réponses à des appels d''offre.\r\n* Outil de génération du business plan et du planning.', '2012-05-02', '2012-09-14', '606,20', 1, '', '2012-03-15', NULL, NULL, NULL, NULL, NULL, 140, 23, 23, NULL, 30, 3),
(388, 'Informatique ACCESS et Programmation VBA', 'Remettre en état la base SPM+ et en particulier la partie déchet.\r\n\r\nAccessoiriser la base Excel Filot (mise en place de macros).\r\n\r\nReconstruire la base Excel Surconsommation pour améliorer la fluidité lors de son utilisation.\r\n', '2012-05-03', '2012-09-02', '436.05', 1, '', '2012-03-13', NULL, NULL, NULL, NULL, NULL, 141, 22, 22, NULL, 30, 3),
(389, 'mise en place du reporting/tableau de bord', 'intégration de données à partir d’un ETL (SAP DataServices, Microsoft SSIS, Talend, …) et/ou mise en place du reporting/tableau de bord (SAP Business Objects, Microsoft RS, QlikView, …)', '2012-05-02', '2012-07-06', '500', 1, '', '2012-04-11', NULL, NULL, NULL, NULL, NULL, 142, 39, 39, NULL, 30, 3),
(390, 'Statistique sur la téléphonie', 'Faire des statistiques en rapport avec la téléphonie (factures...) grâce à BO', '2012-04-30', '2012-06-30', '417', 1, '', '2012-04-10', NULL, NULL, NULL, NULL, NULL, 143, 37, 37, NULL, 30, 3),
(391, 'Etude gestion base de données - Sytèmes de combats', 'Création d''une base de données', '2012-05-17', '2012-08-03', '700', 1, '', '2012-05-16', NULL, NULL, NULL, NULL, NULL, 144, 51, 51, NULL, 30, 3),
(392, 'Chargé de traitement', 'Participation au traitement de plusieurs études de Côté Clients.', '2012-05-02', '2012-07-21', '500', 1, '', '2012-03-20', NULL, NULL, NULL, NULL, NULL, 145, 25, 25, NULL, 30, 3),
(393, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 146, NULL, NULL, NULL, NULL, 3),
(394, 'services informatiques', 'Participation à la detection des besoins, à la réalisation et à la mise en œuvre d''outils informatique d''automatisations des tâches.', '2012-06-01', '2012-08-31', '420', 1, '', '2012-03-05', NULL, NULL, NULL, NULL, NULL, 147, 15, 15, NULL, 30, 3),
(395, 'Développeur Business Object', 'Requêtes sur Business Object\r\no Repérer les erreurs.\r\no Contrôle sur les structures et étudiants pour anticiper les problèmes.\r\no Faire apparaître les valeurs « vides ».\r\no Requêtes plus complexes avec jointures entre les tables.\r\no Réfléchir à de nouvelles requêtes.\r\n\r\n Entretien de la Base\r\n\r\n Evolution de la Base\r\n\r\n Faire la liaison entre l’aspect administratif et technique\r\n\r\n Contrôle des données lors de la période des résultats\r\n\r\n Améliorer la présentation des résultats', '2012-05-02', '2012-07-22', '436.05', 1, '', '2012-04-18', NULL, NULL, NULL, NULL, NULL, 148, 41, 41, NULL, 30, 3),
(396, 'Calibrage et étude de sensibilité de paramètres de modèles de trafic et application pour l’estimation et la prévision des conditions de circulation temps réel', 'L’estimation et la prévision des conditions de circulation nécessitent une modélisation fine\r\nde la dynamique du trafic. Cette modélisation repose sur l’utilisation de modèle de trafic\r\ndépendant de paramètres qu’il convient d’identifier et de calibrer. Cette identification\r\nnécessite la mise en place de procédure permettant de mieux appréhender importantes de\r\ncertains paramètres, mais surtout leurs interactions (réseau de causalité). Une fois cette\r\nconnaissance obtenue, il est possible d’agir en temps réel sur les paramètres (ou leurs\r\ninteractions) de manière à pouvoir calibrer efficacement le modèle pour l’estimation et la\r\nprévision des conditions de circulation en temps réel.\r\n\r\nL’objet de ce stage est dans un premier temps de réaliser, sur un cas réel, une étude de\r\nsensibilité d’un modèle de type LWR, à l’aide de la théorie des plans d’expériences\r\nnumériques (certains outils sont déjà existants) et d’identifier les paramètres et\r\ninteractions prépondérantes, et dans un deuxième, à l’aide de simulations de trafic de\r\nmesurer la possibilité d’utiliser cette connaissance a priori afin d’améliorer la réactivité du\r\nmodèle.', '2012-05-02', '2012-07-31', '436.05', 1, '', '2012-03-21', NULL, NULL, NULL, NULL, NULL, 149, 27, 27, NULL, 30, 3),
(397, 'Informatique decisionnelle', 'L''objectif du stage est de mettre en oeuvre un outil permettant de mesurer les émissions de CO2 dans un simulateur de trafic routier coopératif. Le trafic routier coopératif est une thématique de recherche actuelle qui consiste à permettre l''échange de données entre véhicules afin d''anticiper les phénomènes de congestion. Ainsi le stage requiert un certain goût pour la programmation informatique, la structure de données et les statistiques. Le stagiaire travaillera directement sur le simulateur de trafic routier qui est développé sous Matlab. Il s''agit d''intégrer des indicateurs d''émissions environnementales au sein d''une plateforme existante afin d''évaluer les bénéfices apportés par la communication entre véhicules en termes d''émissions CO2.', '2012-05-01', '2012-07-31', '436.05', 0, '', '2012-03-31', NULL, NULL, NULL, NULL, NULL, 150, 32, 32, NULL, 30, 3),
(398, 'creation et developpement d''un site commerciale pour une petite entreprise', 'En collaboration avec le service commercial et les informatotiens :\r\n• Vous serez en charge de la définition de l’architecture du site Internet, de sa conception et de son développement\r\n-Vous serez force de propositions quant aux aspects graphiques et ergonomiques et techniques,\r\n-Vous effectuerez la rédaction de fiches produits et mise en page, du site Internet\r\n-Vous effectuerez la maintenance et la lise a jour  du site Internet\r\n-La durre de stage 3mois min', '2012-05-20', '2012-08-20', '367.50', 1, '', '2012-05-02', NULL, NULL, NULL, NULL, NULL, 151, 48, 48, NULL, 30, 3),
(399, 'Etude comparative de l’estimation de trajectoires pour l’estimation d’émissions de CO2 en voie urbaine', 'Le sujet porte sur l''estimation d''émissions de CO2 de véhicules sur une section urbaine. Deux modèles microscopiques (1. classique loi de poursuite et 2. dérivé du principe variationnel) ont été préalablement codés. Il s''agira de calibrer et d''optimiser ces modèles (par rapport à la situation de trafic et les données fournies par Tokyo Metropolitan expressway) et de comparer plusieurs indicateurs, entre autres l''estimation de CO2, pour conclure sur les limites des modèles au regard de l''indicateur. Dans l''idéal un article devrait être soumis fin juillet pour présentation au Transportation Research Board. ', '2012-05-01', '2012-08-01', '437', 1, '', '2012-04-20', NULL, NULL, NULL, NULL, NULL, 152, 45, 45, NULL, 30, 3),
(400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 153, NULL, NULL, NULL, NULL, 3),
(401, 'Développeur ', '- Améliorer la présentation des résultats\r\n- Construction d''une Interface\r\n- Évolution de la base et modification des données\r\n- Tester et manipuler des données grâce à B.O\r\n- Utilisation des requêtes B.O pour détecter les erreurs\r\n-  Organisation de la structure  de scolarité des étudiants en utilisant des requêtes B.O\r\n- Proposer des nouvelles requêtes  ', '2012-05-02', '2012-07-22', '417,06', 1, '', '2012-04-20', NULL, NULL, NULL, NULL, NULL, 154, 43, 43, NULL, 30, 3),
(402, 'Developpement Informatique PHP/MySQL', 'Dans le cadre d''un programme de recherche épidémiologique, la mission consiste à :\r\n\r\n-Modifier l’application de saisie (formulaire web) et la base de données  selon les besoins de l''équipe de recherche. (Tous deux créés au préalable)\r\n\r\n-Développer une procédure d’export des données saisies via un formulaire Web des postes des enquêteurs vers un premier serveur de l’Ifsttar où elles seront stockées \r\ntemporairement.\r\n\r\n-Écrire un script déposant ces données sur ce premier serveur de l’Ifsttar.\r\n\r\n-Proposer des solutions techniques de contrôle (ciblées par l''équipe).\r\n\r\n-Développer une procédure de réimport des données dans la base de données Mysql située sur un autre serveur plus sécurisé de l’Ifsttar.\r\n\r\n-Documenter toutes les procédures développées et les solutions techniques proposées. ', '2012-05-02', '2012-07-31', '436,05', 1, '', '2012-04-05', NULL, NULL, NULL, NULL, NULL, 155, 35, 35, NULL, 30, 3),
(403, 'Conception et Développement de modules web', 'Conception et développement de modules web et workflow de validation dans l''intranet et extranet client et fournisseur d''Apollo : \r\n- gestion des formateurs\r\n- gestion des participants\r\n- création des processus de report des sessions et des relances automatiques d''inscription\r\n- génération dynamique des documents administratifs liés aux actions de formation.\r\nEnvironnement : Apache, MySQL, JQUERY, HTML, Css, PHP5, biblio.Fpdf.', '2012-04-30', '2012-08-31', '436.05', 2, NULL, '2012-03-25', NULL, NULL, NULL, NULL, NULL, 156, 29, 29, NULL, NULL, 3),
(404, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 157, NULL, NULL, NULL, NULL, 3),
(405, 'Excel VBA', 'A partir d''une base Access, réaliser une base sous Excel à l''aide de VBA pour effectuer des recherches multicritères sur le personnel', '2012-04-30', '2012-06-29', '450', 1, '', '2012-02-23', NULL, NULL, NULL, NULL, NULL, 158, 11, 11, NULL, 30, 3),
(406, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 159, NULL, NULL, NULL, NULL, 3),
(407, 'créer le site internet', 'mettre en place le site internet, gérer des base de données de clients', '2012-05-09', '2012-07-09', '0.0', 1, '', '2012-05-04', NULL, NULL, NULL, NULL, NULL, 160, 49, 49, NULL, 30, 3),
(408, 'Simulation et modélisation sur Mx Payment', 'Il s''agit d''un  projet de développement, via modèle économétrique, du système Mx payment (projet monétique de m2m group) permettant de simuler les processus, de modéliser les facteurs qui ont un impact sur ces processus, d''identifier les tendances et d''anticiper les fluctuations à venir.', '2012-07-02', '2012-08-31', '182', 1, '', '2012-06-12', NULL, NULL, NULL, NULL, NULL, 161, 52, 52, NULL, 30, 3),
(409, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 162, NULL, NULL, NULL, NULL, 3),
(410, 'Développement Web et Référencement', 'Le stage consiste à finaliser un site internet qui existe déjà et à en créer un autre. J''aurais également comme tâche de mettre en place deux intranets qui vont servir de back-office à ces sites.', '2012-05-14', '2012-08-14', '436', 1, '', '2012-04-30', NULL, NULL, NULL, NULL, NULL, 163, 47, 47, NULL, 30, 3),
(411, 'stage d''informatique', '-Mise en place d''une base données qui se mettra à jour seule par interface entre le logiciel en interne (QuadraFact) et le site internet de la société.\r\n-Création d''un site internet pour une future filiaire de la société.', '2012-05-21', '2012-07-20', '000.0', 1, '', '2012-05-11', NULL, NULL, NULL, NULL, NULL, 164, 50, 50, NULL, 30, 3),
(412, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 313, NULL, NULL, NULL, NULL, 8),
(413, 'Extractions de relations n-aires dans des tableaux issus de documents textuels', 'Ce stage s''inscrit dans le cadre de l''extraction des connaissances à partir des données (ECD), en utilisant les méthodes de fouille de données et plus précisement les méthodes de fouilles de textes afin d''extraire des relations multidimentionnelles.\r\n\r\n   L''objectif du stage est de réaliser un prototype à partir d''une méthode à proposer dans le cadre d''extraction de l''information en utilisant des méthodes d''apprentissage automatique et plus précisement les arbres de décision.', '2012-03-06', '2012-09-05', '436.05', 2, NULL, '2012-03-05', NULL, NULL, NULL, NULL, NULL, 314, 16, 16, NULL, NULL, 8),
(414, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 315, NULL, NULL, NULL, NULL, 8),
(415, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 316, NULL, NULL, NULL, NULL, 8),
(416, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 317, NULL, NULL, NULL, NULL, 8),
(417, 'An Unified Framework for fault Detection and Prediction in Distributed Systems', 'The subject of the training is to study an unified framework for fault detection and prediction in distributed systems. This study is applied to our different products. The training will then consist in:\r\n      - Validate existing state of the art\r\n      - Ramp up on existing fault detection mechanism in our product and from competition\r\n      - Investigate identified improvement ideas in fault detection (from the fault detection paper) and potentially propose other tracks\r\n      - Develop a proof of concept to validate the chosen improvements\r\n      - Prototype the solution if proof of concept validates the chosen direction\r\n      - Work closely with Bee-CARE development team for prototype productization and integration\r\n', '2012-04-04', '2012-09-28', '1000.00', 2, NULL, '2012-04-02', NULL, NULL, NULL, NULL, NULL, 318, 34, 34, NULL, NULL, 8),
(418, 'Développement/Extraction des connaissances', '- Intégration dans une équipe de consultants expérimentés qui accompagnent les responsables de grands groupes et acteurs publics dans l’élaboration de leur stratégie et sa mise en œuvre opérationnelle,\r\n- analyse des besoins clients et traduction technique,\r\n- construction de cahiers des charges répondants aux besoins clients,\r\n- développement d''applications de veille internet et de business intelligence en Java (Eclipse) et C++,\r\n- acquisition d’expertise dans les outils de veille internet et de visualisation de l’information (analyse et traitement des flux RSS, modélisation XML, etc…),\r\n- développement de fonctionnalités avancées sur des outils d''intelligence économique.', '2012-04-16', '2012-08-31', '1300', 2, NULL, '2012-04-10', NULL, NULL, NULL, NULL, NULL, 319, 38, 38, NULL, NULL, 8),
(419, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 320, NULL, NULL, NULL, NULL, 8),
(420, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 321, NULL, NULL, NULL, NULL, 8);
INSERT INTO `stage` (`NumStage`, `IntituleStage`, `MissionStage`, `DateDebutStage`, `DateFinStage`, `remunerationStage`, `valideStage`, `motifValideStage`, `DatePropositionStage`, `obsResultatStage`, `obsFortFaibleStage`, `obsEmbaucheStage`, `obsCompStage`, `langueStage`, `NumEtudiant`, `idEntreprise`, `IdTuteurEntreprise`, `NumSoutenance`, `NumEnseignant`, `idFormation`) VALUES
(421, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 322, NULL, NULL, NULL, NULL, 8),
(422, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 323, NULL, NULL, NULL, NULL, 8);

-- --------------------------------------------------------

--
-- Structure de la table `supervisertravgroupe`
--

CREATE TABLE `supervisertravgroupe` (
  `NumEnseignant` int(11) NOT NULL,
  `numTravauxGroupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `supervisertravind`
--

CREATE TABLE `supervisertravind` (
  `NumTravauxInd` int(11) NOT NULL,
  `NumEnseignant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `syllabus`
--

CREATE TABLE `syllabus` (
  `idSyllabus` int(11) NOT NULL,
  `HeuresCMSyllabus` int(10) DEFAULT NULL,
  `HeuresTDSyllabus` int(10) DEFAULT NULL,
  `libelleSyllabus_fr` varchar(150) DEFAULT NULL,
  `libelleSyllabus_en` varchar(150) DEFAULT NULL,
  `etatSyllabus` tinyint(1) DEFAULT NULL,
  `nombreECTSSyllabus` int(10) DEFAULT NULL,
  `typeSyllabus` int(5) DEFAULT NULL,
  `objectifSyllabus_fr` varchar(300) DEFAULT NULL,
  `objectifSyllabus_en` varchar(300) DEFAULT NULL,
  `prerequisSyllabus_fr` varchar(400) DEFAULT NULL,
  `prerequisSyllabus_en` varchar(400) DEFAULT NULL,
  `infoSupSyllabus_fr` varchar(400) DEFAULT NULL,
  `infoSupSyllabus_en` varchar(400) DEFAULT NULL,
  `contenuSyllabus_fr` text,
  `contenuSyllabus_en` text,
  `ecritEvalSyllabus` int(10) DEFAULT NULL,
  `detailEcritEvalSyllabus_fr` varchar(255) DEFAULT NULL,
  `detailEcritEvalSyllabus_en` varchar(255) DEFAULT NULL,
  `pratiqueEvalSyllabus` int(10) DEFAULT NULL,
  `detailPratiqueEvalSyllabus_fr` varchar(255) DEFAULT NULL,
  `detailPratiqueEvalSyllabus_en` varchar(255) DEFAULT NULL,
  `NumUE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `syllabus`
--

INSERT INTO `syllabus` (`idSyllabus`, `HeuresCMSyllabus`, `HeuresTDSyllabus`, `libelleSyllabus_fr`, `libelleSyllabus_en`, `etatSyllabus`, `nombreECTSSyllabus`, `typeSyllabus`, `objectifSyllabus_fr`, `objectifSyllabus_en`, `prerequisSyllabus_fr`, `prerequisSyllabus_en`, `infoSupSyllabus_fr`, `infoSupSyllabus_en`, `contenuSyllabus_fr`, `contenuSyllabus_en`, `ecritEvalSyllabus`, `detailEcritEvalSyllabus_fr`, `detailEcritEvalSyllabus_en`, `pratiqueEvalSyllabus`, `detailPratiqueEvalSyllabus_fr`, `detailPratiqueEvalSyllabus_en`, `NumUE`) VALUES
(1, 0, 0, 'Algebre lineaire', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 14),
(2, 0, 0, 'Algorithmique structures de donnees', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 13),
(3, 0, 0, 'Bases de donnees relationnelles et langage SQL', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 14),
(4, 0, 0, 'Conception des systemes d''information', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 14),
(5, 0, 0, 'Droit', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 18),
(6, 0, 0, 'Econometrie', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 16),
(7, 0, 0, 'Estimation statistique et tests parametriques', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 13),
(8, 0, 0, 'Expression', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 18),
(9, 0, 0, 'Genie logiciel et programmation', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 13),
(10, 0, 0, 'Langue vivante Anglais', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 15),
(11, 0, 0, 'MacroeconomieManagement', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 18),
(12, 0, 0, 'Microeconomie', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 13),
(13, 0, 0, 'Programmation Web', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 16),
(14, 0, 0, 'Puissance de tests et methodes non parametriques', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 16),
(15, 0, 0, 'Recherche operationnelle', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 14),
(16, 0, 0, 'Systemes d''exploitation UNIX et langage C', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 16),
(17, 0, 0, 'Tableur avance et macros', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 13),
(18, 0, 0, 'Traitement automatise des donnees statistiques', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 16),
(19, 0, 0, 'Optimisation', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 27),
(20, 0, 0, 'Analyse factorielle', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 21),
(21, 0, 0, 'Analyse typologique', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 27),
(22, 0, 0, 'Database programming', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 20),
(23, 0, 0, 'Demographie', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 29),
(24, 0, 0, 'Droit des NTE', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 23),
(25, 0, 0, 'Droit social', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 28),
(26, 0, 0, 'Entrepots de donnees', 'Null', 1, 0, 0, '', '', '', '', '', '', '', '', 1, '', '', 1, '', '', 26),
(27, 0, 0, 'Fouille de donnees', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 30),
(28, 0, 0, 'Genie logiciel et UML', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 19),
(29, 0, 0, 'Gestion de projet', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 19),
(30, 0, 0, 'Image et multimedia', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 31),
(31, 0, 0, 'Intelligence artificielle representation des connaissances', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 24),
(32, 0, 0, 'Logiciels statistiques', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 30),
(33, 0, 0, 'Marketing', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 29),
(34, 0, 0, 'Methodes d''enquete', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 22),
(35, 0, 0, 'Methodologie de la recherche', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 33),
(36, 0, 0, 'Modele lineaire general', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 21),
(37, 0, 0, 'Montage de projet pour une entreprise', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 33),
(38, 0, 0, 'Theorie des graphes', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 24),
(39, 0, 0, 'Programmation multimedia', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 31),
(40, 0, 0, 'Programmation orienteeobjet', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 19),
(41, 0, 0, 'Reseaux', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 20),
(42, 0, 0, 'Securite des reseaux', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 23),
(43, 0, 0, 'Securite informatique', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 28),
(44, 0, 0, 'Semistructured data & XML', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 26),
(45, 0, 0, 'Statistique des donnees categorielles', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 22),
(46, 0, 0, 'Systeme d''information pour l''entreprise etendue', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 32),
(47, 0, 0, 'Systemes d''information et bases de donnees', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 20),
(48, 0, 0, 'Analyse des donnees', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(49, 0, 0, 'Anglais technique', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(50, 0, 0, 'Communication', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(51, 0, 0, 'Datamining', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(52, 0, 0, 'Genie Logiciel', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(53, 0, 0, 'Previsions', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(54, 0, 0, 'Systeme d''information et BDD', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(55, 0, 0, 'Advanced Databases', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 39),
(56, 0, 0, 'Case study', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(57, 0, 0, 'Complex Data Warehousing', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(58, 0, 0, 'Data Preprocessing', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(59, 0, 0, 'Logic & Knowledge Representation', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(60, 0, 0, 'Methodology and Tools for Research', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 40),
(61, 0, 0, 'Mining Complex Data', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(62, 0, 0, 'Modeling Complex Systems in Social Science', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(63, 0, 0, 'Multidimensional Data Analysis', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 39),
(64, 0, 0, 'Optimization', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 39),
(65, 0, 0, 'Probability & Statistics', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 39),
(66, 0, 0, 'Software Methodologies', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 39),
(67, 0, 0, 'Symbolic Machine Learning', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 40),
(68, 0, 0, 'Numerical learning', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 41),
(69, 0, 0, 'Apprentissage automatique ', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(70, 0, 0, 'Apprentissage automatique  text mining', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(71, 0, 0, 'Atelier application sur R', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(72, 0, 0, 'Atelier LATEX', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(73, 0, 0, 'Atelier SAS', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(74, 0, 0, 'Atelier SPAD', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(75, 0, 0, 'Entreposage et fouille de donnees complexes', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(76, 0, 0, 'Entrepots de donnees et OLAP', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 34),
(77, 0, 0, 'Logiciels d''apprentissage et applications', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(78, 0, 0, 'Modeles classificatoires', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(79, 0, 0, 'Agregation de preferences', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 35),
(80, 0, 0, 'Programmation avancee', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 34),
(81, 0, 0, 'Statistiques exploratoires et inference', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(82, 0, 0, 'Analyse en ligne  Applications', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(83, 0, 0, 'Atelier Business Object', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(84, 0, 0, 'Base de donnees objets', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(85, 0, 0, 'Calcul economique et theorie de la decision', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 35),
(86, 0, 0, 'Ingenierie ontologique', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 37),
(87, 0, 0, 'Modelisation decisionnelle et applications', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(88, 0, 0, 'Optimisation dans les bases de donnees', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(89, 0, 0, 'Outils de fouille de donnees  Regles d''association', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 37),
(90, 0, 0, 'Outils de fouille de donnees  Reseaux Bayesiens', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(91, 0, 0, 'Outils de fouille de donnees  Reseaux de Neurones', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(92, 0, 0, 'Programmation avancee  NET', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(93, 0, 0, 'Programmation Web avancee', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 34),
(94, 0, 0, 'Projet decisionnel  Etude de cas', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 37),
(95, 0, 0, 'Administration et securite des bases de donnees', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 50),
(96, 0, 0, 'Audit informatique', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 50),
(97, 0, 0, 'Contrats informatiques et contrats speciaux  Pratique et contientieux', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 51),
(98, 0, 0, 'Gestion des risques', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 51),
(99, 0, 0, 'Organisation et modelisation des systemes d''information', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 51),
(100, 0, 0, 'Plan de continuite d''activite et normes qualite', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 51),
(101, 0, 0, 'Protection juridique des SI', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 50),
(102, 0, 0, 'Reseaux informatiques niveau 2', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 50),
(103, 0, 0, 'Securite informatique  concepts fondamentaux', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 50),
(104, 0, 0, 'Securite informatique  cryptographie', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(105, 0, 0, 'Seminaires Cerification CISCO', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(106, 0, 0, 'Applications : CRM et statistique medicale', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 52),
(107, 0, 0, 'Data mining methodes et applications  analyse des donnees', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 53),
(108, 0, 0, 'Data mining methodes et applications  text mining', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(109, 0, 0, 'Marketing jeu d''entreprise', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 53),
(110, 0, 0, 'Methodes de sondage', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 52),
(111, 0, 0, 'Methodes de sondage  Plans d''experience', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(112, 0, 0, 'Programmation avancee', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 43),
(113, 0, 0, 'Regression logistique', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 53),
(114, 0, 0, 'Techniques de recherche d''emploi logiciel SAS', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 52),
(115, 0, 0, 'Working in a team', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 53),
(116, 0, 0, 'Encadrement projets informatiques', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(117, 0, 0, 'Minis projets transversaux', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(118, 0, 0, 'Protection juridique', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(119, 0, 0, 'Seminaire', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(120, 0, 0, 'Seminaires  Certification CISCO', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0),
(121, 0, 0, 'Seminaires CMMI et ITIL', 'Null', 1, 0, 0, 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 'Null', 0, 'Null', 'Null', 0, 'Null', 'Null', 0);

-- --------------------------------------------------------

--
-- Structure de la table `syllabus_keyword`
--

CREATE TABLE `syllabus_keyword` (
  `idSyllabus` int(11) NOT NULL,
  `idKeyword` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `travauxgroupe`
--

CREATE TABLE `travauxgroupe` (
  `numTravauxGroupe` int(11) NOT NULL,
  `titreTravauxGroupe` varchar(200) DEFAULT NULL,
  `ResumeTravauxGroupe` text,
  `dateTravauxGroupe` date DEFAULT NULL,
  `adresseStockageTravauxGroupe` varchar(255) DEFAULT NULL,
  `idSyllabus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `travauxindividuels`
--

CREATE TABLE `travauxindividuels` (
  `NumTravauxInd` int(11) NOT NULL,
  `titreTravauxInd` varchar(200) DEFAULT NULL,
  `ResumeTravauxInd` text,
  `dateTravauxInd` date DEFAULT NULL,
  `dominanteTravauxInd` varchar(100) DEFAULT NULL,
  `ConfidentialiteTravauxInd` tinyint(1) DEFAULT NULL,
  `adresseStockageTravauxInd` varchar(255) DEFAULT NULL,
  `NumEtudiant` int(11) DEFAULT NULL,
  `idTypeTravaux` int(11) DEFAULT NULL,
  `idSyllabus` int(11) DEFAULT NULL,
  `NumStage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tuteur_entreprise`
--

CREATE TABLE `tuteur_entreprise` (
  `IdTuteurEntreprise` int(11) NOT NULL,
  `NomTuteurEntreprise` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PrenomTuteurEntreprise` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `MailTuteurEntreprise` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `TelephoneTuteurEntreprise` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `serviceTuteurEntreprise` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `idEntreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `tuteur_entreprise`
--

INSERT INTO `tuteur_entreprise` (`IdTuteurEntreprise`, `NomTuteurEntreprise`, `PrenomTuteurEntreprise`, `MailTuteurEntreprise`, `TelephoneTuteurEntreprise`, `serviceTuteurEntreprise`, `idEntreprise`) VALUES
(5, 'Foucteau', 'Vincent', 'vincent.foucteau@logica.com', '(0) 6 31 21 32 62', 'Logica IT Services', 5),
(6, 'Olivier', 'Isabelle', 'isabelle.olivier@logica.com', '04 69 64 61 27', 'manager RH du CSRA', 6),
(7, 'SANCHEZ', 'Fréderic', 'frederic.sanchez@businessdecision.com', '0437473240', 'Directeur Adjoint', 7),
(8, 'FAURE', 'Elisabeth ', 'elisabeth.faure@keyrus.com', '06 80 11 63 82', 'Gestion des Compétences', 8),
(9, 'Dilly', 'Francois', 'Francois.Dilly@keyrus.com', '04 37 49 69 49', 'Régions et Middle Market France', 9),
(10, 'MACIAS', 'Frédéric ', 'FREDERIC.MACIAS@BULL.NET', '04 91 11 31 00', 'BI', 10),
(11, 'santos', 'francisco', 'francisco.santos@edf.fr', '04 72 82 76 79', 'RH', 11),
(12, 'LEVIGNE', 'Gregory ', 'gregory.levigne@logica.com', ' +33 (0) 4 69 64 60 ', 'Consultant Solutions BI Senior Logica IT Services, Business Unit Rhône-Alpes-Auvergne', 12),
(13, 'FAURE', 'Elisabeth', 'elisabeth.faure@keyrus.com', '0680116382', 'Gestion des Compétences', 13),
(14, 'LEJEUNE', 'Sylvain', 'slejeune@2bconsulting.com', '+33 149 08 00 10', 'Informatique', 14),
(15, 'DULAC', 'francois', 'francois.dulac@orange.com', '0678110999', 'USC GC LYON', 15),
(16, 'BUCHE', 'Patrice', 'patrice.buche@supagro.inra.fr', '04 99 61 22 83', 'Ingénieur de recherche qualifié supérieur', 16),
(17, 'SCHNEIDER', 'Alain', 'ASCHNEIDER@micropole.com', '0689898989', 'IRD', 17),
(18, 'Lorieux', 'David ', 'david.lorieux@businessdecision.com', '0000000000', 'Directeur Adjoint', 18),
(19, 'ricardo', 'Ricardo', 'comercial@monouso.es', '931158455', 'commercial', 19),
(20, 'Garcia', 'Gilles', 'g.garcia@orange.com', '0478630213', 'Hypervision Business Management', 20),
(21, 'BONTE', 'Cyrille', 'cyrille.bonte@keyrus.com', '0141341000', 'Service Business Intelligence', 21),
(22, 'FABRE', 'Stéphane', 'stephane.fabre@nexans.com', '04 72 72 24 24', 'Responsable Amelioration Continue', 22),
(23, 'Tily', 'Jean-Pierre', 'jean-pierre.tily@keolis.com', '0676960388', 'DSI', 23),
(24, 'BERNON ', 'STEPHANE', 'sbernon@napstec.com ', '(+33)(0)6 18 21 52 6', 'Directeur Ingénierie', 24),
(25, 'Lecorps', 'Eddie', 'e.lecorps@coteclients.fr', '0472365800', 'Traitement', 25),
(26, 'SULTANA', 'Alain', 'asultana@vps-data.fr', '0610827417', 'NR', 26),
(27, 'Canaud', 'Matthieu', 'matthieu.canaud@entpe.fr', '04 72 14 25 40', 'LICIT', 27),
(28, 'CASU', 'Olivier', 'Olivier.Casu@murex.com', '0144053200', 'Information System Organization', 28),
(29, 'SAMAMA-TIER', 'Yann', '0478350398', '0478354570', '...', 29),
(30, 'Guilloud', 'Sébastien', 'sebastien.guilloud@teamwork.net', '0000000000', 'développement SAP', 30),
(31, 'BERNON', 'Stéphane', 'sbernon@napstec.com', '01 43 41 00 41', 'Direction ingénierie', 31),
(32, 'Billot', 'Romain', 'romain.billot@ifsttar.fr', '+334 78 65 69 07', 'Chercheur LICIT, IFSTTAR, ENTPE', 32),
(33, 'Mancuso ', 'Stéphane', 'smn.ho@clasquin.com', '0472839404', 'Décisionnel', 33),
(34, 'MANSUTTI', 'David', 'david.mansutti@buzzinbees.com', '06 15 90 76 78', 'Bee Care', 34),
(35, 'Evrard', 'Anne-Sophie', 'anne-sophie.evrard@ifsttar.fr', '04 72 14 24 63', 'UMRESTTE', 35),
(36, 'toutlemonde', 'toutlemonde', 'dubourvieux.vincent@laposte.net', '0472535289', 'MEDICAL', 36),
(37, 'LOUREIRO', 'José', 'jose.loureiro@emc2.coop', '0329832927', 'informatique', 37),
(38, 'Nougué', 'Pierre', 'pierre.nougue@ecosysgroup.com', '01 53 43 27 66', 'Directeur général', 38),
(39, 'Faure', 'Elisabeth', 'elisabeth.faure@keyrus.com', '06 80 11 63 82', 'Responsable Gestion des Compétences', 39),
(40, 'Foucteau', 'Vincent', 'vincent.foucteau@logica.com', '+33 (0) 6 31 21 32 6', 'Logica IT Services, Business Unit Rhône-Alpes-Auvergne', 40),
(41, 'Cuzin', 'Annie', 'Annie.Cuzin@univ-lyon2.fr', '0478772371', 'Responsable pôle', 41),
(42, 'VIGNEAU', 'Elisabeth', 'elisabeth', '0426238078', 'responsable', 42),
(43, 'Cusin ', 'Annie', 'annie.cusin@univ-lyon2.fr', '04 78 77 23 71', 'directrice ', 43),
(44, 'Michel', 'Catherine', 'catherine.michel@chu-lyon.fr', '04 24 85 64 2204 24 ', 'DSII', 44),
(45, 'Julien Monteil et Ro', 'Julien Monteil et Ro', 'julien.monteil@ifsttar.fr', '(0)4 72 14 25 42    ', 'LICIT', 45),
(46, 'GRIMAUD', 'Emmanuel ', 'emmanuel.grimaud@maximis.fr', '01 53 43 03 80 ', 'Président', 46),
(47, 'THIAMIOU', 'Ismael', 'ithiamiou@patr-immo.com', '0437420404', 'Informaticien', 47),
(48, 'fork', 'nina', 'ninafork@126.com', '+86 139-1108-1878', 'Executive', 48),
(49, 'SMIA', 'Lionel', 'contact@digitaltelecom.fr', '0762583167', 'directeur', 49),
(50, 'Mauguin', 'Cyrille', 'cyrille-mauguin@vervil.fr', '04 72 34 09 48', 'administrateur commercial', 50),
(51, 'Guéguen', 'Alain ', 'Alain GUEGUEN/LORIENT/DCN/FR@DCN', '02 97 12 26 69', 'Ingenierie/SNS', 51),
(52, 'HDADI', 'Zainab', 'zhdadi@m2mgroup.com', ' +212 (0)522 435344', 'Contrôle de gestion', 52);

-- --------------------------------------------------------

--
-- Structure de la table `type_competence`
--

CREATE TABLE `type_competence` (
  `idTypeCompetence` int(11) NOT NULL,
  `libelleTypeCompetence` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `type_competence`
--

INSERT INTO `type_competence` (`idTypeCompetence`, `libelleTypeCompetence`) VALUES
(1, 'Relationnelles'),
(2, 'Professionnelles');

-- --------------------------------------------------------

--
-- Structure de la table `type_travaux`
--

CREATE TABLE `type_travaux` (
  `idTypeTravaux` int(11) NOT NULL,
  `LibelleTypeTravaux` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `type_travaux`
--

INSERT INTO `type_travaux` (`idTypeTravaux`, `LibelleTypeTravaux`) VALUES
(1, 'Rapport de Stage'),
(2, 'Projets');

-- --------------------------------------------------------

--
-- Structure de la table `ue`
--

CREATE TABLE `ue` (
  `NumUE` int(11) NOT NULL,
  `LibelleUE` varchar(125) DEFAULT NULL,
  `semestreUE` int(1) DEFAULT NULL,
  `activeUE` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ue`
--

INSERT INTO `ue` (`NumUE`, `LibelleUE`, `semestreUE`, `activeUE`) VALUES
(1, 'UE Majeure A Sciences Economiques et de Gestion', 1, 1),
(2, 'UE Majeure B IDEA', 1, 1),
(3, 'UE Transversale', 1, 1),
(4, 'UE Majeure A Sciences Economiques et de Gestion', 2, 1),
(5, 'UE Majeure B IDEA', 2, 1),
(6, 'UE Transversale', 2, 1),
(7, 'UE Majeure Sciences Economiques et de Gestion', 1, 1),
(8, 'UE Complement de Majeure IDEA', 1, 1),
(9, 'UE Transversale', 1, 1),
(10, 'UE Majeure Sciences Economiques et de Gestion', 2, 1),
(11, 'UE Complement de Majeure IDEA', 2, 1),
(12, 'UE Transversale', 2, 1),
(13, 'UE IDS', 1, 1),
(14, 'UE Complementaires', 1, 1),
(15, 'UE Transversale', 1, 1),
(16, 'UE IDS', 2, 1),
(17, 'UE Complementaire', 2, 1),
(18, 'UE Transversale', 2, 1),
(19, 'UE 1 Genie Logiciel et Programmation', 1, 1),
(20, 'UE 2 Reseaux et Systemes', 1, 1),
(21, 'UE 3 Statistique Multidimensionnelle', 1, 1),
(22, 'UE 4 Enqu', 1, 1),
(23, 'UE 5 Protection des donnees', 1, 1),
(24, 'UE 6 Structure et connaissances', 1, 1),
(25, 'UE 7 Professionnalisation', 2, 1),
(26, 'UE 8 Base de donnees avancees', 2, 1),
(27, 'UE 9 Typologie et Optimisation', 2, 1),
(28, 'UE 10 Protection Informatique et Droit', 2, 1),
(29, 'UE 11 Statistiques et Sciences Sociales', 2, 1),
(30, 'UE 12 Fouille de donnees et Outils', 2, 1),
(31, 'UE 13 Multimedia', 2, 1),
(32, 'UE 14 Systemes integres pour Entreprises', 2, 1),
(33, 'UE 15 Projet et Initiation ', 2, 1),
(34, 'Tronc commun IDS', 1, 1),
(35, 'Parcours IIDEE', 1, 1),
(36, 'Tronc commun IDS', 2, 1),
(37, 'Parcours IIDEE', 2, 1),
(38, 'Stage', 2, 1),
(39, 'DMKM SEM 1', 1, 1),
(40, 'DMKM SEM 2', 2, 1),
(41, 'DMKM SEM 3', 1, 1),
(42, 'DMKM SEM 4', 2, 1),
(43, ' UE 1 TRONC COMMUN IDSECD', 1, 1),
(44, ' UE 2 TRONC COMMUN IDSECD', 1, 1),
(45, ' UE 3 TRANSVERSALE IDSECD', 1, 1),
(46, ' UE 41 Methodes pour l''apprentissage', 1, 1),
(47, ' UE 42 Fouille dans les entrepots de donnee', 1, 1),
(48, ' UE 43 Visualisation et reseau', 1, 1),
(49, ' UE 5 TRONC COMMUN IDSECD', 2, 1),
(50, 'Parcours OPSIE', 1, 1),
(51, 'Parcours OPSIE', 2, 1),
(52, 'Parcours SISE', 1, 1),
(53, 'Parcours SISE', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `NumUtilisateur` int(11) NOT NULL,
  `TypeUtilisateur` varchar(1) DEFAULT NULL,
  `NomUtilisateur` varchar(25) DEFAULT NULL,
  `PrenomUtilisateur` varchar(30) DEFAULT NULL,
  `DateNaissanceUtilisateur` date DEFAULT NULL,
  `AdrRueUtilisateur` varchar(200) DEFAULT NULL,
  `AdrCPUtilisateur` int(5) DEFAULT NULL,
  `AdrVilleUtilisateur` varchar(20) DEFAULT NULL,
  `AdrPaysUtilisateur` varchar(15) DEFAULT NULL,
  `telUtilisateur` varchar(20) DEFAULT NULL,
  `EmailUtilisateur` varchar(50) DEFAULT NULL,
  `LoginUtilisateur` varchar(15) DEFAULT NULL,
  `PassUtilisateur` varchar(255) DEFAULT NULL,
  `photoUtilisateur` varchar(300) DEFAULT NULL,
  `sexeUtilisateur` varchar(1) DEFAULT NULL,
  `nationaliteUtilisateur` varchar(50) DEFAULT NULL,
  `idRole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`NumUtilisateur`, `TypeUtilisateur`, `NomUtilisateur`, `PrenomUtilisateur`, `DateNaissanceUtilisateur`, `AdrRueUtilisateur`, `AdrCPUtilisateur`, `AdrVilleUtilisateur`, `AdrPaysUtilisateur`, `telUtilisateur`, `EmailUtilisateur`, `LoginUtilisateur`, `PassUtilisateur`, `photoUtilisateur`, `sexeUtilisateur`, `nationaliteUtilisateur`, `idRole`) VALUES
(1, 'O', 'Admin', 'Super', '1990-01-01', '5, avenue Pierre Mendes France', 69500, 'Bron', 'FRANCE', '0649175951', 'conte.fr@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 'M', 'Française', 2),
(30, 'T', 'ABDESSELAM', 'Rafik', '0000-00-00', '', 0, '', '', '', '', 'rabdes', '9147fa67c3d2b1bd2668776f7c590670000508fe', '', '', '', 2),
(31, 'T', 'ANIZI', 'Mouna', '0000-00-00', '', 0, '', '', '', '', 'manizi', 'f2b16981512b79ea898b9ab08a18046544ac88f3', '', '', '', 2),
(32, 'T', 'ASFARI', 'Ounas', '0000-00-00', '', 0, '', '', '', '', 'oasfar', 'aa5a03c2c3a75b3a3f2d32a06a4e4c967ebde65a', '', '', '', 2),
(33, 'T', 'BANENS', 'Maks', '0000-00-00', '', 0, '', '', '', '', 'mbanen', 'dead673459df8026a35a23fbb9b5fdaeff4aef08', '', '', '', 2),
(34, 'T', 'BENTAYEB', 'Fadila', '0000-00-00', '5 Avenue Pierre Mendès France', 69676, 'Bron', 'FRANCE', '04 78 77 26 82', 'Fadila.Bentayeb@univ-lyon2.fr', 'fbenta', 'c681e775ead554e29a70f3334506174488479be9', '', 'F', 'Française', 2),
(35, 'T', 'BILLOT', 'Romain', '0000-00-00', '', 0, '', '', '', '', 'rbillo', '1a509bf9172bf911a7762d90726977b06c039aa0', '', '', '', 2),
(36, 'T', 'BONNET-PRADIER', 'Vanina', '0000-00-00', '', 0, '', '', '', '', 'vbonne', 'a3ca11833792f5bc54e7c86da9d745ac1d3d9200', '', '', '', 2),
(37, 'T', 'BOUNEKKAR', 'Ahmed', '0000-00-00', '', 0, '', '', '', '', 'aboune', '3c2a5373555eceee9cab78306a5759921f4736aa', '', '', '', 2),
(38, 'T', 'BOURAS', 'Abdelaziz', '0000-00-00', '', 0, '', '', '', '', 'aboura', 'c2ef3c4ab747ed1f2703178ab5bf7a7c255e8048', '', '', '', 2),
(39, 'T', 'BOURGEOIS', 'William', '0000-00-00', '', 0, '', '', '', '', 'wbourg', '2c4ff5513c129f5c88c11566e6fa44b5728755cd', '', '', '', 2),
(40, 'T', 'BOUSSAID', 'Omar', '1954-06-02', '5bis rue du Transvaal', 69008, 'Lyon 08', 'FRANCE', '0623789546', 'omar.boussaid@univ-lyon2.fr', 'obouss', '21232f297a57a5a743894a0e4a801fc3', '836afd01330bc0bb62119b4863c9e69b.jpg', 'M', 'FranÃ§aise', 2),
(41, 'T', 'Cabinet Audit', 'PWC', '0000-00-00', '', 0, '', '', '', '', 'pcabin', '24de56af83069c00fa9e65cb2d507189bae52450', '', '', '', 2),
(42, 'T', 'Cabinet', 'DELOITE', '0000-00-00', '', 0, '', '', '', '', 'dcabin', 'c30b45acfe36a63467a5a6eec649e3f779d8fab9', '', '', '', 2),
(43, 'T', 'CARRIER', 'Christophe', '0000-00-00', '', 0, '', '', '', '', 'ccarri', '338ed4f55f2f844798e972c4a4176d6c40a12e28', '', '', '', 2),
(44, 'T', 'CHATEAU', 'Frederic', '0000-00-00', '', 0, '', '', '', '', 'fchate', '068e9f0ed5da63255cb3e938e5e022ab6919bdae', '', '', '', 2),
(45, 'T', 'CHOQUET', 'Remy', '0000-00-00', '', 0, '', '', '', '', 'rchoqu', 'b3da9486519d9a8ee14386ebf982c03588fb8fc8', '', '', '', 2),
(46, 'T', 'CLAVREUL', 'Herve', '0000-00-00', '', 0, '', '', '', '', 'hclavr', '98b8425be34cb5bb155aee4b1160a1ee39a8be34', '', '', '', 2),
(47, 'T', 'DARMONT', 'Jerome', '0000-00-00', '', 0, '', '', '', '', 'jdarmo', '34f650fab0d89805aab41c34d4ad04ce46f4ff29', '', '', '', 2),
(49, 'T', 'DEBORD', 'Florence', '0000-00-00', '', 0, '', '', '', '', 'fdebor', '7e58ba5b9b2219141075c7aac10276786ba366b8', '', '', '', 2),
(50, 'T', 'DESBLED', 'Pascal', '0000-00-00', '', 0, '', '', '', '', 'pdesbl', 'e00d4d3c6e6fe401569f0c6de65de4743cbad047', '', '', '', 2),
(51, 'T', 'DUMAIS', 'Jean', '0000-00-00', '', 0, '', '', '', '', 'jdumai', '2d6a3d47677a9a7681027000a8abadcc76a595f9', '', '', '', 2),
(52, 'T', 'FANGET', 'Jean Remy', '0000-00-00', '', 0, '', '', '', '', 'jfange', '16b64173294c2197f67ce68c424c27a282c551a0', '', '', '', 2),
(53, 'T', 'FARELLY', 'JOSETTE', '1957-06-10', 'Bassy', 71260, 'Saint-Gengoux-de-Sci', 'FRANCE', '0385332131', 'farrellyjosette@orange.fr', 'jfarel', '3fa09ca2b236fde4372cb67b2746582d0c2502d9', '', 'F', 'française', 2),
(54, 'T', 'FARES', 'Athmane', '0000-00-00', '', 0, '', '', '', '', 'afares', 'ea83cf63429db15006b673a1cbc89ba82bce50ae', '', '', '', 2),
(55, 'T', 'FAVRE', 'Cecile', '1980-08-19', '62 avenue Francis de Pressensé', 69200, 'Vénissieux', 'FRANCE', '06 28 06 59 21', 'cecile.favre@univ-lyon2.fr', 'cfavre', 'a2ef5ef26782688c590d6df451ad2f7f3ef2741e', '', 'F', 'Française', 2),
(56, 'T', 'FAYET', 'Gerard', '0000-00-00', '', 0, '', '', '', '', 'gfayet', '94bb0dd35046c838531214f5dd845b263f1e29b6', '', '', '', 2),
(57, 'T', 'FEZZANI', 'Djamel', '0000-00-00', '', 0, '', '', '', '', 'dfezza', 'a99824e48d89813443da954ce339dd2aac71673e', '', '', '', 2),
(58, 'T', 'FOULON', 'Cedric', '0000-00-00', '', 0, '', '', '', '', 'cfoulo', 'e83a5aa4b16c4c52ee4e866a2e00463a90a1e3ac', '', '', '', 2),
(59, 'T', 'GAVIN', 'Gerald', '0000-00-00', '', 0, '', '', '', '', 'ggavin', 'bbe93daf81fe3bdb03a48ae9a80a99aaa6ef2f98', '', '', '', 2),
(60, 'T', 'GUILLE', 'Adrien', '0000-00-00', '', 0, '', '', '', '', 'aguill', '7c430b676eb8314f1e27a043a4b50f83a53cc9cb', '', '', '', 2),
(61, 'T', 'HARBI', 'Nouria', '0000-00-00', '', 0, '', '', '', '', 'nharbi', '06d5e147235a726102fad6d56fe9ba72d2b992cb', '', '', '', 2),
(62, 'T', 'HOCINE', 'Abdelatif', '0000-00-00', '', 0, '', '', '', '', 'ahocin', 'e034624bb21b84ab35c78c929cea01851501c198', '', '', '', 2),
(65, 'T', 'HOYEAU', 'Stephane', '0000-00-00', '', 0, '', '', '', '', 'shoyea', '4312686d6c6b7435fef32ecf7535143f5e9c0826', '', '', '', 2),
(66, 'T', 'HUPERTAN', 'Vincent', '0000-00-00', '', 0, '', '', '', '', 'vhuper', '3f0191a93b780fe9dce0b722958713f34224a8e2', '', '', '', 2),
(67, 'T', 'JOUVE', 'Bertrand', '0000-00-00', '', 0, '', '', '', '', 'bjouve', '7ff24f61e8c6ef62d770e2e0febcd73016b96737', '', '', '', 2),
(68, 'T', 'KABACHI', 'Nadia', '0000-00-00', '', 0, '', '', '', '', 'nkabac', '649cacab923ef54f566b22ffc5d42a5bd74a69a2', '', '', '', 2),
(69, 'T', 'KLOECKLE', 'Eric', '0000-00-00', '', 0, '', '', '', '', 'ekloec', 'e2d27931469416ccd176760282f493b989bf02cd', '', '', '', 2),
(70, 'T', 'LALLICH', 'Stephane', '0000-00-00', '', 0, '', '', '', '', 'slalli', 'f90ea210d805ffeb11edfdde4cd1f56bcd4edec6', '', '', '', 2),
(71, 'T', 'LOUDCHER', 'Sabine', '0000-00-00', '', 0, '', '', '', '', 'sloudc', '6255ce6d28b41ae02623bbd32bbe7c11475d8c48', '', '', '', 2),
(72, 'T', 'MANCON', 'Fabrice', '0000-00-00', '', 0, '', '', '', '', 'fmanco', '372c199351a0a0699e8bfe9306399f688db0a109', '', '', '', 2),
(73, 'T', 'MERCIER', 'Pascal', '0000-00-00', '', 0, '', '', '', '', 'pmerci', '1a789ea6539b675e679f9d9a37368fd80bc7ac22', '', '', '', 2),
(74, 'T', 'METZGER', 'Marie-Hele', '0000-00-00', '', 0, '', '', '', '', 'mmetzg', 'd3fef39c4d84ac7bd191378054e4138b36fd7229', '', '', '', 2),
(75, 'T', 'MOALLA', 'Nejib', '0000-00-00', '', 0, '', '', '', '', 'nmoall', 'e9ff52286f76a7fdefbab90bc3870947bd24211a', '', '', '', 2),
(77, 'T', 'OUZROUTE', 'Yacine', '0000-00-00', '', 0, '', '', '', '', 'youzro', '50b173e2763a90709cf601b078083654006894eb', '', '', '', 2),
(78, 'T', 'PERRIER', 'Lionel', '0000-00-00', '', 0, '', '', '', '', 'lperri', 'a28b3c416c583611e23f8fd88accf176a3991d0c', '', '', '', 2),
(79, 'T', 'PIERROT', 'David', '0000-00-00', '', 0, '', '', '', '', 'dpierr', '728518e674defcd853f484c024a461e702b09873', '', '', '', 2),
(80, 'T', 'RAKOTOMALALA', 'Ricco', '0000-00-00', '', 0, '', '', '', '', 'rrakot', '61755e071dcee472170d986dd31518de7e0e0254', '', '', '', 2),
(81, 'T', 'RICO', 'Agn', '0000-00-00', '', 0, '', '', '', '', 'arico', 'ef8fd278e5d01fcabab02986c55906d5c0e34c7c', '', '', '', 2),
(82, 'T', 'RICO', 'Fabien', '0000-00-00', '', 0, '', '', '', '', 'frico', '689d0ab10fcdf0ba66123a00ab015ab0eefa4d15', '', '', '', 2),
(83, 'T', 'RIOU', 'Alice', '0000-00-00', '', 0, '', '', '', '', 'ariou', '1809efe4c8867a05fb62cc06f6e5c583f5c5d530', '', '', '', 2),
(84, 'T', 'RITSCHARD', 'Gilbert', '0000-00-00', '', 0, '', '', '', '', 'gritsc', '00ebe65fa1e20327b90c3e5c58e293371e88325b', '', '', '', 2),
(85, 'T', 'RIZIOU', 'Andrei', '0000-00-00', '', 0, '', '', '', '', 'arizio', '8f2c9dfe2fcf8d5daa5749206bbc91784ee32124', '', '', '', 2),
(86, 'T', 'ROLLAND', 'Antoine', '0000-00-00', '', 0, '', '', '', '', 'arolla', 'c1f4881ad0c7d7f770f52f65a4d28ccf72453f16', '', '', '', 2),
(87, 'T', 'SAOUDI', 'Messaoud', '0000-00-00', '', 0, '', '', '', '', 'msaoud', '7210034403fac272d4b0bcb10d6f2a03cbede951', '', '', '', 2),
(88, 'T', 'SCUTURICI', 'Mihaela', '0000-00-00', '', 0, '', '', '', '', 'mscutu', 'a17645487585796534be9b035683cb99522563a2', '', '', '', 2),
(89, 'T', 'SEHABA', 'Karim', '0000-00-00', '', 0, '', '', '', '', 'ksehab', 'cfd5ddb176ec1df5f7570090bd63216d3fbd87fc', '', '', '', 2),
(90, 'T', 'SERGEEVA', 'Tatiana', '0000-00-00', '', 0, '', '', '', '', 'tserge', '7c5b6751bcfac62ad66b8b85bbdd1943c75d721f', '', '', '', 2),
(91, 'T', 'TERCINET', 'Anne', '0000-00-00', '', 0, '', '', '', '', 'aterci', 'c5e754430b9ecda784dc6b9091f318a47abd01c3', '', '', '', 2),
(92, 'T', 'VELCIN', 'Julien', '1978-03-09', '5 avenue P. Mendès-France', 69676, 'Bron', 'FRANCE', '0478772414', 'jvelcin@eric.univ-lyon2.fr', 'jvelci', 'd0ab04bfa819a501f39871bbeb2f28dc25189c45', '', 'M', 'Française', 2),
(93, 'T', 'VINCENT', 'Nicole', '0000-00-00', '', 0, '', '', '', '', 'nvince', '844a7c48062a44e4fd65c0416fb05c70e100a7dc', '', '', '', 2),
(94, 'T', 'VIOLET', 'Franck', '0000-00-00', '', 0, '', '', '', '', 'fviole', 'b141a920b93298ff72847fdea952a5fb92afbfab', '', '', '', 2),
(95, 'T', 'ZIANI', 'Ridha', '0000-00-00', '', 0, '', '', '', '', 'rziani', 'db72db8b0198665d0acd4adb46ba8db426aad0cc', '', '', '', 2),
(96, 'T', 'ZIGHED', 'Djamel Abdelkader', '0000-00-00', '', 0, '', '', '', '', 'dzighe', '012d8ca057a8df93388997b446cf9b6cb4f3fc09', '', '', '', 2),
(97, 'S', 'ABTROUN', 'Abdenour', '1984-06-25', 'AllÃ©e E logt 103. 191, Rue LÃ©on Blum Villeurbanne', 69100, 'Villeurbanne', 'FRANCE', '0612939466', 'a.abtroun@gmail.com', 'aabtro', '4b4aaaad84d4943394ebad773189da7b91aa596a', '4205c838ad4c809d34fdcb159b937260.gif', 'M', 'AlgÃ©rien', 5),
(99, 'S', 'ASSANDE', 'Koua', '1986-04-11', '4 rue du 19 Mars 1962', 69120, 'Vaulx-en-Velin', 'FRANCE', '0676571468', 'koualandry2007@hotmail.fr', 'kassan', 'aed136c9596e3207ff62a10f8bd138b1b3a044e5', '', 'M', 'IVOIRIENNE', 5),
(100, 'S', 'AZZAOUI', 'Wahid', '0000-00-00', '', 0, '', '', '', '', 'wazzao', 'bd2e77358aac10fbe550549203910bd285d7c657', '', '', '', 5),
(101, 'S', 'BOUABDELLAH', 'Sofiane', '0000-00-00', '', 0, '', '', '', '', 'sbouab', '2b59a30228783567e1802982d3891c87eed0b58a', '', '', '', 5),
(102, 'S', 'BOUCHET', 'Anne-Laure', '1988-12-05', '21 rue du Général Gouraud', 69008, 'Lyon 08', 'FRANCE', '0617512535', 'al.bouchet@gmail.com', 'abouch', '62aa00c48fb4679ad83f3af863369eec60231465', '', 'F', 'Française', 5),
(104, 'S', 'DOMPMARTIN', 'Cecile', '1988-07-10', '7 avenue debourg', 69007, 'Lyon 07', 'FRANCE', '0687701631', 'cecile.dompmartin', 'cdompm', 'e017699c37a412bc6a4fca6f9de30aefd0903922', '', 'F', 'Française', 5),
(105, 'S', 'DOUKKALI', 'Tarek', '0000-00-00', '', 0, '', '', '', '', 'tdoukk', 'f9399b9d31838d6cf2fb927866b13f2c36afda66', '', '', '', 5),
(106, 'S', 'ELFADEL', 'Fouad', '1988-08-28', '7, rue Carry ', 69003, 'Lyon 03', 'FRANCE', '0624198941', 'elfadel_fouad@hotmail.fr', 'felfad', 'c36fb27f3c73ef18b5642653226cc2c6d2b579a8', '', 'M', 'Marocaine', 5),
(107, 'S', 'FRANCO ROJAS', 'John', '1984-08-22', '29 rue du professeur Joseph Nicolas', 69008, 'Lyon 08', 'FRANCE', '0683672777', 'johnfranco2208@gmail.com', 'jfranc', 'fedb5f363285bba20facb67f3eaf8d8984e68737', '', 'M', 'Péruvienne', 5),
(108, 'S', 'GAFSI', 'Eric', '1988-09-21', '18 rue Montesquieu', 69007, 'Lyon 07', 'FRANCE', '0616048356', 'ericgafsi@gmail.com', 'egafsi', '035c819fa760f0b4d9f3552720c8e3d38506dfa0', '', 'M', 'française', 5),
(109, 'S', 'HANNACHI', 'Mabrouk', '1987-04-04', '21 rue du Général Gouraud', 69008, 'Lyon 08', 'FRANCE', '0647395058', 'mabrouk.hannachi@gmail.com', 'mhanna', '39e3c136b61eb7a06925309d801a31408fadc834', '', 'M', 'Tunisienne', 5),
(110, 'S', 'HO', 'Ly', '1987-01-16', '37 a rue Maryse Bastié', 69008, 'Lyon 08', 'FRANCE', '0643413971', 'Ly.ho@hotmail.fr', 'lho', 'c0076c80caf7bb65441c597adf0ea1451851f144', '', 'M', 'Français', 5),
(111, 'S', 'KONTE', 'Abou Daouda', '1984-05-29', 'Residence Bon accueil,Appt N94,57 Rue Longefer', 69008, 'Lyon 08', 'FRANCE', '0641981242', 'mbawabdi2@hotmail.com', 'akont', 'ba1620d059ccdeda16812cb6d5ea2212dc726ac8', '6be39445d7d0ffd6d7b784fa9f1b1325.jpg', 'M', 'Mauritanienne', 5),
(112, 'S', 'KOURDAN', 'Kawthar', '1985-11-02', 'résidence la madeleine 4, rue du sauveur', 69007, 'Lyon 07', 'FRANCE', '033618186656', 'kawtaroo@gmail.com', 'kkourd', '036c0bc0058ae51eff879282a76b60f54f872006', '', 'F', 'marocaine', 5),
(113, 'S', 'LAHLOU', 'El Mehdi', '0000-00-00', '', 0, '', '', '0629983899', 'elmehdilahlou@gmail.com', 'elahlo', '21bb30dd3dba9fdbad052a5652a2970d09080388', '', '', '', 5),
(114, 'S', 'LAPORTE-RIOU', 'Elodie', '1987-12-06', '7 rue Bellecombe', 69100, 'Villeurbanne', 'FRANCE', '0687553857', 'elodie.laporte.riou@gmail.com', 'elapor', '697b80ccbd1c666936158c1caad95001d93503af', '', 'F', 'FR', 5),
(115, 'S', 'MAURIS-DEMOURIOUX', 'Fabien', '1989-12-21', 'Pavillon 8, 10 rue Franz Liszt', 38090, 'Vaulx-Milieu', 'FRANCE', '0685625349', 'FabienMD@gmail.com', 'fmauri', '3ef2493946a668e3b95ed3c4d80d323d8259f860', '', 'M', 'Francaise', 5),
(116, 'S', 'MECHBAL', 'Souhail', '0000-00-00', '', 0, '', '', '', '', 'smechb', '2a7de00d92bef447e6264089b98792070ad65d7a', '', '', '', 5),
(117, 'S', 'NAZIH', 'Hoda', '1987-10-30', 'Grange blanche', 69008, 'Lyon 08', 'FRANCE', '0687946854', 'hoda.nazih@gmail.com', 'hnazih', '811bb6c55b22e8cd30bde1c7fc057b6edb8298b9', '', 'F', 'Marocaine', 5),
(118, 'S', 'NGUEMA NSO', 'Chandris', '1985-11-02', '259 gde rue de la guillotiere', 69007, 'Lyon 07', 'FRANCE', '0618937306', 'nchandris@hotmail.com', 'cnguem', '135c6e8cd2ab47dfbd89d5c5f0aec1790aff28d5', '', 'M', 'gabonaise', 5),
(119, 'S', 'RATSIMBAZAFY', 'Rado', '1983-08-12', '150 Cours Gambetta', 69007, 'Lyon 07', 'FRANCE', '0643901345', 'rado.ratsimbazafy@gmail.com', 'rratsi', 'e2afd95c7258299e7ed12dae6d7c78132e76a274', '', 'M', 'Malgache', 5),
(120, 'S', 'ROMANO', 'Ludovic', '0000-00-00', '', 0, '', '', '', '', 'lroman', '49d6f4699253bc0da74bcc7b5a6509792e630531', '', '', '', 5),
(121, 'S', 'SA', 'Mohamed', '1975-12-02', '7 RUE JEAN PIERRE LEVY', 69003, 'Lyon 03', 'FRANCE', '06.83.79.03.79', 'mohsa@live.fr', 'msa', '32a01d9364728c45ea98844933185bcb4b796418', '', 'M', 'FRANCAISE', 5),
(122, 'S', 'SERRAYE', 'Mohamed', '1970-11-09', '11 avenue de la victoire ', 1000, 'Bourg-en-Bresse', 'FRANCE', '0612542988', 'serraye.mohamed@voila.fr', 'mserra', '8f791594eb15dea27e54b0d51c2555c95d514c2b', '', 'M', 'française', 5),
(123, 'S', 'SOUSSI', 'Thouraya', '0000-00-00', '', 0, '', '', '', '', 'tsouss', '83f2c4e944bfa62649386e9c8ff8d3b508bdf3b8', '', '', '', 5),
(124, 'S', 'UROQOV', 'Samadjon', '1984-07-19', '2 rue Soeur Bouvier', 69005, 'Lyon 05', 'FRANCE', '0677428784', 'samadjon.uroqov@yahoo.com', 'suroqo', '4555d53b3dc89229d7b4592d720205296a6bb2d6', '', 'M', 'Ouzbékistan', 5),
(125, 'S', 'AICHOUR ', 'Rabah', '1988-11-27', '67,rue Moncey', 69003, 'Lyon 03', 'FRANCE', '0668229186', 'aichour_rabah@live.fr', 'raicho', '57466dc972bef8cf4dffdc8f3957b6d34d204836', '', 'M', 'Algérienne', 5),
(126, 'S', 'BARBALAT', 'Laure', '1978-10-28', '11 rue auguste payant', 69007, 'Lyon 07', 'FRANCE', '0681692096', 'b_laure@yahoo.com', 'lbarba', 'd1e27a5465464a16fa402abbb8398a7a65ec92db', '', 'F', 'Française', 5),
(127, 'S', 'BELGACEM', 'Malika', '0000-00-00', '', 0, '', '', '', '', 'mbelga', '1854a33b7903b097af36e881eccd17be2727801b', '', '', '', 5),
(128, 'S', 'BOA', 'Regis Herve Mian', '0000-00-00', '', 0, '', '', '', '', 'rboa', 'f034367491602837288f50f48add3924b2dd3612', '', '', '', 5),
(129, 'S', 'DRAME  ', 'Insa', '1978-09-20', '145 avenue barthelemy buyer', 69005, 'Lyon 05', 'FRANCE', '0664070230', 'insdrame007@hotmail.com', 'idrame', 'dd48d9383144ade20e30643cc4b29bc46d059841', '', 'M', 'senegalaise', 5),
(130, 'S', 'DUBOURVIEUX', 'Vincent', '1973-02-22', '279 rue claudius savoye', 69400, 'Villefranche-sur-Saô', 'FRANCE', '0616709401', 'dubourvieux.vincent@laposte.net', 'vdubou', '258b2cbb5f758441ac89f0dd0e36cc2ef9fe16e8', '', 'M', 'francais', 5),
(131, 'S', 'HAILANI', 'Faizal ', '0000-00-00', '', 0, '', '', '', '', 'fhaila', '731c56be6f58685c8cadddbc6c8662af55108eea', '', '', '', 5),
(132, 'S', 'HELLY', 'Damien', '1986-10-24', '87b rue joliot curie', 69005, 'Lyon 05', 'FRANCE', '0685080509', 'damien.helly@free.fr', 'dhelly', '7eef69913f49631ac1d2a61884f1de45236d948f', '', 'M', 'francaise', 5),
(133, 'S', 'KANNOU', 'Nizar', '0000-00-00', '', 0, '', '', '', '', 'nkanno', 'f64fa372dafd5cd12d8be878f6a3e5a623b4e283', '', '', '', 5),
(134, 'S', 'LAKEHAL', 'Kamel', '1978-08-01', '52 Avenue Marc Sangnier', 69100, 'Villeurbanne', 'FRANCE', '0665345695', 'lakehal.kam@gmail.com', 'klakeh', '0a390990326931ea49b19b3bb72f3c5fdb33f140', '', 'M', 'Française', 5),
(135, 'S', 'SEVOS', 'Stephane', '1968-09-27', '6 rue schoelcher', 69800, 'Saint-Priest', 'FRANCE', '06 68 51 15 98', 'stephane.sevos@dbmail.com', 'ssevos', 'ec3e5c91ca9e3e85938d8aaffa7ec81730832201', '', 'M', 'Française', 5),
(136, 'S', 'KRAMO', 'Koffi Alain Patrice', '0000-00-00', '', 0, '', '', '', '', 'kkramo', '90f24f8d843436e9ac978a1c13ae412ee6d7183b', '', '', '', 5),
(137, 'S', 'ARHMANE EL AKEB', 'Mohamed', '0000-00-00', '', 0, '', '', '', '', 'marhma', 'c676b96e4e05a698cd61273504d677726339925c', '', '', '', 5),
(138, 'S', 'MEFTAH', 'Guelmine', '0000-00-00', '', 0, '', '', '', '', 'gmefta', '555b6692358040a53a40af9cf03f9d3038f1ed4c', '', '', '', 5),
(139, 'S', 'ABOUBACAR', 'Samine', '0000-00-00', '3 rue Louis Loucheur', 69009, 'Lyon 09', 'FRANCE', '0651335424', 'samine.aboubcar@gmail.com', 'saboub', 'cdadda109c209af62f4df179fe681c674f9f8536', '', 'M', 'fr', 5),
(140, 'S', 'AGHADJANIAN', 'Marine', '0000-00-00', '18 rue Lieutenant-Colonel Girard', 69007, 'Lyon 07', 'FRANCE', '0679585682', 'marine.aghadjanian@gmail.com', 'maghad', '0a6a5cf0b1562d7574dc6291eafcae20d2538b7c', '', 'F', 'Française', 5),
(141, 'S', 'BABOU', 'Assiati', '1989-07-13', '115, avenue Général Frère Résidence U Croix Du Sud Ch 620', 69008, 'Lyon 08', 'FRANCE', '0666438893', 'assiati.babou@live.fr', 'ababou', '7da05838c143be2c7f899bd89ec0bfa87d84cb5f', '', 'F', 'Française', 5),
(142, 'S', 'BIGAUD', 'Laetitia', '1988-06-20', '25, rue henri pensier', 69008, 'Lyon 08', 'FRANCE', '0659816030', 'laetitia.bigaud@yahoo.fr', 'lbigau', '6664f7722051cef1a18e72a29e227be735453060', '', 'F', 'Française', 5),
(143, 'S', 'BOULANGER', 'Mathilda', '1991-03-07', '225 avenue franklin roosevelt', 69500, 'Bron', 'FRANCE', '0675475098', 'mathilda-boulanger@hotmail.fr', 'mboula', 'f6f389258ed7230989c0cd6fd1e35c05d0f1bd10', '', 'F', 'francaise', 5),
(144, 'S', 'CHOLLIER', 'Julie', '1989-01-15', 'julie.chollier@orange.fr', 69500, 'Bron', 'FRANCE', '0681224226', 'julie.chollier@orange.fr', 'jcholl', '536aac0ae4c60f0c391038921f0b9a92bfb62de4', '', 'F', 'française', 5),
(145, 'S', 'COLOMBET', 'Lucas', '1991-01-08', '15 rue professeur morat', 69008, 'Lyon 08', 'FRANCE', '0662262426', 'lucascolombet@msn.com', 'lcolom', '472167eeffea1d75b1fdbbe096c557229f6da6c5', '', 'M', 'France', 5),
(146, 'S', 'ELGUIZANI', 'Nicola', '0000-00-00', '', 0, '', '', '', '', 'nelgui', '9f0b157de0eea0cd5887750c061316648b4b94f8', '', '', '', 5),
(147, 'S', 'ESPENEL', 'Kevin', '1991-12-07', '15 rue paul bourget', 69330, 'Meyzieu', 'FRANCE', '0675758745', 'espenel.kevin@orange.fr', 'kespen', '88675c925ea9dd0f15653f8351793f6000de7cf1', '', 'M', 'française', 5),
(148, 'S', 'GERBOLINO', 'Florent', '1991-05-29', '3 rue des dentellières', 69740, 'Genas', 'FRANCE', '06 72 83 14 24', 'florent.gerbolino@univ-lyon2.fr', 'fgerbo', '2bc7bb02b16befd5a150f6f8dbf04dec3a203a6c', '', 'M', 'Française', 5),
(149, 'S', 'HAIDARA', 'Badi', '1992-06-18', '149 route de vienne', 69008, 'Lyon 08', 'FRANCE', '0629468981', 'badihaidara@gmail.com', 'bhaida', 'cc0789f590181d1df1a85145900b59696701fd4e', '', 'M', 'Malienne', 5),
(150, 'S', 'HAJADI', 'Jabrane', '1990-03-03', '58 rue saint michel 69007 Lyon', 69007, 'Lyon 07', 'FRANCE', '0622377488', 'hajadi.jabrane@gmail.com', 'jhajad', '01c020a96a6f5b31812d65ab092ae8902d2d9f68', '', 'M', 'Marocaine', 5),
(151, 'S', 'HUO ', 'Guang', '1988-11-10', '183 rue Emile Zola', 69100, 'Villeurbanne', 'FRANCE', '0678417689', 'huoguang521@hotmail.com', 'ghuo ', 'e7a833c14d0ae6af3cf18da3fde74ebeb8f46a8a', '', 'M', 'Chinois', 5),
(152, 'S', 'HUYNH', 'Ngoc Huyen Tram', '1989-10-17', '13 Rue d''Hanoi - Ch. 1002', 69100, 'Villeurbanne', 'FRANCE', '0614641964', 'huynh.nh.tram@gmail.com', 'nhuynh', 'b88b779707db6b6f2bfd54cde93734ce439de463', '', 'F', 'Vietnamienne', 5),
(153, 'S', 'JEDIDI', 'Samine', '0000-00-00', '', 0, '', '', '', '', 'sjedid', '29a4a59812e29fd6af8b339dcc13f9771d18a908', '', '', '', 5),
(154, 'S', 'KHEDDACHE', 'Achour', '1987-09-04', '52rue henri legay villeurbanne', 69100, 'Villeurbanne', 'FRANCE', '06 66 00 29 52', 'khachour@live.com', 'akhedd', '41fd85566c6582340bdcd3297f22299e8ae746f7', '', 'M', 'algérienne', 5),
(155, 'S', 'LEVEL', 'Thibaut', '1989-06-21', '37 rue d''alsace', 69800, 'Saint-Priest', 'FRANCE', '0629612927', 'thibaut.level@gmail.com', 'tlevel', '35695c6cc6b8d3c043fe12cbff8874a6b8a4efb3', '', 'M', 'Française', 5),
(156, 'S', 'MARECHAL', 'Celine', '1991-07-05', '5 Impasse Ferret', 69008, 'Lyon 08', 'FRANCE', '0610708561', 'celine-marechal@hotmail.fr', 'cmarec', '9e677f52c7ad0eb75a92aa2f6a310c9a02ef92e0', '', 'F', 'Française', 5),
(157, 'S', 'MERLI', 'Vincent', '0000-00-00', '', 0, '', '', '', '', 'vmerli', 'aaddf2b89126e4ac65c5ea2dc645ca63cf44ae7e', '', '', '', 5),
(158, 'S', 'MOSCHEL', 'Thomas', '1991-11-06', '26 cours verdun', 69002, 'Lyon 02', 'FRANCE', '0668262704', 'thomas91.moschel@orange.fr', 'tmosch', '181f88b276c21bd244b3a22fa5a75c9055cb037e', '', 'M', 'Française', 5),
(159, 'S', 'NDIAYE', 'Mouhamadou Lamine', '0000-00-00', '', 0, '', '', '', '', 'mndiay', '0c024013196186bb65a70627eba50af687c516bc', '', '', '', 5),
(160, 'S', 'NGUYEN', 'Cam Nhung', '1987-02-04', '151avBerthelot', 69007, 'Lyon 07', 'FRANCE', '0685140259', 'vitbeo_verseau@yahoo.com', 'cnguye', '683947259f7cce68a05edcfbcbac598b87b42556', '', 'F', 'Vitnamienne', 5),
(161, 'S', 'OLIVA', 'Guillaume', '1991-01-31', '3 Montée du Gourguillon', 69005, 'Lyon 05', 'FRANCE', '33650106462', 'guillaume.oliva@gmail.com', 'goliva', 'a21cc44791fe3480ba39497cd91af674be67616e', '', 'M', 'Française', 5),
(162, 'S', 'SAMRAOUI', 'Hamza', '0000-00-00', '', 0, '', '', '', '', 'hsamra', '17e199bacb0696f5ed6a34864c5480ff75c83f85', '', '', '', 5),
(163, 'S', 'Sy', 'Abdoul', '1989-11-20', '9 bis rue chambovet', 69003, 'Lyon 03', 'FRANCE', '0631024568', 'syabdoul05@yahoo.fr', 'asy', 'f479508c86855a0fbf3e613a9bf850b69ab9e18b', '', 'M', 'sénégalaise', 5),
(164, 'S', 'TEKLE', 'Selam', '1989-07-22', '32 rue du Docteur Rebatel', 69003, 'Lyon 03', 'FRANCE', '0622602726', 'selam.tiruneh@yahoo.com', 'stekle', '0d8d97ff05a228f235a809e64ad47f6a46156ea3', '', 'F', 'Ethiopienne', 5),
(165, 'S', 'ADRIANO', 'Brice', '0000-00-00', '', 0, '', '', '', '', 'badria', '9bc2112e07d33002a6cd2020e9e60314bb9acac9', '', '', '', 5),
(166, 'S', 'ALI', 'Halifanie', '0000-00-00', '', 0, '', '', '', '', 'hali', '3283723445c816ead6c1b7453bcb6ce3bd7b16e5', '', '', '', 5),
(167, 'S', 'ALLEGUI', 'Ilham', '0000-00-00', '', 0, '', '', '', '', 'ialleg', 'fb8be58f67e92fc08966b0c5d7b5276690ab79a0', '', '', '', 5),
(168, 'S', 'AYAS', 'Maryama', '0000-00-00', '', 0, '', '', '', '', 'mayas', 'ba04f9b8e89b27aabb14e97807b035e995876605', '', '', '', 5),
(169, 'S', 'AZZOUG', 'Anissa', '0000-00-00', '', 0, '', '', '', '', 'aazzou', 'd62411b6f7bb8332b5604ad4f9bbd7d81c93e660', '', '', '', 5),
(170, 'S', 'BA', 'Ndeye Ramatoulaye', '0000-00-00', '', 0, '', '', '', '', 'nba', '448b8b970d1a944e9aa860dc7f79e5bf1a84bafa', '', '', '', 5),
(171, 'S', 'BATELLERIE', 'Clothilde', '0000-00-00', '', 0, '', '', '', '', 'cbatel', 'e3c0e7712191863fba74c299287d174a3f2e3e7d', '', '', '', 5),
(172, 'S', 'BELARIBI', 'Souleimane', '0000-00-00', '', 0, '', '', '', '', 'sbelar', '8029b27ae4d00d6bb1bc7989fcfca2a999b6bfe7', '', '', '', 5),
(173, 'S', 'BELIN', 'Florent', '0000-00-00', '', 0, '', '', '', '', 'fbelin', 'f4cd83d1d23049c9e0e3e2f524f793e5837c76ab', '', '', '', 5),
(174, 'S', 'BEN JANET', 'Makrem', '0000-00-00', '', 0, '', '', '', '', 'mben j', 'f1fc0dee70ec089d9fe652b7343f54cb29c26b95', '', '', '', 5),
(175, 'S', 'BOUAOUN', 'Amna', '0000-00-00', '', 0, '', '', '', '', 'abouao', 'e56d109272d43b4821ecafe884436508102e6351', '', '', '', 5),
(176, 'S', 'BOUAZIZ', 'Jamal Eddine', '0000-00-00', '', 0, '', '', '', '', 'jbouaz', '0e3f43d05b4de2e15ca2be130aa9a8c7640420c1', '', '', '', 5),
(177, 'S', 'BOUCHEFRA', 'Ferhat', '0000-00-00', '', 0, '', '', '', '', 'fbouch', '903973bb6747a5ed247ac5028c88a45fccc7f084', '', '', '', 5),
(178, 'S', 'BOUSLAH', 'Ahmed', '0000-00-00', '', 0, '', '', '', '', 'abousl', '5765f334220649ac80f5dec3dc64864ebb5a3ec1', '', '', '', 5),
(179, 'S', 'BOUSSION', 'Aurelien', '0000-00-00', '', 0, '', '', '', '', 'abouss', '0858b8a9c980925a6545890fe90643ad83e80171', '', '', '', 5),
(180, 'S', 'BOUTEILLE', 'Margot', '0000-00-00', '', 0, '', '', '', '', 'mboute', 'af97df095797f7faa11838c7085f770c940f86fb', '', '', '', 5),
(181, 'S', 'BOUVRY', 'Come', '0000-00-00', '', 0, '', '', '', '', 'cbouvr', 'a4a1ecc2f17ad9adafb583e34850c7271b668464', '', '', '', 5),
(182, 'S', 'BROTTIER', 'Lucile', '0000-00-00', '', 0, '', '', '', '', 'lbrott', '65ec811983bc325f1a846321e57c0a59cd7d09de', '', '', '', 5),
(183, 'S', 'CARCIOFO', 'Clement', '0000-00-00', '', 0, '', '', '', '', 'ccarci', '6cb229ba69185a5ba579037b168f394117e465e8', '', '', '', 5),
(184, 'S', 'CHAKER', 'Aiman', '0000-00-00', '', 0, '', '', '', '', 'achake', '52d7f25ecbe828c846c9bc26a392922f3d8a7cfa', '', '', '', 5),
(185, 'S', 'CHEN', 'Yanbo', '0000-00-00', '', 0, '', '', '', '', 'ychen', 'a44f1bcde5cdd23b3e9c77e851649f216e680e85', '', '', '', 5),
(186, 'S', 'CLOT', 'Maxence', '0000-00-00', '', 0, '', '', '', '', 'mclot', '9803e4958d6ff3fa6c264511eea0288388a9920c', '', '', '', 5),
(187, 'S', 'CO', 'Isabelle', '0000-00-00', '', 0, '', '', '', '', 'ico', '8ceb289ff73d669cb7d736ca2cc8d7605472ef92', '', '', '', 5),
(188, 'S', 'CONTE', 'Francois', '1989-02-27', '6, rue Audibert et Lavirotte', 69008, 'Lyon 08', 'FRANCE', '0649175951', 'conte.fr@gmail.com', 'fconte', 'c997c825e59a208d2115240741b7775b909eaaa8', '', 'M', 'Française', 5),
(189, 'S', 'DANG', 'Tuong-Vi', '0000-00-00', '', 0, '', '', '', '', 'tdang', '3c82d486b36c975af1c2c6d63f9b8613f2cae90b', '', '', '', 5),
(190, 'S', 'DELENCRE', 'Brian', '0000-00-00', '', 0, '', '', '', '', 'bdelen', '88828751e42004317e41e7dbb2d6846b7393e2e3', '', '', '', 5),
(191, 'S', 'DELPUECH', 'Mathieu', '0000-00-00', '', 0, '', '', '', '', 'mdelpu', '59123f51e5bf93f3a237ccd43f734b0d64e164ce', '', '', '', 5),
(192, 'S', 'DESBAS', 'Elodie', '0000-00-00', '', 0, '', '', '', '', 'edesba', '30184139ec196056a3c40f8a915bc4cdfdf302cb', '', '', '', 5),
(193, 'S', 'DESOMBRE', 'Amandine', '0000-00-00', '', 0, '', '', '', '', 'adesom', '2386b632bf7ddda91adb9edfc0a310f452dfb9d1', '', '', '', 5),
(194, 'S', 'DIALLO', 'Mamadou Idiatou', '0000-00-00', '', 0, '', '', '', '', 'mdiall', 'c12ef0239330822cb8dd06c73bc0a97412dd93da', '', '', '', 5),
(195, 'S', 'DIALLO', 'Yaya', '0000-00-00', '', 0, '', '', '', '', 'ydiall', 'ad9f7b33928a03ef67620b7a71cbaf2fe1232ff9', '', '', '', 5),
(196, 'S', 'DIALLO', 'Mamadou Kolon', '0000-00-00', '', 0, '', '', '', '', 'mdiall2', '364bb4e587cdaec6e6974bb8077f98d43ecdb099', '', '', '', 5),
(197, 'S', 'DIBASSI', 'Mohamed', '0000-00-00', '', 0, '', '', '', '', 'mdibas', '4663d68c582f00c10872470bfdc92ce92ae2c85b', '', '', '', 5),
(198, 'S', 'DIOP', 'Mody Atemane', '0000-00-00', '', 0, '', '', '', '', 'mdiop', '6e4e4d040fe68b102b87dbf23b26ee2488d35e28', '', '', '', 5),
(199, 'S', 'DURAND', 'Emilie', '0000-00-00', '', 0, '', '', '', '', 'eduran', 'ba092dcc7ae581d1fb94d891c0e395de01927ea6', '', '', '', 5),
(200, 'S', 'FELFLI', 'Ibrahim', '0000-00-00', '', 0, '', '', '', '', 'ifelfl', '6ec986afd844dd151a692d42308797296e034afa', '', '', '', 5),
(201, 'S', 'FERRET', 'Romain', '0000-00-00', '', 0, '', '', '', '', 'rferre', '4ed944a93a147beafcc3740bea59927bf2585ac3', '', '', '', 5),
(202, 'S', 'GEAY', 'Alexandre', '0000-00-00', '', 0, '', '', '', '', 'ageay', '093327ceb3dca6f610153b61400a352abb65347a', '', '', '', 5),
(203, 'S', 'GHOMRANI', 'Mohamed Khoudir', '0000-00-00', '', 0, '', '', '', '', 'mghomr', 'd46dd5ff38a061a4f32354d8f7e5ab9bd9ed3d5d', '', '', '', 5),
(204, 'S', 'GRAND', 'Loic', '0000-00-00', '', 0, '', '', '', '', 'lgrand', '0133473849c11869d1f718d52670bd3f20b1da54', '', '', '', 5),
(205, 'S', 'GUIGUE', 'Quentin', '0000-00-00', '', 0, '', '', '', '', 'qguigu', 'ca0276e948c732db977d17a0d30d682f710df7e0', '', '', '', 5),
(206, 'S', 'HA', 'Yvan', '0000-00-00', '', 0, '', '', '', '', 'yha', 'f8e5c4df433e8e80171a50b031c21bc4f3e505ed', '', '', '', 5),
(207, 'S', 'HAGGUI', 'Mohamed El Hedi', '0000-00-00', '', 0, '', '', '', '', 'mhaggu', '7c962ae7274e11f65b763ff5d1c1058caa4f5623', '', '', '', 5),
(208, 'S', 'HAMANN', 'Sylvain', '0000-00-00', '', 0, '', '', '', '', 'shaman', 'e6932769602dba957f43f8f879798f007cdff15c', '', '', '', 5),
(209, 'S', 'HUYNH NGO', 'Uyen Kim', '0000-00-00', '', 0, '', '', '', '', 'uhuynh', '8207b01a150c8be01bb07333d150549de4e1d154', '', '', '', 5),
(210, 'S', 'ILIE ', 'LAURENTIU', '0000-00-00', '', 0, '', '', '', '', 'lilie ', '15894785dac2860a90b4f4b7194cb0815fd879a5', '', '', '', 5),
(211, 'S', 'KADEM', 'SOPHIANE', '0000-00-00', '', 0, '', '', '', '', 'skadem', '5e1f682b895305bccaf7bc488f4bd2351dc8d0a6', '', '', '', 5),
(212, 'S', 'KILENDO', 'PHILIPPE', '0000-00-00', '', 0, '', '', '', '', 'pkilen', 'e7df5f7e5fdca7951bd9d1ab7fc4395a720d89ea', '', '', '', 5),
(213, 'S', 'KIMENAU', 'JEAN-YVES', '0000-00-00', '', 0, '', '', '', '', 'jkimen', '76d9e72e20c5dea990210f079aa26dd7c6a68d75', '', '', '', 5),
(214, 'S', 'LABED', 'ABDELGHANI', '0000-00-00', '', 0, '', '', '', '', 'alabed', 'b49294da8a34f1649401afd4af346ffe8367fd4b', '', '', '', 5),
(215, 'S', 'LOMBARD', 'FLAVIEN', '0000-00-00', '', 0, '', '', '', '', 'flomba', '72bc7490f4cc5ffd1536c6c9fc27bb10ec849aa6', '', '', '', 5),
(216, 'S', 'LOUKILI', 'AYYOUB', '0000-00-00', '', 0, '', '', '', '', 'alouki', '12a356219e3a6962b454343db535114cadfb5239', '', '', '', 5),
(217, 'S', 'LY', 'MAMADOU', '0000-00-00', '', 0, '', '', '', '', 'mly', '4a321c1710f44e746565c15a3de9aec941669bb1', '', '', '', 5),
(218, 'S', 'MAAMAR', 'ARWA', '0000-00-00', '', 0, '', '', '', '', 'amaama', '33da9dcba89bf0022077f41722442461ca03fa66', '', '', '', 5),
(219, 'S', 'MARSAN', 'CALEB EMMANUEL', '0000-00-00', '', 0, '', '', '', '', 'cmarsa', 'aa91d46d47bcc85c41d297cebde86a2b7e466255', '', '', '', 5),
(220, 'S', 'MATHLOUTHI', 'AMAL', '0000-00-00', '', 0, '', '', '', '', 'amathl', '1376e51014661566a08a83dc6c0ab4c83f510ef1', '', '', '', 5),
(221, 'S', 'MAZEROLLE', 'FLORA', '0000-00-00', '', 0, '', '', '', '', 'fmazer', 'dca63ca3c69d7a65c17304799a9376a38b9685c6', '', '', '', 5),
(222, 'S', 'MBUMBA', 'LAETITIA', '0000-00-00', '', 0, '', '', '', '', 'lmbumb', '3ac0d2c4f425ac498f7af261ea67b6f84ebef173', '', '', '', 5),
(223, 'S', 'MENETRIER', 'DEBORAH', '0000-00-00', '', 0, '', '', '', '', 'dmenet', 'd01822d282564e8a9ad5bbb087a980bb71ad3ec0', '', '', '', 5),
(224, 'S', 'MESQUITA', 'GAELLE', '0000-00-00', '', 0, '', '', '', '', 'gmesqu', 'a042e219a705ce84cce6ae3ab12bca4680337b90', '', '', '', 5),
(225, 'S', 'MOKRAOUI', 'YUVA', '0000-00-00', '', 0, '', '', '', '', 'ymokra', '65e8313c43c4f424a798e426b0212f8fe45f1650', '', '', '', 5),
(226, 'S', 'MOUSSA ISMAEL', 'HOUMED', '0000-00-00', '', 0, '', '', '', '', 'hmouss', 'da0e9be826cb5f645d7f8a195a32ab701a9ee360', '', '', '', 5),
(227, 'S', 'NICOLAS', 'VINCENT', '0000-00-00', '', 0, '', '', '', '', 'vnicol', '67df1b3a375126fe4021e68251dd242e9bbd5e06', '', '', '', 5),
(228, 'S', 'OUEDGHIRI', 'HAMZA', '0000-00-00', '', 0, '', '', '', '', 'houedg', 'f7dc9c017498adb6b5c358fe6f69648e52d7fc24', '', '', '', 5),
(229, 'S', 'OULDALI', 'YANNIS', '0000-00-00', '', 0, '', '', '', '', 'youlda', '1a38dae6adc71bb53b0d17697cee3ea384bddbef', '', '', '', 5),
(230, 'S', 'PERRIN', 'CHARLES', '0000-00-00', '', 0, '', '', '', '', 'cperri', '2892e9e723d43283c0eab10cb6b5d7195bfbf5c5', '', '', '', 5),
(231, 'S', 'PETERS', 'ALEXANDRE', '0000-00-00', '', 0, '', '', '', '', 'apeter', 'e26a274ccb5594328638fa2d73f972a19e2b0e40', '', '', '', 5),
(232, 'S', 'POULIN', 'VICTOR', '0000-00-00', '', 0, '', '', '', '', 'vpouli', 'ddb421589bda12490a0701894671f7c1b743d439', '', '', '', 5),
(233, 'S', 'RAUSCHER', 'GANAEL', '0000-00-00', '', 0, '', '', '', '', 'grausc', '0d072c4f3400e265e75bc347beacfafbcada55f7', '', '', '', 5),
(234, 'S', 'ROJTHONGKUM', 'NARUMON', '0000-00-00', '', 0, '', '', '', '', 'nrojth', '6bb356034c6351d31ef74fd836001a5a1107a211', '', '', '', 5),
(235, 'S', 'SMET', 'PIERRICK', '0000-00-00', '', 0, '', '', '', '', 'psmet', '2aca2a7c91c10d3cf7dea3b54581ef94d5e35d9d', '', '', '', 5),
(236, 'S', 'SOULENQ', 'BASTIEN', '0000-00-00', '', 0, '', '', '', '', 'bsoule', 'c2d732e48e43332576e0fd83bc26a3ada9c155ed', '', '', '', 5),
(237, 'S', 'SOW', 'DJERY', '0000-00-00', '', 0, '', '', '', '', 'dsow', '49aa4e7962a0d448010a94936ce33a7e5a3ec28e', '', '', '', 5),
(238, 'S', 'TORKHANI', 'ADLI', '0000-00-00', '', 0, '', '', '', '', 'atorkh', 'ae97c90f0c9adb65dfd328c64239b315c6056440', '', '', '', 5),
(239, 'S', 'TRAORE', 'DAOUDA', '0000-00-00', '', 0, '', '', '', '', 'dtraor', '295eb9f7ac5bf8c49a9bd4a93869f489751507ee', '', '', '', 5),
(240, 'S', 'YAYA', 'CHERIFF', '0000-00-00', '', 0, '', '', '', '', 'cyaya', 'bfb390ed968b0914d11188405e3c9da7f623ab83', '', '', '', 5),
(241, 'S', 'ZHOU', 'YU', '0000-00-00', '', 0, '', '', '', '', 'yzhou', '6910fc202e58e9d18294d7fc7eb708fe8448a167', '', '', '', 5),
(242, 'S', 'ZIHNIOGLU', 'MERIH', '0000-00-00', '', 0, '', '', '', '', 'mzihni', '9687d6a377205c488542b84e2cef7098035a4161', '', '', '', 5),
(243, 'S', 'AGBOKOU', 'Kafui', '0000-00-00', '', 0, '', '', '', '', 'kagbok', 'ee5f5cfd6d8103ea0d5b6ce920a907530e87c73b', '', '', '', 5),
(244, 'S', 'BEAUSSE', 'William', '0000-00-00', '', 0, '', '', '', '', 'wbeaus', 'a19c4deb062573639c5061c08e28f339f202cef8', '', '', '', 5),
(245, 'S', 'BILOCQ', 'Simon', '0000-00-00', '', 0, '', '', '', '', 'sbiloc', '55f2f6dd6c30bccea0e20addf09c8e97ced2abfb', '', '', '', 5),
(246, 'S', 'CORROY', 'Benjamin', '0000-00-00', '', 0, '', '', '', '', 'bcorro', 'abfcd8fb847c914ccba83732f805e533f35a8f71', '', '', '', 5),
(247, 'S', 'DAOUAYRY', 'Nassia', '0000-00-00', '', 0, '', '', '', '', 'ndaoua', 'fa88b55ece3e60302cafe55c36127e2df9bfbfbd', '', '', '', 5),
(248, 'S', 'DEMOTS', 'Antoine', '0000-00-00', '', 0, '', '', '', '', 'ademot', 'fd8ae1f1e577b0502c2fe547f3601c07cbb4b1ad', '', '', '', 5),
(249, 'S', 'DESCHANELS', 'Anais', '1988-10-20', '6 impasse des griottes', 13103, 'Saint-Étienne-du-Grè', 'FRANCE', '0684053119', 'deschanels.anais@gmail.com', 'adesch', '2015449e0f713d74697b4ade8a77cb180f10250f', '', 'F', 'française', 5),
(250, 'S', 'DOUALEH', 'Wais', '0000-00-00', '', 0, '', '', '', '', 'wdoual', '2d3216a01219197fc3e8afc1e38a811c04e0827e', '', '', '', 5),
(251, 'S', 'FORISSIER', 'Vincent', '1987-05-26', '38 Rue Bugeaud', 69006, 'Lyon 06', 'FRANCE', '06 75 15 39 58', 'vincent.forissier@univ-lyon2.fr', 'vforis', '184aacbb78b3f2119c0c75e8ac8de56300643952', '', 'M', 'Française', 5),
(252, 'S', 'FOURNEL', 'Eric', '0000-00-00', '', 0, '', '', '', '', 'efourn', 'f829393f2b9c4a6b6f29b945d3c32091e702c063', '', '', '', 5),
(253, 'S', 'IPOUKA IPOUKA', 'Ulrich', '0000-00-00', '', 0, '', '', '', '', 'uipouk', '4dfc0af0c053d03d02a7bfea96fa67eea1d7c986', '', '', '', 5),
(254, 'S', 'LETELLIER', 'Florian', '0000-00-00', '', 0, '', '', '', '', 'fletel', '71bea2532f1ce0d313f8351d8f01b86ae06b15bc', '', '', '', 5),
(255, 'S', 'MALAM HACHIROU', 'Moujitaba', '0000-00-00', '', 0, '', '', '', '', 'mmalam', '8df15a74ef178f9c2ce5c420c65b8ff7d5842be7', '', '', '', 5),
(256, 'S', 'MANFREDI (LACROIX)', 'Isabelle', '0000-00-00', '', 0, '', '', '', '', 'imanfr', '4d99b2f547960ba3d07df726aa764f44cc2a86e7', '', '', '', 5),
(257, 'S', 'MARVIE', 'Jonathan', '0000-00-00', '', 0, '', '', '', '', 'jmarvi', '9f51da6227ee4ccbd71c5a7b9e3559459cf9a6ce', '', '', '', 5),
(258, 'S', 'NASSAR', 'Roy', '0000-00-00', '', 0, '', '', '', '', 'rnassa', 'a8517c70fdf8afc452079b54380af1792dd5ab50', '', '', '', 5),
(259, 'S', 'NUNES CLARO', 'Alexandra', '1989-03-31', '33 rue longarini', 69700, 'Givors', 'FRANCE', '0612910986', 'a.claro@hotmail.fr', 'anunes', 'ac03a4f4100d8256ac617b2701c7572f98388f72', '', 'F', 'française', 5),
(260, 'S', 'PACQUELET', 'Laura', '1988-04-26', '33 rue gabriel sarrazin', 69008, 'Lyon 08', 'FRANCE', '0681713736', 'laura.pacquelet@gmail.com', 'lpacqu', '5d4fb464e74deb962d960c35618b75949e4d4fb6', '', 'F', 'française', 5),
(261, 'S', 'SAVOYAT', 'Dorian', '0000-00-00', '', 0, '', '', '', '', 'dsavoy', 'a07611e269a7d23d5238a30250d133cdbf5775de', '', '', '', 5),
(262, 'S', 'TARDY', 'Marie', '0000-00-00', '', 0, '', '', '', '', 'mtardy', 'a4ead15f63adcc48984f258e6f63a036f29dfcd4', '', '', '', 5),
(263, 'S', 'TRIANDE', 'Idriss', '1987-03-07', '145 avenue Jean Jaurès', 69007, 'Lyon 07', 'FRANCE', '06.61.71.47.56', 'drish5@hotmail.com', 'itrian', 'a13b3704c7213c264ce2127aa34e916663bce5b7', '', 'M', 'Burkinabé', 5),
(264, 'S', 'ADANGNIDO', 'Diane', '0000-00-00', '', 0, '', '', '', '', 'dadang', '7f1d20ad24d2486d794eb693de4b71870cab6aef', '', '', '', 5),
(265, 'S', 'BELKHEIR', 'Iklass', '0000-00-00', '', 0, '', '', '', '', 'ibelkh', '40b16ecb2e44b237b4194f789d11ceede2d9d02d', '', '', '', 5),
(266, 'S', 'BENZINE', 'Hafaied', '1971-02-14', 'Charpennes 13 Rue DHanoi', 69100, 'Villeurbanne', 'FRANCE', '0666065681', 'benzine.hafaied@gmail.com', 'hbenzi', 'b7ec5a6ce86444db3751457fc5b48c54c017b5b0', '', 'M', 'Algerienne', 5),
(267, 'S', 'BOLY', 'Cheick Ismael', '1982-11-23', '135 Grande rue Saint Clair', 69300, 'Caluire-et-Cuire', 'FRANCE', '0622589334', 'cheickson@gmail.com', 'cboly', 'dfdbf48e0be13e01301d188e54af4fcac04f4360', '', 'M', 'Burkinabé - Burkina Faso', 5),
(268, 'S', 'BONNET', 'Casimir Pierre-Elie', '0000-00-00', '77 rue Chevreul', 69007, 'Lyon 07', 'FRANCE', '0650612550', 'caz.san@gmail.com', 'cbonne', 'e1104cabaecaba6ce6e1ad01106d6c8c7d030311', '', 'M', 'Fran', 5),
(269, 'S', 'BOUDJAHFA', 'Nabil', '0000-00-00', '', 0, '', '', '', '', 'nboudj', '0cfb835d593a290c0d218bceaeb17689836059b2', '', '', '', 5),
(270, 'S', 'BOUHNICH', 'Houssem', '0000-00-00', '', 0, '', '', '', '', 'hbouhn', 'e5d0cd8c08b82d011d69283755fbd431f45bba65', '', '', '', 5),
(271, 'S', 'BOUKERCHE', 'Farid', '0000-00-00', '', 0, '', '', '', '', 'fbouke', '463fef2033cdc715ef210f59f1c578f14c24b42a', '', '', '', 5),
(272, 'S', 'CONG', 'Yuanyuan', '0000-00-00', '', 0, '', '', '', '', 'ycong', 'cc076b5cb59c989ee188d97ded14823ccc259790', '', '', '', 5),
(273, 'S', 'DAVID', 'Jerome', '0000-00-00', '', 0, '', '', '', '', 'jdavid', 'b1084242e9f351dc77851edfe16260324b106ec0', '', '', '', 5),
(274, 'S', 'DHIF', 'Youssef', '0000-00-00', '', 0, '', '', '', '', 'ydhif', '2e2637e621ac56f782fe24bda6021dc07138e553', '', '', '', 5),
(275, 'S', 'ESSAKHI', 'Nawal', '0000-00-00', '', 0, '', '', '', '', 'nessak', 'dd9959f6f0987e89c9d90b20618aa68a7bac41c6', '', '', '', 5),
(276, 'S', 'GRATALOUP', 'Fabrice', '0000-00-00', '', 0, '', '', '', '', 'fgrata', '54427dbc4f71c28fd44e76ca3cb17802cd7ff8fb', '', '', '', 5),
(277, 'S', 'JORLAND', 'Lionel', '0000-00-00', '', 0, '', '', '', '', 'ljorla', '59130b4b932486bf6acf40e7332f2e1e919547cb', '', '', '', 5),
(278, 'S', 'KADDOUR BRAHIM', 'Fatima Zohra', '0000-00-00', '', 0, '', '', '', '', 'fkaddo', '7f635fca402123b2b7994ab0b3607ce3310c0e38', '', '', '', 5),
(279, 'S', 'KANE', 'Fatimata Mohamed El Ghaly', '1986-05-17', '34,rue saint maurice', 69008, 'Lyon 08', 'FRANCE', '0699984529', 'fatimatakane2001@yahoo.fr', 'fkane', 'cdf53a6aa0be125721b21f3a2e56e7f65f40ab30', '', 'F', 'Mauritanienne', 5),
(280, 'S', 'MAHAMI', 'Riad', '0000-00-00', '', 0, '', '', '', '', 'rmaham', '1e22cc32f4d3a49976b5d0c2fbe4bf83b5d26dc0', '', '', '', 5),
(281, 'S', 'MOUKOUYI', 'Kelamio', '0000-00-00', '102 Avenue Général Frère', 69008, 'Lyon 08', 'FRANCE', '0626713039', 'moukouyi.kelamio@gmail.com', 'kmouko', '3a1bd5e8898b3e7da1334fb31ed4ce4a3dfbf09e', '', 'M', 'Congolaise', 5),
(282, 'S', 'MRHIZOU', 'Mohamed Amine', '0000-00-00', '', 0, '', '', '', '', 'mmrhiz', 'ac7e83610171ed3d3938f1ee6dbbf39e986da88e', '', '', '', 5),
(283, 'S', 'SADOUNE', 'Ahmed', '0000-00-00', '', 0, '', '', '', '', 'asadou', '0a4a7423e413d0e62fe96558683f28e164e49239', '', '', '', 5),
(284, 'S', 'SAIM', 'Mohammed El Amin', '1982-04-04', '132 rue des pilastres', 95280, 'Jouy-le-Moutier', 'FRANCE', '0658339420', 'aminhe@hotmail.com', 'msaim', '5916ed2abd2af17892e26c0c9be879700830b364', '', 'M', 'Algerienne', 5),
(285, 'S', 'SAMBA DEHLOT', 'Frederika', '0000-00-00', '', 0, '', '', '', '', 'fsamba', '0e9e76fcec35906f37ab2d2f00b7ffbad85dd527', '', '', '', 5),
(286, 'S', 'VELLUTINI', 'Christophe', '1987-01-23', '7 avenue debourg', 69007, 'Lyon 07', 'FRANCE', '0627118904', 'christophe.vellutini@gmail;com', 'cvellu', 'aecfe7e6d309c94c88c60ddf3371346670f9e882', '', 'M', 'Français', 5),
(287, 'S', 'ZEDI', 'Jordan', '0000-00-00', '', 0, '', '', '', '', 'jzedi', '08dd323274b19fd381857a70a88d09a7057bbb80', '', '', '', 5),
(288, 'S', 'AMMARI', 'Salaheddine', '0000-00-00', '', 0, '', '', '', '', 'sammar', '7f2027794684ee1afaf1e8aeef4a086933aa091b', '', '', '', 5),
(289, 'S', 'BALDE', 'Thierno Idrissa', '0000-00-00', '', 0, '', '', '', '', 'tbalde', '4e172922de1a173c81e36ea7ca023bce70f62169', '', '', '', 5),
(290, 'S', 'BAY', 'Pierre', '0000-00-00', '', 0, '', '', '', '', 'pbay', 'faf8757c0b6a1057f56024d5c0c8666a0c1d70a4', '', '', '', 5),
(291, 'S', 'BENAISSA', 'Farouk', '0000-00-00', '', 0, '', '', '', '', 'fbenai', 'd39463d49ad93a277fa734792579d339d1fc26bb', '', '', '', 5),
(292, 'S', 'BERLIOUX', 'Julien', '0000-00-00', '', 0, '', '', '', '', 'jberli', '2cc9cb4e01e1308b50089cdb4b7c6ed4e8d3e1a1', '', '', '', 5),
(293, 'S', 'BOUMJAHED', 'Hicham', '0000-00-00', '', 0, '', '', '', '', 'hboumj', 'c8c4c43b97b5a126b2e8883bfea72b9443681906', '', '', '', 5),
(294, 'S', 'BOUTAHRI', 'Mohamed', '0000-00-00', '', 0, '', '', '', '', 'mbouta', '4c745c3f90d1474d9343db24398b7eb18e71d417', '', '', '', 5),
(295, 'S', 'CHAABANE', 'Wajih', '0000-00-00', '', 0, '', '', '', '', 'wchaab', '1ff6f5b2fc1c052c67d29e193266cb5678bb6ce1', '', '', '', 5),
(296, 'S', 'COMBEL', 'Yannick', '0000-00-00', '', 0, '', '', '', '', 'ycombe', '12ac823d7d8a23dc65dec1960ba88b76f99b589c', '', '', '', 5),
(297, 'S', 'DJELLOUT', 'Samir', '0000-00-00', '', 0, '', '', '', '', 'sdjell', 'ecfc9b07998e4140ccc1657d44639a57b76ce5a5', '', '', '', 5),
(298, 'S', 'HAOUCHINE', 'Samir', '0000-00-00', '', 0, '', '', '', '', 'shaouc', '837e4adce95b661e958af42d90f851846b65334b', '', '', '', 5),
(299, 'S', 'LACARELLE', 'Julien', '0000-00-00', '', 0, '', '', '', '', 'jlacar', 'cdcb751a7bd2c29a5fb3d9fca53a7640a51774d2', '', '', '', 5),
(300, 'S', 'LAHMER', 'Ali', '0000-00-00', '', 0, '', '', '', '', 'alahme', 'e4bc0b9edea01365825af94b0ba36275c7670d72', '', '', '', 5),
(301, 'S', 'LE DORTZ', 'Laurent', '0000-00-00', '', 0, '', '', '', '', 'lle do', 'd1c072a0f7902c53104207f954529539c7cbad2b', '', '', '', 5),
(302, 'S', 'LIOTIER', 'Jocelyne', '0000-00-00', '', 0, '', '', '', '', 'jlioti', '23ae35bd6d4f74f454da762308e2d3285ae9bc39', '', '', '', 5),
(303, 'S', 'MACHADO', 'Alberto', '0000-00-00', '', 0, '', '', '', '', 'amacha', '746178f030ada3e4b6a9ab7d3a301cffad0ab5d0', '', '', '', 5),
(304, 'S', 'MARTORELL', 'Romain', '0000-00-00', '', 0, '', '', '', '', 'rmarto', '84ad6d28c30b91c8921ec0e77d52dc775027aa78', '', '', '', 5),
(305, 'S', 'MOREL', 'Jean-Marc', '0000-00-00', '', 0, '', '', '', '', 'jmorel', 'e7181252cb43510e06020eb33d0ed1eacbd3b063', '', '', '', 5),
(306, 'S', 'NUBIEN', 'Miller', '0000-00-00', '', 0, '', '', '', '', 'mnubie', '9726bd2cf354841ac54e4069f78bca767b2b1787', '', '', '', 5),
(307, 'S', 'RANDRIANASOLO', 'Andrianjaka', '0000-00-00', '', 0, '', '', '', '', 'arandr', '8bffdf756fe51a89713d01b834c3de2c0be6335d', '', '', '', 5),
(308, 'S', 'TES', 'Christophe', '0000-00-00', '', 0, '', '', '', '', 'ctes', '88da21f2b7141f16993556b6defe5dac624cc5aa', '', '', '', 5),
(309, 'S', 'TOULAIN', 'Eric', '0000-00-00', '', 0, '', '', '', '', 'etoula', '035990f73703e6cf9149821a85ae9956004111d5', '', '', '', 5),
(310, 'S', 'WOURASS', 'Abdelkrim', '0000-00-00', '', 0, '', '', '', '', 'awoura', '84da09c72fcb91661ac831a61671c7361a22b0a7', '', '', '', 5),
(311, 'S', 'YAHIA CHERIF', 'Mohamed', '0000-00-00', '', 0, '', '', '', '', 'myahia', '3cc43a9710c72c68256cc4c256782f27bd1bbde6', '', '', '', 5),
(312, 'S', 'YIN', 'Ying', '0000-00-00', '', 0, '', '', '', '', 'yyin', '1a9afbb4b16b8db97a451fca5477ba65271573ee', '', '', '', 5),
(313, 'S', 'BAMBA', 'Patrick', '1987-03-12', '36 rue louise michel', 69200, 'Vénissieux', 'FRANCE', '0618284049', 'patrick.bamba@ymail.com', 'pbamba', '4639dbabdf330656fd27ff752b0150130cb4ed86', '', 'M', 'Française', 5),
(314, 'S', 'BILLAMI', 'Mokhtar Boumedyen', '1998-11-28', '20 Rue colin, Les Lauréades, Lot N: A318', 69100, 'Villeurbanne', 'FRANCE', '0605370677', 'mokhtarlive@live.fr', 'mbilla', 'a52d3b1fe226a3d09d0608b86c1bde9a5dc16197', '', 'M', 'Algérienne', 5),
(315, 'S', 'BOUGHARIOU', 'Sirine', '1988-09-26', '11 Rue duguesclin ', 69006, 'Lyon 06', 'FRANCE', '33762282643', 'syrinebougheriou@gmail.com', 'sbough', 'fd88022f9c50a048279651b02da25f7d491cf807', '', 'F', 'Tunisienne', 5),
(316, 'S', 'CHAMSI', 'Hammam', '0000-00-00', '', 0, '', '', '', '', 'hchams', '2564dd67d9cb5e6eee04a9f10093a8a9a7ae5a75', '', '', '', 5),
(317, 'S', 'HADDAD', 'Hani', '0000-00-00', '', 0, '', '', '', '', 'hhadda', '922d5942dd0a4af7d13c2159b4c7623e717d49b4', '', '', '', 5),
(318, 'S', 'KAMMOUN', 'Abderrahmen', '1988-07-31', '12 rue de la jeunesse', 69100, 'Villeurbanne', 'FRANCE', '06 65 38 33 20', 'kammoun3bderrahmen@gmail.com', 'akammo', '05d1bae9e01daef3c2358ecab1c48070b967765e', '', 'M', 'Tunisienne', 5),
(319, 'S', 'MAROUF', 'Mohammed Amin ', '1989-02-11', '02, rue soeur bouvier', 69005, 'Lyon 05', 'FRANCE', '07 86 35 06 75', 'marouf.ma@gmail.com', 'mmarou', 'e4e3d9f955e6a4a6cac433170acdd085a00053dd', '', 'M', 'Algérie', 5),
(320, 'S', 'MOUHOUB', 'Abdennasser', '0000-00-00', '', 0, '', '', '', '', 'amouho', '20a1b4e6149e030a2dd6d4300bcdabba0a61cef2', '', '', '', 5),
(321, 'S', 'SBAI', 'Sawsen', '0000-00-00', '', 0, '', '', '', '', 'ssbai', 'ebc65a383231d81593dd6cd97005854e28eaf945', '', '', '', 5),
(322, 'S', 'YAHIAOUI', 'Abdelghani', '0000-00-00', '', 0, '', '', '', '', 'ayahia', 'd363b4642c65d475371ae9f48a422fb5d5f9a3a8', '', '', '', 5),
(323, 'S', 'ZAIRI', 'Marwa Henia', '1988-12-28', '2 rue renan,résidence le pradon', 69007, 'Lyon 07', 'FRANCE', '0760910633', 'zairi.marwa@gmail.com', 'mzairi', 'da4a642c1d6571d09f0ebee8886780f11f8648b6', '', 'F', 'Algérienne', 5),
(324, 'S', 'ASTAFIEVA', 'Olena', '0000-00-00', '', 0, '', '', '', '', 'oastaf', '42f6ab20e14f8edd0b7dfcb51fd97c928c35acc3', '', '', '', 5),
(325, 'S', 'BABENKO', 'Dmytro', '0000-00-00', '', 0, '', '', '', '', 'dbaben', '4534725607b44c386fb0ac938bafdafbbac1c2c0', '', '', '', 5),
(326, 'S', 'BURKUN', 'Oleksii', '0000-00-00', '', 0, '', '', '', '', 'oburku', 'e71bba685c18bd5a7cf0adba0e8fd7c17ffb1cb4', '', '', '', 5),
(327, 'S', 'DOROVSKAIA', 'Valeriia', '0000-00-00', '', 0, '', '', '', '', 'vdorov', 'b8843c8a6ac732c857b4e9c851a39d0e0d363cdd', '', '', '', 5),
(328, 'S', 'KARNOZHITSKAYA', 'Alesya', '0000-00-00', '', 0, '', '', '', '', 'akarno', '3d48e26665505bc5dad5ae5c21c2777af9353de7', '', '', '', 5),
(329, 'S', 'KHOKHLOVA', 'Maryna', '0000-00-00', '', 0, '', '', '', '', 'mkhokh', '2cd1e1b2fea1abdf27e72e26e134ce7de6bc56f8', '', '', '', 5),
(330, 'S', 'KISIELOV', 'Andrii', '0000-00-00', '', 0, '', '', '', '', 'akisie', '285e4205b356624729014425d29d83d2bc25652f', '', '', '', 5),
(331, 'S', 'KLIUCHNIKOVA', 'Mariia', '0000-00-00', '', 0, '', '', '', '', 'mkliuc', '90841830a3e1413a8b6d02815e653f64a6060130', '', '', '', 5),
(332, 'S', 'KOMAR', 'Denys', '0000-00-00', '', 0, '', '', '', '', 'dkomar', '808105a06d824951643c723b39ff95f88816c6e5', '', '', '', 5),
(333, 'S', 'KONOVALOV', 'Oleksandr', '0000-00-00', '', 0, '', '', '', '', 'okonov', '5b2503505c717b2d08ad0885b135c6b6c1ec0b2d', '', '', '', 5),
(334, 'S', 'KOVALENKO', 'Julia', '0000-00-00', '', 0, '', '', '', '', 'jkoval', 'f0bef3db8e366157af2010f10e9cce5adb16b7c6', '', '', '', 5),
(335, 'S', 'MARCHENKO', 'Anastasiia', '0000-00-00', '', 0, '', '', '', '', 'amarch', '37ee0cd47ac9cb623abadd15690fd4603b800e33', '', '', '', 5),
(336, 'S', 'RYBALOVA', 'Anastasiia', '0000-00-00', '', 0, '', '', '', '', 'arybal', '8176bc08096431876bd4ea816d32c460d7c2b279', '', '', '', 5),
(337, 'S', 'SERGHIIENKO', 'Anastasiia', '0000-00-00', '', 0, '', '', '', '', 'asergh', 'ca7e44bcb7819e2ab97483ca14f525ad915bbb37', '', '', '', 5),
(338, 'S', 'SHCURENKO', 'Iryna', '0000-00-00', '', 0, '', '', '', '', 'ishcur', 'ef10623f4dc408ab590a0c0b321b678ce83d2211', '', '', '', 5),
(339, 'S', 'SOLOGUBOVSKYI', 'Oleksandr', '0000-00-00', '', 0, '', '', '', '', 'osolog', 'f2de26acf3a923793f60c3d6255d352a3a3725f5', '', '', '', 5),
(340, 'S', 'YAROSHENKO', 'Olga', '0000-00-00', '', 0, '', '', '', '', 'oyaros', '5075c77dcdd44326c72239ad58f7150937d3714d', '', '', '', 5),
(341, 'S', 'ZAKHAROVA', 'Eugeniya', '0000-00-00', '', 0, '', '', '', '', 'ezakha', '71d1d64c1077ec0b6e28ab57d752aa04d0dc8184', '', '', '', 5),
(342, 'S', 'AH-PINE ', ' Julien', '0000-00-00', '', 0, '', '', '', '', ' ah-pi', 'c8ddd221c0fe25e3aed9b3781a4dcc5f88f34610', '', '', '', 2),
(343, 'O', 'CHANTELOUP', 'Jennifer', '1977-03-12', '5 avenue Pierre Mendès France', 69676, 'Bron', 'FRANCE', '0478773151', 'jennifer.chanteloup@univ-lyon2.fr', 'jchante', '21e5d6c0d14c98db15e6625e7fe928a7d6776d7d', NULL, 'F', 'Française', 1),
(344, 'O', 'Heidelberg', 'Ingrid', '0000-00-00', '', 0, '', '', NULL, 'ingrid.heidelberg@univ-lyon2.fr', 'iheidelberg', '236ab49415814368c249d6dcf9a1e9e0e7431634', NULL, 'M', '', 1),
(345, 'O', 'CREVEL', 'Julien', '0000-00-00', '', 0, '', '', NULL, 'julien.crevel@univ-lyon2.fr', 'jcrevel', '1fc1265bc1c1984178dac447b9175f547fd8d4f6', NULL, 'M', '', 1),
(346, 'S', 'LI', 'Lu', '1983-03-30', '4 rue neuve de monplaisir', 69008, 'Lyon 08', 'FRANCE', '0625483703', 'liluchine@gmail.com', 'Lilu', '07052135de9e086ce8a9db7bddcb1776351a6e1b', NULL, 'M', 'chinoise', 5);

-- --------------------------------------------------------

--
-- Structure de la table `webographie`
--

CREATE TABLE `webographie` (
  `idWeb` int(11) NOT NULL,
  `titreWeb` varchar(250) DEFAULT NULL,
  `urlWeb` varchar(250) DEFAULT NULL,
  `auteurWeb` varchar(250) DEFAULT NULL,
  `commentaireWeb` varchar(300) DEFAULT NULL,
  `idSyllabus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD PRIMARY KEY (`NumUE`,`idFormation`),
  ADD KEY `FK_appartenir_idFormation` (`idFormation`);

--
-- Index pour la table `association_40`
--
ALTER TABLE `association_40`
  ADD PRIMARY KEY (`idRole`,`idModule`),
  ADD KEY `FK_Association_40_idModule` (`idModule`);

--
-- Index pour la table `batiment`
--
ALTER TABLE `batiment`
  ADD PRIMARY KEY (`idBatiment`);

--
-- Index pour la table `bibliographie`
--
ALTER TABLE `bibliographie`
  ADD PRIMARY KEY (`idBiblio`),
  ADD KEY `FK_Bibliographie_idSyllabus` (`idSyllabus`);

--
-- Index pour la table `choisir`
--
ALTER TABLE `choisir`
  ADD PRIMARY KEY (`NumEtudiant`,`NumUE`,`anneeChoisir`),
  ADD KEY `FK_choisir_NumUE` (`NumUE`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id_commentaire`);

--
-- Index pour la table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`idCompetence`),
  ADD KEY `FK_Competence_idTypeCompetence` (`idTypeCompetence`);

--
-- Index pour la table `comp_stage`
--
ALTER TABLE `comp_stage`
  ADD PRIMARY KEY (`idCompetence`,`NumStage`),
  ADD KEY `FK_comp_stage_NumStage` (`NumStage`);

--
-- Index pour la table `comp_syllabus`
--
ALTER TABLE `comp_syllabus`
  ADD PRIMARY KEY (`idCompetence`,`idSyllabus`),
  ADD KEY `FK_comp_syllabus_idSyllabus` (`idSyllabus`);

--
-- Index pour la table `comp_travauxgroupe`
--
ALTER TABLE `comp_travauxgroupe`
  ADD PRIMARY KEY (`numTravauxGroupe`,`idCompetence`),
  ADD KEY `FK_comp_travauxGroupe_idCompetence` (`idCompetence`);

--
-- Index pour la table `comp_travauxind`
--
ALTER TABLE `comp_travauxind`
  ADD PRIMARY KEY (`idCompetence`,`NumTravauxInd`),
  ADD KEY `FK_comp_travauxInd_NumTravauxInd` (`NumTravauxInd`);

--
-- Index pour la table `diriger`
--
ALTER TABLE `diriger`
  ADD PRIMARY KEY (`NumEnseignant`,`idFormation`),
  ADD KEY `FK_Diriger_idFormation` (`idFormation`);

--
-- Index pour la table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id_doc`);

--
-- Index pour la table `documents2etudiants2missions`
--
ALTER TABLE `documents2etudiants2missions`
  ADD KEY `fk_documents` (`id_doc`),
  ADD KEY `fk_etudiants` (`id_etu`),
  ADD KEY `fk_missions` (`id_mission`);

--
-- Index pour la table `droitpage`
--
ALTER TABLE `droitpage`
  ADD PRIMARY KEY (`idRole`,`idPage`),
  ADD KEY `FK_droitPage_idPage` (`idPage`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`NumEnseignant`);

--
-- Index pour la table `enseigner`
--
ALTER TABLE `enseigner`
  ADD PRIMARY KEY (`NumEnseignant`,`idSyllabus`),
  ADD KEY `FK_Enseigner_idSyllabus` (`idSyllabus`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`idEntreprise`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`NumEtudiant`);

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`idSyllabus`,`NumEtudiant`,`dateEval`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`idFormation`);

--
-- Index pour la table `inscrire`
--
ALTER TABLE `inscrire`
  ADD PRIMARY KEY (`NumEtudiant`,`idFormation`,`anneeInscrire`),
  ADD KEY `FK_inscrire_idFormation` (`idFormation`);

--
-- Index pour la table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`idKeyword`);

--
-- Index pour la table `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id_mission`);

--
-- Index pour la table `missions2etudiants`
--
ALTER TABLE `missions2etudiants`
  ADD KEY `fk_missions` (`id_mission`),
  ADD KEY `fk_etudiants` (`id_etu`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`idModule`);

--
-- Index pour la table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`idPage`),
  ADD KEY `FK_page_idModule` (`idModule`);

--
-- Index pour la table `participer_ens`
--
ALTER TABLE `participer_ens`
  ADD PRIMARY KEY (`NumEnseignant`,`NumSoutenance`),
  ADD KEY `FK_participer_ens_NumSoutenance` (`NumSoutenance`);

--
-- Index pour la table `realisergroupe`
--
ALTER TABLE `realisergroupe`
  ADD PRIMARY KEY (`NumEtudiant`,`numTravauxGroupe`);

--
-- Index pour la table `reunions`
--
ALTER TABLE `reunions`
  ADD PRIMARY KEY (`id_reunion`);

--
-- Index pour la table `reunions2etudiants`
--
ALTER TABLE `reunions2etudiants`
  ADD KEY `fk_reunions` (`id_reunion`),
  ADD KEY `fk_etudiants` (`id_etu`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`idSalle`),
  ADD KEY `FK_Salle_idBatiment` (`idBatiment`);

--
-- Index pour la table `souhaitsuperviser`
--
ALTER TABLE `souhaitsuperviser`
  ADD PRIMARY KEY (`NumEnseignant`,`NumStage`),
  ADD KEY `FK_souhaitSuperviser_NumStage` (`NumStage`);

--
-- Index pour la table `soutenance`
--
ALTER TABLE `soutenance`
  ADD PRIMARY KEY (`NumSoutenance`),
  ADD KEY `FK_Soutenance_idSalle` (`idSalle`),
  ADD KEY `FK_Soutenance_NumStage` (`NumStage`);

--
-- Index pour la table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`NumStage`),
  ADD KEY `FK_Stage_NumEtudiant` (`NumEtudiant`),
  ADD KEY `FK_Stage_idEntreprise` (`idEntreprise`),
  ADD KEY `FK_Stage_IdTuteurEntreprise` (`IdTuteurEntreprise`),
  ADD KEY `FK_Stage_NumSoutenance` (`NumSoutenance`),
  ADD KEY `FK_Stage_NumEnseignant` (`NumEnseignant`),
  ADD KEY `FK_Stage_idFormation` (`idFormation`);

--
-- Index pour la table `supervisertravgroupe`
--
ALTER TABLE `supervisertravgroupe`
  ADD PRIMARY KEY (`NumEnseignant`,`numTravauxGroupe`),
  ADD KEY `FK_superviserTravGroupe_numTravauxGroupe` (`numTravauxGroupe`);

--
-- Index pour la table `supervisertravind`
--
ALTER TABLE `supervisertravind`
  ADD PRIMARY KEY (`NumTravauxInd`,`NumEnseignant`),
  ADD KEY `FK_superviserTravInd_NumEnseignant` (`NumEnseignant`);

--
-- Index pour la table `syllabus`
--
ALTER TABLE `syllabus`
  ADD PRIMARY KEY (`idSyllabus`),
  ADD KEY `FK_Syllabus_NumUE` (`NumUE`);

--
-- Index pour la table `syllabus_keyword`
--
ALTER TABLE `syllabus_keyword`
  ADD PRIMARY KEY (`idSyllabus`,`idKeyword`),
  ADD KEY `FK_syllabus_keyword_idKeyword` (`idKeyword`);

--
-- Index pour la table `travauxgroupe`
--
ALTER TABLE `travauxgroupe`
  ADD PRIMARY KEY (`numTravauxGroupe`),
  ADD KEY `FK_TravauxGroupe_idSyllabus` (`idSyllabus`);

--
-- Index pour la table `travauxindividuels`
--
ALTER TABLE `travauxindividuels`
  ADD PRIMARY KEY (`NumTravauxInd`),
  ADD KEY `FK_TravauxIndividuels_NumEtudiant` (`NumEtudiant`),
  ADD KEY `FK_TravauxIndividuels_idTypeTravaux` (`idTypeTravaux`),
  ADD KEY `FK_TravauxIndividuels_idSyllabus` (`idSyllabus`),
  ADD KEY `FK_TravauxIndividuels_NumStage` (`NumStage`);

--
-- Index pour la table `tuteur_entreprise`
--
ALTER TABLE `tuteur_entreprise`
  ADD PRIMARY KEY (`IdTuteurEntreprise`),
  ADD KEY `FK_Tuteur_Entreprise_idEntreprise` (`idEntreprise`);

--
-- Index pour la table `type_competence`
--
ALTER TABLE `type_competence`
  ADD PRIMARY KEY (`idTypeCompetence`);

--
-- Index pour la table `type_travaux`
--
ALTER TABLE `type_travaux`
  ADD PRIMARY KEY (`idTypeTravaux`);

--
-- Index pour la table `ue`
--
ALTER TABLE `ue`
  ADD PRIMARY KEY (`NumUE`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`NumUtilisateur`),
  ADD KEY `FK_Utilisateur_idRole` (`idRole`);

--
-- Index pour la table `webographie`
--
ALTER TABLE `webographie`
  ADD PRIMARY KEY (`idWeb`),
  ADD KEY `FK_Webographie_idSyllabus` (`idSyllabus`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `batiment`
--
ALTER TABLE `batiment`
  MODIFY `idBatiment` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `bibliographie`
--
ALTER TABLE `bibliographie`
  MODIFY `idBiblio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `competence`
--
ALTER TABLE `competence`
  MODIFY `idCompetence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `NumEnseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;
--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `idEntreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `NumEtudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;
--
-- AUTO_INCREMENT pour la table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `idSyllabus` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `idFormation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `idKeyword` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `missions`
--
ALTER TABLE `missions`
  MODIFY `id_mission` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=884;
--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `idModule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `page`
--
ALTER TABLE `page`
  MODIFY `idPage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT pour la table `realisergroupe`
--
ALTER TABLE `realisergroupe`
  MODIFY `NumEtudiant` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `reunions`
--
ALTER TABLE `reunions`
  MODIFY `id_reunion` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `idRole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `soutenance`
--
ALTER TABLE `soutenance`
  MODIFY `NumSoutenance` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `stage`
--
ALTER TABLE `stage`
  MODIFY `NumStage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;
--
-- AUTO_INCREMENT pour la table `syllabus`
--
ALTER TABLE `syllabus`
  MODIFY `idSyllabus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT pour la table `travauxgroupe`
--
ALTER TABLE `travauxgroupe`
  MODIFY `numTravauxGroupe` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `travauxindividuels`
--
ALTER TABLE `travauxindividuels`
  MODIFY `NumTravauxInd` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tuteur_entreprise`
--
ALTER TABLE `tuteur_entreprise`
  MODIFY `IdTuteurEntreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT pour la table `type_competence`
--
ALTER TABLE `type_competence`
  MODIFY `idTypeCompetence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `type_travaux`
--
ALTER TABLE `type_travaux`
  MODIFY `idTypeTravaux` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `ue`
--
ALTER TABLE `ue`
  MODIFY `NumUE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `NumUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;
--
-- AUTO_INCREMENT pour la table `webographie`
--
ALTER TABLE `webographie`
  MODIFY `idWeb` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `FK_appartenir_NumUE` FOREIGN KEY (`NumUE`) REFERENCES `ue` (`NumUE`),
  ADD CONSTRAINT `FK_appartenir_idFormation` FOREIGN KEY (`idFormation`) REFERENCES `formation` (`idFormation`);

--
-- Contraintes pour la table `association_40`
--
ALTER TABLE `association_40`
  ADD CONSTRAINT `FK_Association_40_idModule` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`),
  ADD CONSTRAINT `FK_Association_40_idRole` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`);

--
-- Contraintes pour la table `choisir`
--
ALTER TABLE `choisir`
  ADD CONSTRAINT `FK_choisir_NumEtudiant` FOREIGN KEY (`NumEtudiant`) REFERENCES `etudiant` (`NumEtudiant`),
  ADD CONSTRAINT `FK_choisir_NumUE` FOREIGN KEY (`NumUE`) REFERENCES `ue` (`NumUE`);

--
-- Contraintes pour la table `competence`
--
ALTER TABLE `competence`
  ADD CONSTRAINT `FK_Competence_idTypeCompetence` FOREIGN KEY (`idTypeCompetence`) REFERENCES `type_competence` (`idTypeCompetence`);

--
-- Contraintes pour la table `comp_stage`
--
ALTER TABLE `comp_stage`
  ADD CONSTRAINT `FK_comp_stage_NumStage` FOREIGN KEY (`NumStage`) REFERENCES `stage` (`NumStage`),
  ADD CONSTRAINT `FK_comp_stage_idCompetence` FOREIGN KEY (`idCompetence`) REFERENCES `competence` (`idCompetence`);

--
-- Contraintes pour la table `comp_syllabus`
--
ALTER TABLE `comp_syllabus`
  ADD CONSTRAINT `FK_comp_syllabus_idCompetence` FOREIGN KEY (`idCompetence`) REFERENCES `competence` (`idCompetence`),
  ADD CONSTRAINT `FK_comp_syllabus_idSyllabus` FOREIGN KEY (`idSyllabus`) REFERENCES `syllabus` (`idSyllabus`);

--
-- Contraintes pour la table `comp_travauxgroupe`
--
ALTER TABLE `comp_travauxgroupe`
  ADD CONSTRAINT `FK_comp_travauxGroupe_idCompetence` FOREIGN KEY (`idCompetence`) REFERENCES `competence` (`idCompetence`),
  ADD CONSTRAINT `FK_comp_travauxGroupe_numTravauxGroupe` FOREIGN KEY (`numTravauxGroupe`) REFERENCES `travauxgroupe` (`numTravauxGroupe`);

--
-- Contraintes pour la table `comp_travauxind`
--
ALTER TABLE `comp_travauxind`
  ADD CONSTRAINT `FK_comp_travauxInd_NumTravauxInd` FOREIGN KEY (`NumTravauxInd`) REFERENCES `travauxindividuels` (`NumTravauxInd`),
  ADD CONSTRAINT `FK_comp_travauxInd_idCompetence` FOREIGN KEY (`idCompetence`) REFERENCES `competence` (`idCompetence`);

--
-- Contraintes pour la table `diriger`
--
ALTER TABLE `diriger`
  ADD CONSTRAINT `FK_Diriger_NumEnseignant` FOREIGN KEY (`NumEnseignant`) REFERENCES `enseignant` (`NumEnseignant`),
  ADD CONSTRAINT `FK_Diriger_idFormation` FOREIGN KEY (`idFormation`) REFERENCES `formation` (`idFormation`);

--
-- Contraintes pour la table `droitpage`
--
ALTER TABLE `droitpage`
  ADD CONSTRAINT `FK_droitPage_idPage` FOREIGN KEY (`idPage`) REFERENCES `page` (`idPage`),
  ADD CONSTRAINT `FK_droitPage_idRole` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`);

--
-- Contraintes pour la table `enseigner`
--
ALTER TABLE `enseigner`
  ADD CONSTRAINT `FK_Enseigner_NumEnseignant` FOREIGN KEY (`NumEnseignant`) REFERENCES `enseignant` (`NumEnseignant`),
  ADD CONSTRAINT `FK_Enseigner_idSyllabus` FOREIGN KEY (`idSyllabus`) REFERENCES `syllabus` (`idSyllabus`);

--
-- Contraintes pour la table `inscrire`
--
ALTER TABLE `inscrire`
  ADD CONSTRAINT `FK_inscrire_NumEtudiant` FOREIGN KEY (`NumEtudiant`) REFERENCES `etudiant` (`NumEtudiant`),
  ADD CONSTRAINT `FK_inscrire_idFormation` FOREIGN KEY (`idFormation`) REFERENCES `formation` (`idFormation`);

--
-- Contraintes pour la table `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `FK_page_idModule` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`);

--
-- Contraintes pour la table `participer_ens`
--
ALTER TABLE `participer_ens`
  ADD CONSTRAINT `FK_participer_ens_NumEnseignant` FOREIGN KEY (`NumEnseignant`) REFERENCES `enseignant` (`NumEnseignant`),
  ADD CONSTRAINT `FK_participer_ens_NumSoutenance` FOREIGN KEY (`NumSoutenance`) REFERENCES `soutenance` (`NumSoutenance`);

--
-- Contraintes pour la table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `FK_Salle_idBatiment` FOREIGN KEY (`idBatiment`) REFERENCES `batiment` (`idBatiment`);

--
-- Contraintes pour la table `soutenance`
--
ALTER TABLE `soutenance`
  ADD CONSTRAINT `FK_Soutenance_NumStage` FOREIGN KEY (`NumStage`) REFERENCES `stage` (`NumStage`),
  ADD CONSTRAINT `FK_Soutenance_idSalle` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`idSalle`);

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `FK_Stage_IdTuteurEntreprise` FOREIGN KEY (`IdTuteurEntreprise`) REFERENCES `tuteur_entreprise` (`IdTuteurEntreprise`),
  ADD CONSTRAINT `FK_Stage_NumEnseignant` FOREIGN KEY (`NumEnseignant`) REFERENCES `enseignant` (`NumEnseignant`),
  ADD CONSTRAINT `FK_Stage_NumEtudiant` FOREIGN KEY (`NumEtudiant`) REFERENCES `etudiant` (`NumEtudiant`),
  ADD CONSTRAINT `FK_Stage_NumSoutenance` FOREIGN KEY (`NumSoutenance`) REFERENCES `soutenance` (`NumSoutenance`),
  ADD CONSTRAINT `FK_Stage_idEntreprise` FOREIGN KEY (`idEntreprise`) REFERENCES `entreprise` (`idEntreprise`),
  ADD CONSTRAINT `FK_Stage_idFormation` FOREIGN KEY (`idFormation`) REFERENCES `formation` (`idFormation`);

--
-- Contraintes pour la table `tuteur_entreprise`
--
ALTER TABLE `tuteur_entreprise`
  ADD CONSTRAINT `FK_Tuteur_Entreprise_idEntreprise` FOREIGN KEY (`idEntreprise`) REFERENCES `entreprise` (`idEntreprise`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
