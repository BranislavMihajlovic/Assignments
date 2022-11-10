-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2022 at 01:44 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kreiranje_shopa`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `buyers_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packages` enum('STANDARD','PREMIUM') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`buyers_id`, `name`, `surname`, `email`, `packages`) VALUES
(1, 'Ara', 'Questier', 'aquestier0@dailymotion.com', 'STANDARD'),
(2, 'Esta', 'Dashkov', 'edashkov1@chron.com', 'PREMIUM'),
(3, 'Jolynn', 'Mc Dermid', 'jmcdermid2@paypal.com', 'PREMIUM'),
(4, 'Fredrick', 'Hasson', 'fhasson3@yellowbook.com', 'STANDARD'),
(5, 'Vikki', 'Densell', 'vdensell4@blogs.com', 'STANDARD'),
(6, 'Kerstin', 'Steptoe', 'ksteptoe5@comsenz.com', 'PREMIUM'),
(7, 'Ado', 'Sieb', 'asieb6@stumbleupon.com', 'PREMIUM'),
(8, 'Teador', 'Depka', 'tdepka7@wikipedia.org', 'STANDARD'),
(9, 'Dyanne', 'Hoston', 'dhoston8@list-manage.com', 'STANDARD'),
(10, 'Cecile', 'Coard', 'ccoard9@unesco.org', 'PREMIUM'),
(11, 'Egbert', 'Coppenhall', 'ecoppenhalla@4shared.com', 'STANDARD'),
(12, 'Sindee', 'Berrow', 'sberrowb@livejournal.com', 'STANDARD'),
(13, 'Meggy', 'Bockett', 'mbockettc@ocn.ne.jp', 'PREMIUM'),
(14, 'Berta', 'Pellamont', 'bpellamontd@psu.edu', 'PREMIUM'),
(15, 'Christos', 'Pankhurst.', 'cpankhurste@sciencedirect.com', 'STANDARD'),
(16, 'Raven', 'Aviss', 'ravissf@goo.gl', 'PREMIUM'),
(17, 'Donica', 'Mabon', 'dmabong@acquirethisname.com', 'STANDARD'),
(18, 'Myrta', 'Vynall', 'mvynallh@google.co.jp', 'STANDARD'),
(19, 'Blakeley', 'Codron', 'bcodroni@tinyurl.com', 'STANDARD'),
(20, 'Cello', 'McGarrahan', 'cmcgarrahanj@discuz.net', 'PREMIUM'),
(21, 'Diahann', 'Rodman', 'drodmank@virginia.edu', 'PREMIUM'),
(22, 'Mirilla', 'Le febre', 'mlefebrel@cbc.ca', 'STANDARD'),
(23, 'Torr', 'Ferrini', 'tferrinim@joomla.org', 'STANDARD'),
(24, 'Mandy', 'Bennen', 'mbennenn@geocities.jp', 'STANDARD'),
(25, 'Drew', 'Imos', 'dimoso@moonfruit.com', 'PREMIUM');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `products_id` int(11) NOT NULL,
  `manufacturer` enum('IPHONE','SAMSUNG','XIAOMI','HUAWEI') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `packages` enum('STANDARD','PREMIUM') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `manufacturer`, `name`, `price`, `packages`) VALUES
(1, 'IPHONE', 'Iphone 11 Pro Max Gold 256gb', '900.00', 'PREMIUM'),
(2, 'XIAOMI', 'Xiamo RedmiNote 9 Pro 128gb White', '320.00', 'STANDARD'),
(3, 'SAMSUNG', 'Samsung Galaxy S22 Ultra 512gb Black', '1100.00', 'PREMIUM'),
(4, 'HUAWEI', 'Huawei P20 Lite 32gb black', '150.00', 'STANDARD'),
(5, 'IPHONE', 'Iphone 14 Pro 128gb Deep Purple ', '1600.00', 'PREMIUM'),
(6, 'IPHONE', 'Iphone 14 Pro Max 512gb Black', '1800.00', 'PREMIUM'),
(7, 'XIAOMI', 'Xiaomi Mi 11 T PRO', '400.00', 'STANDARD'),
(8, 'SAMSUNG', 'Samsung Galaxy A41', '200.00', 'STANDARD');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `buyers_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `date_of_purchase` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `buyers_id`, `products_id`, `date_of_purchase`) VALUES
(1, 1, 8, '2022-10-15'),
(2, 2, 1, '2022-10-15'),
(3, 3, 3, '2022-10-16'),
(4, 9, 2, '2022-10-17'),
(5, 12, 7, '2022-10-17'),
(6, 25, 1, '2022-10-18'),
(7, 20, 6, '2022-10-19'),
(8, 21, 5, '2022-10-19'),
(9, 15, 4, '2022-10-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`buyers_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`,`buyers_id`,`products_id`) USING BTREE,
  ADD KEY `FK_products` (`products_id`) USING BTREE,
  ADD KEY `FK_buyers` (`buyers_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyers`
--
ALTER TABLE `buyers`
  MODIFY `buyers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `FK_buyer` FOREIGN KEY (`buyers_id`) REFERENCES `buyers` (`buyers_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_products` FOREIGN KEY (`products_id`) REFERENCES `products` (`products_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
