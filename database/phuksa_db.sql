/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : phuksa_db

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 08/01/2020 16:45:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `idx-auth_assignment-user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `data` blob NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` blob NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_content_menu1_idx`(`menu_id`) USING BTREE,
  CONSTRAINT `fk_content_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (1, 'Services', '', '<p>Test</p>\r\n', 1);

-- ----------------------------
-- Table structure for home
-- ----------------------------
DROP TABLE IF EXISTS `home`;
CREATE TABLE `home`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `details` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` enum('Slide','Box') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  INDEX `fk_home_user1_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_home_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home
-- ----------------------------
INSERT INTO `home` VALUES (1, 'home_20191226023523.jpg', 'xzxzx', '<p>xzx</p>\r\n', 'Slide', 1);
INSERT INTO `home` VALUES (2, 'home_20191226023506.jpg', 'ssss', '<p>dfdf</p>\r\n', 'Slide', 1);
INSERT INTO `home` VALUES (3, 'home_20191228074059.jpg', '​ບໍ​ລິການ ​ອາ​ຫານ ແລະ ເຄື່ອງ​ດຶ່ມ', '<p>Online Automatic Text Summarization Tool - Autosummarizer is a simple tool that help to summarize large text documents extracting the most important ... Best summary tool, article summarizer, conclusion generator online</p>\r\n', 'Box', 1);
INSERT INTO `home` VALUES (4, 'home_20191228073757.jpg', 'ບໍ​ລິ​ການ​ ລົດ​ໄຟ​ຟ້າ', '<p>Online Automatic Text Summarization Tool - Autosummarizer is a simple tool that help to summarize large text documents extracting the most important ... Best summary tool, article summarizer, conclusion generator online</p>\r\n', 'Box', 1);
INSERT INTO `home` VALUES (5, 'home_20191228074235.jpeg', '​ບໍ​ລິການ ຕູບ', '<p>Online Automatic Text Summarization Tool - Autosummarizer is a simple tool that help to summarize large text documents extracting the most important ... Best summary tool, article summarizer, conclusion generator online</p>\r\n', 'Box', 1);

