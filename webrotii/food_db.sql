-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2025 at 02:41 PM
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
-- Database: `food_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(18, 10, 63, 'Stoberry – Nanas', 10000, 1, 'nas.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(8, 10, 'Dwiki', '0872681758', 'dwikiadityaptr@gmail.com', 'cash on delivery', 'a, s, 33, 1, 3, hh, bu - 21', 'Blueberry – Melon (10000 x 1) - ', 10000, '2025-01-06', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sold` int(11) DEFAULT 0,
  `position` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`, `sold`, `position`) VALUES
(63, 'Stoberry – Nanas', 'Reguler', 10000, 'nas.jpg', 5, 1),
(64, 'Blueberry – Melon', 'Reguler', 10000, 'melon.jpg', 8, 0),
(65, 'Stroberry – Blueberry', 'Reguler', 10000, 'roti1.jpg', 9, 0),
(66, 'Coklat – Stroberry', 'Reguler', 10000, 'roti2.jpg', 8, 1),
(67, 'Coklat - Melon', 'Reguler', 10000, 'melon.jpg', 4, 2),
(68, 'Coklat – Nanas', 'Reguler', 10000, 'nas.jpg', 3, 3),
(69, 'Coklat – Coklat', 'Reguler', 12000, 'roticoklat.jpg', 10, 4),
(70, 'Coklat - Kacang', 'Reguler', 12000, 'kac.jpg', 30, 5),
(71, 'Pisang – Durian', 'Reguler', 12000, 'vanila.jpg', 2, 0),
(72, 'Coklat – Durian', 'Reguler', 13000, 'roti3.jpg', 3, 0),
(73, 'Coklat – Milo', 'Reguler', 13000, 'milo.jpg', 40, 0),
(74, 'Milo – Milo', 'Reguler', 13000, 'milo.jpg', 10, 0),
(75, 'Coklat – Keju', 'Reguler', 13000, 'roti3.jpg', 50, 0),
(76, 'Tiramisu - Coklat', 'Reguler', 13000, 'roti3.jpg', 7, 0),
(77, 'Keju – Keju', 'Reguler', 14000, 'vanila.jpg', 9, 0),
(78, 'Pisang – Keju', 'Spesial', 14000, 'vanila.jpg', 1, 0),
(79, 'Tiramisu – Keju', 'Spesial', 14000, 'vanila.jpg', 1, 0),
(80, 'Milo – Keju', 'Spesial', 14000, 'milo.jpg', 4, 0),
(81, 'Stoberry mix Coklat', 'Spesial', 14000, 'roti1.jpg', 5, 0),
(82, 'Kacang mix Coklat', 'Spesial', 14000, 'kac.jpg', 40, 0),
(83, 'Durian mix Coklat', 'Spesial', 15000, 'roticoklat.jpg', 20, 1),
(84, 'Vanilla mix Coklat', 'Spesial', 15000, 'vanila.jpg', 20, 2),
(85, 'Greentea mix Coklat', 'Spesial', 15000, 'rotigreen.jpg', 10, 3),
(86, 'Pisang mix Coklat', 'Spesial', 15000, 'roti1.jpg', 3, 4),
(87, 'Coklat mix Keju', 'Spesial', 15000, 'roticoklat.jpg', 50, 5),
(88, 'Kacang mix Keju', 'Spesial', 15000, 'kac.jpg', 25, 0),
(89, 'Vanilla mix Keju', 'Spesial', 15000, 'vanila.jpg', 20, 0),
(90, 'Greentea mix Keju', 'Spesial', 16000, 'rotigreen.jpg', 15, 1),
(91, 'Milo mix Keju', 'Spesial', 16000, 'roti1.jpg', 20, 2),
(92, 'Kombinasi', 'Spesial', 16000, 'roti1.jpg', 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(2, 'Julian Harker', 'jule@gmail.com', '1234567890', '123', '123 Main Street'),
(3, 'Doe', 'doe@gmail.com', '0987654321', '321', '456 Oak Avenue'),
(4, 'Shaeffer', 'shaeffer@gmail.com', '0987654321', '321', '40 Oak Avenue'),
(5, 'dwiki', 'Dwiki@gmail.com', '823333', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', ''),
(6, 'Aditya', 'aditya@gmail.com', '12345678', '123', 'Blitar'),
(7, 'Putra', 'putra@gmail.com', '6538263', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Desa Jatinom, Jl. Maluku, No. 57, 1/2, jatinom, Kanigoro, blitaar - 66171'),
(8, 'joan', 'joan@gmail.com', '6131321', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', ''),
(9, 'a', 'a@gmail.com', '2435477', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', ''),
(10, 'Dwiki', 'dwikiadityaptr@gmail.com', '0872681758', '7c222fb2927d828af22f592134e8932480637c0d', 'Jatinom, Jatinom, 12, 1/2, Jatinom, Kanigoro, Blitar - 66171');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_preference` varchar(255) DEFAULT NULL,
  `price_preference` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `category_preference`, `price_preference`) VALUES
(2, 6, 'Spesial', 10000),
(3, 7, NULL, NULL),
(4, 8, 'Reguler', 15000),
(5, 9, 'Reguler', 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
