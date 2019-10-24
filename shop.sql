/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 18/10/2019 10:04:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_number` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_subname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` int(5) NULL DEFAULT 0,
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_category_id` int(5) NULL DEFAULT 0,
  `sub_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_category_id` int(5) NULL DEFAULT 9,
  `item_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT 0,
  `type_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bonus_id` int(11) NULL DEFAULT 0,
  `brand_id` int(3) NULL DEFAULT 0,
  `brand_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock_price` double(10, 2) NULL DEFAULT 0.00,
  `list_price` double(10, 0) NULL DEFAULT 0,
  `our_price` double(10, 0) NULL DEFAULT 0,
  `our_point_price` double(10, 2) NULL DEFAULT 0.00,
  `vip_price` double(10, 2) NULL DEFAULT 0.00,
  `vip_point_price` double(10, 2) NULL DEFAULT 0.00,
  `promotion_price` double(10, 2) NULL DEFAULT 0.00,
  `promotion_date_from` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_date_to` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `points` int(10) NULL DEFAULT 0,
  `contact_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_weixin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact_qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content_copyright` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_flow` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_brief_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_brief` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_comment_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_comment` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_content_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_feature_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_feature` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_desc` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_service_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_service` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_thumb` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_screen` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_cover` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_photos` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `total_click` int(10) NOT NULL DEFAULT 0,
  `count_exchange` int(6) NULL DEFAULT 0,
  `goods_inventory` int(10) NULL DEFAULT 0,
  `goods_attribute` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_weight` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spec` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `material` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_model_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_model` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_color_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_color` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_size_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_size` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_bulk` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `on_shelf` int(1) NULL DEFAULT 1,
  `os_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000-00-00 00:00:00',
  `is_new` int(1) NULL DEFAULT 1,
  `is_hot` int(1) NULL DEFAULT 0,
  `is_recommend` int(1) NULL DEFAULT 0,
  `is_oos` int(1) NULL DEFAULT 0,
  `payment_option` int(1) NULL DEFAULT 0,
  `unit_cost` double(10, 2) NULL DEFAULT 0.00,
  `comments1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comments2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count_store` int(8) NULL DEFAULT 0,
  `enabled` int(1) NULL DEFAULT 1,
  `provider_id` int(3) NULL DEFAULT 0,
  `provider_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merchant_id` int(5) NULL DEFAULT 0,
  `merchant_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `giveaway_id` int(5) NULL DEFAULT 0,
  `giveaway_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template_id` int(5) NULL DEFAULT 0,
  `template_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressions_cumulate` int(5) NULL DEFAULT 0,
  `expressions_consume` int(5) NULL DEFAULT 0,
  `stat_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `adjust_percent` double(10, 2) NULL DEFAULT 0.00,
  `rake_off` double(10, 2) NULL DEFAULT 0.00,
  `max_order` int(5) NULL DEFAULT 0,
  `has_adv` int(1) NULL DEFAULT 1,
  `has_bonus` int(1) NULL DEFAULT 0,
  `has_money_bonus` int(1) NULL DEFAULT 0,
  `has_accessory` int(1) NULL DEFAULT 0,
  `count_buyer` int(5) NULL DEFAULT 0,
  `count_down` int(5) NULL DEFAULT 0,
  `count_sold_week` int(11) NULL DEFAULT 0,
  `count_sold` int(11) NULL DEFAULT 0,
  `count_view_week` int(11) NULL DEFAULT 0,
  `count_view` int(11) NULL DEFAULT 0,
  `count_comment` int(5) NULL DEFAULT 0,
  `count_accessory` int(1) NULL DEFAULT 0,
  `dateline` int(11) NULL DEFAULT 0,
  `stock_count` int(5) NULL DEFAULT 0,
  `is_open_chat` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `goods_color_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock_number` int(11) NULL DEFAULT NULL,
  `convertId` int(11) NULL DEFAULT 1177,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4089 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单名',
  `parent_menu_id` int(11) NULL DEFAULT NULL COMMENT '主菜单',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单链接\r\n',
  `created_at` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES (1, '菜单管理', 0, 'menu/index', '2019-09-10 10:23:17', '2019-09-10 10:24:05');
