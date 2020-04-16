-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 13 2020 г., 19:56
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
-- База данных: `keliones`
--

-- --------------------------------------------------------

--
-- Структура таблицы `marsrutai`
--

CREATE TABLE `marsrutai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(256) NOT NULL,
  `kaina` decimal(10,2) NOT NULL,
  `trukme` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `marsrutai`
--

INSERT INTO `marsrutai` (`id`, `pav`, `kaina`, `trukme`) VALUES
(1, 'Kaunas-Vilnius', '50.00', 2),
(2, 'Kaunas-Jonava', '12.00', 0.6),
(3, 'Kaunas-Klaipeda', '80.00', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `marsrutai_miestai`
--

CREATE TABLE `marsrutai_miestai` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_miesto` int(10) UNSIGNED NOT NULL,
  `id_marsruto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `marsrutai_miestai`
--

INSERT INTO `marsrutai_miestai` (`id`, `id_miesto`, `id_marsruto`) VALUES
(1, 3, 1),
(2, 4, 1),
(3, 2, 1),
(4, 5, 1),
(5, 6, 1),
(6, 2, 2),
(7, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `miestai`
--

CREATE TABLE `miestai` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_rajono` int(10) UNSIGNED DEFAULT NULL,
  `pav` varchar(256) DEFAULT NULL,
  `ilguma` float DEFAULT NULL,
  `platuma` float DEFAULT NULL,
  `gyv_sk` bigint(20) DEFAULT NULL,
  `plotas` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `miestai`
--

INSERT INTO `miestai` (`id`, `id_rajono`, `pav`, `ilguma`, `platuma`, `gyv_sk`, `plotas`) VALUES
(1, 2, 'Jonava', 24.165, 55.052, 27062, 13.67),
(2, 1, 'Kaunas', 23.531, 54.535, 286763, 157),
(3, 1, 'Rumšiškės', 24.1301, 54.515, 1651, 0),
(4, 2, 'Kaišiadorys', 24.272, 54.514, 7644, 0),
(5, 2, 'Elektrenai', 24.394, 54.471, 11258, 21),
(6, NULL, 'Vievis', 24.492, 54.462, 4521, 0),
(7, NULL, 'Vilnius', 25.173, 54.404, 536692, 401),
(12, NULL, 'Klaipeda', 21.075, 55.424, 148506, 110),
(13, NULL, 'Siauliai', 23.19, 55.552, 100618, 81),
(19, NULL, 'Nesamone', 0, 0, 1, 1),
(20, NULL, 'Nesamone', 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rajonai`
--

CREATE TABLE `rajonai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `rajonai`
--

INSERT INTO `rajonai` (`id`, `pav`) VALUES
(1, 'Kauno'),
(2, 'Jonavos');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `marsrutai`
--
ALTER TABLE `marsrutai`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `marsrutai_miestai`
--
ALTER TABLE `marsrutai_miestai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marsruto` (`id_marsruto`),
  ADD KEY `id_miesto` (`id_miesto`);

--
-- Индексы таблицы `miestai`
--
ALTER TABLE `miestai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rajono` (`id_rajono`);

--
-- Индексы таблицы `rajonai`
--
ALTER TABLE `rajonai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `marsrutai`
--
ALTER TABLE `marsrutai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `marsrutai_miestai`
--
ALTER TABLE `marsrutai_miestai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `miestai`
--
ALTER TABLE `miestai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `rajonai`
--
ALTER TABLE `rajonai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `marsrutai_miestai`
--
ALTER TABLE `marsrutai_miestai`
  ADD CONSTRAINT `marsrutai_miestai_ibfk_1` FOREIGN KEY (`id_marsruto`) REFERENCES `marsrutai` (`id`),
  ADD CONSTRAINT `marsrutai_miestai_ibfk_2` FOREIGN KEY (`id_miesto`) REFERENCES `miestai` (`id`);

--
-- Ограничения внешнего ключа таблицы `miestai`
--
ALTER TABLE `miestai`
  ADD CONSTRAINT `miestai_ibfk_1` FOREIGN KEY (`id_rajono`) REFERENCES `rajonai` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
