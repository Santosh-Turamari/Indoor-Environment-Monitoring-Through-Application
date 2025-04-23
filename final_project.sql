-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2025 at 08:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `cameras`
--

CREATE TABLE `cameras` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `type` enum('built-in','usb') NOT NULL,
  `status` enum('Online','Offline') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cameras`
--

INSERT INTO `cameras` (`id`, `user_id`, `name`, `location`, `type`, `status`, `created_at`) VALUES
(1, 1, 'Front', 'Haliyal', 'built-in', 'Offline', '2025-04-22 06:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('switch','lock','window','curtain','sensor') NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `room_id`, `name`, `type`, `status`, `created_at`) VALUES
(1, 1, 'Air Conditioner', 'switch', 'On', '2025-04-22 06:39:34'),
(2, 1, 'Television', 'switch', 'On', '2025-04-22 06:39:34'),
(3, 1, 'Door Lock', 'lock', 'UNLOCKED', '2025-04-22 06:39:34'),
(4, 1, 'Curtain', 'curtain', 'CLOSED', '2025-04-22 06:39:34'),
(5, 1, 'Windows', 'window', 'Closed', '2025-04-22 06:39:34'),
(6, 2, 'Air Conditioner', 'switch', 'On', '2025-04-22 09:31:25'),
(7, 2, 'Television', 'switch', 'On', '2025-04-22 09:31:25'),
(8, 2, 'Door Lock', 'lock', 'UNLOCKED', '2025-04-22 09:31:25'),
(9, 2, 'Curtain', 'curtain', 'CLOSED', '2025-04-22 09:31:25'),
(10, 2, 'Windows', 'window', 'Closed', '2025-04-22 09:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `station` varchar(100) DEFAULT 'JAZZ VIBES',
  `volume` int(11) DEFAULT 60,
  `playing` tinyint(1) DEFAULT 1,
  `bluetooth_connected` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media_settings`
--

INSERT INTO `media_settings` (`id`, `user_id`, `station`, `volume`, `playing`, `bluetooth_connected`, `created_at`) VALUES
(1, 1, 'JAZZ VIBES', 60, 1, 0, '2025-04-22 06:39:34'),
(2, 2, 'JAZZ VIBES', 60, 1, 0, '2025-04-22 09:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `temperature` int(11) DEFAULT 25,
  `humidity` int(11) DEFAULT 8,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `user_id`, `name`, `temperature`, `humidity`, `created_at`) VALUES
