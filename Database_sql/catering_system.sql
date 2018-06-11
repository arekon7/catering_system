-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for catering_system_3
CREATE DATABASE IF NOT EXISTS `catering_system_3` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `catering_system_3`;

-- Dumping structure for table catering_system_3.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `co_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `resp_person` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `web_p` varchar(100) DEFAULT NULL,
  `tel_no` varchar(100) DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `co_email` varchar(100) DEFAULT NULL,
  `wh_from` varchar(10) DEFAULT NULL,
  `wh_to` varchar(10) DEFAULT NULL,
  `main_pht` int(11) DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `co_name` (`co_name`),
  KEY `FK_companies_users` (`user_id`),
  CONSTRAINT `FK_companies_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- Dumping data for table catering_system_3.companies: ~30 rows (approximately)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `user_id`, `co_name`, `resp_person`, `web_p`, `tel_no`, `address`, `co_email`, `wh_from`, `wh_to`, `main_pht`, `updated_at`, `created_at`) VALUES
	(0, 0, '123', '321', '123', '123', '123', NULL, '123', '123', NULL, '2017-11-05 20:55:32', '2016-12-16 14:33:05'),
	(35, 69, 'Jurgis ir Drakonas ', 'Beatriče Urbanavičiutė', 'www.judr.lt', '+3705165', 'Kairiukščio 59, Vilnius', NULL, '12', '24', 3, '2018-01-12 02:41:35', '2016-11-23 16:30:43'),
	(37, 74, 'l', 'l', 'l', 'l', 'l', NULL, 'l', 'l', 2, '2017-11-05 20:55:24', '2016-11-24 22:55:16'),
	(38, 75, 'food outd', 'food out', 'food out', '789', '', NULL, '12', '24', 2, '2016-12-15 23:37:12', '2016-12-14 19:06:07'),
	(43, 79, 'test company 1233 ', '312', '312', '312', '312', NULL, '312', '312', NULL, '2018-01-05 16:57:39', '2016-12-16 14:35:57'),
	(44, 80, 'Can Can', 'Can Can', 'www.CanCan.lt', '+789456123', 'Traku g 15, Vln', NULL, '12', '24', 2, '2016-12-20 22:39:18', '2016-12-20 22:38:45'),
	(46, 85, 'test222', 'test222', 'test222', 'test222', 'test222', NULL, '12', '12', 1, '2017-12-28 22:53:41', '2017-12-28 22:53:41'),
	(50, 89, 'Supeer restaurant', '3423', 'fsf', 'fsdf', 'fsdfsd', NULL, 'sfdf', 'fsdf', 1, '2018-01-05 21:22:16', '2018-01-05 17:02:07'),
	(51, 78, 'my company 1', 'da', '', 'da', 'd', 'alibaba', '', '', 1, '2018-01-06 16:46:44', '2018-01-06 16:45:16'),
	(53, 78, 'eqwe', '', '', '', '', '', '', '', 2, '2018-01-06 16:54:47', '2018-01-06 16:47:12'),
	(55, 78, 'my cmp 4', 'my cmp 4', NULL, 'my cmp 4', 'my cmp 4', 'www.mycmp4.lt', 'my cmp 4', 'my cmp 4', 1, '2018-01-06 16:52:42', '2018-01-06 16:52:42'),
	(56, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-01-06 17:49:19', '2018-01-06 17:49:19'),
	(57, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-01-06 18:16:00', '2018-01-06 18:16:00'),
	(58, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-01-06 20:13:36', '2018-01-06 20:13:36'),
	(59, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-01-06 21:00:21', '2018-01-06 21:00:21'),
	(60, 69, 'test 9', '', '', '', '', 'test 9', '', '', 2, '2018-01-07 23:08:39', '2018-01-07 23:08:39'),
	(61, 69, 'Test 7', 'test 9', '', 'test 9', '', 'test 9', '', '', 1, '2018-01-07 23:09:19', '2018-01-07 23:09:07'),
	(62, 105, '534534', '34534', '', '354534', '', '5345', '', '', 1, '2018-01-07 23:11:52', '2018-01-07 23:11:52'),
	(63, 105, 'dasdas', '', '', '', '', '', '', '', 1, '2018-01-07 23:26:31', '2018-01-07 23:26:31'),
	(75, 69, 'dasdasfffff123', '', '', '', '', 'dasdas', '', '', 2, '2018-01-09 15:12:59', '2018-01-09 15:12:59'),
	(76, 69, '423fgg', '', '', '', '', '', '', '', 2, '2018-01-09 15:19:23', '2018-01-09 15:19:23'),
	(77, 69, '5 img', '', '', '', '', '', '', '', 1, '2018-01-09 15:20:32', '2018-01-09 15:20:32'),
	(78, 69, '', '', '', '', '', '', '', '', 1, '2018-01-09 15:37:51', '2018-01-09 15:37:51'),
	(80, 69, 'fsdfsd', '', '', '', '', '', '10:00', '22:00', 1, '2018-01-09 15:49:36', '2018-01-09 15:49:36'),
	(83, 69, 'tedasdasfsdf', '', '', '', '', '', '10:00', '22:00', 1, '2018-01-09 16:02:08', '2018-01-09 16:02:08'),
	(87, 69, 'Restoranas 4', 'Tomas', 'www.restoranas4.lt', '+37067600765', 'Klaipedos g. 33, Klaipeda', '', '10:00', '22:00', 1, '2018-01-11 13:06:21', '2018-01-09 16:18:28'),
	(89, 69, 'Restoranas 3', 'Pavardene', 'www.restoranas3.lt', '+37067600767', 'Elektrenu g. 20, Skuodas', '', '09:00', '21:00', 3, '2018-01-11 19:08:36', '2018-01-09 16:21:47'),
	(90, 69, 'Restoranas 2', 'Vardenis', 'www.judr.lt', '+37067600769', 'Kauno g. 3, Vilnius', '', '10:00', '22:00', 3, '2018-01-11 18:07:43', '2018-01-09 17:59:47'),
	(93, 69, 'Restoranas 1', 'Ausra', 'www.restoranas 1.lt', '+37067600769', 'Vilniaus g. 31, Vilnius', 'fsdf', '10:00', '22:00', 3, '2018-01-11 18:07:05', '2018-01-09 18:46:44'),
	(95, 69, 'test main ft', '', '', '', '', '', '10:00', '22:00', 9, '2018-01-09 18:55:43', '2018-01-09 18:55:43');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.company_images
CREATE TABLE IF NOT EXISTS `company_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) NOT NULL,
  `image_path` varchar(100) NOT NULL,
  `image_extension` varchar(50) NOT NULL,
  `company_id` int(10) NOT NULL,
  `image_no` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_company_images_companies` (`company_id`),
  CONSTRAINT `FK_company_images_companies` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=latin1;

-- Dumping data for table catering_system_3.company_images: ~63 rows (approximately)
/*!40000 ALTER TABLE `company_images` DISABLE KEYS */;
INSERT INTO `company_images` (`id`, `image_name`, `image_path`, `image_extension`, `company_id`, `image_no`, `created_at`, `updated_at`) VALUES
	(75, '6gwD4NseLwWVEwQkXgEP_1', '/imgs/companies/', 'jpg', 37, 1, '2016-11-24 22:55:16', '2016-11-24 22:55:16'),
	(76, '6gwD4NseLwWVEwQkXgEP_2', '/imgs/companies/', 'jpg', 37, 2, '2016-11-24 22:55:16', '2016-11-24 22:55:16'),
	(77, '6gwD4NseLwWVEwQkXgEP_3', '/imgs/companies/', 'jpg', 37, 3, '2016-11-24 22:55:16', '2016-11-24 22:55:16'),
	(78, 'JrluIyeDVqG5CZMbAP9U_1', '/imgs/companies/', 'png', 38, 1, '2016-12-14 19:06:07', '2016-12-14 19:06:07'),
	(79, 'JrluIyeDVqG5CZMbAP9U_2', '/imgs/companies/', 'jpg', 38, 2, '2016-12-14 19:06:07', '2016-12-14 19:06:07'),
	(80, 'JrluIyeDVqG5CZMbAP9U_3', '/imgs/companies/', 'jpg', 38, 3, '2016-12-14 19:06:07', '2016-12-14 19:06:07'),
	(87, 'JSAZGSMQIkId8e7rlvp2_1', '/imgs/companies/', 'jpg', 44, 1, '2016-12-20 22:38:45', '2016-12-20 22:38:45'),
	(88, 'JSAZGSMQIkId8e7rlvp2_2', '/imgs/companies/', 'jpg', 44, 2, '2016-12-20 22:38:45', '2016-12-20 22:38:45'),
	(89, 'JSAZGSMQIkId8e7rlvp2_3', '/imgs/companies/', 'jpg', 44, 3, '2016-12-20 22:38:45', '2016-12-20 22:38:45'),
	(93, 'b5usnI4r17oh8h0WxBsD_1', '/imgs/companies/', 'jpg', 46, 1, '2017-12-28 22:53:41', '2017-12-28 22:53:41'),
	(94, 'b5usnI4r17oh8h0WxBsD_2', '/imgs/companies/', 'jpg', 46, 2, '2017-12-28 22:53:41', '2017-12-28 22:53:41'),
	(95, 'b5usnI4r17oh8h0WxBsD_3', '/imgs/companies/', 'jpg', 46, 3, '2017-12-28 22:53:41', '2017-12-28 22:53:41'),
	(102, 'iwkzJjeVgOUZ1CKKVz0W_1', '/imgs/companies/', 'jpg', 50, 1, '2018-01-05 17:02:07', '2018-01-05 17:02:07'),
	(103, 'iwkzJjeVgOUZ1CKKVz0W_2', '/imgs/companies/', 'jpg', 50, 2, '2018-01-05 17:02:07', '2018-01-05 17:02:07'),
	(104, 'iwkzJjeVgOUZ1CKKVz0W_3', '/imgs/companies/', 'jpg', 50, 3, '2018-01-05 17:02:07', '2018-01-05 17:02:07'),
	(105, 'DFVvvxlIzFtkTiqjmzjN_1', '/imgs/companies/', 'jpg', 51, 1, '2018-01-06 16:45:16', '2018-01-06 16:45:16'),
	(106, 'DFVvvxlIzFtkTiqjmzjN_2', '/imgs/companies/', 'jpg', 51, 2, '2018-01-06 16:45:16', '2018-01-06 16:45:16'),
	(107, 'DFVvvxlIzFtkTiqjmzjN_3', '/imgs/companies/', 'jpg', 51, 3, '2018-01-06 16:45:16', '2018-01-06 16:45:16'),
	(108, 'sfu1vh0CLrtvJzO8JDsZ_1', '/imgs/companies/', 'jpg', 53, 1, '2018-01-06 16:47:12', '2018-01-06 16:47:12'),
	(109, 'sfu1vh0CLrtvJzO8JDsZ_2', '/imgs/companies/', 'jpg', 53, 2, '2018-01-06 16:47:12', '2018-01-06 16:47:12'),
	(110, 'sfu1vh0CLrtvJzO8JDsZ_3', '/imgs/companies/', 'jpg', 53, 3, '2018-01-06 16:47:12', '2018-01-06 16:47:12'),
	(111, 'td6TaI5M3rH4WSeCauJC_1', '/imgs/companies/', 'jpg', 55, 1, '2018-01-06 16:52:42', '2018-01-06 16:52:42'),
	(112, 'td6TaI5M3rH4WSeCauJC_2', '/imgs/companies/', 'jpg', 55, 2, '2018-01-06 16:52:42', '2018-01-06 16:52:42'),
	(113, 'td6TaI5M3rH4WSeCauJC_3', '/imgs/companies/', 'jpg', 55, 3, '2018-01-06 16:52:42', '2018-01-06 16:52:42'),
	(114, 'Aaf9rb4w2sc7vFUdcPRt_1', '/imgs/companies/', 'jpg', 60, 1, '2018-01-07 23:08:39', '2018-01-07 23:08:39'),
	(115, 'Aaf9rb4w2sc7vFUdcPRt_2', '/imgs/companies/', 'jpg', 60, 2, '2018-01-07 23:08:39', '2018-01-07 23:08:39'),
	(116, 'Aaf9rb4w2sc7vFUdcPRt_3', '/imgs/companies/', 'jpg', 60, 3, '2018-01-07 23:08:39', '2018-01-07 23:08:39'),
	(117, 'QcksCCtZHcbxaY45Sauf_1', '/imgs/companies/', 'jpg', 61, 1, '2018-01-07 23:09:07', '2018-01-07 23:09:07'),
	(118, 'QcksCCtZHcbxaY45Sauf_2', '/imgs/companies/', 'jpg', 61, 2, '2018-01-07 23:09:07', '2018-01-07 23:09:07'),
	(119, 'QcksCCtZHcbxaY45Sauf_3', '/imgs/companies/', 'jpg', 61, 3, '2018-01-07 23:09:07', '2018-01-07 23:09:07'),
	(120, '3fnGkakTiSZ7AYqvvh8C_1', '/imgs/companies/', 'jpg', 62, 1, '2018-01-07 23:11:52', '2018-01-07 23:11:52'),
	(121, '3fnGkakTiSZ7AYqvvh8C_2', '/imgs/companies/', 'jpg', 62, 2, '2018-01-07 23:11:52', '2018-01-07 23:11:52'),
	(122, '3fnGkakTiSZ7AYqvvh8C_3', '/imgs/companies/', 'jpg', 62, 3, '2018-01-07 23:11:52', '2018-01-07 23:11:52'),
	(123, 'M0pf8Hz0pugay95k1udN_1', '/imgs/companies/', 'jpg', 63, 1, '2018-01-07 23:26:31', '2018-01-07 23:26:31'),
	(124, 'M0pf8Hz0pugay95k1udN_2', '/imgs/companies/', 'jpg', 63, 2, '2018-01-07 23:26:31', '2018-01-07 23:26:31'),
	(125, 'M0pf8Hz0pugay95k1udN_3', '/imgs/companies/', 'jpg', 63, 3, '2018-01-07 23:26:31', '2018-01-07 23:26:31'),
	(126, 'dvpVVpWHQNTjr2U1u8IH_1', '/imgs/companies/', 'jpg', 75, 1, '2018-01-09 15:12:59', '2018-01-09 15:12:59'),
	(127, 'dvpVVpWHQNTjr2U1u8IH_2', '/imgs/companies/', 'jpg', 75, 2, '2018-01-09 15:12:59', '2018-01-09 15:12:59'),
	(128, 'dvpVVpWHQNTjr2U1u8IH_3', '/imgs/companies/', 'jpeg', 75, 3, '2018-01-09 15:12:59', '2018-01-09 15:12:59'),
	(129, 'S7ug9XNzMO6h4WqRxDhE_1', '/imgs/companies/', 'jpg', 83, 1, '2018-01-09 16:02:08', '2018-01-09 16:02:08'),
	(130, 'Kx8VLd5KEQl748mazfBu_2', '/imgs/companies/', 'jpg', 83, 2, '2018-01-09 16:02:08', '2018-01-09 16:02:08'),
	(139, 'SPFv9hZEHmxy99WWHncy_1', '/imgs/companies/', 'jpg', 87, 1, '2018-01-09 16:18:28', '2018-01-09 16:18:28'),
	(142, '88zZIepe8PeI5YGKcRRM_7', '/imgs/companies/', 'jpg', 89, 7, '2018-01-09 16:21:47', '2018-01-09 16:21:47'),
	(143, 'xdTyuQHG2XcFM8loh1K1_10', '/imgs/companies/', 'jpg', 89, 10, '2018-01-09 16:21:47', '2018-01-09 16:21:47'),
	(144, 'no_image', '/imgs/', 'jpg', 90, 1, '2018-01-09 17:59:47', '2018-01-09 17:59:47'),
	(152, 'h5ZQ9l66VN5vmu9yQBjA_1', '/imgs/companies/', 'jpg', 93, 1, '2018-01-09 18:46:44', '2018-01-09 18:46:44'),
	(153, '3dd9dJoHx7ZNokPtaU6C_2', '/imgs/companies/', 'jpg', 93, 2, '2018-01-09 18:46:45', '2018-01-09 18:46:45'),
	(154, 'ut6WoumgUXDWEj0riP9U_3', '/imgs/companies/', 'jpg', 93, 3, '2018-01-09 18:46:45', '2018-01-09 18:46:45'),
	(155, '9k8qBVtv1UQvBenwE46J_4', '/imgs/companies/', 'jpg', 93, 4, '2018-01-09 18:46:45', '2018-01-09 18:46:45'),
	(156, 'l9IM0Q2m7iG23PPsyoMW_5', '/imgs/companies/', 'jpg', 93, 5, '2018-01-09 18:46:45', '2018-01-09 18:46:45'),
	(157, 'bs8yU1dcPO47nhHD77E2_6', '/imgs/companies/', 'jpg', 93, 6, '2018-01-09 18:46:47', '2018-01-09 18:46:47'),
	(162, 'OrbqpKddHTvv9xkKkZl6_1', '/imgs/companies/', 'jpg', 95, 1, '2018-01-09 18:55:43', '2018-01-09 18:55:43'),
	(163, 'Rclv2Imwp7Vsz0PYw2rW_2', '/imgs/companies/', 'jpg', 95, 2, '2018-01-09 18:55:43', '2018-01-09 18:55:43'),
	(164, 'KJ7RucxmTJcEEHo2lwnd_3', '/imgs/companies/', 'jpg', 95, 3, '2018-01-09 18:55:44', '2018-01-09 18:55:44'),
	(165, 'OjmR3V0jsQsHA9mxMz8w_4', '/imgs/companies/', 'jpg', 95, 4, '2018-01-09 18:55:44', '2018-01-09 18:55:44'),
	(166, 'SXlXVlJIiI3AcmQrYkmk_5', '/imgs/companies/', 'jpg', 95, 5, '2018-01-09 18:55:44', '2018-01-09 18:55:44'),
	(167, 'a6G0IPk2xOeNMApIPcia_6', '/imgs/companies/', 'jpg', 95, 6, '2018-01-09 18:55:44', '2018-01-09 18:55:44'),
	(184, '7talITGmYMywvQzPRq2u_2', '/imgs/companies/', 'jpg', 35, 2, '2018-01-09 22:17:26', '2018-01-09 22:17:26'),
	(185, '8ey0RtYS6K2PwUFmoDTR_3', '/imgs/companies/', 'jpg', 35, 3, '2018-01-09 22:17:26', '2018-01-09 22:17:26'),
	(186, 'tYDhhP9tynPNP7kxwJea_4', '/imgs/companies/', 'jpg', 35, 4, '2018-01-09 22:17:26', '2018-01-09 22:17:26'),
	(187, 'jtVG4u4spm9hxv1qDDME_2', '/imgs/companies/', 'jpg', 90, 2, '2018-01-11 13:03:57', '2018-01-11 13:03:57'),
	(188, 'uvZipFlePfTr3TPccDYz_3', '/imgs/companies/', 'jpeg', 90, 3, '2018-01-11 18:07:20', '2018-01-11 18:07:20'),
	(189, 'ferdQJYXM8ccZ2HVt3Dl_3', '/imgs/companies/', 'jpg', 89, 3, '2018-01-11 19:08:22', '2018-01-11 19:08:22');
/*!40000 ALTER TABLE `company_images` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.food_categories
CREATE TABLE IF NOT EXISTS `food_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_food_categories_companies` (`company_id`),
  CONSTRAINT `FK_food_categories_companies` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table catering_system_3.food_categories: ~29 rows (approximately)
/*!40000 ALTER TABLE `food_categories` DISABLE KEYS */;
INSERT INTO `food_categories` (`id`, `category`, `company_id`, `created_at`, `updated_at`) VALUES
	(1, 'Appetizers', 35, '2017-12-04 16:29:50', '2017-12-08 00:33:08'),
	(2, 'Salads', 35, '2017-12-04 16:29:50', '2017-12-08 00:33:13'),
	(3, 'Main courses', 35, '2017-12-04 16:29:50', '2017-12-08 00:33:14'),
	(4, 'Desserts', 35, '2017-12-04 16:29:50', '2017-12-08 00:33:15'),
	(5, 'Non alco drinks', 35, '2017-12-04 16:29:50', '2017-12-08 00:33:16'),
	(6, 'Alco drinks', 35, '2017-12-04 16:29:50', '2017-12-08 00:33:16'),
	(8, 'Appetizers', 35, '2017-12-04 14:30:37', '2017-12-08 00:33:19'),
	(9, 'test', 0, '2017-12-04 14:36:36', '2017-12-04 14:36:36'),
	(10, 'test', 0, '2017-12-04 14:37:00', '2017-12-04 14:37:00'),
	(11, 'ff', 0, '2017-12-04 14:38:50', '2017-12-04 14:38:50'),
	(12, 'Appetizers', 35, '2017-12-04 14:41:15', '2017-12-04 14:41:15'),
	(15, 'Appetizers cat1', 35, '2017-12-08 13:58:55', '2017-12-08 13:58:55'),
	(16, 'Appetizers', 35, '2017-12-08 14:02:00', '2017-12-08 14:02:00'),
	(17, 'Appetizers', 35, '2017-12-08 14:02:42', '2017-12-08 14:02:42'),
	(18, 'Appetizers', 35, '2017-12-08 14:03:04', '2017-12-08 14:03:04'),
	(19, 'Desserts', 35, '2017-12-08 14:05:07', '2017-12-08 14:05:07'),
	(20, 'Desserts', 35, '2017-12-08 14:05:09', '2017-12-08 14:05:09'),
	(21, 'Desserts', 35, '2017-12-08 14:06:03', '2017-12-08 14:06:03'),
	(22, 'Desserts', 35, '2017-12-08 14:06:05', '2017-12-08 14:06:05'),
	(23, 'Desserts', 35, '2017-12-08 14:06:09', '2017-12-08 14:06:09'),
	(24, 'Desserts', 35, '2017-12-08 14:06:15', '2017-12-08 14:06:15'),
	(25, 'Desserts', 35, '2017-12-08 14:07:50', '2017-12-08 14:07:50'),
	(26, 'Desserts', 35, '2017-12-08 14:08:47', '2017-12-08 14:08:47'),
	(27, 'Desserts', 35, '2017-12-08 14:09:17', '2017-12-08 14:09:17'),
	(28, 'Desserts', 35, '2017-12-11 21:14:38', '2017-12-11 21:14:38'),
	(29, 'Appetizers', 40, '2018-01-06 21:29:56', '2018-01-06 21:29:56'),
	(30, 'test cat', 60, '2018-01-10 00:57:54', '2018-01-10 00:57:54'),
	(31, 'etst cat 2', 60, '2018-01-10 00:58:06', '2018-01-10 00:58:06'),
	(32, 'Salotos', 60, '2018-01-10 00:58:13', '2018-01-10 00:58:13'),
	(33, 'Kids menu', 35, '2018-01-11 23:44:17', '2018-01-11 23:44:17');
/*!40000 ALTER TABLE `food_categories` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `item` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT '0',
  `price` double(6,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `FK_menu_food_categories` (`category_id`),
  CONSTRAINT `FK_menu_companies` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_menu_food_categories` FOREIGN KEY (`category_id`) REFERENCES `food_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- Dumping data for table catering_system_3.menu: ~33 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `company_id`, `category_id`, `item`, `description`, `price`, `created_at`, `updated_at`) VALUES
	(2, 37, 5, 'Juice', 'Apple juice', 2.00, '2017-12-06 00:44:03', '2018-01-12 01:48:16'),
	(5, 35, 4, 'Ice cream1', 'Integer congue tristique urna', 4.00, '2017-12-06 00:44:03', '2018-01-12 01:54:50'),
	(7, 35, 6, 'Long Island', 'Best coctail on the market', 5.00, '2017-12-06 00:44:03', '2018-01-12 01:48:11'),
	(8, 35, 1, 'Lorem Ipsum1', 'Integer congue tristique urna', 3.50, '2017-12-06 00:44:03', '2018-01-12 01:54:30'),
	(9, 35, 3, 'Lorem Ipsum4', 'Integer congue tristique urna', 4.00, '2017-12-06 00:44:03', '2018-01-12 01:54:48'),
	(10, 35, 4, 'Lorem Ipsum9', 'Integer congue tristique urna', 3.50, '2017-12-06 00:44:03', '2018-01-12 01:54:34'),
	(11, 35, 5, 'Juice', 'Tomato fresh juice', 0.00, '2017-12-06 00:44:03', '2017-12-06 00:44:03'),
	(12, 35, 6, 'Cuba libre', 'Best coctail on the market', 4.00, '2017-12-06 00:44:03', '2018-01-12 01:48:01'),
	(14, 35, 3, 'Lorem Ipsum5', 'Integer congue tristique urna', 3.50, '2017-12-06 00:44:03', '2018-01-12 01:54:33'),
	(15, 35, 4, 'Lorem Ipsum10', 'Integer congue tristique urna', 4.00, '2017-12-06 00:44:03', '2018-01-12 01:54:51'),
	(16, 35, 5, 'Juice', 'Tomato fresh juice', 0.00, '2017-12-06 00:44:03', '2017-12-06 00:44:03'),
	(17, 35, 6, 'White Russia', 'Best coctail on the market', 3.00, '2017-12-06 00:44:03', '2018-01-12 01:47:58'),
	(18, 35, 1, 'Lorem Ipsum2', 'Integer congue tristique urna', 4.00, '2017-12-06 00:44:03', '2018-01-12 01:54:48'),
	(19, 35, 3, 'Lorem Ipsum6', 'Integer congue tristique urna', 4.00, '2017-12-06 00:44:03', '2018-01-12 01:54:49'),
	(20, 35, 4, 'Lorem Ipsum11', 'Integer congue tristique urna', 3.50, '2017-12-06 00:44:03', '2018-01-12 01:54:35'),
	(21, 35, 5, 'Juice', 'Tomato fresh juice', 0.00, '2017-12-06 00:44:03', '2017-12-06 00:44:03'),
	(22, 35, 6, 'Gin Tonic', 'Best coctail on the market', 3.00, '2017-12-06 00:44:03', '2018-01-12 01:47:54'),
	(23, 35, 1, 'Lorem Ipsum3', 'Integer congue tristique urna', 3.00, '2017-12-06 00:44:03', '2018-01-12 02:04:23'),
	(24, 35, 3, 'Lorem Ipsum7', 'Integer congue tristique urna', 3.50, '2017-12-06 00:44:03', '2018-01-12 01:54:34'),
	(25, 35, 4, 'Lorem Ipsum12', 'Integer congue tristique urna', 0.00, '2017-12-06 00:44:03', '2018-01-12 01:52:04'),
	(26, 35, 5, 'Juice', 'Tomato fresh juice', 0.00, '2017-12-06 00:44:03', '2017-12-06 00:44:03'),
	(27, 35, 6, 'Jeger Bull', 'Best coctail on the market', 3.00, '2017-12-06 00:44:03', '2018-01-12 01:47:52'),
	(28, 35, 1, 'Beaf', 'Beaf', 4.00, '2017-12-06 00:44:03', '2018-01-12 01:54:46'),
	(29, 35, 3, 'Lorem Ipsum8', 'Integer congue tristique urna', 3.50, '2017-12-06 00:44:03', '2018-01-12 01:54:37'),
	(30, 35, 4, 'Ice cream', 'Integer congue tristique urna', 4.00, '2017-12-06 00:44:03', '2018-01-12 01:54:54'),
	(31, 35, 5, 'Tomato juice', 'Tomato fresh juice', 0.00, '2017-12-06 00:44:03', '2018-01-12 01:48:25'),
	(32, 35, 6, 'Beer', 'Best coctail on the market', 3.00, '2017-12-06 00:44:03', '2018-01-12 01:47:49'),
	(33, 35, 1, 'Fried bread1', 'Good with beer', 3.50, '2017-12-06 00:44:03', '2018-01-12 01:54:33'),
	(37, 35, 1, 'Cuba libre', 'Good taste', 3.50, '2017-12-07 23:11:26', '2018-01-12 01:54:29'),
	(50, 60, 32, 'Cezerio salotos', 'Labas skanuu', 5.54, '2018-01-10 00:58:53', '2018-01-10 00:58:53'),
	(51, 35, 2, 'Cesar salad', 'Best salad in town', 3.50, '2018-01-11 23:53:05', '2018-01-11 23:53:05'),
	(52, 35, 2, 'Fresh vegetables salad', 'Just from garden', 2.90, '2018-01-11 23:53:54', '2018-01-11 23:53:54'),
	(53, 35, 2, 'Lorem Ipsum14', 'Integer congue tristique urna', 3.50, '2018-01-11 23:54:14', '2018-01-11 23:54:14');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table catering_system_3.migrations: ~4 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_10_12_000000_create_users_table', 1),
	('2016_03_31_065856_create_roles_table', 1),
	('2016_03_31_070114_create_user_role_table', 1),
	('2016_10_20_205143_create_marketingimages_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `menu_item_id` int(11) NOT NULL DEFAULT '0',
  `orderer_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `price` double(6,2) unsigned NOT NULL,
  `status` int(2) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `portion` varchar(50) DEFAULT 'full',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `menu_item_id` (`menu_item_id`),
  KEY `FK_orders_users` (`orderer_id`),
  CONSTRAINT `FK_orders_companies` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_orders_menu` FOREIGN KEY (`menu_item_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`orderer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

-- Dumping data for table catering_system_3.orders: ~129 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `company_id`, `menu_item_id`, `orderer_id`, `quantity`, `price`, `status`, `created_at`, `updated_at`, `portion`) VALUES
	(1, 35, 1, 0, 3, 0.00, 0, '2016-12-13 15:30:50', '2016-12-13 15:30:50', NULL),
	(2, 35, 23, 0, 3, 0.00, 0, '2016-12-14 18:55:33', '2016-12-14 18:55:33', NULL),
	(3, 35, 23, 0, 4, 0.00, 0, '2016-12-14 18:55:44', '2016-12-14 18:55:44', NULL),
	(4, 35, 28, 0, 3, 0.00, 0, '2016-12-14 19:00:28', '2016-12-14 19:00:28', NULL),
	(5, 35, 28, 0, 3, 0.00, 0, '2016-12-14 19:03:41', '2016-12-14 19:03:41', NULL),
	(6, 35, 28, 31, 3, 0.00, 0, '2016-12-14 19:04:17', '2016-12-14 19:04:17', NULL),
	(7, 35, 23, 75, 3, 0.00, 0, '2016-12-14 19:06:28', '2016-12-14 19:06:28', NULL),
	(8, 35, 23, 75, 3, 0.00, 0, '2016-12-14 19:06:37', '2016-12-14 19:06:37', NULL),
	(9, 35, 23, 75, 3, 0.00, 0, '2016-12-14 19:06:37', '2016-12-14 19:06:37', NULL),
	(10, 35, 23, 75, 3, 0.00, 0, '2016-12-14 19:06:37', '2016-12-14 19:06:37', NULL),
	(11, 35, 23, 75, 3, 0.00, 0, '2016-12-14 19:06:37', '2016-12-14 19:06:37', NULL),
	(12, 35, 9, 69, 2, 0.00, 0, '2016-12-17 22:57:31', '2016-12-17 22:57:31', NULL),
	(13, 35, 25, 69, 2, 0.00, 0, '2016-12-17 22:57:38', '2016-12-17 22:57:38', NULL),
	(14, 35, 26, 69, 2, 0.00, 0, '2016-12-17 22:57:43', '2016-12-17 22:57:43', NULL),
	(15, 35, 18, 31, 1, 0.00, 0, '2016-12-20 22:09:43', '2016-12-20 22:09:43', NULL),
	(16, 35, 12, 31, 2, 0.00, 0, '2016-12-20 22:10:33', '2016-12-20 22:10:33', NULL),
	(17, 37, 0, 0, 2, 0.00, 0, '2017-01-28 14:10:26', '2017-01-28 14:10:26', NULL),
	(18, 37, 0, 0, 2, 0.00, 0, '2017-05-07 15:38:50', '2017-05-07 15:38:50', NULL),
	(19, 37, 0, 0, 2, 0.00, 0, '2017-05-07 15:38:50', '2017-05-07 15:38:50', NULL),
	(20, 37, 0, 0, 4, 0.00, 0, '2017-11-02 16:40:50', '2017-11-02 16:40:50', NULL),
	(21, 0, 0, 31, 2, 0.00, 0, '2017-11-29 16:47:26', '2017-11-29 16:47:26', NULL),
	(22, 0, 0, 69, 2, 0.00, 0, '2017-11-30 22:13:48', '2017-11-30 22:13:48', NULL),
	(23, 35, 21, 0, 1, 0.00, 0, '2017-12-03 14:37:56', '2017-12-03 14:37:56', NULL),
	(24, 35, 21, 0, 1, 0.00, 0, '2017-12-03 14:38:04', '2017-12-03 14:38:04', NULL),
	(25, 35, 19, 0, 1, 0.00, 0, '2017-12-03 20:42:29', '2017-12-03 20:42:29', 'half'),
	(26, 35, 19, 0, 1, 0.00, 0, '2017-12-03 20:42:38', '2017-12-03 20:42:38', 'full'),
	(27, 35, 19, 0, 1, 0.00, 0, '2017-12-03 20:55:08', '2017-12-03 20:55:08', 'full'),
	(28, 35, 3, 69, 2, 0.00, 0, '2017-12-12 15:09:12', '2017-12-12 15:09:12', 'full'),
	(29, 35, 11, 69, 1, 0.00, 0, '2017-12-12 15:09:28', '2017-12-12 15:09:28', 'half'),
	(30, 35, 25, 0, 2, 0.00, 0, '2017-12-13 11:53:00', '2017-12-13 11:53:00', 'full'),
	(31, 35, 25, 0, 2, 0.00, 0, '2017-12-13 11:53:03', '2017-12-13 11:53:03', 'half'),
	(32, 35, 14, 0, 1, 0.00, 0, '2017-12-13 12:23:39', '2017-12-13 12:23:39', 'full'),
	(33, 35, 8, 0, 2, 0.00, 0, '2017-12-16 02:30:08', '2017-12-16 02:30:08', 'full'),
	(34, 35, 23, 0, 2, 0.00, 0, '2017-12-16 02:30:08', '2017-12-16 02:30:08', 'full'),
	(35, 35, 8, 0, 2, 0.00, 0, '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full'),
	(36, 35, 23, 0, 2, 0.00, 0, '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full'),
	(37, 35, 1, 0, 3, 15.96, 0, '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full'),
	(38, 35, 46, 0, 2, 4.00, 0, '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full'),
	(39, 35, 45, 0, 3, 0.12, 0, '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full'),
	(40, 35, 8, 0, 2, 0.00, 0, '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full'),
	(41, 35, 23, 0, 2, 0.00, 0, '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full'),
	(42, 35, 1, 0, 3, 15.96, 0, '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full'),
	(43, 35, 46, 0, 4, 8.00, 0, '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full'),
	(44, 35, 45, 0, 3, 0.12, 0, '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full'),
	(45, 35, 8, 0, 2, 0.00, 0, '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full'),
	(46, 35, 23, 0, 2, 0.00, 0, '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full'),
	(47, 35, 1, 0, 7, 37.24, 0, '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full'),
	(48, 35, 46, 0, 4, 8.00, 0, '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full'),
	(49, 35, 45, 0, 3, 0.12, 0, '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full'),
	(50, 35, 1, 0, 1, 5.32, 0, '2017-12-16 16:37:50', '2017-12-16 16:37:50', 'full'),
	(51, 35, 46, 0, 2, 4.00, 0, '2017-12-16 16:37:50', '2017-12-16 16:37:50', 'full'),
	(52, 35, 45, 0, 2, 0.08, 0, '2017-12-16 16:37:50', '2017-12-16 16:37:50', 'full'),
	(53, 35, 14, 0, 1, 0.00, 0, '2017-12-16 20:54:18', '2017-12-16 20:54:18', 'full'),
	(54, 35, 43, 0, 1, 0.00, 0, '2017-12-16 20:54:18', '2017-12-16 20:54:18', 'full'),
	(55, 35, 36, 0, 1, 0.00, 0, '2017-12-16 20:54:18', '2017-12-16 20:54:18', 'full'),
	(56, 35, 14, 0, 1, 0.00, 0, '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full'),
	(57, 35, 43, 0, 1, 0.00, 0, '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full'),
	(58, 35, 36, 0, 1, 0.00, 0, '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full'),
	(59, 35, 9, 0, 1, 0.00, 0, '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full'),
	(60, 35, 10, 0, 1, 0.00, 0, '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full'),
	(61, 35, 14, 0, 1, 0.00, 0, '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full'),
	(62, 35, 43, 0, 1, 0.00, 0, '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full'),
	(63, 35, 36, 0, 1, 0.00, 0, '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full'),
	(64, 35, 9, 0, 3, 0.00, 0, '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full'),
	(65, 35, 10, 0, 1, 0.00, 0, '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full'),
	(66, 35, 29, 0, 2, 0.00, 0, '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full'),
	(67, 35, 23, 0, 4, 0.00, 0, '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full'),
	(68, 35, 14, 0, 1, 0.00, 0, '2017-12-16 21:04:50', '2017-12-16 21:04:50', 'full'),
	(69, 35, 9, 0, 2, 0.00, 0, '2017-12-16 21:04:50', '2017-12-16 21:04:50', 'full'),
	(70, 35, 14, 0, 4, 0.00, 0, '2017-12-16 21:05:36', '2017-12-16 21:05:36', 'full'),
	(71, 35, 9, 0, 2, 0.00, 0, '2017-12-16 21:05:36', '2017-12-16 21:05:36', 'full'),
	(72, 35, 46, 0, 3, 6.00, 0, '2017-12-16 21:05:36', '2017-12-16 21:05:36', 'full'),
	(73, 35, 1, 0, 3, 15.96, 0, '2017-12-16 21:05:36', '2017-12-16 21:05:36', 'full'),
	(74, 35, 14, 0, 1, 0.00, 0, '2017-12-16 21:13:09', '2017-12-16 21:13:09', 'full'),
	(75, 35, 23, 0, 1, 0.00, 0, '2017-12-16 21:13:09', '2017-12-16 21:13:09', 'full'),
	(76, 35, 14, 0, 1, 0.00, 0, '2017-12-16 21:13:36', '2017-12-16 21:13:36', 'full'),
	(77, 35, 23, 0, 1, 0.00, 0, '2017-12-16 21:13:36', '2017-12-16 21:13:36', 'full'),
	(78, 35, 14, 0, 1, 0.00, 0, '2017-12-16 21:13:41', '2017-12-16 21:13:41', 'full'),
	(79, 35, 23, 0, 1, 0.00, 0, '2017-12-16 21:13:41', '2017-12-16 21:13:41', 'full'),
	(80, 35, 14, 0, 1, 0.00, 0, '2017-12-16 21:14:12', '2017-12-16 21:14:12', 'full'),
	(81, 35, 23, 0, 1, 0.00, 0, '2017-12-16 21:14:12', '2017-12-16 21:14:12', 'full'),
	(82, 35, 9, 0, 2, 0.00, 0, '2017-12-16 21:15:44', '2017-12-16 21:15:44', 'full'),
	(83, 35, 23, 0, 1, 0.00, 0, '2017-12-16 21:15:44', '2017-12-16 21:15:44', 'full'),
	(84, 35, 9, 0, 2, 0.00, 0, '2017-12-16 21:15:48', '2017-12-16 21:15:48', 'full'),
	(85, 35, 23, 0, 1, 0.00, 0, '2017-12-16 21:15:48', '2017-12-16 21:15:48', 'full'),
	(86, 35, 9, 0, 2, 0.00, 0, '2017-12-16 21:20:19', '2017-12-16 21:20:19', 'full'),
	(87, 35, 24, 0, 2, 0.00, 0, '2017-12-16 21:20:19', '2017-12-16 21:20:19', 'full'),
	(88, 35, 24, 0, 2, 0.00, 0, '2017-12-16 21:24:06', '2017-12-16 21:24:06', 'full'),
	(89, 35, 33, 0, 2, 0.00, 0, '2017-12-17 01:12:36', '2017-12-17 01:12:36', 'full'),
	(90, 35, 34, 0, 3, 0.00, 0, '2017-12-17 01:12:36', '2017-12-17 01:12:36', 'full'),
	(91, 35, 18, 0, 1, 0.00, 0, '2017-12-17 01:12:36', '2017-12-17 01:12:36', 'full'),
	(92, 35, 33, 0, 2, 0.00, 0, '2017-12-17 01:12:44', '2017-12-17 01:12:44', 'full'),
	(93, 35, 34, 0, 3, 0.00, 0, '2017-12-17 01:12:44', '2017-12-17 01:12:44', 'full'),
	(94, 35, 18, 0, 1, 0.00, 0, '2017-12-17 01:12:44', '2017-12-17 01:12:44', 'full'),
	(95, 35, 34, 0, 2, 0.00, 0, '2017-12-17 01:13:18', '2017-12-17 01:13:18', 'full'),
	(96, 35, 37, 0, 3, 0.00, 0, '2017-12-17 01:13:18', '2017-12-17 01:13:18', 'full'),
	(97, 35, 8, 0, 4, 0.00, 0, '2017-12-17 01:13:18', '2017-12-17 01:13:18', 'full'),
	(98, 35, 34, 0, 2, 0.00, 0, '2017-12-17 01:13:29', '2017-12-17 01:13:29', 'full'),
	(99, 35, 37, 0, 3, 0.00, 0, '2017-12-17 01:13:29', '2017-12-17 01:13:29', 'full'),
	(100, 35, 8, 0, 4, 0.00, 0, '2017-12-17 01:13:29', '2017-12-17 01:13:29', 'full'),
	(101, 35, 1, 31, 3, 15.96, 0, '2018-01-03 18:43:21', '2018-01-03 18:43:21', 'full'),
	(102, 35, 43, 31, 1, 0.00, 0, '2018-01-03 18:43:21', '2018-01-03 18:43:21', 'full'),
	(103, 35, 18, 31, 2, 0.00, 0, '2018-01-03 18:43:21', '2018-01-03 18:43:21', 'full'),
	(104, 35, 1, 31, 3, 15.96, 0, '2018-01-03 18:43:28', '2018-01-03 18:43:28', 'full'),
	(105, 35, 43, 31, 1, 0.00, 0, '2018-01-03 18:43:28', '2018-01-03 18:43:28', 'full'),
	(106, 35, 18, 31, 2, 0.00, 0, '2018-01-03 18:43:28', '2018-01-03 18:43:28', 'full'),
	(107, 35, 8, 31, 2, 0.00, 0, '2018-01-03 18:44:40', '2018-01-03 18:44:40', 'full'),
	(108, 35, 10, 31, 2, 0.00, 0, '2018-01-03 18:44:40', '2018-01-03 18:44:40', 'full'),
	(109, 35, 1, 31, 2, 10.64, 0, '2018-01-03 18:44:40', '2018-01-03 18:44:40', 'full'),
	(110, 35, 8, 31, 2, 0.00, 0, '2018-01-03 18:44:57', '2018-01-03 18:44:57', 'full'),
	(111, 35, 10, 31, 2, 0.00, 0, '2018-01-03 18:44:57', '2018-01-03 18:44:57', 'full'),
	(112, 35, 1, 31, 2, 10.64, 0, '2018-01-03 18:44:58', '2018-01-03 18:44:58', 'full'),
	(113, 35, 9, 31, 2, 0.00, 0, '2018-01-03 18:45:57', '2018-01-03 18:45:57', 'full'),
	(114, 35, 15, 31, 3, 0.00, 0, '2018-01-03 18:45:57', '2018-01-03 18:45:57', 'full'),
	(115, 35, 3, 31, 2, 0.06, 0, '2018-01-03 18:45:57', '2018-01-03 18:45:57', 'full'),
	(116, 35, 14, 31, 2, 0.00, 0, '2018-01-03 18:55:31', '2018-01-03 18:55:31', 'full'),
	(117, 35, 29, 31, 1, 0.00, 0, '2018-01-03 18:55:31', '2018-01-03 18:55:31', 'full'),
	(118, 35, 1, 31, 1, 5.32, 0, '2018-01-03 18:55:31', '2018-01-03 18:55:31', 'full'),
	(119, 35, 14, 31, 2, 0.00, 0, '2018-01-03 18:57:24', '2018-01-03 18:57:24', 'full'),
	(120, 35, 29, 31, 1, 0.00, 0, '2018-01-03 18:57:24', '2018-01-03 18:57:24', 'full'),
	(121, 35, 1, 31, 6, 31.92, 0, '2018-01-03 18:57:24', '2018-01-03 18:57:24', 'full'),
	(122, 35, 24, 31, 4, 0.00, 0, '2018-01-03 18:57:24', '2018-01-03 18:57:24', 'full'),
	(123, 35, 33, 31, 4, 0.00, 0, '2018-01-03 21:06:54', '2018-01-03 21:06:54', 'full'),
	(124, 35, 15, 31, 2, 0.00, 0, '2018-01-03 21:06:54', '2018-01-03 21:06:54', 'full'),
	(125, 35, 44, 31, 4, 0.00, 0, '2018-01-03 21:06:54', '2018-01-03 21:06:54', 'full'),
	(126, 35, 45, 31, 2, 0.08, 0, '2018-01-03 21:06:54', '2018-01-03 21:06:54', 'full'),
	(127, 60, 50, 102, 1, 5.54, 0, '2018-01-10 01:34:49', '2018-01-10 01:34:49', 'full'),
	(128, 60, 50, 102, 4, 22.16, 0, '2018-01-10 01:35:13', '2018-01-10 01:35:13', 'full'),
	(129, 35, 29, 0, 1, 0.00, 0, '2018-01-10 01:50:09', '2018-01-10 01:50:09', 'full');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table catering_system_3.roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `created_at`, `updated_at`, `name`, `description`) VALUES
	(1, '2018-01-03 18:21:02', '2018-01-03 18:21:02', 'User', 'A normal User'),
	(2, '2018-01-03 18:21:02', '2018-01-03 18:21:02', 'Company', 'Company'),
	(3, '2018-01-03 18:21:02', '2018-01-03 18:21:02', 'Admin', 'A Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.table_bookings
CREATE TABLE IF NOT EXISTS `table_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `orderer_id` int(11) NOT NULL,
  `schema_id` int(11) NOT NULL,
  `table_no` int(11) NOT NULL,
  `time` varchar(50) NOT NULL,
  `notes` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL DEFAULT '0',
  `tel_no` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_table_bookings_companies` (`company_id`),
  KEY `FK_table_bookings_users` (`user_id`),
  KEY `FK_table_bookings_users_2` (`orderer_id`),
  KEY `FK_table_bookings_table_schema` (`schema_id`),
  CONSTRAINT `FK_table_bookings_companies` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `FK_table_bookings_table_schema` FOREIGN KEY (`schema_id`) REFERENCES `table_schema` (`id`),
  CONSTRAINT `FK_table_bookings_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_table_bookings_users_2` FOREIGN KEY (`orderer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- Dumping data for table catering_system_3.table_bookings: ~22 rows (approximately)
/*!40000 ALTER TABLE `table_bookings` DISABLE KEYS */;
INSERT INTO `table_bookings` (`id`, `company_id`, `user_id`, `orderer_id`, `schema_id`, `table_no`, `time`, `notes`, `status`, `first_name`, `last_name`, `tel_no`, `email`, `created_at`, `updated_at`) VALUES
	(33, 35, 69, 102, 65, 1, '12:00', '', 1, '', '0', '0', '0', '2018-01-08 00:08:11', '2018-01-10 00:17:20'),
	(55, 62, 105, 102, 68, 0, '12:00', '', 0, '', '0', '0', '0', '2018-01-08 14:08:23', '2018-01-08 14:08:23'),
	(56, 62, 105, 102, 68, 0, '12:00', '', 0, '', '0', '0', '0', '2018-01-08 14:08:31', '2018-01-08 14:08:31'),
	(57, 62, 105, 102, 68, 0, '12:00', '', 0, '', '0', '0', '0', '2018-01-08 14:18:46', '2018-01-08 14:18:46'),
	(58, 62, 105, 102, 68, 0, '12:00', '', 0, '', '0', '0', '0', '2018-01-08 14:28:48', '2018-01-08 14:28:48'),
	(59, 62, 105, 102, 68, 2, '12:00', '', 0, '', '0', '0', '0', '2018-01-08 14:30:31', '2018-01-08 14:30:31'),
	(60, 62, 105, 102, 68, 3, '12:00', '', 0, '', '0', '0', '0', '2018-01-08 14:30:47', '2018-01-08 14:30:47'),
	(61, 62, 105, 102, 68, 1, '12:00', '', 0, '', '0', '0', '0', '2018-01-08 14:33:37', '2018-01-08 14:33:37'),
	(62, 46, 85, 102, 64, 1, '12:00', '', 0, '', '0', '0', '0', '2018-01-08 14:34:36', '2018-01-08 14:34:36'),
	(63, 46, 85, 102, 64, 2, '03:02', '', 0, 'User 2 ', 'User 2', '0', 'arekon2@gmail.com', '2018-01-08 14:51:30', '2018-01-08 14:51:30'),
	(64, 46, 85, 102, 64, 3, '00:00', '', 0, 'User 2 ', 'User 2', '0', 'arekon2@gmail.com', '2018-01-08 14:52:05', '2018-01-08 14:52:05'),
	(65, 60, 69, 102, 69, 4, '02:01', '', 0, 'User 2 ', 'User 2', '456123', 'arekon2@gmail.com', '2018-01-10 01:11:24', '2018-01-10 01:11:24'),
	(66, 60, 69, 102, 69, 3, '01:00', 'Labas as krabas', 1, 'User 2 ', 'User 2', '868716', 'arekon2@gmail.com', '2018-01-10 01:13:29', '2018-01-10 01:25:22'),
	(67, 60, 69, 102, 69, 1, '00:00', '', 0, 'User 2 ', 'User 2', '0', 'arekon2@gmail.com', '2018-01-10 01:21:48', '2018-01-10 01:25:07'),
	(68, 60, 69, 102, 70, 1, '00:00', '', 0, 'User 2 ', 'User 2', '0', 'arekon2@gmail.com', '2018-01-10 01:22:03', '2018-01-10 01:25:05'),
	(69, 90, 69, 69, 71, 2, '04:03', 'Note 1', 0, 'Beatri?e ????š??90??? /*-++', 'Brazauskien? ????š??90???', '+3803256', '@gmail.com', '2018-01-11 12:48:09', '2018-01-11 12:48:09'),
	(70, 93, 69, 69, 72, 1, '00:00', '', 0, 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:10:23', '2018-01-11 18:10:23'),
	(71, 93, 69, 69, 72, 7, '00:00', '', 0, 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:10:45', '2018-01-11 18:10:45'),
	(72, 93, 69, 69, 72, 6, '00:00', '', 0, 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:11:03', '2018-01-11 18:11:03'),
	(73, 35, 69, 69, 73, 1, '00:00', '', 0, 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:14:07', '2018-01-11 18:14:07'),
	(74, 35, 69, 69, 73, 5, '00:00', '', 0, 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:14:28', '2018-01-11 18:14:28'),
	(75, 35, 69, 69, 73, 6, '00:00', '', 0, 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:16:18', '2018-01-11 18:16:18');
/*!40000 ALTER TABLE `table_bookings` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.table_schema
CREATE TABLE IF NOT EXISTS `table_schema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `schema_name` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `table_coord` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_table_schema_companies` (`company_id`),
  KEY `FK_table_schema_users` (`user_id`),
  CONSTRAINT `FK_table_schema_companies` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `FK_table_schema_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

-- Dumping data for table catering_system_3.table_schema: ~14 rows (approximately)
/*!40000 ALTER TABLE `table_schema` DISABLE KEYS */;
INSERT INTO `table_schema` (`id`, `company_id`, `user_id`, `schema_name`, `table_coord`, `created_at`, `updated_at`) VALUES
	(58, 35, 69, '3rd floor', '[["Ec0",0,0,"notreserved table_cr4","5"],["Ec1",0,1,"notreserved table_cr4","10"],["Fc0",0,2,"notreserved table_cr5","4"],["Fc0",0,3,"notreserved table_cr5","10"],["cell_8c0",0,4,"notreserved table_cr8","10"],["Ec0",1,0,"notreserved table_cr4","11"],["Bc0",1,1,"notreserved table_cr1","1"],["Bc0",1,3,"notreserved table_cr1","8"],["cell_13c0",1,6,"notreserved table_cr13","11"],["Bc0",2,0,"notreserved table_cr1","16"],["Cc0",2,5,"notreserved table_cr2","9"],["cell_9c0",2,6,"notreserved table_cr9","12"],["Fc0",3,0,"notreserved table_cr5","7"],["Ec0",3,2,"notreserved table_cr4","12"],["Fc0",3,3,"notreserved table_cr5","13"],["cell_13c1",3,6,"notreserved table_cr13","13"],["Ec1",4,0,"notreserved table_cr4","22"],["Cc2",4,1,"notreserved table_cr2","21"],["Cc1",4,4,"notreserved table_cr2","18"],["cell_13c0",4,5,"notreserved table_cr13","11"],["Cc0",5,2,"notreserved table_cr2","17"]]', '2017-05-19 12:19:55', '2018-01-12 00:11:19'),
	(61, 35, 69, 'Terasa', '[["cell_13c0",0,2,"notreserved table_cr13","1"],["cell_13c0",1,1,"notreserved table_cr13","2"]]', '2017-12-05 23:06:37', '2018-01-12 00:11:41'),
	(62, 35, 69, '2nd floor', '[["cell_12c0",0,1,"notreserved table_cr12","1"],["cell_13c0",1,2,"notreserved table_cr13","2"]]', '2017-12-05 23:06:44', '2018-01-12 00:11:11'),
	(63, 35, 69, 'Basement', '[["cell_11c0",1,0,"notreserved table_cr11","2"],["cell_7c1",1,1,"notreserved table_cr7","16"],["cell_8c1",1,2,"notreserved table_cr8","17"],["cell_10c3",1,3,"notreserved table_cr10","18"],["cell_13c0",1,4,"notreserved table_cr13","3"],["cell_5c0",1,5,"notreserved table_cr5","21"],["cell_2c1",2,0,"notreserved table_cr2","23"],["cell_7c2",2,1,"notreserved table_cr7","20"],["cell_8c2",2,2,"notreserved table_cr8","19"],["cell_3c0",2,3,"notreserved table_cr3","9"],["cell_3c2",2,4,"notreserved table_cr3","22"],["cell_2c0",3,1,"notreserved table_cr2","10"],["cell_9c0",3,2,"notreserved table_cr9","5"],["cell_1c0",3,3,"notreserved table_cr1","24"],["cell_10c0",3,6,"notreserved table_cr10","4"],["cell_3c1",4,0,"notreserved table_cr3","11"],["cell_12c0",4,1,"notreserved table_cr12","7"],["cell_8c0",4,3,"notreserved table_cr8","12"],["cell_10c1",4,4,"notreserved table_cr10","8"],["cell_4c0",6,2,"notreserved table_cr4","13"],["cell_10c2",6,4,"notreserved table_cr10","15"],["cell_7c0",6,5,"notreserved table_cr7","14"]]', '2017-12-16 23:00:03', '2018-01-12 00:12:14'),
	(64, 46, 85, 'test', '[["cell_12c0",1,1,"table_cr12","1"],["cell_13c0",1,2,"table_cr13","2"],["cell_8c0",1,3,"table_cr8","3"]]', '2017-12-28 23:23:22', '2017-12-28 23:23:22'),
	(65, 35, 69, '2nf floor terasa', '[["cell_12c0",1,1,"notreserved table_cr12","1"],["cell_13c0",2,2,"notreserved table_cr13","2"]]', '2017-12-29 16:35:24', '2018-01-12 00:12:06'),
	(66, 43, 79, 'Test2', '[["cell_8c0",0,3,"table_cr8","3"],["cell_12c0",1,1,"table_cr12","1"],["cell_13c0",2,3,"table_cr13","2"],["cell_9c0",4,2,"table_cr9","4"]]', '2018-01-05 16:56:52', '2018-01-05 16:56:52'),
	(67, 58, 93, 'fsdfsd', '[["cell_11c0",1,0,"table_cr11","1"],["cell_13c0",1,2,"table_cr13","3"],["cell_12c0",2,1,"table_cr12","2"]]', '2018-01-06 20:14:17', '2018-01-06 20:14:17'),
	(68, 62, 105, '5345', '[["cell_1c0",2,1,"table_cr1","1"],["cell_13c1",2,2,"table_cr13","3"],["cell_13c0",4,2,"table_cr13","2"]]', '2018-01-07 23:12:09', '2018-01-07 23:12:09'),
	(69, 60, 69, '1 ausktas', '[["cell_11c0",1,0,"table_cr11","1"],["cell_13c0",1,2,"table_cr13","3"],["cell_12c0",3,1,"table_cr12","2"],["cell_11c1",4,0,"table_cr11","5"],["cell_10c0",4,3,"table_cr10","4"]]', '2018-01-10 00:59:21', '2018-01-10 00:59:21'),
	(70, 60, 69, '2 ausktas', '[["cell_7c0",1,0,"table_cr7","1"],["cell_13c0",1,2,"table_cr13","2"],["cell_9c0",2,4,"table_cr9","6"],["cell_13c1",3,1,"table_cr13","4"],["cell_12c0",5,3,"table_cr12","5"]]', '2018-01-10 00:59:36', '2018-01-10 00:59:36'),
	(71, 90, 69, '1 floor', '[["cell_12c0",2,1,"table_cr12","1"],["cell_13c1",2,5,"table_cr13","3"],["cell_13c2",2,6,"table_cr13","4"],["cell_13c0",4,3,"table_cr13","2"],["cell_13c3",5,4,"table_cr13","5"]]', '2018-01-11 12:46:22', '2018-01-11 12:46:22'),
	(72, 93, 69, '1 ausktas', '[["cell_2c0",1,1,"notreserved table_cr2","1"],["cell_13c0",1,2,"notreserved table_cr13","2"],["cell_9c0",2,3,"notreserved table_cr9","3"],["cell_7c0",3,1,"notreserved table_cr7","4"],["cell_5c0",5,1,"table_cr5","10"],["cell_8c0",6,0,"table_cr8","7"],["cell_9c0",6,2,"table_cr9","8"],["cell_7c0",6,4,"table_cr7","9"],["cell_12c0",7,1,"table_cr12","5"],["cell_13c0",7,3,"table_cr13","6"]]', '2018-01-11 14:23:37', '2018-01-11 14:31:11'),
	(73, 35, 69, '1st floor', '[["cell_8c0",0,1,"notreserved table_cr8","2"],["cell_8c1",0,3,"notreserved table_cr8","5"],["cell_6c0",1,0,"notreserved table_cr6","1"],["cell_4c0",1,2,"notreserved table_cr4","3"],["cell_9c0",1,4,"notreserved table_cr9","7"],["cell_4c1",2,1,"notreserved table_cr4","4"],["cell_7c0",2,3,"notreserved table_cr7","6"],["cell_3c0",3,2,"notreserved table_cr3","8"]]', '2018-01-11 18:13:06', '2018-01-12 00:11:03');
/*!40000 ALTER TABLE `table_schema` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `acc_type` int(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table catering_system_3.users: ~34 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `tel_no`, `acc_type`, `remember_token`, `created_at`, `updated_at`) VALUES
	(31, 'Ad', 'Min', 'arekon10@gmail.com', '$2y$10$7xb47nHvHOlMAT/g7D.Ia.xLOacduE/RIBm7rLEv90NIIomsxUTcm', '0', 1, 'bJuBq0OVSRB3kvFOllGZHMFxLBhQRqig8ypRUG171fZ3dhSUpkAYwP44iRwE', '2016-10-18 22:34:14', '2018-01-10 00:11:18'),
	(61, '3', '3', 'arekon150@gmail.com', '$2y$10$1ARaBYLmQa/WOF7vt7LsBOnOo1s7kQAJQU5/HWhhyGqhMNQfipOZq', '0', 1, 'zlbldQxCwNuiCMMxmuy9ziczhdgZqcjHlx1Ss5ar4gxXYp6f25FxoEr5cEXQ', '2016-10-23 15:37:17', '2016-10-23 22:04:34'),
	(62, 'dasd', 'dasdas', 'arekon1230@gmail.com', '$2y$10$6v8JbHDADL43n7wTGwdxh.CavT5oaeJeWnY.grY6s3jmlbjT421EK', '0', 1, 'i7OIgzv7DuApuOgr8ByX5TyV7Ok3Dkw3DZywnsZxJahea78DFH7oAr3fahbP', '2016-10-23 15:38:15', '2016-10-23 15:41:11'),
	(63, 'd', '34', 'arekon101@gmail.com', '$2y$10$Sz4OwIc8cQXLK43vFQzniOZYHel2cSeyYFTLKiyryGWGwgiVShCAe', '0', 1, 'EN80jGbnEZwE6JXvg3XhBtD6KxX5vBU4OsyS0oRajHzmJCJEGKtKVziJS0IM', '2016-10-23 15:41:53', '2016-10-23 15:43:42'),
	(64, '343', '4234', 'arekon103@gmail.com', '$2y$10$NVWXdYACOGiL7v8l3qHiheBsgQT2G1Ccjm2ce/dNdJJZpJhXsiTFO', '0', 1, 'Wrrtn77tFVoQGw56OtWiAZipuPKHoKc1adM5R6rpNOdg7rI2Q5Wv9F0NUbli', '2016-10-23 15:43:57', '2016-10-23 16:11:09'),
	(66, 'joq', 'dforn', 'arekon1033@gmail.com', '$2y$10$P7AMS1k0xkIOBLjaWud1JOIwkLs.ktn71cXcTjjSyLK8DXALtkiTi', '0', 1, '9LEpuGcM6Bq6atbMxWWkOruTX47fU0bnDe0hr9r3ZhrjxuJMNmq1ufLA6pqZ', '2016-10-23 16:12:49', '2016-10-23 16:21:11'),
	(67, 'dasd', 'dasdsa', 'arekon310@gmail.com', '$2y$10$sQ6BtKp/DuidQ3r3ThciGe4dpo2RGmuslAVkQaDq47kPNVuEcPh92', '0', 1, NULL, '2016-10-23 17:47:25', '2016-10-23 17:47:25'),
	(68, '1234', '423', 'dd@d.lt', '$2y$10$PjmJhaxdbCmp8K6L8o011uzz81VfKAjXi7FAqSCMg7gVfwDVh92N.', '0', 1, 'P60U4sBgsyqkaEkEyONH1aCJddi4EF2kcJ0sEkYE8sOHN4CB4lFxtCEgV4iT', '2016-11-14 14:49:17', '2016-11-14 14:49:45'),
	(69, 'Beatriče čęėįšųū90ąąč', 'Brazauskienė čęėįšųū90ąąč', 'arekon11@gmail.com', '$2y$10$fF5XK/tIealbTFUNc.ZIseMqNAAN4Ej9RiQn4cxUgNpm39J5IIVpi', '0', 1, '21p6RT8yw8nAHlJoGUecxeOiGvXjTPx7IAJdtOgqDz3whSijSXHHpFzrucCv', '2016-11-23 16:30:43', '2018-01-12 01:06:00'),
	(70, 'some name', 'second name', 'arekon18@gmail.com', '$2y$10$M/1Af3hW7yBsl9i/KE0SgeE8P1Hm94NGzNXwCOZgY6Jp79uKQ78jq', '0', 1, '9cilBTQo22Xx8SkGd8Wn6cvDiLM5SRmIgLoJ8mpi1wcBam48r9IY3D3ECW6K', '2016-11-23 22:45:16', '2016-11-23 22:46:23'),
	(71, 're', 'tee', 'arekon19@gmail.com', '$2y$10$iXAmrQ0GGprT1Lk7UPb.oOgfP5w.vqiEMXhoNdu9PWYH.K7sGNTWe', '0', 0, 'wqR5g269wY2WAcKkXsQt03oMU2QKZ8UPXT2AtOrbj2rrA4Irx210OIyz1Emg', '2016-11-23 22:47:34', '2016-11-23 22:48:23'),
	(74, 'd', 'ad', 'arekon112@gmail.com', '$2y$10$PFqNnry2CzPq9R1oaswhPOOLo28a13mxtsW61AtyiE72eGdojH07y', '0', 1, NULL, '2016-11-24 22:55:16', '2016-11-24 22:55:16'),
	(75, 'Jon', 'Cena', 'arekon789@gmail.com', '$2y$10$vRLY1FSCotVJ0cmlXCFfZu/sfGFzhQrrQ1yyMgmU5BZgopFn4vmpa', '0', 1, 'j4Jr59mrfPvkGrYpm3zClTgigM08UuOnF1lVDmJkpS0wAVjY6NwznUeTtqth', '2016-12-14 19:06:07', '2016-12-20 23:49:18'),
	(76, 'geras', 'maistas', 'arekon5@gmail.com', '$2y$10$o2CgHdIdY/UiOsKpVHBmO.vCk7kdn.ntH8bxbnyOuPKT7794uCaUG', '0', 1, 'T52KS8aOJiUfb88e2SpuTjMDb6nT3FOyn3eRYZ3CutbRttPs0KHS6mzwkGFY', '2016-12-15 23:11:04', '2016-12-15 23:50:55'),
	(78, 'geras weweqwe KEbabai 1', 'maistas KEbabai 1', 'arekon12@gmail.com', '$2y$10$8Pu2qzUUjRG6xPgz4xSVb.FEHOFaJZs6yjZ4AlSMJNzYX7qnDhazK', '0', 1, 'VnvKizmgNsLdi3wMMgcoaZhGOsc444wD3nTUOQgT6np6rjWh3WmUn5HIWKfu', '2016-12-15 23:53:04', '2018-01-06 23:33:40'),
	(79, 'qwe', 'eqw', 'arekon13@gmail.com', '$2y$10$Vo4h14CdcwSvHGlkQrBp2e.U.Hs2UxTLnl0lW00Pc5WLTykL6qi5q', '0', 1, 'NixJS2kYvGffcAaMBg6rfiiCsgIgopCE2YTeLNDxYBZKA4IPYQUoGsTntlDv', '2016-12-16 14:21:53', '2018-01-06 16:02:16'),
	(80, 'lala', 'dlasd', 'arekon15@gmail.com', '$2y$10$hpm3kueyPtJnURCxJ2AKjOMLPt4FRMVg0Nr1YdlTJQU59GIqtecUq', '0', 1, '8QBthzqRLzTfvIF1qL1eDTcbKJq4ucf2MAkg9oUv14NkgkdfCtO9vpmdDHdf', '2016-12-20 22:38:45', '2018-01-07 00:04:48'),
	(85, 'dsadas', 'dasdas', 'arekon1111@gmail.com', '$2y$10$a05qj7xQ0hanMHZIJ2CIWe5T6D.l3kKEYPlr6MTIhKDWxCmTe5TxG', '0', 1, NULL, '2017-12-28 22:53:41', '2017-12-28 22:53:41'),
	(89, 'Alibaba', 'Ali', 'alibaba@gmail.com', '$2y$10$WrtVCkPEqk6e9JiSfYj5QOcTAlOgIfFn8hHdcOaVbj3GWe4aldFtS', '0', 1, 'dDnJYkv86N1hLt1p65w3nVdwDgKeKNGTftIxiDdbkGd4boqhvQiUFxb7SzKn', '2018-01-05 17:02:07', '2018-01-05 21:33:42'),
	(91, 'Jonas', 'Jonaitis', 'arekon155@gmail.com', '$2y$10$GIqv8a3.M123QOlgSkJgA.kN3oK1OPScFe/f0Muo1j7aJY.zBFIo2', '0', 1, 'PKH1btM2OVzhstpb4mr6wmTkPeTL1Zv6TTDDTvSy6Xgcma0hmqzpmtx8UpLf', '2018-01-06 18:15:39', '2018-01-06 18:20:06'),
	(92, 'Jon', 'Johm', 'arekon155@gmail.com5', '$2y$10$J6uZPTyIBjUO5COxZ0isPuzApBW0lhgdFX0kJ39g4b9lBSc5TKycC', '0', 1, NULL, '2018-01-06 18:18:51', '2018-01-06 18:18:51'),
	(93, '', '', 'arekon1553@gmail.com', '$2y$10$OhdufwB4OBYu.tEmKYkY1.FqJoGj/l6lQcfn/3PPX7SsLduzR9Ycm', '0', 1, 'FJPza3I25fo6uJMks9VEKwofobuVblum3UkCxP6Kek2Bha56Fa7zhspBYYvL', '2018-01-06 18:20:21', '2018-01-06 20:22:52'),
	(95, 'fsdf', 'fsdfsd', 'arekon155fsdf3@gmail.com', '$2y$10$7UVFGh7t9z1rlzJjopfZquwOzhQS4m7equhyM4njQdo.Ms5K/0swK', '0', 1, NULL, '2018-01-06 20:22:39', '2018-01-06 20:22:39'),
	(96, 'Aleks', 'Valeks', 'arekon17@gmail.com', '$2y$10$0Yi1hztqyn/eEyAtjCMuzugdg0rRzdXDH3ZjucJjQHXflBkT5Xz5y', '0', 1, 'oghrPAfGwmIVEO3txOl54MdPrIcsDKZSupTL9GjZbAgRqjUd33Kx5WINh2as', '2018-01-06 20:50:30', '2018-01-06 20:51:42'),
	(97, 'ffdsf', 'fdsfsd', 'arekon22@gmail.com', '$2y$10$qBbmcaJ2lKF6KzXe0w6Kv.Otc.F76v/K01ncstVdjvOy12Dbin6Vy', '0', 1, 'kT2WwX6AVEDByBxUryoLpeh6QhKtqezFyusIhwVIYRE3VNWBXct4cXRUxbLX', '2018-01-06 20:55:51', '2018-01-06 20:56:02'),
	(98, '4234', '4234', 'arekon23@gmail.com', '$2y$10$D9r3aUUoTdLhHh/o7n49iuEfJ/qwUDsI2gqMgPW4y.ow3Ouv6p7e6', '0', 1, '3Tt9nSe0E5YcS4iXArwlRbzazh1ryHDXrVIt7HbMo2qcI0sEeV1wVjfYdHR0', '2018-01-06 20:56:14', '2018-01-06 20:58:00'),
	(99, 'dasdas', 'dasdas', 'arekon24@gmail.com', '$2y$10$u1TrVCFOamGsSAUtHxKMrOUADiyc9KCxGSfhRJKAN8.f9q.XN6XT.', '0', 1, 'auFunOEizV4W8307BJIMhf4kle2ZLz6pti7rPSQWKUWQMgFXoszsakPJitsT', '2018-01-06 20:58:13', '2018-01-06 20:59:39'),
	(100, 'iyuik', 'iyuiyu', 'arekon26@gmail.com', '$2y$10$7RskcpAJuGowo8vzphcKHuVGd6PXVczV3hRbYfOUqO4qa63bFlhGe', '0', 1, 'KWtfQpiqolmjPJLAmpdQcDRVc1D93Vjrag8bfdtclBugJdDoT155NyWs7mV2', '2018-01-06 20:59:50', '2018-01-06 21:22:31'),
	(101, 'User', 'User', 'arekon1@gmail.com', '$2y$10$U6mg0u3FtXVkMejLzI6iAOscRZp/pBfCWV4FdHboZAqP3cBB4f39u', '0', 0, NULL, '2018-01-07 00:05:02', '2018-01-07 00:05:02'),
	(102, 'User 2 ', 'User 2', 'arekon2@gmail.com', '$2y$10$/dF2OviNZ4244oOUthTK/.5KV5qPVggEZV9errH8CjMw6.S/6b8iW', '0', 0, 'wfWRCs1XH6EjeLbIsMqhYKhFqESfY9xfJGeBHhREktQxoOTYa5R1gWCZOyHE', '2018-01-07 13:28:37', '2018-01-10 01:35:41'),
	(103, 'User3', 'Userausaks3', 'arekon3@gmail.com', '$2y$10$ZSx0WUAxzJ0yjLlLSHw0jO1x745PUV9Bm6lf/kJakwzukBL8AxY4q', '0', 0, '3Yn5OhCboNWi4sGwmyT37jKjfYnc3xiYCqWmVMZ84x5KKQs7eKHge6UPhlx9', '2018-01-07 16:17:28', '2018-01-07 16:17:36'),
	(104, 'Company 4', 'Comapnausklas 4', 'arekon4@gmail.com', '$2y$10$NO/1TzT/BOvJoDjnZOe3kOUonppyr8wqjcx4jVWVJaxaW5Oo.gNEW', '0', 1, 'o6JZoXyGoCIG9QYVvSSLDOCce7DK7mbk4dGYv7zocleQGhcD5vb8qenby4t3', '2018-01-07 16:17:53', '2018-01-07 16:18:02'),
	(105, '444', '444', 'arekon111@gmail.com', '$2y$10$2VY8mCKKnta6asakDcqImOi3zgGzDqwO8FJ/J0/jy1JwuPIrMznXC', '0', 1, 'TlIcjJgVfdNQweaWjRfSRNYYcLj0OpvRmEJbWZivq2lNliEMqnSvRMi6b07L', '2018-01-07 23:11:25', '2018-01-07 23:39:42'),
	(106, 'lab8964u-*8*-', '/*-/*-/-*', 't@gmail.com', '$2y$10$Dqq5vxeG9ZgzciqN7TPH0e1cGQy.Ij/R9WI7yqTtdnHTQYZgKyVtm', '0', 0, NULL, '2018-01-11 11:58:01', '2018-01-11 11:58:01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table catering_system_3.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_role_roles` (`role_id`),
  KEY `FK_user_role_users` (`user_id`),
  CONSTRAINT `FK_user_role_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_user_role_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table catering_system_3.user_role: ~69 rows (approximately)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `created_at`, `updated_at`, `user_id`, `role_id`) VALUES
	(35, NULL, NULL, 30, 1),
	(36, NULL, NULL, 30, 3),
	(39, NULL, NULL, 32, 1),
	(40, NULL, NULL, 32, 2),
	(41, NULL, NULL, 32, 3),
	(48, NULL, NULL, 39, 1),
	(49, NULL, NULL, 40, 1),
	(50, NULL, NULL, 41, 1),
	(52, NULL, NULL, 43, 1),
	(58, NULL, NULL, 49, 1),
	(59, NULL, NULL, 51, 1),
	(60, NULL, NULL, 52, 1),
	(61, NULL, NULL, 53, 1),
	(62, NULL, NULL, 54, 1),
	(64, NULL, NULL, 57, 1),
	(65, NULL, NULL, 59, 1),
	(66, NULL, NULL, 60, 1),
	(86, NULL, NULL, 66, 1),
	(87, NULL, NULL, 66, 3),
	(98, NULL, NULL, 70, 2),
	(99, NULL, NULL, 76, 1),
	(120, NULL, NULL, 80, 1),
	(121, NULL, NULL, 80, 2),
	(122, NULL, NULL, 75, 1),
	(123, NULL, NULL, 75, 2),
	(124, NULL, NULL, 75, 3),
	(143, NULL, NULL, 61, 1),
	(144, NULL, NULL, 61, 2),
	(145, NULL, NULL, 61, 3),
	(209, NULL, NULL, 89, 1),
	(210, NULL, NULL, 89, 2),
	(214, NULL, NULL, 62, 1),
	(215, NULL, NULL, 62, 2),
	(216, NULL, NULL, 62, 3),
	(217, NULL, NULL, 63, 1),
	(218, NULL, NULL, 63, 2),
	(219, NULL, NULL, 63, 3),
	(220, NULL, NULL, 68, 1),
	(221, NULL, NULL, 68, 2),
	(222, NULL, NULL, 68, 3),
	(232, NULL, NULL, 74, 1),
	(233, NULL, NULL, 71, 3),
	(234, NULL, NULL, 85, 3),
	(235, NULL, NULL, 67, 1),
	(236, NULL, NULL, 64, 2),
	(237, NULL, NULL, 79, 3),
	(259, NULL, NULL, 31, 3),
	(261, NULL, NULL, 91, 1),
	(262, NULL, NULL, 91, 2),
	(263, NULL, NULL, 92, 1),
	(267, NULL, NULL, 93, 1),
	(268, NULL, NULL, 93, 2),
	(269, NULL, NULL, 95, 1),
	(270, NULL, NULL, 96, 1),
	(271, NULL, NULL, 97, 1),
	(272, NULL, NULL, 98, 1),
	(273, NULL, NULL, 99, 1),
	(274, NULL, NULL, 99, 2),
	(281, NULL, NULL, 100, 1),
	(282, NULL, NULL, 100, 2),
	(284, NULL, NULL, 78, 1),
	(285, NULL, NULL, 78, 2),
	(286, NULL, NULL, 69, 2),
	(287, NULL, NULL, 101, 1),
	(289, NULL, NULL, 103, 1),
	(291, NULL, NULL, 104, 2),
	(293, NULL, NULL, 105, 2),
	(294, NULL, NULL, 102, 1),
	(295, NULL, NULL, 106, 1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
