-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 05, 2024 at 08:29 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrollement`
--

INSERT INTO `enrollement` (`id`, `id_cours`, `id_etd`) VALUES
(2, 13, 36),
(3, 6, 36),
(4, 1, 37),
(7, 9, 37),
(11, 9, 38),
(12, 16, 37),
(14, 3, 38),
(15, 25, 37),
(16, 7, 38),
(17, 7, 37),
(18, 16, 38),
(19, 9, 36),
(21, 1, 39),
(22, 1, 40),
(23, 3, 39),
(24, 9, 41),
(28, 13, 38);

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `adresse`, `email`, `mot_de_passe`, `request`) VALUES
(36, 'ff', 'ff', 'ff', 'test2@gmail.com', 'ff', 0),
(37, 'gg', 'ff', 'ff', 'test@gmail.com', 'ff', 0),
(38, 'hh', 'ff', 'ff', 'test3@gmail.com', 'ff', 0),
(39, 'Espinoza', 'Leslie', '207 Erin Well, West Andreamouth, TN 60441', 'leslie.espinoza@example.com', 'MlH%^U)yH3O', 0),
(40, 'Wood', 'Julie', '601 Sandra Knolls, Freemanfort, HI 57222', 'julie.wood@example.com', '@k0ytSS$mMSpo', 0),
(41, 'Cole', 'James', '718 Pope Plaza, Hillmouth, MS 84362', 'james.cole@example.com', 'kVt8nxnzrc', 0),
(42, 'Hubbard', 'Jasmine', '249 Reynolds Cape Suite 268, Thompsonburgh, NM 84772', 'jasmine.hubbard@example.com', 'uysN0Vm%Um', 0),
(43, 'Drake', 'Joseph', '24244 Nicole Rapids Suite 892, Jessicaville, AK 03618', 'joseph.drake@example.com', 'LgUpXuPsY9Dim2o', 0),
(44, 'Summers', 'Ann', '696 Townsend Brook Suite 548, Lake Nicoleshire, CO 35311', 'ann.summers@example.com', 'c%)mgZ0o(ZtreJ', 0),
(45, 'Gates', 'Rebecca', '629 Clements Loop, Fosterland, MT 89118', 'rebecca.gates@example.com', 'C*BZq51B4k%%', 0),
(46, 'Brown', 'Keith', '319 Natalie Creek, Shahmouth, NH 90479', 'keith.brown@example.com', 'bniQ1zLZll', 0),
(47, 'English', 'Trevor', '858 Sullivan Lakes Apt. 060, Nealberg, NJ 45590', 'trevor.english@example.com', 'jYIyUvzDiZS', 0),
(48, 'Ellison', 'Teresa', '5522 Angela Ports Suite 989, West Natalie, NM 09164', 'teresa.ellison@example.com', 'STq3YM6NC*', 0),
(50, 'Adams', 'Pedro', '23010 Bennett Union, Lake Erin, ID 29025', 'pedro.adams@example.com', 'tlvxxz', 0),
(51, 'Porter', 'Angela', '37790 Raymond Forest Apt. 064, Janiceborough, IL 97440', 'angela.porter@example.com', 'ldmruy', 0),
(52, 'Montes', 'Samantha', '346 Natalie Lock, South Tannerbury, WY 10297', 'samantha.montes@example.com', 'ylrbqw', 0),
(53, 'Nolan', 'Sean', 'PSC 8987, Box 9629, APO AP 00803', 'sean.nolan@example.com', 'nyazxs', 0),
(54, 'Moore', 'William', 'USNS Haynes, FPO AE 37471', 'william.moore@example.com', 'unddde', 0);

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
