-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 29, 2015 at 04:05 AM
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
-- Table structure for table `drug_brand`
--

CREATE TABLE IF NOT EXISTS `drug_brand` (
  `Drug_ID` varchar(10) NOT NULL,
  `Brand_ID` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drug_brand`
--

INSERT INTO `drug_brand` (`Drug_ID`, `Brand_ID`) VALUES
(' 444', '1001'),
(' 444', '852'),
('222', '852'),
(' 444', '1432'),
(' 444', '100'),
(' 333', '78'),
(' 106', '123'),
(' 333', '1001'),
('111', '852'),
('222', '100'),
(' 333', '100'),
('11', '1001'),
('11', '852'),
('111', '1432'),
('111', '100'),
('111', '786'),
('222', '78');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
