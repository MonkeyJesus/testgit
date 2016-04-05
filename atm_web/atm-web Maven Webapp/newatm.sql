/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : newatm

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-04-05 00:09:22
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `personId` varchar(255) NOT NULL,
  `bankId` bigint(20) NOT NULL,
  `roleId` varchar(255) NOT NULL,
  `createAddress` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ceiling` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `loan` double DEFAULT NULL,
  `defaultLanguage` varchar(255) NOT NULL,
  `exportPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_bank` (`bankId`),
  CONSTRAINT `fk_acc_bank` FOREIGN KEY (`bankId`) REFERENCES `bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `atminfo`
-- ----------------------------
DROP TABLE IF EXISTS `atminfo`;
CREATE TABLE `atminfo` (
  `id` bigint(20) NOT NULL,
  `bankId` bigint(20) NOT NULL,
  `equipmentInfo` varchar(0) DEFAULT NULL,
  `idBreakDown` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_atm_bank` (`bankId`),
  CONSTRAINT `fk_atm_bank` FOREIGN KEY (`bankId`) REFERENCES `bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of atminfo
-- ----------------------------

-- ----------------------------
-- Table structure for `bank`
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` bigint(20) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `totalFunds` double DEFAULT NULL,
  `totalDeposit` double DEFAULT NULL,
  `totalWithdraw` double DEFAULT NULL,
  `totalOverdraft` double DEFAULT NULL,
  `totalLoan` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('1', '上海总行', '0', '0', '1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `employeeId` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `employeeName` varchar(255) NOT NULL,
  `personId` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  `bankId` bigint(20) NOT NULL,
  `addBankTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_bank` (`bankId`),
  CONSTRAINT `fk_bank` FOREIGN KEY (`bankId`) REFERENCES `bank` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '10001', 'd3c59d25033dbf980d29554025c23a75', '8d78869f470951332959580424d4bf4f', 'admin', '320281199304270291', '18006246923', '嘿嘿嘿', 'asda@qq.com', '1', '1', '2016-04-03 15:32:53');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `parentIds` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_resource_parent_id` (`parentId`),
  KEY `idx_resource_parent_ids` (`parentIds`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '资源', 'menu', '', '0', '0/', '', '1');
INSERT INTO `resource` VALUES ('21', '用户管理', 'menu', '/user', '1', '0/1/', 'user:*', '1');
INSERT INTO `resource` VALUES ('22', '用户新增', 'button', '', '21', '0/1/21/', 'user:create', '1');
INSERT INTO `resource` VALUES ('23', '用户修改', 'button', '', '21', '0/1/21/', 'user:update', '1');
INSERT INTO `resource` VALUES ('24', '用户删除', 'button', '', '21', '0/1/21/', 'user:delete', '1');
INSERT INTO `resource` VALUES ('25', '用户查看', 'button', '', '21', '0/1/21/', 'user:view', '1');
INSERT INTO `resource` VALUES ('31', '资源管理', 'menu', '/resource', '1', '0/1/', 'resource:*', '1');
INSERT INTO `resource` VALUES ('32', '资源新增', 'button', '', '31', '0/1/31/', 'resource:create', '1');
INSERT INTO `resource` VALUES ('33', '资源修改', 'button', '', '31', '0/1/31/', 'resource:update', '1');
INSERT INTO `resource` VALUES ('34', '资源删除', 'button', '', '31', '0/1/31/', 'resource:delete', '1');
INSERT INTO `resource` VALUES ('35', '资源查看', 'button', '', '31', '0/1/31/', 'resource:view', '1');
INSERT INTO `resource` VALUES ('41', '角色管理', 'menu', '/role', '1', '0/1/', 'role:*', '1');
INSERT INTO `resource` VALUES ('42', '角色新增', 'button', '', '41', '0/1/41/', 'role:create', '1');
INSERT INTO `resource` VALUES ('43', '角色修改', 'button', '', '41', '0/1/41/', 'role:update', '1');
INSERT INTO `resource` VALUES ('44', '角色删除', 'button', '', '41', '0/1/41/', 'role:delete', '1');
INSERT INTO `resource` VALUES ('45', '角色查看', 'button', '', '41', '0/1/41/', 'role:view', '1');
INSERT INTO `resource` VALUES ('46', '资源1', 'menu', '/see/list', '1', '0/1/', 'see:list', null);
INSERT INTO `resource` VALUES ('47', '资源2', 'menu', '/see/list2', '1', '0/1/', 'see:list2', null);
INSERT INTO `resource` VALUES ('48', '资源3', 'menu', '/see/list3', '1', '0/1/', 'see:list3', null);
INSERT INTO `resource` VALUES ('49', '资源4', 'menu', '/see/list4', '1', '0/1/', 'see:list4', null);
INSERT INTO `resource` VALUES ('50', '资源5', 'menu', '/see/list5', '1', '0/1/', 'see:list5', null);
INSERT INTO `resource` VALUES ('51', '资源6', 'menu', '/see/list6', '1', '0/1/', 'see:list6', null);
INSERT INTO `resource` VALUES ('52', '资源7', 'menu', '/see/list7', '1', '0/1/', 'see:list7', null);
INSERT INTO `resource` VALUES ('53', '资源8', 'menu', '/see/list8', '1', '0/1/', 'see:list8', null);
INSERT INTO `resource` VALUES ('54', '资源9', 'menu', '/see/list9', '1', '0/1/', 'see:list9', null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_resource_ids` (`resource_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '超级管理员', '21,31,41', '1');
