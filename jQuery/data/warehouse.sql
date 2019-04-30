/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : warehouse

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2019-03-28 13:32:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `number` int(50) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `madeTime` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1001', '苹果手机1', '2016-05-05 15:55:20', '6000');
INSERT INTO `product` VALUES ('1002', 'android手机', '2016-05-05 16:03:44', '5000');
INSERT INTO `product` VALUES ('1003', '戴尔计算机1', '2016-05-05 16:04:08', '3000');
INSERT INTO `product` VALUES ('1004', '华硕计算机2', '2016-05-05 16:04:30', '2900');
INSERT INTO `product` VALUES ('1005', '苹果手机', '2016-05-05 15:55:20', '6000');
INSERT INTO `product` VALUES ('1006', 'android手机', '2016-05-05 16:03:44', '5000');
INSERT INTO `product` VALUES ('1007', '戴尔计算机', '2016-05-05 16:04:08', '3000');
INSERT INTO `product` VALUES ('1008', '华硕计算机', '2016-05-05 16:04:30', '2900');
INSERT INTO `product` VALUES ('1009', '苹果手机', '2016-05-05 15:55:20', '6000');
INSERT INTO `product` VALUES ('1010', 'android手机', '2016-05-05 16:03:44', '5000');
INSERT INTO `product` VALUES ('1011', '戴尔计算机', '2016-05-05 16:04:08', '3000');
INSERT INTO `product` VALUES ('1012', '华硕计算机', '2016-05-05 16:04:30', '2900');
INSERT INTO `product` VALUES ('1013', '苹果手机', '2016-05-05 15:55:20', '6000');
INSERT INTO `product` VALUES ('1014', 'android手机', '2016-05-05 16:03:44', '5000');
INSERT INTO `product` VALUES ('1015', '戴尔计算机', '2016-05-05 16:04:08', '3000');
INSERT INTO `product` VALUES ('1016', '华硕计算机', '2016-05-05 16:04:30', '2900');
INSERT INTO `product` VALUES ('1017', '苹果手机', '2016-05-05 15:55:20', '6000');
INSERT INTO `product` VALUES ('1018', 'android手机', '2016-05-05 16:03:44', '5000');
INSERT INTO `product` VALUES ('1019', '戴尔计算机', '2016-05-05 16:04:08', '3000');
INSERT INTO `product` VALUES ('1020', '华硕计算机', '2016-05-05 16:04:30', '2900');
INSERT INTO `product` VALUES ('1021', '联想计算机', '2018-11-21 12:32:00', '4000');
