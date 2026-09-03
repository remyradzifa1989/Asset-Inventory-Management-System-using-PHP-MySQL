-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2026 at 03:23 AM
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
-- Database: `admin_aims`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `created_at`) VALUES
(1, 3, 'LOGOUT', 'User logged out', '2026-05-18 12:42:56'),
(2, 3, 'LOGIN', 'User logged in', '2026-05-18 15:53:19'),
(3, 3, 'LOGOUT', 'User logged out', '2026-05-18 15:53:27'),
(4, 8, 'ASSET_CREATE', 'Created asset #35', '2026-05-18 16:07:14'),
(5, 8, 'ASSET_CREATE', 'Created asset #0', '2026-05-18 16:07:14'),
(6, 3, 'LOGIN', 'User logged in', '2026-05-18 16:09:15'),
(7, 3, 'ASSET_CREATE', 'Created asset #37', '2026-05-18 16:09:58'),
(8, 3, 'ASSET_DELETE', 'Deleted asset #37', '2026-05-18 16:10:36'),
(9, 3, 'LOGIN', 'User logged in', '2026-05-18 16:23:57'),
(10, 3, 'ASSET_UPDATE', 'Updated asset #35', '2026-05-18 16:24:11'),
(11, 8, 'ASSET_UPDATE', 'Updated asset #35', '2026-05-18 17:04:58'),
(12, 3, 'LOGIN', 'User logged in', '2026-05-18 19:13:44'),
(13, 3, 'ASSET_CREATE', 'Created asset #38', '2026-05-18 19:51:18'),
(14, 3, 'BORROW_CREATE', 'Borrow record for asset #38', '2026-05-18 19:52:00'),
(15, 3, 'BORROW_RETURN', 'Returned borrow #16', '2026-05-18 19:52:24'),
(16, 3, 'MAINT_CREATE', 'Maintenance for asset #38', '2026-05-18 19:52:46'),
(17, 3, 'MAINT_COMPLETE', 'Completed maintenance #5', '2026-05-18 19:53:01'),
(18, 3, 'BORROW_DELETE', 'Deleted borrow #16', '2026-05-18 19:53:15'),
(19, 3, 'ASSET_DELETE', 'Deleted asset #38', '2026-05-18 19:53:24'),
(20, 3, 'ASSET_UPDATE', 'Updated asset #35', '2026-05-18 20:21:16'),
(21, 3, 'LOGOUT', 'User logged out', '2026-05-18 21:01:15'),
(22, 3, 'LOGIN', 'User logged in', '2026-05-18 21:03:50'),
(23, 3, 'LOGOUT', 'User logged out', '2026-05-18 21:20:44'),
(24, 8, 'LOGIN', 'User logged in', '2026-05-19 10:11:12'),
(25, 8, 'LOGOUT', 'User logged out', '2026-05-19 10:17:27'),
(26, 8, 'LOGIN', 'User logged in', '2026-05-19 10:17:38'),
(27, 3, 'LOGIN', 'User logged in', '2026-05-19 10:31:48'),
(28, 8, 'ASSET_CREATE', 'Created asset #39', '2026-05-19 10:48:48'),
(29, 8, 'LOGOUT', 'User logged out', '2026-05-19 10:48:52'),
(30, 3, 'ASSET_UPDATE', 'Updated asset #39', '2026-05-20 09:01:31'),
(31, 3, 'LOGOUT', 'User logged out', '2026-05-20 09:03:05'),
(32, 3, 'LOGOUT', 'User logged out', '2026-05-20 09:03:34'),
(33, 3, 'LOGIN', 'User logged in', '2026-05-20 09:10:17'),
(34, 3, 'LOGOUT', 'User logged out', '2026-05-20 09:14:54'),
(35, 2, 'LOGIN', 'User logged in', '2026-05-20 09:15:06'),
(36, 2, 'LOGOUT', 'User logged out', '2026-05-20 09:17:36'),
(37, 2, 'LOGIN', 'User logged in', '2026-05-20 09:45:22'),
(38, 2, 'LOGOUT', 'User logged out', '2026-05-20 11:13:46'),
(39, 2, 'LOGIN', 'User logged in', '2026-05-21 09:47:10'),
(40, 2, 'LOGOUT', 'User logged out', '2026-05-21 09:47:48'),
(41, 3, 'LOGIN', 'User logged in', '2026-05-21 15:15:59'),
(42, 3, 'LOGOUT', 'User logged out', '2026-05-21 15:16:08'),
(43, 3, 'LOGIN', 'User logged in', '2026-05-22 15:42:42'),
(44, 3, 'LOGOUT', 'User logged out', '2026-05-22 15:42:46'),
(45, 3, 'LOGIN', 'User logged in', '2026-05-26 08:54:03'),
(46, 3, 'LOGOUT', 'User logged out', '2026-05-26 08:55:06'),
(47, 3, 'LOGIN', 'User logged in', '2026-05-26 12:14:47'),
(48, 3, 'LOGOUT', 'User logged out', '2026-05-26 12:17:17'),
(49, 3, 'LOGIN', 'User logged in', '2026-05-28 10:03:14'),
(50, 3, 'LOGOUT', 'User logged out', '2026-05-28 10:03:48'),
(51, 8, 'LOGIN', 'User logged in', '2026-05-28 10:08:19'),
(52, 8, 'ASSET_UPDATE', 'Updated asset #39', '2026-05-28 10:14:15'),
(53, 8, 'ASSET_UPDATE', 'Updated asset #39', '2026-05-28 10:19:45'),
(54, 3, 'LOGIN', 'User logged in', '2026-05-28 10:20:06'),
(55, 8, 'ASSET_CREATE', 'Created asset #0', '2026-05-28 10:25:44'),
(56, 8, 'ASSET_CREATE', 'Created asset #0', '2026-05-28 10:26:16'),
(57, 8, 'ASSET_CREATE', 'Created asset #42', '2026-05-28 10:26:27'),
(58, 8, 'ASSET_UPDATE', 'Updated asset #42', '2026-05-28 10:26:34'),
(59, 8, 'ASSET_UPDATE', 'Updated asset #42', '2026-05-28 10:26:43'),
(60, 8, 'ASSET_DELETE', 'Deleted asset #42', '2026-05-28 10:30:53'),
(61, 8, 'ASSET_UPDATE', 'Updated asset #39', '2026-05-28 10:35:55'),
(62, 3, 'LOGOUT', 'User logged out', '2026-05-28 10:38:46'),
(63, 3, 'LOGIN', 'User logged in', '2026-05-28 10:38:56'),
(64, 3, 'LOGOUT', 'User logged out', '2026-05-28 10:39:10'),
(65, 8, 'ASSET_CREATE', 'Created asset #43', '2026-05-28 10:45:18'),
(66, 8, 'ASSET_CREATE', 'Created asset #44', '2026-05-28 10:53:31'),
(67, 3, 'LOGIN', 'User logged in', '2026-05-28 10:53:57'),
(68, 3, 'LOGOUT', 'User logged out', '2026-05-28 10:57:00'),
(69, 8, 'ASSET_CREATE', 'Created asset #45', '2026-05-28 11:09:00'),
(70, 8, 'ASSET_CREATE', 'Created asset #46', '2026-05-28 11:15:10'),
(71, 3, 'LOGIN', 'User logged in', '2026-05-28 11:19:14'),
(72, 3, 'LOGOUT', 'User logged out', '2026-05-28 11:23:07'),
(73, 3, 'LOGIN', 'User logged in', '2026-05-28 11:28:55'),
(74, 3, 'LOGOUT', 'User logged out', '2026-05-28 11:28:58'),
(75, 3, 'LOGIN', 'User logged in', '2026-05-28 12:42:11'),
(76, 8, 'ASSET_UPDATE', 'Updated asset #43', '2026-05-28 12:52:05'),
(77, 8, 'BORROW_CREATE', 'Borrow record for asset #43', '2026-05-28 12:53:04'),
(78, 8, 'BORROW_RETURN', 'Returned borrow #17', '2026-05-28 12:53:36'),
(79, 8, 'BORROW_CREATE', 'Borrow record for asset #43', '2026-05-28 12:54:01'),
(80, 8, 'BORROW_RETURN', 'Returned borrow #18', '2026-05-28 12:54:32'),
(81, 8, 'BORROW_DELETE', 'Deleted borrow #18', '2026-05-28 12:54:41'),
(82, 8, 'BORROW_DELETE', 'Deleted borrow #17', '2026-05-28 12:54:43'),
(83, 8, 'ASSET_UPDATE', 'Updated asset #43', '2026-05-28 12:54:53'),
(84, 3, 'LOGOUT', 'User logged out', '2026-05-28 13:03:21'),
(85, 3, 'LOGIN', 'User logged in', '2026-05-28 13:03:46'),
(86, 3, 'LOGOUT', 'User logged out', '2026-05-28 14:44:18'),
(87, 3, 'LOGIN', 'User logged in', '2026-06-05 10:46:55'),
(88, 3, 'LOGOUT', 'User logged out', '2026-06-05 10:47:59'),
(89, 3, 'LOGIN', 'User logged in', '2026-06-05 16:26:42'),
(90, 3, 'LOGOUT', 'User logged out', '2026-06-05 16:27:14'),
(91, 3, 'LOGIN', 'User logged in', '2026-06-05 16:56:11'),
(92, 3, 'LOGOUT', 'User logged out', '2026-06-05 16:56:14'),
(93, 3, 'LOGIN', 'User logged in', '2026-06-09 09:01:13'),
(94, 3, 'LOGOUT', 'User logged out', '2026-06-09 09:01:20'),
(95, 3, 'LOGIN', 'User logged in', '2026-06-11 15:02:24'),
(96, 3, 'LOGOUT', 'User logged out', '2026-06-11 15:02:35'),
(97, 3, 'LOGIN', 'User logged in', '2026-06-12 15:31:43'),
(98, 3, 'LOGOUT', 'User logged out', '2026-06-12 15:31:57'),
(99, 3, 'LOGIN', 'User logged in', '2026-06-15 09:18:49'),
(100, 3, 'LOGOUT', 'User logged out', '2026-06-15 09:18:53'),
(101, 3, 'LOGIN', 'User logged in', '2026-06-15 11:38:14'),
(102, 3, 'LOGOUT', 'User logged out', '2026-06-15 11:44:19'),
(103, 3, 'LOGIN', 'User logged in', '2026-06-15 11:48:07'),
(104, 3, 'LOGOUT', 'User logged out', '2026-06-15 11:48:13'),
(105, 3, 'LOGIN', 'User logged in', '2026-06-15 11:54:59'),
(106, 3, 'LOGIN', 'User logged in', '2026-06-15 12:00:28'),
(107, 3, 'LOGIN', 'User logged in', '2026-06-15 12:00:43'),
(108, 3, 'LOGOUT', 'User logged out', '2026-06-15 12:01:07'),
(109, 3, 'LOGIN', 'User logged in', '2026-06-15 12:01:09'),
(110, 3, 'LOGOUT', 'User logged out', '2026-06-15 12:01:11'),
(111, 3, 'LOGIN', 'User logged in', '2026-06-15 12:02:18'),
(112, 3, 'LOGOUT', 'User logged out', '2026-06-15 12:02:49'),
(113, 3, 'LOGIN', 'User logged in', '2026-06-15 12:06:55'),
(114, 3, 'LOGOUT', 'User logged out', '2026-06-15 12:07:43'),
(115, 3, 'LOGIN', 'User logged in', '2026-06-15 12:09:29'),
(116, 3, 'LOGOUT', 'User logged out', '2026-06-15 12:09:35'),
(117, 3, 'LOGOUT', 'User logged out', '2026-06-15 12:10:13'),
(118, 3, 'LOGOUT', 'User logged out', '2026-06-15 12:11:21'),
(119, 3, 'LOGIN', 'User logged in', '2026-06-15 13:08:13'),
(120, 3, 'LOGOUT', 'User logged out', '2026-06-15 13:08:22'),
(121, 3, 'LOGIN', 'User logged in', '2026-06-15 13:11:25'),
(122, 3, 'LOGOUT', 'User logged out', '2026-06-15 13:11:37'),
(123, 3, 'LOGIN', 'User logged in', '2026-06-16 09:27:04'),
(124, 3, 'USER_CREATE', 'test', '2026-06-16 09:27:47'),
(125, 3, 'USER_DELETE', 'Deleted user #9', '2026-06-16 09:27:58'),
(126, 3, 'LOGIN', 'User logged in', '2026-06-18 15:08:28'),
(127, 3, 'LOGOUT', 'User logged out', '2026-06-18 15:08:44'),
(128, 3, 'LOGIN', 'User logged in', '2026-06-26 10:22:45'),
(129, 3, 'LOGOUT', 'User logged out', '2026-06-26 10:23:06'),
(130, 3, 'LOGIN', 'User logged in', '2026-06-26 11:54:59'),
(131, 3, 'LOGOUT', 'User logged out', '2026-06-26 11:58:57'),
(132, 3, 'LOGIN', 'User logged in', '2026-07-16 13:14:41'),
(133, 3, 'LOGOUT', 'User logged out', '2026-07-16 13:15:10'),
(134, 8, 'LOGIN', 'User logged in', '2026-07-20 10:38:57'),
(135, 8, 'ASSET_UPDATE', 'Updated asset #45', '2026-07-20 10:42:13'),
(136, 3, 'LOGIN', 'User logged in', '2026-07-20 10:42:44'),
(137, 8, 'ASSET_UPDATE', 'Updated asset #43', '2026-07-20 10:52:07'),
(138, 8, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:54:38'),
(139, 8, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:55:22'),
(140, 8, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:55:43'),
(141, 8, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:56:05'),
(142, 3, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:57:39'),
(143, 8, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:58:06'),
(144, 8, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:58:22'),
(145, 8, 'LOGOUT', 'User logged out', '2026-07-20 10:58:48'),
(146, 8, 'LOGIN', 'User logged in', '2026-07-20 10:58:51'),
(147, 8, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:59:02'),
(148, 3, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:59:30'),
(149, 3, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 10:59:59'),
(150, 3, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 11:00:15'),
(151, 8, 'ASSET_UPDATE', 'Updated asset #44', '2026-07-20 11:02:59'),
(152, 3, 'LOGIN', 'User logged in', '2026-07-20 11:25:09'),
(153, 3, 'ASSET_UPDATE', 'Updated asset #45', '2026-07-20 14:02:58'),
(154, 3, 'LOGOUT', 'User logged out', '2026-07-20 14:39:34'),
(155, 3, 'LOGIN', 'User logged in', '2026-07-23 09:43:50'),
(156, 3, 'LOGOUT', 'User logged out', '2026-07-23 10:26:06'),
(157, 3, 'LOGIN', 'User logged in', '2026-07-23 10:26:10'),
(158, 3, 'LOGOUT', 'User logged out', '2026-07-23 10:26:17'),
(159, 3, 'LOGIN', 'User logged in', '2026-07-23 10:26:32'),
(160, 3, 'LOGOUT', 'User logged out', '2026-07-23 10:27:21'),
(161, 3, 'LOGIN', 'User logged in', '2026-07-23 10:48:45'),
(162, 3, 'LOGOUT', 'User logged out', '2026-07-23 12:11:45'),
(163, 3, 'LOGIN', 'User logged in', '2026-07-23 12:18:06'),
(164, 3, 'LOGOUT', 'User logged out', '2026-07-23 15:15:47'),
(165, 3, 'LOGIN', 'User logged in', '2026-07-23 15:46:16'),
(166, 3, 'LOGOUT', 'User logged out', '2026-07-23 15:46:20'),
(167, 3, 'LOGIN', 'User logged in', '2026-07-23 15:47:22'),
(168, 3, 'LOGOUT', 'User logged out', '2026-07-23 15:47:57'),
(169, 10, 'LOGIN', 'User logged in', '2026-07-23 15:53:21'),
(170, 10, 'USER_UPDATE', 'rahimi (SUPER ADMIN)', '2026-07-23 15:53:45'),
(171, 10, 'USER_UPDATE', 'staff', '2026-07-23 15:54:16'),
(172, 10, 'USER_UPDATE', 'admin', '2026-07-23 15:54:29'),
(173, 10, 'LOGOUT', 'User logged out', '2026-07-23 15:54:38'),
(174, 1, 'LOGIN', 'User logged in', '2026-07-23 15:54:44'),
(175, 1, 'LOGOUT', 'User logged out', '2026-07-23 15:54:54'),
(176, 2, 'LOGIN', 'User logged in', '2026-07-23 15:54:59'),
(177, 2, 'LOGOUT', 'User logged out', '2026-07-23 15:55:02'),
(178, 11, 'REGISTER', 'Self-registration (pending)', '2026-07-23 16:18:04'),
(179, 3, 'LOGIN', 'User logged in', '2026-07-23 16:18:41'),
(180, 3, 'USER_APPROVE', 'Approved user #11', '2026-07-23 16:18:56'),
(181, 3, 'LOGOUT', 'User logged out', '2026-07-23 16:19:01'),
(182, 11, 'LOGIN', 'User logged in', '2026-07-23 16:19:06'),
(183, 11, 'LOGOUT', 'User logged out', '2026-07-23 16:19:10'),
(184, 3, 'LOGIN', 'User logged in', '2026-07-23 16:19:49'),
(185, 3, 'USER_UPDATE', 'test', '2026-07-23 16:20:29'),
(186, 3, 'LOGOUT', 'User logged out', '2026-07-23 16:20:34'),
(187, 11, 'LOGIN', 'User logged in', '2026-07-23 16:20:47'),
(188, 11, 'LOGOUT', 'User logged out', '2026-07-23 16:20:51'),
(189, 3, 'LOGIN', 'User logged in', '2026-07-23 17:22:16'),
(190, 3, 'DB_BACKUP', 'Muat turun backup: aims_backup_admin_aims_20260723_172228.sql', '2026-07-23 17:22:28'),
(191, 3, 'LOGOUT', 'User logged out', '2026-07-23 17:22:38'),
(192, 3, 'LOGIN', 'User logged in', '2026-07-24 09:03:03'),
(193, 3, 'LOGOUT', 'User logged out', '2026-07-24 09:28:24'),
(194, 3, 'LOGIN', 'User logged in', '2026-07-24 14:53:11'),
(195, 3, 'LOGOUT', 'User logged out', '2026-07-24 15:20:47'),
(196, 3, 'LOGIN', 'User logged in', '2026-07-24 15:20:51'),
(197, 3, 'LOGOUT', 'User logged out', '2026-07-24 15:34:08'),
(198, 3, 'LOGIN', 'User logged in', '2026-07-24 15:34:17'),
(199, 3, 'DB_BACKUP', 'Muat turun backup: aims_backup_admin_aims_20260724_153530.sql', '2026-07-24 15:35:30'),
(200, 3, 'DB_RESTORE', 'Restore dari: aims_backup_admin_aims_20260724_153543.sql', '2026-07-24 15:36:17'),
(201, 3, 'LOGIN', 'User logged in', '2026-07-24 15:40:32'),
(202, 3, 'LOGOUT', 'User logged out', '2026-07-24 15:41:06'),
(203, 1, 'LOGIN', 'User logged in', '2026-07-24 15:41:19'),
(204, 1, 'LOGOUT', 'User logged out', '2026-07-24 15:46:08'),
(205, 3, 'LOGOUT', 'User logged out', '2026-07-24 15:46:18'),
(206, 3, 'LOGIN', 'User logged in', '2026-07-24 15:46:42'),
(207, 3, 'LOGOUT', 'User logged out', '2026-07-24 15:47:10'),
(208, 1, 'LOGIN', 'User logged in', '2026-07-24 15:47:54'),
(209, 1, 'LOGIN', 'User logged in', '2026-07-24 16:10:24'),
(210, 1, 'LOGOUT', 'User logged out', '2026-07-24 16:13:02'),
(211, 1, 'LOGIN', 'User logged in', '2026-07-24 16:13:05'),
(212, 1, 'LOGOUT', 'User logged out', '2026-07-24 16:13:26'),
(213, 3, 'LOGIN', 'User logged in', '2026-07-24 16:15:12'),
(214, 3, 'LOGIN', 'User logged in', '2026-07-24 16:16:46'),
(215, 8, 'LOGIN', 'User logged in', '2026-07-24 16:17:49'),
(216, 3, 'LOGOUT', 'User logged out', '2026-07-24 16:18:10'),
(217, 3, 'LOGIN', 'User logged in', '2026-07-24 16:18:55'),
(218, 3, 'DB_BACKUP', 'Muat turun backup: aims_backup_admin_aims_20260724_162025.sql', '2026-07-24 16:20:25'),
(219, 3, 'LOGOUT', 'User logged out', '2026-07-24 16:21:43'),
(220, 1, 'LOGOUT', 'User logged out', '2026-07-24 16:22:29'),
(221, 3, 'LOGIN', 'User logged in', '2026-07-24 16:22:45'),
(222, 3, 'LOGOUT', 'User logged out', '2026-07-24 16:22:51'),
(223, 3, 'LOGIN', 'User logged in', '2026-07-24 16:54:05'),
(224, 3, 'LOGIN', 'User logged in', '2026-07-24 16:59:03'),
(225, 3, 'LOGOUT', 'User logged out', '2026-07-24 17:00:04'),
(226, 3, 'LOGIN', 'User logged in', '2026-07-24 17:16:51'),
(227, 3, 'LOGIN', 'User logged in', '2026-07-25 23:13:26'),
(228, 3, 'LOGOUT', 'User logged out', '2026-07-25 23:14:56'),
(229, 3, 'LOGIN', 'User logged in', '2026-07-28 09:11:40'),
(230, 3, 'LOGIN', 'User logged in', '2026-07-28 09:12:17'),
(231, 3, 'LOGOUT', 'User logged out', '2026-07-28 09:14:13'),
(232, 3, 'LOGIN', 'User logged in', '2026-07-28 09:49:59'),
(233, 3, 'LOGOUT', 'User logged out', '2026-07-28 13:23:18'),
(234, 3, 'LOGIN', 'User logged in', '2026-07-28 13:23:29'),
(235, 3, 'LOGIN', 'User logged in', '2026-07-28 13:41:21'),
(236, 3, 'USER_DELETE', 'Deleted user #11', '2026-07-28 13:41:56'),
(237, 3, 'SYSTEM_LOCK_SCHEDULE', 'Jadual kunci: 2026-07-28 14:44:00', '2026-07-28 13:42:55'),
(238, 3, 'LOGOUT', 'User logged out', '2026-07-28 13:43:06'),
(239, 3, 'LOGOUT', 'User logged out', '2026-07-28 13:44:03'),
(240, 1, 'LOGIN', 'User logged in', '2026-07-28 13:44:12'),
(241, 1, 'LOGOUT', 'User logged out', '2026-07-28 13:44:14'),
(242, 1, 'LOGIN', 'User logged in', '2026-07-28 13:44:51'),
(243, 1, 'LOGOUT', 'User logged out', '2026-07-28 13:44:59'),
(244, 1, 'LOGIN', 'User logged in', '2026-07-28 13:45:00'),
(245, 1, 'LOGOUT', 'User logged out', '2026-07-28 13:45:02'),
(246, 3, 'LOGIN', 'User logged in', '2026-07-28 13:45:11'),
(247, 3, 'SYSTEM_LOCK_SCHEDULE', 'Jadual kunci: 2026-07-28 14:47:00', '2026-07-28 13:45:59'),
(248, 3, 'SYSTEM_LOCK_SCHEDULE', 'Jadual kunci: 2026-07-28 14:47:00', '2026-07-28 13:46:19'),
(249, 3, 'SYSTEM_LOCK_SCHEDULE', 'Jadual kunci: 2026-07-28 13:49:00', '2026-07-28 13:46:37'),
(250, 3, 'LOGOUT', 'User logged out', '2026-07-28 13:46:48'),
(251, 3, 'LOGIN', 'User logged in', '2026-07-28 13:48:28'),
(252, 3, 'LOGOUT', 'User logged out', '2026-07-28 13:48:31'),
(253, 1, 'LOGIN', 'User logged in', '2026-07-28 13:49:42'),
(254, 1, 'LOGOUT', 'User logged out', '2026-07-28 13:49:53'),
(255, 3, 'LOGIN', 'User logged in', '2026-07-28 13:50:00'),
(256, 3, 'SYSTEM_LOCK_CANCEL', 'Batal jadual kunci', '2026-07-28 13:50:10'),
(257, 3, 'LOGOUT', 'User logged out', '2026-07-28 13:50:15'),
(258, 1, 'LOGIN', 'User logged in', '2026-07-28 13:50:20'),
(259, 1, 'LOGOUT', 'User logged out', '2026-07-28 13:50:31'),
(260, 3, 'LOGIN', 'User logged in', '2026-07-28 15:57:21'),
(261, 3, 'LOGOUT', 'User logged out', '2026-07-28 15:57:52'),
(262, 3, 'LOGIN', 'User logged in', '2026-07-28 16:05:55'),
(263, 3, 'SYSTEM_LOCK_SCHEDULE', 'Jadual kunci: 2026-09-20 00:00:00', '2026-07-28 16:07:18'),
(264, 3, 'LOGIN', 'User logged in', '2026-07-28 16:08:25'),
(265, 3, 'LOGOUT', 'User logged out', '2026-07-28 16:08:36'),
(266, 3, 'LOGIN', 'User logged in', '2026-08-07 16:21:19'),
(267, 3, 'LOGOUT', 'User logged out', '2026-08-07 16:24:39'),
(268, 3, 'LOGIN', 'User logged in', '2026-08-07 16:27:24'),
(269, 3, 'LOGOUT', 'User logged out', '2026-08-07 16:32:34'),
(270, 3, 'LOGIN', 'User logged in', '2026-08-08 12:10:11'),
(271, 3, 'LOGIN', 'User logged in', '2026-08-10 13:06:27'),
(272, 3, 'LOGOUT', 'User logged out', '2026-08-10 13:09:50'),
(273, 8, 'LOGIN', 'User logged in', '2026-08-19 15:09:59'),
(274, 8, 'ASSET_IMAGE_DELETE', 'Deleted main image of asset #44', '2026-08-19 15:10:49'),
(275, 8, 'ASSET_UPDATE', 'Updated asset #44', '2026-08-19 15:11:15'),
(276, 8, 'ASSET_CREATE', 'Created asset #47', '2026-08-19 15:18:04'),
(277, 8, 'ASSET_CREATE', 'Created asset #48', '2026-08-19 15:26:22'),
(278, 8, 'ASSET_CREATE', 'Created asset #49', '2026-08-19 15:29:58'),
(279, 8, 'ASSET_CREATE', 'Created asset #50', '2026-08-19 16:27:18'),
(280, 3, 'LOGIN', 'User logged in', '2026-08-19 16:27:56'),
(281, 3, 'DB_BACKUP', 'Muat turun backup: aims_backup_admin_aims_20260819_162920.sql', '2026-08-19 16:29:20'),
(282, 8, 'LOGOUT', 'User logged out', '2026-08-19 16:29:37'),
(283, 3, 'LOGIN', 'User logged in', '2026-08-19 16:32:18'),
(284, 3, 'LOGOUT', 'User logged out', '2026-08-19 16:37:24'),
(285, 3, 'LOGIN', 'User logged in', '2026-08-20 09:21:45'),
(286, 3, 'DB_BACKUP', 'Muat turun backup: aims_backup_admin_aims_20260820_092159.sql', '2026-08-20 09:21:59'),
(287, 3, 'LOGOUT', 'User logged out', '2026-08-20 09:22:17'),
(288, 3, 'LOGIN', 'User logged in', '2026-08-20 11:39:29'),
(289, 3, 'LOOKUP_CREATE', 'Department: tambah \"CHAIRMAN\"', '2026-08-20 12:19:13'),
(290, 3, 'ASSET_UPDATE', 'Updated asset #50', '2026-08-20 12:19:54'),
(291, 3, 'LOGOUT', 'User logged out', '2026-08-20 12:21:21'),
(292, 3, 'LOGIN', 'User logged in', '2026-08-20 12:22:02'),
(293, 3, 'ASSET_UPDATE', 'Updated asset #43', '2026-08-20 12:50:17'),
(294, 8, 'LOGIN', 'User logged in', '2026-08-20 12:54:34'),
(295, 3, 'LOGOUT', 'User logged out', '2026-08-20 13:02:00'),
(296, 3, 'LOGIN', 'User logged in', '2026-08-26 12:15:48'),
(297, 3, 'LOGOUT', 'User logged out', '2026-08-26 15:06:30'),
(298, 8, 'LOGIN', 'User logged in', '2026-09-01 09:45:08'),
(299, 3, 'LOGIN', 'User logged in', '2026-09-01 09:59:37'),
(300, 8, 'ASSET_CREATE', 'Created asset #51', '2026-09-01 10:09:22'),
(301, 8, 'ASSET_UPDATE', 'Updated asset #51', '2026-09-01 10:26:23'),
(302, 8, 'ASSET_UPDATE', 'Updated asset #51', '2026-09-01 10:27:29'),
(303, 8, 'ASSET_CREATE', 'Created asset #52', '2026-09-01 11:49:31'),
(304, 8, 'ASSET_UPDATE', 'Updated asset #52', '2026-09-01 11:52:39'),
(305, 8, 'ASSET_UPDATE', 'Updated asset #52', '2026-09-01 11:56:22'),
(306, 3, 'DB_BACKUP', 'Muat turun backup: aims_backup_admin_aims_20260901_115748.sql', '2026-09-01 11:57:48'),
(307, 3, 'LOGIN', 'User logged in', '2026-09-01 13:01:27'),
(308, 3, 'LOOKUP_UPDATE', 'Branch: \"ALOR SETAR, KEDAH\" → \"AS - ALOR SETAR, KEDAH\"', '2026-09-01 13:10:26'),
(309, 3, 'LOOKUP_UPDATE', 'Branch: \"KOTA BHARU, KELANTAN\" → \"KB - KOTA BHARU, KELANTAN\"', '2026-09-01 13:10:41'),
(310, 3, 'LOOKUP_UPDATE', 'Branch: \"KUCHING, SARAWAK\" → \"KU - KUCHING, SARAWAK\"', '2026-09-01 13:10:56'),
(311, 3, 'LOOKUP_UPDATE', 'Branch: \"TAMPOI, JOHOR BAHRU\" → \"JB - TAMPOI, JOHOR BAHRU\"', '2026-09-01 13:11:13'),
(312, 3, 'LOOKUP_UPDATE', 'Branch: \"BANDAR BARU BANGI, SELANGOR\" → \"BBB - BANDAR BARU BANGI, SELANGOR\" (1 rekod dikemas kini)', '2026-09-01 13:11:29'),
(313, 3, 'LOOKUP_UPDATE', 'Branch: \"BANDAR BARU SRI PERMAISURI, KUALA LUMPUR\" → \"KL - BANDAR BARU SRI PERMAISURI, KUALA LUMPUR\"', '2026-09-01 13:11:43'),
(314, 3, 'LOOKUP_UPDATE', 'Branch: \"IPOH, PERAK\" → \"-IP - IPOH, PERAK\"', '2026-09-01 13:12:10'),
(315, 3, 'LOOKUP_UPDATE', 'Branch: \"KELANA JAYA, SELANGOR\" → \"KJ - KELANA JAYA, SELANGOR\"', '2026-09-01 13:12:26'),
(316, 3, 'LOOKUP_UPDATE', 'Branch: \"-IP - IPOH, PERAK\" → \"IP - IPOH, PERAK\"', '2026-09-01 13:12:38'),
(317, 3, 'LOOKUP_UPDATE', 'Department: \"IT\" → \"IT - IT\" (5 rekod dikemas kini)', '2026-09-01 13:17:58'),
(318, 3, 'LOOKUP_UPDATE', 'Department: \"IT ASSET\" → \"IT_ASSET - IT ASSET\"', '2026-09-01 13:18:18'),
(319, 3, 'LOOKUP_UPDATE', 'Department: \"PROCESSING\" → \"PROCESSING - PROCESSING\"', '2026-09-01 13:18:43'),
(320, 3, 'LOOKUP_UPDATE', 'Department: \"SALES\" → \"SALES - SALES\"', '2026-09-01 13:18:53'),
(321, 3, 'LOOKUP_UPDATE', 'Department: \"LEGAL\" → \"LEGAL - LEGAL\"', '2026-09-01 13:19:03'),
(322, 3, 'LOOKUP_UPDATE', 'Department: \"MEMBERSHIP\" → \"MEMBERSHIP - MEMBERSHIP\"', '2026-09-01 13:19:19'),
(323, 3, 'LOOKUP_UPDATE', 'Department: \"COLLECTION\" → \"COLLECTION - COLLECTION\"', '2026-09-01 13:19:41'),
(324, 3, 'LOOKUP_UPDATE', 'Department: \"ADMIN\" → \"ADMIN - ADMIN\"', '2026-09-01 13:19:56'),
(325, 3, 'LOOKUP_UPDATE', 'Department: \"ACCOUNT\" → \"ACCOUNT - ACCOUNT\"', '2026-09-01 13:20:07'),
(326, 3, 'LOOKUP_UPDATE', 'Department: \"GROUP SUPPORT SERVICES\" → \"GSS - GROUP SUPPORT SERVICES\"', '2026-09-01 13:20:18'),
(327, 3, 'LOOKUP_UPDATE', 'Department: \"KDSB\" → \"KDSB - KDSB\" (2 rekod dikemas kini)', '2026-09-01 13:20:31'),
(328, 3, 'LOOKUP_UPDATE', 'Department: \"ARX\" → \"ARX - ARX\" (3 rekod dikemas kini)', '2026-09-01 13:20:47'),
(329, 3, 'LOOKUP_UPDATE', 'Department: \"KESB\" → \"KESB - KESB\"', '2026-09-01 13:21:00'),
(330, 3, 'LOOKUP_UPDATE', 'Department: \"HR\" → \"HR - HR\" (1 rekod dikemas kini)', '2026-09-01 13:21:11'),
(331, 3, 'LOOKUP_UPDATE', 'Department: \"CHAIRMAN\" → \"CHAIRMAN - CHAIRMAN\" (1 rekod dikemas kini)', '2026-09-01 13:21:21'),
(332, 3, 'ASSET_CREATE', 'Created asset #53', '2026-09-01 14:11:08'),
(333, 3, 'LOGOUT', 'User logged out', '2026-09-03 08:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `asset_code` varchar(80) NOT NULL,
  `asset_name` varchar(200) NOT NULL,
  `asset_category` varchar(100) DEFAULT NULL,
  `serial_number` varchar(150) DEFAULT NULL,
  `brand` varchar(120) DEFAULT NULL,
  `model` varchar(120) DEFAULT NULL,
  `motherboard` varchar(150) DEFAULT NULL,
  `cpu` varchar(150) DEFAULT NULL,
  `ram` varchar(100) DEFAULT NULL,
  `storage` varchar(150) DEFAULT NULL,
  `gpu` varchar(150) DEFAULT NULL,
  `psu` varchar(120) DEFAULT NULL,
  `monitor` varchar(150) DEFAULT NULL,
  `keyboard` varchar(120) DEFAULT NULL,
  `mouse` varchar(120) DEFAULT NULL,
  `os` varchar(120) DEFAULT NULL,
  `use_by` varchar(150) DEFAULT NULL,
  `department` varchar(120) DEFAULT NULL,
  `building` varchar(120) DEFAULT NULL,
  `floor` varchar(50) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `manufacturer_year` varchar(10) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Available',
  `image` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hardware_spec_new` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hardware_spec_new`)),
  `hardware_spec` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hardware_spec`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `asset_code`, `asset_name`, `asset_category`, `serial_number`, `brand`, `model`, `motherboard`, `cpu`, `ram`, `storage`, `gpu`, `psu`, `monitor`, `keyboard`, `mouse`, `os`, `use_by`, `department`, `building`, `floor`, `location`, `manufacturer_year`, `purchase_date`, `warranty_date`, `status`, `image`, `remarks`, `created_at`, `hardware_spec_new`, `hardware_spec`) VALUES
(35, 'KW/HQ/IT/01', 'PC', 'DESKTOP', '-', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AHMAD DANIEL PUTRA', 'IT - IT', 'HQ - KELANA JAYA', '1', 'BLOCK C', '2018', NULL, NULL, 'Used By', '', '', '2026-05-18 16:07:14', NULL, '[{\"type\":\"motherboard\",\"value\":\"ASUS PRIME H310M-K R2.0\"},{\"type\":\"motherboard\",\"value\":\"Intel\\u00ae Pentium\\u00ae Gold G5400 Processor 4M Cache, 3.70 GHz\"},{\"type\":\"ram\",\"value\":\"KINGSTON DDR4 4GB\"},{\"type\":\"ram\",\"value\":\"KINGSTON DDR4 4GB\"},{\"type\":\"storage\",\"value\":\"KINGSTON SA400S37120G 120GB SSD\"},{\"type\":\"gpu\",\"value\":\"NVIDIA GT 730 2GB\"},{\"type\":\"monitor\",\"value\":\"SAMSUNG Monitor LED 19\\\" S19F350HNE\"},{\"type\":\"psu\",\"value\":\"AVF PS500 - F1V2\"},{\"type\":\"keyboard\",\"value\":\"WIRED DELL CN-0GVWNX-71616-47P-0Q9P-A00\"},{\"type\":\"mouse\",\"value\":\"WIRED ACER MS1120011524503B68K701\"},{\"type\":\"os\",\"value\":\"Windows 10 Pro\"}]'),
(39, 'KW/HQ/GSS/01', 'PC', 'DESKTOP', '-', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DANIAL AMRI', 'IT - IT', 'HQ - KELANA JAYA', '1', 'BLOCK C', '2024', '2025-05-19', NULL, 'Borrowed', '', '', '2026-05-19 10:48:48', NULL, '[{\"type\":\"motherboard\",\"value\":\"GIGABYTE H610M H V3 DDR4 (Rev. 1.0)\"},{\"type\":\"cpu\",\"value\":\"Intel\\u00ae Core\\u2122 i5 processor 14400 20M Cache, up to 4.70 GHz\"},{\"type\":\"ram\",\"value\":\"CORSAIR DDR4 16GB\"},{\"type\":\"ram\",\"value\":\"CORSAIR DDR4 16GB\"},{\"type\":\"os\",\"value\":\"Windows 11 Pro\"},{\"type\":\"storage\",\"value\":\"Kingston KC3000 2TB M.2 2280 NVMe Gen4 SSD\"},{\"type\":\"psu\",\"value\":\"MSI MAG A650BNL 650W Bronze Power Supply (650Watts, 80plus Bronze)\"},{\"type\":\"monitor\",\"value\":\"Philips 24E1N1100D Monitor (23.8\\\", 1920x1080, IPS, 100Hz, 4ms)\"},{\"type\":\"keyboard\",\"value\":\"Logitech MK120\"},{\"type\":\"mouse\",\"value\":\"Logitech MK120\"},{\"type\":\"others\",\"value\":\"TP-Link Archer TX20E PCI-E WiFi 6 + BT 5.2 Adapter\"}]'),
(43, 'KW/HQ/IT/02', 'PC', 'DESKTOP', '-', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MOHD RAHIMI RADZI', 'IT - IT', 'HQ - KELANA JAYA', '1', 'BLOCK C', '2025', '2025-10-17', NULL, 'Used By', 'asset_1784515927_7677.jpg', '', '2026-05-28 10:45:18', NULL, '[{\"type\":\"cpu\",\"value\":\"Intel Core Ultra 5 225 Processor\"},{\"type\":\"motherboard\",\"value\":\"Asus Prime H810M-A WiFi Motherboard DDR5\"},{\"type\":\"ram\",\"value\":\"Corsair Vengeance 32GB (2x16GB) DDR5 5600\"},{\"type\":\"storage\",\"value\":\"Lexar NM790 1TB M.2 2280 NVMe Gen4 SSD\"},{\"type\":\"psu\",\"value\":\"Silverstone Strider ST550-EF Power Supply (550 Watts, 80plus White)\"},{\"type\":\"monitor\",\"value\":\"AOC 24B15H2\\/69 Monitor (23.8\\\", 1920x1080, IPS, 100Hz, 8ms)\"},{\"type\":\"mouse\",\"value\":\"Logitech MK120\"},{\"type\":\"keyboard\",\"value\":\"Logitech MK120\"}]'),
(44, 'KW/HQ/KDSB/01', 'PC', 'DESKTOP', '-', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FADILAH', 'KDSB - KDSB', 'HQ - KELANA JAYA', '1', 'BLOCK C', '2022', '2025-08-12', NULL, 'Used By', 'asset_1787123475_2855.jpg', '', '2026-05-28 10:53:31', NULL, '[{\"type\":\"cpu\",\"value\":\"Intel Core i5 12400 Processor\"},{\"type\":\"motherboard\",\"value\":\"MSI H610M-E Motherboard DDR4\"},{\"type\":\"ram\",\"value\":\"Patriot Signature Line 16GB (1x16GB) DDR4 3200\"},{\"type\":\"ram\",\"value\":\"Patriot Signature Line 16GB (1x16GB) DDR4 3200\"},{\"type\":\"storage\",\"value\":\"Kingston NV3 1TB M.2 2280 NVMe Gen4 SSD\"},{\"type\":\"monitor\",\"value\":\"Philips 24E1N1100D Monitor (23.8\\\", 1920x1080, IPS, 120Hz, 4ms)\"},{\"type\":\"mouse\",\"value\":\"Logitech MK120\"},{\"type\":\"keyboard\",\"value\":\"Logitech MK120\"}]'),
(45, 'KW/HQ/IT/03', 'PC', 'DESKTOP', '-', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SHAZNEEL', 'IT - IT', 'HQ - KELANA JAYA', '1', 'BLOCK C', '2015', NULL, NULL, 'Outdated', '', 'OUTDATED & SLOW TO OPERATE.', '2026-05-28 11:09:00', NULL, '[{\"type\":\"motherboard\",\"value\":\"MSI B85M-E45 (MS-7817)\"},{\"type\":\"cpu\",\"value\":\"Processor Intel(R) Pentium(R) CPU G3260 @ 3.30GHz\"},{\"type\":\"ram\",\"value\":\"Kingmax DDR3 4GB 800MHz FLGF65F-D8KM9A\"},{\"type\":\"ram\",\"value\":\"Samsung DDR3 4GB 667MHz M378B5273CH0-CH9\"},{\"type\":\"storage\",\"value\":\"TOSHIBA DT01ACA050 500GB\"},{\"type\":\"os\",\"value\":\"Windows 10\"},{\"type\":\"monitor\",\"value\":\"HP 20wd\"},{\"type\":\"mouse\",\"value\":\"Logitech M170 2334AP01Y9U8\"},{\"type\":\"keyboard\",\"value\":\"Generic HP\"}]'),
(46, 'KW/HQ/IT/04', 'PC', 'DESKTOP', '-', '-', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SYUHADA', 'IT - IT', 'HQ - KELANA JAYA', '1', 'BLOCK C', '2018', NULL, NULL, 'Used By', '', '', '2026-05-28 11:15:10', NULL, '[{\"type\":\"motherboard\",\"value\":\"ASUS PRIME A320M-K\"},{\"type\":\"cpu\",\"value\":\"AMD Ryzen 3 2200G CPU @ 3.50GHz\"},{\"type\":\"ram\",\"value\":\"KINGSTON DDR4 8GB 1333MHz KF2666C16D4\\/8G\"},{\"type\":\"ram\",\"value\":\"KINGSTON DDR4 8GB 1333MHz KF2666C16D4\\/8G\"},{\"type\":\"gpu\",\"value\":\"NVIDIA GT 640 135041031931\"},{\"type\":\"storage\",\"value\":\"KINGSTON SA400S37120G 120GB\"},{\"type\":\"psu\",\"value\":\"Mbox multimedia PS-550\"},{\"type\":\"os\",\"value\":\"Windows 10\"},{\"type\":\"monitor\",\"value\":\"AOC EVQD1HA001973\"},{\"type\":\"mouse\",\"value\":\"M170 2227LZX1WUU8\"},{\"type\":\"keyboard\",\"value\":\"GIGABYTE KM5300 131675004498\"}]'),
(47, 'KW/HQ/HR/01', 'PC', 'DESKTOP', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Suzaini', 'HR - HR', 'HQ - KELANA JAYA', '13', 'BLOCK C', '2024', '2026-06-29', NULL, 'Used By', 'asset_1787123884_4372.jpg', '', '2026-08-19 15:18:04', NULL, '[{\"type\":\"cpu\",\"value\":\"Intel Core Ultra 5 245K Processor\"},{\"type\":\"motherboard\",\"value\":\"Asus B860M-AYW Gaming WiFi Motherboard DDR5\"},{\"type\":\"ram\",\"value\":\"Corsair Vengeance 16GB (1x16GB) DDR5 5600\"},{\"type\":\"storage\",\"value\":\"BIWIN NV7400 1TB M.2 2280 NVMe Gen4 SSD\"},{\"type\":\"monitor\",\"value\":\"Philips 24M2N2100NF Gaming Monitor (23.8\\\", 1920x1080, IPS, 144Hz, 0m5ms)\"},{\"type\":\"mouse\",\"value\":\"Logitech MK120\"},{\"type\":\"keyboard\",\"value\":\"Logitech MK120\"},{\"type\":\"psu\",\"value\":\"Corsair CX650 Power Supply (650 Watts, 80plus Bronze)\"}]'),
(48, 'KW/ARX/KJ/01', 'PC', 'DESKTOP', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SHAMER', 'ARX - ARX', 'HQ - KELANA JAYA', 'GROUND FLOOR', '', '2024', '2026-07-14', NULL, 'Used By', 'asset_1787124382_2531.jpg', '', '2026-08-19 15:26:22', NULL, '[{\"type\":\"cpu\",\"value\":\"Intel Core i5 14400 Processor\"},{\"type\":\"storage\",\"value\":\"Gigabyte Gen3 512GB M.2 2280 NVMe SSD\"},{\"type\":\"motherboard\",\"value\":\"MSI H610M-E Motherboard DDR4\"},{\"type\":\"mouse\",\"value\":\"Logitech MK120\"},{\"type\":\"keyboard\",\"value\":\"Logitech MK120\"},{\"type\":\"monitor\",\"value\":\"Philips 24M2N2100NF Gaming Monitor ( 23.8\\\", 1920x1080, IPS, 144Hz, 0.5ms)\"},{\"type\":\"ram\",\"value\":\"PNY 16GB DDR4 3200\"}]'),
(49, 'KW/ARX/KJ/02', 'PC', 'DESKTOP', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NORWAHIDAH', 'ARX - ARX', 'HQ - KELANA JAYA', 'GROUND FLOOR', '', '2024', '2026-07-14', NULL, 'Used By', 'asset_1787124598_7089.jpg', '', '2026-08-19 15:29:58', NULL, '[{\"type\":\"motherboard\",\"value\":\"Intel Core i5 14400 Processor\"},{\"type\":\"storage\",\"value\":\"Gigabyte Gen3 512GB M.2 2280 NVMe SSD\"},{\"type\":\"motherboard\",\"value\":\"MSI H610M-E Motherboard DDR4\"},{\"type\":\"mouse\",\"value\":\"Logitech MK120\"},{\"type\":\"keyboard\",\"value\":\"Logitech MK120\"},{\"type\":\"monitor\",\"value\":\"Philips 24M2N2100NF Gaming Monitor ( 23.8\\\", 1920x1080, IPS, 144Hz, 0.5ms)\"},{\"type\":\"ram\",\"value\":\"PNY 16GB DDR4 3200\"}]'),
(50, 'KW/CHAIRMAN/HQ/01', 'PC', 'DESKTOP', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HAFIZ', 'CHAIRMAN - CHAIRMAN', 'HQ - KELANA JAYA', '13', 'BLOCK C', '2025', '2026-08-13', NULL, 'Used By', 'asset_1787128038_1322.jpg', '', '2026-08-19 16:27:18', NULL, '[{\"type\":\"cpu\",\"value\":\"Intel Core Ultra 5 225 Processor\"},{\"type\":\"motherboard\",\"value\":\"Asus B860M-AYW Gaming WiFi Motherboard DDR5\"},{\"type\":\"ram\",\"value\":\"Lexar 16GB (1x16GB) DDR5 5600\"},{\"type\":\"storage\",\"value\":\"Predator GM9 1TB M.2 2280 NVMe Gen5 SSD\"},{\"type\":\"psu\",\"value\":\"Cooler Master MWE Gold V3 Power Supply (650 Watts, 80plus Gold, ATX 3.1, Non-Modular)\"},{\"type\":\"mouse\",\"value\":\"Logitech MK120\"},{\"type\":\"keyboard\",\"value\":\"Logitech MK120\"},{\"type\":\"monitor\",\"value\":\"Philips 24E1N1100D Monitor (23.8\\\", 1920x1080, IPS, 100Hz, 4ms)\"}]'),
(51, 'KW/HQ/KDSB/02', 'LAPTOP', 'LAPTOP', 'W3N0CV14S214137', 'ASUS', 'E1504F-ABQ050WS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADROS', 'KDSB - KDSB', 'HQ - KELANA JAYA', '1', 'BLOCK C', '2023', '2026-08-20', NULL, 'Used By', 'asset_1788229649_2544.jpg', '2 Years Global Warranty\r\n1 Year Global Warranty for Battery and Adapter\r\n1 Year ASUS Perfect Warranty\r\nFOC ASUS Wireless Mouse, Backpack\r\nASUS Wireless Mouse out of stock, replace with Logitech B175 Wireless Mouse', '2026-09-01 10:09:22', NULL, '[]'),
(52, 'KW/ARX/BANGI/01', 'PC', 'DESKTOP', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PC TELLER', 'ARX - ARX', 'BBB - BANDAR BARU BANGI, SELANGOR', '1', '', '', '2025-04-09', NULL, 'Used By', 'asset_1788234982_2419.jpg', '', '2026-09-01 11:49:31', NULL, '[{\"type\":\"cpu\",\"value\":\"Intel Core i5 12400 Processor\"},{\"type\":\"ram\",\"value\":\"Kingston Fury Beast 8GB (1x8GB) DDR4 3200\"},{\"type\":\"storage\",\"value\":\"Acer FA200 500GB M.2 2280 NVMe Gen4 SSD\"},{\"type\":\"monitor\",\"value\":\"Philips 24E1N1100D Monitor (23.8\\\", 1920x1080, IPS, 100Hz, 4ms)\"},{\"type\":\"mouse\",\"value\":\"Logitech MK120\"},{\"type\":\"keyboard\",\"value\":\"Logitech MK120\"},{\"type\":\"motherboard\",\"value\":\"Gigabyte H610M H Motherboard DDR4\"}]'),
(53, 'KW/BBB/GSS/01', 'test', 'LAPTOP', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', 'GSS - GROUP SUPPORT SERVICES', 'BBB - BANDAR BARU BANGI, SELANGOR', '4', 'test', '2009', NULL, NULL, 'Available', '', '', '2026-09-01 14:11:08', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `asset_files`
--

CREATE TABLE `asset_files` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `uploaded_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asset_files`
--

INSERT INTO `asset_files` (`id`, `asset_id`, `file_name`, `original_name`, `file_type`, `uploaded_at`) VALUES
(14, 39, 'att_1779934785_0_6032.pdf', '28052026101906.pdf', 'pdf', '2026-05-28 10:19:45'),
(15, 43, 'att_1779936318_0_2401.pdf', '28052026104442.pdf', 'pdf', '2026-05-28 10:45:18'),
(16, 44, 'att_1779936811_0_4703.pdf', '28052026105320.pdf', 'pdf', '2026-05-28 10:53:31'),
(17, 47, 'att_1787123884_0_4609.pdf', 'PC SERVER HR.pdf', 'pdf', '2026-08-19 15:18:04'),
(18, 48, 'att_1787124382_0_7987.pdf', '2 PC AR-RAHNU KJ.pdf', 'pdf', '2026-08-19 15:26:22'),
(19, 49, 'att_1787124598_0_4108.pdf', '2 PC AR-RAHNU KJ.pdf', 'pdf', '2026-08-19 15:29:58'),
(20, 50, 'att_1787128038_0_2655.pdf', 'HAFIZ MEDIA.pdf', 'pdf', '2026-08-19 16:27:18'),
(21, 51, 'att_1788229583_0_9913.pdf', 'LAPTOP EN. ADROS INVOICE.pdf', 'pdf', '2026-09-01 10:26:23'),
(22, 51, 'att_1788229583_1_7202.pdf', 'LAPTOP EN. ADROS SPEC.pdf', 'pdf', '2026-09-01 10:26:23'),
(23, 52, 'att_1788234982_0_2006.pdf', 'INVOICE TELLER BANGI ARX.pdf', 'pdf', '2026-09-01 11:56:22');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_records`
--

CREATE TABLE `borrow_records` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `borrow_by` varchar(150) NOT NULL,
  `department` varchar(120) DEFAULT NULL,
  `borrow_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `actual_return_date` date DEFAULT NULL,
  `status` enum('Pending','Approved','Returned','Late Return') NOT NULL DEFAULT 'Pending',
  `remarks` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lookups`
--

CREATE TABLE `lookups` (
  `id` int(11) NOT NULL,
  `lk_type` varchar(30) NOT NULL COMMENT 'category|department|branch|status|hardware',
  `lk_value` varchar(150) NOT NULL COMMENT 'nilai yang disimpan dalam jadual assets',
  `lk_label` varchar(150) DEFAULT NULL COMMENT 'teks paparan (untuk hardware: cpu -> CPU)',
  `lk_code` varchar(20) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_system` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = terikat pada logik sistem, tak boleh padam/rename',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lookups`
--

INSERT INTO `lookups` (`id`, `lk_type`, `lk_value`, `lk_label`, `lk_code`, `sort_order`, `is_active`, `is_system`, `created_at`) VALUES
(1, 'category', 'DESKTOP', 'DESKTOP', NULL, 10, 1, 0, '2026-08-20 12:17:11'),
(2, 'category', 'MONITOR', 'MONITOR', NULL, 20, 1, 0, '2026-08-20 12:17:11'),
(3, 'category', 'LAPTOP', 'LAPTOP', NULL, 30, 1, 0, '2026-08-20 12:17:11'),
(4, 'category', 'PROJECTOR', 'PROJECTOR', NULL, 40, 1, 0, '2026-08-20 12:17:11'),
(5, 'category', 'PRINTER', 'PRINTER', NULL, 50, 1, 0, '2026-08-20 12:17:11'),
(6, 'category', 'OTHERS', 'OTHERS', NULL, 60, 1, 0, '2026-08-20 12:17:11'),
(7, 'department', 'IT - IT', 'IT - IT', 'IT', 10, 1, 0, '2026-08-20 12:17:11'),
(8, 'department', 'IT_ASSET - IT ASSET', 'IT_ASSET - IT ASSET', 'IT_ASSET', 20, 1, 0, '2026-08-20 12:17:11'),
(9, 'department', 'PROCESSING - PROCESSING', 'PROCESSING - PROCESSING', 'PROCESSING', 30, 1, 0, '2026-08-20 12:17:11'),
(10, 'department', 'SALES - SALES', 'SALES - SALES', 'SALES', 40, 1, 0, '2026-08-20 12:17:11'),
(11, 'department', 'LEGAL - LEGAL', 'LEGAL - LEGAL', 'LEGAL', 50, 1, 0, '2026-08-20 12:17:11'),
(12, 'department', 'MEMBERSHIP - MEMBERSHIP', 'MEMBERSHIP - MEMBERSHIP', 'MEMBERSHIP', 60, 1, 0, '2026-08-20 12:17:11'),
(13, 'department', 'COLLECTION - COLLECTION', 'COLLECTION - COLLECTION', 'COLLECTION', 70, 1, 0, '2026-08-20 12:17:11'),
(14, 'department', 'ADMIN - ADMIN', 'ADMIN - ADMIN', 'ADMIN', 80, 1, 0, '2026-08-20 12:17:11'),
(15, 'department', 'ACCOUNT - ACCOUNT', 'ACCOUNT - ACCOUNT', 'ACCOUNT', 90, 1, 0, '2026-08-20 12:17:11'),
(16, 'department', 'GSS - GROUP SUPPORT SERVICES', 'GSS - GROUP SUPPORT SERVICES', 'GSS', 100, 1, 0, '2026-08-20 12:17:11'),
(17, 'department', 'KDSB - KDSB', 'KDSB - KDSB', 'KDSB', 110, 1, 0, '2026-08-20 12:17:11'),
(18, 'department', 'ARX - ARX', 'ARX - ARX', 'ARX', 120, 1, 0, '2026-08-20 12:17:11'),
(19, 'department', 'KESB - KESB', 'KESB - KESB', 'KESB', 130, 1, 0, '2026-08-20 12:17:11'),
(20, 'department', 'HR - HR', 'HR - HR', 'HR', 140, 1, 0, '2026-08-20 12:17:11'),
(21, 'branch', 'HQ - KELANA JAYA', 'HQ - KELANA JAYA', 'HQ', 10, 1, 0, '2026-08-20 12:17:11'),
(22, 'branch', 'AS - ALOR SETAR, KEDAH', 'AS - ALOR SETAR, KEDAH', 'AS', 20, 1, 0, '2026-08-20 12:17:11'),
(23, 'branch', 'KB - KOTA BHARU, KELANTAN', 'KB - KOTA BHARU, KELANTAN', 'KB', 30, 1, 0, '2026-08-20 12:17:11'),
(24, 'branch', 'KU - KUCHING, SARAWAK', 'KU - KUCHING, SARAWAK', 'KU', 40, 1, 0, '2026-08-20 12:17:11'),
(25, 'branch', 'JB - TAMPOI, JOHOR BAHRU', 'JB - TAMPOI, JOHOR BAHRU', 'JB', 50, 1, 0, '2026-08-20 12:17:11'),
(26, 'branch', 'BBB - BANDAR BARU BANGI, SELANGOR', 'BBB - BANDAR BARU BANGI, SELANGOR', 'BBB', 60, 1, 0, '2026-08-20 12:17:11'),
(27, 'branch', 'KL - BANDAR BARU SRI PERMAISURI, KUALA LUMPUR', 'KL - BANDAR BARU SRI PERMAISURI, KUALA LUMPUR', 'KL', 70, 1, 0, '2026-08-20 12:17:11'),
(28, 'branch', 'IP - IPOH, PERAK', 'IP - IPOH, PERAK', 'IP', 80, 1, 0, '2026-08-20 12:17:11'),
(29, 'branch', 'KJ - KELANA JAYA, SELANGOR', 'KJ - KELANA JAYA, SELANGOR', 'KJ', 90, 1, 0, '2026-08-20 12:17:11'),
(30, 'status', 'Available', 'Available', NULL, 10, 1, 1, '2026-08-20 12:17:11'),
(31, 'status', 'Used By', 'Used By', NULL, 20, 1, 1, '2026-08-20 12:17:11'),
(32, 'status', 'Borrowed', 'Borrowed', NULL, 30, 1, 1, '2026-08-20 12:17:11'),
(33, 'status', 'Maintenance', 'Maintenance', NULL, 40, 1, 1, '2026-08-20 12:17:11'),
(34, 'status', 'Damaged', 'Damaged', NULL, 50, 1, 0, '2026-08-20 12:17:11'),
(35, 'status', 'Disposed', 'Disposed', NULL, 60, 1, 0, '2026-08-20 12:17:11'),
(36, 'status', 'Outdated', 'Outdated', NULL, 70, 1, 0, '2026-08-20 12:17:11'),
(37, 'hardware', 'motherboard', 'Motherboard', NULL, 10, 1, 0, '2026-08-20 12:17:11'),
(38, 'hardware', 'cpu', 'CPU', NULL, 20, 1, 0, '2026-08-20 12:17:11'),
(39, 'hardware', 'ram', 'RAM', NULL, 30, 1, 0, '2026-08-20 12:17:11'),
(40, 'hardware', 'storage', 'Storage', NULL, 40, 1, 0, '2026-08-20 12:17:11'),
(41, 'hardware', 'gpu', 'GPU', NULL, 50, 1, 0, '2026-08-20 12:17:11'),
(42, 'hardware', 'psu', 'PSU', NULL, 60, 1, 0, '2026-08-20 12:17:11'),
(43, 'hardware', 'monitor', 'Monitor', NULL, 70, 1, 0, '2026-08-20 12:17:11'),
(44, 'hardware', 'keyboard', 'Keyboard', NULL, 80, 1, 0, '2026-08-20 12:17:11'),
(45, 'hardware', 'mouse', 'Mouse', NULL, 90, 1, 0, '2026-08-20 12:17:11'),
(46, 'hardware', 'os', 'Operating System', NULL, 100, 1, 0, '2026-08-20 12:17:11'),
(47, 'hardware', 'others', 'Others', NULL, 110, 1, 1, '2026-08-20 12:17:11'),
(52, 'department', 'CHAIRMAN - CHAIRMAN', 'CHAIRMAN - CHAIRMAN', 'CHAIRMAN', 150, 1, 0, '2026-08-20 12:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_records`
--

CREATE TABLE `maintenance_records` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `technician` varchar(150) NOT NULL,
  `problem` text NOT NULL,
  `maintenance_date` date NOT NULL,
  `cost` decimal(10,2) DEFAULT 0.00,
  `status` enum('Pending','In Progress','Completed') NOT NULL DEFAULT 'Pending',
  `remarks` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_requests`
--

CREATE TABLE `reset_requests` (
  `id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(80) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('pending','done') NOT NULL DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_lock`
--

CREATE TABLE `system_lock` (
  `id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `manual_lock` tinyint(1) NOT NULL DEFAULT 0,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `lock_at` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_lock`
--

INSERT INTO `system_lock` (`id`, `manual_lock`, `scheduled`, `lock_at`, `reason`, `updated_by`, `updated_at`) VALUES
(1, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','STAFF') NOT NULL DEFAULT 'STAFF',
  `department` varchar(120) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_super` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `role`, `department`, `email`, `created_at`, `is_super`, `is_active`) VALUES
(1, 'System Administrator', 'admin', '$2y$10$zFooY7Gg6bKAhbmwxjh2Pe0f9Mxpf3QwVy45WK8PoH6LdCi2mr4iK', 'ADMIN', 'IT', 'admin@company.com', '2026-05-13 09:41:02', 0, 1),
(2, 'Staff Demo', 'staff', '$2y$10$sWHOTHUY0Fd2mK27/JOo/ut7qsiva5UMWG9L4RmP8tnQHONm/ZGFq', 'STAFF', 'Operations', 'staff@company.com', '2026-05-13 09:41:02', 0, 1),
(3, 'MOHD RAHIMI BIN MOHD RADZI', 'rahimi', '$2y$10$k9BnbfkEDaol4dw/8rVFt.rSv8XIEKnBjUiWgIPTJfmXaRoTmMFBq', 'ADMIN', 'IT', 'rahimi.radzi@kowamas.com', '2026-05-15 15:25:51', 1, 1),
(8, 'AHMAD DANIEL PUTRA BIN AHMAD HAMDAN', 'daniel', '$2y$10$JdSg8XuE0CkJCXQijMcKBOzlFcJR0t1k/vgCSk6Wld06BQscoGHxW', 'ADMIN', 'IT SUPPORT ASSISTANT', 'ahmaddanielputra98@gmail.com', '2026-05-18 11:44:00', 0, 1),
(10, 'Super Admin', 'superadmin', '$2y$10$V0HBqUZFgp47PTkdJvaZluXLVHbLZBZFcAhr5lvxOB5hevKjmYdXy', 'ADMIN', 'IT', 'superadmin@kowamas.com', '2026-07-23 15:52:44', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_al_user` (`user_id`),
  ADD KEY `idx_al_created` (`created_at`),
  ADD KEY `idx_al_action` (`action`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_code` (`asset_code`),
  ADD UNIQUE KEY `uq_asset_code` (`asset_code`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_category` (`asset_category`),
  ADD KEY `idx_department` (`department`),
  ADD KEY `idx_building` (`building`),
  ADD KEY `idx_use_by` (`use_by`),
  ADD KEY `idx_serial` (`serial_number`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_name` (`asset_name`);

--
-- Indexes for table `asset_files`
--
ALTER TABLE `asset_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_id` (`asset_id`);

--
-- Indexes for table `borrow_records`
--
ALTER TABLE `borrow_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_id` (`asset_id`),
  ADD KEY `idx_b_status` (`status`),
  ADD KEY `idx_b_dept` (`department`),
  ADD KEY `idx_b_bdate` (`borrow_date`),
  ADD KEY `idx_b_rdate` (`return_date`),
  ADD KEY `idx_b_by` (`borrow_by`);

--
-- Indexes for table `lookups`
--
ALTER TABLE `lookups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_lookup` (`lk_type`,`lk_value`),
  ADD KEY `idx_lk_type` (`lk_type`,`sort_order`),
  ADD KEY `idx_lk_code` (`lk_type`,`lk_code`);

--
-- Indexes for table `maintenance_records`
--
ALTER TABLE `maintenance_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_id` (`asset_id`),
  ADD KEY `idx_m_status` (`status`),
  ADD KEY `idx_m_date` (`maintenance_date`),
  ADD KEY `idx_m_tech` (`technician`),
  ADD KEY `idx_m_cost` (`cost`);

--
-- Indexes for table `reset_requests`
--
ALTER TABLE `reset_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_lock`
--
ALTER TABLE `system_lock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_u_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `asset_files`
--
ALTER TABLE `asset_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `borrow_records`
--
ALTER TABLE `borrow_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `lookups`
--
ALTER TABLE `lookups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `maintenance_records`
--
ALTER TABLE `maintenance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reset_requests`
--
ALTER TABLE `reset_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asset_files`
--
ALTER TABLE `asset_files`
  ADD CONSTRAINT `asset_files_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `borrow_records`
--
ALTER TABLE `borrow_records`
  ADD CONSTRAINT `borrow_records_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `maintenance_records`
--
ALTER TABLE `maintenance_records`
  ADD CONSTRAINT `maintenance_records_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