-- ----------------------------
-- Table structure for item_order
-- ----------------------------
DROP TABLE IF EXISTS `item_order`;
CREATE TABLE `item_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quatity` int(11) NOT NULL,
  `unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_date` datetime(0) NOT NULL,
  `date_done` datetime(0) NULL DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_purchase_order_product1_idx`(`product_id`) USING BTREE,
  INDEX `fk_item_order_product_order1_idx`(`product_order_id`) USING BTREE,
  CONSTRAINT `fk_item_order_product_order1` FOREIGN KEY (`product_order_id`) REFERENCES `product_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_purchase_order_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NULL DEFAULT 1,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  INDEX `fk_menu_user1_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_menu_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'ໜ້າຫຼັກ', 'site/index', 1, 1);
INSERT INTO `menu` VALUES (2, 'ບໍ​ລິ​ການ​', '1', 1, 1);
INSERT INTO `menu` VALUES (3, 'ກ່ຽວ​ກັບ​ພວກ​ເຮົາ', '#', 1, 1);
INSERT INTO `menu` VALUES (4, '​ຕິດ​ຕໍ່​ພວກ​ເຮົາ', '#', 1, 1);

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apply_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1577274576);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1577274723);
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1577274723);
INSERT INTO `migration` VALUES ('m180523_151638_rbac_updates_indexes_without_prefix', 1577274723);

-- ----------------------------
-- Table structure for order_electric_car
-- ----------------------------
DROP TABLE IF EXISTS `order_electric_car`;
CREATE TABLE `order_electric_car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` enum('Pedding','Paid','Cancel') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_date` datetime(0) NOT NULL,
  `service_electric_car_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  INDEX `fk_order_electric_car_service_electric_car1_idx`(`service_electric_car_id`) USING BTREE,
  INDEX `fk_order_electric_car_user1_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_order_electric_car_service_electric_car1` FOREIGN KEY (`service_electric_car_id`) REFERENCES `service_electric_car` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_electric_car_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_electric_car
-- ----------------------------
INSERT INTO `order_electric_car` VALUES (1, '00013', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-07 05:57:13', 1, 1);
INSERT INTO `order_electric_car` VALUES (2, '00015', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-07 06:15:58', 1, 1);
INSERT INTO `order_electric_car` VALUES (3, '00017', 'ລົດ​ໄຟ​ຟ້າ', 2, 15000, 'Paid', '2020-01-07 06:45:45', 1, 1);
INSERT INTO `order_electric_car` VALUES (4, '00019', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-07 06:49:44', 1, 1);
INSERT INTO `order_electric_car` VALUES (5, '00027', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-07 07:41:48', 1, 1);
INSERT INTO `order_electric_car` VALUES (6, '00028', 'ລົດ​ໄຟ​ຟ້າ', 2, 15000, 'Paid', '2020-01-07 07:47:36', 1, 1);
INSERT INTO `order_electric_car` VALUES (7, '00029', 'ລົດ​ໄຟ​ຟ້າ', 2, 15000, 'Paid', '2020-01-07 07:51:53', 1, 1);
INSERT INTO `order_electric_car` VALUES (8, '00029', 'ລົດ​ຖີບ', 1, 70000, 'Paid', '2020-01-07 07:51:53', 2, 1);
INSERT INTO `order_electric_car` VALUES (9, '00031', 'ລົດ​ຖີບ', 2, 70000, 'Paid', '2020-01-07 09:04:49', 2, 1);
INSERT INTO `order_electric_car` VALUES (10, '00033', 'ລົດ​ຖີບ', 3, 70000, 'Paid', '2020-01-07 09:34:06', 2, 1);
INSERT INTO `order_electric_car` VALUES (11, '00033', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-07 10:13:29', 1, 1);
INSERT INTO `order_electric_car` VALUES (12, '00035', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-07 10:14:03', 1, 1);
INSERT INTO `order_electric_car` VALUES (13, '00035', 'ລົດ​ຖີບ', 3, 70000, 'Paid', '2020-01-07 10:14:03', 2, 1);
INSERT INTO `order_electric_car` VALUES (14, '00040', 'ລົດ​ຖີບ', 1, 70000, 'Paid', '2020-01-08 07:02:47', 2, 1);
INSERT INTO `order_electric_car` VALUES (15, '00040', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-08 07:11:33', 1, 1);
INSERT INTO `order_electric_car` VALUES (16, '00040', 'ລົດ​ຖີບ', 2, 70000, 'Paid', '2020-01-08 07:11:34', 2, 1);
INSERT INTO `order_electric_car` VALUES (17, '00041', 'ລົດ​ໄຟ​ຟ້າ', 2, 15000, 'Paid', '2020-01-08 07:53:37', 1, 1);
INSERT INTO `order_electric_car` VALUES (18, '00042', 'ລົດ​ໄຟ​ຟ້າ', 2, 15000, 'Paid', '2020-01-08 07:55:29', 1, 1);
INSERT INTO `order_electric_car` VALUES (19, '00043', 'ລົດ​ຖີບ', 2, 70000, 'Paid', '2020-01-08 07:55:29', 2, 1);
INSERT INTO `order_electric_car` VALUES (20, '00044', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-08 08:05:36', 1, 1);
INSERT INTO `order_electric_car` VALUES (21, '00045', 'ລົດ​ຖີບ', 3, 70000, 'Paid', '2020-01-08 08:05:36', 2, 1);
INSERT INTO `order_electric_car` VALUES (22, '00046', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-08 08:19:16', 1, 1);
INSERT INTO `order_electric_car` VALUES (23, '00047', 'ລົດ​ຖີບ', 2, 70000, 'Paid', '2020-01-08 08:19:16', 2, 1);
INSERT INTO `order_electric_car` VALUES (24, '00048', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-08 08:20:15', 1, 1);
INSERT INTO `order_electric_car` VALUES (25, '00049', 'ລົດ​ໄຟ​ຟ້າ', 1, 15000, 'Paid', '2020-01-08 08:31:10', 1, 1);
INSERT INTO `order_electric_car` VALUES (26, '00050', 'ລົດ​ຖີບ', 2, 70000, 'Paid', '2020-01-08 08:31:10', 2, 1);
INSERT INTO `order_electric_car` VALUES (27, '00051', 'ລົດ​ໄຟ​ຟ້າ', 2, 15000, 'Paid', '2020-01-08 08:32:04', 1, 1);
INSERT INTO `order_electric_car` VALUES (28, '00052', 'ລົດ​ຖີບ', 3, 70000, 'Paid', '2020-01-08 08:32:04', 2, 1);

-- ----------------------------
-- Table structure for order_food_beverage
-- ----------------------------
DROP TABLE IF EXISTS `order_food_beverage`;
CREATE TABLE `order_food_beverage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_order` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buy_price` float NOT NULL,
  `sale_price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('Pedding','Done','Paid','Cancel') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_date` datetime(0) NOT NULL,
  `service_food_beverage_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_food_beverage_service_food_beverage1_idx`(`service_food_beverage_id`) USING BTREE,
  INDEX `fk_order_food_beverage_user1_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_order_food_beverage_service_food_beverage1` FOREIGN KEY (`service_food_beverage_id`) REFERENCES `service_food_beverage` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_food_beverage_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_ticket
