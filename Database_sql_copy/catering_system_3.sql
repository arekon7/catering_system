/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 100116
Source Host           : localhost:3306
Source Database       : catering_system_3

Target Server Type    : MYSQL
Target Server Version : 100116
File Encoding         : 65001

Date: 2018-01-18 04:10:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `co_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `resp_person` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `web_p` varchar(100) DEFAULT NULL,
  `tel_no` varchar(100) DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `town` varchar(500) DEFAULT NULL,
  `co_email` varchar(100) DEFAULT NULL,
  `wh_from` varchar(10) DEFAULT NULL,
  `wh_to` varchar(10) DEFAULT NULL,
  `main_pht` int(11) DEFAULT '1',
  `notes` text,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `co_name` (`co_name`),
  KEY `FK_companies_users` (`user_id`),
  CONSTRAINT `FK_companies_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES ('0', '0', '123', '321', '123', '123', '123', 'vilnius', null, '123', '123', null, null, '2018-01-17 19:27:36', '2016-12-16 14:33:05');
INSERT INTO `companies` VALUES ('35', '69', 'Jurgis ir Drakonas ', 'Beatriče Urbanavičiutė', 'www.judr.lt', '+3705165', 'Kairiukščio 59, Vilnius', 'vilnius', null, '12:00', '24:00', '3', null, '2018-01-17 19:29:13', '2016-11-23 16:30:43');
INSERT INTO `companies` VALUES ('37', '74', 'Restoranas 5', 'Tomas', 'KAzlaukas', '+3706760089648', 'VIlniaus g. 15 , Klaipeda', 'klaipeda', 'anton@gmail.com', '12:00', '22:00', '2', null, '2018-01-17 19:28:24', '2016-11-24 22:55:16');
INSERT INTO `companies` VALUES ('38', '75', 'Food out', 'food out', 'food out', '+37067600568', 'Domu g. 15, Siauliai', 'siauliai', null, '12:00', '24:00', '2', null, '2018-01-17 19:29:21', '2016-12-14 19:06:07');
INSERT INTO `companies` VALUES ('43', '79', 'Chilli Pizza', 'TOmas', 'www.Chilli.lt', '+37067600568', 'Traku g. 2, ELektenai', 'elektrenai', null, '12:00', '22:00', null, null, '2018-01-17 19:30:04', '2016-12-16 14:35:57');
INSERT INTO `companies` VALUES ('44', '80', 'Can Can DP1.1', 'Can Can', 'www.CanCan.lt', '+3789456123', 'Traku g. 15, Vilnius', 'vilnius', null, '12:00', '24:00', '2', null, '2018-01-17 19:28:33', '2016-12-20 22:38:45');
INSERT INTO `companies` VALUES ('46', '85', 'Can Can DP1.2', 'ERIKA', 'www.CanCan.lt', '+3789456123', 'Liepkalniu g. 15,  VIlnius', 'vilnius', null, '08:00', '24:00', '1', null, '2018-01-17 19:27:40', '2017-12-28 22:53:41');
INSERT INTO `companies` VALUES ('50', '89', 'Can Can DP1.3', 'Ausra P', 'fsf', '+37067600765', 'VIlniaus g. 18 , Klaipeda', 'klaipeda', null, '08:00', '24:00', '1', null, '2018-01-17 19:29:03', '2018-01-05 17:02:07');
INSERT INTO `companies` VALUES ('58', '93', null, null, null, null, null, null, null, null, null, null, null, '2018-01-06 20:13:36', '2018-01-06 20:13:36');
INSERT INTO `companies` VALUES ('60', '69', 'Can Can DP1.4', 'Ausra P', 'www.CanCan.lt', '+37067600765', 'Taragnu g. 15, VilniusKairiukščio 59, Vilnius', 'vilnius', 'test 9', '10:00', '22:00', '2', null, '2018-01-17 19:28:34', '2018-01-07 23:08:39');
INSERT INTO `companies` VALUES ('61', '69', 'Can Can DP1.5', 'Ausra K', 'www.CanCan.lt', '+37067600765', 'Kairiukščio 25 Vilnius', 'vilnius', 'test 9', '12:00', '21:00', '1', null, '2018-01-17 19:28:36', '2018-01-07 23:09:07');
INSERT INTO `companies` VALUES ('62', '105', 'Can Can DP1.6', 'Ausra M', 'www.CanCan.lt', '+37067600765', 'VIlniaus g. 11 , Klaipeda', 'klaipeda', '5345', '10:00', '22:00', '1', null, '2018-01-17 19:29:04', '2018-01-07 23:11:52');
INSERT INTO `companies` VALUES ('63', '105', 'Can Can DP1.7', 'Tomas L', 'www.CanCan.lt', '+37067600765', 'Ulonu g. 5, Vilnius', 'vilnius', '', '08:00', '21:00', '1', null, '2018-01-17 19:28:36', '2018-01-07 23:26:31');
INSERT INTO `companies` VALUES ('75', '69', 'Chilli Pizza 2', 'Romas H', 'www.chilli.lt', '+37067600765', 'Traku g. 12, Vilnius', 'vilnius', 'dasdas', '12:00', '22:00', '2', null, '2018-01-17 19:28:37', '2018-01-09 15:12:59');
INSERT INTO `companies` VALUES ('76', '69', 'Chilli Pizza 4', 'Petras G', 'www.chilli.lt', '+37067600765', 'Ulonu g. 7, Vilnius', 'vilnius', '', '10:00', '21:00', '2', null, '2018-01-17 19:28:38', '2018-01-09 15:19:23');
INSERT INTO `companies` VALUES ('77', '69', 'Chilli Pizza 5', 'Tomas L', 'www.chilli.lt', '+37067600765', 'Kairiukščio 14, Vilnius', 'vilnius', '', '08:00', '21:00', '1', null, '2018-01-17 19:28:39', '2018-01-09 15:20:32');
INSERT INTO `companies` VALUES ('80', '69', 'Chilli Pizza 6', 'Romas H', 'www.chilli.lt', '+37067600765', 'Traku g. 17, Vilnius', 'vilnius', '', '10:00', '22:00', '1', null, '2018-01-17 19:28:39', '2018-01-09 15:49:36');
INSERT INTO `companies` VALUES ('83', '69', 'Chilli Pizza 7', 'Petras G', 'www.chilli.lt', '+37067600765', 'Ulonu g. 9, Vilnius', 'vilnius', '', '10:00', '22:00', '1', null, '2018-01-17 19:28:41', '2018-01-09 16:02:08');
INSERT INTO `companies` VALUES ('87', '69', 'Restoranas 4', 'Tomas', 'www.restoranas4.lt', '+37067600765', 'Klaipedos g. 33, Klaipeda', 'klaipeda', '', '10:00', '22:00', '1', null, '2018-01-17 19:29:09', '2018-01-09 16:18:28');
INSERT INTO `companies` VALUES ('89', '69', 'Restoranas 3', 'Pavardene', 'www.restoranas3.lt', '+37067600767', 'Elektrenu g. 20, Skuodas', 'skuodas', '', '09:00', '21:00', '3', null, '2018-01-17 19:28:53', '2018-01-09 16:21:47');
INSERT INTO `companies` VALUES ('90', '69', 'Restoranas 2', 'Vardenis', 'www.judr.lt', '+37067600769', 'Kauno g. 3, Vilnius', 'vilnius', '', '10:00', '22:00', '3', null, '2018-01-17 19:28:42', '2018-01-09 17:59:47');
INSERT INTO `companies` VALUES ('93', '69', 'Restoranas 1', 'Ausra', 'www.restoranas 1.lt', '+37067600769', 'Vilniaus g. 31, Vilnius', 'vilnius', 'fsdf', '10:00', '22:00', '3', null, '2018-01-17 19:28:42', '2018-01-09 18:46:44');
INSERT INTO `companies` VALUES ('95', '69', 'Kebab Inn', 'Petras G', 'www.kebabinn.com', '+37067600769', 'Ulonu g. 11, Vilnius', 'vilnius', '', '10:00', '22:00', '9', null, '2018-01-17 19:28:44', '2018-01-09 18:55:43');
INSERT INTO `companies` VALUES ('97', '107', 'add', 'dasasd', '', '', '', null, '', '10:00', '22:00', '1', null, '2018-01-16 00:54:37', '2018-01-16 00:54:37');
INSERT INTO `companies` VALUES ('98', '69', 'Saltinelis', 'Tomas', '', '+38646', '', '', 'saltinelis@salt.lt', '10:00', '22:00', '2', '', '2018-01-18 02:08:14', '2018-01-17 18:00:49');
INSERT INTO `companies` VALUES ('99', '69', 'ff', 'ff', 'ff', 'ff', 'ff', 'panevezys', 'ff', '10:00', '22:00', '4', 'Hello my friend', '2018-01-17 23:33:06', '2018-01-17 19:02:58');
INSERT INTO `companies` VALUES ('100', '69', 'Co 2', 'Tomas', 'kmk ', '+37067600760', 'Traku 2', 'kaunas', 'co2@co2.lt', '10:00', '22:00', '1', null, '2018-01-17 21:23:02', '2018-01-17 19:21:42');
INSERT INTO `companies` VALUES ('101', '69', 'Co 3', 'Tomas', 'www.co33.lt', '+37067600751', 'Traku 22', 'klaipeda', 'co3@co2.lt', '10:00', '22:00', '2', '', '2018-01-18 02:07:39', '2018-01-17 19:32:06');
INSERT INTO `companies` VALUES ('102', '69', 'Co 4', 'Ausra', 'www.jud4r.lt', '+37067600767', 'Traku 22', 'panevezys', 'co5@co2.lt', '10:00', '22:00', '3', '', '2018-01-18 02:07:25', '2018-01-17 19:33:34');

