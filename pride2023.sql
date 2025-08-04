-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2023 at 02:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pride`
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
(1, 1, 1, 'Kevin Dee', 'Aringay', NULL, 1, '2023-11-27 19:26:53', '2023-11-27 19:26:53'),
(2, 1, 2, 'Elai Labinghisa', 'Bacnotan', NULL, 1, '2023-11-27 19:31:05', '2023-11-27 19:31:05'),
(3, 1, 3, 'Ella Acosta', 'Balaoan', NULL, 1, '2023-11-27 19:32:06', '2023-11-27 19:32:06'),
(4, 1, 4, 'Rhoda Leonen', 'Bangar', NULL, 1, '2023-11-27 19:32:55', '2023-11-27 19:32:55'),
(5, 1, 5, 'Jomhari', 'Cabola', NULL, 1, '2023-11-27 19:33:42', '2023-11-27 19:33:42'),
(6, 1, 6, 'Ac Castle', 'Luna', NULL, 1, '2023-11-27 19:34:39', '2023-11-27 19:34:39'),
(7, 1, 7, 'Ava Florendo', 'Naguilian', NULL, 1, '2023-11-27 19:36:28', '2023-11-27 19:36:28'),
(8, 1, 8, 'Mj Puruganan', 'San Fernando City', NULL, 1, '2023-11-27 19:37:46', '2023-11-27 19:37:46'),
(9, 1, 9, 'Jebsen Dacumos', 'San Gabriel', NULL, 1, '2023-11-27 19:38:55', '2023-11-27 19:38:55'),
(10, 1, 10, 'Felix Dacumos', 'San Juan', NULL, 1, '2023-11-27 19:39:42', '2023-11-27 19:39:42'),
(11, 1, 11, 'Kyra Isabelle Antonio', 'Santol', NULL, 1, '2023-11-27 19:40:36', '2023-11-27 19:40:36'),
(12, 1, 12, 'Mj Sibayan', 'Sudipen', NULL, 1, '2023-11-27 19:43:26', '2023-11-27 19:43:26');

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
(1, 1, 'Poise & Carriage', 20, 0.00, NULL, '2023-11-27 19:51:43', '2023-11-27 19:51:43'),
(2, 1, 'Creativity & Authenticity', 40, 0.00, NULL, '2023-11-27 19:51:43', '2023-11-27 19:51:43'),
(3, 1, 'Beauty & Fitness of the attire', 20, 0.00, NULL, '2023-11-27 19:51:43', '2023-11-27 19:51:43'),
(4, 1, 'Stage Presence', 20, 0.00, NULL, '2023-11-27 19:51:43', '2023-11-27 19:51:43'),
(5, 2, 'Entertainment Value', 30, 0.00, NULL, '2023-11-27 20:01:14', '2023-11-27 20:01:14'),
(6, 2, 'Mastery', 30, 0.00, NULL, '2023-11-27 20:01:14', '2023-11-27 20:01:14'),
(7, 2, 'Degree of Difficulty', 20, 0.00, NULL, '2023-11-27 20:01:14', '2023-11-27 20:01:14'),
(8, 2, 'Stage Presence', 20, 0.00, NULL, '2023-11-27 20:01:14', '2023-11-27 20:01:14'),
(9, 3, 'Beauty and Appeal', 30, 0.00, NULL, '2023-11-27 20:04:24', '2023-11-27 20:04:24'),
(10, 3, 'Poise and Carriage', 30, 0.00, NULL, '2023-11-27 20:04:24', '2023-11-27 20:04:24'),
(11, 3, 'Charm', 20, 0.00, NULL, '2023-11-27 20:04:24', '2023-11-27 20:04:24'),
(12, 3, 'Stage Presence', 20, 0.00, NULL, '2023-11-27 20:04:24', '2023-11-27 20:04:24'),
(13, 4, 'Beauty and Appeal', 30, 0.00, NULL, '2023-11-27 20:08:34', '2023-11-27 20:08:34'),
(14, 4, 'Poise and Carriage', 30, 0.00, NULL, '2023-11-27 20:08:34', '2023-11-27 20:08:34'),
(15, 4, 'Charm', 20, 0.00, NULL, '2023-11-27 20:08:34', '2023-11-27 20:08:34'),
(16, 4, 'Stage Presence', 20, 0.00, NULL, '2023-11-27 20:08:34', '2023-11-27 20:08:34'),
(17, 5, 'Ability to Express Self', 30, 0.00, NULL, '2023-11-27 20:15:26', '2023-11-27 20:15:26'),
(18, 5, 'Posture', 30, 0.00, NULL, '2023-11-27 20:15:26', '2023-11-27 20:15:26'),
(19, 5, 'Content of Answer', 40, 0.00, NULL, '2023-11-27 20:15:26', '2023-11-27 20:15:26'),
(20, 6, 'Creative Costume', 25, 0.00, 1, '2023-11-27 20:16:51', '2023-11-27 20:16:51'),
(21, 6, 'Swimsuit', 25, 0.00, 3, '2023-11-27 20:16:51', '2023-11-27 20:16:51'),
(22, 6, 'Evening Gown', 25, 0.00, 4, '2023-11-27 20:16:51', '2023-11-27 20:16:51'),
(23, 6, 'Question & Answer', 25, 0.00, 5, '2023-11-27 20:16:51', '2023-11-27 20:16:51'),
(24, 7, 'Body Proportion', 25, 0.00, NULL, '2023-11-27 20:30:02', '2023-11-27 20:30:02'),
(25, 7, 'Beauty of Face', 25, 0.00, NULL, '2023-11-27 20:30:02', '2023-11-27 20:30:02'),
(26, 7, 'Poise & Personality', 25, 0.00, NULL, '2023-11-27 20:30:02', '2023-11-27 20:30:02'),
(27, 7, 'Intelligence', 25, 0.00, NULL, '2023-11-27 20:30:02', '2023-11-27 20:30:02');

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
(1, 1, 'BEST IN CREATIVE COSTUME', 1, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 1, 1, 1, 2, '2023-11-27 19:51:43', '2023-11-27 20:43:48'),
(2, 1, 'BEST IN TALENT', 1, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-27 20:01:14', '2023-11-27 20:01:14'),
(3, 1, 'BEST IN SWIMSUIT', 1, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-27 20:04:24', '2023-11-27 20:04:24'),
(4, 1, 'BEST IN EVENING GOWN', 1, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-27 20:08:34', '2023-11-27 20:08:34'),
(5, 1, 'Q&A for Selection of Top 5', 1, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-27 20:15:26', '2023-11-27 20:15:26'),
(6, 1, 'Selection of Top Five Finalist', 5, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-27 20:16:51', '2023-11-27 20:16:51'),
(7, 1, 'Final Judging', 5, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 1, 0, 1, 2, '2023-11-27 20:30:02', '2023-11-27 20:30:02');

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
(1, 1, 6, '2023-11-27 19:51:43', '2023-11-27 19:51:43'),
(2, 1, 5, '2023-11-27 19:51:43', '2023-11-27 19:51:43'),
(3, 1, 4, '2023-11-27 19:51:43', '2023-11-27 19:51:43'),
(4, 1, 3, '2023-11-27 19:51:43', '2023-11-27 19:51:43'),
(5, 1, 2, '2023-11-27 19:51:43', '2023-11-27 19:51:43');

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
(1, 1, 1, 'BEST IN CREATIVE COSTUME', '2023-11-27 19:51:43', '2023-11-27 19:51:43'),
(2, 2, 1, 'BEST IN TALENT', '2023-11-27 20:01:14', '2023-11-27 20:01:14'),
(3, 3, 1, 'BEST IN SWIMSUIT', '2023-11-27 20:04:24', '2023-11-27 20:04:24'),
(4, 4, 1, 'BEST IN EVENING GOWN', '2023-11-27 20:08:34', '2023-11-27 20:08:34'),
(5, 7, 1, 'Ms. Pride of Luna 2023', '2023-11-27 20:30:02', '2023-11-27 20:30:02'),
(6, 7, 2, '1st Runner-up', '2023-11-27 20:30:02', '2023-11-27 20:30:02'),
(7, 7, 3, '3rd Runner-up', '2023-11-27 20:30:02', '2023-11-27 20:30:02'),
(8, 7, 4, '4th Runner-up', '2023-11-27 20:30:02', '2023-11-27 20:30:02');

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
(1, 1, 1, 1, '2023-11-27 20:43:48');

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
(1, 'Miss Pride of Luna 2023', 'Luna Sports Center', '2023-11-27', 1, 2, 1, NULL, '2023-11-27 19:17:39', '2023-11-27 19:20:42');

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
(1, 1, 'Therosha', 'Ballesteros', 'Female', 'sha', 'pride', 1, '192.168.0.101', 1, '2018-02-04 00:00:00', '2018-02-07 14:38:19'),
(2, 1, 'Atty. Glenn', 'Catabian', 'Male', 'glenn', 'pride', 2, NULL, 0, '2023-11-27 19:18:31', '2023-11-27 19:18:31'),
(3, 1, 'Dra.Karen Francia', 'Villa', 'Female', 'karen', 'pride', 2, NULL, 0, '2023-11-27 19:19:01', '2023-11-27 19:19:01'),
(4, 1, 'Cris', 'Crisostomo', 'Male', 'cris', 'pride', 2, NULL, 0, '2023-11-27 19:19:24', '2023-11-27 19:19:24'),
(5, 1, 'Angelica', 'Pagaduan', 'Female', 'angelica', 'pride', 2, NULL, 0, '2023-11-27 19:19:46', '2023-11-27 19:19:46'),
(6, 1, 'Jeremy', 'Garce', 'Male', 'jeremy', 'pride', 2, NULL, 0, '2023-11-27 19:20:30', '2023-11-27 19:20:30');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `portions`
--
ALTER TABLE `portions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `portions_contestants`
--
ALTER TABLE `portions_contestants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `portions_judges`
--
ALTER TABLE `portions_judges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `portions_judges_confirmation`
--
ALTER TABLE `portions_judges_confirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `portions_places`
--
ALTER TABLE `portions_places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `portions_toggles`
--
ALTER TABLE `portions_toggles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
