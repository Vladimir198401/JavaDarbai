-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 13 2020 г., 19:55
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mityba`
--

-- --------------------------------------------------------

--
-- Структура таблицы `maistines_medz`
--

CREATE TABLE `maistines_medz` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(50) COLLATE utf8_lithuanian_ci NOT NULL,
  `id_grupes` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Дамп данных таблицы `maistines_medz`
--

INSERT INTO `maistines_medz` (`id`, `pav`, `id_grupes`) VALUES
(1, 'baltymai', 0),
(2, 'riebalai', 0),
(3, 'angliavandeniai', 0),
(4, 'vanduo', 0),
(5, 'sausosios_medziagos', 0),
(6, 'cholesterolis', 0),
(7, 'natris', 0),
(8, 'magnis', 0),
(9, 'fosforas', 0),
(10, 'kalis', 0),
(11, 'kalcis', 0),
(12, 'gelezis', 0),
(13, 'cinkas', 0),
(14, 'selenos', 0),
(15, 'jodas', 0),
(16, 'vitaminas_a', 0),
(17, 'vitaminas_d', 0),
(18, 'vitaminas_e', 0),
(19, 'vitaminas_b1', 0),
(20, 'vitaminas_b2', 0),
(21, 'niacinas', 0),
(22, 'folio_rugstis', 0),
(23, 'vitaminas_b6', 0),
(24, 'vitaminas_b12', 0),
(25, 'vitaminas_c', 0),
(26, 'energetine_verte', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `maisto_medz_grupes`
--

CREATE TABLE `maisto_medz_grupes` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(50) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Дамп данных таблицы `maisto_medz_grupes`
--

INSERT INTO `maisto_medz_grupes` (`id`, `pav`) VALUES
(1, 'pagr_maisto_sudedamosios_dalys'),
(2, 'sausuju_skistuju_medziagu_dalys'),
(3, 'mineralai'),
(4, 'vitaminai');

-- --------------------------------------------------------

--
-- Структура таблицы `produktai`
--

CREATE TABLE `produktai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(50) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Дамп данных таблицы `produktai`
--

INSERT INTO `produktai` (`id`, `pav`) VALUES
(1, 'agurkas'),
(2, 'baklazanas'),
(3, 'baravykas'),
(4, 'briuseliniai_kopustai'),
(5, 'brokoliai'),
(6, 'bulves'),
(7, 'burokeliai'),
(8, 'cukinijos'),
(9, 'cesnakai'),
(10, 'raudonas_kopustas'),
(11, 'baltas_kopustas'),
(12, 'kaliaropes'),
(13, 'kininis_bastutis'),
(14, 'krapai'),
(15, 'krienas'),
(16, 'kukuruzas'),
(17, 'morka'),
(18, 'paprika'),
(19, 'petrazole'),
(20, 'pievagribis'),
(21, 'pipirne'),
(22, 'pomidoras'),
(23, 'poras'),
(24, 'rabarbaras'),
(25, 'ridikas'),
(26, 'ridikeliai'),
(27, 'rope'),
(28, 'rugstynes'),
(29, 'salieru_saknys'),
(30, 'salotos'),
(31, 'svogunai'),
(32, 'svogunlaiskiai'),
(33, 'sparagines_pupeles'),
(34, 'spinatas'),
(35, 'ziediniai_kopustai');

-- --------------------------------------------------------

--
-- Структура таблицы `produktai_medziagos`
--

CREATE TABLE `produktai_medziagos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_produkto` int(10) UNSIGNED NOT NULL,
  `id_medziagos` int(10) UNSIGNED NOT NULL,
  `kiekis` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Дамп данных таблицы `produktai_medziagos`
--

