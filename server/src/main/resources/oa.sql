/*
Navicat MySQL Data Transfer

Source Server         : azure
Source Server Version : 80039
Source Host           : 48.218.62.239:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 80039
File Encoding         : 65001

Date: 2024-08-23 00:40:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for approval
-- ----------------------------
DROP TABLE IF EXISTS `approval`;
CREATE TABLE `approval` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from` int DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `status` enum('PASS','PENDING','REJECT') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_from` (`from`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of approval
-- ----------------------------
INSERT INTO `approval` VALUES ('1', '2', null, 'PENDING');

-- ----------------------------
-- Table structure for chat_group
-- ----------------------------
DROP TABLE IF EXISTS `chat_group`;
CREATE TABLE `chat_group` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of chat_group
-- ----------------------------
INSERT INTO `chat_group` VALUES ('1', '火星人会议', '如果你是火星人，来开会吧');

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `leader` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `desp` varchar(255) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', '1', '神秘组织', '来自火星的奇怪生物', '0');

-- ----------------------------
-- Table structure for group_rank
-- ----------------------------
DROP TABLE IF EXISTS `group_rank`;
CREATE TABLE `group_rank` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `group` int DEFAULT NULL,
  `rank` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of group_rank
-- ----------------------------
INSERT INTO `group_rank` VALUES ('1', '火星头子', '1', '1');
INSERT INTO `group_rank` VALUES ('2', '火星酋长', '1', '2');
INSERT INTO `group_rank` VALUES ('3', '火星市民', '1', '3');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `partid` int DEFAULT NULL,
  `rank` int DEFAULT NULL,
  `join_time` datetime DEFAULT NULL,
  `status` enum('Abort','Work') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '1', '1', null, null, null);
INSERT INTO `member` VALUES ('2', '1', '2', null, null, null);
INSERT INTO `member` VALUES ('3', '1', '3', null, null, null);

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `file_type` enum('PDF','IMG','WORD','EXCEL','TXT','VIDEO') DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `is_group` int DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `is_file` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `file` blob,
  PRIMARY KEY (`id`),
  KEY `idx_time` (`send_time`),
  KEY `idx_type` (`file_type`,`is_file`),
  KEY `idx_from` (`from`),
  KEY `idx_to` (`to`),
  KEY `idx_group` (`is_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('1', '来自星星的消息', null, '1', '1', '0', '2024-08-22 23:50:24', '0', '0', null);

-- ----------------------------
-- Table structure for part
-- ----------------------------
DROP TABLE IF EXISTS `part`;
CREATE TABLE `part` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `groupid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of part
-- ----------------------------
INSERT INTO `part` VALUES ('1', '动力车间', '1');
INSERT INTO `part` VALUES ('2', '控制车间', '1');
INSERT INTO `part` VALUES ('3', '观测器', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rank` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'Admin', '1');
INSERT INTO `role` VALUES ('2', 'Register', '2');
INSERT INTO `role` VALUES ('3', 'Viewer', '3');

-- ----------------------------
-- Table structure for step
-- ----------------------------
DROP TABLE IF EXISTS `step`;
CREATE TABLE `step` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `step` int DEFAULT NULL,
  `viewerid` int DEFAULT NULL,
  `vieweeid` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `result` enum('PASS','PENDING','REJECT') DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of step
-- ----------------------------
INSERT INTO `step` VALUES ('1', '1', '1', '2', null, 'PENDING', '');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `begin_time` datetime DEFAULT NULL,
  `assign` int DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` enum('FAIL','FINISH','ON','CANCEL') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '2024-08-23 00:14:15', '1', '2024-08-31 00:14:19', null, '环游火星', 'ON', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `age` int unsigned DEFAULT NULL,
  `github_account` varchar(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `avatar` blob,
  `sex` int unsigned DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `role` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email` (`email`),
  KEY `idx_github` (`github_account`),
  KEY `idx_phone` (`phone`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'jcat', '123', null, null, '111', null, '2024-08-22 00:11:51', '1', null, '1', '2024-08-23 00:12:16', '1');
INSERT INTO `user` VALUES ('2', 'fan', '123', null, null, '12', null, '2024-08-23 00:12:33', '1', null, '0', '2024-08-22 00:12:54', '2');
