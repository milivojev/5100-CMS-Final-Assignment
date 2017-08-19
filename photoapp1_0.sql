-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 19, 2017 at 04:51 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `photoapp1_0`
--

-- --------------------------------------------------------

--
-- Table structure for table `alarms`
--

CREATE TABLE `alarms` (
  `id` int(3) NOT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alarms`
--

INSERT INTO `alarms` (`id`, `title`) VALUES
(1, '1 day'),
(2, '3 days'),
(3, '7 days');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(6) NOT NULL,
  `title` varchar(45) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(3) NOT NULL,
  `bookmark_category_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `title`, `link`, `description`, `user_id`, `bookmark_category_id`) VALUES
(1, 'hdr', 'https://photofocus.com/learning-centers/hdr', 'learn hdr', 4, 4),
(3, 'portrait', 'www.p[ortrait.com/fsd', NULL, 1, 3),
(14, 'uradi sam', 'doityourself.com', 'svasta nesto', 14, 17),
(15, 'places to visit in Berlin', 'www.berlinaplacetobe.com/article123', NULL, 14, 18);

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_categories`
--

CREATE TABLE `bookmark_categories` (
  `id` int(3) NOT NULL,
  `title` varchar(45) NOT NULL,
  `user_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookmark_categories`
--

INSERT INTO `bookmark_categories` (`id`, `title`, `user_id`) VALUES
(2, 'macro', 1),
(3, 'portraits', 1),
(4, 'tech', 1),
(6, 'tech', 4),
(8, 'photoshop', 4),
(11, 'equipment', 4),
(17, 'practices', 14),
(18, 'to read', 14),
(19, 'foto', 17),
(20, 'film', 17),
(21, 'putovanja', 17),
(22, 'teorija zavere', 17);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(6) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `nick_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `user_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `nick_name`, `phone`, `adress`, `email`, `user_id`) VALUES
(1, 'caj', 'soljicic', 'solja', '013123321', 'mokra 2', '', 1),
(2, 'Bojana', '', 'Boca', '', '', 'bojana@gmail.com', 4),
(3, 'Dejan', 'Caukic', 'Cuki & Gaga 1', '068345345', '', 'cukic@gmail.com', 4),
(7, 'pera', 'detlic', 'pera detlic', NULL, 'sumska 2', 'woodpecker@darkwood.com', 1),
(9, 'djulic1', 'djule', 'djulic prvi', '', '', '', 14),
(10, 'pera', 'detlic', 'pera letic', '', '', '', 14),
(11, 'zum', 'turum', 'zumturum', '', '', '', 14),
(12, 'momcilo', 'bajagic', 'bajaga', '', '', 'v220@muzikanastruju.rs', 14),
(13, 'Chuck', 'Noris', 'Chuck', '1', '', '1canbefirstletter@ofmail.com', 14),
(14, 'peric', 'milic', 'vukasinovic', '+381691455167', 'Kulska 2, Dojcinovci', 'vatrenipoljubac@gmail.com', 17),
(28, '', '', '', '', '', '', 14);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `shootings`
--

CREATE TABLE `shootings` (
  `id` int(6) NOT NULL,
  `shooting_category_id` int(3) NOT NULL,
  `customer_id` int(6) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `expences` varchar(45) DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `alarm_id` int(3) NOT NULL,
  `notes` varchar(600) DEFAULT NULL,
  `user_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shootings`
--

INSERT INTO `shootings` (`id`, `shooting_category_id`, `customer_id`, `description`, `price`, `expences`, `date_created`, `event_date`, `alarm_id`, `notes`, `user_id`) VALUES
(5, 5, 2, 'bla bla truc truc', '200', '0', '2017-08-09 11:07:56', '2017-08-24 00:00:00', 2, 'zipa zipa', 4),
(6, 7, 3, 'truc truc', '2000', '0', '2017-08-09 11:10:05', '2017-08-29 00:00:00', 3, NULL, 4),
(8, 21, 11, '2 solje, 2 lavora', '', '', '2017-08-13 00:00:00', '2017-08-13 14:58:05', 1, '', 14),
(9, 3, 1, '2 portreta solje u studiju', '200', '10', '2017-08-13 00:00:00', '2017-08-13 14:59:14', 1, 'kupi 2 piva', 1),
(10, 21, 10, 'my fist wedding shooting', '', '', '2017-08-13 00:00:00', '2017-08-13 15:01:20', 1, '', 14);

-- --------------------------------------------------------

--
-- Table structure for table `shooting_categories`
--

CREATE TABLE `shooting_categories` (
  `id` int(3) NOT NULL,
  `title` varchar(45) NOT NULL,
  `user_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shooting_categories`
--

INSERT INTO `shooting_categories` (`id`, `title`, `user_id`) VALUES
(2, 'portraits', 1),
(3, 'studio', 1),
(5, 'weddings', 4),
(6, 'birthdays', 4),
(7, 'christenings', 4),
(8, 'events', 4),
(19, 'ajsad bre', 1),
(20, 'wedding', 14),
(21, 'products', 14),
(22, 'christenings', 14),
(23, 'sports', 17),
(24, 'races', 17),
(25, 'public events', 17),
(26, 'for SAE agency', 17),
(27, 'VPD kovin', 14);

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` int(9) NOT NULL,
  `todo` varchar(45) NOT NULL,
  `completed` binary(1) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_alarm` datetime DEFAULT NULL,
  `user_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `name` varchar(45) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `gmail` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role_id`, `name`, `logo`, `facebook`, `instagram`, `gmail`, `youtube`) VALUES
(1, 'mrkela', '7f03283fc2966f7ae6a451db493ac9ae', 2, 'mitar mrkela', '', 'http://www.facebook.com', 'sdfs', 'dfg', 'dd'),
(4, 'vas.milivoj@gmail.com', '7f03283fc2966f7ae6a451db493ac9ae', 1, 'milivojsa', NULL, 'bla', NULL, NULL, NULL),
(14, 'zmajJova@gmail.com', '7f03283fc2966f7ae6a451db493ac9ae', 2, 'zmajJova', '', 'https://www.facebook.com/login.php?login_attempt=1&lwv=111', 'https://www.instagram.com/?hl=sr', 'https://www.gmail.com', 'https://www.youtube.com/'),
(17, 'user1@gmail.com', '7f03283fc2966f7ae6a451db493ac9ae', 2, 'user1', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users1`
--