INSERT INTO `tb_menu` VALUES (2, '用户管理', 0, 'user/lists', '2019-09-10 10:23:38', '2019-09-10 10:24:02');
INSERT INTO `tb_menu` VALUES (3, '权限管理', 0, 'permission/index', '2019-09-10 10:24:28', NULL);
INSERT INTO `tb_menu` VALUES (5, '产品管理', 0, 'product/index', '2019-09-16 13:52:22', NULL);
INSERT INTO `tb_menu` VALUES (6, '产品分类', 5, 'product/category', '2019-09-23 16:05:07', NULL);
INSERT INTO `tb_menu` VALUES (7, '产品图片', 5, 'product/images', '2019-09-23 16:30:14', NULL);
INSERT INTO `tb_menu` VALUES (8, '产品列表', 5, 'product/index', '2019-09-23 16:50:38', NULL);

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `order_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `order_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单总价',
  `goods_num` int(11) NULL DEFAULT NULL COMMENT '订单数量',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission` VALUES (28, 1, 6);
INSERT INTO `tb_permission` VALUES (27, 1, 5);
INSERT INTO `tb_permission` VALUES (8, 3, 2);
INSERT INTO `tb_permission` VALUES (7, 3, 1);
INSERT INTO `tb_permission` VALUES (26, 1, 3);
INSERT INTO `tb_permission` VALUES (25, 1, 2);
INSERT INTO `tb_permission` VALUES (24, 1, 1);
INSERT INTO `tb_permission` VALUES (29, 1, 7);
INSERT INTO `tb_permission` VALUES (30, 1, 8);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `org_id` int(5) NULL DEFAULT 0,
  `org_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merchant_id` int(5) NULL DEFAULT 0,
  `merchant_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT 0,
  `group_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_type` int(5) NULL DEFAULT 0,
  `user_portal` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_realname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_passwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `user_birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000-00-00 00:00:00',
  `user_paypwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cert_type` int(1) NULL DEFAULT NULL,
  `user_identity_card` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country_id` int(6) NULL DEFAULT NULL,
  `province_id` int(6) NULL DEFAULT NULL,
  `city_id` int(6) NULL DEFAULT NULL,
  `district_id` int(6) NULL DEFAULT NULL,
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_postcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_score_id` int(10) NULL DEFAULT 0,
  `user_rank_id` int(11) NULL DEFAULT 0,
  `register_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000-00-00 00:00:00',
  `register_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login` int(11) NULL DEFAULT 0,
  `last_ip` varchar(23) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visit_count` int(5) NOT NULL DEFAULT 0,
  `user_rank` int(3) NOT NULL DEFAULT 0,
  `parent_id` int(8) NULL DEFAULT NULL,
  `user_msn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_profile` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `reg_source` int(1) NULL DEFAULT NULL,
  `created` int(11) NULL DEFAULT NULL,
  `updated` int(11) NULL DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `dateline` int(11) NULL DEFAULT 0,
  `login_count` int(2) NULL DEFAULT 0,
  `lock_time` int(11) NULL DEFAULT 0,
  `count_order` int(11) NULL DEFAULT 0,
  `count_exchange` int(6) NULL DEFAULT 0,
  `has_check` int(1) NULL DEFAULT 0,
  `is_locked` int(1) NULL DEFAULT 1,
  `is_blocked` int(1) NULL DEFAULT 0,
  `is_validated` int(1) NULL DEFAULT 0,
  `user_notes` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `acceptance_status` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '接单状态：1.未接单，2.已接单',
  `menu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, '001', 'admin2019', NULL, NULL, '管理员2', 'number@erp.com', 'YWRtaW5AMjAxOQ==', NULL, NULL, '0', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, '1', NULL);
INSERT INTO `tb_user` VALUES (3, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, '002', 'admin12', NULL, NULL, '华北白酒', 'number@erp.com', 'YWRtaW5AMjAxOQ==', NULL, NULL, '0', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, '1', NULL);
INSERT INTO `tb_user` VALUES (4, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, 'number', 'number', NULL, NULL, 'cheng', 'number@erp.com', 'number@123', NULL, NULL, '0', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, '1', NULL);
INSERT INTO `tb_user` VALUES (5, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, 'admin', '潘志龙 兴业银行', NULL, NULL, '华北白酒', 'number@erp.com', 'admin@2019', NULL, NULL, '0', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, '1', NULL);

SET FOREIGN_KEY_CHECKS = 1;