(1, 1, 'Living Room', 25, 8, '2025-04-22 06:39:34'),
(2, 2, 'Living Room', 25, 8, '2025-04-22 09:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `sensors_data`
--

CREATE TABLE `sensors_data` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `temperature` float NOT NULL,
  `lux` int(11) NOT NULL,
  `humidity` float NOT NULL,
  `head_count` int(11) NOT NULL,
  `recorded_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_reading`
--

CREATE TABLE `sensor_reading` (
  `id` int(11) NOT NULL,
  `temperature` float NOT NULL,
  `humidity` float NOT NULL,
  `lux` int(11) NOT NULL,
  `head_count` int(11) NOT NULL,
  `recorded_at` datetime NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensor_reading`
--

INSERT INTO `sensor_reading` (`id`, `temperature`, `humidity`, `lux`, `head_count`, `recorded_at`, `room_id`) VALUES
(1, 33.2, 55, 60, 0, '2025-04-22 12:09:49', 1),
(2, 33.2, 55, 60, 0, '2025-04-22 12:10:19', 1),
(3, 33.2, 55, 60, 0, '2025-04-22 12:10:35', 1),
(4, 33.2, 55, 60, 0, '2025-04-22 12:10:51', 1),
(5, 33.2, 55, 60, 0, '2025-04-22 12:11:07', 1),
(6, 33.2, 55, 60, 0, '2025-04-22 12:11:23', 1),
(7, 33.2, 55, 60, 0, '2025-04-22 12:11:39', 1),
(8, 33.2, 55, 60, 0, '2025-04-22 12:11:55', 1),
(9, 33.2, 55, 60, 0, '2025-04-22 12:12:11', 1),
(10, 33.2, 55, 60, 0, '2025-04-22 12:12:27', 1),
(11, 33.2, 55, 60, 0, '2025-04-22 12:12:43', 1),
(12, 33.2, 55, 60, 0, '2025-04-22 12:12:59', 1),
(13, 33.2, 55, 60, 0, '2025-04-22 12:13:15', 1),
(14, 33.2, 55, 60, 0, '2025-04-22 12:14:02', 1),
(15, 33.2, 55, 60, 0, '2025-04-22 12:14:39', 1),
(16, 33.2, 55, 60, 0, '2025-04-22 12:14:56', 1),
(17, 33.2, 55, 60, 0, '2025-04-22 12:15:13', 1),
(18, 33.4, 53, 42, 0, '2025-04-22 12:20:16', 1),
(19, 33.3, 53, 46, 0, '2025-04-22 12:20:32', 1),
(20, 33.4, 53, 46, 0, '2025-04-22 12:20:51', 1),
(21, 33.4, 53, 46, 0, '2025-04-22 12:21:08', 1),
(22, 33.5, 53, 42, 0, '2025-04-22 12:21:24', 1),
(23, 33.4, 53, 46, 0, '2025-04-22 12:21:40', 1),
(24, 33.4, 53, 47, 0, '2025-04-22 12:21:56', 1),
(25, 33.5, 53, 46, 0, '2025-04-22 12:22:54', 1),
(26, 33.4, 53, 50, 0, '2025-04-22 12:23:18', 1),
(27, 33.4, 53, 48, 0, '2025-04-22 12:23:34', 1),
(28, 33.4, 53, 48, 0, '2025-04-22 12:23:50', 1),
(29, 33.4, 53, 48, 0, '2025-04-22 12:24:06', 1),
(30, 33.4, 53, 54, 0, '2025-04-22 12:24:30', 1),
(31, 33.3, 53, 51, 0, '2025-04-22 12:24:50', 1),
(32, 33.4, 53, 47, 0, '2025-04-22 12:25:07', 1),
(33, 33.6, 53, 47, 0, '2025-04-22 12:25:56', 1),
(34, 33.6, 53, 47, 0, '2025-04-22 12:26:13', 1),
(35, 33.4, 53, 48, 0, '2025-04-22 12:26:29', 1),
(36, 33.4, 52, 47, 0, '2025-04-22 12:26:45', 1),
(519, 33.2, 52, 0, 0, '2025-04-22 18:20:36', 1),
(520, 33.2, 52, 0, 0, '2025-04-22 18:20:52', 1),
(521, 33.2, 52, 0, 0, '2025-04-22 18:21:09', 1),
(522, 33.2, 52, 0, 0, '2025-04-22 18:21:25', 1),
(523, 33.2, 52, 0, 0, '2025-04-22 18:21:46', 1),
(524, 33.2, 52, 0, 0, '2025-04-22 18:22:04', 1),
(526, 33.2, 52, 0, 0, '2025-04-23 10:12:04', 1),
(527, 33.2, 52, 0, 0, '2025-04-23 10:12:20', 1),
(528, 33.2, 52, 0, 0, '2025-04-23 10:43:05', 1),
(529, 33.2, 52, 0, 0, '2025-04-23 10:51:31', 1),
(530, 33.2, 52, 0, 0, '2025-04-23 10:52:07', 1),
(531, 33.2, 52, 0, 0, '2025-04-23 10:56:37', 1),
(532, 33.2, 52, 0, 0, '2025-04-23 11:11:33', 1),
(533, 33.2, 52, 0, 0, '2025-04-23 11:13:55', 1),
(534, 33.2, 52, 0, 0, '2025-04-23 11:48:12', 1),
(535, 33.2, 52, 0, 0, '2025-04-23 11:48:53', 1),
(536, 33.2, 52, 0, 0, '2025-04-23 11:49:10', 1),
(537, 33.2, 52, 0, 0, '2025-04-23 11:49:26', 1),
(538, 33.2, 52, 0, 0, '2025-04-23 11:49:45', 1),
(539, 33.2, 52, 0, 0, '2025-04-23 11:53:25', 1),
(540, 33.2, 52, 0, 0, '2025-04-23 11:53:42', 1),
(541, 33.2, 52, 0, 0, '2025-04-23 11:54:26', 1),
(542, 33.2, 52, 0, 0, '2025-04-23 11:56:10', 1),
(543, 33.2, 52, 0, 0, '2025-04-23 11:57:10', 1),
(544, 33.2, 52, 0, 0, '2025-04-23 11:57:29', 1),
(546, 33.2, 52, 0, 0, '2025-04-23 12:11:37', 1),
(547, 33.2, 52, 0, 0, '2025-04-23 12:15:49', 1),
(548, 33.2, 52, 0, 0, '2025-04-23 12:17:03', 1),
(549, 33.2, 52, 0, 0, '2025-04-23 12:46:38', 1),
(550, 33.2, 52, 0, 0, '2025-04-23 13:01:21', 1),
(551, 33.2, 52, 0, 0, '2025-04-23 13:03:13', 1),
(552, 33.2, 52, 0, 0, '2025-04-23 13:03:29', 1),
(553, 33.2, 52, 0, 0, '2025-04-23 13:06:47', 1),
(554, 33.2, 52, 0, 0, '2025-04-23 13:07:46', 1),
(555, 33.1, 55, 44, 0, '2025-04-23 13:50:10', 1),
(556, 33.3, 55, 53, 0, '2025-04-23 13:58:21', 1),
(557, 33.3, 55, 53, 0, '2025-04-23 14:04:45', 1),
(558, 33.3, 55, 53, 0, '2025-04-23 14:05:03', 1),
(559, 33.3, 55, 53, 0, '2025-04-23 14:05:31', 1),
(560, 33.3, 55, 53, 0, '2025-04-23 14:07:05', 1),
(561, 33.3, 55, 53, 0, '2025-04-23 14:07:23', 1),
(562, 33.3, 55, 53, 0, '2025-04-23 14:08:04', 1),
(563, 33.3, 55, 53, 0, '2025-04-23 14:40:07', 1),
(564, 33.3, 55, 53, 0, '2025-04-23 14:48:31', 1),
(565, 33.3, 55, 53, 0, '2025-04-23 14:48:47', 1),
(566, 33.3, 55, 53, 0, '2025-04-23 14:49:04', 1),
(567, 33.3, 55, 53, 0, '2025-04-23 14:49:20', 1),
(568, 33.3, 55, 53, 0, '2025-04-23 14:55:28', 1),
(569, 33.3, 55, 53, 0, '2025-04-23 14:55:44', 1),
(570, 33.3, 55, 53, 0, '2025-04-23 17:57:01', 1),
(571, 33.3, 55, 53, 0, '2025-04-23 18:17:30', 1),
(572, 33.3, 55, 53, 0, '2025-04-23 18:43:43', 1),
(573, 33.3, 55, 53, 0, '2025-04-23 23:40:10', 1),
(574, 33.3, 55, 53, 0, '2025-04-23 23:46:16', 1),
(575, 33.3, 55, 53, 0, '2025-04-23 23:46:39', 1),
(576, 33.3, 55, 53, 0, '2025-04-23 23:47:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`) VALUES
(1, '123@gmail.com', '$2y$10$/Qi1NCWJEgQPwV4z6DOFEeFBKz4TQpf05K7xmPBKZu29bt//bMliK', '2025-04-22 06:39:34'),
(2, 'klsvdit@gmail.com', '$2y$10$qov4UmdhW7PHwqRXQp0EH.oUOndG0Ol9Q19x8mFBzDfqFPqvDdIea', '2025-04-22 09:31:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cameras`
--
ALTER TABLE `cameras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sensors_data`
--
ALTER TABLE `sensors_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `sensor_reading`
--
ALTER TABLE `sensor_reading`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cameras`
--
ALTER TABLE `cameras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sensors_data`
--
ALTER TABLE `sensors_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_reading`
--
ALTER TABLE `sensor_reading`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cameras`
--
ALTER TABLE `cameras`
  ADD CONSTRAINT `cameras_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD CONSTRAINT `media_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sensors_data`
--
ALTER TABLE `sensors_data`
  ADD CONSTRAINT `sensors_data_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sensor_reading`
--
ALTER TABLE `sensor_reading`
  ADD CONSTRAINT `sensor_reading_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
