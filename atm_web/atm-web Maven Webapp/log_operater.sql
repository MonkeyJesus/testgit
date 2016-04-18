/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : newatm

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-04-18 23:54:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `log_operater`
-- ----------------------------
DROP TABLE IF EXISTS `log_operater`;
CREATE TABLE `log_operater` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bankId` bigint(20) NOT NULL,
  `atmId` bigint(20) NOT NULL,
  `accountId` bigint(20) NOT NULL,
  `methodId` int(11) NOT NULL,
  `money` float DEFAULT NULL,
  `operateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_operater
-- ----------------------------
