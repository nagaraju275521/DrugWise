-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 29, 2015 at 04:04 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `drug`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `Brand_ID` int(10) NOT NULL,
  `Location_ID` int(10) NOT NULL,
  `Contact_Name` varchar(250) NOT NULL,
  `Contact_Details` text NOT NULL,
  PRIMARY KEY (`Location_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Brand_ID`, `Location_ID`, `Contact_Name`, `Contact_Details`) VALUES
(852, 12345, ' Will Smith', ' 4th evenue, new block, Bc,.'),
(100, 12343, ' Peterson', '452-25,\r\nhokwaland, main road,4th avenue'),
(1432, 12342, ' mahamad', ' hyderabad'),
(786, 12349, ' Stalin', ' StalinGuard, 3rd avenue.'),
(786, 45645, 'nagendra', 'kaman, siddipet'),
(1432, 123410, 'rajadi', ' gfgfg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