-- ----------------------------
-- Table structure for company_images
-- ----------------------------
DROP TABLE IF EXISTS `company_images`;
CREATE TABLE `company_images` (
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
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company_images
-- ----------------------------
INSERT INTO `company_images` VALUES ('75', '6gwD4NseLwWVEwQkXgEP_1', '/imgs/companies/', 'jpg', '37', '1', '2016-11-24 22:55:16', '2016-11-24 22:55:16');
INSERT INTO `company_images` VALUES ('76', '6gwD4NseLwWVEwQkXgEP_2', '/imgs/companies/', 'jpg', '37', '2', '2016-11-24 22:55:16', '2016-11-24 22:55:16');
INSERT INTO `company_images` VALUES ('77', '6gwD4NseLwWVEwQkXgEP_3', '/imgs/companies/', 'jpg', '37', '3', '2016-11-24 22:55:16', '2016-11-24 22:55:16');
INSERT INTO `company_images` VALUES ('78', 'JrluIyeDVqG5CZMbAP9U_1', '/imgs/companies/', 'png', '38', '1', '2016-12-14 19:06:07', '2016-12-14 19:06:07');
INSERT INTO `company_images` VALUES ('79', 'JrluIyeDVqG5CZMbAP9U_2', '/imgs/companies/', 'jpg', '38', '2', '2016-12-14 19:06:07', '2016-12-14 19:06:07');
INSERT INTO `company_images` VALUES ('80', 'JrluIyeDVqG5CZMbAP9U_3', '/imgs/companies/', 'jpg', '38', '3', '2016-12-14 19:06:07', '2016-12-14 19:06:07');
INSERT INTO `company_images` VALUES ('87', 'JSAZGSMQIkId8e7rlvp2_1', '/imgs/companies/', 'jpg', '44', '1', '2016-12-20 22:38:45', '2016-12-20 22:38:45');
INSERT INTO `company_images` VALUES ('88', 'JSAZGSMQIkId8e7rlvp2_2', '/imgs/companies/', 'jpg', '44', '2', '2016-12-20 22:38:45', '2016-12-20 22:38:45');
INSERT INTO `company_images` VALUES ('89', 'JSAZGSMQIkId8e7rlvp2_3', '/imgs/companies/', 'jpg', '44', '3', '2016-12-20 22:38:45', '2016-12-20 22:38:45');
INSERT INTO `company_images` VALUES ('93', 'b5usnI4r17oh8h0WxBsD_1', '/imgs/companies/', 'jpg', '46', '1', '2017-12-28 22:53:41', '2017-12-28 22:53:41');
INSERT INTO `company_images` VALUES ('94', 'b5usnI4r17oh8h0WxBsD_2', '/imgs/companies/', 'jpg', '46', '2', '2017-12-28 22:53:41', '2017-12-28 22:53:41');
INSERT INTO `company_images` VALUES ('95', 'b5usnI4r17oh8h0WxBsD_3', '/imgs/companies/', 'jpg', '46', '3', '2017-12-28 22:53:41', '2017-12-28 22:53:41');
INSERT INTO `company_images` VALUES ('102', 'iwkzJjeVgOUZ1CKKVz0W_1', '/imgs/companies/', 'jpg', '50', '1', '2018-01-05 17:02:07', '2018-01-05 17:02:07');
INSERT INTO `company_images` VALUES ('103', 'iwkzJjeVgOUZ1CKKVz0W_2', '/imgs/companies/', 'jpg', '50', '2', '2018-01-05 17:02:07', '2018-01-05 17:02:07');
INSERT INTO `company_images` VALUES ('104', 'iwkzJjeVgOUZ1CKKVz0W_3', '/imgs/companies/', 'jpg', '50', '3', '2018-01-05 17:02:07', '2018-01-05 17:02:07');
INSERT INTO `company_images` VALUES ('114', 'Aaf9rb4w2sc7vFUdcPRt_1', '/imgs/companies/', 'jpg', '60', '1', '2018-01-07 23:08:39', '2018-01-07 23:08:39');
INSERT INTO `company_images` VALUES ('115', 'Aaf9rb4w2sc7vFUdcPRt_2', '/imgs/companies/', 'jpg', '60', '2', '2018-01-07 23:08:39', '2018-01-07 23:08:39');
INSERT INTO `company_images` VALUES ('116', 'Aaf9rb4w2sc7vFUdcPRt_3', '/imgs/companies/', 'jpg', '60', '3', '2018-01-07 23:08:39', '2018-01-07 23:08:39');
INSERT INTO `company_images` VALUES ('117', 'QcksCCtZHcbxaY45Sauf_1', '/imgs/companies/', 'jpg', '61', '1', '2018-01-07 23:09:07', '2018-01-07 23:09:07');
INSERT INTO `company_images` VALUES ('118', 'QcksCCtZHcbxaY45Sauf_2', '/imgs/companies/', 'jpg', '61', '2', '2018-01-07 23:09:07', '2018-01-07 23:09:07');
INSERT INTO `company_images` VALUES ('119', 'QcksCCtZHcbxaY45Sauf_3', '/imgs/companies/', 'jpg', '61', '3', '2018-01-07 23:09:07', '2018-01-07 23:09:07');
INSERT INTO `company_images` VALUES ('120', '3fnGkakTiSZ7AYqvvh8C_1', '/imgs/companies/', 'jpg', '62', '1', '2018-01-07 23:11:52', '2018-01-07 23:11:52');
INSERT INTO `company_images` VALUES ('121', '3fnGkakTiSZ7AYqvvh8C_2', '/imgs/companies/', 'jpg', '62', '2', '2018-01-07 23:11:52', '2018-01-07 23:11:52');
INSERT INTO `company_images` VALUES ('122', '3fnGkakTiSZ7AYqvvh8C_3', '/imgs/companies/', 'jpg', '62', '3', '2018-01-07 23:11:52', '2018-01-07 23:11:52');
INSERT INTO `company_images` VALUES ('123', 'M0pf8Hz0pugay95k1udN_1', '/imgs/companies/', 'jpg', '63', '1', '2018-01-07 23:26:31', '2018-01-07 23:26:31');
INSERT INTO `company_images` VALUES ('124', 'M0pf8Hz0pugay95k1udN_2', '/imgs/companies/', 'jpg', '63', '2', '2018-01-07 23:26:31', '2018-01-07 23:26:31');
INSERT INTO `company_images` VALUES ('125', 'M0pf8Hz0pugay95k1udN_3', '/imgs/companies/', 'jpg', '63', '3', '2018-01-07 23:26:31', '2018-01-07 23:26:31');
INSERT INTO `company_images` VALUES ('126', 'dvpVVpWHQNTjr2U1u8IH_1', '/imgs/companies/', 'jpg', '75', '1', '2018-01-09 15:12:59', '2018-01-09 15:12:59');
INSERT INTO `company_images` VALUES ('127', 'dvpVVpWHQNTjr2U1u8IH_2', '/imgs/companies/', 'jpg', '75', '2', '2018-01-09 15:12:59', '2018-01-09 15:12:59');
INSERT INTO `company_images` VALUES ('128', 'dvpVVpWHQNTjr2U1u8IH_3', '/imgs/companies/', 'jpeg', '75', '3', '2018-01-09 15:12:59', '2018-01-09 15:12:59');
INSERT INTO `company_images` VALUES ('129', 'S7ug9XNzMO6h4WqRxDhE_1', '/imgs/companies/', 'jpg', '83', '1', '2018-01-09 16:02:08', '2018-01-09 16:02:08');
INSERT INTO `company_images` VALUES ('130', 'Kx8VLd5KEQl748mazfBu_2', '/imgs/companies/', 'jpg', '83', '2', '2018-01-09 16:02:08', '2018-01-09 16:02:08');
INSERT INTO `company_images` VALUES ('139', 'SPFv9hZEHmxy99WWHncy_1', '/imgs/companies/', 'jpg', '87', '1', '2018-01-09 16:18:28', '2018-01-09 16:18:28');
INSERT INTO `company_images` VALUES ('142', '88zZIepe8PeI5YGKcRRM_7', '/imgs/companies/', 'jpg', '89', '7', '2018-01-09 16:21:47', '2018-01-09 16:21:47');
INSERT INTO `company_images` VALUES ('143', 'xdTyuQHG2XcFM8loh1K1_10', '/imgs/companies/', 'jpg', '89', '10', '2018-01-09 16:21:47', '2018-01-09 16:21:47');
INSERT INTO `company_images` VALUES ('144', 'no_image', '/imgs/', 'jpg', '90', '1', '2018-01-09 17:59:47', '2018-01-09 17:59:47');
INSERT INTO `company_images` VALUES ('152', 'h5ZQ9l66VN5vmu9yQBjA_1', '/imgs/companies/', 'jpg', '93', '1', '2018-01-09 18:46:44', '2018-01-09 18:46:44');
INSERT INTO `company_images` VALUES ('153', '3dd9dJoHx7ZNokPtaU6C_2', '/imgs/companies/', 'jpg', '93', '2', '2018-01-09 18:46:45', '2018-01-09 18:46:45');
INSERT INTO `company_images` VALUES ('154', 'ut6WoumgUXDWEj0riP9U_3', '/imgs/companies/', 'jpg', '93', '3', '2018-01-09 18:46:45', '2018-01-09 18:46:45');
INSERT INTO `company_images` VALUES ('155', '9k8qBVtv1UQvBenwE46J_4', '/imgs/companies/', 'jpg', '93', '4', '2018-01-09 18:46:45', '2018-01-09 18:46:45');
INSERT INTO `company_images` VALUES ('156', 'l9IM0Q2m7iG23PPsyoMW_5', '/imgs/companies/', 'jpg', '93', '5', '2018-01-09 18:46:45', '2018-01-09 18:46:45');
INSERT INTO `company_images` VALUES ('157', 'bs8yU1dcPO47nhHD77E2_6', '/imgs/companies/', 'jpg', '93', '6', '2018-01-09 18:46:47', '2018-01-09 18:46:47');
INSERT INTO `company_images` VALUES ('162', 'OrbqpKddHTvv9xkKkZl6_1', '/imgs/companies/', 'jpg', '95', '1', '2018-01-09 18:55:43', '2018-01-09 18:55:43');
INSERT INTO `company_images` VALUES ('163', 'Rclv2Imwp7Vsz0PYw2rW_2', '/imgs/companies/', 'jpg', '95', '2', '2018-01-09 18:55:43', '2018-01-09 18:55:43');
INSERT INTO `company_images` VALUES ('164', 'KJ7RucxmTJcEEHo2lwnd_3', '/imgs/companies/', 'jpg', '95', '3', '2018-01-09 18:55:44', '2018-01-09 18:55:44');
INSERT INTO `company_images` VALUES ('165', 'OjmR3V0jsQsHA9mxMz8w_4', '/imgs/companies/', 'jpg', '95', '4', '2018-01-09 18:55:44', '2018-01-09 18:55:44');
INSERT INTO `company_images` VALUES ('166', 'SXlXVlJIiI3AcmQrYkmk_5', '/imgs/companies/', 'jpg', '95', '5', '2018-01-09 18:55:44', '2018-01-09 18:55:44');
INSERT INTO `company_images` VALUES ('167', 'a6G0IPk2xOeNMApIPcia_6', '/imgs/companies/', 'jpg', '95', '6', '2018-01-09 18:55:44', '2018-01-09 18:55:44');
INSERT INTO `company_images` VALUES ('184', '7talITGmYMywvQzPRq2u_2', '/imgs/companies/', 'jpg', '35', '2', '2018-01-09 22:17:26', '2018-01-09 22:17:26');
INSERT INTO `company_images` VALUES ('185', '8ey0RtYS6K2PwUFmoDTR_3', '/imgs/companies/', 'jpg', '35', '3', '2018-01-09 22:17:26', '2018-01-09 22:17:26');
INSERT INTO `company_images` VALUES ('186', 'tYDhhP9tynPNP7kxwJea_4', '/imgs/companies/', 'jpg', '35', '4', '2018-01-09 22:17:26', '2018-01-09 22:17:26');
INSERT INTO `company_images` VALUES ('187', 'jtVG4u4spm9hxv1qDDME_2', '/imgs/companies/', 'jpg', '90', '2', '2018-01-11 13:03:57', '2018-01-11 13:03:57');
INSERT INTO `company_images` VALUES ('188', 'uvZipFlePfTr3TPccDYz_3', '/imgs/companies/', 'jpeg', '90', '3', '2018-01-11 18:07:20', '2018-01-11 18:07:20');
INSERT INTO `company_images` VALUES ('189', 'ferdQJYXM8ccZ2HVt3Dl_3', '/imgs/companies/', 'jpg', '89', '3', '2018-01-11 19:08:22', '2018-01-11 19:08:22');
INSERT INTO `company_images` VALUES ('190', 'z062BdVjxTq6cinx3laS_1', '/imgs/companies/', 'png', '97', '1', '2018-01-16 00:54:37', '2018-01-16 00:54:37');
INSERT INTO `company_images` VALUES ('191', 'no_image', '/imgs/', 'jpg', '98', '1', '2018-01-17 18:00:49', '2018-01-17 18:00:49');
INSERT INTO `company_images` VALUES ('192', 'no_image', '/imgs/', 'jpg', '99', '1', '2018-01-17 19:02:58', '2018-01-17 19:02:58');
INSERT INTO `company_images` VALUES ('193', 'no_image', '/imgs/', 'jpg', '100', '1', '2018-01-17 19:21:42', '2018-01-17 19:21:42');
INSERT INTO `company_images` VALUES ('194', 'no_image', '/imgs/', 'jpg', '101', '1', '2018-01-17 19:32:06', '2018-01-17 19:32:06');
INSERT INTO `company_images` VALUES ('195', 'no_image', '/imgs/', 'jpg', '102', '1', '2018-01-17 19:33:34', '2018-01-17 19:33:34');
INSERT INTO `company_images` VALUES ('196', 'ktbHgUOmQY2mhivXkZNG_2', '/imgs/companies/', 'jpg', '101', '2', '2018-01-17 23:10:50', '2018-01-17 23:10:50');
INSERT INTO `company_images` VALUES ('197', 'Pm1c5Pe8M8dlGfjF7k6N_3', '/imgs/companies/', 'jpg', '101', '3', '2018-01-17 23:10:50', '2018-01-17 23:10:50');
INSERT INTO `company_images` VALUES ('198', 'SIzunmOPFaOVeoBws0jG_4', '/imgs/companies/', 'jpg', '101', '4', '2018-01-17 23:10:50', '2018-01-17 23:10:50');
INSERT INTO `company_images` VALUES ('199', 'cZCtYZ6Go3VxOsV9dGh7_2', '/imgs/companies/', 'jpg', '99', '2', '2018-01-17 23:31:48', '2018-01-17 23:31:48');
INSERT INTO `company_images` VALUES ('200', 'h4Jzl3q4xd8WOg4eXkFX_3', '/imgs/companies/', 'jpg', '99', '3', '2018-01-17 23:31:48', '2018-01-17 23:31:48');
INSERT INTO `company_images` VALUES ('201', 'yiejM7iwtCvrqv1Lyt9A_4', '/imgs/companies/', 'jpg', '99', '4', '2018-01-17 23:31:48', '2018-01-17 23:31:48');
INSERT INTO `company_images` VALUES ('202', 'ijrlDSuvinqZ376tFsav_2', '/imgs/companies/', 'jpg', '102', '2', '2018-01-18 02:07:19', '2018-01-18 02:07:19');
INSERT INTO `company_images` VALUES ('203', 'QRjVBBzFB6otntUQCNKF_3', '/imgs/companies/', 'jpg', '102', '3', '2018-01-18 02:07:19', '2018-01-18 02:07:19');
INSERT INTO `company_images` VALUES ('204', 'CBPE3ljBDWpE4KtjjMpx_2', '/imgs/companies/', 'jpg', '98', '2', '2018-01-18 02:08:09', '2018-01-18 02:08:09');

-- ----------------------------
-- Table structure for food_categories
-- ----------------------------
DROP TABLE IF EXISTS `food_categories`;
CREATE TABLE `food_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) CHARACTER SET utf8 DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_food_categories_companies` (`company_id`),
  CONSTRAINT `FK_food_categories_companies` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of food_categories
-- ----------------------------
INSERT INTO `food_categories` VALUES ('1', 'Appetizers', '35', '2017-12-04 16:29:50', '2018-01-18 00:36:16');
INSERT INTO `food_categories` VALUES ('2', 'Salads2', '35', '2017-12-04 16:29:50', '2018-01-18 00:33:53');
INSERT INTO `food_categories` VALUES ('3', 'Main courses', '35', '2017-12-04 16:29:50', '2017-12-08 00:33:14');
INSERT INTO `food_categories` VALUES ('4', 'Desserts', '35', '2017-12-04 16:29:50', '2017-12-08 00:33:15');
INSERT INTO `food_categories` VALUES ('5', 'Non alco drinks', '35', '2017-12-04 16:29:50', '2017-12-08 00:33:16');
INSERT INTO `food_categories` VALUES ('6', 'Alco drinks', '35', '2017-12-04 16:29:50', '2017-12-08 00:33:16');
INSERT INTO `food_categories` VALUES ('8', 'Appetizers', '35', '2017-12-04 14:30:37', '2017-12-08 00:33:19');
INSERT INTO `food_categories` VALUES ('9', 'test', '0', '2017-12-04 14:36:36', '2017-12-04 14:36:36');
INSERT INTO `food_categories` VALUES ('10', 'test', '0', '2017-12-04 14:37:00', '2017-12-04 14:37:00');
INSERT INTO `food_categories` VALUES ('11', 'ff', '0', '2017-12-04 14:38:50', '2017-12-04 14:38:50');
INSERT INTO `food_categories` VALUES ('12', 'Appetizers', '35', '2017-12-04 14:41:15', '2017-12-04 14:41:15');
INSERT INTO `food_categories` VALUES ('15', 'Appetizers cat1', '35', '2017-12-08 13:58:55', '2017-12-08 13:58:55');
INSERT INTO `food_categories` VALUES ('16', 'Appetizers', '35', '2017-12-08 14:02:00', '2017-12-08 14:02:00');
INSERT INTO `food_categories` VALUES ('17', 'Appetizers', '35', '2017-12-08 14:02:42', '2017-12-08 14:02:42');
INSERT INTO `food_categories` VALUES ('18', 'Appetizers', '35', '2017-12-08 14:03:04', '2017-12-08 14:03:04');
INSERT INTO `food_categories` VALUES ('19', 'Desserts', '35', '2017-12-08 14:05:07', '2017-12-08 14:05:07');
INSERT INTO `food_categories` VALUES ('20', 'Desserts', '35', '2017-12-08 14:05:09', '2017-12-08 14:05:09');
INSERT INTO `food_categories` VALUES ('21', 'Desserts', '35', '2017-12-08 14:06:03', '2017-12-08 14:06:03');
INSERT INTO `food_categories` VALUES ('22', 'Desserts', '35', '2017-12-08 14:06:05', '2017-12-08 14:06:05');
INSERT INTO `food_categories` VALUES ('23', 'Desserts', '35', '2017-12-08 14:06:09', '2017-12-08 14:06:09');
INSERT INTO `food_categories` VALUES ('24', 'Desserts', '35', '2017-12-08 14:06:15', '2017-12-08 14:06:15');
INSERT INTO `food_categories` VALUES ('25', 'Desserts', '35', '2017-12-08 14:07:50', '2017-12-08 14:07:50');
INSERT INTO `food_categories` VALUES ('26', 'Desserts', '35', '2017-12-08 14:08:47', '2017-12-08 14:08:47');
INSERT INTO `food_categories` VALUES ('27', 'Desserts', '35', '2017-12-08 14:09:17', '2017-12-08 14:09:17');
INSERT INTO `food_categories` VALUES ('28', 'Desserts', '35', '2017-12-11 21:14:38', '2017-12-11 21:14:38');
INSERT INTO `food_categories` VALUES ('29', 'Appetizers', '40', '2018-01-06 21:29:56', '2018-01-06 21:29:56');
INSERT INTO `food_categories` VALUES ('30', 'test cat', '60', '2018-01-10 00:57:54', '2018-01-10 00:57:54');
INSERT INTO `food_categories` VALUES ('31', 'etst cat 2', '60', '2018-01-10 00:58:06', '2018-01-10 00:58:06');
INSERT INTO `food_categories` VALUES ('32', 'Salotos', '60', '2018-01-10 00:58:13', '2018-01-10 00:58:13');
INSERT INTO `food_categories` VALUES ('33', 'Kids menu', '35', '2018-01-11 23:44:17', '2018-01-11 23:44:17');
INSERT INTO `food_categories` VALUES ('34', 'test.', '35', '2018-01-15 21:35:45', '2018-01-15 21:35:45');
INSERT INTO `food_categories` VALUES ('35', 'first_cat', '50', '2018-01-15 23:13:35', '2018-01-15 23:13:35');
INSERT INTO `food_categories` VALUES ('36', 'second cat', '50', '2018-01-15 23:14:24', '2018-01-15 23:14:24');
INSERT INTO `food_categories` VALUES ('37', 'third cat', '50', '2018-01-15 23:14:31', '2018-01-15 23:14:31');
INSERT INTO `food_categories` VALUES ('38', 'New cat', '35', '2018-01-17 20:26:55', '2018-01-17 20:26:55');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('2', '37', '5', 'Juice', 'Apple juice', '2.00', '2017-12-06 00:44:03', '2018-01-12 01:48:16');
INSERT INTO `menu` VALUES ('5', '35', '19', 'Ice cream12345d4d3', 'Integer congue tristique urndda', '777.00', '2017-12-06 00:44:03', '2018-01-15 21:35:22');
INSERT INTO `menu` VALUES ('7', '35', '6', 'Long Island', 'Best coctail on the market', '5.00', '2017-12-06 00:44:03', '2018-01-12 01:48:11');
INSERT INTO `menu` VALUES ('8', '35', '1', 'Lorem Ipsum1', 'Integer congue tristique urna', '3.50', '2017-12-06 00:44:03', '2018-01-12 01:54:30');
INSERT INTO `menu` VALUES ('9', '35', '3', 'Lorem Ipsum4', 'Integer congue tristique urna', '4.00', '2017-12-06 00:44:03', '2018-01-12 01:54:48');
INSERT INTO `menu` VALUES ('10', '35', '4', 'Lorem Ipsum9', 'Integer congue tristique urna', '3.50', '2017-12-06 00:44:03', '2018-01-12 01:54:34');
INSERT INTO `menu` VALUES ('11', '35', '5', 'Juice', 'Tomato fresh juice', '0.00', '2017-12-06 00:44:03', '2017-12-06 00:44:03');
INSERT INTO `menu` VALUES ('12', '35', '6', 'Cuba libre', 'Best coctail on the market', '4.00', '2017-12-06 00:44:03', '2018-01-12 01:48:01');
INSERT INTO `menu` VALUES ('14', '35', '3', 'Lorem Ipsum5', 'Integer congue tristique urna', '3.50', '2017-12-06 00:44:03', '2018-01-12 01:54:33');
INSERT INTO `menu` VALUES ('15', '35', '4', 'Lorem Ipsum10', 'Integer congue tristique urna', '4.00', '2017-12-06 00:44:03', '2018-01-12 01:54:51');
INSERT INTO `menu` VALUES ('16', '35', '5', 'Juice', 'Tomato fresh juice', '0.00', '2017-12-06 00:44:03', '2017-12-06 00:44:03');
INSERT INTO `menu` VALUES ('17', '35', '6', 'White Russia', 'Best coctail on the market', '3.00', '2017-12-06 00:44:03', '2018-01-12 01:47:58');
INSERT INTO `menu` VALUES ('18', '35', '1', 'Lorem Ipsum2', 'Integer congue tristique urna', '4.00', '2017-12-06 00:44:03', '2018-01-12 01:54:48');
INSERT INTO `menu` VALUES ('19', '35', '3', 'Lorem Ipsum6', 'Integer congue tristique urna', '4.00', '2017-12-06 00:44:03', '2018-01-12 01:54:49');
INSERT INTO `menu` VALUES ('20', '35', '4', 'Lorem Ipsum11', 'Integer congue tristique urna', '3.50', '2017-12-06 00:44:03', '2018-01-12 01:54:35');
INSERT INTO `menu` VALUES ('21', '35', '5', 'Juice', 'Tomato fresh juice', '0.00', '2017-12-06 00:44:03', '2017-12-06 00:44:03');
INSERT INTO `menu` VALUES ('22', '35', '6', 'Gin Tonic', 'Best coctail on the market', '3.00', '2017-12-06 00:44:03', '2018-01-12 01:47:54');
INSERT INTO `menu` VALUES ('23', '35', '1', 'Lorem Ipsum3', 'Integer congue tristique urna', '3.00', '2017-12-06 00:44:03', '2018-01-12 02:04:23');
INSERT INTO `menu` VALUES ('24', '35', '3', 'Lorem Ipsum7', 'Integer congue tristique urna', '3.50', '2017-12-06 00:44:03', '2018-01-12 01:54:34');
INSERT INTO `menu` VALUES ('25', '35', '4', 'Lorem Ipsum12', 'Integer congue tristique urna', '0.00', '2017-12-06 00:44:03', '2018-01-12 01:52:04');
INSERT INTO `menu` VALUES ('26', '35', '5', 'Juice', 'Tomato fresh juice', '0.00', '2017-12-06 00:44:03', '2017-12-06 00:44:03');
INSERT INTO `menu` VALUES ('27', '35', '6', 'Jeger Bull', 'Best coctail on the market', '3.00', '2017-12-06 00:44:03', '2018-01-12 01:47:52');
INSERT INTO `menu` VALUES ('28', '35', '1', 'Beaf', 'Beaf', '4.00', '2017-12-06 00:44:03', '2018-01-12 01:54:46');
INSERT INTO `menu` VALUES ('29', '35', '3', 'Lorem Ipsum8', 'Integer congue tristique urna', '3.50', '2017-12-06 00:44:03', '2018-01-12 01:54:37');
INSERT INTO `menu` VALUES ('30', '35', '4', 'Ice cream', 'Integer congue tristique urna', '4.00', '2017-12-06 00:44:03', '2018-01-12 01:54:54');
INSERT INTO `menu` VALUES ('31', '35', '5', 'Tomato juice', 'Tomato fresh juice', '0.00', '2017-12-06 00:44:03', '2018-01-12 01:48:25');
INSERT INTO `menu` VALUES ('32', '35', '6', 'Beer', 'Best coctail on the market', '3.00', '2017-12-06 00:44:03', '2018-01-12 01:47:49');
INSERT INTO `menu` VALUES ('33', '35', '1', 'Fried bread1', 'Good with beer', '3.50', '2017-12-06 00:44:03', '2018-01-12 01:54:33');
INSERT INTO `menu` VALUES ('37', '35', '1', 'Cuba libre', 'Good taste', '3.50', '2017-12-07 23:11:26', '2018-01-12 01:54:29');
INSERT INTO `menu` VALUES ('50', '60', '32', 'Cezerio salotos', 'Labas skanuu', '5.54', '2018-01-10 00:58:53', '2018-01-10 00:58:53');
INSERT INTO `menu` VALUES ('51', '35', '2', 'Cesar salad', 'Best salad in town', '3.50', '2018-01-11 23:53:05', '2018-01-11 23:53:05');
INSERT INTO `menu` VALUES ('52', '35', '2', 'Fresh vegetables salad', 'Just from garden', '2.90', '2018-01-11 23:53:54', '2018-01-11 23:53:54');
INSERT INTO `menu` VALUES ('53', '35', '2', 'Lorem Ipsum14', 'Integer congue tristique urna', '3.50', '2018-01-11 23:54:14', '2018-01-11 23:54:14');
INSERT INTO `menu` VALUES ('54', '50', '35', 'first_menu item 1', 'first_menu item 1', '7.12', '2018-01-15 23:14:07', '2018-01-15 23:14:07');
INSERT INTO `menu` VALUES ('55', '50', '36', 'lorem ipsum 2', 'lorem ipsum 2', '5.50', '2018-01-15 23:15:09', '2018-01-15 23:15:09');
INSERT INTO `menu` VALUES ('56', '50', '37', 'lorem ipsum 3', 'lorem ipsum 3', '8.30', '2018-01-15 23:15:22', '2018-01-15 23:15:22');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2016_03_31_065856_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('2016_03_31_070114_create_user_role_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_20_205143_create_marketingimages_table', '2');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '35', '1', '0', '3', '0.00', '0', '2016-12-13 15:30:50', '2018-01-17 22:28:45', null);
INSERT INTO `orders` VALUES ('2', '35', '23', '0', '3', '0.00', '0', '2016-12-14 18:55:33', '2018-01-18 01:29:35', null);
INSERT INTO `orders` VALUES ('3', '35', '23', '0', '4', '0.00', '1', '2016-12-14 18:55:44', '2018-01-18 01:29:25', null);
INSERT INTO `orders` VALUES ('7', '35', '23', '75', '3', '0.00', '0', '2016-12-14 19:06:28', '2016-12-14 19:06:28', null);
INSERT INTO `orders` VALUES ('9', '35', '23', '75', '3', '0.00', '0', '2016-12-14 19:06:37', '2016-12-14 19:06:37', null);
INSERT INTO `orders` VALUES ('12', '35', '9', '69', '2', '0.00', '1', '2016-12-17 22:57:31', '2018-01-17 23:34:27', null);
INSERT INTO `orders` VALUES ('13', '35', '25', '69', '2', '0.00', '0', '2016-12-17 22:57:38', '2016-12-17 22:57:38', null);
INSERT INTO `orders` VALUES ('14', '35', '26', '69', '2', '0.00', '0', '2016-12-17 22:57:43', '2016-12-17 22:57:43', null);
INSERT INTO `orders` VALUES ('15', '35', '18', '31', '1', '0.00', '0', '2016-12-20 22:09:43', '2016-12-20 22:09:43', null);
INSERT INTO `orders` VALUES ('16', '35', '12', '31', '2', '0.00', '0', '2016-12-20 22:10:33', '2016-12-20 22:10:33', null);
INSERT INTO `orders` VALUES ('17', '37', '0', '0', '2', '0.00', '0', '2017-01-28 14:10:26', '2017-01-28 14:10:26', null);
INSERT INTO `orders` VALUES ('18', '37', '0', '0', '2', '0.00', '0', '2017-05-07 15:38:50', '2017-05-07 15:38:50', null);
INSERT INTO `orders` VALUES ('19', '37', '0', '0', '2', '0.00', '0', '2017-05-07 15:38:50', '2017-05-07 15:38:50', null);
INSERT INTO `orders` VALUES ('20', '37', '0', '0', '4', '0.00', '0', '2017-11-02 16:40:50', '2017-11-02 16:40:50', null);
INSERT INTO `orders` VALUES ('21', '0', '0', '31', '2', '0.00', '0', '2017-11-29 16:47:26', '2017-11-29 16:47:26', null);
INSERT INTO `orders` VALUES ('22', '0', '0', '69', '2', '0.00', '0', '2017-11-30 22:13:48', '2017-11-30 22:13:48', null);
INSERT INTO `orders` VALUES ('23', '35', '21', '0', '1', '0.00', '0', '2017-12-03 14:37:56', '2017-12-03 14:37:56', null);
INSERT INTO `orders` VALUES ('24', '35', '21', '0', '1', '0.00', '0', '2017-12-03 14:38:04', '2017-12-03 14:38:04', null);
INSERT INTO `orders` VALUES ('25', '35', '19', '0', '1', '0.00', '0', '2017-12-03 20:42:29', '2017-12-03 20:42:29', 'half');
INSERT INTO `orders` VALUES ('26', '35', '19', '0', '1', '0.00', '0', '2017-12-03 20:42:38', '2017-12-03 20:42:38', 'full');
INSERT INTO `orders` VALUES ('27', '35', '19', '0', '1', '0.00', '0', '2017-12-03 20:55:08', '2017-12-03 20:55:08', 'full');
INSERT INTO `orders` VALUES ('28', '35', '3', '69', '2', '0.00', '0', '2017-12-12 15:09:12', '2017-12-12 15:09:12', 'full');
INSERT INTO `orders` VALUES ('29', '35', '11', '69', '1', '0.00', '0', '2017-12-12 15:09:28', '2017-12-12 15:09:28', 'half');
INSERT INTO `orders` VALUES ('30', '35', '25', '0', '2', '0.00', '0', '2017-12-13 11:53:00', '2017-12-13 11:53:00', 'full');
INSERT INTO `orders` VALUES ('31', '35', '25', '0', '2', '0.00', '0', '2017-12-13 11:53:03', '2017-12-13 11:53:03', 'half');
INSERT INTO `orders` VALUES ('32', '35', '14', '0', '1', '0.00', '0', '2017-12-13 12:23:39', '2017-12-13 12:23:39', 'full');
INSERT INTO `orders` VALUES ('33', '35', '8', '0', '2', '0.00', '0', '2017-12-16 02:30:08', '2017-12-16 02:30:08', 'full');
INSERT INTO `orders` VALUES ('34', '35', '23', '0', '2', '0.00', '0', '2017-12-16 02:30:08', '2017-12-16 02:30:08', 'full');
INSERT INTO `orders` VALUES ('35', '35', '8', '0', '2', '0.00', '0', '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full');
INSERT INTO `orders` VALUES ('36', '35', '23', '0', '2', '0.00', '0', '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full');
INSERT INTO `orders` VALUES ('37', '35', '1', '0', '3', '15.96', '0', '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full');
INSERT INTO `orders` VALUES ('38', '35', '46', '0', '2', '4.00', '0', '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full');
INSERT INTO `orders` VALUES ('39', '35', '45', '0', '3', '0.12', '0', '2017-12-16 02:31:27', '2017-12-16 02:31:27', 'full');
INSERT INTO `orders` VALUES ('40', '35', '8', '0', '2', '0.00', '0', '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full');
INSERT INTO `orders` VALUES ('41', '35', '23', '0', '2', '0.00', '0', '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full');
INSERT INTO `orders` VALUES ('42', '35', '1', '0', '3', '15.96', '0', '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full');
INSERT INTO `orders` VALUES ('43', '35', '46', '0', '4', '8.00', '0', '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full');
INSERT INTO `orders` VALUES ('44', '35', '45', '0', '3', '0.12', '0', '2017-12-16 02:32:53', '2017-12-16 02:32:53', 'full');
INSERT INTO `orders` VALUES ('45', '35', '8', '0', '2', '0.00', '0', '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full');
INSERT INTO `orders` VALUES ('46', '35', '23', '0', '2', '0.00', '0', '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full');
INSERT INTO `orders` VALUES ('47', '35', '1', '0', '7', '37.24', '0', '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full');
INSERT INTO `orders` VALUES ('48', '35', '46', '0', '4', '8.00', '0', '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full');
INSERT INTO `orders` VALUES ('49', '35', '45', '0', '3', '0.12', '0', '2017-12-16 02:33:06', '2017-12-16 02:33:06', 'full');
INSERT INTO `orders` VALUES ('50', '35', '1', '0', '1', '5.32', '0', '2017-12-16 16:37:50', '2017-12-16 16:37:50', 'full');
INSERT INTO `orders` VALUES ('51', '35', '46', '0', '2', '4.00', '0', '2017-12-16 16:37:50', '2017-12-16 16:37:50', 'full');
INSERT INTO `orders` VALUES ('52', '35', '45', '0', '2', '0.08', '0', '2017-12-16 16:37:50', '2017-12-16 16:37:50', 'full');
INSERT INTO `orders` VALUES ('53', '35', '14', '0', '1', '0.00', '0', '2017-12-16 20:54:18', '2017-12-16 20:54:18', 'full');
INSERT INTO `orders` VALUES ('54', '35', '43', '0', '1', '0.00', '0', '2017-12-16 20:54:18', '2017-12-16 20:54:18', 'full');
INSERT INTO `orders` VALUES ('55', '35', '36', '0', '1', '0.00', '0', '2017-12-16 20:54:18', '2017-12-16 20:54:18', 'full');
INSERT INTO `orders` VALUES ('56', '35', '14', '0', '1', '0.00', '0', '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full');
INSERT INTO `orders` VALUES ('57', '35', '43', '0', '1', '0.00', '0', '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full');
INSERT INTO `orders` VALUES ('58', '35', '36', '0', '1', '0.00', '0', '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full');
INSERT INTO `orders` VALUES ('59', '35', '9', '0', '1', '0.00', '0', '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full');
INSERT INTO `orders` VALUES ('60', '35', '10', '0', '1', '0.00', '0', '2017-12-16 20:54:39', '2017-12-16 20:54:39', 'full');
INSERT INTO `orders` VALUES ('61', '35', '14', '0', '1', '0.00', '0', '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full');
INSERT INTO `orders` VALUES ('62', '35', '43', '0', '1', '0.00', '0', '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full');
INSERT INTO `orders` VALUES ('63', '35', '36', '0', '1', '0.00', '0', '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full');
INSERT INTO `orders` VALUES ('64', '35', '9', '0', '3', '0.00', '0', '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full');
INSERT INTO `orders` VALUES ('65', '35', '10', '0', '1', '0.00', '0', '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full');
INSERT INTO `orders` VALUES ('66', '35', '29', '0', '2', '0.00', '0', '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full');
INSERT INTO `orders` VALUES ('67', '35', '23', '0', '4', '0.00', '0', '2017-12-16 21:03:16', '2017-12-16 21:03:16', 'full');
INSERT INTO `orders` VALUES ('68', '35', '14', '0', '1', '0.00', '0', '2017-12-16 21:04:50', '2017-12-16 21:04:50', 'full');
INSERT INTO `orders` VALUES ('69', '35', '9', '0', '2', '0.00', '0', '2017-12-16 21:04:50', '2017-12-16 21:04:50', 'full');
INSERT INTO `orders` VALUES ('70', '35', '14', '0', '4', '0.00', '0', '2017-12-16 21:05:36', '2017-12-16 21:05:36', 'full');
INSERT INTO `orders` VALUES ('71', '35', '9', '0', '2', '0.00', '0', '2017-12-16 21:05:36', '2017-12-16 21:05:36', 'full');
INSERT INTO `orders` VALUES ('72', '35', '46', '0', '3', '6.00', '0', '2017-12-16 21:05:36', '2017-12-16 21:05:36', 'full');
INSERT INTO `orders` VALUES ('73', '35', '1', '0', '3', '15.96', '0', '2017-12-16 21:05:36', '2017-12-16 21:05:36', 'full');
INSERT INTO `orders` VALUES ('74', '35', '14', '0', '1', '0.00', '0', '2017-12-16 21:13:09', '2017-12-16 21:13:09', 'full');
INSERT INTO `orders` VALUES ('75', '35', '23', '0', '1', '0.00', '0', '2017-12-16 21:13:09', '2017-12-16 21:13:09', 'full');
INSERT INTO `orders` VALUES ('76', '35', '14', '0', '1', '0.00', '0', '2017-12-16 21:13:36', '2017-12-16 21:13:36', 'full');
INSERT INTO `orders` VALUES ('77', '35', '23', '0', '1', '0.00', '0', '2017-12-16 21:13:36', '2017-12-16 21:13:36', 'full');
INSERT INTO `orders` VALUES ('78', '35', '14', '0', '1', '0.00', '0', '2017-12-16 21:13:41', '2017-12-16 21:13:41', 'full');
INSERT INTO `orders` VALUES ('79', '35', '23', '0', '1', '0.00', '0', '2017-12-16 21:13:41', '2017-12-16 21:13:41', 'full');
INSERT INTO `orders` VALUES ('80', '35', '14', '0', '1', '0.00', '0', '2017-12-16 21:14:12', '2017-12-16 21:14:12', 'full');
INSERT INTO `orders` VALUES ('81', '35', '23', '0', '1', '0.00', '0', '2017-12-16 21:14:12', '2017-12-16 21:14:12', 'full');
INSERT INTO `orders` VALUES ('82', '35', '9', '0', '2', '0.00', '0', '2017-12-16 21:15:44', '2017-12-16 21:15:44', 'full');
INSERT INTO `orders` VALUES ('83', '35', '23', '0', '1', '0.00', '0', '2017-12-16 21:15:44', '2017-12-16 21:15:44', 'full');
INSERT INTO `orders` VALUES ('84', '35', '9', '0', '2', '0.00', '0', '2017-12-16 21:15:48', '2017-12-16 21:15:48', 'full');
INSERT INTO `orders` VALUES ('85', '35', '23', '0', '1', '0.00', '0', '2017-12-16 21:15:48', '2017-12-16 21:15:48', 'full');
INSERT INTO `orders` VALUES ('86', '35', '9', '0', '2', '0.00', '0', '2017-12-16 21:20:19', '2017-12-16 21:20:19', 'full');
INSERT INTO `orders` VALUES ('87', '35', '24', '0', '2', '0.00', '0', '2017-12-16 21:20:19', '2017-12-16 21:20:19', 'full');
INSERT INTO `orders` VALUES ('88', '35', '24', '0', '2', '0.00', '0', '2017-12-16 21:24:06', '2017-12-16 21:24:06', 'full');
INSERT INTO `orders` VALUES ('89', '35', '33', '0', '2', '0.00', '0', '2017-12-17 01:12:36', '2017-12-17 01:12:36', 'full');
INSERT INTO `orders` VALUES ('90', '35', '34', '0', '3', '0.00', '0', '2017-12-17 01:12:36', '2017-12-17 01:12:36', 'full');
INSERT INTO `orders` VALUES ('91', '35', '18', '0', '1', '0.00', '0', '2017-12-17 01:12:36', '2017-12-17 01:12:36', 'full');
INSERT INTO `orders` VALUES ('92', '35', '33', '0', '2', '0.00', '0', '2017-12-17 01:12:44', '2017-12-17 01:12:44', 'full');
INSERT INTO `orders` VALUES ('93', '35', '34', '0', '3', '0.00', '0', '2017-12-17 01:12:44', '2017-12-17 01:12:44', 'full');
INSERT INTO `orders` VALUES ('94', '35', '18', '0', '1', '0.00', '0', '2017-12-17 01:12:44', '2017-12-17 01:12:44', 'full');
INSERT INTO `orders` VALUES ('95', '35', '34', '0', '2', '0.00', '0', '2017-12-17 01:13:18', '2017-12-17 01:13:18', 'full');
INSERT INTO `orders` VALUES ('96', '35', '37', '0', '3', '0.00', '0', '2017-12-17 01:13:18', '2017-12-17 01:13:18', 'full');
INSERT INTO `orders` VALUES ('97', '35', '8', '0', '4', '0.00', '0', '2017-12-17 01:13:18', '2017-12-17 01:13:18', 'full');
INSERT INTO `orders` VALUES ('98', '35', '34', '0', '2', '0.00', '0', '2017-12-17 01:13:29', '2017-12-17 01:13:29', 'full');
INSERT INTO `orders` VALUES ('99', '35', '37', '0', '3', '0.00', '0', '2017-12-17 01:13:29', '2017-12-17 01:13:29', 'full');
INSERT INTO `orders` VALUES ('100', '35', '8', '0', '4', '0.00', '0', '2017-12-17 01:13:29', '2017-12-17 01:13:29', 'full');
INSERT INTO `orders` VALUES ('101', '35', '1', '31', '3', '15.96', '0', '2018-01-03 18:43:21', '2018-01-03 18:43:21', 'full');
INSERT INTO `orders` VALUES ('102', '35', '43', '31', '1', '0.00', '0', '2018-01-03 18:43:21', '2018-01-03 18:43:21', 'full');
INSERT INTO `orders` VALUES ('103', '35', '18', '31', '2', '0.00', '0', '2018-01-03 18:43:21', '2018-01-03 18:43:21', 'full');
INSERT INTO `orders` VALUES ('104', '35', '1', '31', '3', '15.96', '0', '2018-01-03 18:43:28', '2018-01-03 18:43:28', 'full');
INSERT INTO `orders` VALUES ('105', '35', '43', '31', '1', '0.00', '0', '2018-01-03 18:43:28', '2018-01-03 18:43:28', 'full');
INSERT INTO `orders` VALUES ('106', '35', '18', '31', '2', '0.00', '0', '2018-01-03 18:43:28', '2018-01-03 18:43:28', 'full');
INSERT INTO `orders` VALUES ('107', '35', '8', '31', '2', '0.00', '0', '2018-01-03 18:44:40', '2018-01-03 18:44:40', 'full');
INSERT INTO `orders` VALUES ('108', '35', '10', '31', '2', '0.00', '0', '2018-01-03 18:44:40', '2018-01-03 18:44:40', 'full');
INSERT INTO `orders` VALUES ('109', '35', '1', '31', '2', '10.64', '0', '2018-01-03 18:44:40', '2018-01-03 18:44:40', 'full');
INSERT INTO `orders` VALUES ('110', '35', '8', '31', '2', '0.00', '0', '2018-01-03 18:44:57', '2018-01-03 18:44:57', 'full');
INSERT INTO `orders` VALUES ('111', '35', '10', '31', '2', '0.00', '0', '2018-01-03 18:44:57', '2018-01-03 18:44:57', 'full');
INSERT INTO `orders` VALUES ('112', '35', '1', '31', '2', '10.64', '0', '2018-01-03 18:44:58', '2018-01-03 18:44:58', 'full');
INSERT INTO `orders` VALUES ('113', '35', '9', '31', '2', '0.00', '0', '2018-01-03 18:45:57', '2018-01-03 18:45:57', 'full');
INSERT INTO `orders` VALUES ('114', '35', '15', '31', '3', '0.00', '0', '2018-01-03 18:45:57', '2018-01-03 18:45:57', 'full');
INSERT INTO `orders` VALUES ('115', '35', '3', '31', '2', '0.06', '0', '2018-01-03 18:45:57', '2018-01-03 18:45:57', 'full');
INSERT INTO `orders` VALUES ('116', '35', '14', '31', '2', '0.00', '0', '2018-01-03 18:55:31', '2018-01-03 18:55:31', 'full');
INSERT INTO `orders` VALUES ('117', '35', '29', '31', '1', '0.00', '0', '2018-01-03 18:55:31', '2018-01-03 18:55:31', 'full');
INSERT INTO `orders` VALUES ('118', '35', '1', '31', '1', '5.32', '0', '2018-01-03 18:55:31', '2018-01-03 18:55:31', 'full');
INSERT INTO `orders` VALUES ('119', '35', '14', '31', '2', '0.00', '0', '2018-01-03 18:57:24', '2018-01-03 18:57:24', 'full');
INSERT INTO `orders` VALUES ('120', '35', '29', '31', '1', '0.00', '0', '2018-01-03 18:57:24', '2018-01-03 18:57:24', 'full');
INSERT INTO `orders` VALUES ('121', '35', '1', '31', '6', '31.92', '0', '2018-01-03 18:57:24', '2018-01-03 18:57:24', 'full');
INSERT INTO `orders` VALUES ('122', '35', '24', '31', '4', '0.00', '0', '2018-01-03 18:57:24', '2018-01-03 18:57:24', 'full');
INSERT INTO `orders` VALUES ('123', '35', '33', '31', '4', '0.00', '0', '2018-01-03 21:06:54', '2018-01-03 21:06:54', 'full');
INSERT INTO `orders` VALUES ('124', '35', '15', '31', '2', '0.00', '0', '2018-01-03 21:06:54', '2018-01-03 21:06:54', 'full');
INSERT INTO `orders` VALUES ('125', '35', '44', '31', '4', '0.00', '0', '2018-01-03 21:06:54', '2018-01-03 21:06:54', 'full');
INSERT INTO `orders` VALUES ('126', '35', '45', '31', '2', '0.08', '0', '2018-01-03 21:06:54', '2018-01-03 21:06:54', 'full');
INSERT INTO `orders` VALUES ('127', '60', '50', '102', '1', '5.54', '0', '2018-01-10 01:34:49', '2018-01-10 01:34:49', 'full');
INSERT INTO `orders` VALUES ('128', '60', '50', '102', '4', '22.16', '0', '2018-01-10 01:35:13', '2018-01-10 01:35:13', 'full');
INSERT INTO `orders` VALUES ('129', '35', '29', '0', '1', '0.00', '0', '2018-01-10 01:50:09', '2018-01-10 01:50:09', 'full');
INSERT INTO `orders` VALUES ('130', '35', '20', '102', '3', '10.50', '0', '2018-01-16 16:19:54', '2018-01-16 16:19:54', 'full');
INSERT INTO `orders` VALUES ('131', '35', '33', '102', '3', '10.50', '0', '2018-01-16 16:19:54', '2018-01-16 16:19:54', 'full');
INSERT INTO `orders` VALUES ('132', '35', '18', '102', '1', '4.00', '0', '2018-01-16 16:37:21', '2018-01-16 16:37:21', 'full');
INSERT INTO `orders` VALUES ('133', '35', '28', '102', '1', '4.00', '0', '2018-01-16 16:37:21', '2018-01-16 16:37:21', 'full');
INSERT INTO `orders` VALUES ('134', '35', '18', '102', '1', '4.00', '0', '2018-01-16 16:45:58', '2018-01-16 16:45:58', 'full');
INSERT INTO `orders` VALUES ('135', '35', '33', '102', '3', '10.50', '0', '2018-01-16 16:45:58', '2018-01-16 16:45:58', 'full');
INSERT INTO `orders` VALUES ('136', '35', '9', '102', '4', '16.00', '0', '2018-01-16 16:45:58', '2018-01-16 16:45:58', 'full');
INSERT INTO `orders` VALUES ('137', '35', '28', '102', '3', '12.00', '0', '2018-01-16 16:56:48', '2018-01-16 16:56:48', 'full');
INSERT INTO `orders` VALUES ('138', '35', '14', '102', '2', '7.00', '0', '2018-01-16 16:56:48', '2018-01-16 16:56:48', 'full');
INSERT INTO `orders` VALUES ('139', '35', '29', '102', '2', '7.00', '0', '2018-01-16 16:56:48', '2018-01-16 16:56:48', 'full');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '2018-01-03 18:21:02', '2018-01-03 18:21:02', 'User', 'A normal User');
INSERT INTO `roles` VALUES ('2', '2018-01-03 18:21:02', '2018-01-03 18:21:02', 'Company', 'Company');
INSERT INTO `roles` VALUES ('3', '2018-01-03 18:21:02', '2018-01-03 18:21:02', 'Admin', 'A Admin');

