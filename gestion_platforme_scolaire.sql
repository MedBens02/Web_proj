-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 05, 2024 at 02:18 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_platforme_scolaire`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nom`, `prenom`, `login`, `mot_de_passe`) VALUES
(1, 'Med', 'Muad', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `enrollement`
--

DROP TABLE IF EXISTS `enrollement`;
CREATE TABLE IF NOT EXISTS `enrollement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cours` int NOT NULL,
  `id_etd` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_etd` (`id_etd`),
  KEY `id_cours` (`id_cours`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrollement`
--

INSERT INTO `enrollement` (`id`, `id_cours`, `id_etd`) VALUES
(2, 13, 36),
(3, 6, 36);

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `request` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `adresse`, `email`, `mot_de_passe`, `request`) VALUES
(36, 'ff', 'ff', 'ff', 'test2@gmail.com', 'ff', 0),
(37, 'ff', 'ff', 'ff', 'test@gmail.com', 'ff', 0),
(38, 'ff', 'ff', 'ff', 'test3@gmail.com', 'ff', 0);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prof_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prof` (`prof_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `nom`, `description`, `prof_id`) VALUES
(1, 'JavaScript', 'Cours de JavaScript', 20),
(3, 'ENGLISH', 'Cours de ENGLISH', 20),
(6, 'JEE', 'Cours de frameworks de JEE', 22),
(7, 'PYTHON', 'Cours de PYTHON', 20),
(8, 'c#', 'Cours de c#', 21),
(9, 'Français', 'Cours de français', 20),
(11, 'gestion de projet', 'cours de gestion de projet', 20),
(12, 'Java', 'Programmation Java', 23),
(13, 'controle de gestion', 'Cours de marketing', 20),
(16, 'rr', 'rr', 20),
(23, 'test', 'test', 21),
(25, 'tt', 'tt', 20);

-- --------------------------------------------------------

--
-- Table structure for table `professeurs`
--

DROP TABLE IF EXISTS `professeurs`;
CREATE TABLE IF NOT EXISTS `professeurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `request` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professeurs`
--

INSERT INTO `professeurs` (`id`, `nom`, `prenom`, `adresse`, `email`, `mot_de_passe`, `request`) VALUES
(20, 'dd', 'dd', 'dd', 'test@gmial.com', 'dd', 0),
(21, 'ff', 'ff', 'ff', 'test2@gmial.com', 'ff', 0),
(22, 'gg', 'gg', 'gg', 'test2@gmail.com', 'gg', 0),
(23, 'rr', 'rr', 'rr', 'test3@gmail.com', 'rr', 0),
(24, 'ff', 'ff', 'ff', 'test6@gmial.com', 'ff', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollement`
--
ALTER TABLE `enrollement`
  ADD CONSTRAINT `id_cours` FOREIGN KEY (`id_cours`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_etd` FOREIGN KEY (`id_etd`) REFERENCES `etudiant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `prof` FOREIGN KEY (`prof_id`) REFERENCES `professeurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
