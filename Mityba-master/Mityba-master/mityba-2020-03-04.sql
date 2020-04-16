-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2020 at 08:14 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mityba`
--

-- --------------------------------------------------------

--
-- Table structure for table `maistines_medz`
--

CREATE TABLE `maistines_medz` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(256) NOT NULL,
  `maisto_medz_grupes_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maistines_medz`
--

INSERT INTO `maistines_medz` (`id`, `pav`, `maisto_medz_grupes_id`) VALUES
(1, 'vanduo', 2),
(2, 'sausosios_medziagos', 2),
(3, 'baltymai', 1),
(4, 'riebalai', 1),
(5, 'cholesterolis', 1),
(6, 'angliavandeniai', 1),
(7, 'natris', 3),
(8, 'magnis', 3),
(9, 'fosforas', 3),
(10, 'kalis', 3),
(11, 'kalcis', 3),
(12, 'gelezis', 3),
(13, 'cinkas', 3),
(14, 'selenas', 3),
(15, 'jodas', 3),
(16, 'vitaminas_a', 4),
(17, 'vitaminas_d', 4),
(18, 'vitaminas_e', 4),
(19, 'vitaminas_b1', 4),
(20, 'vitaminas_b2', 4),
(21, 'niacinas', 4),
(22, 'folio_rugstis', 4),
(23, 'vitaminas_b6', 4),
(24, 'vitaminas_b12', 4),
(25, 'vitaminas_c', 4),
(26, 'energetine_verte', 5);

-- --------------------------------------------------------

--
-- Table structure for table `maisto_medz_grupes`
--

CREATE TABLE `maisto_medz_grupes` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maisto_medz_grupes`
--

INSERT INTO `maisto_medz_grupes` (`id`, `pav`) VALUES
(1, 'pagr_maisto_sudedamosios_dalys'),
(2, 'sausuju_skystuju_medz_dalys'),
(3, 'mineralai'),
(4, 'vitaminai'),
(5, 'labukas');

-- --------------------------------------------------------

--
-- Table structure for table `produktai`
--

CREATE TABLE `produktai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(256) NOT NULL,
  `kilme` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produktai`
--

