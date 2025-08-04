-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2024 at 02:00 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luna`
--

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `is_shown` tinyint(4) DEFAULT NULL,
  `event_tabulator` int(11) DEFAULT NULL,
  `event_chairman` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competition_contestants`
--

CREATE TABLE `competition_contestants` (
  `id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `contestant_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competition_places`
--

CREATE TABLE `competition_places` (
  `id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competition_rounds`
--

CREATE TABLE `competition_rounds` (
  `id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `round_id` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contestants`
--

CREATE TABLE `contestants` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `contestant_no` int(11) DEFAULT NULL,
  `contestant_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `fb_photo_id` varchar(100) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contestants`
--

INSERT INTO `contestants` (`id`, `event_id`, `contestant_no`, `contestant_name`, `description`, `fb_photo_id`, `is_active`, `date_created`, `last_modified`) VALUES
(1, 1, 1, 'Alcala', 'Allana Ruth Abuda', NULL, 1, '2023-11-29 11:03:47', '2024-11-30 17:10:29'),
(2, 1, 2, 'Salcedo', 'Princess Shannel Lacaden', NULL, 1, '2023-11-29 11:04:04', '2024-11-30 17:10:42'),
(3, 1, 3, 'Oaqui No. 4', 'Venice Joy Galutan', NULL, 1, '2023-11-29 11:04:24', '2024-11-30 17:10:54'),
(4, 1, 4, 'Darigayos', 'Nathaly Navarrete', NULL, 1, '2023-11-29 11:05:00', '2024-11-30 17:11:12'),
(5, 1, 5, 'Magallanes', 'Charlene Mae Cargo', NULL, 1, '2023-11-29 11:05:18', '2024-11-30 17:11:23'),
(6, 1, 6, 'Sucoc Norte', 'Sheena Allaine Pacio', NULL, 1, '2023-11-29 11:05:39', '2024-11-30 17:11:34'),
(7, 1, 7, 'Sto.Doming Norte', 'Thelvil Gagarin', NULL, 1, '2023-11-29 11:05:59', '2024-11-30 17:11:53'),
(8, 1, 8, 'Nalvo Sur', 'Joana Marie Sibayan', NULL, 1, '2023-11-29 11:06:21', '2024-11-30 17:12:21'),
(9, 1, 9, 'Cabalitocan', 'Erfen Jane Marzan', NULL, 1, '2023-11-29 11:06:40', '2024-11-30 17:12:34'),
(10, 1, 10, 'Oaqui No. 1', 'Erika Klein Liguden', NULL, 1, '2023-11-29 11:06:57', '2024-11-30 17:12:47'),
(11, 1, 11, 'Nalvo Sur', 'Lorine Venice Cadilo', NULL, 1, '2023-11-29 11:07:14', '2024-11-30 17:12:59'),
(12, 1, 12, 'Busel-Busel', 'Axel Mae Eraña', NULL, 1, '2024-11-26 13:52:19', '2024-11-30 17:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` int(11) NOT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `minimum` float(10,2) NOT NULL DEFAULT 0.00,
  `extract_portion` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `portion_id`, `description`, `percentage`, `minimum`, `extract_portion`, `date_created`, `last_modified`) VALUES
