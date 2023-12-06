-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 02:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `account_management_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAllStudents` ()   BEGIN
  SELECT * FROM users;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getStudentByEmail` (IN `_email` VARCHAR(250))   BEGIN
  SELECT * FROM student WHERE email = _email;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_student` (IN `_first_name` VARCHAR(255), IN `_last_name` VARCHAR(255), IN `_email` VARCHAR(255), IN `_department` VARCHAR(255), IN `_password` VARCHAR(255), IN `_role` VARCHAR(255))  SQL SECURITY INVOKER BEGIN
    INSERT INTO users(first_name, last_name, email, department, password, role)
      VALUES(_first_name, _last_name, _email, _department, _password, _role);
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_signInStudent` (IN `_email` VARCHAR(255), IN `_password` VARCHAR(255))   BEGIN
  SELECT * FROM student WHERE email = _email && password = _password;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `department`, `password`, `role`) VALUES
(1, 'joren', 'sumagang', 'sumagangjoren@gmail.com', 'BSIT', 'asdasd', 'student'),
(2, 'john', 'DOe', 'john@doe.com', 'BSIT', 'asdasd', 'student'),
(3, 'Hev', 'Abi', 'hev@abi.com', 'BSIT', 'asdasd', 'student'),
(4, 'Hev', 'Abi', 'hev@abi.com', 'BSIT', 'asdasd', 'student'),
(5, 'DUmbass', 'Nigga', 'dumb@assnigga.com', 'BSIT', 'asdasd', 'student'),
(6, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSED', 'asdasd', 'student'),
(7, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSIT', 'asdasd', 'student'),
(8, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSIT', 'asdasd', 'student'),
(9, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSIT', 'asdasd', 'student'),
(10, 'Joren', 'Sumagang', 'joren@email.com', 'null', 'dsfsafd', 'student'),
(11, 'asdas', 'asdsa', 'joren@email.com', 'BSED', 'asdasd', 'student'),
(12, 'asdas', 'asdasd', 'sumagangjoren@gmail.com', 'BEED', 'asdas', 'student'),
(13, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSHM', 'asdasd', 'student'),
(14, 'Joren', 'Sumagang', 'asdasda@asd', 'BEED', 'asdasd', 'student'),
(15, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSIT', 'asdasd', 'student'),
(16, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BEED', 'asdasd', 'student'),
(17, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSIT', 'asdasd', 'student'),
(18, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSIT', 'asdasd', 'student'),
(19, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSIT', 'asdasd', 'student'),
(20, 'Joren', 'Sumagang', 'sumagangjoren@gmail.com', 'BSIT', 'asdasd', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