CREATE TABLE `users1` (
  `id` int(3) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `gmail` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users1`
--

INSERT INTO `users1` (`id`, `email`, `password`, `role_id`, `name`, `logo`, `facebook`, `instagram`, `gmail`, `youtube`) VALUES
(1, 'mitar@mrkela', 'dfsdf', 1, 'sdfsdf', 'dobar cv.jpg', '', '', '', ''),
(9, 'mica@gmail.com', 'sdfsd', 2, 'mica', NULL, NULL, NULL, NULL, NULL),
(11, 'mili@gmail.com', '7f03283fc2966f7ae6a451db493ac9ae', 2, 'mili', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_details`
--

CREATE TABLE `users_details` (
  `id` int(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  `logo` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `facebook` varchar(45) DEFAULT NULL,
  `instagram` varchar(45) DEFAULT NULL,
  `gmail` varchar(45) DEFAULT NULL,
  `custom_link1` varchar(45) DEFAULT NULL,
  `user_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_details`
--

INSERT INTO `users_details` (`id`, `name`, `logo`, `website`, `facebook`, `instagram`, `gmail`, `custom_link1`, `user_id`) VALUES
(1, 'Milivoj', NULL, 'www.milvojevphoto.com', 'www.facebook.com/sdsd', 'www.instagram.com/sdf?SDf', 'www.gmail.com/user-?dfs', 'dsfsd', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alarms`
--
ALTER TABLE `alarms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bookmarks_users1_idx` (`user_id`),
  ADD KEY `fk_bookmarks_bookmark_categories1_idx` (`bookmark_category_id`);

--
-- Indexes for table `bookmark_categories`
--
ALTER TABLE `bookmark_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shootings`
--
ALTER TABLE `shootings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shootings_customers1_idx` (`customer_id`),
  ADD KEY `fk_shootings_shooting_categories1_idx` (`shooting_category_id`),
  ADD KEY `fk_shootings_users1_idx` (`user_id`),
  ADD KEY `fk_shootings_alarms1_idx` (`alarm_id`);

--
-- Indexes for table `shooting_categories`
--
ALTER TABLE `shooting_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_todos_users1_idx` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_rolls1_idx` (`role_id`);

--
-- Indexes for table `users1`
--
ALTER TABLE `users1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_rolls1_idx` (`role_id`);

--
-- Indexes for table `users_details`
--
ALTER TABLE `users_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_details_users_idx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `bookmark_categories`
--
ALTER TABLE `bookmark_categories`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `shootings`
--
ALTER TABLE `shootings`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `shooting_categories`
--
ALTER TABLE `shooting_categories`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `users1`
--
ALTER TABLE `users1`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users_details`
--
ALTER TABLE `users_details`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `fk_bookmarks_bookmark_categories1` FOREIGN KEY (`bookmark_category_id`) REFERENCES `bookmark_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bookmarks_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `bookmark_categories`
--
ALTER TABLE `bookmark_categories`
  ADD CONSTRAINT `bookmark_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shootings`
--
ALTER TABLE `shootings`
  ADD CONSTRAINT `fk_shootings_alarms1` FOREIGN KEY (`alarm_id`) REFERENCES `alarms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_shootings_customers1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_shootings_shooting_categories1` FOREIGN KEY (`shooting_category_id`) REFERENCES `shooting_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_shootings_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shooting_categories`
--
ALTER TABLE `shooting_categories`
  ADD CONSTRAINT `fk_shooting_categories_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `todos`
--
ALTER TABLE `todos`
  ADD CONSTRAINT `fk_todos_users1` FOREIGN KEY (`user_id`) REFERENCES `users1` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users1`
--
ALTER TABLE `users1`
  ADD CONSTRAINT `fk_users_rolls1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_details`
--
ALTER TABLE `users_details`
  ADD CONSTRAINT `fk_users_details_users` FOREIGN KEY (`user_id`) REFERENCES `users1` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
