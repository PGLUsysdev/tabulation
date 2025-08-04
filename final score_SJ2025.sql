-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 07:21 PM
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
-- Database: `sj`
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
(1, 1, 1, 'No. 1', 'MONICA C. ESCOBAR', NULL, 1, '2023-11-29 11:03:47', '2025-05-28 08:58:07'),
(2, 1, 2, 'No. 2', 'ARJELA R. MACATO', NULL, 1, '2023-11-29 11:04:04', '2025-05-28 09:06:36'),
(3, 1, 3, 'No. 3', 'NATALIE FAITH A. VALDEZ', NULL, 1, '2023-11-29 11:04:24', '2024-11-30 17:10:54'),
(4, 1, 4, 'No. 4', 'DIANNE O. FONTANILLA', NULL, 1, '2023-11-29 11:05:00', '2024-11-30 17:11:12'),
(5, 1, 5, 'No. 5', 'ERIKA KLEIN A. LIGUDEN', NULL, 1, '2023-11-29 11:05:18', '2024-11-30 17:11:23'),
(6, 1, 6, 'No. 6', 'DARLENE MYR F. SOBREMONTE', NULL, 1, '2023-11-29 11:05:39', '2024-11-30 17:11:34'),
(7, 1, 7, 'No. 7', 'VALERIE NICOLAI R. PANIS', NULL, 1, '2023-11-29 11:05:59', '2024-11-30 17:11:53'),
(8, 1, 8, 'No. 8', 'CARLA SANDY R. CRISTOBAL', NULL, 1, '2023-11-29 11:06:21', '2024-11-30 17:12:21'),
(9, 1, 9, 'No. 9', 'NORMA IZABELLE M. MANALASTAS', NULL, 1, '2023-11-29 11:06:40', '2024-11-30 17:12:34'),
(10, 1, 10, 'No. 10', 'CESAN VHEL C. BALICHA', NULL, 1, '2023-11-29 11:06:57', '2024-11-30 17:12:47'),
(11, 1, 11, 'No. 11', 'DAPHNY JOY J. BORJA', NULL, 1, '2023-11-29 11:07:14', '2024-11-30 17:12:59'),
(12, 1, 12, 'No. 12', 'DASSLLIE SHAYNE E. NISPEROS', NULL, 1, '2024-11-26 13:52:19', '2024-11-30 17:13:10');

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
(1, 1, 'Beauty and Personality', 30, 0.00, NULL, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(2, 1, 'Poise and Carriage', 35, 0.00, NULL, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(3, 1, 'Style and Creativity of Costume', 35, 0.00, NULL, '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(5, 2, 'Beauty and Personality', 35, 0.00, NULL, '2023-11-29 11:15:05', '2023-11-29 11:15:05'),
(6, 2, 'Figure and Body Proportion', 35, 0.00, NULL, '2023-11-29 11:15:05', '2023-11-29 11:15:05'),
(7, 2, 'Poise and Carriage', 30, 0.00, NULL, '2023-11-29 11:15:05', '2023-11-29 11:15:05'),
(9, 3, 'Beauty and Personality', 35, 0.00, NULL, '2023-11-29 11:16:20', '2023-11-29 11:16:20'),
(10, 3, 'Poise and Carriage', 30, 0.00, NULL, '2023-11-29 11:16:20', '2023-11-29 11:16:20'),
(11, 3, 'Elegance of Gown', 35, 0.00, NULL, '2023-11-29 11:16:20', '2023-11-29 11:16:20'),
(13, 4, 'Beauty and Personality', 50, 0.00, NULL, '2023-11-29 11:18:31', '2023-11-29 11:18:31'),
(14, 4, 'Intelligence/Delivery', 50, 0.00, NULL, '2023-11-29 11:18:31', '2023-11-29 11:18:31'),
(16, 5, 'Swimwear', 25, 0.00, 2, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(17, 5, 'Evening Gown', 25, 0.00, 3, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(18, 5, 'Native Creative Costume', 25, 0.00, 1, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(19, 5, 'Casual Interview', 25, 0.00, 4, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(20, 6, 'Beauty and Personality', 50, 0.00, NULL, '2023-11-29 11:23:57', '2023-11-29 11:23:57'),
(21, 6, 'Intelligence/Delivery', 50, 0.00, NULL, '2023-11-29 11:23:57', '2023-11-29 11:23:57');

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
(1, 1, 1, 'fa-users', 'Dr. Ramon B. Torres has finished scoring for <strong>NATIVE-CREATIVE COSTUME Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:11:40', '2025-05-28 22:11:40'),
(2, 1, 1, 'fa-users', 'Ms. Jacynthe Zena Castillo has finished scoring for <strong>NATIVE-CREATIVE COSTUME Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:13:37', '2025-05-28 22:13:37'),
(3, 1, 1, 'fa-users', 'Ms. Sharlote Tuibeo-Ang has finished scoring for <strong>NATIVE-CREATIVE COSTUME Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:13:58', '2025-05-28 22:13:58'),
(4, 1, 1, 'fa-users', 'Ms. Maribel G. Baladjay has finished scoring for <strong>NATIVE-CREATIVE COSTUME Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:14:15', '2025-05-28 22:14:15'),
(5, 1, 1, 'fa-users', 'Mr. Mark James L. Valdez has finished scoring for <strong>NATIVE-CREATIVE COSTUME Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:14:28', '2025-05-28 22:14:28'),
(6, 1, 1, 'fa-users', 'Ms. Sharlote Tuibeo-Ang has finished scoring for <strong>SWIMWEAR COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:50:40', '2025-05-28 22:50:40'),
(7, 1, 1, 'fa-users', 'Dr. Ramon B. Torres has finished scoring for <strong>SWIMWEAR COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:50:53', '2025-05-28 22:50:53'),
(8, 1, 1, 'fa-users', 'Mr. Mark James L. Valdez has finished scoring for <strong>SWIMWEAR COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:51:18', '2025-05-28 22:51:18'),
(9, 1, 1, 'fa-users', 'Ms. Jacynthe Zena Castillo has finished scoring for <strong>SWIMWEAR COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:51:20', '2025-05-28 22:51:20'),
(10, 1, 1, 'fa-users', 'Ms. Maribel G. Baladjay has finished scoring for <strong>SWIMWEAR COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 22:51:27', '2025-05-28 22:51:27'),
(11, 1, 1, 'fa-users', 'Ms. Jacynthe Zena Castillo has finished scoring for <strong>EVENING GOWN COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 23:50:49', '2025-05-28 23:50:49'),
(12, 1, 1, 'fa-users', 'Ms. Maribel G. Baladjay has finished scoring for <strong>EVENING GOWN COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 23:51:44', '2025-05-28 23:51:44'),
(13, 1, 1, 'fa-users', 'Mr. Mark James L. Valdez has finished scoring for <strong>EVENING GOWN COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 23:52:33', '2025-05-28 23:52:33'),
(14, 1, 1, 'fa-users', 'Dr. Ramon B. Torres has finished scoring for <strong>EVENING GOWN COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 23:52:39', '2025-05-28 23:52:39'),
(15, 1, 1, 'fa-users', 'Ms. Maribel G. Baladjay has finished scoring for <strong>EVENING GOWN COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 23:52:42', '2025-05-28 23:52:42'),
(16, 1, 1, 'fa-users', 'Ms. Sharlote Tuibeo-Ang has finished scoring for <strong>EVENING GOWN COMPETITION Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-28 23:53:25', '2025-05-28 23:53:25'),
(17, 1, 1, 'fa-users', 'Dr. Ramon B. Torres has finished scoring for <strong>CASUAL INTERVIEW Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 00:13:47', '2025-05-29 00:13:47'),
(18, 1, 1, 'fa-users', 'Ms. Jacynthe Zena Castillo has finished scoring for <strong>CASUAL INTERVIEW Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 00:13:56', '2025-05-29 00:13:56'),
(19, 1, 1, 'fa-users', 'Ms. Sharlote Tuibeo-Ang has finished scoring for <strong>CASUAL INTERVIEW Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 00:14:01', '2025-05-29 00:14:01'),
(20, 1, 1, 'fa-users', 'Mr. Mark James L. Valdez has finished scoring for <strong>CASUAL INTERVIEW Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 00:14:35', '2025-05-29 00:14:35'),
(21, 1, 1, 'fa-users', 'Ms. Maribel G. Baladjay has finished scoring for <strong>CASUAL INTERVIEW Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 00:15:01', '2025-05-29 00:15:01'),
(22, 1, 1, 'fa-users', 'Ms. Maribel G. Baladjay has finished scoring for <strong>Final 5 Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 01:08:27', '2025-05-29 01:08:27'),
(23, 1, 1, 'fa-users', 'Ms. Sharlote Tuibeo-Ang has finished scoring for <strong>Final 5 Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 01:08:34', '2025-05-29 01:08:34'),
(24, 1, 1, 'fa-users', 'Ms. Jacynthe Zena Castillo has finished scoring for <strong>Final 5 Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 01:09:20', '2025-05-29 01:09:20'),
(25, 1, 1, 'fa-users', 'Mr. Mark James L. Valdez has finished scoring for <strong>Final 5 Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 01:10:00', '2025-05-29 01:10:00'),
(26, 1, 1, 'fa-users', 'Ms. Jacynthe Zena Castillo has finished scoring for <strong>Final 5 Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 01:11:04', '2025-05-29 01:11:04'),
(27, 1, 1, 'fa-users', 'Dr. Ramon B. Torres has finished scoring for <strong>Final 5 Portion</strong><hr>Click this notification to dismiss', 0, '2025-05-29 01:11:44', '2025-05-29 01:11:44');

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
(1, 1, 'NATIVE-CREATIVE COSTUME', 1, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:13:44', '2025-05-28 22:15:01'),
(2, 1, 'SWIMWEAR COMPETITION', 1, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:15:05', '2025-05-28 22:51:35'),
(3, 1, 'EVENING GOWN COMPETITION', 1, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:16:20', '2025-05-28 23:53:35'),
(4, 1, 'CASUAL INTERVIEW', 1, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:18:31', '2025-05-29 00:15:09'),
(5, 1, 'SELECTION OF TOP FIVE FINALIST', 5, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-29 11:21:43', '2023-11-29 11:21:43'),
(6, 1, 'Final 5', 5, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 1, 1, 2, '2023-11-29 11:23:57', '2025-05-29 00:44:04');

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
(64, 2, 12, NULL, '2024-11-26 14:06:37', '2024-11-26 14:06:37'),
(65, 3, 12, NULL, '2024-11-26 14:06:55', '2024-11-26 14:06:55'),
(66, 4, 12, NULL, '2024-11-26 14:07:03', '2024-11-26 14:07:03'),
(69, 1, 1, NULL, '2024-11-26 14:32:39', '2024-11-26 14:32:39'),
(70, 1, 4, NULL, '2024-11-26 14:32:39', '2024-11-26 14:32:39'),
(71, 1, 5, NULL, '2024-11-26 14:32:39', '2024-11-26 14:32:39'),
(77, 1, 2, NULL, '2025-05-28 08:58:46', '2025-05-28 08:58:46'),
(78, 1, 3, NULL, '2025-05-28 08:58:46', '2025-05-28 08:58:46'),
(79, 1, 6, NULL, '2025-05-28 08:58:46', '2025-05-28 08:58:46'),
(80, 1, 7, NULL, '2025-05-28 08:58:46', '2025-05-28 08:58:46'),
(81, 1, 8, NULL, '2025-05-28 08:58:46', '2025-05-28 08:58:46'),
(82, 1, 9, NULL, '2025-05-28 08:58:46', '2025-05-28 08:58:46'),
(83, 1, 10, NULL, '2025-05-28 08:58:46', '2025-05-28 08:58:46'),
(84, 1, 11, NULL, '2025-05-28 08:58:46', '2025-05-28 08:58:46'),
(85, 1, 12, NULL, '2025-05-28 08:58:46', '2025-05-28 08:58:46'),
(86, 5, 1, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(87, 5, 2, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(88, 5, 3, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(89, 5, 4, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(90, 5, 5, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(91, 5, 6, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(92, 5, 7, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(93, 5, 8, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(94, 5, 9, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(95, 5, 10, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(96, 5, 11, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(97, 5, 12, NULL, '2025-05-28 13:53:30', '2025-05-28 13:53:30'),
(98, 6, 5, 1, '2025-05-29 00:39:20', '2025-05-29 00:39:20'),
(99, 6, 9, 2, '2025-05-29 00:39:20', '2025-05-29 00:39:20'),
(100, 6, 12, 3, '2025-05-29 00:39:20', '2025-05-29 00:39:20'),
(101, 6, 6, 4, '2025-05-29 00:39:20', '2025-05-29 00:39:20'),
(102, 6, 11, 5, '2025-05-29 00:39:20', '2025-05-29 00:39:20');

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
(36, 1, 3, '2025-05-28 09:20:31', '2025-05-28 09:20:31'),
(37, 2, 3, '2025-05-28 09:21:59', '2025-05-28 09:21:59'),
(38, 3, 3, '2025-05-28 09:23:04', '2025-05-28 09:23:04'),
(39, 4, 3, '2025-05-28 09:24:24', '2025-05-28 09:24:24'),
(40, 5, 3, '2025-05-28 09:27:32', '2025-05-28 09:27:32'),
(41, 6, 3, '2025-05-28 09:29:17', '2025-05-28 09:29:17');

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
(5, 5, 1, 1, '2024-11-30 22:18:03', '2025-05-28 22:14:28'),
(6, 6, 1, 1, '2024-11-30 22:18:06', '2025-05-28 22:13:37'),
(7, 4, 1, 1, '2024-11-30 22:18:21', '2025-05-28 22:14:15'),
(8, 2, 1, 1, '2024-11-30 22:19:52', '2025-05-28 22:11:40'),
(9, 4, 2, 1, '2024-11-30 22:35:30', '2025-05-28 22:51:27'),
(10, 6, 2, 1, '2024-11-30 22:35:44', '2025-05-28 22:51:20'),
(11, 5, 2, 1, '2024-11-30 22:35:48', '2025-05-28 22:51:18'),
(12, 2, 2, 1, '2024-11-30 22:39:17', '2025-05-28 22:50:53'),
(13, 4, 3, 1, '2024-11-30 23:31:52', '2025-05-28 23:52:42'),
(14, 2, 3, 1, '2024-11-30 23:32:05', '2025-05-28 23:52:39'),
(15, 5, 3, 1, '2024-11-30 23:32:17', '2025-05-28 23:52:33'),
(16, 6, 3, 1, '2024-11-30 23:32:40', '2025-05-28 23:50:49'),
(17, 2, 4, 1, '2024-11-30 23:57:19', '2025-05-29 00:13:47'),
(18, 4, 4, 1, '2024-11-30 23:58:05', '2025-05-29 00:15:01'),
(19, 6, 4, 1, '2024-11-30 23:58:23', '2025-05-29 00:13:56'),
(20, 5, 4, 1, '2024-11-30 23:58:24', '2025-05-29 00:14:35'),
(21, 6, 6, 1, '2024-12-01 00:52:56', '2025-05-29 01:11:04'),
(22, 5, 6, 1, '2024-12-01 00:53:14', '2025-05-29 01:10:00'),
(23, 2, 6, 1, '2024-12-01 00:53:36', '2025-05-29 01:11:44'),
(24, 4, 6, 1, '2024-12-01 00:54:20', '2025-05-29 01:08:27'),
(25, 3, 1, 1, '2025-05-28 22:13:58', '2025-05-28 22:13:58'),
(26, 3, 2, 1, '2025-05-28 22:50:40', '2025-05-28 22:50:40'),
(27, 3, 3, 1, '2025-05-28 23:53:25', '2025-05-28 23:53:25'),
(28, 3, 4, 1, '2025-05-29 00:14:01', '2025-05-29 00:14:01'),
(29, 3, 6, 1, '2025-05-29 01:08:34', '2025-05-29 01:08:34');

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
(1, 1, 1, 'BEST IN NATIVE CREATIVE COSTUME', '2023-11-29 11:13:44', '2023-11-29 11:13:44'),
(2, 2, 1, 'BEST IN SWIMWEAR', '2023-11-29 11:15:05', '2023-11-29 11:15:05'),
(3, 3, 1, 'BEST IN EVENING GOWN', '2023-11-29 11:16:20', '2023-11-29 11:16:20'),
(5, 6, 1, 'BB. SAN JUAN 2025', '2023-11-29 11:23:57', '2023-11-29 11:23:57'),
(6, 6, 2, 'BB. SAN JUAN BARANGAY 2025', '2023-11-29 11:23:58', '2023-11-29 11:23:58'),
(7, 6, 3, 'BB. SAN JUAN TURISMO 2025', '2023-11-29 11:23:58', '2023-11-29 11:23:58'),
(8, 6, 4, 'BB. SAN JUAN 1ST RUNNER-UP', '2023-11-29 11:23:58', '2023-11-29 11:23:58'),
(9, 6, 5, 'BB. SAN JUAN 2ND RUNNER UP', '2023-11-29 11:23:58', '2023-11-29 11:23:58');

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
(49, 1, 6, 1, '2024-12-01 00:54:27'),
(50, 1, 1, 1, '2025-05-28 08:58:58'),
(51, 1, 1, 1, '2025-05-28 10:29:09'),
(52, 1, 1, 1, '2025-05-28 21:36:17'),
(53, 1, 1, 1, '2025-05-28 22:15:01'),
(54, 1, 2, 1, '2025-05-28 22:31:11'),
(55, 1, 2, 1, '2025-05-28 22:51:35'),
(56, 1, 3, 1, '2025-05-28 23:19:50'),
(57, 1, 4, 1, '2025-05-28 23:19:53'),
(58, 1, 3, 1, '2025-05-28 23:53:35'),
(59, 1, 4, 1, '2025-05-29 00:15:09'),
(60, 1, 6, 1, '2025-05-29 00:44:04');

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
(1, 2, 69, 1, 25.00, '2025-05-28 21:36:17', '2025-05-28 21:36:17'),
(2, 2, 69, 2, 30.00, '2025-05-28 21:36:17', '2025-05-28 21:36:17'),
(3, 2, 69, 3, 30.00, '2025-05-28 21:36:17', '2025-05-28 21:36:17'),
(4, 6, 69, 1, 26.00, '2025-05-28 21:36:18', '2025-05-28 21:36:18'),
(5, 6, 69, 2, 33.00, '2025-05-28 21:36:18', '2025-05-28 21:36:18'),
(6, 6, 69, 3, 32.00, '2025-05-28 21:36:18', '2025-05-28 21:36:18'),
(7, 4, 69, 1, 25.00, '2025-05-28 21:36:18', '2025-05-28 21:36:18'),
(8, 4, 69, 2, 25.00, '2025-05-28 21:36:18', '2025-05-28 21:36:18'),
(9, 4, 69, 3, 25.00, '2025-05-28 21:36:18', '2025-05-28 21:36:18'),
(10, 5, 69, 1, 25.00, '2025-05-28 21:36:18', '2025-05-28 21:36:18'),
(11, 5, 69, 2, 26.00, '2025-05-28 21:36:18', '2025-05-28 21:36:18'),
(12, 5, 69, 3, 28.00, '2025-05-28 21:36:18', '2025-05-28 21:36:18'),
(13, 3, 69, 1, 27.00, '2025-05-28 21:36:19', '2025-05-28 21:36:19'),
(14, 3, 69, 2, 28.00, '2025-05-28 21:36:19', '2025-05-28 21:36:19'),
(15, 3, 69, 3, 27.00, '2025-05-28 21:36:19', '2025-05-28 21:36:19'),
(16, 5, 77, 1, 25.00, '2025-05-28 21:50:11', '2025-05-28 21:50:11'),
(17, 5, 77, 2, 26.00, '2025-05-28 21:50:11', '2025-05-28 21:50:11'),
(18, 5, 77, 3, 28.00, '2025-05-28 21:50:11', '2025-05-28 21:50:11'),
(19, 3, 77, 1, 26.00, '2025-05-28 21:50:15', '2025-05-28 21:50:15'),
(20, 3, 77, 2, 27.00, '2025-05-28 21:50:15', '2025-05-28 21:50:15'),
(21, 3, 77, 3, 27.00, '2025-05-28 21:50:15', '2025-05-28 21:50:15'),
(22, 5, 78, 1, 25.00, '2025-05-28 21:50:56', '2025-05-28 21:50:56'),
(23, 5, 78, 2, 26.00, '2025-05-28 21:50:56', '2025-05-28 21:50:56'),
(24, 5, 78, 3, 28.00, '2025-05-28 21:50:56', '2025-05-28 21:50:56'),
(25, 2, 77, 1, 25.00, '2025-05-28 21:51:00', '2025-05-28 21:51:00'),
(26, 2, 77, 2, 28.00, '2025-05-28 21:51:00', '2025-05-28 21:51:00'),
(27, 2, 77, 3, 29.00, '2025-05-28 21:51:00', '2025-05-28 21:51:00'),
(28, 3, 78, 1, 27.00, '2025-05-28 21:51:14', '2025-05-28 21:51:14'),
(29, 3, 78, 2, 27.00, '2025-05-28 21:51:14', '2025-05-28 21:51:14'),
(30, 3, 78, 3, 26.00, '2025-05-28 21:51:14', '2025-05-28 21:51:14'),
(31, 2, 78, 1, 28.00, '2025-05-28 21:51:31', '2025-05-28 21:51:31'),
(32, 2, 78, 2, 30.00, '2025-05-28 21:51:31', '2025-05-28 21:51:31'),
(33, 2, 78, 3, 32.00, '2025-05-28 21:51:31', '2025-05-28 21:51:31'),
(34, 5, 70, 1, 25.00, '2025-05-28 21:52:02', '2025-05-28 21:52:02'),
(35, 5, 70, 2, 27.00, '2025-05-28 21:52:02', '2025-05-28 21:52:02'),
(36, 5, 70, 3, 28.00, '2025-05-28 21:52:02', '2025-05-28 21:52:02'),
(37, 3, 70, 1, 28.00, '2025-05-28 21:52:13', '2025-05-28 21:52:13'),
(38, 3, 70, 2, 28.00, '2025-05-28 21:52:13', '2025-05-28 21:52:13'),
(39, 3, 70, 3, 28.00, '2025-05-28 21:52:13', '2025-05-28 21:52:13'),
(40, 2, 70, 1, 28.00, '2025-05-28 21:52:48', '2025-05-28 21:52:48'),
(41, 2, 70, 2, 32.00, '2025-05-28 21:52:48', '2025-05-28 21:52:48'),
(42, 2, 70, 3, 32.00, '2025-05-28 21:52:48', '2025-05-28 21:52:48'),
(43, 3, 71, 1, 28.00, '2025-05-28 21:53:38', '2025-05-28 21:53:38'),
(44, 3, 71, 2, 28.00, '2025-05-28 21:53:38', '2025-05-28 21:53:38'),
(45, 3, 71, 3, 29.00, '2025-05-28 21:53:38', '2025-05-28 21:53:38'),
(46, 5, 71, 1, 30.00, '2025-05-28 21:53:51', '2025-05-28 21:53:51'),
(47, 5, 71, 2, 30.00, '2025-05-28 21:53:51', '2025-05-28 21:53:51'),
(48, 5, 71, 3, 32.00, '2025-05-28 21:53:51', '2025-05-28 21:53:51'),
(49, 2, 71, 1, 27.00, '2025-05-28 21:54:43', '2025-05-28 21:54:43'),
(50, 2, 71, 2, 31.00, '2025-05-28 21:54:43', '2025-05-28 21:54:43'),
(51, 2, 71, 3, 30.00, '2025-05-28 21:54:43', '2025-05-28 21:54:43'),
(52, 3, 79, 1, 28.00, '2025-05-28 21:55:58', '2025-05-28 21:55:58'),
(53, 3, 79, 2, 28.00, '2025-05-28 21:55:58', '2025-05-28 21:55:58'),
(54, 3, 79, 3, 26.00, '2025-05-28 21:55:58', '2025-05-28 21:55:58'),
(55, 2, 79, 1, 28.00, '2025-05-28 21:56:22', '2025-05-28 21:56:22'),
(56, 2, 79, 2, 33.00, '2025-05-28 21:56:22', '2025-05-28 21:56:22'),
(57, 2, 79, 3, 34.00, '2025-05-28 21:56:22', '2025-05-28 21:56:22'),
(58, 5, 79, 1, 25.00, '2025-05-28 21:56:52', '2025-05-28 21:56:52'),
(59, 5, 79, 2, 29.00, '2025-05-28 21:56:52', '2025-05-28 21:56:52'),
(60, 5, 79, 3, 27.00, '2025-05-28 21:56:52', '2025-05-28 21:56:52'),
(61, 5, 80, 1, 25.00, '2025-05-28 21:57:24', '2025-05-28 21:57:24'),
(62, 5, 80, 2, 28.00, '2025-05-28 21:57:24', '2025-05-28 21:57:24'),
(63, 5, 80, 3, 26.00, '2025-05-28 21:57:24', '2025-05-28 21:57:24'),
(64, 6, 77, 1, 26.00, '2025-05-28 21:57:28', '2025-05-28 21:57:28'),
(65, 6, 77, 2, 33.00, '2025-05-28 21:57:28', '2025-05-28 21:57:28'),
(66, 6, 77, 3, 33.00, '2025-05-28 21:57:28', '2025-05-28 21:57:28'),
(67, 3, 80, 1, 27.00, '2025-05-28 21:57:40', '2025-05-28 21:57:40'),
(68, 3, 80, 2, 27.00, '2025-05-28 21:57:40', '2025-05-28 21:57:40'),
(69, 3, 80, 3, 26.00, '2025-05-28 21:57:40', '2025-05-28 21:57:40'),
(70, 6, 78, 1, 25.00, '2025-05-28 21:57:42', '2025-05-28 21:57:42'),
(71, 6, 78, 2, 30.00, '2025-05-28 21:57:42', '2025-05-28 21:57:42'),
(72, 6, 78, 3, 32.00, '2025-05-28 21:57:42', '2025-05-28 21:57:42'),
(73, 6, 70, 1, 30.00, '2025-05-28 21:58:04', '2025-05-28 21:58:04'),
(74, 6, 70, 2, 35.00, '2025-05-28 21:58:04', '2025-05-28 21:58:04'),
(75, 6, 70, 3, 35.00, '2025-05-28 21:58:04', '2025-05-28 21:58:04'),
(76, 2, 80, 1, 28.00, '2025-05-28 21:58:10', '2025-05-28 21:58:10'),
(77, 2, 80, 2, 30.00, '2025-05-28 21:58:10', '2025-05-28 21:58:10'),
(78, 2, 80, 3, 30.00, '2025-05-28 21:58:10', '2025-05-28 21:58:10'),
(79, 4, 77, 1, 25.00, '2025-05-28 21:58:23', '2025-05-28 21:58:23'),
(80, 4, 77, 2, 28.00, '2025-05-28 21:58:23', '2025-05-28 21:58:23'),
(81, 4, 77, 3, 30.00, '2025-05-28 21:58:23', '2025-05-28 21:58:23'),
(82, 6, 71, 1, 28.00, '2025-05-28 21:58:35', '2025-05-28 21:58:35'),
(83, 6, 71, 2, 33.00, '2025-05-28 21:58:35', '2025-05-28 21:58:35'),
(84, 6, 71, 3, 33.00, '2025-05-28 21:58:35', '2025-05-28 21:58:35'),
(85, 4, 78, 1, 28.00, '2025-05-28 21:58:36', '2025-05-28 21:58:36'),
(86, 4, 78, 2, 33.00, '2025-05-28 21:58:36', '2025-05-28 21:58:36'),
(87, 4, 78, 3, 35.00, '2025-05-28 21:58:36', '2025-05-28 21:58:36'),
(88, 6, 79, 1, 28.00, '2025-05-28 21:58:58', '2025-05-28 21:58:58'),
(89, 6, 79, 2, 33.00, '2025-05-28 21:58:58', '2025-05-28 21:58:58'),
(90, 6, 79, 3, 35.00, '2025-05-28 21:58:58', '2025-05-28 21:58:58'),
(91, 4, 70, 1, 30.00, '2025-05-28 21:59:00', '2025-05-28 21:59:00'),
(92, 4, 70, 2, 35.00, '2025-05-28 21:59:00', '2025-05-28 21:59:00'),
(93, 4, 70, 3, 35.00, '2025-05-28 21:59:00', '2025-05-28 21:59:00'),
(94, 4, 71, 1, 28.00, '2025-05-28 21:59:14', '2025-05-28 21:59:14'),
(95, 4, 71, 2, 33.00, '2025-05-28 21:59:14', '2025-05-28 21:59:14'),
(96, 4, 71, 3, 35.00, '2025-05-28 21:59:14', '2025-05-28 21:59:14'),
(97, 4, 79, 1, 30.00, '2025-05-28 21:59:31', '2025-05-28 21:59:31'),
(98, 4, 79, 2, 35.00, '2025-05-28 21:59:31', '2025-05-28 21:59:31'),
(99, 4, 79, 3, 35.00, '2025-05-28 21:59:31', '2025-05-28 21:59:31'),
(100, 3, 81, 1, 27.00, '2025-05-28 22:00:22', '2025-05-28 22:00:22'),
(101, 3, 81, 2, 27.00, '2025-05-28 22:00:22', '2025-05-28 22:00:22'),
(102, 3, 81, 3, 26.00, '2025-05-28 22:00:22', '2025-05-28 22:00:22'),
(103, 6, 80, 1, 26.00, '2025-05-28 22:00:22', '2025-05-28 22:00:22'),
(104, 6, 80, 2, 32.00, '2025-05-28 22:00:22', '2025-05-28 22:00:22'),
(105, 6, 80, 3, 32.00, '2025-05-28 22:00:22', '2025-05-28 22:00:22'),
(106, 6, 81, 1, 26.00, '2025-05-28 22:00:39', '2025-05-28 22:00:39'),
(107, 6, 81, 2, 33.00, '2025-05-28 22:00:39', '2025-05-28 22:00:39'),
(108, 6, 81, 3, 32.00, '2025-05-28 22:00:39', '2025-05-28 22:00:39'),
(109, 5, 81, 1, 25.00, '2025-05-28 22:00:41', '2025-05-28 22:00:41'),
(110, 5, 81, 2, 27.00, '2025-05-28 22:00:41', '2025-05-28 22:00:41'),
(111, 5, 81, 3, 26.00, '2025-05-28 22:00:41', '2025-05-28 22:00:41'),
(112, 2, 81, 1, 26.00, '2025-05-28 22:01:25', '2025-05-28 22:01:25'),
(113, 2, 81, 2, 31.00, '2025-05-28 22:01:25', '2025-05-28 22:01:25'),
(114, 2, 81, 3, 30.00, '2025-05-28 22:01:25', '2025-05-28 22:01:25'),
(115, 3, 82, 1, 27.00, '2025-05-28 22:02:13', '2025-05-28 22:02:13'),
(116, 3, 82, 2, 26.00, '2025-05-28 22:02:13', '2025-05-28 22:02:13'),
(117, 3, 82, 3, 29.00, '2025-05-28 22:02:13', '2025-05-28 22:02:13'),
(118, 2, 82, 1, 28.00, '2025-05-28 22:02:54', '2025-05-28 22:02:54'),
(119, 2, 82, 2, 32.00, '2025-05-28 22:02:54', '2025-05-28 22:02:54'),
(120, 2, 82, 3, 31.00, '2025-05-28 22:02:54', '2025-05-28 22:02:54'),
(121, 3, 83, 1, 27.00, '2025-05-28 22:03:48', '2025-05-28 22:03:48'),
(122, 3, 83, 2, 27.00, '2025-05-28 22:03:48', '2025-05-28 22:03:48'),
(123, 3, 83, 3, 28.00, '2025-05-28 22:03:48', '2025-05-28 22:03:48'),
(124, 5, 82, 1, 28.00, '2025-05-28 22:03:52', '2025-05-28 22:03:52'),
(125, 5, 82, 2, 32.00, '2025-05-28 22:03:52', '2025-05-28 22:03:52'),
(126, 5, 82, 3, 35.00, '2025-05-28 22:03:52', '2025-05-28 22:03:52'),
(127, 6, 82, 1, 29.00, '2025-05-28 22:04:20', '2025-05-28 22:04:20'),
(128, 6, 82, 2, 33.00, '2025-05-28 22:04:20', '2025-05-28 22:04:20'),
(129, 6, 82, 3, 34.00, '2025-05-28 22:04:20', '2025-05-28 22:04:20'),
(130, 2, 83, 1, 27.00, '2025-05-28 22:04:29', '2025-05-28 22:04:29'),
(131, 2, 83, 2, 32.00, '2025-05-28 22:04:29', '2025-05-28 22:04:29'),
(132, 2, 83, 3, 34.00, '2025-05-28 22:04:29', '2025-05-28 22:04:29'),
(133, 5, 83, 1, 26.00, '2025-05-28 22:04:44', '2025-05-28 22:04:44'),
(134, 5, 83, 2, 27.00, '2025-05-28 22:04:44', '2025-05-28 22:04:44'),
(135, 5, 83, 3, 27.00, '2025-05-28 22:04:44', '2025-05-28 22:04:44'),
(136, 3, 84, 1, 28.00, '2025-05-28 22:05:34', '2025-05-28 22:05:34'),
(137, 3, 84, 2, 28.00, '2025-05-28 22:05:34', '2025-05-28 22:05:34'),
(138, 3, 84, 3, 27.00, '2025-05-28 22:05:34', '2025-05-28 22:05:34'),
(139, 2, 84, 1, 27.00, '2025-05-28 22:05:58', '2025-05-28 22:05:58'),
(140, 2, 84, 2, 31.00, '2025-05-28 22:05:58', '2025-05-28 22:05:58'),
(141, 2, 84, 3, 31.00, '2025-05-28 22:05:58', '2025-05-28 22:05:58'),
(142, 5, 84, 1, 28.00, '2025-05-28 22:06:27', '2025-05-28 22:06:27'),
(143, 5, 84, 2, 26.00, '2025-05-28 22:06:27', '2025-05-28 22:06:27'),
(144, 5, 84, 3, 27.00, '2025-05-28 22:06:27', '2025-05-28 22:06:27'),
(145, 3, 85, 1, 27.00, '2025-05-28 22:06:41', '2025-05-28 22:06:41'),
(146, 3, 85, 2, 28.00, '2025-05-28 22:06:42', '2025-05-28 22:06:42'),
(147, 3, 85, 3, 27.00, '2025-05-28 22:06:42', '2025-05-28 22:06:42'),
(148, 5, 85, 1, 26.00, '2025-05-28 22:07:12', '2025-05-28 22:07:12'),
(149, 5, 85, 2, 28.00, '2025-05-28 22:07:12', '2025-05-28 22:07:12'),
(150, 5, 85, 3, 32.00, '2025-05-28 22:07:12', '2025-05-28 22:07:12'),
(151, 2, 85, 1, 28.00, '2025-05-28 22:07:38', '2025-05-28 22:07:38'),
(152, 2, 85, 2, 32.00, '2025-05-28 22:07:38', '2025-05-28 22:07:38'),
(153, 2, 85, 3, 32.00, '2025-05-28 22:07:38', '2025-05-28 22:07:38'),
(154, 4, 80, 1, 28.00, '2025-05-28 22:08:19', '2025-05-28 22:08:19'),
(155, 4, 80, 2, 28.00, '2025-05-28 22:08:19', '2025-05-28 22:08:19'),
(156, 4, 80, 3, 28.00, '2025-05-28 22:08:19', '2025-05-28 22:08:19'),
(157, 4, 81, 1, 30.00, '2025-05-28 22:08:34', '2025-05-28 22:08:34'),
(158, 4, 81, 2, 34.00, '2025-05-28 22:08:34', '2025-05-28 22:08:34'),
(159, 4, 81, 3, 35.00, '2025-05-28 22:08:34', '2025-05-28 22:08:34'),
(160, 4, 82, 1, 30.00, '2025-05-28 22:08:46', '2025-05-28 22:08:46'),
(161, 4, 82, 2, 33.00, '2025-05-28 22:08:46', '2025-05-28 22:08:46'),
(162, 4, 82, 3, 35.00, '2025-05-28 22:08:46', '2025-05-28 22:08:46'),
(163, 6, 83, 1, 28.00, '2025-05-28 22:08:49', '2025-05-28 22:08:49'),
(164, 6, 83, 2, 34.00, '2025-05-28 22:08:49', '2025-05-28 22:08:49'),
(165, 6, 83, 3, 35.00, '2025-05-28 22:08:49', '2025-05-28 22:08:49'),
(166, 4, 83, 1, 28.00, '2025-05-28 22:09:01', '2025-05-28 22:09:01'),
(167, 4, 83, 2, 30.00, '2025-05-28 22:09:01', '2025-05-28 22:09:01'),
(168, 4, 83, 3, 30.00, '2025-05-28 22:09:01', '2025-05-28 22:09:01'),
(169, 6, 84, 1, 29.00, '2025-05-28 22:09:07', '2025-05-28 22:09:07'),
(170, 6, 84, 2, 34.00, '2025-05-28 22:09:07', '2025-05-28 22:09:07'),
(171, 6, 84, 3, 33.00, '2025-05-28 22:09:07', '2025-05-28 22:09:07'),
(172, 4, 84, 1, 28.00, '2025-05-28 22:09:17', '2025-05-28 22:09:17'),
(173, 4, 84, 2, 33.00, '2025-05-28 22:09:17', '2025-05-28 22:09:17'),
(174, 4, 84, 3, 35.00, '2025-05-28 22:09:17', '2025-05-28 22:09:17'),
(175, 6, 85, 1, 29.00, '2025-05-28 22:09:25', '2025-05-28 22:09:25'),
(176, 6, 85, 2, 34.00, '2025-05-28 22:09:25', '2025-05-28 22:09:25'),
(177, 6, 85, 3, 34.00, '2025-05-28 22:09:25', '2025-05-28 22:09:25'),
(178, 4, 85, 1, 30.00, '2025-05-28 22:09:30', '2025-05-28 22:09:30'),
(179, 4, 85, 2, 35.00, '2025-05-28 22:09:30', '2025-05-28 22:09:30'),
(180, 4, 85, 3, 35.00, '2025-05-28 22:09:30', '2025-05-28 22:09:30'),
(181, 2, 4, 5, 30.00, '2025-05-28 22:31:11', '2025-05-28 22:31:11'),
(182, 3, 4, 5, 27.00, '2025-05-28 22:31:11', '2025-05-28 22:31:11'),
(183, 2, 4, 6, 28.00, '2025-05-28 22:31:11', '2025-05-28 22:31:11'),
(184, 3, 4, 6, 26.00, '2025-05-28 22:31:11', '2025-05-28 22:31:11'),
(185, 2, 4, 7, 26.00, '2025-05-28 22:31:11', '2025-05-28 22:31:11'),
(186, 3, 4, 7, 27.00, '2025-05-28 22:31:11', '2025-05-28 22:31:11'),
(187, 6, 4, 5, 32.00, '2025-05-28 22:31:11', '2025-05-28 22:31:11'),
(188, 6, 4, 6, 32.00, '2025-05-28 22:31:11', '2025-05-28 22:31:11'),
(189, 6, 4, 7, 26.00, '2025-05-28 22:31:11', '2025-05-28 22:31:11'),
(190, 4, 4, 5, 25.00, '2025-05-28 22:31:12', '2025-05-28 22:31:12'),
(191, 4, 4, 6, 25.00, '2025-05-28 22:31:12', '2025-05-28 22:31:12'),
(192, 4, 4, 7, 25.00, '2025-05-28 22:31:12', '2025-05-28 22:31:12'),
(193, 5, 4, 5, 27.00, '2025-05-28 22:31:12', '2025-05-28 22:31:12'),
(194, 5, 4, 6, 26.00, '2025-05-28 22:31:12', '2025-05-28 22:31:12'),
(195, 5, 4, 7, 25.00, '2025-05-28 22:31:12', '2025-05-28 22:31:12'),
(196, 3, 5, 5, 26.00, '2025-05-28 22:32:24', '2025-05-28 22:32:24'),
(197, 3, 5, 6, 27.00, '2025-05-28 22:32:24', '2025-05-28 22:32:24'),
(198, 3, 5, 7, 27.00, '2025-05-28 22:32:24', '2025-05-28 22:32:24'),
(199, 5, 5, 5, 26.00, '2025-05-28 22:32:37', '2025-05-28 22:32:37'),
(200, 5, 5, 6, 28.00, '2025-05-28 22:32:37', '2025-05-28 22:32:37'),
(201, 5, 5, 7, 28.00, '2025-05-28 22:32:37', '2025-05-28 22:32:37'),
(202, 5, 6, 5, 25.00, '2025-05-28 22:33:07', '2025-05-28 22:33:07'),
(203, 5, 6, 6, 27.00, '2025-05-28 22:33:07', '2025-05-28 22:33:07'),
(204, 5, 6, 7, 27.00, '2025-05-28 22:33:07', '2025-05-28 22:33:07'),
(205, 3, 6, 5, 27.00, '2025-05-28 22:33:10', '2025-05-28 22:33:10'),
(206, 3, 6, 6, 27.00, '2025-05-28 22:33:10', '2025-05-28 22:33:10'),
(207, 3, 6, 7, 26.00, '2025-05-28 22:33:10', '2025-05-28 22:33:10'),
(208, 5, 7, 5, 26.00, '2025-05-28 22:33:59', '2025-05-28 22:33:59'),
(209, 5, 7, 6, 28.00, '2025-05-28 22:33:59', '2025-05-28 22:33:59'),
(210, 5, 7, 7, 28.00, '2025-05-28 22:33:59', '2025-05-28 22:33:59'),
(211, 3, 7, 5, 27.00, '2025-05-28 22:34:00', '2025-05-28 22:34:00'),
(212, 3, 7, 6, 26.00, '2025-05-28 22:34:00', '2025-05-28 22:34:00'),
(213, 3, 7, 7, 27.00, '2025-05-28 22:34:00', '2025-05-28 22:34:00'),
(214, 5, 8, 5, 35.00, '2025-05-28 22:34:40', '2025-05-28 22:34:40'),
(215, 5, 8, 6, 35.00, '2025-05-28 22:34:40', '2025-05-28 22:34:40'),
(216, 5, 8, 7, 30.00, '2025-05-28 22:34:40', '2025-05-28 22:34:40'),
(217, 3, 8, 5, 28.00, '2025-05-28 22:35:04', '2025-05-28 22:35:04'),
(218, 3, 8, 6, 28.00, '2025-05-28 22:35:04', '2025-05-28 22:35:04'),
(219, 3, 8, 7, 29.00, '2025-05-28 22:35:04', '2025-05-28 22:35:04'),
(220, 3, 9, 5, 27.00, '2025-05-28 22:36:17', '2025-05-28 22:36:17'),
(221, 3, 9, 6, 27.00, '2025-05-28 22:36:17', '2025-05-28 22:36:17'),
(222, 3, 9, 7, 27.00, '2025-05-28 22:36:17', '2025-05-28 22:36:17'),
(223, 5, 9, 5, 30.00, '2025-05-28 22:36:23', '2025-05-28 22:36:23'),
(224, 5, 9, 6, 30.00, '2025-05-28 22:36:23', '2025-05-28 22:36:23'),
(225, 5, 9, 7, 30.00, '2025-05-28 22:36:23', '2025-05-28 22:36:23'),
(226, 3, 10, 5, 26.00, '2025-05-28 22:37:46', '2025-05-28 22:37:46'),
(227, 3, 10, 6, 27.00, '2025-05-28 22:37:46', '2025-05-28 22:37:46'),
(228, 3, 10, 7, 27.00, '2025-05-28 22:37:46', '2025-05-28 22:37:46'),
(229, 5, 10, 5, 27.00, '2025-05-28 22:38:29', '2025-05-28 22:38:29'),
(230, 5, 10, 6, 26.00, '2025-05-28 22:38:29', '2025-05-28 22:38:29'),
(231, 5, 10, 7, 28.00, '2025-05-28 22:38:29', '2025-05-28 22:38:29'),
(232, 6, 5, 5, 33.00, '2025-05-28 22:38:57', '2025-05-28 22:38:57'),
(233, 6, 5, 6, 33.00, '2025-05-28 22:38:57', '2025-05-28 22:38:57'),
(234, 6, 5, 7, 26.00, '2025-05-28 22:38:57', '2025-05-28 22:38:57'),
(235, 6, 6, 5, 33.00, '2025-05-28 22:39:08', '2025-05-28 22:39:08'),
(236, 6, 6, 6, 34.00, '2025-05-28 22:39:08', '2025-05-28 22:39:08'),
(237, 6, 6, 7, 26.00, '2025-05-28 22:39:08', '2025-05-28 22:39:08'),
(238, 3, 11, 5, 27.00, '2025-05-28 22:39:20', '2025-05-28 22:39:20'),
(239, 3, 11, 6, 26.00, '2025-05-28 22:39:20', '2025-05-28 22:39:20'),
(240, 3, 11, 7, 27.00, '2025-05-28 22:39:20', '2025-05-28 22:39:20'),
(241, 5, 11, 5, 26.00, '2025-05-28 22:39:42', '2025-05-28 22:39:42'),
(242, 5, 11, 6, 25.00, '2025-05-28 22:39:42', '2025-05-28 22:39:42'),
(243, 5, 11, 7, 26.00, '2025-05-28 22:39:42', '2025-05-28 22:39:42'),
(244, 3, 12, 5, 28.00, '2025-05-28 22:40:01', '2025-05-28 22:40:01'),
(245, 3, 12, 6, 27.00, '2025-05-28 22:40:01', '2025-05-28 22:40:01'),
(246, 3, 12, 7, 26.00, '2025-05-28 22:40:01', '2025-05-28 22:40:01'),
(247, 5, 12, 5, 35.00, '2025-05-28 22:40:07', '2025-05-28 22:40:07'),
(248, 5, 12, 6, 35.00, '2025-05-28 22:40:07', '2025-05-28 22:40:07'),
(249, 5, 12, 7, 30.00, '2025-05-28 22:40:07', '2025-05-28 22:40:07'),
(250, 6, 7, 5, 32.00, '2025-05-28 22:40:20', '2025-05-28 22:40:20'),
(251, 6, 7, 6, 33.00, '2025-05-28 22:40:20', '2025-05-28 22:40:20'),
(252, 6, 7, 7, 26.00, '2025-05-28 22:40:20', '2025-05-28 22:40:20'),
(253, 3, 13, 5, 27.00, '2025-05-28 22:41:04', '2025-05-28 22:41:04'),
(254, 3, 13, 6, 26.00, '2025-05-28 22:41:04', '2025-05-28 22:41:04'),
(255, 3, 13, 7, 27.00, '2025-05-28 22:41:04', '2025-05-28 22:41:04'),
(256, 3, 14, 5, 28.00, '2025-05-28 22:42:27', '2025-05-28 22:42:27'),
(257, 3, 14, 6, 27.00, '2025-05-28 22:42:27', '2025-05-28 22:42:27'),
(258, 3, 14, 7, 27.00, '2025-05-28 22:42:27', '2025-05-28 22:42:27'),
(259, 5, 13, 5, 26.00, '2025-05-28 22:42:44', '2025-05-28 22:42:44'),
(260, 5, 13, 6, 27.00, '2025-05-28 22:42:44', '2025-05-28 22:42:44'),
(261, 5, 13, 7, 29.00, '2025-05-28 22:42:44', '2025-05-28 22:42:44'),
(262, 3, 64, 5, 27.00, '2025-05-28 22:43:20', '2025-05-28 22:43:20'),
(263, 3, 64, 6, 27.00, '2025-05-28 22:43:20', '2025-05-28 22:43:20'),
(264, 3, 64, 7, 28.00, '2025-05-28 22:43:20', '2025-05-28 22:43:20'),
(265, 5, 14, 5, 30.00, '2025-05-28 22:43:33', '2025-05-28 22:43:33'),
(266, 5, 14, 6, 27.00, '2025-05-28 22:43:33', '2025-05-28 22:43:33'),
(267, 5, 14, 7, 28.00, '2025-05-28 22:43:33', '2025-05-28 22:43:33'),
(268, 5, 64, 5, 30.00, '2025-05-28 22:44:14', '2025-05-28 22:44:14'),
(269, 5, 64, 6, 30.00, '2025-05-28 22:44:14', '2025-05-28 22:44:14'),
(270, 5, 64, 7, 30.00, '2025-05-28 22:44:14', '2025-05-28 22:44:14'),
(271, 2, 5, 5, 30.00, '2025-05-28 22:44:35', '2025-05-28 22:44:35'),
(272, 2, 5, 6, 30.00, '2025-05-28 22:44:35', '2025-05-28 22:44:35'),
(273, 2, 5, 7, 26.00, '2025-05-28 22:44:35', '2025-05-28 22:44:35'),
(274, 6, 8, 5, 33.00, '2025-05-28 22:44:43', '2025-05-28 22:44:43'),
(275, 6, 8, 6, 33.00, '2025-05-28 22:44:43', '2025-05-28 22:44:43'),
(276, 6, 8, 7, 29.00, '2025-05-28 22:44:43', '2025-05-28 22:44:43'),
(277, 6, 9, 5, 35.00, '2025-05-28 22:44:55', '2025-05-28 22:44:55'),
(278, 6, 9, 6, 35.00, '2025-05-28 22:44:55', '2025-05-28 22:44:55'),
(279, 6, 9, 7, 28.00, '2025-05-28 22:44:55', '2025-05-28 22:44:55'),
(280, 2, 6, 5, 30.00, '2025-05-28 22:44:57', '2025-05-28 22:44:57'),
(281, 2, 6, 6, 30.00, '2025-05-28 22:44:57', '2025-05-28 22:44:57'),
(282, 2, 6, 7, 26.00, '2025-05-28 22:44:57', '2025-05-28 22:44:57'),
(283, 6, 10, 5, 32.00, '2025-05-28 22:45:13', '2025-05-28 22:45:13'),
(284, 6, 10, 6, 33.00, '2025-05-28 22:45:13', '2025-05-28 22:45:13'),
(285, 6, 10, 7, 26.00, '2025-05-28 22:45:13', '2025-05-28 22:45:13'),
(286, 2, 7, 5, 33.00, '2025-05-28 22:45:18', '2025-05-28 22:45:18'),
(287, 2, 7, 6, 32.00, '2025-05-28 22:45:18', '2025-05-28 22:45:18'),
(288, 2, 7, 7, 28.00, '2025-05-28 22:45:18', '2025-05-28 22:45:18'),
(289, 6, 11, 5, 32.00, '2025-05-28 22:45:25', '2025-05-28 22:45:25'),
(290, 6, 11, 6, 32.00, '2025-05-28 22:45:25', '2025-05-28 22:45:25'),
(291, 6, 11, 7, 26.00, '2025-05-28 22:45:25', '2025-05-28 22:45:25'),
(292, 6, 12, 5, 34.00, '2025-05-28 22:45:35', '2025-05-28 22:45:35'),
(293, 6, 12, 6, 33.00, '2025-05-28 22:45:35', '2025-05-28 22:45:35'),
(294, 6, 12, 7, 27.00, '2025-05-28 22:45:35', '2025-05-28 22:45:35'),
(295, 2, 8, 5, 31.00, '2025-05-28 22:45:42', '2025-05-28 22:45:42'),
(296, 2, 8, 6, 33.00, '2025-05-28 22:45:42', '2025-05-28 22:45:42'),
(297, 2, 8, 7, 27.00, '2025-05-28 22:45:42', '2025-05-28 22:45:42'),
(298, 6, 13, 5, 33.00, '2025-05-28 22:45:47', '2025-05-28 22:45:47'),
(299, 6, 13, 6, 33.00, '2025-05-28 22:45:47', '2025-05-28 22:45:47'),
(300, 6, 13, 7, 25.00, '2025-05-28 22:45:47', '2025-05-28 22:45:47'),
(301, 6, 14, 5, 32.00, '2025-05-28 22:45:57', '2025-05-28 22:45:57'),
(302, 6, 14, 6, 32.00, '2025-05-28 22:45:57', '2025-05-28 22:45:57'),
(303, 6, 14, 7, 26.00, '2025-05-28 22:45:57', '2025-05-28 22:45:57'),
(304, 6, 64, 5, 34.00, '2025-05-28 22:46:19', '2025-05-28 22:46:19'),
(305, 6, 64, 6, 33.00, '2025-05-28 22:46:19', '2025-05-28 22:46:19'),
(306, 6, 64, 7, 30.00, '2025-05-28 22:46:19', '2025-05-28 22:46:19'),
(307, 2, 9, 5, 32.00, '2025-05-28 22:46:34', '2025-05-28 22:46:34'),
(308, 2, 9, 6, 33.00, '2025-05-28 22:46:34', '2025-05-28 22:46:34'),
(309, 2, 9, 7, 28.00, '2025-05-28 22:46:34', '2025-05-28 22:46:34'),
(310, 2, 10, 5, 30.00, '2025-05-28 22:47:06', '2025-05-28 22:47:06'),
(311, 2, 10, 6, 30.00, '2025-05-28 22:47:06', '2025-05-28 22:47:06'),
(312, 2, 10, 7, 26.00, '2025-05-28 22:47:06', '2025-05-28 22:47:06'),
(313, 4, 5, 5, 28.00, '2025-05-28 22:48:30', '2025-05-28 22:48:30'),
(314, 4, 5, 6, 28.00, '2025-05-28 22:48:30', '2025-05-28 22:48:30'),
(315, 4, 5, 7, 28.00, '2025-05-28 22:48:30', '2025-05-28 22:48:30'),
(316, 2, 11, 5, 30.00, '2025-05-28 22:48:33', '2025-05-28 22:48:33'),
(317, 2, 11, 6, 29.00, '2025-05-28 22:48:33', '2025-05-28 22:48:33'),
(318, 2, 11, 7, 26.00, '2025-05-28 22:48:33', '2025-05-28 22:48:33'),
(319, 4, 6, 5, 30.00, '2025-05-28 22:48:42', '2025-05-28 22:48:42'),
(320, 4, 6, 6, 30.00, '2025-05-28 22:48:42', '2025-05-28 22:48:42'),
(321, 4, 6, 7, 30.00, '2025-05-28 22:48:42', '2025-05-28 22:48:42'),
(322, 2, 12, 5, 32.00, '2025-05-28 22:48:53', '2025-05-28 22:48:53'),
(323, 2, 12, 6, 31.00, '2025-05-28 22:48:53', '2025-05-28 22:48:53'),
(324, 2, 12, 7, 27.00, '2025-05-28 22:48:53', '2025-05-28 22:48:53'),
(325, 4, 7, 5, 35.00, '2025-05-28 22:48:53', '2025-05-28 22:48:53'),
(326, 4, 7, 6, 35.00, '2025-05-28 22:48:53', '2025-05-28 22:48:53'),
(327, 4, 7, 7, 30.00, '2025-05-28 22:48:53', '2025-05-28 22:48:53'),
(328, 4, 8, 5, 35.00, '2025-05-28 22:49:06', '2025-05-28 22:49:06'),
(329, 4, 8, 6, 35.00, '2025-05-28 22:49:06', '2025-05-28 22:49:06'),
(330, 4, 8, 7, 30.00, '2025-05-28 22:49:06', '2025-05-28 22:49:06'),
(331, 4, 9, 5, 35.00, '2025-05-28 22:49:19', '2025-05-28 22:49:19'),
(332, 4, 9, 6, 35.00, '2025-05-28 22:49:19', '2025-05-28 22:49:19'),
(333, 4, 9, 7, 30.00, '2025-05-28 22:49:19', '2025-05-28 22:49:19'),
(334, 2, 13, 5, 30.00, '2025-05-28 22:49:22', '2025-05-28 22:49:22'),
(335, 2, 13, 6, 29.00, '2025-05-28 22:49:22', '2025-05-28 22:49:22'),
(336, 2, 13, 7, 26.00, '2025-05-28 22:49:22', '2025-05-28 22:49:22'),
(337, 4, 10, 5, 35.00, '2025-05-28 22:49:32', '2025-05-28 22:49:32'),
(338, 4, 10, 6, 35.00, '2025-05-28 22:49:32', '2025-05-28 22:49:32'),
(339, 4, 10, 7, 30.00, '2025-05-28 22:49:32', '2025-05-28 22:49:32'),
(340, 4, 11, 5, 28.00, '2025-05-28 22:49:42', '2025-05-28 22:49:42'),
(341, 4, 11, 6, 28.00, '2025-05-28 22:49:42', '2025-05-28 22:49:42'),
(342, 4, 11, 7, 28.00, '2025-05-28 22:49:42', '2025-05-28 22:49:42'),
(343, 2, 14, 5, 30.00, '2025-05-28 22:49:50', '2025-05-28 22:49:50'),
(344, 2, 14, 6, 30.00, '2025-05-28 22:49:50', '2025-05-28 22:49:50'),
(345, 2, 14, 7, 27.00, '2025-05-28 22:49:50', '2025-05-28 22:49:50'),
(346, 4, 12, 5, 30.00, '2025-05-28 22:49:54', '2025-05-28 22:49:54'),
(347, 4, 12, 6, 35.00, '2025-05-28 22:49:54', '2025-05-28 22:49:54'),
(348, 4, 12, 7, 30.00, '2025-05-28 22:49:54', '2025-05-28 22:49:54'),
(349, 4, 13, 5, 28.00, '2025-05-28 22:50:11', '2025-05-28 22:50:11'),
(350, 4, 13, 6, 30.00, '2025-05-28 22:50:11', '2025-05-28 22:50:11'),
(351, 4, 13, 7, 28.00, '2025-05-28 22:50:11', '2025-05-28 22:50:11'),
(352, 2, 64, 5, 31.00, '2025-05-28 22:50:14', '2025-05-28 22:50:14'),
(353, 2, 64, 6, 32.00, '2025-05-28 22:50:14', '2025-05-28 22:50:14'),
(354, 2, 64, 7, 28.00, '2025-05-28 22:50:14', '2025-05-28 22:50:14'),
(355, 4, 14, 5, 35.00, '2025-05-28 22:50:24', '2025-05-28 22:50:24'),
(356, 4, 14, 6, 35.00, '2025-05-28 22:50:24', '2025-05-28 22:50:24'),
(357, 4, 14, 7, 30.00, '2025-05-28 22:50:24', '2025-05-28 22:50:24'),
(358, 4, 64, 5, 35.00, '2025-05-28 22:50:38', '2025-05-28 22:50:38'),
(359, 4, 64, 6, 35.00, '2025-05-28 22:50:38', '2025-05-28 22:50:38'),
(360, 4, 64, 7, 30.00, '2025-05-28 22:50:38', '2025-05-28 22:50:38'),
(361, 6, 15, 9, 33.00, '2025-05-28 23:19:50', '2025-05-28 23:19:50'),
(362, 6, 15, 10, 27.00, '2025-05-28 23:19:50', '2025-05-28 23:19:50'),
(363, 6, 15, 11, 32.00, '2025-05-28 23:19:50', '2025-05-28 23:19:50'),
(364, 5, 15, 9, 26.00, '2025-05-28 23:19:50', '2025-05-28 23:19:50'),
(365, 5, 15, 10, 27.00, '2025-05-28 23:19:50', '2025-05-28 23:19:50'),
(366, 5, 15, 11, 30.00, '2025-05-28 23:19:50', '2025-05-28 23:19:50'),
(367, 4, 15, 9, 25.00, '2025-05-28 23:19:51', '2025-05-28 23:19:51'),
(368, 4, 15, 10, 25.00, '2025-05-28 23:19:51', '2025-05-28 23:19:51'),
(369, 4, 15, 11, 25.00, '2025-05-28 23:19:51', '2025-05-28 23:19:51'),
(370, 2, 15, 9, 30.00, '2025-05-28 23:19:51', '2025-05-28 23:19:51'),
(371, 2, 15, 10, 26.00, '2025-05-28 23:19:51', '2025-05-28 23:19:51'),
(372, 2, 15, 11, 32.00, '2025-05-28 23:19:51', '2025-05-28 23:19:51'),
(373, 3, 15, 9, 27.00, '2025-05-28 23:19:51', '2025-05-28 23:19:51'),
(374, 3, 15, 10, 28.00, '2025-05-28 23:19:51', '2025-05-28 23:19:51'),
(375, 3, 15, 11, 27.00, '2025-05-28 23:19:51', '2025-05-28 23:19:51'),
(376, 5, 26, 13, 40.00, '2025-05-28 23:20:06', '2025-05-28 23:20:06'),
(377, 5, 26, 14, 42.00, '2025-05-28 23:20:06', '2025-05-28 23:20:06'),
(378, 3, 16, 9, 26.00, '2025-05-28 23:23:25', '2025-05-28 23:23:25'),
(379, 3, 16, 10, 26.00, '2025-05-28 23:23:25', '2025-05-28 23:23:25'),
(380, 3, 16, 11, 28.00, '2025-05-28 23:23:25', '2025-05-28 23:23:25'),
(381, 5, 16, 9, 32.00, '2025-05-28 23:23:41', '2025-05-28 23:23:41'),
(382, 5, 16, 10, 25.00, '2025-05-28 23:23:41', '2025-05-28 23:23:41'),
(383, 5, 16, 11, 28.00, '2025-05-28 23:23:41', '2025-05-28 23:23:41'),
(384, 3, 17, 9, 27.00, '2025-05-28 23:23:55', '2025-05-28 23:23:55'),
(385, 3, 17, 10, 27.00, '2025-05-28 23:23:55', '2025-05-28 23:23:55'),
(386, 3, 17, 11, 26.00, '2025-05-28 23:23:55', '2025-05-28 23:23:55'),
(387, 5, 17, 9, 27.00, '2025-05-28 23:25:33', '2025-05-28 23:25:33'),
(388, 5, 17, 10, 27.00, '2025-05-28 23:25:33', '2025-05-28 23:25:33'),
(389, 5, 17, 11, 29.00, '2025-05-28 23:25:33', '2025-05-28 23:25:33'),
(390, 5, 18, 9, 28.00, '2025-05-28 23:26:10', '2025-05-28 23:26:10'),
(391, 5, 18, 10, 28.00, '2025-05-28 23:26:10', '2025-05-28 23:26:10'),
(392, 5, 18, 11, 34.00, '2025-05-28 23:26:10', '2025-05-28 23:26:10'),
(393, 3, 18, 9, 27.00, '2025-05-28 23:26:39', '2025-05-28 23:26:39'),
(394, 3, 18, 10, 26.00, '2025-05-28 23:26:39', '2025-05-28 23:26:39'),
(395, 3, 18, 11, 27.00, '2025-05-28 23:26:39', '2025-05-28 23:26:39'),
(396, 6, 16, 9, 34.00, '2025-05-28 23:28:28', '2025-05-28 23:28:28'),
(397, 6, 16, 10, 26.00, '2025-05-28 23:28:28', '2025-05-28 23:28:28'),
(398, 6, 16, 11, 33.00, '2025-05-28 23:28:28', '2025-05-28 23:28:28'),
(399, 6, 17, 9, 33.00, '2025-05-28 23:28:38', '2025-05-28 23:28:38'),
(400, 6, 17, 10, 27.00, '2025-05-28 23:28:38', '2025-05-28 23:28:38'),
(401, 6, 17, 11, 33.00, '2025-05-28 23:28:38', '2025-05-28 23:28:38'),
(402, 6, 18, 9, 33.00, '2025-05-28 23:28:53', '2025-05-28 23:28:53'),
(403, 6, 18, 10, 27.00, '2025-05-28 23:28:53', '2025-05-28 23:28:53'),
(404, 6, 18, 11, 35.00, '2025-05-28 23:28:53', '2025-05-28 23:28:53'),
(405, 6, 19, 9, 35.00, '2025-05-28 23:29:07', '2025-05-28 23:29:07'),
(406, 6, 19, 10, 27.00, '2025-05-28 23:29:07', '2025-05-28 23:29:07'),
(407, 6, 19, 11, 32.00, '2025-05-28 23:29:07', '2025-05-28 23:29:07'),
(408, 3, 19, 9, 30.00, '2025-05-28 23:29:09', '2025-05-28 23:29:09'),
(409, 3, 19, 10, 30.00, '2025-05-28 23:29:09', '2025-05-28 23:29:09'),
(410, 3, 19, 11, 28.00, '2025-05-28 23:29:09', '2025-05-28 23:29:09'),
(411, 5, 19, 9, 35.00, '2025-05-28 23:29:59', '2025-05-28 23:29:59'),
(412, 5, 19, 10, 30.00, '2025-05-28 23:29:59', '2025-05-28 23:29:59'),
(413, 5, 19, 11, 35.00, '2025-05-28 23:29:59', '2025-05-28 23:29:59'),
(414, 3, 20, 9, 27.00, '2025-05-28 23:31:08', '2025-05-28 23:31:08'),
(415, 3, 20, 10, 28.00, '2025-05-28 23:31:08', '2025-05-28 23:31:08'),
(416, 3, 20, 11, 26.00, '2025-05-28 23:31:08', '2025-05-28 23:31:08'),
(417, 5, 20, 9, 31.00, '2025-05-28 23:31:15', '2025-05-28 23:31:15'),
(418, 5, 20, 10, 30.00, '2025-05-28 23:31:15', '2025-05-28 23:31:15'),
(419, 5, 20, 11, 33.00, '2025-05-28 23:31:15', '2025-05-28 23:31:15'),
(420, 3, 21, 9, 27.00, '2025-05-28 23:32:36', '2025-05-28 23:32:36'),
(421, 3, 21, 10, 27.00, '2025-05-28 23:32:36', '2025-05-28 23:32:36'),
(422, 3, 21, 11, 26.00, '2025-05-28 23:32:36', '2025-05-28 23:32:36'),
(423, 5, 21, 9, 29.00, '2025-05-28 23:33:32', '2025-05-28 23:33:32'),
(424, 5, 21, 10, 26.00, '2025-05-28 23:33:32', '2025-05-28 23:33:32'),
(425, 5, 21, 11, 29.00, '2025-05-28 23:33:32', '2025-05-28 23:33:32'),
(426, 3, 22, 9, 27.00, '2025-05-28 23:35:12', '2025-05-28 23:35:12'),
(427, 3, 22, 10, 27.00, '2025-05-28 23:35:12', '2025-05-28 23:35:12'),
(428, 3, 22, 11, 27.00, '2025-05-28 23:35:12', '2025-05-28 23:35:12'),
(429, 2, 16, 9, 30.00, '2025-05-28 23:35:49', '2025-05-28 23:35:49'),
(430, 2, 16, 10, 24.00, '2025-05-28 23:35:49', '2025-05-28 23:35:49'),
(431, 2, 16, 11, 30.00, '2025-05-28 23:35:49', '2025-05-28 23:35:49'),
(432, 5, 22, 9, 29.00, '2025-05-28 23:36:05', '2025-05-28 23:36:05'),
(433, 5, 22, 10, 26.00, '2025-05-28 23:36:05', '2025-05-28 23:36:05'),
(434, 5, 22, 11, 29.00, '2025-05-28 23:36:05', '2025-05-28 23:36:05'),
(435, 6, 20, 9, 35.00, '2025-05-28 23:36:06', '2025-05-28 23:36:06'),
(436, 6, 20, 10, 28.00, '2025-05-28 23:36:06', '2025-05-28 23:36:06'),
(437, 6, 20, 11, 32.00, '2025-05-28 23:36:06', '2025-05-28 23:36:06'),
(438, 2, 17, 9, 30.00, '2025-05-28 23:36:11', '2025-05-28 23:36:11'),
(439, 2, 17, 10, 24.00, '2025-05-28 23:36:11', '2025-05-28 23:36:11'),
(440, 2, 17, 11, 30.00, '2025-05-28 23:36:11', '2025-05-28 23:36:11'),
(441, 6, 21, 9, 33.00, '2025-05-28 23:36:20', '2025-05-28 23:36:20'),
(442, 6, 21, 10, 26.00, '2025-05-28 23:36:20', '2025-05-28 23:36:20'),
(443, 6, 21, 11, 32.00, '2025-05-28 23:36:20', '2025-05-28 23:36:20'),
(444, 2, 18, 9, 33.00, '2025-05-28 23:36:35', '2025-05-28 23:36:35'),
(445, 2, 18, 10, 28.00, '2025-05-28 23:36:35', '2025-05-28 23:36:35'),
(446, 2, 18, 11, 34.00, '2025-05-28 23:36:35', '2025-05-28 23:36:35'),
(447, 6, 22, 9, 33.00, '2025-05-28 23:36:40', '2025-05-28 23:36:40'),
(448, 6, 22, 10, 27.00, '2025-05-28 23:36:40', '2025-05-28 23:36:40'),
(449, 6, 22, 11, 32.00, '2025-05-28 23:36:40', '2025-05-28 23:36:40'),
(450, 2, 19, 9, 31.00, '2025-05-28 23:37:03', '2025-05-28 23:37:03'),
(451, 2, 19, 10, 28.00, '2025-05-28 23:37:03', '2025-05-28 23:37:03'),
(452, 2, 19, 11, 32.00, '2025-05-28 23:37:03', '2025-05-28 23:37:03'),
(453, 3, 23, 9, 28.00, '2025-05-28 23:37:30', '2025-05-28 23:37:30'),
(454, 3, 23, 10, 27.00, '2025-05-28 23:37:30', '2025-05-28 23:37:30'),
(455, 3, 23, 11, 28.00, '2025-05-28 23:37:30', '2025-05-28 23:37:30'),
(456, 6, 23, 9, 35.00, '2025-05-28 23:38:05', '2025-05-28 23:38:05'),
(457, 6, 23, 10, 28.00, '2025-05-28 23:38:05', '2025-05-28 23:38:05'),
(458, 6, 23, 11, 34.00, '2025-05-28 23:38:05', '2025-05-28 23:38:05'),
(459, 5, 23, 9, 35.00, '2025-05-28 23:38:52', '2025-05-28 23:38:52'),
(460, 5, 23, 10, 30.00, '2025-05-28 23:38:52', '2025-05-28 23:38:52'),
(461, 5, 23, 11, 35.00, '2025-05-28 23:38:52', '2025-05-28 23:38:52'),
(462, 3, 24, 9, 27.00, '2025-05-28 23:39:27', '2025-05-28 23:39:27'),
(463, 3, 24, 10, 26.00, '2025-05-28 23:39:27', '2025-05-28 23:39:27'),
(464, 3, 24, 11, 27.00, '2025-05-28 23:39:27', '2025-05-28 23:39:27'),
(465, 2, 20, 9, 32.00, '2025-05-28 23:39:47', '2025-05-28 23:39:47'),
(466, 2, 20, 10, 28.00, '2025-05-28 23:39:47', '2025-05-28 23:39:47'),
(467, 2, 20, 11, 32.00, '2025-05-28 23:39:47', '2025-05-28 23:39:47'),
(468, 6, 24, 9, 33.00, '2025-05-28 23:40:07', '2025-05-28 23:40:07'),
(469, 6, 24, 10, 25.00, '2025-05-28 23:40:07', '2025-05-28 23:40:07'),
(470, 6, 24, 11, 32.00, '2025-05-28 23:40:07', '2025-05-28 23:40:07'),
(471, 2, 21, 9, 30.00, '2025-05-28 23:40:10', '2025-05-28 23:40:10'),
(472, 2, 21, 10, 26.00, '2025-05-28 23:40:10', '2025-05-28 23:40:10'),
(473, 2, 21, 11, 30.00, '2025-05-28 23:40:10', '2025-05-28 23:40:10'),
(474, 2, 22, 9, 30.00, '2025-05-28 23:41:33', '2025-05-28 23:41:33'),
(475, 2, 22, 10, 26.00, '2025-05-28 23:41:33', '2025-05-28 23:41:33'),
(476, 2, 22, 11, 31.00, '2025-05-28 23:41:33', '2025-05-28 23:41:33'),
(477, 5, 24, 9, 29.00, '2025-05-28 23:41:41', '2025-05-28 23:41:41'),
(478, 5, 24, 10, 26.00, '2025-05-28 23:41:41', '2025-05-28 23:41:41'),
(479, 5, 24, 11, 29.00, '2025-05-28 23:41:41', '2025-05-28 23:41:41'),
(480, 2, 23, 9, 32.00, '2025-05-28 23:42:00', '2025-05-28 23:42:00'),
(481, 2, 23, 10, 27.00, '2025-05-28 23:42:00', '2025-05-28 23:42:00'),
(482, 2, 23, 11, 33.00, '2025-05-28 23:42:00', '2025-05-28 23:42:00'),
(483, 3, 25, 9, 28.00, '2025-05-28 23:42:02', '2025-05-28 23:42:02'),
(484, 3, 25, 10, 28.00, '2025-05-28 23:42:02', '2025-05-28 23:42:02'),
(485, 3, 25, 11, 27.00, '2025-05-28 23:42:02', '2025-05-28 23:42:02'),
(486, 6, 25, 9, 34.00, '2025-05-28 23:42:09', '2025-05-28 23:42:09'),
(487, 6, 25, 10, 27.00, '2025-05-28 23:42:09', '2025-05-28 23:42:09'),
(488, 6, 25, 11, 34.00, '2025-05-28 23:42:09', '2025-05-28 23:42:09'),
(489, 5, 25, 9, 32.00, '2025-05-28 23:42:16', '2025-05-28 23:42:16'),
(490, 5, 25, 10, 30.00, '2025-05-28 23:42:16', '2025-05-28 23:42:16'),
(491, 5, 25, 11, 34.00, '2025-05-28 23:42:16', '2025-05-28 23:42:16'),
(492, 3, 65, 9, 27.00, '2025-05-28 23:43:09', '2025-05-28 23:43:09'),
(493, 3, 65, 10, 28.00, '2025-05-28 23:43:09', '2025-05-28 23:43:09'),
(494, 3, 65, 11, 27.00, '2025-05-28 23:43:09', '2025-05-28 23:43:09'),
(495, 2, 24, 9, 30.00, '2025-05-28 23:43:19', '2025-05-28 23:43:19'),
(496, 2, 24, 10, 26.00, '2025-05-28 23:43:19', '2025-05-28 23:43:19'),
(497, 2, 24, 11, 30.00, '2025-05-28 23:43:19', '2025-05-28 23:43:19'),
(498, 6, 65, 9, 33.00, '2025-05-28 23:43:37', '2025-05-28 23:43:37'),
(499, 6, 65, 10, 26.00, '2025-05-28 23:43:37', '2025-05-28 23:43:37'),
(500, 6, 65, 11, 35.00, '2025-05-28 23:43:37', '2025-05-28 23:43:37'),
(501, 2, 25, 9, 30.00, '2025-05-28 23:43:47', '2025-05-28 23:43:47'),
(502, 2, 25, 10, 28.00, '2025-05-28 23:43:47', '2025-05-28 23:43:47'),
(503, 2, 25, 11, 32.00, '2025-05-28 23:43:47', '2025-05-28 23:43:47'),
(504, 5, 65, 9, 35.00, '2025-05-28 23:44:49', '2025-05-28 23:44:49'),
(505, 5, 65, 10, 30.00, '2025-05-28 23:44:49', '2025-05-28 23:44:49'),
(506, 5, 65, 11, 35.00, '2025-05-28 23:44:49', '2025-05-28 23:44:49'),
(507, 2, 65, 9, 31.00, '2025-05-28 23:45:19', '2025-05-28 23:45:19'),
(508, 2, 65, 10, 27.00, '2025-05-28 23:45:19', '2025-05-28 23:45:19'),
(509, 2, 65, 11, 32.00, '2025-05-28 23:45:19', '2025-05-28 23:45:19'),
(510, 4, 16, 9, 28.00, '2025-05-28 23:45:54', '2025-05-28 23:45:54'),
(511, 4, 16, 10, 25.00, '2025-05-28 23:45:54', '2025-05-28 23:45:54'),
(512, 4, 16, 11, 28.00, '2025-05-28 23:45:54', '2025-05-28 23:45:54'),
(513, 4, 17, 9, 28.00, '2025-05-28 23:46:09', '2025-05-28 23:46:09'),
(514, 4, 17, 10, 28.00, '2025-05-28 23:46:09', '2025-05-28 23:46:09'),
(515, 4, 17, 11, 28.00, '2025-05-28 23:46:09', '2025-05-28 23:46:09'),
(516, 4, 18, 9, 33.00, '2025-05-28 23:46:23', '2025-05-28 23:46:23'),
(517, 4, 18, 10, 30.00, '2025-05-28 23:46:23', '2025-05-28 23:46:23'),
(518, 4, 18, 11, 35.00, '2025-05-28 23:46:23', '2025-05-28 23:46:23'),
(519, 4, 19, 9, 35.00, '2025-05-28 23:46:36', '2025-05-28 23:46:36'),
(520, 4, 19, 10, 30.00, '2025-05-28 23:46:36', '2025-05-28 23:46:36'),
(521, 4, 19, 11, 35.00, '2025-05-28 23:46:36', '2025-05-28 23:46:36'),
(522, 4, 20, 9, 35.00, '2025-05-28 23:46:52', '2025-05-28 23:46:52'),
(523, 4, 20, 10, 30.00, '2025-05-28 23:46:52', '2025-05-28 23:46:52'),
(524, 4, 20, 11, 35.00, '2025-05-28 23:46:52', '2025-05-28 23:46:52'),
(525, 4, 21, 9, 35.00, '2025-05-28 23:47:01', '2025-05-28 23:47:01'),
(526, 4, 21, 10, 30.00, '2025-05-28 23:47:01', '2025-05-28 23:47:01'),
(527, 4, 21, 11, 28.00, '2025-05-28 23:47:01', '2025-05-28 23:47:01'),
(528, 4, 22, 9, 30.00, '2025-05-28 23:47:14', '2025-05-28 23:47:14'),
(529, 4, 22, 10, 28.00, '2025-05-28 23:47:14', '2025-05-28 23:47:14'),
(530, 4, 22, 11, 30.00, '2025-05-28 23:47:14', '2025-05-28 23:47:14'),
(531, 4, 23, 9, 30.00, '2025-05-28 23:47:28', '2025-05-28 23:47:28'),
(532, 4, 23, 10, 30.00, '2025-05-28 23:47:28', '2025-05-28 23:47:28'),
(533, 4, 23, 11, 35.00, '2025-05-28 23:47:28', '2025-05-28 23:47:28'),
(534, 4, 24, 9, 30.00, '2025-05-28 23:48:32', '2025-05-28 23:48:32'),
(535, 4, 24, 10, 30.00, '2025-05-28 23:48:32', '2025-05-28 23:48:32'),
(536, 4, 24, 11, 35.00, '2025-05-28 23:48:32', '2025-05-28 23:48:32'),
(537, 4, 25, 9, 35.00, '2025-05-28 23:48:46', '2025-05-28 23:48:46'),
(538, 4, 25, 10, 30.00, '2025-05-28 23:48:46', '2025-05-28 23:48:46'),
(539, 4, 25, 11, 30.00, '2025-05-28 23:48:46', '2025-05-28 23:48:46'),
(540, 4, 65, 9, 35.00, '2025-05-28 23:49:00', '2025-05-28 23:49:00'),
(541, 4, 65, 10, 30.00, '2025-05-28 23:49:00', '2025-05-28 23:49:00'),
(542, 4, 65, 11, 35.00, '2025-05-28 23:49:00', '2025-05-28 23:49:00'),
(543, 4, 26, 13, 35.00, '2025-05-28 23:51:45', '2025-05-28 23:51:45'),
(544, 4, 26, 14, 45.00, '2025-05-28 23:51:45', '2025-05-28 23:51:45'),
(545, 6, 26, 13, 44.00, '2025-05-28 23:52:21', '2025-05-28 23:52:21'),
(546, 6, 26, 14, 45.00, '2025-05-28 23:52:21', '2025-05-28 23:52:21'),
(547, 2, 26, 13, 42.00, '2025-05-28 23:52:40', '2025-05-28 23:52:40'),
(548, 2, 26, 14, 44.00, '2025-05-28 23:52:40', '2025-05-28 23:52:40'),
(549, 3, 26, 13, 40.00, '2025-05-28 23:53:33', '2025-05-28 23:53:33'),
(550, 3, 26, 14, 40.00, '2025-05-28 23:53:33', '2025-05-28 23:53:33'),
(551, 3, 27, 13, 40.00, '2025-05-28 23:56:55', '2025-05-28 23:56:55'),
(552, 3, 27, 14, 35.00, '2025-05-28 23:56:55', '2025-05-28 23:56:55'),
(553, 2, 27, 13, 42.00, '2025-05-28 23:57:15', '2025-05-28 23:57:15'),
(554, 2, 27, 14, 42.00, '2025-05-28 23:57:15', '2025-05-28 23:57:15'),
(555, 5, 27, 13, 40.00, '2025-05-28 23:57:53', '2025-05-28 23:57:53'),
(556, 5, 27, 14, 40.00, '2025-05-28 23:57:53', '2025-05-28 23:57:53'),
(557, 3, 28, 13, 40.00, '2025-05-28 23:58:40', '2025-05-28 23:58:40'),
(558, 3, 28, 14, 40.00, '2025-05-28 23:58:40', '2025-05-28 23:58:40'),
(559, 2, 28, 13, 42.00, '2025-05-28 23:58:42', '2025-05-28 23:58:42'),
(560, 2, 28, 14, 45.00, '2025-05-28 23:58:42', '2025-05-28 23:58:42'),
(561, 6, 28, 13, 45.00, '2025-05-28 23:59:45', '2025-05-28 23:59:45'),
(562, 6, 28, 14, 45.00, '2025-05-28 23:59:45', '2025-05-28 23:59:45'),
(563, 3, 29, 13, 40.00, '2025-05-29 00:00:21', '2025-05-29 00:00:21'),
(564, 3, 29, 14, 45.00, '2025-05-29 00:00:21', '2025-05-29 00:00:21'),
(565, 5, 28, 13, 40.00, '2025-05-29 00:00:29', '2025-05-29 00:00:29'),
(566, 5, 28, 14, 43.00, '2025-05-29 00:00:29', '2025-05-29 00:00:29'),
(567, 5, 30, 13, 50.00, '2025-05-29 00:00:52', '2025-05-29 00:00:52'),
(568, 5, 30, 14, 48.00, '2025-05-29 00:00:52', '2025-05-29 00:00:52'),
(569, 5, 29, 13, 40.00, '2025-05-29 00:00:57', '2025-05-29 00:00:57'),
(570, 5, 29, 14, 41.00, '2025-05-29 00:00:57', '2025-05-29 00:00:57'),
(571, 2, 29, 13, 45.00, '2025-05-29 00:01:07', '2025-05-29 00:01:07'),
(572, 2, 29, 14, 46.00, '2025-05-29 00:01:07', '2025-05-29 00:01:07'),
(573, 3, 30, 13, 50.00, '2025-05-29 00:01:22', '2025-05-29 00:01:22'),
(574, 3, 30, 14, 50.00, '2025-05-29 00:01:22', '2025-05-29 00:01:22'),
(575, 2, 30, 13, 46.00, '2025-05-29 00:02:10', '2025-05-29 00:02:10'),
(576, 2, 30, 14, 47.00, '2025-05-29 00:02:10', '2025-05-29 00:02:10'),
(577, 3, 31, 13, 45.00, '2025-05-29 00:02:48', '2025-05-29 00:02:48'),
(578, 3, 31, 14, 40.00, '2025-05-29 00:02:48', '2025-05-29 00:02:48'),
(579, 2, 31, 13, 46.00, '2025-05-29 00:03:21', '2025-05-29 00:03:21'),
(580, 2, 31, 14, 46.00, '2025-05-29 00:03:21', '2025-05-29 00:03:21'),
(581, 5, 31, 13, 48.00, '2025-05-29 00:03:31', '2025-05-29 00:03:31'),
(582, 5, 31, 14, 42.00, '2025-05-29 00:03:31', '2025-05-29 00:03:31'),
(583, 3, 32, 13, 40.00, '2025-05-29 00:04:39', '2025-05-29 00:04:39'),
(584, 3, 32, 14, 35.00, '2025-05-29 00:04:39', '2025-05-29 00:04:39'),
(585, 5, 32, 13, 40.00, '2025-05-29 00:05:18', '2025-05-29 00:05:18'),
(586, 5, 32, 14, 41.00, '2025-05-29 00:05:18', '2025-05-29 00:05:18'),
(587, 6, 27, 13, 46.00, '2025-05-29 00:05:22', '2025-05-29 00:05:22'),
(588, 6, 27, 14, 44.00, '2025-05-29 00:05:22', '2025-05-29 00:05:22'),
(589, 2, 32, 13, 43.00, '2025-05-29 00:05:26', '2025-05-29 00:05:26'),
(590, 2, 32, 14, 40.00, '2025-05-29 00:05:26', '2025-05-29 00:05:26'),
(591, 5, 33, 13, 40.00, '2025-05-29 00:06:34', '2025-05-29 00:06:34'),
(592, 5, 33, 14, 40.00, '2025-05-29 00:06:34', '2025-05-29 00:06:34'),
(593, 3, 33, 13, 40.00, '2025-05-29 00:06:36', '2025-05-29 00:06:36'),
(594, 3, 33, 14, 35.00, '2025-05-29 00:06:36', '2025-05-29 00:06:36'),
(595, 2, 33, 13, 42.00, '2025-05-29 00:06:37', '2025-05-29 00:06:37'),
(596, 2, 33, 14, 41.00, '2025-05-29 00:06:37', '2025-05-29 00:06:37'),
(597, 5, 34, 13, 50.00, '2025-05-29 00:07:42', '2025-05-29 00:07:42'),
(598, 5, 34, 14, 48.00, '2025-05-29 00:07:42', '2025-05-29 00:07:42'),
(599, 2, 34, 13, 46.00, '2025-05-29 00:07:42', '2025-05-29 00:07:42'),
(600, 2, 34, 14, 47.00, '2025-05-29 00:07:42', '2025-05-29 00:07:42'),
(601, 3, 34, 13, 45.00, '2025-05-29 00:07:58', '2025-05-29 00:07:58'),
(602, 3, 34, 14, 45.00, '2025-05-29 00:07:58', '2025-05-29 00:07:58'),
(603, 6, 29, 13, 45.00, '2025-05-29 00:09:20', '2025-05-29 00:09:20'),
(604, 6, 29, 14, 46.00, '2025-05-29 00:09:20', '2025-05-29 00:09:20'),
(605, 6, 30, 13, 49.00, '2025-05-29 00:09:29', '2025-05-29 00:09:29'),
(606, 6, 30, 14, 47.00, '2025-05-29 00:09:29', '2025-05-29 00:09:29'),
(607, 3, 35, 13, 40.00, '2025-05-29 00:09:33', '2025-05-29 00:09:33'),
(608, 3, 35, 14, 40.00, '2025-05-29 00:09:33', '2025-05-29 00:09:33'),
(609, 6, 31, 13, 49.00, '2025-05-29 00:09:43', '2025-05-29 00:09:43'),
(610, 6, 31, 14, 49.00, '2025-05-29 00:09:43', '2025-05-29 00:09:43'),
(611, 6, 32, 13, 44.00, '2025-05-29 00:09:53', '2025-05-29 00:09:53'),
(612, 6, 32, 14, 44.00, '2025-05-29 00:09:53', '2025-05-29 00:09:53'),
(613, 2, 35, 13, 43.00, '2025-05-29 00:09:53', '2025-05-29 00:09:53'),
(614, 2, 35, 14, 42.00, '2025-05-29 00:09:53', '2025-05-29 00:09:53'),
(615, 6, 33, 13, 44.00, '2025-05-29 00:10:02', '2025-05-29 00:10:02'),
(616, 6, 33, 14, 44.00, '2025-05-29 00:10:02', '2025-05-29 00:10:02'),
(617, 6, 34, 13, 50.00, '2025-05-29 00:10:14', '2025-05-29 00:10:14'),
(618, 6, 34, 14, 50.00, '2025-05-29 00:10:14', '2025-05-29 00:10:14'),
(619, 5, 35, 13, 40.00, '2025-05-29 00:10:16', '2025-05-29 00:10:16'),
(620, 5, 35, 14, 43.00, '2025-05-29 00:10:16', '2025-05-29 00:10:16'),
(621, 6, 35, 13, 47.00, '2025-05-29 00:10:22', '2025-05-29 00:10:22'),
(622, 6, 35, 14, 45.00, '2025-05-29 00:10:22', '2025-05-29 00:10:22'),
(623, 3, 36, 13, 40.00, '2025-05-29 00:10:32', '2025-05-29 00:10:32'),
(624, 3, 36, 14, 40.00, '2025-05-29 00:10:32', '2025-05-29 00:10:32'),
(625, 2, 36, 13, 42.00, '2025-05-29 00:10:36', '2025-05-29 00:10:36'),
(626, 2, 36, 14, 50.00, '2025-05-29 00:10:36', '2025-05-29 00:10:36'),
(627, 5, 36, 13, 48.00, '2025-05-29 00:10:41', '2025-05-29 00:10:41'),
(628, 5, 36, 14, 50.00, '2025-05-29 00:10:41', '2025-05-29 00:10:41'),
(629, 6, 36, 13, 47.00, '2025-05-29 00:10:41', '2025-05-29 00:10:41'),
(630, 6, 36, 14, 50.00, '2025-05-29 00:10:41', '2025-05-29 00:10:41'),
(631, 3, 66, 13, 40.00, '2025-05-29 00:11:55', '2025-05-29 00:11:55'),
(632, 3, 66, 14, 45.00, '2025-05-29 00:11:55', '2025-05-29 00:11:55'),
(633, 6, 66, 13, 47.00, '2025-05-29 00:11:58', '2025-05-29 00:11:58'),
(634, 6, 66, 14, 48.00, '2025-05-29 00:11:58', '2025-05-29 00:11:58'),
(635, 2, 66, 13, 44.00, '2025-05-29 00:12:08', '2025-05-29 00:12:08'),
(636, 2, 66, 14, 50.00, '2025-05-29 00:12:08', '2025-05-29 00:12:08'),
(637, 5, 66, 13, 47.00, '2025-05-29 00:12:13', '2025-05-29 00:12:13'),
(638, 5, 66, 14, 50.00, '2025-05-29 00:12:13', '2025-05-29 00:12:13'),
(639, 4, 27, 13, 35.00, '2025-05-29 00:13:25', '2025-05-29 00:13:25'),
(640, 4, 27, 14, 40.00, '2025-05-29 00:13:25', '2025-05-29 00:13:25'),
(641, 4, 28, 13, 45.00, '2025-05-29 00:13:34', '2025-05-29 00:13:34'),
(642, 4, 28, 14, 50.00, '2025-05-29 00:13:34', '2025-05-29 00:13:34'),
(643, 4, 29, 13, 50.00, '2025-05-29 00:13:42', '2025-05-29 00:13:42'),
(644, 4, 29, 14, 50.00, '2025-05-29 00:13:42', '2025-05-29 00:13:42'),
(645, 4, 30, 13, 50.00, '2025-05-29 00:13:52', '2025-05-29 00:13:52'),
(646, 4, 30, 14, 50.00, '2025-05-29 00:13:52', '2025-05-29 00:13:52'),
(647, 4, 31, 13, 50.00, '2025-05-29 00:14:00', '2025-05-29 00:14:00'),
(648, 4, 31, 14, 50.00, '2025-05-29 00:14:00', '2025-05-29 00:14:00'),
(649, 4, 32, 13, 35.00, '2025-05-29 00:14:07', '2025-05-29 00:14:07'),
(650, 4, 32, 14, 35.00, '2025-05-29 00:14:07', '2025-05-29 00:14:07'),
(651, 4, 33, 13, 35.00, '2025-05-29 00:14:14', '2025-05-29 00:14:14'),
(652, 4, 33, 14, 35.00, '2025-05-29 00:14:14', '2025-05-29 00:14:14'),
(653, 4, 34, 13, 50.00, '2025-05-29 00:14:25', '2025-05-29 00:14:25'),
(654, 4, 34, 14, 50.00, '2025-05-29 00:14:25', '2025-05-29 00:14:25'),
(655, 4, 35, 13, 45.00, '2025-05-29 00:14:32', '2025-05-29 00:14:32'),
(656, 4, 35, 14, 45.00, '2025-05-29 00:14:32', '2025-05-29 00:14:32'),
(657, 4, 36, 13, 50.00, '2025-05-29 00:14:43', '2025-05-29 00:14:43'),
(658, 4, 36, 14, 50.00, '2025-05-29 00:14:43', '2025-05-29 00:14:43'),
(659, 4, 66, 13, 50.00, '2025-05-29 00:14:50', '2025-05-29 00:14:50'),
(660, 4, 66, 14, 50.00, '2025-05-29 00:14:50', '2025-05-29 00:14:50'),
(661, 5, 98, 20, 50.00, '2025-05-29 00:49:22', '2025-05-29 00:49:22'),
(662, 5, 98, 21, 49.00, '2025-05-29 00:49:22', '2025-05-29 00:49:22'),
(663, 4, 98, 20, 50.00, '2025-05-29 00:49:22', '2025-05-29 00:49:22'),
(664, 4, 98, 21, 50.00, '2025-05-29 00:49:22', '2025-05-29 00:49:22'),
(665, 2, 98, 20, 48.00, '2025-05-29 00:49:30', '2025-05-29 00:49:30'),
(666, 2, 98, 21, 50.00, '2025-05-29 00:49:30', '2025-05-29 00:49:30'),
(667, 6, 98, 20, 49.00, '2025-05-29 00:49:34', '2025-05-29 00:49:34'),
(668, 6, 98, 21, 47.00, '2025-05-29 00:49:34', '2025-05-29 00:49:34'),
(669, 3, 98, 20, 50.00, '2025-05-29 00:49:38', '2025-05-29 00:49:38'),
(670, 3, 98, 21, 50.00, '2025-05-29 00:49:38', '2025-05-29 00:49:38'),
(671, 3, 99, 20, 48.00, '2025-05-29 00:54:21', '2025-05-29 00:54:21'),
(672, 3, 99, 21, 44.00, '2025-05-29 00:54:21', '2025-05-29 00:54:21'),
(673, 2, 99, 20, 46.00, '2025-05-29 00:55:19', '2025-05-29 00:55:19'),
(674, 2, 99, 21, 45.00, '2025-05-29 00:55:19', '2025-05-29 00:55:19'),
(675, 5, 100, 20, 45.00, '2025-05-29 00:55:57', '2025-05-29 00:55:57'),
(676, 5, 100, 21, 40.00, '2025-05-29 00:55:57', '2025-05-29 00:55:57'),
(677, 5, 102, 20, 48.00, '2025-05-29 00:55:59', '2025-05-29 00:55:59'),
(678, 5, 102, 21, 46.00, '2025-05-29 00:55:59', '2025-05-29 00:55:59'),
(679, 2, 102, 20, 42.00, '2025-05-29 00:56:04', '2025-05-29 00:56:04'),
(680, 2, 102, 21, 48.00, '2025-05-29 00:56:04', '2025-05-29 00:56:04'),
(681, 3, 102, 20, 48.00, '2025-05-29 00:56:12', '2025-05-29 00:56:12'),
(682, 3, 102, 21, 47.00, '2025-05-29 00:56:12', '2025-05-29 00:56:12'),
(683, 4, 102, 20, 50.00, '2025-05-29 00:57:43', '2025-05-29 00:57:43'),
(684, 4, 102, 21, 45.00, '2025-05-29 00:57:43', '2025-05-29 00:57:43'),
(685, 5, 101, 20, 47.00, '2025-05-29 00:59:02', '2025-05-29 00:59:02'),
(686, 5, 101, 21, 40.00, '2025-05-29 00:59:02', '2025-05-29 00:59:02'),
(687, 5, 99, 20, 50.00, '2025-05-29 00:59:03', '2025-05-29 00:59:03'),
(688, 5, 99, 21, 48.00, '2025-05-29 00:59:03', '2025-05-29 00:59:03'),
(689, 6, 102, 20, 48.00, '2025-05-29 00:59:19', '2025-05-29 00:59:19'),
(690, 6, 102, 21, 47.00, '2025-05-29 00:59:19', '2025-05-29 00:59:19'),
(691, 4, 99, 20, 50.00, '2025-05-29 00:59:20', '2025-05-29 00:59:20'),
(692, 4, 99, 21, 40.00, '2025-05-29 00:59:20', '2025-05-29 00:59:20'),
(693, 6, 99, 20, 46.00, '2025-05-29 00:59:38', '2025-05-29 00:59:38'),
(694, 6, 99, 21, 45.00, '2025-05-29 00:59:38', '2025-05-29 00:59:38'),
(695, 3, 101, 20, 48.00, '2025-05-29 01:01:18', '2025-05-29 01:01:18'),
(696, 3, 101, 21, 46.00, '2025-05-29 01:01:18', '2025-05-29 01:01:18'),
(697, 6, 100, 20, 47.00, '2025-05-29 01:01:41', '2025-05-29 01:01:41'),
(698, 6, 100, 21, 47.00, '2025-05-29 01:01:41', '2025-05-29 01:01:41'),
(699, 3, 100, 20, 48.00, '2025-05-29 01:01:52', '2025-05-29 01:01:52'),
(700, 3, 100, 21, 48.00, '2025-05-29 01:01:52', '2025-05-29 01:01:52'),
(701, 2, 101, 20, 42.00, '2025-05-29 01:02:24', '2025-05-29 01:02:24'),
(702, 2, 101, 21, 40.00, '2025-05-29 01:02:24', '2025-05-29 01:02:24'),
(703, 4, 101, 20, 50.00, '2025-05-29 01:03:16', '2025-05-29 01:03:16'),
(704, 4, 101, 21, 45.00, '2025-05-29 01:03:16', '2025-05-29 01:03:16'),
(705, 6, 101, 20, 46.00, '2025-05-29 01:03:27', '2025-05-29 01:03:27'),
(706, 6, 101, 21, 45.00, '2025-05-29 01:03:27', '2025-05-29 01:03:27'),
(707, 2, 100, 20, 44.00, '2025-05-29 01:04:52', '2025-05-29 01:04:52'),
(708, 2, 100, 21, 50.00, '2025-05-29 01:04:52', '2025-05-29 01:04:52'),
(709, 4, 100, 20, 50.00, '2025-05-29 01:04:55', '2025-05-29 01:04:55'),
(710, 4, 100, 21, 50.00, '2025-05-29 01:04:55', '2025-05-29 01:04:55');

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

--
-- Dumping data for table `scores_adjustments`
--

INSERT INTO `scores_adjustments` (`id`, `portion_contestant_id`, `points`, `date_created`, `last_modified`) VALUES
(1, 102, 0.00, '2025-05-29 01:17:50', '2025-05-29 01:17:50'),
(2, 100, 1.00, '2025-05-29 01:17:50', '2025-05-29 01:17:50');

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
(1, 'Bb. San Juan 2025', 'San Juan Multi-Purpose Center', '2025-05-28', 1, 2, 1, NULL, '2023-11-29 10:51:32', '2025-05-28 08:16:54');

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
(2, 1, 'Dr. Ramon B.', 'Torres', 'Male', 'ramon', 'judge', 2, NULL, 0, '2023-11-29 10:52:36', '2023-11-29 10:52:36'),
(3, 1, 'Ms. Sharlote', 'Tuibeo-Ang', 'Female', 'sharlote', 'judge', 2, NULL, 0, '2023-11-29 10:53:21', '2023-11-29 10:53:21'),
(4, 1, 'Ms. Maribel G.', 'Baladjay', 'Female', 'maribel', 'judge', 2, NULL, 0, '2023-11-29 10:53:55', '2023-11-29 10:53:55'),
(5, 1, 'Mr. Mark James L.', 'Valdez', 'Male', 'mark', 'judge', 2, NULL, 0, '2023-11-29 10:54:40', '2023-11-29 10:54:40'),
(6, 1, 'Ms. Jacynthe Zena', 'Castillo', 'Female', 'zena', 'judge', 2, NULL, 0, '2023-11-29 10:54:56', '2023-11-29 10:54:56'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `portions`
--
ALTER TABLE `portions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `portions_contestants`
--
ALTER TABLE `portions_contestants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `portions_judges`
--
ALTER TABLE `portions_judges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `portions_judges_confirmation`
--
ALTER TABLE `portions_judges_confirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `portions_places`
--
ALTER TABLE `portions_places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `portions_toggles`
--
ALTER TABLE `portions_toggles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=711;

--
-- AUTO_INCREMENT for table `scores_adjustments`
--
ALTER TABLE `scores_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
