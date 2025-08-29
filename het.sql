-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2025 at 11:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `het`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addExpense` (IN `user_id4` INT(20), IN `amount4` DOUBLE, IN `category4` VARCHAR(20), IN `,description4` VARCHAR(20), IN `expense_date4` DATE)   BEGIN
INSERT INTO expenses (user_id, amount, category, description, expense_date) VALUES (user_id4, amount, category4, description4, expense_date4);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addIncome` (IN `user_id3` INT(20), IN `amount3` DOUBLE, IN `source3` VARCHAR(20), IN `income_date1` DATE)   BEGIN
INSERT INTO income (user_id, amount, source, income_date) VALUES (user_id3, amount3, source3, income_date3);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserIncome` (IN `user_id5` INT(20))   BEGIN
SELECT * FROM income WHERE user_id = user_id5 ORDER BY income_date DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `username2` VARCHAR(20), IN `password2` VARCHAR(20))   BEGIN
SELECT * FROM users WHERE username =username2  AND password = password2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registerUser` (IN `username1` VARCHAR(20), IN `password1` VARCHAR(20), IN `email1` VARCHAR(20), IN `full_name1` VARCHAR(20), IN `is_admin1` BOOLEAN)   BEGIN
INSERT INTO users (username,password, email, full_name, is_admin) VALUES (username1,password1, email1, full_name1, is_admin1);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `budget_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `expense_date` date NOT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `is_essential` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expense_id`, `user_id`, `amount`, `category`, `description`, `expense_date`, `payment_method`, `is_essential`, `created_at`) VALUES
(1, 32, 200.00, 'food', 'fo', '2025-07-15', NULL, 1, '2025-08-02 09:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `income_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `source` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `income_date` date NOT NULL,
  `recurring` tinyint(1) DEFAULT 0,
  `recurring_frequency` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`income_id`, `user_id`, `amount`, `source`, `description`, `income_date`, `recurring`, `recurring_frequency`, `created_at`) VALUES
(10, 32, 10000.00, 'job', NULL, '2024-06-12', 0, NULL, '2025-08-02 07:56:37'),
(11, 32, 10000.00, 'job', NULL, '2024-03-01', 0, NULL, '2025-08-02 08:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `investment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `current_value` decimal(12,2) DEFAULT NULL,
  `return_rate` decimal(5,2) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `investments`
--

INSERT INTO `investments` (`investment_id`, `user_id`, `name`, `type`, `amount`, `current_value`, `return_rate`, `start_date`, `end_date`, `description`, `created_at`) VALUES
(8, 32, 'share', 'finance', 5000.00, NULL, 15.00, '2025-01-01', '2025-03-01', NULL, '2025-08-02 07:57:42');

-- --------------------------------------------------------

--
-- Table structure for table `investment_advice`
--

CREATE TABLE `investment_advice` (
  `advice_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `advice` text NOT NULL,
  `min_amount` decimal(10,2) NOT NULL,
  `max_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investment_returns`
--

CREATE TABLE `investment_returns` (
  `return_id` int(11) NOT NULL,
  `investment_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `return_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `investment_returns`
--

INSERT INTO `investment_returns` (`return_id`, `investment_id`, `amount`, `return_date`, `description`, `created_at`) VALUES
(2, 8, 4000.00, '2025-07-01', NULL, '2025-08-02 08:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `full_name`, `is_admin`, `created_at`, `last_login`) VALUES
(24, 'prince', 'Prince@2007', 'P@gmail.com', 'prince dhakecha', 0, '2025-07-23 19:58:43', NULL),
(26, 'het', '\'Het@2007', 'het@2007', 'bharodiya het', 1, '2025-07-24 16:56:27', NULL),
(29, 'manav', 'Het@2007', 'Manav@gmail.com', 'manav patel', 1, '2025-08-02 07:40:54', NULL),
(30, 'jainil', 'jainil@2007', 'JAy@gamil.com', 'jainilbhalani', 1, '2025-08-02 07:42:53', NULL),
(32, 'ram', '12345678', 'jaubhuva1@', 'j', 0, '2025-08-02 07:54:12', NULL),
(33, 'prem', '12345678', 'p@', 'p', 1, '2025-08-02 08:58:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_advice`
--

CREATE TABLE `user_advice` (
  `advice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `advice` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_advice`
--

INSERT INTO `user_advice` (`advice_id`, `user_id`, `advice`) VALUES
(1, 30, 's'),
(2, 5, 'd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`budget_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`income_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`investment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `investment_advice`
--
ALTER TABLE `investment_advice`
  ADD PRIMARY KEY (`advice_id`);

--
-- Indexes for table `investment_returns`
--
ALTER TABLE `investment_returns`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `investment_id` (`investment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_advice`
--
ALTER TABLE `user_advice`
  ADD PRIMARY KEY (`advice_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `budget_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `investment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `investment_advice`
--
ALTER TABLE `investment_advice`
  MODIFY `advice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investment_returns`
--
ALTER TABLE `investment_returns`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user_advice`
--
ALTER TABLE `user_advice`
  MODIFY `advice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `budgets`
--
ALTER TABLE `budgets`
  ADD CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `investments`
--
ALTER TABLE `investments`
  ADD CONSTRAINT `investments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `investment_returns`
--
ALTER TABLE `investment_returns`
  ADD CONSTRAINT `investment_returns_ibfk_1` FOREIGN KEY (`investment_id`) REFERENCES `investments` (`investment_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