-- ----------------------------
DROP TABLE IF EXISTS `order_ticket`;
CREATE TABLE `order_ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` enum('Pedding','Paid','Cancel') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_date` datetime(0) NOT NULL,
  `service_ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_ticket_service_ticket1_idx`(`service_ticket_id`) USING BTREE,
  INDEX `fk_order_ticket_user1_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_order_ticket_service_ticket1` FOREIGN KEY (`service_ticket_id`) REFERENCES `service_ticket` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_ticket_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_ticket
-- ----------------------------
INSERT INTO `order_ticket` VALUES (3, '0001', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 01:36:24', 1, 1);
INSERT INTO `order_ticket` VALUES (4, '0002', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 01:36:24', 2, 1);
INSERT INTO `order_ticket` VALUES (5, '00003', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 01:37:09', 1, 1);
INSERT INTO `order_ticket` VALUES (6, '00004', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 01:37:09', 2, 1);
INSERT INTO `order_ticket` VALUES (7, '00005', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 05:43:48', 1, 1);
INSERT INTO `order_ticket` VALUES (8, '00006', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 05:43:48', 2, 1);
INSERT INTO `order_ticket` VALUES (9, '00007', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 05:50:49', 1, 1);
INSERT INTO `order_ticket` VALUES (10, '00008', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 05:50:49', 2, 1);
INSERT INTO `order_ticket` VALUES (11, '00009', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 05:53:19', 1, 1);
INSERT INTO `order_ticket` VALUES (12, '00010', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 05:53:19', 2, 1);
INSERT INTO `order_ticket` VALUES (13, '00011', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 05:57:13', 1, 1);
INSERT INTO `order_ticket` VALUES (14, '00012', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 05:57:13', 2, 1);
INSERT INTO `order_ticket` VALUES (15, '00013', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 06:15:58', 1, 1);
INSERT INTO `order_ticket` VALUES (16, '00014', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 06:15:58', 2, 1);
INSERT INTO `order_ticket` VALUES (17, '00015', 'ຜູ້​ໃຫຍ່', 4, 10000, 'Paid', '2020-01-07 06:45:45', 1, 1);
INSERT INTO `order_ticket` VALUES (18, '00016', 'ເດັກນ້ອຍ', 1, 5000, 'Paid', '2020-01-07 06:45:45', 2, 1);
INSERT INTO `order_ticket` VALUES (19, '00017', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 06:49:44', 1, 1);
INSERT INTO `order_ticket` VALUES (20, '00018', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 06:49:44', 2, 1);
INSERT INTO `order_ticket` VALUES (21, '00019', 'ຜູ້​ໃຫຍ່', 4, 10000, 'Paid', '2020-01-07 06:54:59', 1, 1);
INSERT INTO `order_ticket` VALUES (22, '00020', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 06:54:59', 2, 1);
INSERT INTO `order_ticket` VALUES (23, '00021', 'ຜູ້​ໃຫຍ່', 4, 10000, 'Paid', '2020-01-07 06:57:04', 1, 1);
INSERT INTO `order_ticket` VALUES (24, '00022', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 06:57:04', 2, 1);
INSERT INTO `order_ticket` VALUES (25, '00023', 'ຜູ້​ໃຫຍ່', 4, 10000, 'Paid', '2020-01-07 07:02:36', 1, 1);
INSERT INTO `order_ticket` VALUES (26, '00024', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 07:02:36', 2, 1);
INSERT INTO `order_ticket` VALUES (27, '00025', 'ຜູ້​ໃຫຍ່', 4, 10000, 'Paid', '2020-01-07 07:41:48', 1, 1);
INSERT INTO `order_ticket` VALUES (28, '00026', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 07:41:48', 2, 1);
INSERT INTO `order_ticket` VALUES (29, '00027', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 07:47:36', 1, 1);
INSERT INTO `order_ticket` VALUES (30, '00028', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 07:51:53', 1, 1);
INSERT INTO `order_ticket` VALUES (31, '00029', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 09:04:48', 1, 1);
INSERT INTO `order_ticket` VALUES (32, '00030', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 09:04:49', 2, 1);
INSERT INTO `order_ticket` VALUES (33, '00031', 'ຜູ້​ໃຫຍ່', 1, 10000, 'Paid', '2020-01-07 09:33:39', 1, 1);
INSERT INTO `order_ticket` VALUES (34, '00032', 'ຜູ້​ໃຫຍ່', 3, 10000, 'Paid', '2020-01-07 09:34:05', 1, 1);
INSERT INTO `order_ticket` VALUES (35, '00033', 'ຜູ້​ໃຫຍ່', 1, 10000, 'Paid', '2020-01-07 10:14:03', 1, 1);
INSERT INTO `order_ticket` VALUES (36, '00034', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-07 10:14:03', 2, 1);
INSERT INTO `order_ticket` VALUES (37, '00035', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 10:16:52', 1, 1);
INSERT INTO `order_ticket` VALUES (38, '00036', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 10:28:11', 1, 1);
INSERT INTO `order_ticket` VALUES (39, '00037', 'ເດັກນ້ອຍ', 1, 5000, 'Paid', '2020-01-07 10:28:11', 2, 1);
INSERT INTO `order_ticket` VALUES (40, '00038', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 10:33:40', 1, 1);
INSERT INTO `order_ticket` VALUES (41, '00039', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-07 10:58:19', 1, 1);
INSERT INTO `order_ticket` VALUES (42, '00040', 'ຜູ້​ໃຫຍ່', 2, 10000, 'Paid', '2020-01-08 08:20:44', 1, 1);
INSERT INTO `order_ticket` VALUES (43, '00041', 'ເດັກນ້ອຍ', 3, 5000, 'Paid', '2020-01-08 08:20:44', 2, 1);
INSERT INTO `order_ticket` VALUES (44, '00042', 'ຜູ້​ໃຫຍ່', 1, 10000, 'Paid', '2020-01-08 08:31:10', 1, 1);
INSERT INTO `order_ticket` VALUES (45, '00043', 'ເດັກນ້ອຍ', 2, 5000, 'Paid', '2020-01-08 08:31:10', 2, 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_order
-- ----------------------------
DROP TABLE IF EXISTS `product_order`;
CREATE TABLE `product_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('Draft','Order','Done') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_date` datetime(0) NOT NULL,
  `done_date` datetime(0) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `status_UNIQUE`(`status`) USING BTREE,
  INDEX `fk_purchase_order_user1_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_purchase_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for service_electric_car
