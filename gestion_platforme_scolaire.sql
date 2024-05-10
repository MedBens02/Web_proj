-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 10, 2024 at 07:41 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrollement`
--

INSERT INTO `enrollement` (`id`, `id_cours`, `id_etd`) VALUES
(4, 1, 37),
(7, 9, 37),
(12, 16, 37),
(14, 3, 38),
(15, 25, 37),
(16, 7, 38),
(17, 7, 37),
(18, 16, 38),
(21, 1, 39),
(22, 1, 40),
(24, 9, 41),
(32, 7, 39);

-- --------------------------------------------------------

--
-- Table structure for table `etd_to_prof`
--

DROP TABLE IF EXISTS `etd_to_prof`;
CREATE TABLE IF NOT EXISTS `etd_to_prof` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`),
  KEY `etd_send` (`sender_id`),
  KEY `prof_receive` (`recipient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `etd_to_prof`
--

INSERT INTO `etd_to_prof` (`id`, `sender_id`, `recipient_id`, `time_stamp`, `msg`) VALUES
(1, 51, 20, '2024-05-10 07:35:06', 'I have a question about the assignment.'),
(2, 44, 21, '2024-05-10 07:35:06', 'Thank you for approving the proposal. I have further questions.'),
(3, 41, 23, '2024-05-10 07:35:06', 'Where can I find the lecture notes?'),
(4, 43, 24, '2024-05-10 07:35:06', 'What topics will the test cover?'),
(5, 40, 25, '2024-05-10 07:35:06', 'I will be absent during the new office hours, can we reschedule?'),
(6, 46, 26, '2024-05-10 07:35:06', 'Yes, what time would be suitable for the meeting?'),
(7, 39, 27, '2024-05-10 07:35:06', 'I didn’t receive the exam schedule. Can you resend it?'),
(8, 45, 28, '2024-05-10 07:35:06', 'Thank you! I appreciate your feedback.');

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `adresse`, `email`, `mot_de_passe`, `request`) VALUES
(37, 'gg', 'ff', 'ff', 'test@gmail.com', 'ff', 0),
(38, 'hh', 'ff', 'ff', 'test3@gmail.com', 'ff', 0),
(39, 'Espinoza', 'Leslie', '207 Erin Well, West Andreamouth, TN 60441', 'leslie.espinoza@example.com', 'MlH%^U)yH3O', 0),
(40, 'Wood', 'Julie', '601 Sandra Knolls, Freemanfort, HI 57222', 'julie.wood@example.com', '@k0ytSS$mMSpo', 0),
(41, 'Cole', 'James', '718 Pope Plaza, Hillmouth, MS 84362', 'james.cole@example.com', 'kVt8nxnzrc', 0),
(43, 'Drake', 'Joseph', '24244 Nicole Rapids Suite 892, Jessicaville, AK 03618', 'joseph.drake@example.com', 'LgUpXuPsY9Dim2o', 0),
(44, 'Summers', 'Ann', '696 Townsend Brook Suite 548, Lake Nicoleshire, CO 35311', 'ann.summers@example.com', 'c%)mgZ0o(ZtreJ', 0),
(45, 'Gates', 'Rebecca', '629 Clements Loop, Fosterland, MT 89118', 'rebecca.gates@example.com', 'C*BZq51B4k%%', 0),
(46, 'Brown', 'Keith', '319 Natalie Creek, Shahmouth, NH 90479', 'keith.brown@example.com', 'bniQ1zLZll', 0),
(47, 'English', 'Trevor', '858 Sullivan Lakes Apt. 060, Nealberg, NJ 45590', 'trevor.english@example.com', 'jYIyUvzDiZS', 0),
(48, 'Ellison', 'Teresa', '5522 Angela Ports Suite 989, West Natalie, NM 09164', 'teresa.ellison@example.com', 'STq3YM6NC*', 0),
(51, 'Porter', 'Angela', '37790 Raymond Forest Apt. 064, Janiceborough, IL 97440', 'angela.porter@example.com', 'ldmruy', 0),
(52, 'Montes', 'Samantha', '346 Natalie Lock, South Tannerbury, WY 10297', 'samantha.montes@example.com', 'ylrbqw', 0),
(53, 'Nolan', 'Sean', 'PSC 8987, Box 9629, APO AP 00803', 'sean.nolan@example.com', 'nyazxs', 0),
(54, 'Moore', 'William', 'USNS Haynes, FPO AE 37471', 'william.moore@example.com', 'unddde', 0),
(55, 'gg', 'gg', 'gg', 'testAdmin@gg.gg', 'gg', 0),
(56, 'gg', 'gg', 'gg', 'testAdmin2@gg.gg', 'gg', 0),
(57, 'gg', 'gg', 'gg', 'testAdmin3@gg.gg', 'gg', 0),
(58, 'gg', 'gg', 'gg', 'testAdmin4@gg.gg', 'gg', 0);

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
(7, 'PYTHON', 'Cours de PYTHON', 20),
(8, 'c#', 'Cours de c#', 21),
(9, 'Français', 'Cours de français', 20),
(12, 'Java', 'Programmation Java', 23),
(13, 'controle de gestion', 'Cours de marketing', 20),
(16, 'rr', 'rr', 21),
(23, 'test', 'test', 21),
(25, 'tt', 'tt', 20);

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

DROP TABLE IF EXISTS `parties`;
CREATE TABLE IF NOT EXISTS `parties` (
  `id_part` int NOT NULL AUTO_INCREMENT,
  `id_cours` int NOT NULL,
  `title_part` varchar(100) NOT NULL,
  `path_part` varchar(255) NOT NULL,
  `view_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_part`),
  KEY `part_cours` (`id_cours`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`id_part`, `id_cours`, `title_part`, `path_part`, `view_flag`) VALUES
(1, 1, 'Introduction to Module 1', '/uploads/introduction_module_1.pdf', 1),
(2, 3, 'Advanced Concepts Module 3', '/uploads/advanced_concepts_module_3.pdf', 1),
(3, 7, 'Beginner Guide Module 7', '/uploads/beginner_guide_module_7.pdf', 0),
(4, 8, 'Historical Overview Module 8', '/uploads/historical_overview_module_8.pdf', 1),
(5, 9, 'Practical Applications Module 9', '/uploads/practical_applications_module_9.pdf', 0),
(6, 12, 'Case Studies for Module 12', '/uploads/case_studies_module_12.pdf', 1),
(7, 13, 'Module 13 Summary', '/uploads/module_13_summary.pdf', 0),
(8, 16, 'Detailed Analysis Module 16', '/uploads/detailed_analysis_module_16.pdf', 1),
(9, 23, 'Module 23 Explained', '/uploads/module_23_explained.pdf', 0),
(10, 25, 'Final Thoughts Module 25', '/uploads/final_thoughts_module_25.pdf', 1),
(11, 1, 'Introduction to Module 2', '/uploads/introduction_module_2.pdf', 1),
(12, 1, 'Introduction to Module 3', '/uploads/introduction_module_3.pdf', 1),
(13, 1, 'Introduction to Module 4', '/uploads/introduction_module_4.pdf', 1),
(26, 1, 'test', '/uploads/parts/PW1-slides-partie11.pdf', 0),
(31, 1, 'test 3', '/uploads/parts/Intro Reseaux Info 1-Partie 3-3.pdf', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professeurs`
--

INSERT INTO `professeurs` (`id`, `nom`, `prenom`, `adresse`, `email`, `mot_de_passe`, `request`) VALUES
(20, 'med', 'bens', 'dd', 'test@gmial.com', 'dd', 0),
(21, 'ff', 'ff', 'ff', 'test2@gmial.com', 'ff', 0),
(23, 'rr', 'rr', 'rr', 'test3@gmail.com', 'rr', 0),
(24, 'ff', 'ff', 'ff', 'test6@gmial.com', 'ff', 0),
(25, 'gg', 'ggg', 'gg', 'testADmin@gg.gg', 'gg', 0),
(26, 'gg', 'gg', 'gg', 'testadmin2@gg.gg', 'gg', 0),
(27, 'gg', 'gg', 'gg', 'testadmin3@gg.gg', 'gg', 0),
(28, 'gg', 'gg', 'gg', 'testAdmin4@gg.gg', 'gg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `prof_to_etd`
--

DROP TABLE IF EXISTS `prof_to_etd`;
CREATE TABLE IF NOT EXISTS `prof_to_etd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`),
  KEY `prof_send` (`sender_id`),
  KEY `etd_receive` (`recipient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prof_to_etd`
--

INSERT INTO `prof_to_etd` (`id`, `sender_id`, `recipient_id`, `time_stamp`, `msg`) VALUES
(1, 20, 37, '2024-05-10 07:35:06', 'Please review the latest assignment.'),
(2, 20, 37, '2024-05-10 07:35:06', 'Your project proposal has been approved.'),
(3, 23, 41, '2024-05-10 07:35:06', 'I have uploaded the new lecture notes.'),
(4, 24, 43, '2024-05-10 07:35:06', 'Remember to prepare for the upcoming test.'),
(5, 25, 40, '2024-05-10 07:35:06', 'Office hours will be changed next week.'),
(6, 26, 46, '2024-05-10 07:35:06', 'Can you meet me tomorrow to discuss your thesis?'),
(7, 27, 39, '2024-05-10 07:35:06', 'Please check your email for the exam schedule.'),
(8, 28, 45, '2024-05-10 07:35:06', 'Good job on your recent presentation.');

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
-- Constraints for table `etd_to_prof`
--
ALTER TABLE `etd_to_prof`
  ADD CONSTRAINT `etd_send` FOREIGN KEY (`sender_id`) REFERENCES `etudiant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prof_receive` FOREIGN KEY (`recipient_id`) REFERENCES `professeurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `prof` FOREIGN KEY (`prof_id`) REFERENCES `professeurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parties`
--
ALTER TABLE `parties`
  ADD CONSTRAINT `part_cours` FOREIGN KEY (`id_cours`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prof_to_etd`
--
ALTER TABLE `prof_to_etd`
  ADD CONSTRAINT `etd_receive` FOREIGN KEY (`recipient_id`) REFERENCES `etudiant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prof_send` FOREIGN KEY (`sender_id`) REFERENCES `professeurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
