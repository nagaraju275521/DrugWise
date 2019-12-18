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
-- Table structure for table `drugs`
--

CREATE TABLE IF NOT EXISTS `drugs` (
  `Drug_ID` int(11) NOT NULL DEFAULT '0',
  `Drug_Name` varchar(250) DEFAULT NULL,
  `Pharmacological_Class` varchar(250) DEFAULT NULL,
  `MechanismOFAction` text,
  `Uses` text,
  `Dosage` text,
  `Adverse_Effects` text,
  `Contra_Indication` text,
  `Drug_Interaction` text,
  `Precaution` text,
  `PharmaCare_Information` text,
  PRIMARY KEY (`Drug_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`Drug_ID`, `Drug_Name`, `Pharmacological_Class`, `MechanismOFAction`, `Uses`, `Dosage`, `Adverse_Effects`, `Contra_Indication`, `Drug_Interaction`, `Precaution`, `PharmaCare_Information`) VALUES
(333, ' ddddd', 'vbnvn', 'nbv ', 'vn ', 'bvnbv ', 'nbv ', 'nbvnv ', 'nbv ', 'nbvn ', 'vbnv '),
(444, ' RRRR', ' ,n,m', 'n,n,n ', 'hjh ', 'gkhk ', 'jhkh ', 'kjhkjh ', 'khkh ', 'kjhk ', 'hkjh '),
(11, 'Chlorphenamine ', 'antihistamine', 'Competitively antagonizes histamine at H 1 receptor sites.', 'Symptomatic relief of allergy, allergic rhinitis (hay fever) and \r\nconjunctivitis, urticaria, insect stings, and pruritus of allergic origin; adjunct in the emergency treatment of anaphylactic shock and severe angioedema.\r\n', 'Immediate-release tablet or syrup\r\nAdults and children 12 yr of age and older\r\nPO 4 mg every 4 to 6 h (max, 24 mg/day).\r\nChildren 6 to younger than 12 yr of age\r\nPO 2 mg every 4 to 6 h (max, 12 mg/day).\r\nChildren younger than 5 yr of age\r\nPO As recommended by health care provider.\r\nExtended-release tablets\r\nAdults and children 12 yr of age and older\r\nPO 8 mg every 8 to 12 h or 12 mg every 12 h (max, 24 mg/day).\r\nExtended-release capsules\r\nAdults and children 12 yr of age and older\r\nPO 8 or 12 mg in the morning and evening (max, 24 mg/day).', 'Drowsiness (rarely paradoxical stimulation with high doses, or in children or the elderly), hypotension, headache, dizziness, palpitations, psychomotor impairment, urinary retention, dry mouth, blurred vision, gastrointestinal disturbances; liver dysfunction; blood disorders; also rash \r\nand photosensitivity reactions, sweating and tremor; hypersensitivity reactions including bronchospasm, angioedema and anaphylaxis; injections may be irritant.\r\n', 'Hypersensitivity to antihistamines; narrow-angle glaucoma; stenosing peptic ulcer; symptomatic prostatic hypertrophy; asthmatic attack; bladder neck obstruction; pyloroduodenal obstruction; MAO therapy; use in newborn or premature infants and in breast-feeding mothers.', 'Alcohol, CNS depressants, and tricyclic antidepressants\r\nMay cause additive CNS depressant effects.\r\nMAOIs\r\nMay increase anticholinergic effects of chlorpheniramine.\r\nOtotoxic medications\r\nConcurrent use may mask the symptoms of ototoxicity.\r\nLaboratory Test Interactions\r\nSkin testing procedures\r\nAntihistamines may prevent or diminish otherwise positive reaction to dermal reactivity indicators.', 'Prostate enlargement, urinary retention; ileus or pyloroduodenal \r\nobstruction; glaucoma; child under 1 year; pregnancy (Appendix 2); and \r\nbreastfeeding (Appendix 3); renal impairment (Appendix 4); hepatic \r\nimpairment (Appendix 5); epilepsy; interactions: Appendix 1.\r\n', 'bmbm'),
(111, ' gelcil', 'amp', 'jnm,nm ', 'm-m', 'mn, ', 'mgjhg ', 'ghjg ', 'jhg ', 'jhg ', 'hjgh '),
(222, ' crovcine', ' bmnm', 'nbmnb ', 'mnb ', 'nbn ', 'bnb ', 'mnbmnb ', 'mnb ', 'nmb ', 'bnn ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