-- ----------------------------
-- Table structure for table_bookings
-- ----------------------------
DROP TABLE IF EXISTS `table_bookings`;
CREATE TABLE `table_bookings` (
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of table_bookings
-- ----------------------------
INSERT INTO `table_bookings` VALUES ('33', '35', '69', '102', '65', '1', '12:00', '', '0', '', '0', '0', '0', '2018-01-08 00:08:11', '2018-01-17 22:03:37');
INSERT INTO `table_bookings` VALUES ('55', '62', '105', '102', '68', '0', '12:00', '', '0', '', '0', '0', '0', '2018-01-08 14:08:23', '2018-01-08 14:08:23');
INSERT INTO `table_bookings` VALUES ('56', '62', '105', '102', '68', '0', '12:00', '', '0', '', '0', '0', '0', '2018-01-08 14:08:31', '2018-01-08 14:08:31');
INSERT INTO `table_bookings` VALUES ('57', '62', '105', '102', '68', '0', '12:00', '', '0', '', '0', '0', '0', '2018-01-08 14:18:46', '2018-01-08 14:18:46');
INSERT INTO `table_bookings` VALUES ('58', '62', '105', '102', '68', '0', '12:00', '', '0', '', '0', '0', '0', '2018-01-08 14:28:48', '2018-01-08 14:28:48');
INSERT INTO `table_bookings` VALUES ('59', '62', '105', '102', '68', '2', '12:00', '', '0', '', '0', '0', '0', '2018-01-08 14:30:31', '2018-01-08 14:30:31');
INSERT INTO `table_bookings` VALUES ('60', '62', '105', '102', '68', '3', '12:00', '', '0', '', '0', '0', '0', '2018-01-08 14:30:47', '2018-01-08 14:30:47');
INSERT INTO `table_bookings` VALUES ('61', '62', '105', '102', '68', '1', '12:00', '', '0', '', '0', '0', '0', '2018-01-08 14:33:37', '2018-01-08 14:33:37');
INSERT INTO `table_bookings` VALUES ('62', '46', '85', '102', '64', '1', '12:00', '', '0', '', '0', '0', '0', '2018-01-08 14:34:36', '2018-01-08 14:34:36');
INSERT INTO `table_bookings` VALUES ('63', '46', '85', '102', '64', '2', '03:02', '', '0', 'User 2 ', 'User 2', '0', 'arekon2@gmail.com', '2018-01-08 14:51:30', '2018-01-08 14:51:30');
INSERT INTO `table_bookings` VALUES ('64', '46', '85', '102', '64', '3', '00:00', '', '0', 'User 2 ', 'User 2', '0', 'arekon2@gmail.com', '2018-01-08 14:52:05', '2018-01-08 14:52:05');
INSERT INTO `table_bookings` VALUES ('65', '60', '69', '102', '69', '4', '02:01', '', '0', 'User 2 ', 'User 2', '456123', 'arekon2@gmail.com', '2018-01-10 01:11:24', '2018-01-17 22:10:55');
INSERT INTO `table_bookings` VALUES ('66', '60', '69', '102', '69', '3', '01:00', 'Labas as krabas', '1', 'User 2 ', 'User 2', '868716', 'arekon2@gmail.com', '2018-01-10 01:13:29', '2018-01-10 01:25:22');
INSERT INTO `table_bookings` VALUES ('67', '60', '69', '102', '69', '1', '00:00', '', '0', 'User 2 ', 'User 2', '0', 'arekon2@gmail.com', '2018-01-10 01:21:48', '2018-01-10 01:25:07');
INSERT INTO `table_bookings` VALUES ('68', '60', '69', '102', '70', '1', '00:00', '', '0', 'User 2 ', 'User 2', '0', 'arekon2@gmail.com', '2018-01-10 01:22:03', '2018-01-10 01:25:05');
INSERT INTO `table_bookings` VALUES ('70', '93', '69', '69', '72', '1', '00:00', '', '0', 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:10:23', '2018-01-11 18:10:23');
INSERT INTO `table_bookings` VALUES ('71', '93', '69', '69', '72', '7', '00:00', '', '0', 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:10:45', '2018-01-11 18:10:45');
INSERT INTO `table_bookings` VALUES ('72', '93', '69', '69', '72', '6', '00:00', '', '0', 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:11:03', '2018-01-11 18:11:03');
INSERT INTO `table_bookings` VALUES ('73', '35', '69', '69', '73', '1', '00:00', '', '0', 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:14:07', '2018-01-11 18:14:07');
INSERT INTO `table_bookings` VALUES ('74', '35', '69', '69', '73', '5', '00:00', '', '0', 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:14:28', '2018-01-11 18:14:28');
INSERT INTO `table_bookings` VALUES ('75', '35', '69', '69', '73', '6', '00:00', '', '0', 'Beatri?e ????š??90???', 'Brazauskien? ????š??90???', '0', 'arekon11@gmail.com', '2018-01-11 18:16:18', '2018-01-11 18:16:18');
INSERT INTO `table_bookings` VALUES ('76', '93', '69', '102', '72', '10', '00:45', '', '0', 'User 2 ', 'User 2', '0', 'arekon2@gmail.com', '2018-01-15 22:36:51', '2018-01-15 22:36:51');

-- ----------------------------
-- Table structure for table_schema
-- ----------------------------
DROP TABLE IF EXISTS `table_schema`;
CREATE TABLE `table_schema` (
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

-- ----------------------------
-- Records of table_schema
-- ----------------------------
INSERT INTO `table_schema` VALUES ('58', '35', '69', '3rd floor', '[[\"Ec0\",0,0,\"notreserved table_cr4\",\"5\"],[\"Ec1\",0,1,\"notreserved table_cr4\",\"10\"],[\"Fc0\",0,2,\"notreserved table_cr5\",\"4\"],[\"Fc0\",0,3,\"notreserved table_cr5\",\"10\"],[\"cell_8c0\",0,4,\"notreserved table_cr8\",\"10\"],[\"Ec0\",1,0,\"notreserved table_cr4\",\"11\"],[\"Bc0\",1,1,\"notreserved table_cr1\",\"1\"],[\"Bc0\",1,3,\"notreserved table_cr1\",\"8\"],[\"cell_13c0\",1,6,\"notreserved table_cr13\",\"11\"],[\"Bc0\",2,0,\"notreserved table_cr1\",\"16\"],[\"Cc0\",2,5,\"notreserved table_cr2\",\"9\"],[\"cell_9c0\",2,6,\"notreserved table_cr9\",\"12\"],[\"Fc0\",3,0,\"notreserved table_cr5\",\"7\"],[\"Ec0\",3,2,\"notreserved table_cr4\",\"12\"],[\"Fc0\",3,3,\"notreserved table_cr5\",\"13\"],[\"cell_13c1\",3,6,\"notreserved table_cr13\",\"13\"],[\"Ec1\",4,0,\"notreserved table_cr4\",\"22\"],[\"Cc2\",4,1,\"notreserved table_cr2\",\"21\"],[\"Cc1\",4,4,\"notreserved table_cr2\",\"18\"],[\"cell_13c0\",4,5,\"notreserved table_cr13\",\"11\"],[\"Cc0\",5,2,\"notreserved table_cr2\",\"17\"]]', '2017-05-19 12:19:55', '2018-01-12 00:11:19');
INSERT INTO `table_schema` VALUES ('61', '35', '69', 'Terasa', '[[\"cell_13c0\",0,2,\"notreserved table_cr13\",\"1\"],[\"cell_13c0\",1,1,\"notreserved table_cr13\",\"2\"]]', '2017-12-05 23:06:37', '2018-01-12 00:11:41');
INSERT INTO `table_schema` VALUES ('62', '35', '69', '2nd floorr', '[[\"cell_12c0\",0,1,\"notreserved notreserved table_cr12\",\"1\"],[\"cell_13c0\",1,1,\"table_cr13\",\"3\"],[\"cell_13c0\",1,2,\"notreserved notreserved table_cr13\",\"2\"]]', '2017-12-05 23:06:44', '2018-01-15 20:40:12');
INSERT INTO `table_schema` VALUES ('63', '35', '69', 'Basement', '[[\"cell_11c0\",1,0,\"notreserved table_cr11\",\"2\"],[\"cell_7c1\",1,1,\"notreserved table_cr7\",\"16\"],[\"cell_8c1\",1,2,\"notreserved table_cr8\",\"17\"],[\"cell_10c3\",1,3,\"notreserved table_cr10\",\"18\"],[\"cell_13c0\",1,4,\"notreserved table_cr13\",\"3\"],[\"cell_5c0\",1,5,\"notreserved table_cr5\",\"21\"],[\"cell_2c1\",2,0,\"notreserved table_cr2\",\"23\"],[\"cell_7c2\",2,1,\"notreserved table_cr7\",\"20\"],[\"cell_8c2\",2,2,\"notreserved table_cr8\",\"19\"],[\"cell_3c0\",2,3,\"notreserved table_cr3\",\"9\"],[\"cell_3c2\",2,4,\"notreserved table_cr3\",\"22\"],[\"cell_2c0\",3,1,\"notreserved table_cr2\",\"10\"],[\"cell_9c0\",3,2,\"notreserved table_cr9\",\"5\"],[\"cell_1c0\",3,3,\"notreserved table_cr1\",\"24\"],[\"cell_10c0\",3,6,\"notreserved table_cr10\",\"4\"],[\"cell_3c1\",4,0,\"notreserved table_cr3\",\"11\"],[\"cell_12c0\",4,1,\"notreserved table_cr12\",\"7\"],[\"cell_8c0\",4,3,\"notreserved table_cr8\",\"12\"],[\"cell_10c1\",4,4,\"notreserved table_cr10\",\"8\"],[\"cell_4c0\",6,2,\"notreserved table_cr4\",\"13\"],[\"cell_10c2\",6,4,\"notreserved table_cr10\",\"15\"],[\"cell_7c0\",6,5,\"notreserved table_cr7\",\"14\"]]', '2017-12-16 23:00:03', '2018-01-12 00:12:14');
INSERT INTO `table_schema` VALUES ('64', '46', '85', 'test', '[[\"cell_12c0\",1,1,\"table_cr12\",\"1\"],[\"cell_13c0\",1,2,\"table_cr13\",\"2\"],[\"cell_8c0\",1,3,\"table_cr8\",\"3\"]]', '2017-12-28 23:23:22', '2017-12-28 23:23:22');
INSERT INTO `table_schema` VALUES ('65', '35', '69', '2nf floor terasa', '[[\"cell_12c0\",1,1,\"notreserved table_cr12\",\"1\"],[\"cell_13c0\",2,2,\"notreserved table_cr13\",\"2\"]]', '2017-12-29 16:35:24', '2018-01-12 00:12:06');
INSERT INTO `table_schema` VALUES ('66', '43', '79', 'Test2', '[[\"cell_8c0\",0,3,\"table_cr8\",\"3\"],[\"cell_12c0\",1,1,\"table_cr12\",\"1\"],[\"cell_13c0\",2,3,\"table_cr13\",\"2\"],[\"cell_9c0\",4,2,\"table_cr9\",\"4\"]]', '2018-01-05 16:56:52', '2018-01-05 16:56:52');
INSERT INTO `table_schema` VALUES ('67', '58', '93', 'fsdfsd', '[[\"cell_11c0\",1,0,\"table_cr11\",\"1\"],[\"cell_13c0\",1,2,\"table_cr13\",\"3\"],[\"cell_12c0\",2,1,\"table_cr12\",\"2\"]]', '2018-01-06 20:14:17', '2018-01-06 20:14:17');
INSERT INTO `table_schema` VALUES ('68', '62', '105', '5345', '[[\"cell_1c0\",2,1,\"table_cr1\",\"1\"],[\"cell_13c1\",2,2,\"table_cr13\",\"3\"],[\"cell_13c0\",4,2,\"table_cr13\",\"2\"]]', '2018-01-07 23:12:09', '2018-01-07 23:12:09');
INSERT INTO `table_schema` VALUES ('69', '60', '69', '1 ausktas', '[[\"cell_11c0\",1,0,\"table_cr11\",\"1\"],[\"cell_13c0\",1,2,\"table_cr13\",\"3\"],[\"cell_12c0\",3,1,\"table_cr12\",\"2\"],[\"cell_11c1\",4,0,\"table_cr11\",\"5\"],[\"cell_10c0\",4,3,\"table_cr10\",\"4\"]]', '2018-01-10 00:59:21', '2018-01-10 00:59:21');
INSERT INTO `table_schema` VALUES ('70', '60', '69', '2 ausktas', '[[\"cell_7c0\",1,0,\"table_cr7\",\"1\"],[\"cell_13c0\",1,2,\"table_cr13\",\"2\"],[\"cell_9c0\",2,4,\"table_cr9\",\"6\"],[\"cell_13c1\",3,1,\"table_cr13\",\"4\"],[\"cell_12c0\",5,3,\"table_cr12\",\"5\"]]', '2018-01-10 00:59:36', '2018-01-10 00:59:36');
INSERT INTO `table_schema` VALUES ('71', '90', '69', '1 floor', '[[\"cell_12c0\",2,1,\"table_cr12\",\"1\"],[\"cell_13c1\",2,5,\"table_cr13\",\"3\"],[\"cell_13c2\",2,6,\"table_cr13\",\"4\"],[\"cell_13c0\",4,3,\"table_cr13\",\"2\"],[\"cell_13c3\",5,4,\"table_cr13\",\"5\"]]', '2018-01-11 12:46:22', '2018-01-11 12:46:22');
INSERT INTO `table_schema` VALUES ('72', '93', '69', '1 ausktas', '[[\"cell_2c0\",1,1,\"notreserved table_cr2\",\"1\"],[\"cell_13c0\",1,2,\"notreserved table_cr13\",\"2\"],[\"cell_9c0\",2,3,\"notreserved table_cr9\",\"3\"],[\"cell_7c0\",3,1,\"notreserved table_cr7\",\"4\"],[\"cell_5c0\",5,1,\"table_cr5\",\"10\"],[\"cell_8c0\",6,0,\"table_cr8\",\"7\"],[\"cell_9c0\",6,2,\"table_cr9\",\"8\"],[\"cell_7c0\",6,4,\"table_cr7\",\"9\"],[\"cell_12c0\",7,1,\"table_cr12\",\"5\"],[\"cell_13c0\",7,3,\"table_cr13\",\"6\"]]', '2018-01-11 14:23:37', '2018-01-11 14:31:11');
INSERT INTO `table_schema` VALUES ('73', '35', '69', '1st floor', '[[\"cell_8c0\",0,1,\"notreserved table_cr8\",\"2\"],[\"cell_8c1\",0,3,\"notreserved table_cr8\",\"5\"],[\"cell_6c0\",1,0,\"notreserved table_cr6\",\"1\"],[\"cell_4c0\",1,2,\"notreserved table_cr4\",\"3\"],[\"cell_9c0\",1,4,\"notreserved table_cr9\",\"7\"],[\"cell_4c1\",2,1,\"notreserved table_cr4\",\"4\"],[\"cell_7c0\",2,3,\"notreserved table_cr7\",\"6\"],[\"cell_3c0\",3,2,\"notreserved table_cr3\",\"8\"]]', '2018-01-11 18:13:06', '2018-01-12 00:11:03');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('31', 'Ad', 'Min', 'arekon10@gmail.com', '$2y$10$7xb47nHvHOlMAT/g7D.Ia.xLOacduE/RIBm7rLEv90NIIomsxUTcm', '0', '1', 'RNVF13mbBrGI2WhOTF7sJ6bNGkKMIIsvGd7UiSlecuQncsFfzpXiIo7h3JKE', '2016-10-18 22:34:14', '2018-01-17 17:47:57');
INSERT INTO `users` VALUES ('61', '3', '3', 'arekon150@gmail.com', '$2y$10$1ARaBYLmQa/WOF7vt7LsBOnOo1s7kQAJQU5/HWhhyGqhMNQfipOZq', '0', '1', 'zlbldQxCwNuiCMMxmuy9ziczhdgZqcjHlx1Ss5ar4gxXYp6f25FxoEr5cEXQ', '2016-10-23 15:37:17', '2016-10-23 22:04:34');
INSERT INTO `users` VALUES ('62', 'dasd', 'dasdas', 'arekon1230@gmail.com', '$2y$10$6v8JbHDADL43n7wTGwdxh.CavT5oaeJeWnY.grY6s3jmlbjT421EK', '0', '1', 'i7OIgzv7DuApuOgr8ByX5TyV7Ok3Dkw3DZywnsZxJahea78DFH7oAr3fahbP', '2016-10-23 15:38:15', '2016-10-23 15:41:11');
INSERT INTO `users` VALUES ('63', 'd', '34', 'arekon101@gmail.com', '$2y$10$Sz4OwIc8cQXLK43vFQzniOZYHel2cSeyYFTLKiyryGWGwgiVShCAe', '0', '1', 'EN80jGbnEZwE6JXvg3XhBtD6KxX5vBU4OsyS0oRajHzmJCJEGKtKVziJS0IM', '2016-10-23 15:41:53', '2016-10-23 15:43:42');
INSERT INTO `users` VALUES ('64', '343', '4234', 'arekon103@gmail.com', '$2y$10$NVWXdYACOGiL7v8l3qHiheBsgQT2G1Ccjm2ce/dNdJJZpJhXsiTFO', '0', '1', 'Wrrtn77tFVoQGw56OtWiAZipuPKHoKc1adM5R6rpNOdg7rI2Q5Wv9F0NUbli', '2016-10-23 15:43:57', '2016-10-23 16:11:09');
INSERT INTO `users` VALUES ('66', 'joq', 'dforn', 'arekon1033@gmail.com', '$2y$10$P7AMS1k0xkIOBLjaWud1JOIwkLs.ktn71cXcTjjSyLK8DXALtkiTi', '0', '1', '9LEpuGcM6Bq6atbMxWWkOruTX47fU0bnDe0hr9r3ZhrjxuJMNmq1ufLA6pqZ', '2016-10-23 16:12:49', '2016-10-23 16:21:11');
INSERT INTO `users` VALUES ('67', 'dasd', 'dasdsa', 'arekon310@gmail.com', '$2y$10$sQ6BtKp/DuidQ3r3ThciGe4dpo2RGmuslAVkQaDq47kPNVuEcPh92', '0', '1', null, '2016-10-23 17:47:25', '2016-10-23 17:47:25');
INSERT INTO `users` VALUES ('68', '1234', '423', 'dd@d.lt', '$2y$10$PjmJhaxdbCmp8K6L8o011uzz81VfKAjXi7FAqSCMg7gVfwDVh92N.', '0', '1', 'P60U4sBgsyqkaEkEyONH1aCJddi4EF2kcJ0sEkYE8sOHN4CB4lFxtCEgV4iT', '2016-11-14 14:49:17', '2016-11-14 14:49:45');
INSERT INTO `users` VALUES ('69', 'Beatriče čęėįšųū90ąąč', 'Brazauskienė čęėįšųū90ąąč', 'arekon11@gmail.com', '$2y$10$fF5XK/tIealbTFUNc.ZIseMqNAAN4Ej9RiQn4cxUgNpm39J5IIVpi', '0', '1', 'p8sCwSdwTELINiUrpLyd7ukE48BnoXs3wspD90WqGjIh38Nsa8bQ9JMKX90f', '2016-11-23 16:30:43', '2018-01-18 01:08:22');
INSERT INTO `users` VALUES ('70', 'some name', 'second name', 'arekon18@gmail.com', '$2y$10$M/1Af3hW7yBsl9i/KE0SgeE8P1Hm94NGzNXwCOZgY6Jp79uKQ78jq', '0', '1', '9cilBTQo22Xx8SkGd8Wn6cvDiLM5SRmIgLoJ8mpi1wcBam48r9IY3D3ECW6K', '2016-11-23 22:45:16', '2016-11-23 22:46:23');
INSERT INTO `users` VALUES ('71', 're', 'tee', 'arekon19@gmail.com', '$2y$10$iXAmrQ0GGprT1Lk7UPb.oOgfP5w.vqiEMXhoNdu9PWYH.K7sGNTWe', '0', '0', 'wqR5g269wY2WAcKkXsQt03oMU2QKZ8UPXT2AtOrbj2rrA4Irx210OIyz1Emg', '2016-11-23 22:47:34', '2016-11-23 22:48:23');
INSERT INTO `users` VALUES ('74', 'd', 'ad', 'arekon112@gmail.com', '$2y$10$PFqNnry2CzPq9R1oaswhPOOLo28a13mxtsW61AtyiE72eGdojH07y', '0', '1', null, '2016-11-24 22:55:16', '2016-11-24 22:55:16');
INSERT INTO `users` VALUES ('75', 'Jon', 'Cena', 'arekon789@gmail.com', '$2y$10$vRLY1FSCotVJ0cmlXCFfZu/sfGFzhQrrQ1yyMgmU5BZgopFn4vmpa', '0', '1', 'j4Jr59mrfPvkGrYpm3zClTgigM08UuOnF1lVDmJkpS0wAVjY6NwznUeTtqth', '2016-12-14 19:06:07', '2016-12-20 23:49:18');
INSERT INTO `users` VALUES ('76', 'geras', 'maistas', 'arekon5@gmail.com', '$2y$10$o2CgHdIdY/UiOsKpVHBmO.vCk7kdn.ntH8bxbnyOuPKT7794uCaUG', '0', '1', 'T52KS8aOJiUfb88e2SpuTjMDb6nT3FOyn3eRYZ3CutbRttPs0KHS6mzwkGFY', '2016-12-15 23:11:04', '2016-12-15 23:50:55');
INSERT INTO `users` VALUES ('78', 'Kebabai 1', 'maistas KEbabai 1', 'arekon12@gmail.com', '$2y$10$8Pu2qzUUjRG6xPgz4xSVb.FEHOFaJZs6yjZ4AlSMJNzYX7qnDhazK', '0', '1', 'VnvKizmgNsLdi3wMMgcoaZhGOsc444wD3nTUOQgT6np6rjWh3WmUn5HIWKfu', '2016-12-15 23:53:04', '2018-01-06 23:33:40');
INSERT INTO `users` VALUES ('79', 'Userr 7', 'User 7', 'arekon13@gmail.com', '$2y$10$Vo4h14CdcwSvHGlkQrBp2e.U.Hs2UxTLnl0lW00Pc5WLTykL6qi5q', '0', '1', 'NixJS2kYvGffcAaMBg6rfiiCsgIgopCE2YTeLNDxYBZKA4IPYQUoGsTntlDv', '2016-12-16 14:21:53', '2018-01-06 16:02:16');
INSERT INTO `users` VALUES ('80', 'lala', 'dlasd', 'arekon15@gmail.com', '$2y$10$hpm3kueyPtJnURCxJ2AKjOMLPt4FRMVg0Nr1YdlTJQU59GIqtecUq', '0', '1', '8QBthzqRLzTfvIF1qL1eDTcbKJq4ucf2MAkg9oUv14NkgkdfCtO9vpmdDHdf', '2016-12-20 22:38:45', '2018-01-07 00:04:48');
INSERT INTO `users` VALUES ('85', 'dsadas', 'dasdas', 'arekon1111@gmail.com', '$2y$10$a05qj7xQ0hanMHZIJ2CIWe5T6D.l3kKEYPlr6MTIhKDWxCmTe5TxG', '0', '1', null, '2017-12-28 22:53:41', '2017-12-28 22:53:41');
INSERT INTO `users` VALUES ('89', 'Alibaba', 'Ali', 'alibaba@gmail.com', '$2y$10$WrtVCkPEqk6e9JiSfYj5QOcTAlOgIfFn8hHdcOaVbj3GWe4aldFtS', '0', '1', '8QdFdx4MH9jbbd8R1tpaOOxnorvceHRBEc8dvch82WnteLzi6MKkzEpwYDyf', '2018-01-05 17:02:07', '2018-01-15 23:33:32');
INSERT INTO `users` VALUES ('91', 'Jonas', 'Jonaitis', 'arekon155@gmail.com', '$2y$10$GIqv8a3.M123QOlgSkJgA.kN3oK1OPScFe/f0Muo1j7aJY.zBFIo2', '0', '1', 'PKH1btM2OVzhstpb4mr6wmTkPeTL1Zv6TTDDTvSy6Xgcma0hmqzpmtx8UpLf', '2018-01-06 18:15:39', '2018-01-06 18:20:06');
INSERT INTO `users` VALUES ('92', 'Jon', 'Johm', 'arekon155@gmail.com5', '$2y$10$J6uZPTyIBjUO5COxZ0isPuzApBW0lhgdFX0kJ39g4b9lBSc5TKycC', '0', '1', null, '2018-01-06 18:18:51', '2018-01-06 18:18:51');
INSERT INTO `users` VALUES ('93', '', '', 'arekon1553@gmail.com', '$2y$10$OhdufwB4OBYu.tEmKYkY1.FqJoGj/l6lQcfn/3PPX7SsLduzR9Ycm', '0', '1', 'FJPza3I25fo6uJMks9VEKwofobuVblum3UkCxP6Kek2Bha56Fa7zhspBYYvL', '2018-01-06 18:20:21', '2018-01-06 20:22:52');
INSERT INTO `users` VALUES ('95', 'fsdf', 'fsdfsd', 'arekon155fsdf3@gmail.com', '$2y$10$7UVFGh7t9z1rlzJjopfZquwOzhQS4m7equhyM4njQdo.Ms5K/0swK', '0', '1', null, '2018-01-06 20:22:39', '2018-01-06 20:22:39');
INSERT INTO `users` VALUES ('96', 'Aleks', 'Valeks', 'arekon17@gmail.com', '$2y$10$0Yi1hztqyn/eEyAtjCMuzugdg0rRzdXDH3ZjucJjQHXflBkT5Xz5y', '0', '1', 'q5dpJZtg5jGecz82VOv7GvufyPnSBnd6sXU8wuzKlX367XjjbWaz4UE3fkUX', '2018-01-06 20:50:30', '2018-01-15 20:24:25');
INSERT INTO `users` VALUES ('97', 'ffdsf', 'fdsfsd', 'arekon22@gmail.com', '$2y$10$qBbmcaJ2lKF6KzXe0w6Kv.Otc.F76v/K01ncstVdjvOy12Dbin6Vy', '0', '1', 'kT2WwX6AVEDByBxUryoLpeh6QhKtqezFyusIhwVIYRE3VNWBXct4cXRUxbLX', '2018-01-06 20:55:51', '2018-01-06 20:56:02');
INSERT INTO `users` VALUES ('98', '4234', '4234', 'arekon23@gmail.com', '$2y$10$D9r3aUUoTdLhHh/o7n49iuEfJ/qwUDsI2gqMgPW4y.ow3Ouv6p7e6', '0', '1', '3Tt9nSe0E5YcS4iXArwlRbzazh1ryHDXrVIt7HbMo2qcI0sEeV1wVjfYdHR0', '2018-01-06 20:56:14', '2018-01-06 20:58:00');
INSERT INTO `users` VALUES ('99', 'dasdas', 'dasdas', 'arekon24@gmail.com', '$2y$10$u1TrVCFOamGsSAUtHxKMrOUADiyc9KCxGSfhRJKAN8.f9q.XN6XT.', '0', '1', 'auFunOEizV4W8307BJIMhf4kle2ZLz6pti7rPSQWKUWQMgFXoszsakPJitsT', '2018-01-06 20:58:13', '2018-01-06 20:59:39');
INSERT INTO `users` VALUES ('100', 'iyuik', 'iyuiyu', 'arekon26@gmail.com', '$2y$10$7RskcpAJuGowo8vzphcKHuVGd6PXVczV3hRbYfOUqO4qa63bFlhGe', '0', '1', 'KWtfQpiqolmjPJLAmpdQcDRVc1D93Vjrag8bfdtclBugJdDoT155NyWs7mV2', '2018-01-06 20:59:50', '2018-01-06 21:22:31');
INSERT INTO `users` VALUES ('101', 'User', 'User', 'arekon1@gmail.com', '$2y$10$U6mg0u3FtXVkMejLzI6iAOscRZp/pBfCWV4FdHboZAqP3cBB4f39u', '0', '0', null, '2018-01-07 00:05:02', '2018-01-07 00:05:02');
INSERT INTO `users` VALUES ('102', 'User 2 ', 'User 2', 'arekon2@gmail.com', '$2y$10$/dF2OviNZ4244oOUthTK/.5KV5qPVggEZV9errH8CjMw6.S/6b8iW', '0', '0', 'sVdCRci0TM54MPDo59vE6iMFph9WZZQKNWzmHDP0rjr1a70t9hVhLtruqqtb', '2018-01-07 13:28:37', '2018-01-15 22:43:00');
INSERT INTO `users` VALUES ('103', 'User3', 'Userausaks3', 'arekon3@gmail.com', '$2y$10$ZSx0WUAxzJ0yjLlLSHw0jO1x745PUV9Bm6lf/kJakwzukBL8AxY4q', '0', '0', '3Yn5OhCboNWi4sGwmyT37jKjfYnc3xiYCqWmVMZ84x5KKQs7eKHge6UPhlx9', '2018-01-07 16:17:28', '2018-01-07 16:17:36');
INSERT INTO `users` VALUES ('104', 'Company 4', 'Comapnausklas 4', 'arekon4@gmail.com', '$2y$10$NO/1TzT/BOvJoDjnZOe3kOUonppyr8wqjcx4jVWVJaxaW5Oo.gNEW', '0', '1', 'o6JZoXyGoCIG9QYVvSSLDOCce7DK7mbk4dGYv7zocleQGhcD5vb8qenby4t3', '2018-01-07 16:17:53', '2018-01-07 16:18:02');
INSERT INTO `users` VALUES ('105', '444', '444', 'arekon111@gmail.com', '$2y$10$2VY8mCKKnta6asakDcqImOi3zgGzDqwO8FJ/J0/jy1JwuPIrMznXC', '0', '1', 'TlIcjJgVfdNQweaWjRfSRNYYcLj0OpvRmEJbWZivq2lNliEMqnSvRMi6b07L', '2018-01-07 23:11:25', '2018-01-07 23:39:42');
INSERT INTO `users` VALUES ('106', 'lab8964u-*8*-', '/*-/*-/-*', 't@gmail.com', '$2y$10$Dqq5vxeG9ZgzciqN7TPH0e1cGQy.Ij/R9WI7yqTtdnHTQYZgKyVtm', '0', '0', null, '2018-01-11 11:58:01', '2018-01-11 11:58:01');
INSERT INTO `users` VALUES ('107', 'Istaiga', 'IStaiga', 'istaiga@istaiga.lt', '$2y$10$JvpOQQuUkSiH5l9o0KxisesHOhla4VFyr.2M8riZo/ASf1ODsew6q', '0', '1', '9cDGPN6AP7lMqii7TyXGAbLiE7uIJto4EUHjeJHK7IkZQXom1accEFdzFrIY', '2018-01-16 00:53:48', '2018-01-16 00:54:41');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
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
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('35', null, null, '30', '1');
INSERT INTO `user_role` VALUES ('36', null, null, '30', '3');
INSERT INTO `user_role` VALUES ('39', null, null, '32', '1');
INSERT INTO `user_role` VALUES ('40', null, null, '32', '2');
INSERT INTO `user_role` VALUES ('41', null, null, '32', '3');
INSERT INTO `user_role` VALUES ('48', null, null, '39', '1');
INSERT INTO `user_role` VALUES ('49', null, null, '40', '1');
INSERT INTO `user_role` VALUES ('50', null, null, '41', '1');
INSERT INTO `user_role` VALUES ('52', null, null, '43', '1');
INSERT INTO `user_role` VALUES ('58', null, null, '49', '1');
INSERT INTO `user_role` VALUES ('59', null, null, '51', '1');
INSERT INTO `user_role` VALUES ('60', null, null, '52', '1');
INSERT INTO `user_role` VALUES ('61', null, null, '53', '1');
INSERT INTO `user_role` VALUES ('62', null, null, '54', '1');
INSERT INTO `user_role` VALUES ('64', null, null, '57', '1');
INSERT INTO `user_role` VALUES ('65', null, null, '59', '1');
INSERT INTO `user_role` VALUES ('66', null, null, '60', '1');
INSERT INTO `user_role` VALUES ('86', null, null, '66', '1');
INSERT INTO `user_role` VALUES ('87', null, null, '66', '3');
INSERT INTO `user_role` VALUES ('98', null, null, '70', '2');
INSERT INTO `user_role` VALUES ('99', null, null, '76', '1');
INSERT INTO `user_role` VALUES ('120', null, null, '80', '1');
INSERT INTO `user_role` VALUES ('121', null, null, '80', '2');
INSERT INTO `user_role` VALUES ('122', null, null, '75', '1');
INSERT INTO `user_role` VALUES ('123', null, null, '75', '2');
INSERT INTO `user_role` VALUES ('124', null, null, '75', '3');
INSERT INTO `user_role` VALUES ('143', null, null, '61', '1');
INSERT INTO `user_role` VALUES ('144', null, null, '61', '2');
INSERT INTO `user_role` VALUES ('145', null, null, '61', '3');
INSERT INTO `user_role` VALUES ('209', null, null, '89', '1');
INSERT INTO `user_role` VALUES ('210', null, null, '89', '2');
INSERT INTO `user_role` VALUES ('214', null, null, '62', '1');
INSERT INTO `user_role` VALUES ('215', null, null, '62', '2');
INSERT INTO `user_role` VALUES ('216', null, null, '62', '3');
INSERT INTO `user_role` VALUES ('217', null, null, '63', '1');
INSERT INTO `user_role` VALUES ('218', null, null, '63', '2');
INSERT INTO `user_role` VALUES ('219', null, null, '63', '3');
INSERT INTO `user_role` VALUES ('220', null, null, '68', '1');
INSERT INTO `user_role` VALUES ('221', null, null, '68', '2');
INSERT INTO `user_role` VALUES ('222', null, null, '68', '3');
INSERT INTO `user_role` VALUES ('232', null, null, '74', '1');
INSERT INTO `user_role` VALUES ('233', null, null, '71', '3');
INSERT INTO `user_role` VALUES ('234', null, null, '85', '3');
INSERT INTO `user_role` VALUES ('235', null, null, '67', '1');
INSERT INTO `user_role` VALUES ('236', null, null, '64', '2');
INSERT INTO `user_role` VALUES ('237', null, null, '79', '3');
INSERT INTO `user_role` VALUES ('259', null, null, '31', '3');
INSERT INTO `user_role` VALUES ('261', null, null, '91', '1');
INSERT INTO `user_role` VALUES ('262', null, null, '91', '2');
INSERT INTO `user_role` VALUES ('263', null, null, '92', '1');
INSERT INTO `user_role` VALUES ('267', null, null, '93', '1');
INSERT INTO `user_role` VALUES ('268', null, null, '93', '2');
INSERT INTO `user_role` VALUES ('269', null, null, '95', '1');
INSERT INTO `user_role` VALUES ('270', null, null, '96', '1');
INSERT INTO `user_role` VALUES ('271', null, null, '97', '1');
INSERT INTO `user_role` VALUES ('272', null, null, '98', '1');
INSERT INTO `user_role` VALUES ('273', null, null, '99', '1');
INSERT INTO `user_role` VALUES ('274', null, null, '99', '2');
INSERT INTO `user_role` VALUES ('281', null, null, '100', '1');
INSERT INTO `user_role` VALUES ('282', null, null, '100', '2');
INSERT INTO `user_role` VALUES ('284', null, null, '78', '1');
INSERT INTO `user_role` VALUES ('285', null, null, '78', '2');
INSERT INTO `user_role` VALUES ('286', null, null, '69', '2');
INSERT INTO `user_role` VALUES ('287', null, null, '101', '1');
INSERT INTO `user_role` VALUES ('289', null, null, '103', '1');
INSERT INTO `user_role` VALUES ('291', null, null, '104', '2');
INSERT INTO `user_role` VALUES ('293', null, null, '105', '2');
INSERT INTO `user_role` VALUES ('294', null, null, '102', '1');
INSERT INTO `user_role` VALUES ('295', null, null, '106', '1');
INSERT INTO `user_role` VALUES ('297', null, null, '107', '2');