INSERT INTO `produktai_medziagos` (`id`, `id_produkto`, `id_medziagos`, `kiekis`) VALUES
(1, 1, 1, '95.80'),
(2, 1, 2, '4.50'),
(3, 1, 3, '0.80'),
(4, 1, 4, '0.20'),
(5, 1, 5, '0.00'),
(6, 1, 6, '2.30'),
(7, 1, 7, '9.00'),
(8, 1, 8, '13.00'),
(9, 1, 9, '29.00'),
(10, 1, 10, '184.00'),
(11, 1, 11, '21.00'),
(12, 1, 12, '0.20'),
(13, 1, 13, '0.19'),
(14, 1, 14, '0.00'),
(15, 1, 15, '3.50'),
(16, 1, 16, '18.00'),
(17, 1, 17, '0.00'),
(18, 1, 18, '0.15'),
(19, 1, 19, '0.04'),
(20, 1, 20, '0.04'),
(21, 1, 21, '0.70'),
(22, 1, 22, '14.00'),
(23, 1, 23, '0.04'),
(24, 1, 24, '0.00'),
(25, 1, 25, '5.90'),
(26, 1, 26, '11.00'),
(27, 2, 1, '92.00'),
(28, 2, 2, '8.00'),
(29, 2, 3, '1.20'),
(30, 2, 4, '0.20'),
(31, 2, 5, '0.00'),
(32, 2, 6, '6.30'),
(33, 2, 7, '8.00'),
(34, 2, 8, '14.00'),
(35, 2, 9, '44.00'),
(36, 2, 10, '2.35'),
(37, 2, 11, '14.00'),
(38, 2, 12, '0.60'),
(39, 2, 13, '0.22'),
(40, 2, 14, '7.00'),
(41, 2, 15, '1.10'),
(42, 2, 16, '7.00'),
(43, 2, 17, '0.00'),
(44, 2, 18, '0.03'),
(45, 2, 19, '0.04'),
(46, 2, 20, '0.06'),
(47, 2, 21, '1.40'),
(48, 2, 22, '18.00'),
(49, 2, 23, '0.09'),
(50, 2, 24, '0.00'),
(51, 2, 25, '7.30'),
(52, 2, 26, '24.00'),
(53, 3, 1, '88.00'),
(54, 3, 2, '12.00'),
(55, 3, 3, '4.40'),
(56, 3, 4, '0.50'),
(57, 3, 5, '0.00'),
(58, 3, 6, '4.50'),
(59, 3, 7, '52.00'),
(60, 3, 8, '16.00'),
(61, 3, 9, '142.00'),
(62, 3, 10, '235.00'),
(63, 3, 11, '22.00'),
(64, 3, 12, '1.20'),
(65, 3, 13, '0.10'),
(66, 3, 14, '2.00'),
(67, 3, 15, '0.00'),
(68, 3, 16, '0.00'),
(69, 3, 17, '7.53'),
(70, 3, 18, '0.12'),
(71, 3, 19, '0.38'),
(72, 3, 20, '0.26'),
(73, 3, 21, '8.60'),
(74, 3, 22, '44.00'),
(75, 3, 23, '0.15'),
(76, 3, 24, '0.00'),
(77, 3, 25, '3.20'),
(78, 3, 26, '29.00'),
(79, 4, 1, '84.80'),
(80, 4, 2, '15.30'),
(81, 4, 3, '4.30'),
(82, 4, 4, '0.50'),
(83, 4, 5, '0.00'),
(84, 4, 6, '6.30'),
(85, 4, 7, '8.00'),
(86, 4, 8, '27.00'),
(87, 4, 9, '119.00'),
(88, 4, 10, '405.00'),
(89, 4, 11, '32.00'),
(90, 4, 12, '1.70'),
(91, 4, 13, '0.71'),
(92, 4, 14, '18.00'),
(93, 4, 15, '0.70'),
(94, 4, 16, '60.00'),
(95, 4, 17, '0.00'),
(96, 4, 18, '250.00'),
(97, 4, 19, '11.00'),
(98, 4, 20, '0.15'),
(99, 4, 21, '2.10'),
(100, 4, 22, '61.00'),
(101, 4, 23, '0.25'),
(102, 4, 24, '0.00'),
(103, 4, 25, '78.70'),
(104, 4, 26, '30.00'),
(105, 5, 1, '90.00'),
(106, 5, 2, '10.00'),
(107, 5, 3, '3.10'),
(108, 5, 4, '0.10'),
(109, 5, 5, '0.00'),
(110, 5, 6, '5.70'),
(111, 5, 7, '13.00'),
(112, 5, 8, '26.00'),
(113, 5, 9, '82.00'),
(114, 5, 10, '464.00'),
(115, 5, 11, '105.00'),
(116, 5, 12, '1.30'),
(117, 5, 13, '0.94'),
(118, 5, 14, '1.00'),
(119, 5, 15, '15.00'),
(120, 5, 16, '1.43'),
(121, 5, 17, '0.00'),
(122, 5, 18, '0.46'),
(123, 5, 19, '0.10'),
(124, 5, 20, '0.21'),
(125, 5, 21, '1.70'),
(126, 5, 22, '71.00'),
(127, 5, 23, '0.17'),
(128, 5, 24, '0.00'),
(129, 5, 25, '83.00'),
(130, 5, 26, '29.00'),
(131, 6, 1, '78.80'),
(132, 6, 2, '21.20'),
(133, 6, 3, '2.00'),
(134, 6, 4, '0.10'),
(135, 6, 5, '0.00'),
(136, 6, 6, '8.30'),
(137, 6, 7, '16.00'),
(138, 6, 8, '35.00'),
(139, 6, 9, '52.00'),
(140, 6, 10, '452.00'),
(141, 6, 11, '11.00'),
(142, 6, 12, '0.60'),
(143, 6, 13, '0.36'),
(144, 6, 14, '0.00'),
(145, 6, 15, '3.00'),
(146, 6, 16, '3.00'),
(147, 6, 17, '0.00'),
(148, 6, 18, '0.06'),
(149, 6, 19, '0.11'),
(150, 6, 20, '0.06'),
(151, 6, 21, '3.20'),
(152, 6, 22, '35.00'),
(153, 6, 23, '0.20'),
(154, 6, 24, '0.00'),
(155, 6, 25, '15.00'),
(156, 6, 26, '81.00'),
(157, 7, 1, '86.10'),
(158, 7, 2, '13.90'),
(159, 7, 3, '1.60'),
(160, 7, 4, '0.10'),
(161, 7, 5, '0.00'),
(162, 7, 6, '9.50'),
(163, 7, 7, '1.76'),
(164, 7, 8, '17.00'),
(165, 7, 9, '42.00'),
(166, 7, 10, '1.97'),
(167, 7, 11, '30.00'),
(168, 7, 12, '0.90'),
(169, 7, 13, '0.84'),
(170, 7, 14, '0.80'),
(171, 7, 15, '2.60'),
(172, 7, 16, '2.00'),
(173, 7, 17, '0.00'),
(174, 7, 18, '0.03'),
(175, 7, 19, '0.03'),
(176, 7, 20, '0.05'),
(177, 7, 21, '0.80'),
(178, 7, 22, '13.00'),
(179, 7, 23, '0.05'),
(180, 7, 24, '0.00'),
(181, 7, 25, '11.40'),
(182, 7, 26, '37.00'),
(183, 8, 1, '93.70'),
(184, 8, 2, '6.30'),
(185, 8, 3, '1.20'),
(186, 8, 4, '0.10'),
(187, 8, 5, '0.00'),
(188, 8, 6, '3.40'),
(189, 8, 7, '1.00'),
(190, 8, 8, '22.00'),
(191, 8, 9, '45.00'),
(192, 8, 10, '250.00'),
(193, 8, 11, '25.00'),
(194, 8, 12, '0.40'),
(195, 8, 13, '0.30'),
(196, 8, 14, '0.00'),
(197, 8, 15, '2.30'),
(198, 8, 16, '34.00'),
(199, 8, 17, '0.00'),
(200, 8, 18, '0.10'),
(201, 8, 19, '0.12'),
(202, 8, 20, '0.02'),
(203, 8, 21, '1.00'),
(204, 8, 22, '52.00'),
(205, 8, 23, '0.09'),
(206, 8, 24, '0.00'),
(207, 8, 25, '9.00'),
(208, 8, 26, '16.00'),
(209, 9, 1, '61.60'),
(210, 9, 2, '36.10'),
(211, 9, 3, '6.20'),
(212, 9, 4, '0.30'),
(213, 9, 5, '0.00'),
(214, 9, 6, '28.00'),
(215, 9, 7, '10.00'),
(216, 9, 8, '25.00'),
(217, 9, 9, '131.00'),
(218, 9, 10, '436.00'),
(219, 9, 11, '31.00'),
(220, 9, 12, '1.30'),
(221, 9, 13, '1.30'),
(222, 9, 14, '20.00'),
(223, 9, 15, '3.10'),
(224, 9, 16, '9.00'),
(225, 9, 17, '0.00'),
(226, 9, 18, '0.01'),
(227, 9, 19, '0.11'),
(228, 9, 20, '0.04'),
(229, 9, 21, '2.50'),
(230, 9, 22, '3.00'),
(231, 9, 23, '0.13'),
(232, 9, 24, '0.00'),
(233, 9, 25, '31.00'),
(234, 9, 26, '128.00'),
(235, 10, 1, '91.40'),
(236, 10, 2, '8.90'),
(237, 10, 3, '1.50'),
(238, 10, 4, '0.20'),
(239, 10, 5, '0.00'),
(240, 10, 6, '5.50'),
(241, 10, 7, '27.00'),
(242, 10, 8, '19.00'),
(243, 10, 9, '31.00'),
(244, 10, 10, '258.00'),
(245, 10, 11, '40.00'),
(246, 10, 12, '0.70'),
(247, 10, 13, '0.22'),
(248, 10, 14, '1.80'),
(249, 10, 15, '5.10'),
(250, 10, 16, '5.00'),
(251, 10, 17, '0.00'),
(252, 10, 18, '0.10'),
(253, 10, 19, '0.06'),
(254, 10, 20, '0.07'),
(255, 10, 21, '0.80'),
(256, 10, 22, '39.00'),
(257, 10, 23, '0.18'),
(258, 10, 24, '0.00'),
(259, 10, 25, '51.80'),
(260, 10, 26, '19.00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `maistines_medz`
--
ALTER TABLE `maistines_medz`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `maisto_medz_grupes`
--
ALTER TABLE `maisto_medz_grupes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `produktai`
--
ALTER TABLE `produktai`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `produktai_medziagos`
--
ALTER TABLE `produktai_medziagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produktai_medziagos_ibfk_1` (`id_produkto`),
  ADD KEY `produktai_medziagos_ibfk_2` (`id_medziagos`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `maistines_medz`
--
ALTER TABLE `maistines_medz`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `maisto_medz_grupes`
--
ALTER TABLE `maisto_medz_grupes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `produktai`
--
ALTER TABLE `produktai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `produktai_medziagos`
--
ALTER TABLE `produktai_medziagos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `produktai_medziagos`
--
ALTER TABLE `produktai_medziagos`
  ADD CONSTRAINT `produktai_medziagos_ibfk_1` FOREIGN KEY (`id_produkto`) REFERENCES `produktai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produktai_medziagos_ibfk_2` FOREIGN KEY (`id_medziagos`) REFERENCES `maistines_medz` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