(1, 1, 'Entertainment Value', 30, 0.00, NULL, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(2, 1, 'Mastery', 30, 0.00, NULL, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(3, 1, 'Degree of Difficulty', 20, 0.00, NULL, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(4, 1, 'Stage Presence', 20, 0.00, NULL, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(5, 2, 'Beauty and Appeal', 30, 0.00, NULL, '2023-11-29 11:15:05', '2023-11-29 11:15:05'),
(6, 2, 'Poise and Carriage', 30, 0.00, NULL, '2023-11-29 11:15:05', '2023-11-29 11:15:05'),
(7, 2, 'Charm', 20, 0.00, NULL, '2023-11-29 11:15:05', '2023-11-29 11:15:05'),
(8, 2, 'Stage Presence', 20, 0.00, NULL, '2023-11-29 11:15:05', '2023-11-29 11:15:05'),
(9, 3, 'Beauty and Appeal', 30, 0.00, NULL, '2023-11-29 11:16:20', '2023-11-29 11:16:20'),
(10, 3, 'Poise and Carriage', 30, 0.00, NULL, '2023-11-29 11:16:20', '2023-11-29 11:16:20'),
(11, 3, 'Charm', 20, 0.00, NULL, '2023-11-29 11:16:20', '2023-11-29 11:16:20'),
(12, 3, 'Stage Presence', 20, 0.00, NULL, '2023-11-29 11:16:20', '2023-11-29 11:16:20'),
(13, 4, 'Ability to Express Self', 30, 0.00, NULL, '2023-11-29 11:18:31', '2023-11-29 11:18:31'),
(14, 4, 'Posture', 30, 0.00, NULL, '2023-11-29 11:18:31', '2023-11-29 11:18:31'),
(15, 4, 'Content of Answer', 40, 0.00, NULL, '2023-11-29 11:18:31', '2023-11-29 11:18:31'),
(16, 5, 'Beauty,Appeal and Stage Presence', 25, 0.00, 7, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(17, 5, 'Swimsuit', 25, 0.00, 2, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(18, 5, 'Evening Gown', 25, 0.00, 3, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(19, 5, 'Question & Answer', 25, 0.00, 4, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(20, 6, 'Body Proportion', 25, 0.00, NULL, '2023-11-29 11:23:57', '2023-11-29 11:23:57'),
(21, 6, 'Beauty of Face', 25, 0.00, NULL, '2023-11-29 11:23:57', '2023-11-29 11:23:57'),
(22, 6, 'Poise & Personality', 25, 0.00, NULL, '2023-11-29 11:23:57', '2023-11-29 11:23:57'),
(23, 6, 'Intelligence', 25, 0.00, NULL, '2023-11-29 11:23:57', '2023-11-29 11:23:57'),
(24, 7, 'Beauty, Appeal and Stage Presence', 100, 0.00, NULL, '2023-11-29 11:39:24', '2023-11-29 11:39:24');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `group_description` varchar(1000) DEFAULT NULL,
  `privileges` longtext DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `group_description`, `privileges`, `date_created`, `last_modified`) VALUES
(1, 'Tabulators', 'Tabulator', NULL, NULL, '2018-02-04 15:22:15'),
(2, 'Judges', 'Judge', NULL, NULL, '2018-02-04 15:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `individual_results`
--

CREATE TABLE `individual_results` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `round_id` int(11) DEFAULT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `award_id` int(11) DEFAULT NULL,
  `competition_id` int(11) DEFAULT NULL,
  `portion_contestant_id` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `contestant_no` int(11) DEFAULT NULL,
  `contestant` varchar(209) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `dismiss` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `event_id`, `user_id`, `icon`, `message`, `dismiss`, `date_created`, `last_modified`) VALUES
(1, 1, 1, 'fa-users', 'Dr. Rhodora A. Ngolob has finished scoring for <strong>BEST IN TALENT Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-29 20:07:48', '2024-11-29 20:07:48'),
(2, 1, 1, 'fa-users', 'Hon. Jennifer C. Mosuela-Fernandez has finished scoring for <strong>Beauty, Appeal and Stage Presence Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 21:31:16', '2024-11-30 21:31:16'),
(3, 1, 1, 'fa-users', 'Dr. Rhodora A. Ngolob has finished scoring for <strong>Beauty, Appeal and Stage Presence Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 21:31:18', '2024-11-30 21:31:18'),
(4, 1, 1, 'fa-users', 'Hon. Jennifer C. Mosuela-Fernandez has finished scoring for <strong>Beauty, Appeal and Stage Presence Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 21:31:23', '2024-11-30 21:31:23'),
(5, 1, 1, 'fa-users', 'Atty. Myra Diwata R. Caroy has finished scoring for <strong>Beauty, Appeal and Stage Presence Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 21:32:14', '2024-11-30 21:32:14'),
(6, 1, 1, 'fa-users', 'Engr. Aloysius Mapalo has finished scoring for <strong>Beauty, Appeal and Stage Presence Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 21:38:43', '2024-11-30 21:38:43'),
(7, 1, 1, 'fa-users', 'Engr. Aloysius Mapalo has finished scoring for <strong>BEST IN TALENT Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 22:18:03', '2024-11-30 22:18:03'),
(8, 1, 1, 'fa-users', 'Hon. Jennifer C. Mosuela-Fernandez has finished scoring for <strong>BEST IN TALENT Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 22:18:06', '2024-11-30 22:18:06'),
(9, 1, 1, 'fa-users', 'Dr. Rhodora A. Ngolob has finished scoring for <strong>BEST IN TALENT Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 22:18:21', '2024-11-30 22:18:21'),
(10, 1, 1, 'fa-users', 'Atty. Myra Diwata R. Caroy has finished scoring for <strong>BEST IN TALENT Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 22:19:52', '2024-11-30 22:19:52'),
(11, 1, 1, 'fa-users', 'Dr. Rhodora A. Ngolob has finished scoring for <strong>BEST IN SWIMSUIT Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 22:35:30', '2024-11-30 22:35:30'),
(12, 1, 1, 'fa-users', 'Hon. Jennifer C. Mosuela-Fernandez has finished scoring for <strong>BEST IN SWIMSUIT Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 22:35:44', '2024-11-30 22:35:44'),
(13, 1, 1, 'fa-users', 'Engr. Aloysius Mapalo has finished scoring for <strong>BEST IN SWIMSUIT Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 22:35:49', '2024-11-30 22:35:49'),
(14, 1, 1, 'fa-users', 'Atty. Myra Diwata R. Caroy has finished scoring for <strong>BEST IN SWIMSUIT Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 22:39:17', '2024-11-30 22:39:17'),
(15, 1, 1, 'fa-users', 'Dr. Rhodora A. Ngolob has finished scoring for <strong>BEST IN EVENING GOWN Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 23:31:52', '2024-11-30 23:31:52'),
(16, 1, 1, 'fa-users', 'Atty. Myra Diwata R. Caroy has finished scoring for <strong>BEST IN EVENING GOWN Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 23:32:05', '2024-11-30 23:32:05'),
(17, 1, 1, 'fa-users', 'Engr. Aloysius Mapalo has finished scoring for <strong>BEST IN EVENING GOWN Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 23:32:17', '2024-11-30 23:32:17'),
(18, 1, 1, 'fa-users', 'Hon. Jennifer C. Mosuela-Fernandez has finished scoring for <strong>BEST IN EVENING GOWN Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 23:32:40', '2024-11-30 23:32:40'),
(19, 1, 1, 'fa-users', 'Atty. Myra Diwata R. Caroy has finished scoring for <strong>QUESTION & ANSWER Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 23:57:19', '2024-11-30 23:57:19'),
(20, 1, 1, 'fa-users', 'Dr. Rhodora A. Ngolob has finished scoring for <strong>QUESTION & ANSWER Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 23:58:05', '2024-11-30 23:58:05'),
(21, 1, 1, 'fa-users', 'Hon. Jennifer C. Mosuela-Fernandez has finished scoring for <strong>QUESTION & ANSWER Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 23:58:23', '2024-11-30 23:58:23'),
(22, 1, 1, 'fa-users', 'Engr. Aloysius Mapalo has finished scoring for <strong>QUESTION & ANSWER Portion</strong><hr>Click this notification to dismiss', 0, '2024-11-30 23:58:25', '2024-11-30 23:58:25'),
(23, 1, 1, 'fa-users', 'Hon. Jennifer C. Mosuela-Fernandez has finished scoring for <strong>Final Judging Portion</strong><hr>Click this notification to dismiss', 0, '2024-12-01 00:52:56', '2024-12-01 00:52:56'),
(24, 1, 1, 'fa-users', 'Engr. Aloysius Mapalo has finished scoring for <strong>Final Judging Portion</strong><hr>Click this notification to dismiss', 0, '2024-12-01 00:53:15', '2024-12-01 00:53:15'),
(25, 1, 1, 'fa-users', 'Atty. Myra Diwata R. Caroy has finished scoring for <strong>Final Judging Portion</strong><hr>Click this notification to dismiss', 0, '2024-12-01 00:53:36', '2024-12-01 00:53:36'),
(26, 1, 1, 'fa-users', 'Dr. Rhodora A. Ngolob has finished scoring for <strong>Final Judging Portion</strong><hr>Click this notification to dismiss', 0, '2024-12-01 00:54:20', '2024-12-01 00:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `portions`
--

CREATE TABLE `portions` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `results` varchar(500) DEFAULT NULL,
  `score_by_rate` tinyint(4) DEFAULT NULL,
  `base_score` float(10,2) NOT NULL DEFAULT 0.00,
  `use_base_score` tinyint(4) NOT NULL DEFAULT 0,
  `rank_order` tinyint(4) NOT NULL DEFAULT 0,
  `rating_min` int(11) DEFAULT NULL,
  `rating_max` int(11) DEFAULT NULL,
  `is_shown` tinyint(4) DEFAULT NULL,
  `toggle` tinyint(4) NOT NULL DEFAULT 0,
  `event_tabulator` int(11) DEFAULT NULL,
  `event_chairman` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `portions`
--

INSERT INTO `portions` (`id`, `event_id`, `description`, `winners`, `remarks`, `results`, `score_by_rate`, `base_score`, `use_base_score`, `rank_order`, `rating_min`, `rating_max`, `is_shown`, `toggle`, `event_tabulator`, `event_chairman`, `date_created`, `last_modified`) VALUES
(1, 1, 'BEST IN TALENT', 1, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:13:44', '2024-11-30 22:19:57'),
(2, 1, 'BEST IN SWIMSUIT', 1, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:15:05', '2024-11-30 22:41:04'),
(3, 1, 'BEST IN EVENING GOWN', 1, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:16:20', '2024-11-30 23:32:49'),
(4, 1, 'QUESTION & ANSWER', 1, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:18:31', '2024-11-30 23:58:37'),
(5, 1, 'SELECTION OF TOP FIVE FINALIST', 5, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(6, 1, 'Final Judging', 5, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:23:57', '2024-12-01 00:54:27'),
(7, 1, 'Beauty, Appeal and Stage Presence', 1, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 3, '2023-11-29 11:39:24', '2024-11-30 21:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `portions_contestants`
--

CREATE TABLE `portions_contestants` (
  `id` int(11) NOT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `contestant_id` int(11) DEFAULT NULL,
  `contestant_rank` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `portions_contestants`
--

INSERT INTO `portions_contestants` (`id`, `portion_id`, `contestant_id`, `contestant_rank`, `date_created`, `last_modified`) VALUES
(4, 2, 1, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(5, 2, 2, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(6, 2, 3, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(7, 2, 4, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(8, 2, 5, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(9, 2, 6, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(10, 2, 7, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(11, 2, 8, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(12, 2, 9, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(13, 2, 10, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(14, 2, 11, NULL, '2023-11-29 19:42:10', '2023-11-29 19:42:10'),
(15, 3, 1, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(16, 3, 2, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(17, 3, 3, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(18, 3, 4, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(19, 3, 5, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(20, 3, 6, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(21, 3, 7, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(22, 3, 8, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(23, 3, 9, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(24, 3, 10, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(25, 3, 11, NULL, '2023-11-29 19:42:14', '2023-11-29 19:42:14'),
(26, 4, 1, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(27, 4, 2, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(28, 4, 3, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(29, 4, 4, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(30, 4, 5, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(31, 4, 6, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(32, 4, 7, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(33, 4, 8, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(34, 4, 9, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(35, 4, 10, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(36, 4, 11, NULL, '2023-11-29 19:42:19', '2023-11-29 19:42:19'),
(37, 5, 1, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(38, 5, 2, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(39, 5, 3, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(40, 5, 4, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(41, 5, 5, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(42, 5, 6, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(43, 5, 7, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(44, 5, 8, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(45, 5, 9, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(46, 5, 10, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(47, 5, 11, NULL, '2023-11-29 19:42:44', '2023-11-29 19:42:44'),
(48, 7, 1, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(49, 7, 2, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(50, 7, 3, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(51, 7, 4, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(52, 7, 5, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(53, 7, 6, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(54, 7, 7, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(55, 7, 8, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(56, 7, 9, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(57, 7, 10, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(58, 7, 11, NULL, '2023-11-29 19:42:48', '2023-11-29 19:42:48'),
(64, 2, 12, NULL, '2024-11-26 14:06:37', '2024-11-26 14:06:37'),
(65, 3, 12, NULL, '2024-11-26 14:06:55', '2024-11-26 14:06:55'),
(66, 4, 12, NULL, '2024-11-26 14:07:03', '2024-11-26 14:07:03'),
(67, 5, 12, NULL, '2024-11-26 14:07:13', '2024-11-26 14:07:13'),
(68, 7, 12, NULL, '2024-11-26 14:07:23', '2024-11-26 14:07:23'),
(69, 1, 1, NULL, '2024-11-26 14:32:39', '2024-11-26 14:32:39'),
(70, 1, 4, NULL, '2024-11-26 14:32:39', '2024-11-26 14:32:39'),
(71, 1, 5, NULL, '2024-11-26 14:32:39', '2024-11-26 14:32:39'),
(72, 6, 2, 1, '2024-12-01 00:06:07', '2024-12-01 00:06:07'),
(73, 6, 5, 2, '2024-12-01 00:06:07', '2024-12-01 00:06:07'),
(74, 6, 10, 3, '2024-12-01 00:06:07', '2024-12-01 00:06:07'),
(75, 6, 1, 4, '2024-12-01 00:06:07', '2024-12-01 00:06:07'),
(76, 6, 11, 5, '2024-12-01 00:06:07', '2024-12-01 00:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `portions_judges`
--

CREATE TABLE `portions_judges` (
  `id` int(11) NOT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `judge_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `portions_judges`
--

INSERT INTO `portions_judges` (`id`, `portion_id`, `judge_id`, `date_created`, `last_modified`) VALUES
(1, 1, 6, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(2, 1, 5, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(3, 1, 4, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(5, 1, 2, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(6, 2, 6, '2023-11-29 11:24:31', '2023-11-29 11:24:31'),
(7, 2, 5, '2023-11-29 11:24:32', '2023-11-29 11:24:32'),
(8, 2, 4, '2023-11-29 11:24:32', '2023-11-29 11:24:32'),
(10, 2, 2, '2023-11-29 11:24:32', '2023-11-29 11:24:32'),
(11, 3, 6, '2023-11-29 11:24:35', '2023-11-29 11:24:35'),
(12, 3, 5, '2023-11-29 11:24:35', '2023-11-29 11:24:35'),
(13, 3, 4, '2023-11-29 11:24:35', '2023-11-29 11:24:35'),
(15, 3, 2, '2023-11-29 11:24:35', '2023-11-29 11:24:35'),
(16, 4, 6, '2023-11-29 11:24:39', '2023-11-29 11:24:39'),
(17, 4, 5, '2023-11-29 11:24:39', '2023-11-29 11:24:39'),
(18, 4, 4, '2023-11-29 11:24:39', '2023-11-29 11:24:39'),
(20, 4, 2, '2023-11-29 11:24:39', '2023-11-29 11:24:39'),
(21, 5, 6, '2023-11-29 11:24:43', '2023-11-29 11:24:43'),
(22, 5, 5, '2023-11-29 11:24:43', '2023-11-29 11:24:43'),
(23, 5, 4, '2023-11-29 11:24:43', '2023-11-29 11:24:43'),
(25, 5, 2, '2023-11-29 11:24:43', '2023-11-29 11:24:43'),
(26, 6, 6, '2023-11-29 11:24:47', '2023-11-29 11:24:47'),
(27, 6, 5, '2023-11-29 11:24:47', '2023-11-29 11:24:47'),
(28, 6, 4, '2023-11-29 11:24:47', '2023-11-29 11:24:47'),
(30, 6, 2, '2023-11-29 11:24:47', '2023-11-29 11:24:47'),
(31, 7, 6, '2023-11-29 19:43:13', '2023-11-29 19:43:13'),
(32, 7, 5, '2023-11-29 19:43:13', '2023-11-29 19:43:13'),
(33, 7, 4, '2023-11-29 19:43:13', '2023-11-29 19:43:13'),
(35, 7, 2, '2023-11-29 19:43:13', '2023-11-29 19:43:13');

-- --------------------------------------------------------

--
-- Table structure for table `portions_judges_confirmation`
--

CREATE TABLE `portions_judges_confirmation` (
  `id` int(11) NOT NULL,
  `judge_id` int(11) DEFAULT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `confirmation` tinyint(4) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `portions_judges_confirmation`
--

INSERT INTO `portions_judges_confirmation` (`id`, `judge_id`, `portion_id`, `confirmation`, `date_created`, `last_modified`) VALUES
(1, 6, 7, 1, '2024-11-30 21:31:16', '2024-11-30 21:31:23'),
(2, 4, 7, 1, '2024-11-30 21:31:18', '2024-11-30 21:31:18'),
(3, 2, 7, 1, '2024-11-30 21:32:14', '2024-11-30 21:32:14'),
(4, 5, 7, 1, '2024-11-30 21:38:43', '2024-11-30 21:38:43'),
(5, 5, 1, 1, '2024-11-30 22:18:03', '2024-11-30 22:18:03'),
(6, 6, 1, 1, '2024-11-30 22:18:06', '2024-11-30 22:18:06'),
(7, 4, 1, 1, '2024-11-30 22:18:21', '2024-11-30 22:18:21'),
(8, 2, 1, 1, '2024-11-30 22:19:52', '2024-11-30 22:19:52'),
(9, 4, 2, 1, '2024-11-30 22:35:30', '2024-11-30 22:35:30'),
(10, 6, 2, 1, '2024-11-30 22:35:44', '2024-11-30 22:35:44'),
(11, 5, 2, 1, '2024-11-30 22:35:48', '2024-11-30 22:35:48'),
(12, 2, 2, 1, '2024-11-30 22:39:17', '2024-11-30 22:39:17'),
(13, 4, 3, 1, '2024-11-30 23:31:52', '2024-11-30 23:31:52'),
(14, 2, 3, 1, '2024-11-30 23:32:05', '2024-11-30 23:32:05'),
(15, 5, 3, 1, '2024-11-30 23:32:17', '2024-11-30 23:32:17'),
(16, 6, 3, 1, '2024-11-30 23:32:40', '2024-11-30 23:32:40'),
(17, 2, 4, 1, '2024-11-30 23:57:19', '2024-11-30 23:57:19'),
(18, 4, 4, 1, '2024-11-30 23:58:05', '2024-11-30 23:58:05'),
(19, 6, 4, 1, '2024-11-30 23:58:23', '2024-11-30 23:58:23'),
(20, 5, 4, 1, '2024-11-30 23:58:24', '2024-11-30 23:58:24'),
(21, 6, 6, 1, '2024-12-01 00:52:56', '2024-12-01 00:52:56'),
(22, 5, 6, 1, '2024-12-01 00:53:14', '2024-12-01 00:53:14'),
(23, 2, 6, 1, '2024-12-01 00:53:36', '2024-12-01 00:53:36'),
(24, 4, 6, 1, '2024-12-01 00:54:20', '2024-12-01 00:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `portions_places`
--

CREATE TABLE `portions_places` (
  `id` int(11) NOT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `portions_places`
--

INSERT INTO `portions_places` (`id`, `portion_id`, `rank`, `description`, `date_created`, `last_modified`) VALUES
(1, 1, 1, 'BEST IN TALENT', '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(2, 2, 1, 'BEST IN SWIMSUIT', '2023-11-29 11:15:05', '2023-11-29 11:15:05'),
(3, 3, 1, 'BEST IN EVENING GOWN', '2023-11-29 11:16:20', '2023-11-29 11:16:20'),
(4, 4, 1, 'MOST ARTICULATE', '2023-11-29 11:18:31', '2023-11-29 11:18:31'),
(5, 6, 1, 'MUTIA TI LUNA 2024', '2023-11-29 11:23:57', '2023-11-29 11:23:57'),
(6, 6, 2, 'MUTIA TI TURISMO 2024', '2023-11-29 11:23:58', '2023-11-29 11:23:58'),
(7, 6, 3, 'MUTIA TI KALIKASAN 2024', '2023-11-29 11:23:58', '2023-11-29 11:23:58'),
(8, 6, 4, '1ST RUNNER-UP', '2023-11-29 11:23:58', '2023-11-29 11:23:58'),
(9, 6, 5, '2ND RUNNER UP', '2023-11-29 11:23:58', '2023-11-29 11:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `portions_toggles`
--

CREATE TABLE `portions_toggles` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `system_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `portions_toggles`
--

INSERT INTO `portions_toggles` (`id`, `event_id`, `portion_id`, `user_id`, `system_log`) VALUES
(1, 1, 1, 8, '2023-11-29 22:44:54'),
(2, 1, 1, 8, '2023-11-29 23:01:50'),
(3, 1, 2, 8, '2023-11-29 23:01:52'),
(4, 1, 2, 8, '2023-11-29 23:25:46'),
(5, 1, 3, 8, '2023-11-29 23:38:08'),
(6, 1, 3, 8, '2023-11-29 23:38:32'),
(7, 1, 3, 8, '2023-11-29 23:49:18'),
(8, 1, 3, 8, '2023-11-29 23:49:44'),
(9, 1, 3, 8, '2023-11-29 23:55:01'),
(10, 1, 4, 8, '2023-11-30 00:18:31'),
(11, 1, 3, 8, '2023-11-30 00:21:14'),
(12, 1, 7, 8, '2023-11-30 00:38:38'),
(13, 1, 4, 8, '2023-11-30 00:38:41'),
(14, 1, 7, 8, '2023-11-30 00:49:58'),
(15, 1, 6, 8, '2023-11-30 01:11:56'),
(16, 1, 6, 8, '2023-11-30 01:11:58'),
(17, 1, 6, 8, '2023-11-30 01:12:20'),
(18, 1, 6, 8, '2023-11-30 01:35:03'),
(19, 1, 1, 1, '2024-11-26 15:15:53'),
(20, 1, 1, 1, '2024-11-26 15:19:00'),
(21, 1, 2, 1, '2024-11-26 15:19:18'),
(22, 1, 2, 1, '2024-11-26 15:24:19'),
(23, 1, 3, 1, '2024-11-26 15:24:21'),
(24, 1, 3, 1, '2024-11-26 15:29:14'),
(25, 1, 4, 1, '2024-11-26 15:29:17'),
(26, 1, 4, 1, '2024-11-26 15:33:13'),
(27, 1, 7, 1, '2024-11-26 15:33:14'),
(28, 1, 7, 1, '2024-11-26 15:35:22'),
(29, 1, 6, 1, '2024-11-26 15:36:01'),
(30, 1, 6, 1, '2024-11-26 15:38:25'),
(31, 1, 1, 1, '2024-11-29 20:07:25'),
(32, 1, 1, 1, '2024-11-30 16:16:11'),
(33, 1, 1, 1, '2024-11-30 17:13:18'),
(34, 1, 2, 1, '2024-11-30 17:13:21'),
(35, 1, 2, NULL, '2024-11-30 18:25:22'),
(36, 1, 1, 1, '2024-11-30 21:19:15'),
(37, 1, 1, 1, '2024-11-30 21:25:07'),
(38, 1, 7, 1, '2024-11-30 21:25:10'),
(39, 1, 7, 1, '2024-11-30 21:39:08'),
(40, 1, 1, 1, '2024-11-30 22:03:16'),
(41, 1, 1, 1, '2024-11-30 22:19:57'),
(42, 1, 2, 1, '2024-11-30 22:20:02'),
(43, 1, 2, 1, '2024-11-30 22:41:05'),
(44, 1, 3, 1, '2024-11-30 23:08:29'),
(45, 1, 3, 1, '2024-11-30 23:32:49'),
(46, 1, 4, 1, '2024-11-30 23:32:52'),
(47, 1, 4, 1, '2024-11-30 23:58:37'),
(48, 1, 6, 1, '2024-12-01 00:34:01'),
(49, 1, 6, 1, '2024-12-01 00:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `rounds`
--

CREATE TABLE `rounds` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `results` varchar(500) DEFAULT NULL,
  `rank_order` tinyint(4) NOT NULL DEFAULT 0,
  `method` varchar(50) DEFAULT NULL,
  `is_shown` tinyint(4) DEFAULT NULL,
  `event_tabulator` int(11) DEFAULT NULL,
  `event_chairman` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rounds_places`
--

CREATE TABLE `rounds_places` (
  `id` int(11) NOT NULL,
  `round_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rounds_portions`
--

CREATE TABLE `rounds_portions` (
  `id` int(11) NOT NULL,
  `round_id` int(11) DEFAULT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `judge_id` int(11) DEFAULT NULL,
  `portion_contestant_id` int(11) DEFAULT NULL,
  `score_criterion` int(11) DEFAULT NULL,
  `score` float(10,2) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `judge_id`, `portion_contestant_id`, `score_criterion`, `score`, `date_created`, `last_modified`) VALUES
(1, 6, 6, 5, 30.00, '2024-11-30 17:13:40', '2024-11-30 17:13:40'),
(2, 6, 6, 6, 28.00, '2024-11-30 17:13:40', '2024-11-30 17:13:40'),
(3, 6, 6, 7, 18.00, '2024-11-30 17:13:40', '2024-11-30 17:13:40'),
(4, 6, 6, 8, 20.00, '2024-11-30 17:13:40', '2024-11-30 17:13:40'),
(5, 6, 4, 5, 30.00, '2024-11-30 17:14:48', '2024-11-30 17:14:48'),
(6, 6, 4, 6, 28.00, '2024-11-30 17:14:48', '2024-11-30 17:14:48'),
(7, 6, 4, 7, 20.00, '2024-11-30 17:14:48', '2024-11-30 17:14:48'),
(8, 6, 4, 8, 19.00, '2024-11-30 17:14:48', '2024-11-30 17:14:48'),
(9, 6, 5, 5, 30.00, '2024-11-30 17:14:53', '2024-11-30 17:14:53'),
(10, 6, 5, 6, 29.00, '2024-11-30 17:14:53', '2024-11-30 17:14:53'),
(11, 6, 5, 7, 20.00, '2024-11-30 17:14:53', '2024-11-30 17:14:53'),
(12, 6, 5, 8, 20.00, '2024-11-30 17:14:53', '2024-11-30 17:14:53'),
(13, 6, 7, 5, 29.00, '2024-11-30 17:14:58', '2024-11-30 17:14:58'),
(14, 6, 7, 6, 28.00, '2024-11-30 17:14:58', '2024-11-30 17:14:58'),
(15, 6, 7, 7, 18.00, '2024-11-30 17:14:58', '2024-11-30 17:14:58'),
(16, 6, 7, 8, 20.00, '2024-11-30 17:14:58', '2024-11-30 17:14:58'),
(17, 6, 8, 5, 30.00, '2024-11-30 17:15:00', '2024-11-30 17:15:00'),
(18, 6, 8, 6, 25.00, '2024-11-30 17:15:00', '2024-11-30 17:15:00'),
(19, 6, 8, 7, 18.00, '2024-11-30 17:15:00', '2024-11-30 17:15:00'),
(20, 6, 8, 8, 20.00, '2024-11-30 17:15:00', '2024-11-30 17:15:00'),
(21, 6, 9, 5, 28.00, '2024-11-30 17:15:02', '2024-11-30 17:15:02'),
(22, 6, 9, 6, 25.00, '2024-11-30 17:15:02', '2024-11-30 17:15:02'),
(23, 6, 9, 7, 18.00, '2024-11-30 17:15:02', '2024-11-30 17:15:02'),
(24, 6, 9, 8, 20.00, '2024-11-30 17:15:02', '2024-11-30 17:15:02'),
(25, 6, 10, 5, 28.00, '2024-11-30 17:15:04', '2024-11-30 17:15:04'),
(26, 6, 10, 6, 29.00, '2024-11-30 17:15:04', '2024-11-30 17:15:04'),
(27, 6, 10, 7, 18.00, '2024-11-30 17:15:04', '2024-11-30 17:15:04'),
(28, 6, 10, 8, 20.00, '2024-11-30 17:15:04', '2024-11-30 17:15:04'),
(29, 6, 11, 5, 25.00, '2024-11-30 17:15:06', '2024-11-30 17:15:06'),
(30, 6, 11, 6, 27.00, '2024-11-30 17:15:06', '2024-11-30 17:15:06'),
(31, 6, 11, 7, 18.00, '2024-11-30 17:15:06', '2024-11-30 17:15:06'),
(32, 6, 11, 8, 18.00, '2024-11-30 17:15:06', '2024-11-30 17:15:06'),
(33, 6, 12, 5, 28.00, '2024-11-30 17:15:08', '2024-11-30 17:15:08'),
(34, 6, 12, 6, 25.00, '2024-11-30 17:15:08', '2024-11-30 17:15:08'),
(35, 6, 12, 7, 15.00, '2024-11-30 17:15:08', '2024-11-30 17:15:08'),
(36, 6, 12, 8, 20.00, '2024-11-30 17:15:08', '2024-11-30 17:15:08'),
(37, 6, 13, 5, 30.00, '2024-11-30 17:15:10', '2024-11-30 17:15:10'),
(38, 6, 13, 6, 30.00, '2024-11-30 17:15:10', '2024-11-30 17:15:10'),
(39, 6, 13, 7, 19.00, '2024-11-30 17:15:10', '2024-11-30 17:15:10'),
(40, 6, 13, 8, 20.00, '2024-11-30 17:15:10', '2024-11-30 17:15:10'),
(41, 6, 14, 5, 29.00, '2024-11-30 17:15:12', '2024-11-30 17:15:12'),
(42, 6, 14, 6, 30.00, '2024-11-30 17:15:12', '2024-11-30 17:15:12'),
(43, 6, 14, 7, 18.00, '2024-11-30 17:15:12', '2024-11-30 17:15:12'),
(44, 6, 14, 8, 20.00, '2024-11-30 17:15:12', '2024-11-30 17:15:12'),
(45, 6, 64, 5, 28.00, '2024-11-30 17:15:14', '2024-11-30 17:15:14'),
(46, 6, 64, 6, 25.00, '2024-11-30 17:15:14', '2024-11-30 17:15:14'),
(47, 6, 64, 7, 18.00, '2024-11-30 17:15:14', '2024-11-30 17:15:14'),
(48, 6, 64, 8, 18.00, '2024-11-30 17:15:14', '2024-11-30 17:15:14'),
(49, 2, 4, 5, 28.00, '2024-11-30 17:15:32', '2024-11-30 17:15:32'),
(50, 2, 4, 6, 28.00, '2024-11-30 17:15:32', '2024-11-30 17:15:32'),
(51, 2, 4, 7, 18.00, '2024-11-30 17:15:32', '2024-11-30 17:15:32'),
(52, 2, 4, 8, 18.00, '2024-11-30 17:15:32', '2024-11-30 17:15:32'),
(53, 5, 4, 5, 18.00, '2024-11-30 17:15:53', '2024-11-30 17:15:53'),
(54, 5, 4, 6, 20.00, '2024-11-30 17:15:53', '2024-11-30 17:15:53'),
(55, 5, 4, 7, 12.00, '2024-11-30 17:15:53', '2024-11-30 17:15:53'),
(56, 5, 4, 8, 15.00, '2024-11-30 17:15:53', '2024-11-30 17:15:53'),
(57, 4, 4, 5, 28.00, '2024-11-30 17:16:14', '2024-11-30 17:16:14'),
(58, 4, 4, 6, 27.00, '2024-11-30 17:16:14', '2024-11-30 17:16:14'),
(59, 4, 4, 7, 18.00, '2024-11-30 17:16:14', '2024-11-30 17:16:14'),
(60, 4, 4, 8, 18.00, '2024-11-30 17:16:14', '2024-11-30 17:16:14'),
(61, 5, 69, 1, 16.00, '2024-11-30 21:19:22', '2024-11-30 21:19:22'),
(62, 5, 69, 2, 20.00, '2024-11-30 21:19:22', '2024-11-30 21:19:22'),
(63, 5, 69, 3, 12.00, '2024-11-30 21:19:22', '2024-11-30 21:19:22'),
(64, 5, 69, 4, 14.00, '2024-11-30 21:19:22', '2024-11-30 21:19:22'),
(65, 6, 69, 1, 28.00, '2024-11-30 21:19:25', '2024-11-30 21:19:25'),
(66, 6, 69, 2, 30.00, '2024-11-30 21:19:25', '2024-11-30 21:19:25'),
(67, 6, 69, 3, 20.00, '2024-11-30 21:19:25', '2024-11-30 21:19:25'),
(68, 6, 69, 4, 20.00, '2024-11-30 21:19:25', '2024-11-30 21:19:25'),
(69, 4, 69, 1, 28.00, '2024-11-30 21:19:26', '2024-11-30 21:19:26'),
(70, 4, 69, 2, 28.00, '2024-11-30 21:19:26', '2024-11-30 21:19:26'),
(71, 4, 69, 3, 18.00, '2024-11-30 21:19:26', '2024-11-30 21:19:26'),
(72, 4, 69, 4, 18.00, '2024-11-30 21:19:26', '2024-11-30 21:19:26'),
(73, 2, 69, 1, 20.00, '2024-11-30 21:19:27', '2024-11-30 21:19:27'),
(74, 2, 69, 2, 25.00, '2024-11-30 21:19:27', '2024-11-30 21:19:27'),
(75, 2, 69, 3, 16.00, '2024-11-30 21:19:27', '2024-11-30 21:19:27'),
(76, 2, 69, 4, 15.00, '2024-11-30 21:19:27', '2024-11-30 21:19:27'),
(77, 2, 48, 24, 88.00, '2024-11-30 21:25:10', '2024-11-30 21:25:10'),
(78, 6, 48, 24, 89.00, '2024-11-30 21:25:11', '2024-11-30 21:25:11'),
(79, 5, 48, 24, 78.00, '2024-11-30 21:25:11', '2024-11-30 21:25:11'),
(80, 4, 48, 24, 94.00, '2024-11-30 21:25:12', '2024-11-30 21:25:12'),
(81, 4, 49, 24, 92.00, '2024-11-30 21:26:15', '2024-11-30 21:26:15'),
(82, 6, 49, 24, 85.00, '2024-11-30 21:26:16', '2024-11-30 21:26:16'),
(83, 4, 50, 24, 90.00, '2024-11-30 21:26:33', '2024-11-30 21:26:33'),
(84, 6, 50, 24, 87.00, '2024-11-30 21:26:38', '2024-11-30 21:26:38'),
(85, 4, 51, 24, 90.00, '2024-11-30 21:26:57', '2024-11-30 21:26:57'),
(86, 6, 51, 24, 86.00, '2024-11-30 21:27:01', '2024-11-30 21:27:01'),
(87, 5, 49, 24, 88.00, '2024-11-30 21:27:12', '2024-11-30 21:27:12'),
(88, 5, 50, 24, 87.00, '2024-11-30 21:27:21', '2024-11-30 21:27:21'),
(89, 4, 52, 24, 90.00, '2024-11-30 21:27:21', '2024-11-30 21:27:21'),
(90, 6, 52, 24, 87.00, '2024-11-30 21:27:31', '2024-11-30 21:27:31'),
(91, 5, 52, 24, 80.00, '2024-11-30 21:27:34', '2024-11-30 21:27:34'),
(92, 2, 49, 24, 87.00, '2024-11-30 21:27:53', '2024-11-30 21:27:53'),
(93, 6, 53, 24, 88.00, '2024-11-30 21:27:56', '2024-11-30 21:27:56'),
(94, 5, 53, 24, 76.00, '2024-11-30 21:27:58', '2024-11-30 21:27:58'),
(95, 2, 50, 24, 83.00, '2024-11-30 21:28:06', '2024-11-30 21:28:06'),
(96, 4, 53, 24, 90.00, '2024-11-30 21:28:08', '2024-11-30 21:28:08'),
(97, 2, 51, 24, 83.00, '2024-11-30 21:28:20', '2024-11-30 21:28:20'),
(98, 6, 54, 24, 85.00, '2024-11-30 21:28:21', '2024-11-30 21:28:21'),
(99, 5, 54, 24, 90.00, '2024-11-30 21:28:23', '2024-11-30 21:28:23'),
(100, 2, 52, 24, 90.00, '2024-11-30 21:28:33', '2024-11-30 21:28:33'),
(101, 4, 54, 24, 91.00, '2024-11-30 21:28:37', '2024-11-30 21:28:37'),
(102, 2, 53, 24, 82.00, '2024-11-30 21:28:41', '2024-11-30 21:28:41'),
(103, 2, 54, 24, 83.00, '2024-11-30 21:28:49', '2024-11-30 21:28:49'),
(104, 5, 55, 24, 75.00, '2024-11-30 21:28:50', '2024-11-30 21:28:50'),
(105, 6, 55, 24, 87.00, '2024-11-30 21:28:52', '2024-11-30 21:28:52'),
(106, 2, 55, 24, 85.00, '2024-11-30 21:28:58', '2024-11-30 21:28:58'),
(107, 4, 55, 24, 91.00, '2024-11-30 21:29:04', '2024-11-30 21:29:04'),
(108, 5, 56, 24, 76.00, '2024-11-30 21:29:14', '2024-11-30 21:29:14'),
(109, 2, 56, 24, 88.00, '2024-11-30 21:29:16', '2024-11-30 21:29:16'),
(110, 6, 56, 24, 88.00, '2024-11-30 21:29:23', '2024-11-30 21:29:23'),
(111, 4, 56, 24, 92.00, '2024-11-30 21:29:42', '2024-11-30 21:29:42'),
(112, 2, 57, 24, 90.00, '2024-11-30 21:29:43', '2024-11-30 21:29:43'),
(113, 5, 57, 24, 84.00, '2024-11-30 21:29:51', '2024-11-30 21:29:51'),
(114, 4, 57, 24, 91.00, '2024-11-30 21:29:59', '2024-11-30 21:29:59'),
(115, 6, 57, 24, 90.00, '2024-11-30 21:30:01', '2024-11-30 21:30:01'),
(116, 2, 58, 24, 83.00, '2024-11-30 21:30:13', '2024-11-30 21:30:13'),
(117, 5, 58, 24, 92.00, '2024-11-30 21:30:21', '2024-11-30 21:30:21'),
(118, 4, 58, 24, 93.00, '2024-11-30 21:30:24', '2024-11-30 21:30:24'),
(119, 6, 58, 24, 89.00, '2024-11-30 21:30:24', '2024-11-30 21:30:24'),
(120, 2, 68, 24, 83.00, '2024-11-30 21:30:42', '2024-11-30 21:30:42'),
(121, 6, 68, 24, 86.00, '2024-11-30 21:30:43', '2024-11-30 21:30:43'),
(122, 5, 68, 24, 85.00, '2024-11-30 21:30:48', '2024-11-30 21:30:48'),
(123, 4, 68, 24, 90.00, '2024-11-30 21:30:58', '2024-11-30 21:30:58'),
(124, 5, 51, 24, 78.00, '2024-11-30 21:31:34', '2024-11-30 21:31:34'),
(125, 5, 70, 1, 25.00, '2024-11-30 22:11:12', '2024-11-30 22:11:12'),
(126, 5, 70, 2, 25.00, '2024-11-30 22:11:12', '2024-11-30 22:11:12'),
(127, 5, 70, 3, 12.00, '2024-11-30 22:11:12', '2024-11-30 22:11:12'),
(128, 5, 70, 4, 18.00, '2024-11-30 22:11:12', '2024-11-30 22:11:12'),
(129, 6, 70, 1, 29.00, '2024-11-30 22:11:35', '2024-11-30 22:11:35'),
(130, 6, 70, 2, 30.00, '2024-11-30 22:11:35', '2024-11-30 22:11:35'),
(131, 6, 70, 3, 19.00, '2024-11-30 22:11:35', '2024-11-30 22:11:35'),
(132, 6, 70, 4, 20.00, '2024-11-30 22:11:35', '2024-11-30 22:11:35'),
(133, 2, 70, 1, 25.00, '2024-11-30 22:11:36', '2024-11-30 22:11:36'),
(134, 2, 70, 2, 22.00, '2024-11-30 22:11:36', '2024-11-30 22:11:36'),
(135, 2, 70, 3, 17.00, '2024-11-30 22:11:36', '2024-11-30 22:11:36'),
(136, 2, 70, 4, 18.00, '2024-11-30 22:11:36', '2024-11-30 22:11:36'),
(137, 4, 70, 1, 29.00, '2024-11-30 22:11:40', '2024-11-30 22:11:40'),
(138, 4, 70, 2, 27.00, '2024-11-30 22:11:40', '2024-11-30 22:11:40'),
(139, 4, 70, 3, 16.00, '2024-11-30 22:11:40', '2024-11-30 22:11:40'),
(140, 4, 70, 4, 18.00, '2024-11-30 22:11:40', '2024-11-30 22:11:40'),
(141, 6, 71, 1, 29.00, '2024-11-30 22:15:00', '2024-11-30 22:15:00'),
(142, 6, 71, 2, 30.00, '2024-11-30 22:15:00', '2024-11-30 22:15:00'),
(143, 6, 71, 3, 20.00, '2024-11-30 22:15:00', '2024-11-30 22:15:00'),
(144, 6, 71, 4, 20.00, '2024-11-30 22:15:00', '2024-11-30 22:15:00'),
(145, 5, 71, 1, 26.00, '2024-11-30 22:15:04', '2024-11-30 22:15:04'),
(146, 5, 71, 2, 28.00, '2024-11-30 22:15:04', '2024-11-30 22:15:04'),
(147, 5, 71, 3, 18.00, '2024-11-30 22:15:04', '2024-11-30 22:15:04'),
(148, 5, 71, 4, 20.00, '2024-11-30 22:15:04', '2024-11-30 22:15:04'),
(149, 2, 71, 1, 27.00, '2024-11-30 22:15:16', '2024-11-30 22:15:16'),
(150, 2, 71, 2, 25.00, '2024-11-30 22:15:16', '2024-11-30 22:15:16'),
(151, 2, 71, 3, 15.00, '2024-11-30 22:15:16', '2024-11-30 22:15:16'),
(152, 2, 71, 4, 18.00, '2024-11-30 22:15:16', '2024-11-30 22:15:16'),
(153, 4, 71, 1, 26.00, '2024-11-30 22:15:35', '2024-11-30 22:15:35'),
(154, 4, 71, 2, 28.00, '2024-11-30 22:15:35', '2024-11-30 22:15:35'),
(155, 4, 71, 3, 17.00, '2024-11-30 22:15:35', '2024-11-30 22:15:35'),
(156, 4, 71, 4, 19.00, '2024-11-30 22:15:35', '2024-11-30 22:15:35'),
(157, 2, 5, 5, 24.00, '2024-11-30 22:26:58', '2024-11-30 22:26:58'),
(158, 2, 5, 6, 28.00, '2024-11-30 22:26:58', '2024-11-30 22:26:58'),
(159, 2, 5, 7, 17.00, '2024-11-30 22:26:58', '2024-11-30 22:26:58'),
(160, 2, 5, 8, 17.00, '2024-11-30 22:26:58', '2024-11-30 22:26:58'),
(161, 5, 5, 5, 27.00, '2024-11-30 22:27:09', '2024-11-30 22:27:09'),
(162, 5, 5, 6, 28.00, '2024-11-30 22:27:09', '2024-11-30 22:27:09'),
(163, 5, 5, 7, 19.00, '2024-11-30 22:27:09', '2024-11-30 22:27:09'),
(164, 5, 5, 8, 18.00, '2024-11-30 22:27:09', '2024-11-30 22:27:09'),
(165, 4, 5, 5, 29.00, '2024-11-30 22:27:21', '2024-11-30 22:27:21'),
(166, 4, 5, 6, 27.00, '2024-11-30 22:27:21', '2024-11-30 22:27:21'),
(167, 4, 5, 7, 18.00, '2024-11-30 22:27:21', '2024-11-30 22:27:21'),
(168, 4, 5, 8, 17.00, '2024-11-30 22:27:21', '2024-11-30 22:27:21'),
(169, 4, 6, 5, 25.00, '2024-11-30 22:27:47', '2024-11-30 22:27:47'),
(170, 4, 6, 6, 25.00, '2024-11-30 22:27:47', '2024-11-30 22:27:47'),
(171, 4, 6, 7, 16.00, '2024-11-30 22:27:47', '2024-11-30 22:27:47'),
(172, 4, 6, 8, 16.00, '2024-11-30 22:27:47', '2024-11-30 22:27:47'),
(173, 2, 6, 5, 23.00, '2024-11-30 22:27:50', '2024-11-30 22:27:50'),
(174, 2, 6, 6, 24.00, '2024-11-30 22:27:50', '2024-11-30 22:27:50'),
(175, 2, 6, 7, 12.00, '2024-11-30 22:27:50', '2024-11-30 22:27:50'),
(176, 2, 6, 8, 12.00, '2024-11-30 22:27:50', '2024-11-30 22:27:50'),
(177, 5, 6, 5, 16.00, '2024-11-30 22:28:00', '2024-11-30 22:28:00'),
(178, 5, 6, 6, 21.00, '2024-11-30 22:28:00', '2024-11-30 22:28:00'),
(179, 5, 6, 7, 13.00, '2024-11-30 22:28:00', '2024-11-30 22:28:00'),
(180, 5, 6, 8, 12.00, '2024-11-30 22:28:00', '2024-11-30 22:28:00'),
(181, 4, 7, 5, 27.00, '2024-11-30 22:28:14', '2024-11-30 22:28:14'),
(182, 4, 7, 6, 26.00, '2024-11-30 22:28:14', '2024-11-30 22:28:14'),
(183, 4, 7, 7, 18.00, '2024-11-30 22:28:14', '2024-11-30 22:28:14'),
(184, 4, 7, 8, 17.00, '2024-11-30 22:28:14', '2024-11-30 22:28:14'),
(185, 2, 7, 5, 23.00, '2024-11-30 22:28:17', '2024-11-30 22:28:17'),
(186, 2, 7, 6, 27.00, '2024-11-30 22:28:17', '2024-11-30 22:28:17'),
(187, 2, 7, 7, 16.00, '2024-11-30 22:28:17', '2024-11-30 22:28:17'),
(188, 2, 7, 8, 14.00, '2024-11-30 22:28:17', '2024-11-30 22:28:17'),
(189, 5, 7, 5, 20.00, '2024-11-30 22:28:31', '2024-11-30 22:28:31'),
(190, 5, 7, 6, 16.00, '2024-11-30 22:28:31', '2024-11-30 22:28:31'),
(191, 5, 7, 7, 14.00, '2024-11-30 22:28:31', '2024-11-30 22:28:31'),
(192, 5, 7, 8, 12.00, '2024-11-30 22:28:31', '2024-11-30 22:28:31'),
(193, 4, 8, 5, 26.00, '2024-11-30 22:28:39', '2024-11-30 22:28:39'),
(194, 4, 8, 6, 27.00, '2024-11-30 22:28:39', '2024-11-30 22:28:39'),
(195, 4, 8, 7, 18.00, '2024-11-30 22:28:39', '2024-11-30 22:28:39'),
(196, 4, 8, 8, 17.00, '2024-11-30 22:28:39', '2024-11-30 22:28:39'),
(197, 2, 8, 5, 26.00, '2024-11-30 22:29:04', '2024-11-30 22:29:04'),
(198, 2, 8, 6, 27.00, '2024-11-30 22:29:04', '2024-11-30 22:29:04'),
(199, 2, 8, 7, 17.00, '2024-11-30 22:29:04', '2024-11-30 22:29:04'),
(200, 2, 8, 8, 16.00, '2024-11-30 22:29:04', '2024-11-30 22:29:04'),
(201, 5, 8, 5, 27.00, '2024-11-30 22:29:08', '2024-11-30 22:29:08'),
(202, 5, 8, 6, 26.00, '2024-11-30 22:29:08', '2024-11-30 22:29:08'),
(203, 5, 8, 7, 17.00, '2024-11-30 22:29:08', '2024-11-30 22:29:08'),
(204, 5, 8, 8, 16.00, '2024-11-30 22:29:08', '2024-11-30 22:29:08'),
(205, 4, 9, 5, 25.00, '2024-11-30 22:29:33', '2024-11-30 22:29:33'),
(206, 4, 9, 6, 25.00, '2024-11-30 22:29:33', '2024-11-30 22:29:33'),
(207, 4, 9, 7, 16.00, '2024-11-30 22:29:33', '2024-11-30 22:29:33'),
(208, 4, 9, 8, 16.00, '2024-11-30 22:29:33', '2024-11-30 22:29:33'),
(209, 5, 9, 5, 18.00, '2024-11-30 22:29:36', '2024-11-30 22:29:36'),
(210, 5, 9, 6, 25.00, '2024-11-30 22:29:36', '2024-11-30 22:29:36'),
(211, 5, 9, 7, 14.00, '2024-11-30 22:29:36', '2024-11-30 22:29:36'),
(212, 5, 9, 8, 12.00, '2024-11-30 22:29:36', '2024-11-30 22:29:36'),
(213, 2, 9, 5, 23.00, '2024-11-30 22:29:40', '2024-11-30 22:29:40'),
(214, 2, 9, 6, 27.00, '2024-11-30 22:29:40', '2024-11-30 22:29:40'),
(215, 2, 9, 7, 14.00, '2024-11-30 22:29:40', '2024-11-30 22:29:40'),
(216, 2, 9, 8, 15.00, '2024-11-30 22:29:40', '2024-11-30 22:29:40'),
(217, 5, 10, 5, 23.00, '2024-11-30 22:30:11', '2024-11-30 22:30:11'),
(218, 5, 10, 6, 24.00, '2024-11-30 22:30:11', '2024-11-30 22:30:11'),
(219, 5, 10, 7, 14.00, '2024-11-30 22:30:11', '2024-11-30 22:30:11'),
(220, 5, 10, 8, 13.00, '2024-11-30 22:30:11', '2024-11-30 22:30:11'),
(221, 4, 10, 5, 26.00, '2024-11-30 22:30:13', '2024-11-30 22:30:13'),
(222, 4, 10, 6, 26.00, '2024-11-30 22:30:13', '2024-11-30 22:30:13'),
(223, 4, 10, 7, 17.00, '2024-11-30 22:30:13', '2024-11-30 22:30:13'),
(224, 4, 10, 8, 16.00, '2024-11-30 22:30:13', '2024-11-30 22:30:13'),
(225, 2, 10, 5, 25.00, '2024-11-30 22:30:13', '2024-11-30 22:30:13'),
(226, 2, 10, 6, 28.00, '2024-11-30 22:30:13', '2024-11-30 22:30:13'),
(227, 2, 10, 7, 18.00, '2024-11-30 22:30:13', '2024-11-30 22:30:13'),
(228, 2, 10, 8, 16.00, '2024-11-30 22:30:13', '2024-11-30 22:30:13'),
(229, 2, 11, 5, 24.00, '2024-11-30 22:30:47', '2024-11-30 22:30:47'),
(230, 2, 11, 6, 23.00, '2024-11-30 22:30:47', '2024-11-30 22:30:47'),
(231, 2, 11, 7, 12.00, '2024-11-30 22:30:47', '2024-11-30 22:30:47'),
(232, 2, 11, 8, 13.00, '2024-11-30 22:30:47', '2024-11-30 22:30:47'),
(233, 5, 11, 5, 14.00, '2024-11-30 22:30:50', '2024-11-30 22:30:50'),
(234, 5, 11, 6, 18.00, '2024-11-30 22:30:50', '2024-11-30 22:30:50'),
(235, 5, 11, 7, 10.00, '2024-11-30 22:30:50', '2024-11-30 22:30:50'),
(236, 5, 11, 8, 13.00, '2024-11-30 22:30:50', '2024-11-30 22:30:50'),
(237, 4, 11, 5, 25.00, '2024-11-30 22:30:52', '2024-11-30 22:30:52'),
(238, 4, 11, 6, 26.00, '2024-11-30 22:30:52', '2024-11-30 22:30:52'),
(239, 4, 11, 7, 16.00, '2024-11-30 22:30:52', '2024-11-30 22:30:52'),
(240, 4, 11, 8, 16.00, '2024-11-30 22:30:52', '2024-11-30 22:30:52'),
(241, 4, 12, 5, 26.00, '2024-11-30 22:31:28', '2024-11-30 22:31:28'),
(242, 4, 12, 6, 26.00, '2024-11-30 22:31:28', '2024-11-30 22:31:28'),
(243, 4, 12, 7, 16.00, '2024-11-30 22:31:28', '2024-11-30 22:31:28'),
(244, 4, 12, 8, 16.00, '2024-11-30 22:31:28', '2024-11-30 22:31:28'),
(245, 2, 12, 5, 25.00, '2024-11-30 22:31:32', '2024-11-30 22:31:32'),
(246, 2, 12, 6, 24.00, '2024-11-30 22:31:32', '2024-11-30 22:31:32'),
(247, 2, 12, 7, 14.00, '2024-11-30 22:31:32', '2024-11-30 22:31:32'),
(248, 2, 12, 8, 13.00, '2024-11-30 22:31:32', '2024-11-30 22:31:32'),
(249, 5, 12, 5, 23.00, '2024-11-30 22:31:42', '2024-11-30 22:31:42'),
(250, 5, 12, 6, 25.00, '2024-11-30 22:31:42', '2024-11-30 22:31:42'),
(251, 5, 12, 7, 14.00, '2024-11-30 22:31:42', '2024-11-30 22:31:42'),
(252, 5, 12, 8, 12.00, '2024-11-30 22:31:42', '2024-11-30 22:31:42'),
(253, 5, 13, 5, 22.00, '2024-11-30 22:32:14', '2024-11-30 22:32:14'),
(254, 5, 13, 6, 20.00, '2024-11-30 22:32:14', '2024-11-30 22:32:14'),
(255, 5, 13, 7, 15.00, '2024-11-30 22:32:14', '2024-11-30 22:32:14'),
(256, 5, 13, 8, 15.00, '2024-11-30 22:32:14', '2024-11-30 22:32:14'),
(257, 2, 13, 5, 27.00, '2024-11-30 22:32:15', '2024-11-30 22:32:15'),
(258, 2, 13, 6, 24.00, '2024-11-30 22:32:15', '2024-11-30 22:32:15'),
(259, 2, 13, 7, 16.00, '2024-11-30 22:32:15', '2024-11-30 22:32:15'),
(260, 2, 13, 8, 17.00, '2024-11-30 22:32:15', '2024-11-30 22:32:15'),
(261, 4, 13, 5, 26.00, '2024-11-30 22:32:15', '2024-11-30 22:32:15'),
(262, 4, 13, 6, 26.00, '2024-11-30 22:32:15', '2024-11-30 22:32:15'),
(263, 4, 13, 7, 16.00, '2024-11-30 22:32:15', '2024-11-30 22:32:15'),
(264, 4, 13, 8, 16.00, '2024-11-30 22:32:15', '2024-11-30 22:32:15'),
(265, 4, 14, 5, 28.00, '2024-11-30 22:32:41', '2024-11-30 22:32:41'),
(266, 4, 14, 6, 28.00, '2024-11-30 22:32:41', '2024-11-30 22:32:41'),
(267, 4, 14, 7, 18.00, '2024-11-30 22:32:41', '2024-11-30 22:32:41'),
(268, 4, 14, 8, 18.00, '2024-11-30 22:32:41', '2024-11-30 22:32:41'),
(269, 5, 14, 5, 29.00, '2024-11-30 22:32:44', '2024-11-30 22:32:44'),
(270, 5, 14, 6, 28.00, '2024-11-30 22:32:44', '2024-11-30 22:32:44'),
(271, 5, 14, 7, 20.00, '2024-11-30 22:32:44', '2024-11-30 22:32:44'),
(272, 5, 14, 8, 18.00, '2024-11-30 22:32:44', '2024-11-30 22:32:44'),
(273, 2, 14, 5, 24.00, '2024-11-30 22:32:48', '2024-11-30 22:32:48'),
(274, 2, 14, 6, 24.00, '2024-11-30 22:32:48', '2024-11-30 22:32:48'),
(275, 2, 14, 7, 16.00, '2024-11-30 22:32:48', '2024-11-30 22:32:48'),
(276, 2, 14, 8, 17.00, '2024-11-30 22:32:48', '2024-11-30 22:32:48'),
(277, 2, 64, 5, 24.00, '2024-11-30 22:33:19', '2024-11-30 22:33:19'),
(278, 2, 64, 6, 27.00, '2024-11-30 22:33:19', '2024-11-30 22:33:19'),
(279, 2, 64, 7, 16.00, '2024-11-30 22:33:19', '2024-11-30 22:33:19'),
(280, 2, 64, 8, 17.00, '2024-11-30 22:33:19', '2024-11-30 22:33:19'),
(281, 5, 64, 5, 22.00, '2024-11-30 22:33:21', '2024-11-30 22:33:21'),
(282, 5, 64, 6, 20.00, '2024-11-30 22:33:21', '2024-11-30 22:33:21'),
(283, 5, 64, 7, 16.00, '2024-11-30 22:33:21', '2024-11-30 22:33:21'),
(284, 5, 64, 8, 15.00, '2024-11-30 22:33:21', '2024-11-30 22:33:21'),
(285, 4, 64, 5, 26.00, '2024-11-30 22:33:21', '2024-11-30 22:33:21'),
(286, 4, 64, 6, 25.00, '2024-11-30 22:33:21', '2024-11-30 22:33:21'),
(287, 4, 64, 7, 16.00, '2024-11-30 22:33:21', '2024-11-30 22:33:21'),
(288, 4, 64, 8, 16.00, '2024-11-30 22:33:21', '2024-11-30 22:33:21'),
(289, 5, 15, 9, 22.00, '2024-11-30 23:08:29', '2024-11-30 23:08:29'),
(290, 5, 15, 10, 24.00, '2024-11-30 23:08:29', '2024-11-30 23:08:29'),
(291, 5, 15, 11, 15.00, '2024-11-30 23:08:29', '2024-11-30 23:08:29'),
(292, 5, 15, 12, 18.00, '2024-11-30 23:08:29', '2024-11-30 23:08:29'),
(293, 4, 15, 9, 28.00, '2024-11-30 23:08:30', '2024-11-30 23:08:30'),
(294, 4, 15, 10, 28.00, '2024-11-30 23:08:30', '2024-11-30 23:08:30'),
(295, 4, 15, 11, 18.00, '2024-11-30 23:08:30', '2024-11-30 23:08:30'),
(296, 4, 15, 12, 18.00, '2024-11-30 23:08:30', '2024-11-30 23:08:30'),
(297, 2, 15, 9, 28.00, '2024-11-30 23:08:30', '2024-11-30 23:08:30'),
(298, 2, 15, 10, 27.00, '2024-11-30 23:08:30', '2024-11-30 23:08:30'),
(299, 2, 15, 11, 18.00, '2024-11-30 23:08:30', '2024-11-30 23:08:30'),
(300, 2, 15, 12, 18.00, '2024-11-30 23:08:30', '2024-11-30 23:08:30'),
(301, 6, 15, 9, 28.00, '2024-11-30 23:08:31', '2024-11-30 23:08:31'),
(302, 6, 15, 10, 30.00, '2024-11-30 23:08:31', '2024-11-30 23:08:31'),
(303, 6, 15, 11, 20.00, '2024-11-30 23:08:31', '2024-11-30 23:08:31'),
(304, 6, 15, 12, 19.00, '2024-11-30 23:08:31', '2024-11-30 23:08:31'),
(305, 5, 16, 9, 27.00, '2024-11-30 23:15:10', '2024-11-30 23:15:10'),
(306, 5, 16, 10, 26.00, '2024-11-30 23:15:10', '2024-11-30 23:15:10'),
(307, 5, 16, 11, 18.00, '2024-11-30 23:15:10', '2024-11-30 23:15:10'),
(308, 5, 16, 12, 20.00, '2024-11-30 23:15:10', '2024-11-30 23:15:10'),
(309, 6, 16, 9, 29.00, '2024-11-30 23:15:30', '2024-11-30 23:15:30'),
(310, 6, 16, 10, 28.00, '2024-11-30 23:15:30', '2024-11-30 23:15:30'),
(311, 6, 16, 11, 19.00, '2024-11-30 23:15:30', '2024-11-30 23:15:30'),
(312, 6, 16, 12, 20.00, '2024-11-30 23:15:30', '2024-11-30 23:15:30'),
(313, 2, 16, 9, 28.00, '2024-11-30 23:15:30', '2024-11-30 23:15:30'),
(314, 2, 16, 10, 28.00, '2024-11-30 23:15:30', '2024-11-30 23:15:30'),
(315, 2, 16, 11, 18.00, '2024-11-30 23:15:31', '2024-11-30 23:15:31'),
(316, 2, 16, 12, 17.00, '2024-11-30 23:15:31', '2024-11-30 23:15:31'),
(317, 5, 17, 9, 20.00, '2024-11-30 23:16:42', '2024-11-30 23:16:42'),
(318, 5, 17, 10, 20.00, '2024-11-30 23:16:42', '2024-11-30 23:16:42'),
(319, 5, 17, 11, 14.00, '2024-11-30 23:16:42', '2024-11-30 23:16:42'),
(320, 5, 17, 12, 15.00, '2024-11-30 23:16:43', '2024-11-30 23:16:43'),
(321, 4, 16, 9, 27.00, '2024-11-30 23:16:49', '2024-11-30 23:16:49'),
(322, 4, 16, 10, 26.00, '2024-11-30 23:16:49', '2024-11-30 23:16:49'),
(323, 4, 16, 11, 16.00, '2024-11-30 23:16:49', '2024-11-30 23:16:49'),
(324, 4, 16, 12, 16.00, '2024-11-30 23:16:49', '2024-11-30 23:16:49'),
(325, 6, 17, 9, 27.00, '2024-11-30 23:16:57', '2024-11-30 23:16:57'),
(326, 6, 17, 10, 25.00, '2024-11-30 23:16:57', '2024-11-30 23:16:57'),
(327, 6, 17, 11, 18.00, '2024-11-30 23:16:57', '2024-11-30 23:16:57'),
(328, 6, 17, 12, 18.00, '2024-11-30 23:16:57', '2024-11-30 23:16:57'),
(329, 2, 17, 9, 23.00, '2024-11-30 23:17:05', '2024-11-30 23:17:05'),
(330, 2, 17, 10, 23.00, '2024-11-30 23:17:05', '2024-11-30 23:17:05'),
(331, 2, 17, 11, 13.00, '2024-11-30 23:17:05', '2024-11-30 23:17:05'),
(332, 2, 17, 12, 13.00, '2024-11-30 23:17:05', '2024-11-30 23:17:05'),
(333, 4, 17, 9, 23.00, '2024-11-30 23:17:19', '2024-11-30 23:17:19'),
(334, 4, 17, 10, 23.00, '2024-11-30 23:17:19', '2024-11-30 23:17:19'),
(335, 4, 17, 11, 15.00, '2024-11-30 23:17:19', '2024-11-30 23:17:19'),
(336, 4, 17, 12, 15.00, '2024-11-30 23:17:19', '2024-11-30 23:17:19'),
(337, 4, 18, 9, 25.00, '2024-11-30 23:17:46', '2024-11-30 23:17:46'),
(338, 4, 18, 10, 25.00, '2024-11-30 23:17:46', '2024-11-30 23:17:46'),
(339, 4, 18, 11, 15.00, '2024-11-30 23:17:46', '2024-11-30 23:17:46'),
(340, 4, 18, 12, 15.00, '2024-11-30 23:17:46', '2024-11-30 23:17:46'),
(341, 2, 18, 9, 22.00, '2024-11-30 23:17:57', '2024-11-30 23:17:57'),
(342, 2, 18, 10, 27.00, '2024-11-30 23:17:57', '2024-11-30 23:17:57'),
(343, 2, 18, 11, 12.00, '2024-11-30 23:17:57', '2024-11-30 23:17:57'),
(344, 2, 18, 12, 12.00, '2024-11-30 23:17:57', '2024-11-30 23:17:57'),
(345, 5, 18, 9, 16.00, '2024-11-30 23:18:04', '2024-11-30 23:18:04'),
(346, 5, 18, 10, 18.00, '2024-11-30 23:18:04', '2024-11-30 23:18:04'),
(347, 5, 18, 11, 12.00, '2024-11-30 23:18:04', '2024-11-30 23:18:04'),
(348, 5, 18, 12, 14.00, '2024-11-30 23:18:04', '2024-11-30 23:18:04'),
(349, 6, 18, 9, 28.00, '2024-11-30 23:18:16', '2024-11-30 23:18:16'),
(350, 6, 18, 10, 18.00, '2024-11-30 23:18:16', '2024-11-30 23:18:16'),
(351, 6, 18, 11, 18.00, '2024-11-30 23:18:16', '2024-11-30 23:18:16'),
(352, 6, 18, 12, 17.00, '2024-11-30 23:18:16', '2024-11-30 23:18:16'),
(353, 2, 19, 9, 28.00, '2024-11-30 23:19:00', '2024-11-30 23:19:00'),
(354, 2, 19, 10, 26.00, '2024-11-30 23:19:00', '2024-11-30 23:19:00'),
(355, 2, 19, 11, 16.00, '2024-11-30 23:19:00', '2024-11-30 23:19:00'),
(356, 2, 19, 12, 17.00, '2024-11-30 23:19:00', '2024-11-30 23:19:00'),
(357, 4, 19, 9, 25.00, '2024-11-30 23:19:12', '2024-11-30 23:19:12'),
(358, 4, 19, 10, 25.00, '2024-11-30 23:19:12', '2024-11-30 23:19:12'),
(359, 4, 19, 11, 15.00, '2024-11-30 23:19:12', '2024-11-30 23:19:12'),
(360, 4, 19, 12, 15.00, '2024-11-30 23:19:12', '2024-11-30 23:19:12'),
(361, 5, 19, 9, 26.00, '2024-11-30 23:19:14', '2024-11-30 23:19:14'),
(362, 5, 19, 10, 28.00, '2024-11-30 23:19:14', '2024-11-30 23:19:14'),
(363, 5, 19, 11, 16.00, '2024-11-30 23:19:14', '2024-11-30 23:19:14'),
(364, 5, 19, 12, 17.00, '2024-11-30 23:19:14', '2024-11-30 23:19:14'),
(365, 6, 19, 9, 28.00, '2024-11-30 23:19:27', '2024-11-30 23:19:27'),
(366, 6, 19, 10, 27.00, '2024-11-30 23:19:27', '2024-11-30 23:19:27'),
(367, 6, 19, 11, 18.00, '2024-11-30 23:19:27', '2024-11-30 23:19:27'),
(368, 6, 19, 12, 19.00, '2024-11-30 23:19:27', '2024-11-30 23:19:27'),
(369, 4, 20, 9, 26.00, '2024-11-30 23:20:06', '2024-11-30 23:20:06'),
(370, 4, 20, 10, 26.00, '2024-11-30 23:20:06', '2024-11-30 23:20:06'),
(371, 4, 20, 11, 15.00, '2024-11-30 23:20:06', '2024-11-30 23:20:06'),
(372, 4, 20, 12, 15.00, '2024-11-30 23:20:06', '2024-11-30 23:20:06'),
(373, 2, 20, 9, 24.00, '2024-11-30 23:20:29', '2024-11-30 23:20:29'),
(374, 2, 20, 10, 27.00, '2024-11-30 23:20:29', '2024-11-30 23:20:29'),
(375, 2, 20, 11, 13.00, '2024-11-30 23:20:29', '2024-11-30 23:20:29'),
(376, 2, 20, 12, 14.00, '2024-11-30 23:20:29', '2024-11-30 23:20:29'),
(377, 5, 20, 9, 16.00, '2024-11-30 23:20:30', '2024-11-30 23:20:30'),
(378, 5, 20, 10, 20.00, '2024-11-30 23:20:30', '2024-11-30 23:20:30'),
(379, 5, 20, 11, 14.00, '2024-11-30 23:20:30', '2024-11-30 23:20:30'),
(380, 5, 20, 12, 12.00, '2024-11-30 23:20:30', '2024-11-30 23:20:30'),
(381, 6, 20, 9, 29.00, '2024-11-30 23:20:37', '2024-11-30 23:20:37'),
(382, 6, 20, 10, 29.00, '2024-11-30 23:20:37', '2024-11-30 23:20:37'),
(383, 6, 20, 11, 18.00, '2024-11-30 23:20:37', '2024-11-30 23:20:37'),
(384, 6, 20, 12, 18.00, '2024-11-30 23:20:37', '2024-11-30 23:20:37'),
(385, 2, 21, 9, 28.00, '2024-11-30 23:21:26', '2024-11-30 23:21:26'),
(386, 2, 21, 10, 24.00, '2024-11-30 23:21:26', '2024-11-30 23:21:26'),
(387, 2, 21, 11, 16.00, '2024-11-30 23:21:26', '2024-11-30 23:21:26'),
(388, 2, 21, 12, 14.00, '2024-11-30 23:21:26', '2024-11-30 23:21:26'),
(389, 5, 21, 9, 24.00, '2024-11-30 23:21:36', '2024-11-30 23:21:36'),
(390, 5, 21, 10, 22.00, '2024-11-30 23:21:36', '2024-11-30 23:21:36'),
(391, 5, 21, 11, 16.00, '2024-11-30 23:21:36', '2024-11-30 23:21:36'),
(392, 5, 21, 12, 16.00, '2024-11-30 23:21:36', '2024-11-30 23:21:36'),
(393, 4, 21, 9, 26.00, '2024-11-30 23:21:41', '2024-11-30 23:21:41'),
(394, 4, 21, 10, 26.00, '2024-11-30 23:21:41', '2024-11-30 23:21:41'),
(395, 4, 21, 11, 16.00, '2024-11-30 23:21:41', '2024-11-30 23:21:41'),
(396, 4, 21, 12, 15.00, '2024-11-30 23:21:41', '2024-11-30 23:21:41'),
(397, 6, 21, 9, 27.00, '2024-11-30 23:21:47', '2024-11-30 23:21:47'),
(398, 6, 21, 10, 27.00, '2024-11-30 23:21:47', '2024-11-30 23:21:47'),
(399, 6, 21, 11, 18.00, '2024-11-30 23:21:47', '2024-11-30 23:21:47'),
(400, 6, 21, 12, 15.00, '2024-11-30 23:21:47', '2024-11-30 23:21:47'),
(401, 2, 22, 9, 23.00, '2024-11-30 23:22:44', '2024-11-30 23:22:44'),
(402, 2, 22, 10, 24.00, '2024-11-30 23:22:44', '2024-11-30 23:22:44'),
(403, 2, 22, 11, 12.00, '2024-11-30 23:22:44', '2024-11-30 23:22:44'),
(404, 2, 22, 12, 13.00, '2024-11-30 23:22:44', '2024-11-30 23:22:44'),
(405, 4, 22, 9, 25.00, '2024-11-30 23:22:48', '2024-11-30 23:22:48'),
(406, 4, 22, 10, 25.00, '2024-11-30 23:22:48', '2024-11-30 23:22:48'),
(407, 4, 22, 11, 15.00, '2024-11-30 23:22:48', '2024-11-30 23:22:48'),
(408, 4, 22, 12, 15.00, '2024-11-30 23:22:48', '2024-11-30 23:22:48'),
(409, 6, 22, 9, 28.00, '2024-11-30 23:23:19', '2024-11-30 23:23:19'),
(410, 6, 22, 10, 24.00, '2024-11-30 23:23:19', '2024-11-30 23:23:19'),
(411, 6, 22, 11, 15.00, '2024-11-30 23:23:20', '2024-11-30 23:23:20'),
(412, 6, 22, 12, 18.00, '2024-11-30 23:23:20', '2024-11-30 23:23:20'),
(413, 5, 22, 9, 15.00, '2024-11-30 23:23:20', '2024-11-30 23:23:20'),
(414, 5, 22, 10, 18.00, '2024-11-30 23:23:20', '2024-11-30 23:23:20'),
(415, 5, 22, 11, 10.00, '2024-11-30 23:23:20', '2024-11-30 23:23:20'),
(416, 5, 22, 12, 12.00, '2024-11-30 23:23:20', '2024-11-30 23:23:20'),
(417, 6, 23, 9, 28.00, '2024-11-30 23:24:05', '2024-11-30 23:24:05'),
(418, 6, 23, 10, 25.00, '2024-11-30 23:24:05', '2024-11-30 23:24:05'),
(419, 6, 23, 11, 15.00, '2024-11-30 23:24:05', '2024-11-30 23:24:05'),
(420, 6, 23, 12, 15.00, '2024-11-30 23:24:05', '2024-11-30 23:24:05'),
(421, 5, 23, 9, 24.00, '2024-11-30 23:24:12', '2024-11-30 23:24:12'),
(422, 5, 23, 10, 23.00, '2024-11-30 23:24:12', '2024-11-30 23:24:12'),
(423, 5, 23, 11, 16.00, '2024-11-30 23:24:12', '2024-11-30 23:24:12'),
(424, 5, 23, 12, 17.00, '2024-11-30 23:24:12', '2024-11-30 23:24:12'),
(425, 4, 23, 9, 25.00, '2024-11-30 23:24:16', '2024-11-30 23:24:16'),
(426, 4, 23, 10, 25.00, '2024-11-30 23:24:16', '2024-11-30 23:24:16'),
(427, 4, 23, 11, 14.00, '2024-11-30 23:24:16', '2024-11-30 23:24:16'),
(428, 4, 23, 12, 15.00, '2024-11-30 23:24:16', '2024-11-30 23:24:16'),
(429, 2, 23, 9, 28.00, '2024-11-30 23:24:32', '2024-11-30 23:24:32'),
(430, 2, 23, 10, 25.00, '2024-11-30 23:24:32', '2024-11-30 23:24:32'),
(431, 2, 23, 11, 16.00, '2024-11-30 23:24:32', '2024-11-30 23:24:32'),
(432, 2, 23, 12, 17.00, '2024-11-30 23:24:32', '2024-11-30 23:24:32'),
(433, 4, 24, 9, 24.00, '2024-11-30 23:24:46', '2024-11-30 23:24:46'),
(434, 4, 24, 10, 24.00, '2024-11-30 23:24:46', '2024-11-30 23:24:46'),
(435, 4, 24, 11, 15.00, '2024-11-30 23:24:46', '2024-11-30 23:24:46'),
(436, 4, 24, 12, 15.00, '2024-11-30 23:24:46', '2024-11-30 23:24:46'),
(437, 6, 24, 9, 30.00, '2024-11-30 23:25:03', '2024-11-30 23:25:03'),
(438, 6, 24, 10, 29.00, '2024-11-30 23:25:03', '2024-11-30 23:25:03'),
(439, 6, 24, 11, 19.00, '2024-11-30 23:25:03', '2024-11-30 23:25:03'),
(440, 6, 24, 12, 20.00, '2024-11-30 23:25:03', '2024-11-30 23:25:03'),
(441, 2, 24, 9, 28.00, '2024-11-30 23:25:27', '2024-11-30 23:25:27'),
(442, 2, 24, 10, 28.00, '2024-11-30 23:25:27', '2024-11-30 23:25:27'),
(443, 2, 24, 11, 18.00, '2024-11-30 23:25:27', '2024-11-30 23:25:27'),
(444, 2, 24, 12, 18.00, '2024-11-30 23:25:27', '2024-11-30 23:25:27'),
(445, 5, 24, 9, 25.00, '2024-11-30 23:25:35', '2024-11-30 23:25:35'),
(446, 5, 24, 10, 24.00, '2024-11-30 23:25:35', '2024-11-30 23:25:35'),
(447, 5, 24, 11, 15.00, '2024-11-30 23:25:35', '2024-11-30 23:25:35'),
(448, 5, 24, 12, 17.00, '2024-11-30 23:25:35', '2024-11-30 23:25:35'),
(449, 4, 25, 9, 25.00, '2024-11-30 23:27:15', '2024-11-30 23:27:15'),
(450, 4, 25, 10, 26.00, '2024-11-30 23:27:15', '2024-11-30 23:27:15'),
(451, 4, 25, 11, 16.00, '2024-11-30 23:27:15', '2024-11-30 23:27:15'),
(452, 4, 25, 12, 16.00, '2024-11-30 23:27:15', '2024-11-30 23:27:15'),
(453, 6, 25, 9, 28.00, '2024-11-30 23:27:21', '2024-11-30 23:27:21'),
(454, 6, 25, 10, 28.00, '2024-11-30 23:27:21', '2024-11-30 23:27:21'),
(455, 6, 25, 11, 18.00, '2024-11-30 23:27:21', '2024-11-30 23:27:21'),
(456, 6, 25, 12, 18.00, '2024-11-30 23:27:21', '2024-11-30 23:27:21'),
(457, 2, 25, 9, 24.00, '2024-11-30 23:27:30', '2024-11-30 23:27:30'),
(458, 2, 25, 10, 26.00, '2024-11-30 23:27:30', '2024-11-30 23:27:30'),
(459, 2, 25, 11, 15.00, '2024-11-30 23:27:30', '2024-11-30 23:27:30'),
(460, 2, 25, 12, 14.00, '2024-11-30 23:27:30', '2024-11-30 23:27:30'),
(461, 5, 25, 9, 30.00, '2024-11-30 23:27:38', '2024-11-30 23:27:38'),
(462, 5, 25, 10, 26.00, '2024-11-30 23:27:38', '2024-11-30 23:27:38'),
(463, 5, 25, 11, 17.00, '2024-11-30 23:27:38', '2024-11-30 23:27:38'),
(464, 5, 25, 12, 16.00, '2024-11-30 23:27:38', '2024-11-30 23:27:38'),
(465, 2, 65, 9, 23.00, '2024-11-30 23:28:38', '2024-11-30 23:28:38'),
(466, 2, 65, 10, 25.00, '2024-11-30 23:28:38', '2024-11-30 23:28:38'),
(467, 2, 65, 11, 14.00, '2024-11-30 23:28:38', '2024-11-30 23:28:38'),
(468, 2, 65, 12, 13.00, '2024-11-30 23:28:38', '2024-11-30 23:28:38'),
(469, 5, 65, 9, 26.00, '2024-11-30 23:29:08', '2024-11-30 23:29:08'),
(470, 5, 65, 10, 23.00, '2024-11-30 23:29:08', '2024-11-30 23:29:08'),
(471, 5, 65, 11, 17.00, '2024-11-30 23:29:08', '2024-11-30 23:29:08'),
(472, 5, 65, 12, 15.00, '2024-11-30 23:29:08', '2024-11-30 23:29:08'),
(473, 6, 65, 9, 27.00, '2024-11-30 23:29:11', '2024-11-30 23:29:11'),
(474, 6, 65, 10, 27.00, '2024-11-30 23:29:11', '2024-11-30 23:29:11'),
(475, 6, 65, 11, 18.00, '2024-11-30 23:29:11', '2024-11-30 23:29:11'),
(476, 6, 65, 12, 18.00, '2024-11-30 23:29:11', '2024-11-30 23:29:11'),
(477, 4, 65, 9, 24.00, '2024-11-30 23:29:17', '2024-11-30 23:29:17'),
(478, 4, 65, 10, 24.00, '2024-11-30 23:29:17', '2024-11-30 23:29:17'),
(479, 4, 65, 11, 15.00, '2024-11-30 23:29:17', '2024-11-30 23:29:17'),
(480, 4, 65, 12, 15.00, '2024-11-30 23:29:17', '2024-11-30 23:29:17'),
(481, 6, 26, 13, 29.00, '2024-11-30 23:32:53', '2024-11-30 23:32:53'),
(482, 6, 26, 14, 30.00, '2024-11-30 23:32:53', '2024-11-30 23:32:53'),
(483, 6, 26, 15, 40.00, '2024-11-30 23:32:53', '2024-11-30 23:32:53'),
(484, 5, 26, 13, 20.00, '2024-11-30 23:32:53', '2024-11-30 23:32:53'),
(485, 5, 26, 14, 24.00, '2024-11-30 23:32:53', '2024-11-30 23:32:53'),
(486, 5, 26, 15, 20.00, '2024-11-30 23:32:53', '2024-11-30 23:32:53'),
(487, 4, 26, 13, 25.00, '2024-11-30 23:32:54', '2024-11-30 23:32:54'),
(488, 4, 26, 14, 27.00, '2024-11-30 23:32:54', '2024-11-30 23:32:54'),
(489, 4, 26, 15, 33.00, '2024-11-30 23:32:54', '2024-11-30 23:32:54'),
(490, 2, 26, 13, 27.00, '2024-11-30 23:32:54', '2024-11-30 23:32:54'),
(491, 2, 26, 14, 28.00, '2024-11-30 23:32:54', '2024-11-30 23:32:54'),
(492, 2, 26, 15, 35.00, '2024-11-30 23:32:54', '2024-11-30 23:32:54'),
(493, 5, 27, 13, 26.00, '2024-11-30 23:35:19', '2024-11-30 23:35:19'),
(494, 5, 27, 14, 26.00, '2024-11-30 23:35:19', '2024-11-30 23:35:19'),
(495, 5, 27, 15, 26.00, '2024-11-30 23:35:19', '2024-11-30 23:35:19'),
(496, 6, 27, 13, 28.00, '2024-11-30 23:35:22', '2024-11-30 23:35:22'),
(497, 6, 27, 14, 30.00, '2024-11-30 23:35:22', '2024-11-30 23:35:22'),
(498, 6, 27, 15, 38.00, '2024-11-30 23:35:22', '2024-11-30 23:35:22'),
(499, 4, 27, 13, 28.00, '2024-11-30 23:35:48', '2024-11-30 23:35:48'),
(500, 4, 27, 14, 28.00, '2024-11-30 23:35:48', '2024-11-30 23:35:48'),
(501, 4, 27, 15, 37.00, '2024-11-30 23:35:48', '2024-11-30 23:35:48'),
(502, 2, 27, 13, 28.00, '2024-11-30 23:35:57', '2024-11-30 23:35:57'),
(503, 2, 27, 14, 28.00, '2024-11-30 23:35:57', '2024-11-30 23:35:57'),
(504, 2, 27, 15, 38.00, '2024-11-30 23:35:57', '2024-11-30 23:35:57'),
(505, 2, 28, 13, 27.00, '2024-11-30 23:36:34', '2024-11-30 23:36:34'),
(506, 2, 28, 14, 26.00, '2024-11-30 23:36:34', '2024-11-30 23:36:34'),
(507, 2, 28, 15, 35.00, '2024-11-30 23:36:34', '2024-11-30 23:36:34'),
(508, 5, 28, 13, 20.00, '2024-11-30 23:37:04', '2024-11-30 23:37:04'),
(509, 5, 28, 14, 24.00, '2024-11-30 23:37:04', '2024-11-30 23:37:04'),
(510, 5, 28, 15, 25.00, '2024-11-30 23:37:04', '2024-11-30 23:37:04'),
(511, 4, 28, 13, 24.00, '2024-11-30 23:37:06', '2024-11-30 23:37:06'),
(512, 4, 28, 14, 24.00, '2024-11-30 23:37:06', '2024-11-30 23:37:06'),
(513, 4, 28, 15, 30.00, '2024-11-30 23:37:06', '2024-11-30 23:37:06'),
(514, 6, 28, 13, 25.00, '2024-11-30 23:37:06', '2024-11-30 23:37:06'),
(515, 6, 28, 14, 30.00, '2024-11-30 23:37:06', '2024-11-30 23:37:06'),
(516, 6, 28, 15, 30.00, '2024-11-30 23:37:06', '2024-11-30 23:37:06'),
(517, 6, 29, 13, 15.00, '2024-11-30 23:38:29', '2024-11-30 23:38:29'),
(518, 6, 29, 14, 25.00, '2024-11-30 23:38:29', '2024-11-30 23:38:29'),
(519, 6, 29, 15, 20.00, '2024-11-30 23:38:29', '2024-11-30 23:38:29'),
(520, 4, 29, 13, 28.00, '2024-11-30 23:38:36', '2024-11-30 23:38:36'),
(521, 4, 29, 14, 25.00, '2024-11-30 23:38:36', '2024-11-30 23:38:36'),
(522, 4, 29, 15, 25.00, '2024-11-30 23:38:36', '2024-11-30 23:38:36'),
(523, 5, 29, 13, 16.00, '2024-11-30 23:38:38', '2024-11-30 23:38:38'),
(524, 5, 29, 14, 20.00, '2024-11-30 23:38:38', '2024-11-30 23:38:38'),
(525, 5, 29, 15, 15.00, '2024-11-30 23:38:38', '2024-11-30 23:38:38'),
(526, 2, 29, 13, 23.00, '2024-11-30 23:38:48', '2024-11-30 23:38:48'),
(527, 2, 29, 14, 24.00, '2024-11-30 23:38:48', '2024-11-30 23:38:48'),
(528, 2, 29, 15, 32.00, '2024-11-30 23:38:48', '2024-11-30 23:38:48'),
(529, 2, 30, 13, 28.00, '2024-11-30 23:39:44', '2024-11-30 23:39:44'),
(530, 2, 30, 14, 28.00, '2024-11-30 23:39:44', '2024-11-30 23:39:44'),
(531, 2, 30, 15, 38.00, '2024-11-30 23:39:44', '2024-11-30 23:39:44'),
(532, 5, 30, 13, 27.00, '2024-11-30 23:39:45', '2024-11-30 23:39:45'),
(533, 5, 30, 14, 28.00, '2024-11-30 23:39:45', '2024-11-30 23:39:45'),
(534, 5, 30, 15, 30.00, '2024-11-30 23:39:45', '2024-11-30 23:39:45'),
(535, 4, 30, 13, 25.00, '2024-11-30 23:39:46', '2024-11-30 23:39:46'),
(536, 4, 30, 14, 27.00, '2024-11-30 23:39:46', '2024-11-30 23:39:46'),
(537, 4, 30, 15, 37.00, '2024-11-30 23:39:46', '2024-11-30 23:39:46'),
(538, 6, 30, 13, 28.00, '2024-11-30 23:39:51', '2024-11-30 23:39:51'),
(539, 6, 30, 14, 30.00, '2024-11-30 23:39:51', '2024-11-30 23:39:51'),
(540, 6, 30, 15, 40.00, '2024-11-30 23:39:51', '2024-11-30 23:39:51'),
(541, 2, 31, 13, 24.00, '2024-11-30 23:41:13', '2024-11-30 23:41:13'),
(542, 2, 31, 14, 25.00, '2024-11-30 23:41:13', '2024-11-30 23:41:13'),
(543, 2, 31, 15, 30.00, '2024-11-30 23:41:13', '2024-11-30 23:41:13'),
(544, 5, 31, 13, 28.00, '2024-11-30 23:41:48', '2024-11-30 23:41:48'),
(545, 5, 31, 14, 28.00, '2024-11-30 23:41:48', '2024-11-30 23:41:48'),
(546, 5, 31, 15, 35.00, '2024-11-30 23:41:48', '2024-11-30 23:41:48'),
(547, 6, 31, 13, 29.00, '2024-11-30 23:41:54', '2024-11-30 23:41:54'),
(548, 6, 31, 14, 30.00, '2024-11-30 23:41:54', '2024-11-30 23:41:54'),
(549, 6, 31, 15, 38.00, '2024-11-30 23:41:54', '2024-11-30 23:41:54'),
(550, 4, 31, 13, 27.00, '2024-11-30 23:41:59', '2024-11-30 23:41:59'),
(551, 4, 31, 14, 25.00, '2024-11-30 23:41:59', '2024-11-30 23:41:59'),
(552, 4, 31, 15, 37.00, '2024-11-30 23:41:59', '2024-11-30 23:41:59'),
(553, 2, 32, 13, 22.00, '2024-11-30 23:43:24', '2024-11-30 23:43:24'),
(554, 2, 32, 14, 28.00, '2024-11-30 23:43:24', '2024-11-30 23:43:24'),
(555, 2, 32, 15, 22.00, '2024-11-30 23:43:24', '2024-11-30 23:43:24'),
(556, 5, 32, 13, 16.00, '2024-11-30 23:43:40', '2024-11-30 23:43:40'),
(557, 5, 32, 14, 20.00, '2024-11-30 23:43:40', '2024-11-30 23:43:40'),
(558, 5, 32, 15, 15.00, '2024-11-30 23:43:40', '2024-11-30 23:43:40'),
(559, 6, 32, 13, 15.00, '2024-11-30 23:43:47', '2024-11-30 23:43:47'),
(560, 6, 32, 14, 20.00, '2024-11-30 23:43:47', '2024-11-30 23:43:47'),
(561, 6, 32, 15, 15.00, '2024-11-30 23:43:47', '2024-11-30 23:43:47'),
(562, 4, 32, 13, 20.00, '2024-11-30 23:43:56', '2024-11-30 23:43:56'),
(563, 4, 32, 14, 24.00, '2024-11-30 23:43:56', '2024-11-30 23:43:56'),
(564, 4, 32, 15, 20.00, '2024-11-30 23:43:57', '2024-11-30 23:43:57'),
(565, 5, 33, 13, 22.00, '2024-11-30 23:45:48', '2024-11-30 23:45:48'),
(566, 5, 33, 14, 20.00, '2024-11-30 23:45:48', '2024-11-30 23:45:48'),
(567, 5, 33, 15, 34.00, '2024-11-30 23:45:48', '2024-11-30 23:45:48'),
(568, 6, 33, 13, 25.00, '2024-11-30 23:46:02', '2024-11-30 23:46:02'),
(569, 6, 33, 14, 25.00, '2024-11-30 23:46:02', '2024-11-30 23:46:02'),
(570, 6, 33, 15, 30.00, '2024-11-30 23:46:02', '2024-11-30 23:46:02'),
(571, 2, 33, 13, 25.00, '2024-11-30 23:46:05', '2024-11-30 23:46:05'),
(572, 2, 33, 14, 28.00, '2024-11-30 23:46:05', '2024-11-30 23:46:05'),
(573, 2, 33, 15, 36.00, '2024-11-30 23:46:05', '2024-11-30 23:46:05'),
(574, 4, 33, 13, 24.00, '2024-11-30 23:46:23', '2024-11-30 23:46:23'),
(575, 4, 33, 14, 25.00, '2024-11-30 23:46:23', '2024-11-30 23:46:23'),
(576, 4, 33, 15, 33.00, '2024-11-30 23:46:24', '2024-11-30 23:46:24'),
(577, 2, 34, 13, 26.00, '2024-11-30 23:48:09', '2024-11-30 23:48:09'),
(578, 2, 34, 14, 28.00, '2024-11-30 23:48:09', '2024-11-30 23:48:09'),
(579, 2, 34, 15, 30.00, '2024-11-30 23:48:09', '2024-11-30 23:48:09'),
(580, 6, 34, 13, 28.00, '2024-11-30 23:48:36', '2024-11-30 23:48:36'),
(581, 6, 34, 14, 25.00, '2024-11-30 23:48:36', '2024-11-30 23:48:36'),
(582, 6, 34, 15, 35.00, '2024-11-30 23:48:36', '2024-11-30 23:48:36'),
(583, 5, 34, 13, 26.00, '2024-11-30 23:48:41', '2024-11-30 23:48:41'),
(584, 5, 34, 14, 25.00, '2024-11-30 23:48:41', '2024-11-30 23:48:41'),
(585, 5, 34, 15, 36.00, '2024-11-30 23:48:41', '2024-11-30 23:48:41'),
(586, 4, 34, 13, 23.00, '2024-11-30 23:48:55', '2024-11-30 23:48:55'),
(587, 4, 34, 14, 25.00, '2024-11-30 23:48:55', '2024-11-30 23:48:55'),
(588, 4, 34, 15, 35.00, '2024-11-30 23:48:55', '2024-11-30 23:48:55'),
(589, 6, 35, 13, 28.00, '2024-11-30 23:51:08', '2024-11-30 23:51:08'),
(590, 6, 35, 14, 30.00, '2024-11-30 23:51:08', '2024-11-30 23:51:08'),
(591, 6, 35, 15, 39.00, '2024-11-30 23:51:08', '2024-11-30 23:51:08'),
(592, 5, 35, 13, 25.00, '2024-11-30 23:51:15', '2024-11-30 23:51:15'),
(593, 5, 35, 14, 24.00, '2024-11-30 23:51:15', '2024-11-30 23:51:15'),
(594, 5, 35, 15, 34.00, '2024-11-30 23:51:15', '2024-11-30 23:51:15'),
(595, 2, 35, 13, 25.00, '2024-11-30 23:51:41', '2024-11-30 23:51:41'),
(596, 2, 35, 14, 28.00, '2024-11-30 23:51:41', '2024-11-30 23:51:41'),
(597, 2, 35, 15, 38.00, '2024-11-30 23:51:41', '2024-11-30 23:51:41'),
(598, 4, 35, 13, 28.00, '2024-11-30 23:51:48', '2024-11-30 23:51:48'),
(599, 4, 35, 14, 28.00, '2024-11-30 23:51:48', '2024-11-30 23:51:48'),
(600, 4, 35, 15, 38.00, '2024-11-30 23:51:48', '2024-11-30 23:51:48'),
(601, 5, 36, 13, 25.00, '2024-11-30 23:53:16', '2024-11-30 23:53:16'),
(602, 5, 36, 14, 22.00, '2024-11-30 23:53:16', '2024-11-30 23:53:16'),
(603, 5, 36, 15, 28.00, '2024-11-30 23:53:16', '2024-11-30 23:53:16'),
(604, 2, 36, 13, 28.00, '2024-11-30 23:53:22', '2024-11-30 23:53:22'),
(605, 2, 36, 14, 25.00, '2024-11-30 23:53:22', '2024-11-30 23:53:22'),
(606, 2, 36, 15, 23.00, '2024-11-30 23:53:22', '2024-11-30 23:53:22'),
(607, 6, 36, 13, 25.00, '2024-11-30 23:53:36', '2024-11-30 23:53:36'),
(608, 6, 36, 14, 25.00, '2024-11-30 23:53:36', '2024-11-30 23:53:36'),
(609, 6, 36, 15, 35.00, '2024-11-30 23:53:36', '2024-11-30 23:53:36'),
(610, 4, 36, 13, 25.00, '2024-11-30 23:54:06', '2024-11-30 23:54:06'),
(611, 4, 36, 14, 24.00, '2024-11-30 23:54:06', '2024-11-30 23:54:06'),
(612, 4, 36, 15, 30.00, '2024-11-30 23:54:06', '2024-11-30 23:54:06'),
(613, 2, 66, 13, 23.00, '2024-11-30 23:55:16', '2024-11-30 23:55:16'),
(614, 2, 66, 14, 26.00, '2024-11-30 23:55:16', '2024-11-30 23:55:16'),
(615, 2, 66, 15, 30.00, '2024-11-30 23:55:16', '2024-11-30 23:55:16'),
(616, 6, 66, 13, 20.00, '2024-11-30 23:55:24', '2024-11-30 23:55:24'),
(617, 6, 66, 14, 20.00, '2024-11-30 23:55:25', '2024-11-30 23:55:25'),
(618, 6, 66, 15, 30.00, '2024-11-30 23:55:25', '2024-11-30 23:55:25'),
(619, 5, 66, 13, 12.00, '2024-11-30 23:55:39', '2024-11-30 23:55:39'),
(620, 5, 66, 14, 20.00, '2024-11-30 23:55:39', '2024-11-30 23:55:39'),
(621, 5, 66, 15, 16.00, '2024-11-30 23:55:39', '2024-11-30 23:55:39'),
(622, 4, 66, 13, 20.00, '2024-11-30 23:55:41', '2024-11-30 23:55:41'),
(623, 4, 66, 14, 20.00, '2024-11-30 23:55:41', '2024-11-30 23:55:41'),
(624, 4, 66, 15, 30.00, '2024-11-30 23:55:41', '2024-11-30 23:55:41'),
(625, 5, 72, 20, 20.00, '2024-12-01 00:35:15', '2024-12-01 00:35:15'),
(626, 5, 72, 21, 25.00, '2024-12-01 00:35:15', '2024-12-01 00:35:15'),
(627, 5, 72, 22, 22.00, '2024-12-01 00:35:15', '2024-12-01 00:35:15'),
(628, 5, 72, 23, 14.00, '2024-12-01 00:35:15', '2024-12-01 00:35:15'),
(629, 4, 72, 20, 22.00, '2024-12-01 00:35:17', '2024-12-01 00:35:17'),
(630, 4, 72, 21, 23.00, '2024-12-01 00:35:18', '2024-12-01 00:35:18'),
(631, 4, 72, 22, 20.00, '2024-12-01 00:35:18', '2024-12-01 00:35:18'),
(632, 4, 72, 23, 18.00, '2024-12-01 00:35:18', '2024-12-01 00:35:18'),
(633, 2, 72, 20, 23.00, '2024-12-01 00:35:38', '2024-12-01 00:35:38'),
(634, 2, 72, 21, 23.00, '2024-12-01 00:35:38', '2024-12-01 00:35:38'),
(635, 2, 72, 22, 23.00, '2024-12-01 00:35:38', '2024-12-01 00:35:38'),
(636, 2, 72, 23, 20.00, '2024-12-01 00:35:38', '2024-12-01 00:35:38'),
(637, 6, 72, 20, 25.00, '2024-12-01 00:36:06', '2024-12-01 00:36:06'),
(638, 6, 72, 21, 25.00, '2024-12-01 00:36:06', '2024-12-01 00:36:06'),
(639, 6, 72, 22, 20.00, '2024-12-01 00:36:06', '2024-12-01 00:36:06'),
(640, 6, 72, 23, 15.00, '2024-12-01 00:36:06', '2024-12-01 00:36:06'),
(641, 2, 73, 20, 23.00, '2024-12-01 00:37:29', '2024-12-01 00:37:29'),
(642, 2, 73, 21, 23.00, '2024-12-01 00:37:29', '2024-12-01 00:37:29'),
(643, 2, 73, 22, 21.00, '2024-12-01 00:37:29', '2024-12-01 00:37:29'),
(644, 2, 73, 23, 23.00, '2024-12-01 00:37:29', '2024-12-01 00:37:29'),
(645, 6, 73, 20, 25.00, '2024-12-01 00:37:39', '2024-12-01 00:37:39'),
(646, 6, 73, 21, 25.00, '2024-12-01 00:37:39', '2024-12-01 00:37:39'),
(647, 6, 73, 22, 25.00, '2024-12-01 00:37:39', '2024-12-01 00:37:39'),
(648, 6, 73, 23, 24.00, '2024-12-01 00:37:39', '2024-12-01 00:37:39'),
(649, 5, 74, 20, 23.00, '2024-12-01 00:37:52', '2024-12-01 00:37:52'),
(650, 5, 74, 21, 20.00, '2024-12-01 00:37:52', '2024-12-01 00:37:52'),
(651, 5, 74, 22, 23.00, '2024-12-01 00:37:52', '2024-12-01 00:37:52'),
(652, 5, 74, 23, 25.00, '2024-12-01 00:37:52', '2024-12-01 00:37:52'),
(653, 4, 73, 20, 23.00, '2024-12-01 00:37:53', '2024-12-01 00:37:53'),
(654, 4, 73, 21, 22.00, '2024-12-01 00:37:53', '2024-12-01 00:37:53'),
(655, 4, 73, 22, 23.00, '2024-12-01 00:37:53', '2024-12-01 00:37:53'),
(656, 4, 73, 23, 23.00, '2024-12-01 00:37:53', '2024-12-01 00:37:53'),
(657, 5, 73, 20, 22.00, '2024-12-01 00:39:41', '2024-12-01 00:39:41'),
(658, 5, 73, 21, 25.00, '2024-12-01 00:39:41', '2024-12-01 00:39:41'),
(659, 5, 73, 22, 25.00, '2024-12-01 00:39:41', '2024-12-01 00:39:41'),
(660, 5, 73, 23, 24.00, '2024-12-01 00:39:41', '2024-12-01 00:39:41'),
(661, 2, 74, 20, 23.00, '2024-12-01 00:41:16', '2024-12-01 00:41:16'),
(662, 2, 74, 21, 23.00, '2024-12-01 00:41:16', '2024-12-01 00:41:16'),
(663, 2, 74, 22, 22.00, '2024-12-01 00:41:16', '2024-12-01 00:41:16'),
(664, 2, 74, 23, 22.00, '2024-12-01 00:41:16', '2024-12-01 00:41:16'),
(665, 6, 74, 20, 25.00, '2024-12-01 00:41:32', '2024-12-01 00:41:32'),
(666, 6, 74, 21, 25.00, '2024-12-01 00:41:32', '2024-12-01 00:41:32'),
(667, 6, 74, 22, 25.00, '2024-12-01 00:41:32', '2024-12-01 00:41:32'),
(668, 6, 74, 23, 23.00, '2024-12-01 00:41:32', '2024-12-01 00:41:32'),
(669, 4, 74, 20, 22.00, '2024-12-01 00:41:39', '2024-12-01 00:41:39'),
(670, 4, 74, 21, 22.00, '2024-12-01 00:41:39', '2024-12-01 00:41:39'),
(671, 4, 74, 22, 22.00, '2024-12-01 00:41:40', '2024-12-01 00:41:40'),
(672, 4, 74, 23, 24.00, '2024-12-01 00:41:40', '2024-12-01 00:41:40'),
(673, 2, 75, 20, 23.00, '2024-12-01 00:44:28', '2024-12-01 00:44:28'),
(674, 2, 75, 21, 23.00, '2024-12-01 00:44:28', '2024-12-01 00:44:28'),
(675, 2, 75, 22, 23.00, '2024-12-01 00:44:28', '2024-12-01 00:44:28'),
(676, 2, 75, 23, 23.00, '2024-12-01 00:44:28', '2024-12-01 00:44:28'),
(677, 5, 75, 20, 20.00, '2024-12-01 00:44:44', '2024-12-01 00:44:44'),
(678, 5, 75, 21, 21.00, '2024-12-01 00:44:44', '2024-12-01 00:44:44'),
(679, 5, 75, 22, 22.00, '2024-12-01 00:44:44', '2024-12-01 00:44:44'),
(680, 5, 75, 23, 23.00, '2024-12-01 00:44:44', '2024-12-01 00:44:44'),
(681, 6, 75, 20, 25.00, '2024-12-01 00:46:46', '2024-12-01 00:46:46'),
(682, 6, 75, 21, 25.00, '2024-12-01 00:46:46', '2024-12-01 00:46:46'),
(683, 6, 75, 22, 25.00, '2024-12-01 00:46:46', '2024-12-01 00:46:46'),
(684, 6, 75, 23, 24.00, '2024-12-01 00:46:46', '2024-12-01 00:46:46'),
(685, 4, 75, 20, 24.00, '2024-12-01 00:46:59', '2024-12-01 00:46:59'),
(686, 4, 75, 21, 24.00, '2024-12-01 00:46:59', '2024-12-01 00:46:59'),
(687, 4, 75, 22, 24.00, '2024-12-01 00:46:59', '2024-12-01 00:46:59'),
(688, 4, 75, 23, 22.00, '2024-12-01 00:46:59', '2024-12-01 00:46:59'),
(689, 5, 76, 20, 18.00, '2024-12-01 00:50:02', '2024-12-01 00:50:02'),
(690, 5, 76, 21, 20.00, '2024-12-01 00:50:02', '2024-12-01 00:50:02'),
(691, 5, 76, 22, 21.00, '2024-12-01 00:50:02', '2024-12-01 00:50:02'),
(692, 5, 76, 23, 18.00, '2024-12-01 00:50:02', '2024-12-01 00:50:02'),
(693, 2, 76, 20, 23.00, '2024-12-01 00:50:05', '2024-12-01 00:50:05'),
(694, 2, 76, 21, 20.00, '2024-12-01 00:50:05', '2024-12-01 00:50:05'),
(695, 2, 76, 22, 22.00, '2024-12-01 00:50:05', '2024-12-01 00:50:05'),
(696, 2, 76, 23, 21.00, '2024-12-01 00:50:05', '2024-12-01 00:50:05'),
(697, 6, 76, 20, 25.00, '2024-12-01 00:50:08', '2024-12-01 00:50:08'),
(698, 6, 76, 21, 25.00, '2024-12-01 00:50:08', '2024-12-01 00:50:08'),
(699, 6, 76, 22, 25.00, '2024-12-01 00:50:08', '2024-12-01 00:50:08'),
(700, 6, 76, 23, 20.00, '2024-12-01 00:50:08', '2024-12-01 00:50:08'),
(701, 4, 76, 20, 22.00, '2024-12-01 00:50:18', '2024-12-01 00:50:18'),
(702, 4, 76, 21, 22.00, '2024-12-01 00:50:18', '2024-12-01 00:50:18'),
(703, 4, 76, 22, 22.00, '2024-12-01 00:50:18', '2024-12-01 00:50:18'),
(704, 4, 76, 23, 22.00, '2024-12-01 00:50:18', '2024-12-01 00:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `scores_adjustments`
--

CREATE TABLE `scores_adjustments` (
  `id` int(11) NOT NULL,
  `portion_contestant_id` int(11) DEFAULT NULL,
  `points` float(10,2) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scores_adjustments_competitions`
--

CREATE TABLE `scores_adjustments_competitions` (
  `id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `contestant_id` int(11) DEFAULT NULL,
  `points` float(10,2) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scores_adjustments_rounds`
--

CREATE TABLE `scores_adjustments_rounds` (
  `id` int(11) NOT NULL,
  `round_id` int(11) DEFAULT NULL,
  `contestant_id` int(11) DEFAULT NULL,
  `points` float(10,2) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scores_adjustments_special_awards`
--

CREATE TABLE `scores_adjustments_special_awards` (
  `id` int(11) NOT NULL,
  `sac_id` int(11) DEFAULT NULL,
  `contestant_id` int(11) DEFAULT NULL,
  `points` float(10,2) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_awards`
--

CREATE TABLE `special_awards` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `winners` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `is_shown` tinyint(4) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_award_contestants`
--

CREATE TABLE `special_award_contestants` (
  `id` int(11) NOT NULL,
  `sac_id` int(11) DEFAULT NULL,
  `contestant_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_award_criteria`
--

CREATE TABLE `special_award_criteria` (
  `id` int(11) NOT NULL,
  `sac_id` int(11) DEFAULT NULL,
  `portion_id` int(11) DEFAULT NULL,
  `criteria_id` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_award_places`
--

CREATE TABLE `special_award_places` (
  `id` int(11) NOT NULL,
  `sac_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabulation_events`
--

CREATE TABLE `tabulation_events` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `venue` varchar(200) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `event_chairman` int(11) DEFAULT NULL,
  `event_tabulator` int(11) DEFAULT NULL,
  `fb_token` longtext DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tabulation_events`
--

INSERT INTO `tabulation_events` (`id`, `description`, `venue`, `event_date`, `is_active`, `event_chairman`, `event_tabulator`, `fb_token`, `date_created`, `last_modified`) VALUES
(1, 'Mutia ti Luna 2024', 'Luna Sports Center', '2024-11-30', 1, 2, 1, NULL, '2023-11-29 10:51:32', '2024-11-30 16:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `tabulation_event` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL,
  `host_device` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `tabulation_event`, `first_name`, `last_name`, `gender`, `username`, `password`, `user_group`, `ip_address`, `host_device`, `date_created`, `last_modified`) VALUES
(1, 1, 'Therosha', 'Ballesteros', 'Female', 'sha', 'tabulator', 1, '192.168.0.101', 1, '2018-02-04 00:00:00', '2018-02-07 14:38:19'),
(2, 1, 'Atty. Myra Diwata R.', 'Caroy', 'Female', 'myra', 'judge', 2, NULL, 0, '2023-11-29 10:52:36', '2023-11-29 10:52:36'),
(3, 1, 'Mr. Emmanuel', 'Ortega', 'Male', 'emmanuel', 'judge', 2, NULL, 0, '2023-11-29 10:53:21', '2023-11-29 10:53:21'),
(4, 1, 'Dr. Rhodora A.', 'Ngolob', 'Female', 'rhodora', 'judge', 2, NULL, 0, '2023-11-29 10:53:55', '2023-11-29 10:53:55'),
(5, 1, 'Engr. Aloysius', 'Mapalo', 'Male', 'aloysius', 'judge', 2, NULL, 0, '2023-11-29 10:54:40', '2023-11-29 10:54:40'),
(6, 1, 'Hon. Jennifer C.', 'Mosuela-Fernandez', 'Male', 'jennifer', 'judge', 2, NULL, 0, '2023-11-29 10:54:56', '2023-11-29 10:54:56'),
(7, 1, 'Gerry', 'Binas-o', 'Male', 'gerry', 'luna', 1, NULL, 0, '2023-11-29 17:36:31', '2023-11-29 17:36:31'),
(8, 1, 'dex', 'flo', 'Male', 'dex', 'tabulator', 1, NULL, 0, '2023-11-29 19:44:27', '2023-11-29 19:44:27'),
(9, 1, 'Maria Elena', 'Espiritu', 'Female', 'elena', 'tabulator', 1, NULL, 0, '2024-11-26 15:07:03', '2024-11-26 15:07:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `competition_contestants`
--
ALTER TABLE `competition_contestants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `competition_places`
--
ALTER TABLE `competition_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `competition_rounds`
--
ALTER TABLE `competition_rounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `contestants`
--
ALTER TABLE `contestants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portion_id` (`portion_id`),
  ADD KEY `extract_portion` (`extract_portion`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `individual_results`
--
ALTER TABLE `individual_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `portions`
--
ALTER TABLE `portions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `portions_contestants`
--
ALTER TABLE `portions_contestants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portion_id` (`portion_id`),
  ADD KEY `contestant_id` (`contestant_id`);

--
-- Indexes for table `portions_judges`
--
ALTER TABLE `portions_judges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portion_id` (`portion_id`);

--
-- Indexes for table `portions_judges_confirmation`
--
ALTER TABLE `portions_judges_confirmation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portions_places`
--
ALTER TABLE `portions_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portion_id` (`portion_id`);

--
-- Indexes for table `portions_toggles`
--
ALTER TABLE `portions_toggles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portion_id` (`portion_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `rounds`
--
ALTER TABLE `rounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `rounds_places`
--
ALTER TABLE `rounds_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `round_id` (`round_id`);

--
-- Indexes for table `rounds_portions`
--
ALTER TABLE `rounds_portions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `round_id` (`round_id`),
  ADD KEY `portion_id` (`portion_id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portion_contestant_id` (`portion_contestant_id`),
  ADD KEY `score_criterion` (`score_criterion`),
  ADD KEY `judge_id` (`judge_id`);

--
-- Indexes for table `scores_adjustments`
--
ALTER TABLE `scores_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portion_contestant_id` (`portion_contestant_id`);

--
-- Indexes for table `scores_adjustments_competitions`
--
ALTER TABLE `scores_adjustments_competitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `scores_adjustments_rounds`
--
ALTER TABLE `scores_adjustments_rounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portion_contestant_id` (`round_id`),
  ADD KEY `contestant_id` (`contestant_id`);

--
-- Indexes for table `scores_adjustments_special_awards`
--
ALTER TABLE `scores_adjustments_special_awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sac_id` (`sac_id`);

--
-- Indexes for table `special_awards`
--
ALTER TABLE `special_awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `special_award_contestants`
--
ALTER TABLE `special_award_contestants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sac_id` (`sac_id`);

--
-- Indexes for table `special_award_criteria`
--
ALTER TABLE `special_award_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sac_id` (`sac_id`);

--
-- Indexes for table `special_award_places`
--
ALTER TABLE `special_award_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sac_id` (`sac_id`);

--
-- Indexes for table `tabulation_events`
--
ALTER TABLE `tabulation_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_chairman` (`event_chairman`),
  ADD KEY `event_tabulator` (`event_tabulator`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_group` (`user_group`),
  ADD KEY `tabulation_event` (`tabulation_event`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competition_contestants`
--
ALTER TABLE `competition_contestants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competition_places`
--
ALTER TABLE `competition_places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competition_rounds`
--
ALTER TABLE `competition_rounds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contestants`
--
ALTER TABLE `contestants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `individual_results`
--
ALTER TABLE `individual_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `portions`
--
ALTER TABLE `portions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `portions_contestants`
--
ALTER TABLE `portions_contestants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `portions_judges`
--
ALTER TABLE `portions_judges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `portions_judges_confirmation`
--
ALTER TABLE `portions_judges_confirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `portions_places`
--
ALTER TABLE `portions_places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `portions_toggles`
--
ALTER TABLE `portions_toggles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `rounds`
--
ALTER TABLE `rounds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rounds_places`
--
ALTER TABLE `rounds_places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rounds_portions`
--
ALTER TABLE `rounds_portions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=705;

--
-- AUTO_INCREMENT for table `scores_adjustments`
--
ALTER TABLE `scores_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scores_adjustments_competitions`
--
ALTER TABLE `scores_adjustments_competitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scores_adjustments_rounds`
--
ALTER TABLE `scores_adjustments_rounds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scores_adjustments_special_awards`
--
ALTER TABLE `scores_adjustments_special_awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `special_awards`
--
ALTER TABLE `special_awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `special_award_contestants`
--
ALTER TABLE `special_award_contestants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `special_award_criteria`
--
ALTER TABLE `special_award_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `special_award_places`
--
ALTER TABLE `special_award_places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tabulation_events`
--
ALTER TABLE `tabulation_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competitions`
--
ALTER TABLE `competitions`
  ADD CONSTRAINT `competitions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tabulation_events` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `competition_contestants`
--
ALTER TABLE `competition_contestants`
  ADD CONSTRAINT `competition_contestants_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `competition_places`
--
ALTER TABLE `competition_places`
  ADD CONSTRAINT `competition_places_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `competition_rounds`
--
ALTER TABLE `competition_rounds`
  ADD CONSTRAINT `competition_rounds_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `contestants`
--
ALTER TABLE `contestants`
  ADD CONSTRAINT `contestants_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tabulation_events` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `criteria_ibfk_1` FOREIGN KEY (`portion_id`) REFERENCES `portions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `individual_results`
--
ALTER TABLE `individual_results`
  ADD CONSTRAINT `individual_results_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tabulation_events` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tabulation_events` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `portions`
--
ALTER TABLE `portions`
  ADD CONSTRAINT `portions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tabulation_events` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `portions_contestants`
--
ALTER TABLE `portions_contestants`
  ADD CONSTRAINT `portions_contestants_ibfk_1` FOREIGN KEY (`portion_id`) REFERENCES `portions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `portions_contestants_ibfk_2` FOREIGN KEY (`contestant_id`) REFERENCES `contestants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `portions_judges`
--
ALTER TABLE `portions_judges`
  ADD CONSTRAINT `portions_judges_ibfk_1` FOREIGN KEY (`portion_id`) REFERENCES `portions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `portions_places`
--
ALTER TABLE `portions_places`
  ADD CONSTRAINT `portions_places_ibfk_1` FOREIGN KEY (`portion_id`) REFERENCES `portions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `portions_toggles`
--
ALTER TABLE `portions_toggles`
  ADD CONSTRAINT `portions_toggles_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tabulation_events` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rounds`
--
ALTER TABLE `rounds`
  ADD CONSTRAINT `rounds_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tabulation_events` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rounds_places`
--
ALTER TABLE `rounds_places`
  ADD CONSTRAINT `rounds_places_ibfk_1` FOREIGN KEY (`round_id`) REFERENCES `rounds` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rounds_portions`
--
ALTER TABLE `rounds_portions`
  ADD CONSTRAINT `rounds_portions_ibfk_1` FOREIGN KEY (`round_id`) REFERENCES `rounds` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`portion_contestant_id`) REFERENCES `portions_contestants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`score_criterion`) REFERENCES `criteria` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `scores_ibfk_3` FOREIGN KEY (`judge_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `scores_adjustments`
--
ALTER TABLE `scores_adjustments`
  ADD CONSTRAINT `scores_adjustments_ibfk_1` FOREIGN KEY (`portion_contestant_id`) REFERENCES `portions_contestants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `scores_adjustments_competitions`
--
ALTER TABLE `scores_adjustments_competitions`
  ADD CONSTRAINT `scores_adjustments_competitions_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `scores_adjustments_rounds`
--
ALTER TABLE `scores_adjustments_rounds`
  ADD CONSTRAINT `scores_adjustments_rounds_ibfk_1` FOREIGN KEY (`round_id`) REFERENCES `rounds` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `scores_adjustments_special_awards`
--
ALTER TABLE `scores_adjustments_special_awards`
  ADD CONSTRAINT `scores_adjustments_special_awards_ibfk_1` FOREIGN KEY (`sac_id`) REFERENCES `special_awards` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `special_awards`
--
ALTER TABLE `special_awards`
  ADD CONSTRAINT `special_awards_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tabulation_events` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `special_award_contestants`
--
ALTER TABLE `special_award_contestants`
  ADD CONSTRAINT `special_award_contestants_ibfk_1` FOREIGN KEY (`sac_id`) REFERENCES `special_awards` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `special_award_criteria`
--
ALTER TABLE `special_award_criteria`
  ADD CONSTRAINT `special_award_criteria_ibfk_1` FOREIGN KEY (`sac_id`) REFERENCES `special_awards` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `special_award_places`
--
ALTER TABLE `special_award_places`
  ADD CONSTRAINT `special_award_places_ibfk_1` FOREIGN KEY (`sac_id`) REFERENCES `special_awards` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_group`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