INSERT INTO `produktai` (`id`, `pav`, `kilme`) VALUES
(1, 'agurkas', 0),
(2, 'baklazanas', 0),
(3, 'baravykas', 0),
(4, 'briuselinis_kopustas', 0),
(5, 'brokolis', 0),
(6, 'bulve', 0),
(7, 'burokelis', 0),
(8, 'cukinija', 0),
(9, 'cesnakas', 0),
(10, 'raudonas_kopustas', 0),
(11, 'baltas_kopustas', 0),
(12, 'kaliarope', 0),
(13, 'kininis_bastutis', 0),
(14, 'krapas', 0),
(15, 'krienas', 0),
(16, 'kukuruzas', 0),
(17, 'morka', 0),
(18, 'paprika', 0),
(19, 'petrazole', 0),
(20, 'pievagrybis', 0),
(21, 'pipirne', 0),
(22, 'pomidoras', 0),
(23, 'poras', 0),
(24, 'rabarbaras', 0),
(25, 'ridikas', 0),
(26, 'ridikelis', 0),
(27, 'rope', 0),
(28, 'rugstyne', 0),
(29, 'saliero_saknis', 0),
(30, 'salota', 0),
(31, 'svogunas', 0),
(32, 'svogunlaiskis', 0),
(33, 'sparagine_pupele', 0),
(34, 'spinatas', 0),
(35, 'ziedinis_kopustas', 0),
(36, 'zirnis', 0),
(37, 'pienas', 1),
(38, 'grietine', 1),
(39, 'kefyras', 1),
(40, 'varske', 1),
(41, 'suriz', 1),
(63, 'Vladimiras', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produktai_medziagos`
--

CREATE TABLE `produktai_medziagos` (
  `id` int(10) UNSIGNED NOT NULL,
  `produktai_id` int(10) UNSIGNED NOT NULL,
  `maistines_medz_id` int(10) UNSIGNED NOT NULL,
  `kiekis` decimal(10,2) NOT NULL,
  `maistine_medz_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produktai_medziagos`
--

INSERT INTO `produktai_medziagos` (`id`, `produktai_id`, `maistines_medz_id`, `kiekis`, `maistine_medz_id`) VALUES
(1, 1, 1, '95.80', NULL),
(2, 1, 2, '4.50', NULL),
(3, 1, 3, '0.80', NULL),
(4, 1, 4, '0.20', NULL),
(5, 1, 5, '0.00', NULL),
(6, 1, 6, '2.30', NULL),
(7, 1, 7, '9.00', NULL),
(8, 1, 8, '13.00', NULL),
(9, 1, 9, '29.00', NULL),
(10, 1, 10, '184.00', NULL),
(11, 1, 11, '21.00', NULL),
(12, 1, 12, '0.20', NULL),
(13, 1, 13, '0.19', NULL),
(14, 1, 14, '0.00', NULL),
(15, 1, 15, '3.50', NULL),
(16, 1, 16, '18.00', NULL),
(17, 1, 17, '0.00', NULL),
(18, 1, 18, '0.15', NULL),
(19, 1, 19, '0.04', NULL),
(20, 1, 20, '0.04', NULL),
(21, 1, 21, '0.70', NULL),
(22, 1, 22, '14.00', NULL),
(23, 1, 23, '0.04', NULL),
(24, 1, 24, '0.00', NULL),
(25, 1, 25, '5.90', NULL),
(26, 1, 26, '11.00', NULL),
(27, 2, 1, '92.00', NULL),
(28, 2, 2, '8.00', NULL),
(29, 2, 3, '1.20', NULL),
(30, 2, 4, '0.20', NULL),
(31, 2, 5, '0.00', NULL),
(32, 2, 6, '6.30', NULL),
(33, 2, 7, '8.00', NULL),
(34, 2, 8, '14.00', NULL),
(35, 2, 9, '44.00', NULL),
(36, 2, 10, '2.35', NULL),
(37, 2, 11, '14.00', NULL),
(38, 2, 12, '0.60', NULL),
(39, 2, 13, '0.22', NULL),
(40, 2, 14, '7.00', NULL),
(41, 2, 15, '1.10', NULL),
(43, 2, 17, '0.00', NULL),
(44, 2, 18, '0.03', NULL),
(45, 2, 19, '0.04', NULL),
(46, 2, 20, '0.06', NULL),
(47, 2, 21, '1.40', NULL),
(48, 2, 22, '18.00', NULL),
(49, 2, 23, '0.09', NULL),
(50, 2, 24, '0.00', NULL),
(51, 2, 25, '7.30', NULL),
(52, 2, 26, '24.00', NULL),
(53, 3, 1, '88.00', NULL),
(54, 3, 2, '12.00', NULL),
(55, 3, 3, '4.40', NULL),
(56, 3, 4, '0.50', NULL),
(57, 3, 5, '0.00', NULL),
(58, 3, 6, '4.50', NULL),
(59, 3, 7, '52.00', NULL),
(60, 3, 8, '16.00', NULL),
(61, 3, 9, '142.00', NULL),
(62, 3, 10, '235.00', NULL),
(63, 3, 11, '22.00', NULL),
(64, 3, 12, '1.20', NULL),
(65, 3, 13, '0.10', NULL),
(66, 3, 14, '2.00', NULL),
(67, 3, 15, '0.00', NULL),
(68, 3, 16, '0.00', NULL),
(69, 3, 17, '7.53', NULL),
(70, 3, 18, '0.12', NULL),
(71, 3, 19, '0.38', NULL),
(72, 3, 20, '0.26', NULL),
(73, 3, 21, '8.60', NULL),
(74, 3, 22, '44.00', NULL),
(75, 3, 23, '0.15', NULL),
(76, 3, 24, '0.00', NULL),
(77, 3, 25, '3.20', NULL),
(78, 3, 26, '29.00', NULL),
(79, 4, 1, '84.80', NULL),
(80, 4, 2, '15.30', NULL),
(81, 4, 3, '4.30', NULL),
(82, 4, 4, '0.50', NULL),
(83, 4, 5, '0.00', NULL),
(84, 4, 6, '6.30', NULL),
(85, 4, 7, '8.00', NULL),
(86, 4, 8, '27.00', NULL),
(87, 4, 9, '119.00', NULL),
(88, 4, 10, '405.00', NULL),
(89, 4, 11, '32.00', NULL),
(90, 4, 12, '1.70', NULL),
(91, 4, 13, '0.71', NULL),
(92, 4, 14, '18.00', NULL),
(93, 4, 15, '0.70', NULL),
(94, 4, 16, '60.00', NULL),
(95, 4, 17, '0.00', NULL),
(96, 4, 18, '250.00', NULL),
(97, 4, 19, '11.00', NULL),
(98, 4, 20, '0.15', NULL),
(99, 4, 21, '2.10', NULL),
(100, 4, 22, '61.00', NULL),
(101, 4, 23, '0.25', NULL),
(102, 4, 24, '0.00', NULL),
(103, 4, 25, '78.70', NULL),
(104, 4, 26, '30.00', NULL),
(105, 5, 1, '90.00', NULL),
(106, 5, 2, '10.00', NULL),
(107, 5, 3, '3.10', NULL),
(108, 5, 4, '0.10', NULL),
(109, 5, 5, '0.00', NULL),
(110, 5, 6, '5.70', NULL),
(111, 5, 7, '13.00', NULL),
(112, 5, 8, '26.00', NULL),
(113, 5, 9, '82.00', NULL),
(114, 5, 10, '464.00', NULL),
(115, 5, 11, '105.00', NULL),
(116, 5, 12, '1.30', NULL),
(117, 5, 13, '0.94', NULL),
(118, 5, 14, '1.00', NULL),
(119, 5, 15, '15.00', NULL),
(120, 5, 16, '1.43', NULL),
(121, 5, 17, '0.00', NULL),
(122, 5, 18, '0.46', NULL),
(123, 5, 19, '0.10', NULL),
(124, 5, 20, '0.21', NULL),
(125, 5, 21, '1.70', NULL),
(126, 5, 22, '71.00', NULL),
(127, 5, 23, '0.17', NULL),
(128, 5, 24, '0.00', NULL),
(129, 5, 25, '83.00', NULL),
(130, 5, 26, '29.00', NULL),
(131, 6, 1, '78.80', NULL),
(132, 6, 2, '21.20', NULL),
(133, 6, 3, '2.00', NULL),
(134, 6, 4, '0.10', NULL),
(135, 6, 5, '0.00', NULL),
(136, 6, 6, '8.30', NULL),
(137, 6, 7, '16.00', NULL),
(138, 6, 8, '35.00', NULL),
(139, 6, 9, '52.00', NULL),
(140, 6, 10, '452.00', NULL),
(141, 6, 11, '11.00', NULL),
(142, 6, 12, '0.60', NULL),
(143, 6, 13, '0.36', NULL),
(144, 6, 14, '0.00', NULL),
(145, 6, 15, '3.00', NULL),
(146, 6, 16, '3.00', NULL),
(147, 6, 17, '0.00', NULL),
(148, 6, 18, '0.06', NULL),
(149, 6, 19, '0.11', NULL),
(150, 6, 20, '0.06', NULL),
(151, 6, 21, '3.20', NULL),
(152, 6, 22, '35.00', NULL),
(153, 6, 23, '0.20', NULL),
(154, 6, 24, '0.00', NULL),
(155, 6, 25, '15.00', NULL),
(156, 6, 26, '81.00', NULL),
(157, 7, 1, '86.10', NULL),
(158, 7, 2, '13.90', NULL),
(159, 7, 3, '1.60', NULL),
(160, 7, 4, '0.10', NULL),
(161, 7, 5, '0.00', NULL),
(162, 7, 6, '9.50', NULL),
(163, 7, 7, '1.76', NULL),
(164, 7, 8, '17.00', NULL),
(165, 7, 9, '42.00', NULL),
(166, 7, 10, '1.97', NULL),
(167, 7, 11, '30.00', NULL),
(168, 7, 12, '0.90', NULL),
(169, 7, 13, '0.84', NULL),
(170, 7, 14, '0.80', NULL),
(171, 7, 15, '2.60', NULL),
(172, 7, 16, '2.00', NULL),
(173, 7, 17, '0.00', NULL),
(174, 7, 18, '0.03', NULL),
(175, 7, 19, '0.03', NULL),
(176, 7, 20, '0.05', NULL),
(177, 7, 21, '0.80', NULL),
(178, 7, 22, '13.00', NULL),
(179, 7, 23, '0.05', NULL),
(180, 7, 24, '0.00', NULL),
(181, 7, 25, '11.40', NULL),
(182, 7, 26, '37.00', NULL),
(183, 8, 1, '93.70', NULL),
(184, 8, 2, '6.30', NULL),
(185, 8, 3, '1.20', NULL),
(186, 8, 4, '0.10', NULL),
(187, 8, 5, '0.00', NULL),
(188, 8, 6, '3.40', NULL),
(189, 8, 7, '1.00', NULL),
(190, 8, 8, '22.00', NULL),
(191, 8, 9, '45.00', NULL),
(192, 8, 10, '250.00', NULL),
(193, 8, 11, '25.00', NULL),
(194, 8, 12, '0.40', NULL),
(195, 8, 13, '0.30', NULL),
(196, 8, 14, '0.00', NULL),
(197, 8, 15, '2.30', NULL),
(198, 8, 16, '34.00', NULL),
(199, 8, 17, '0.00', NULL),
(200, 8, 18, '0.10', NULL),
(201, 8, 19, '0.12', NULL),
(202, 8, 20, '0.02', NULL),
(203, 8, 21, '1.00', NULL),
(204, 8, 22, '52.00', NULL),
(205, 8, 23, '0.09', NULL),
(206, 8, 24, '0.00', NULL),
(207, 8, 25, '9.00', NULL),
(208, 8, 26, '16.00', NULL),
(209, 9, 1, '61.60', NULL),
(210, 9, 2, '36.10', NULL),
(211, 9, 3, '6.20', NULL),
(212, 9, 4, '0.30', NULL),
(213, 9, 5, '0.00', NULL),
(214, 9, 6, '28.00', NULL),
(215, 9, 7, '10.00', NULL),
(216, 9, 8, '25.00', NULL),
(217, 9, 9, '131.00', NULL),
(218, 9, 10, '436.00', NULL),
(219, 9, 11, '31.00', NULL),
(220, 9, 12, '1.30', NULL),
(221, 9, 13, '1.30', NULL),
(222, 9, 14, '20.00', NULL),
(223, 9, 15, '3.10', NULL),
(224, 9, 16, '9.00', NULL),
(225, 9, 17, '0.00', NULL),
(226, 9, 18, '0.01', NULL),
(227, 9, 19, '0.11', NULL),
(228, 9, 20, '0.04', NULL),
(229, 9, 21, '2.50', NULL),
(230, 9, 22, '3.00', NULL),
(231, 9, 23, '0.13', NULL),
(232, 9, 24, '0.00', NULL),
(233, 9, 25, '31.00', NULL),
(234, 9, 26, '128.00', NULL),
(235, 10, 1, '91.40', NULL),
(236, 10, 2, '8.90', NULL),
(237, 10, 3, '1.50', NULL),
(238, 10, 4, '0.20', NULL),
(239, 10, 5, '0.00', NULL),
(240, 10, 6, '5.50', NULL),
(241, 10, 7, '27.00', NULL),
(242, 10, 8, '19.00', NULL),
(243, 10, 9, '31.00', NULL),
(244, 10, 10, '258.00', NULL),
(245, 10, 11, '40.00', NULL),
(246, 10, 12, '0.70', NULL),
(247, 10, 13, '0.22', NULL),
(248, 10, 14, '1.80', NULL),
(249, 10, 15, '5.10', NULL),
(250, 10, 16, '5.00', NULL),
(251, 10, 17, '0.00', NULL),
(252, 10, 18, '0.10', NULL),
(253, 10, 19, '0.06', NULL),
(254, 10, 20, '0.07', NULL),
(255, 10, 21, '0.80', NULL),
(256, 10, 22, '39.00', NULL),
(257, 10, 23, '0.18', NULL),
(258, 10, 24, '0.00', NULL),
(259, 10, 25, '51.80', NULL),
(260, 10, 26, '19.00', NULL),
(379, 37, 1, '87.70', NULL),
(380, 37, 2, '12.30', NULL),
(381, 37, 3, '3.30', NULL),
(382, 37, 4, '3.50', NULL),
(383, 37, 5, '14.00', NULL),
(384, 37, 6, '4.80', NULL),
(385, 37, 7, '44.00', NULL),
(386, 37, 8, '12.00', NULL),
(387, 37, 9, '85.00', NULL),
(388, 37, 10, '138.00', NULL),
(389, 37, 11, '118.00', NULL),
(390, 37, 12, '0.10', NULL),
(391, 37, 13, '0.32', NULL),
(392, 37, 14, '1.00', NULL),
(393, 37, 15, '9.00', NULL),
(394, 37, 16, '40.00', NULL),
(395, 37, 17, '0.05', NULL),
(396, 37, 18, '0.11', NULL),
(397, 37, 19, '0.04', NULL),
(398, 37, 20, '0.17', NULL),
(399, 37, 21, '0.80', NULL),
(400, 37, 22, '5.00', NULL),
(401, 37, 23, '0.05', NULL),
(402, 37, 24, '0.40', NULL),
(403, 37, 25, '1.00', NULL),
(404, 37, 26, '65.00', NULL),
(407, 38, 1, '64.00', NULL),
(408, 38, 2, '36.00', NULL),
(409, 38, 3, '2.40', NULL),
(419, 63, 1, '65.00', NULL),
(420, 63, 3, '20.00', NULL),
(421, 63, 4, '12.00', NULL),
(422, 63, 7, '2.00', NULL),
(423, 63, 10, '3.00', NULL),
(424, 63, 5, '8.00', NULL),
(425, 63, 26, '0.01', NULL),
(426, 63, 2, '1.00', NULL),
(427, 63, 14, '0.60', NULL),
(428, 63, 16, '3.00', NULL),
(429, 63, 6, '8.00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `maistines_medz`
--
ALTER TABLE `maistines_medz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maisto_medz_grupes_id` (`maisto_medz_grupes_id`);

--
-- Indexes for table `maisto_medz_grupes`
--
ALTER TABLE `maisto_medz_grupes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produktai`
--
ALTER TABLE `produktai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produktai_medziagos`
--
ALTER TABLE `produktai_medziagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produktai_id` (`produktai_id`),
  ADD KEY `maistines_medz_id` (`maistines_medz_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `maistines_medz`
--
ALTER TABLE `maistines_medz`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `maisto_medz_grupes`
--
ALTER TABLE `maisto_medz_grupes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `produktai`
--
ALTER TABLE `produktai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `produktai_medziagos`
--
ALTER TABLE `produktai_medziagos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `maistines_medz`
--
ALTER TABLE `maistines_medz`
  ADD CONSTRAINT `maistines_medz_ibfk_1` FOREIGN KEY (`maisto_medz_grupes_id`) REFERENCES `maisto_medz_grupes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produktai_medziagos`
--
ALTER TABLE `produktai_medziagos`
  ADD CONSTRAINT `produktai_medziagos_ibfk_1` FOREIGN KEY (`produktai_id`) REFERENCES `produktai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produktai_medziagos_ibfk_2` FOREIGN KEY (`maistines_medz_id`) REFERENCES `maistines_medz` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
