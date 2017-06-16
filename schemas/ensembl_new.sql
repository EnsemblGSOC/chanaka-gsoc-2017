-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2017 at 02:17 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ensembl_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `genome`
--

CREATE TABLE `genome` (
  `genome_id` int(11) NOT NULL,
  `genome_species` varchar(100) NOT NULL,
  `genome_assembly` varchar(100) NOT NULL,
  `genome_strain` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `location_type` enum('mysql','uri') NOT NULL,
  `location_object_type` varchar(100) DEFAULT NULL,
  `location_species` varchar(100) DEFAULT NULL,
  `location_dbtype` varchar(100) DEFAULT NULL,
  `location_uri` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location_has_location_logic_names`
--

CREATE TABLE `location_has_location_logic_names` (
  `lln_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location_logic_name`
--

CREATE TABLE `location_logic_name` (
  `lln_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `release`
--

CREATE TABLE `release` (
  `release_id` int(11) NOT NULL,
  `release_division` enum('ensembl','plants','bacteria','protists','funghi','metazoa') NOT NULL,
  `release_version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `track_id` int(11) NOT NULL,
  `version` varchar(6) NOT NULL,
  `short_name` varchar(20) NOT NULL,
  `long_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `genome_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `track_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `track_has_release`
--

CREATE TABLE `track_has_release` (
  `release_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `track_type`
--

CREATE TABLE `track_type` (
  `track_type_id` int(11) NOT NULL,
  `track_type_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genome`
--
ALTER TABLE `genome`
  ADD PRIMARY KEY (`genome_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `location_has_location_logic_names`
--
ALTER TABLE `location_has_location_logic_names`
  ADD KEY `lln_id` (`lln_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `location_logic_name`
--
ALTER TABLE `location_logic_name`
  ADD PRIMARY KEY (`lln_id`);

--
-- Indexes for table `release`
--
ALTER TABLE `release`
  ADD PRIMARY KEY (`release_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `genome_id` (`genome_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `track_type_id` (`track_type_id`);

--
-- Indexes for table `track_has_release`
--
ALTER TABLE `track_has_release`
  ADD KEY `release_id` (`release_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `track_type`
--
ALTER TABLE `track_type`
  ADD PRIMARY KEY (`track_type_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `location_has_location_logic_names`
--
ALTER TABLE `location_has_location_logic_names`
  ADD CONSTRAINT `location_has_location_logic_names_ibfk_1` FOREIGN KEY (`lln_id`) REFERENCES `location_logic_name` (`lln_id`),
  ADD CONSTRAINT `location_has_location_logic_names_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`genome_id`) REFERENCES `genome` (`genome_id`),
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `track_ibfk_3` FOREIGN KEY (`track_type_id`) REFERENCES `track_type` (`track_type_id`);

--
-- Constraints for table `track_has_release`
--
ALTER TABLE `track_has_release`
  ADD CONSTRAINT `track_has_release_ibfk_1` FOREIGN KEY (`release_id`) REFERENCES `release` (`release_id`),
  ADD CONSTRAINT `track_has_release_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