-- ----------------------------
DROP TABLE IF EXISTS `service_electric_car`;
CREATE TABLE `service_electric_car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(4) NULL DEFAULT 1,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `date` datetime(0) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  INDEX `fk_service_car_user1_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_service_car_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_electric_car
-- ----------------------------
INSERT INTO `service_electric_car` VALUES (1, 'EC', 'ລົດ​ໄຟ​ຟ້າ', 15000, 1, '​ປິ້ນີ້​ໃຊ້​ໄດ້​ເທືຶ່ອ​ດຽວພາຍ​​ໃນ​ໜື່ງມື້​ໃນການນຳ​ໃຊ້​ພາ​ຫະ​ນະ​ສວນ​ພືກ​ສາ', '2019-12-31 09:07:02', 1);
INSERT INTO `service_electric_car` VALUES (2, 'BK', 'ລົດ​ຖີບ', 70000, 1, '​ປິ້ນີ້​ໃຊ້​ໄດ້​ເທືຶ່ອ​ດຽວພາຍ​​ໃນ​ໜື່ງມື້​ໃນການນຳ​ໃຊ້​ພາ​ຫະ​ນະ​ສວນ​ພືກ​ສາ', '2020-01-01 11:26:23', 1);

-- ----------------------------
-- Table structure for service_food_beverage
-- ----------------------------
DROP TABLE IF EXISTS `service_food_beverage`;
CREATE TABLE `service_food_beverage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buy_price` float NOT NULL,
  `sale_price` float NOT NULL,
  `photo` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date` datetime(0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('Food','Beverage') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_service_food_user1_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_service_food_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for service_ticket
-- ----------------------------
DROP TABLE IF EXISTS `service_ticket`;
CREATE TABLE `service_ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NOT NULL,
  `date` datetime(0) NOT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_service_ticket_user1_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_service_ticket_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_ticket
-- ----------------------------
INSERT INTO `service_ticket` VALUES (1, 'TB', 'ຜູ້​ໃຫຍ່', 10000, '2019-12-31 06:03:00', '​ປິ້ນີ້​ໃຊ້​ໄດ້​ເທືຶ່ອ​ດຽວພາຍ​​ໃນ​ໜື່ງມື້​ໃນການ​ເຂົ້າ​ຊົມ​ສວນ​ພືກ​ສາ', 1);
INSERT INTO `service_ticket` VALUES (2, 'TS', 'ເດັກນ້ອຍ', 5000, '2019-12-31 08:53:07', '​ປິ້ນີ້​ໃຊ້​ໄດ້​ເທືຶ່ອ​ດຽວພາຍ​​ໃນ​ໜື່ງມື້​ໃນການ​ເຂົ້າ​ຊົມ​ສວນ​ພືກ​ສາ', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` enum('Admin','User') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'daxiong', '$2y$13$M/AAMj7nlryNxsTKfFPWQ.zthyhER0/ckStaRGu6K18xiL9i24hHC', 'Admin', 1);

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone_number` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  INDEX `fk_user_profile_user_idx`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_profile
-- ----------------------------
INSERT INTO `user_profile` VALUES (1, 'profile_20191226063845.jpeg', 'Daxiong', 'Sonyangcheng', 'cc', '2334', 1);

SET FOREIGN_KEY_CHECKS = 1;