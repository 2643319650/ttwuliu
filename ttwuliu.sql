/*
 Navicat Premium Data Transfer

 Source Server         : lhy
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : ttwuliu

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 06/09/2021 20:18:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (2, '1', '1', '1');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (5, '刘恒钰', '2018002', '男', '计算机与信息科学学院', '14784797215', 'lhy', '123');
INSERT INTO `t_customer` VALUES (6, '王禧', '2018002', '男', '计算机与信息科学学院', '17747031203', 'wx', '123');
INSERT INTO `t_customer` VALUES (7, '吴学聪', '2018003', '男', '计算机与信息科学学院', '15149703883', 'wxc', '123');
INSERT INTO `t_customer` VALUES (8, '周昊', '2018004', '男', '计算机与信息科学学院', '12134356599', 'zhouhao', '123');
INSERT INTO `t_customer` VALUES (9, '张琪', '2018005', '女', '计算机与信息科学学院', '18128239388', 'zq', '123');

-- ----------------------------
-- Table structure for t_driver
-- ----------------------------
DROP TABLE IF EXISTS `t_driver`;
CREATE TABLE `t_driver`  (
  `driver_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,  
  `driver_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_state` int(11) NULL DEFAULT NULL COMMENT '0是无寝室 1是有寝室',
  PRIMARY KEY (`driver_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_driver
-- ----------------------------
INSERT INTO `t_driver` VALUES (4, '万宇','20180516001', '男', '计算机与信息科学学院', '软件工程', '2班', 'wy', '123', '篮球', 0);
INSERT INTO `t_driver` VALUES (5, '王哲','20180516001', '男', '计算机与信息科学学院', '软件工程', '2班', 'wz', '123', '乒乓球', 1);
INSERT INTO `t_driver` VALUES (6, '贾研平','20180516001', '男', '计算机与信息科学学院', '软件工程', '2班', 'jyp', '123', '音乐', 0);
INSERT INTO `t_driver` VALUES (7, '刘鹏', '20180516001', '男', '计算机与信息科学学院', '软件工程', '2班','lp', '123', '垫江', 0);
INSERT INTO `t_driver` VALUES (8, '张三', '20180516001', '男', '计算机与信息科学学院', '软件工程', '2班','zs', '123', '垫江', 0);
INSERT INTO `t_driver` VALUES (9, '李四', '20180516001', '男', '计算机与信息科学学院', '软件工程', '2班','ls', '123', '羽毛球', 0);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运单id',
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `send_date` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `arrive_date` datetime(0) NULL DEFAULT NULL COMMENT '到货时间',
  `send_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货地址',
  `arrive_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `order_state` int(11) NULL DEFAULT 0 COMMENT '0是待核验 1是运输中 2是已到货 3是订单完成',
  `order_create_date` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `order_money` double NULL DEFAULT NULL COMMENT '运费',
  `order_customer` int(11) NULL DEFAULT NULL COMMENT '下单客户',
  `order_arrive_username` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `order_arrive_usertel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `order_driver` int(11) NULL DEFAULT NULL COMMENT '运输人员id',
  `order_tran` int(11) NULL DEFAULT NULL COMMENT '运输工具id',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `order_customer`(`order_customer`) USING BTREE,
  INDEX `order_driver`(`order_driver`) USING BTREE,
  INDEX `order_tran`(`order_tran`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`order_customer`) REFERENCES `t_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`order_driver`) REFERENCES `t_driver` (`driver_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`order_tran`) REFERENCES `t_tran` (`tran_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (13, '20867090992', '2021-09-05 21:01:16', '2021-09-10 00:00:00', '济南市长清区', '内蒙古自治区包头市青山区包头师范学院', 3, '2021-09-05 12:56:54', 90305, 6, '刘恒钰', '14784797215', 6, 9);
INSERT INTO `t_order` VALUES (14, '220828289', '2021-09-06 16:59:55', '2021-09-06 16:59:58', '内蒙古自治区包头市青山区包头师范学院', '山东省济南市长清区创新谷西城软件园C座513', 1, '2021-09-05 14:08:53', 1206, 5, '吴学聪', '12134435566', 5, 6);
INSERT INTO `t_order` VALUES (15, '4618569963', NULL, NULL, '山东省济南市', '内蒙古自治区包头市青山区包头师范学院', 0, '2021-09-05 14:10:44', NULL, 7, '刘恒钰', '14784797215', NULL, NULL);
INSERT INTO `t_order` VALUES (16, '220828289', NULL, NULL, '内蒙古自治区鄂尔多斯市准格尔旗', '山东省济南市长清区', 0, '2021-09-05 14:12:02', NULL, 8, '刘恒钰', '14784797215', NULL, NULL);
INSERT INTO `t_order` VALUES (17, '4618569963', NULL, NULL, '山东省济南市长清区', '内蒙古自治区鄂尔多斯市准格尔旗', 0, '2021-09-05 14:12:45', NULL, 9, '刘恒钰', '14784797215', NULL, NULL);
INSERT INTO `t_order` VALUES (18, '220828289', NULL, NULL, '内蒙古自治区包头市青山区包头师范学院', '内蒙古自治区呼和浩特市', 0, '2021-09-05 14:13:59', NULL, 5, '王禧', '14784797215', NULL, NULL);
INSERT INTO `t_order` VALUES (19, '21187221251', NULL, NULL, '请问', '请问', 0, '2021-09-05 14:40:21', NULL, 5, '请问', '请问', NULL, NULL);
INSERT INTO `t_order` VALUES (20, '21371053681', NULL, NULL, '内蒙古自治区乌兰察布市集宁师范 学院', '内蒙古 自治区包头市', 0, '2021-09-06 00:31:52', NULL, 8, '万宇', '13246465454', NULL, NULL);
INSERT INTO `t_order` VALUES (21, '11557503571', NULL, NULL, '呼和浩特', '济南', 0, '2021-09-06 05:51:21', NULL, 6, '刘恒钰', '14784797215', NULL, NULL);
INSERT INTO `t_order` VALUES (22, '14944235183', '2021-09-06 15:41:42', '2021-09-08 00:00:00', '呼和浩特市', '济南', 3, '2021-09-06 07:39:50', 1107, 6, '刘恒钰', '14784797215', 6, 6);
INSERT INTO `t_order` VALUES (23, '384961745', NULL, NULL, '北京市海淀区上地', NULL, 1, '2021-09-06 07:50:54', NULL, 6, '吴学聪', '1888444', NULL, NULL);

-- ----------------------------
-- Table structure for t_tran
-- ----------------------------
DROP TABLE IF EXISTS `t_tran`;
CREATE TABLE `t_tran`  (
  `tran_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运输工具id',
  `tran_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运输工具名称',
  `tran_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运输工具状态1可选，0数量为0',
  `tran_money` double(8, 2) NULL DEFAULT NULL COMMENT '运输起步费用',
  PRIMARY KEY (`tran_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tran
-- ----------------------------
INSERT INTO `t_tran` VALUES (6, '1号直升机', '0', 1000.00);
INSERT INTO `t_tran` VALUES (7, '1号快艇', '1', 500.00);
INSERT INTO `t_tran` VALUES (8, '和谐号', '1', 3000.00);
INSERT INTO `t_tran` VALUES (9, 'C-5M超级银河运输机', '1', 90000.00);
INSERT INTO `t_tran` VALUES (10, '运-20运输机', '1', 80000.00);

SET FOREIGN_KEY_CHECKS = 1;
