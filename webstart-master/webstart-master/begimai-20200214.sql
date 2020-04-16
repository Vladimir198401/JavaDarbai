-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2020 at 08:13 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `begimai`
--

-- --------------------------------------------------------

--
-- Table structure for table `trasos`
--

CREATE TABLE `trasos` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(255) NOT NULL,
  `atstumas_km` decimal(10,3) NOT NULL DEFAULT '10.000',
  `sukilimas` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trasos`
--

INSERT INTO `trasos` (`id`, `pav`, `atstumas_km`, `sukilimas`) VALUES
(1, 'KaunoMaratonas21_42', '21.095', 0),
(2, 'SveikasZmogus', '10.000', 0),
(3, 'šėta', '10.000', 0),
(4, 'Šėta', '10.000', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `trasos`
--
ALTER TABLE `trasos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `trasos`
--
ALTER TABLE `trasos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
