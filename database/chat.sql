-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 14, 2018 at 04:28 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_user_id` int(10) UNSIGNED NOT NULL,
  `message_group_id` int(10) UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` enum('Active','Deactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_user_id`, `message_group_id`, `message`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(69, 6, 15, 'hello', '2018-06-13 06:16:50', '2018-06-13 06:16:50', NULL, 'Active'),
(70, 6, 15, 'hello', '2018-06-13 06:17:17', '2018-06-13 06:17:17', NULL, 'Active'),
(71, 6, 16, 'hello', '2018-06-13 06:42:36', '2018-06-13 06:42:36', NULL, 'Active'),
(72, 6, 16, 'hello', '2018-06-13 06:42:51', '2018-06-13 06:42:51', NULL, 'Active'),
(73, 6, 17, 'hello', '2018-06-13 06:43:19', '2018-06-13 06:43:19', NULL, 'Active'),
(74, 6, 17, 'yes', '2018-06-13 06:44:28', '2018-06-13 06:44:28', NULL, 'Active'),
(75, 6, 18, 'dsfdsf', '2018-06-13 06:44:35', '2018-06-13 06:44:35', NULL, 'Active'),
(76, 5, 17, 'dsfdsf', '2018-06-13 06:44:44', '2018-06-13 06:44:44', NULL, 'Active'),
(77, 6, 18, NULL, '2018-06-13 06:46:22', '2018-06-13 06:46:22', NULL, 'Active'),
(78, 6, 17, NULL, '2018-06-13 06:49:15', '2018-06-13 06:49:15', NULL, 'Active'),
(79, 6, 17, NULL, '2018-06-13 06:49:25', '2018-06-13 06:49:25', NULL, 'Active'),
(80, 6, 17, 'hello test user1', '2018-06-13 06:50:22', '2018-06-13 06:50:22', NULL, 'Active'),
(81, 5, 17, 'hello test user 2', '2018-06-13 06:50:35', '2018-06-13 06:50:35', NULL, 'Active'),
(82, 6, 17, 'hello', '2018-06-13 06:55:39', '2018-06-13 06:55:39', NULL, 'Active'),
(83, 5, 17, 'yup', '2018-06-13 06:56:33', '2018-06-13 06:56:33', NULL, 'Active'),
(84, 7, 19, 'Test', '2018-06-13 06:59:25', '2018-06-13 06:59:25', NULL, 'Active'),
(85, 5, 19, 'hello', '2018-06-13 06:59:39', '2018-06-13 06:59:39', NULL, 'Active'),
(86, 5, 19, 'helo', '2018-06-13 06:59:53', '2018-06-13 06:59:53', NULL, 'Active'),
(87, 6, 18, 'hello', '2018-06-13 07:21:44', '2018-06-13 07:21:44', NULL, 'Active'),
(88, 6, 17, 'helo', '2018-06-13 07:21:54', '2018-06-13 07:21:54', NULL, 'Active'),
(89, 6, 18, 'hello2', '2018-06-13 07:28:07', '2018-06-13 07:28:07', NULL, 'Active'),
(90, 5, 17, 'helo', '2018-06-13 07:40:34', '2018-06-13 07:40:34', NULL, 'Active'),
(91, 6, 17, 'yes', '2018-06-13 07:41:41', '2018-06-13 07:41:41', NULL, 'Active'),
(92, 6, 17, 'ussss', '2018-06-13 07:41:59', '2018-06-13 07:41:59', NULL, 'Active'),
(93, 5, 20, 'hello', '2018-06-13 08:12:55', '2018-06-13 08:12:55', NULL, 'Active'),
(94, 5, 20, NULL, '2018-06-13 08:13:21', '2018-06-13 08:13:21', NULL, 'Active'),
(95, 5, 21, 'dsfds', '2018-06-14 04:21:38', '2018-06-14 04:21:38', NULL, 'Active'),
(96, 5, 17, NULL, '2018-06-14 05:06:59', '2018-06-14 05:06:59', NULL, 'Active'),
(97, 5, 17, NULL, '2018-06-14 05:07:17', '2018-06-14 05:07:17', NULL, 'Active'),
(98, 5, 19, NULL, '2018-06-14 05:09:35', '2018-06-14 05:09:35', NULL, 'Active'),
(99, 5, 19, NULL, '2018-06-14 05:09:35', '2018-06-14 05:09:35', NULL, 'Active'),
(100, 5, 17, NULL, '2018-06-14 05:21:08', '2018-06-14 05:21:08', NULL, 'Active'),
(101, 5, 17, NULL, '2018-06-14 05:22:30', '2018-06-14 05:22:30', NULL, 'Active'),
(102, 5, 17, NULL, '2018-06-14 05:23:30', '2018-06-14 05:23:30', NULL, 'Active'),
(103, 5, 17, NULL, '2018-06-14 05:23:30', '2018-06-14 05:23:30', NULL, 'Active'),
(104, 5, 17, NULL, '2018-06-14 05:25:19', '2018-06-14 05:25:19', NULL, 'Active'),
(105, 5, 17, NULL, '2018-06-14 05:26:00', '2018-06-14 05:26:00', NULL, 'Active'),
(106, 5, 17, NULL, '2018-06-14 05:26:00', '2018-06-14 05:26:00', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `message_groups`
--

CREATE TABLE `message_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_user_id` int(10) UNSIGNED NOT NULL,
  `last_message_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` enum('Active','Deactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_groups`
--

INSERT INTO `message_groups` (`id`, `owner_user_id`, `last_message_date`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(15, 6, '2018-06-13 11:47:17', '2018-06-13 06:16:50', '2018-06-13 06:17:17', NULL, 'Active'),
(16, 6, '2018-06-13 12:12:51', '2018-06-13 06:42:36', '2018-06-13 06:42:51', NULL, 'Active'),
(17, 6, '2018-06-14 10:56:00', '2018-06-13 06:43:19', '2018-06-14 05:26:00', NULL, 'Active'),
(18, 6, '2018-06-13 12:58:07', '2018-06-13 06:44:35', '2018-06-13 07:28:07', NULL, 'Active'),
(19, 7, '2018-06-14 10:39:35', '2018-06-13 06:59:25', '2018-06-14 05:09:35', NULL, 'Active'),
(20, 5, '2018-06-13 13:43:21', '2018-06-13 08:12:55', '2018-06-13 08:13:21', NULL, 'Active'),
(21, 5, '2018-06-14 09:51:38', '2018-06-14 04:21:38', '2018-06-14 04:21:38', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `message_group_users`
--

CREATE TABLE `message_group_users` (
  `id` int(10) NOT NULL,
  `message_group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` enum('Active','Deactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_group_users`
--

INSERT INTO `message_group_users` (`id`, `message_group_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(27, 15, 6, '2018-06-13 06:16:50', '2018-06-13 06:16:50', NULL, 'Active'),
(28, 15, 6, '2018-06-13 06:16:50', '2018-06-13 06:16:50', NULL, 'Active'),
(29, 16, 6, '2018-06-13 06:42:36', '2018-06-13 06:42:36', NULL, 'Active'),
(30, 16, 9, '2018-06-13 06:42:36', '2018-06-13 06:42:36', NULL, 'Active'),
(31, 17, 6, '2018-06-13 06:43:19', '2018-06-13 06:43:19', NULL, 'Active'),
(32, 17, 5, '2018-06-13 06:43:19', '2018-06-13 06:43:19', NULL, 'Active'),
(33, 18, 6, '2018-06-13 06:44:35', '2018-06-13 06:44:35', NULL, 'Active'),
(34, 18, 7, '2018-06-13 06:44:35', '2018-06-13 06:44:35', NULL, 'Active'),
(35, 19, 7, '2018-06-13 06:59:25', '2018-06-13 06:59:25', NULL, 'Active'),
(36, 19, 5, '2018-06-13 06:59:25', '2018-06-13 06:59:25', NULL, 'Active'),
(37, 20, 5, '2018-06-13 08:12:55', '2018-06-13 08:12:55', NULL, 'Active'),
(38, 20, 9, '2018-06-13 08:12:55', '2018-06-13 08:12:55', NULL, 'Active'),
(39, 21, 5, '2018-06-14 04:21:38', '2018-06-14 04:21:38', NULL, 'Active'),
(40, 21, 8, '2018-06-14 04:21:38', '2018-06-14 04:21:38', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `message_to_users`
--

CREATE TABLE `message_to_users` (
  `id` int(10) NOT NULL,
  `message_group_id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL,
  `sender_user_id` int(10) UNSIGNED NOT NULL,
  `receiver_user_id` int(10) UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `attached_file_name` text,
  `read_status` enum('Read','Unread') NOT NULL DEFAULT 'Unread',
  `is_sent_for_notification` enum('Yes','No') NOT NULL DEFAULT 'No',
  `is_delete_by_receiver` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` enum('Active','Deactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_to_users`
--

INSERT INTO `message_to_users` (`id`, `message_group_id`, `message_id`, `sender_user_id`, `receiver_user_id`, `message`, `attached_file_name`, `read_status`, `is_sent_for_notification`, `is_delete_by_receiver`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(80, 17, 80, 6, 5, 'hello test user1', NULL, 'Unread', 'No', 'No', '2018-06-13 06:50:22', '2018-06-13 06:50:22', NULL, 'Active'),
(81, 17, 81, 5, 6, 'hello test user 2', NULL, 'Unread', 'No', 'No', '2018-06-13 06:50:35', '2018-06-13 06:50:35', NULL, 'Active'),
(82, 17, 82, 6, 5, 'hello', NULL, 'Unread', 'No', 'No', '2018-06-13 06:55:39', '2018-06-13 06:55:39', NULL, 'Active'),
(83, 17, 83, 5, 6, 'yup', NULL, 'Unread', 'No', 'No', '2018-06-13 06:56:33', '2018-06-13 06:56:33', NULL, 'Active'),
(84, 19, 84, 7, 5, 'Test', NULL, 'Unread', 'No', 'No', '2018-06-13 06:59:25', '2018-06-13 06:59:25', NULL, 'Active'),
(85, 19, 85, 5, 7, 'hello', NULL, 'Unread', 'No', 'No', '2018-06-13 06:59:39', '2018-06-13 06:59:39', NULL, 'Active'),
(86, 19, 86, 5, 7, 'helo', NULL, 'Unread', 'No', 'No', '2018-06-13 06:59:53', '2018-06-13 06:59:53', NULL, 'Active'),
(87, 18, 87, 6, 7, 'hello', NULL, 'Unread', 'No', 'No', '2018-06-13 07:21:44', '2018-06-13 07:21:44', NULL, 'Active'),
(88, 17, 88, 6, 5, 'helo', NULL, 'Unread', 'No', 'No', '2018-06-13 07:21:54', '2018-06-13 07:21:54', NULL, 'Active'),
(89, 18, 89, 6, 7, 'hello2', NULL, 'Unread', 'No', 'No', '2018-06-13 07:28:07', '2018-06-13 07:28:07', NULL, 'Active'),
(90, 17, 90, 5, 6, 'helo', NULL, 'Unread', 'No', 'No', '2018-06-13 07:40:34', '2018-06-13 07:40:34', NULL, 'Active'),
(91, 17, 91, 6, 5, 'yes', NULL, 'Unread', 'No', 'No', '2018-06-13 07:41:41', '2018-06-13 07:41:41', NULL, 'Active'),
(92, 17, 92, 6, 5, 'ussss', NULL, 'Unread', 'No', 'No', '2018-06-13 07:41:59', '2018-06-13 07:41:59', NULL, 'Active'),
(93, 20, 93, 5, 9, 'hello', NULL, 'Unread', 'No', 'No', '2018-06-13 08:12:55', '2018-06-13 08:12:55', NULL, 'Active'),
(94, 20, 94, 5, 9, NULL, '140990807.png', 'Unread', 'No', 'No', '2018-06-13 08:13:21', '2018-06-13 08:13:21', NULL, 'Active'),
(95, 21, 95, 5, 8, 'dsfds', NULL, 'Unread', 'No', 'No', '2018-06-14 04:21:38', '2018-06-14 04:21:38', NULL, 'Active'),
(96, 17, 96, 5, 6, NULL, '861387282.jpg', 'Unread', 'No', 'No', '2018-06-14 05:07:00', '2018-06-14 05:07:00', NULL, 'Active'),
(97, 17, 97, 5, 6, NULL, '97063153.php', 'Unread', 'No', 'No', '2018-06-14 05:07:17', '2018-06-14 05:07:17', NULL, 'Active'),
(98, 19, 98, 5, 7, NULL, '333272315.jpeg', 'Unread', 'No', 'No', '2018-06-14 05:09:35', '2018-06-14 05:09:35', NULL, 'Active'),
(99, 19, 99, 5, 7, NULL, '318465552.jpg', 'Unread', 'No', 'No', '2018-06-14 05:09:35', '2018-06-14 05:09:35', NULL, 'Active'),
(100, 17, 100, 5, 6, NULL, '971841095.jpg', 'Unread', 'No', 'No', '2018-06-14 05:21:09', '2018-06-14 05:21:09', NULL, 'Active'),
(101, 17, 101, 5, 6, NULL, '367358956.jpg', 'Unread', 'No', 'No', '2018-06-14 05:22:30', '2018-06-14 05:22:30', NULL, 'Active'),
(102, 17, 102, 5, 6, NULL, '604564249.jpg', 'Unread', 'No', 'No', '2018-06-14 05:23:30', '2018-06-14 05:23:30', NULL, 'Active'),
(103, 17, 103, 5, 6, NULL, '397856459.jpg', 'Unread', 'No', 'No', '2018-06-14 05:23:30', '2018-06-14 05:23:30', NULL, 'Active'),
(104, 17, 104, 5, 6, NULL, '732836891.jpg', 'Unread', 'No', 'No', '2018-06-14 05:25:19', '2018-06-14 05:25:19', NULL, 'Active'),
(105, 17, 105, 5, 6, NULL, '908831598.jpg', 'Unread', 'No', 'No', '2018-06-14 05:26:00', '2018-06-14 05:26:00', NULL, 'Active'),
(106, 17, 106, 5, 6, NULL, '879747341.jpg', 'Unread', 'No', 'No', '2018-06-14 05:26:00', '2018-06-14 05:26:00', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'testuser1', 'testuser1@mailinator.com', '$2y$10$OT239vxp/coOX8WeFLpmsOUinY/ynMLmOWNaMnY.y3RhyhFkf/Sc6', 'HngOwxaLyiLd3hmQQ5E9l5mxXPxFfaCbVRgspyDmQ8BG5JzH0hvJn25T9Y75', '2018-06-12 08:32:12', '2018-06-12 08:32:12'),
(6, 'testuser2', 'testuser2@mailinator.com', '$2y$10$kv0Ukk2bEM.zAs7xGIn6ouFOgRvU9ZkwimNvzTSm.gVogWzCC1Rv2', NULL, '2018-06-12 08:32:51', '2018-06-12 08:32:51'),
(7, 'testuser3', 'testuser3@mail.com', '$2y$10$aFcJ4UMa6TM77xqJ2rczQen4bmgT3iHZzGnc1QafMF9PBM97vT/Qu', '1YihgmP8edqbcY5RlHttN0N4RPf62RuUsizCoOW0p4ILNIkGHldJzHuSE8aX', '2018-06-13 01:00:30', '2018-06-13 01:00:30'),
(8, 'testuser4', 'testuser4@mail.com', '$2y$10$RRfFCki242X.CMoSSheW5eEIJbzF5jyLM5.jwun4RamITZn4kBQWe', 'VCXlE5UmBrMsX0RQ08FYksSVw64joU49Jt6lyvuMDVFK3nqXSvkpkcMNWCGw', '2018-06-13 01:00:49', '2018-06-13 01:00:49'),
(9, 'testuser5', 'testuser5@mail.com', '$2y$10$xj866c6FJH42JRSXHtl.2Oj41F8QOQXQQnf1rbxK.a3Vd/yKT50kK', NULL, '2018-06-13 01:01:10', '2018-06-13 01:01:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_user_id` (`sender_user_id`),
  ADD KEY `message_group_id` (`message_group_id`);

--
-- Indexes for table `message_groups`
--
ALTER TABLE `message_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_user_id` (`owner_user_id`);

--
-- Indexes for table `message_group_users`
--
ALTER TABLE `message_group_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_group_id` (`message_group_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`),
  ADD KEY `message_group_id_2` (`message_group_id`),
  ADD KEY `message_group_id_3` (`message_group_id`);

--
-- Indexes for table `message_to_users`
--
ALTER TABLE `message_to_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `sender_user_id` (`sender_user_id`),
  ADD KEY `receiver_user_id` (`receiver_user_id`),
  ADD KEY `message_group_id_2` (`message_group_id`),
  ADD KEY `message_group_id` (`message_group_id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `message_groups`
--
ALTER TABLE `message_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `message_group_users`
--
ALTER TABLE `message_group_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `message_to_users`
--
ALTER TABLE `message_to_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`message_group_id`) REFERENCES `message_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_groups`
--
ALTER TABLE `message_groups`
  ADD CONSTRAINT `message_groups_ibfk_1` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_group_users`
--
ALTER TABLE `message_group_users`
  ADD CONSTRAINT `message_group_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_to_users`
--
ALTER TABLE `message_to_users`
  ADD CONSTRAINT `message_to_users_ibfk_1` FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_to_users_ibfk_2` FOREIGN KEY (`receiver_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_to_users_ibfk_3` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_to_users_ibfk_4` FOREIGN KEY (`message_group_id`) REFERENCES `message_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
