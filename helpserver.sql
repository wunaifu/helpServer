/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.14 : Database - helpserver
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`helpserver` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `helpserver`;

/*Table structure for table `acceptorder` */

DROP TABLE IF EXISTS `acceptorder`;

CREATE TABLE `acceptorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '接单表id',
  `accepterId` int(11) DEFAULT NULL COMMENT '接单者id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `acceptTime` varchar(32) DEFAULT NULL COMMENT '接单时间',
  `backReason` varchar(50) DEFAULT NULL COMMENT '退单理由',
  `backTime` varchar(32) DEFAULT NULL COMMENT '退单时间（为空未取消，不空接单中）',
  `acceptState` int(11) NOT NULL DEFAULT '1' COMMENT '状态（1接单，0取消，2已完成，3发布方取消）',
  PRIMARY KEY (`id`),
  KEY `accepterId` (`accepterId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `acceptorder_ibfk_1` FOREIGN KEY (`accepterId`) REFERENCES `user` (`userId`),
  CONSTRAINT `acceptorder_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acceptorder` */

/*Table structure for table `bigtype` */

DROP TABLE IF EXISTS `bigtype`;

CREATE TABLE `bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL COMMENT '订单大类型的名字',
  `createTime` varchar(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bigtype` */

/*Table structure for table `collectorder` */

DROP TABLE IF EXISTS `collectorder`;

CREATE TABLE `collectorder` (
  `collectId` int(11) DEFAULT NULL COMMENT '收藏id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `collectorId` int(11) DEFAULT NULL COMMENT '收藏者id',
  `collectTime` varchar(32) DEFAULT NULL COMMENT '收藏时间',
  KEY `orderId` (`orderId`),
  KEY `collectorId` (`collectorId`),
  CONSTRAINT `collectorder_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  CONSTRAINT `collectorder_ibfk_2` FOREIGN KEY (`collectorId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collectorder` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈表id',
  `userId` int(11) DEFAULT NULL COMMENT '反馈用户id',
  `feedbackInfo` varchar(200) DEFAULT NULL COMMENT '反馈信息',
  `feedbackTime` varchar(32) DEFAULT NULL COMMENT '反馈时间',
  `reply` varchar(200) DEFAULT NULL COMMENT '管理员回复',
  `replyTime` varchar(32) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`feedbackId`),
  KEY `userId` (`userId`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

/*Table structure for table `gold` */

DROP TABLE IF EXISTS `gold`;

CREATE TABLE `gold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `goldAmount` int(11) NOT NULL DEFAULT '0' COMMENT '目前金币总数',
  `time` varchar(30) DEFAULT NULL COMMENT '时间',
  `state` int(11) DEFAULT NULL COMMENT '签到（0未签，1已签，每日零点置为0）',
  `payAmount` int(11) DEFAULT '0' COMMENT '历史充值总数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `gold_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `gold` */

insert  into `gold`(`id`,`userId`,`goldAmount`,`time`,`state`,`payAmount`) values (1,1,10,'2018-04-15 19:48:36',0,0),(2,2,71,'2018-04-15 19:51:45',1,160),(3,3,10,'2018-04-15 19:52:03',0,0),(4,4,10,'2018-04-15 19:52:21',0,0),(5,5,10,'2018-04-15 19:52:38',0,0),(6,6,10,'2018-04-15 19:52:53',0,0),(7,7,10,'2018-04-15 19:53:11',0,0),(8,8,10,'2018-04-15 19:53:26',0,0),(9,9,10,'2018-04-15 19:53:45',0,0),(10,10,10,'2018-04-15 19:54:01',0,0),(11,11,10,'2018-04-15 19:54:52',0,0),(12,12,10,'2018-04-15 19:55:11',0,0);

/*Table structure for table `goldadd` */

DROP TABLE IF EXISTS `goldadd`;

CREATE TABLE `goldadd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `addAmount` int(11) DEFAULT NULL COMMENT '充值数目',
  `addTime` varchar(30) DEFAULT NULL COMMENT '充值时间',
  `addPhoto` varchar(200) DEFAULT NULL COMMENT '支付宝充值截图',
  `getTime` varchar(30) DEFAULT NULL COMMENT '到账时间',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `goldadd_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `goldadd` */

insert  into `goldadd`(`id`,`userId`,`addAmount`,`addTime`,`addPhoto`,`getTime`) values (1,2,3,'2018-04-16 18:50:44','2/2880f731-33a4-4471-a321-07561ea0128b.png','2018-04-16 19:06:33'),(3,2,2,'2018-04-16 19:55:01',NULL,'2018-04-16 19:55:01'),(4,2,1,'2018-04-16 19:59:23',NULL,'2018-04-16 19:59:23'),(5,2,10,'2018-04-16 21:09:18','2/467c502e-d623-4b18-b21a-270cf18a21c0.png','2018-04-16 21:09:55');

/*Table structure for table `goldhistory` */

DROP TABLE IF EXISTS `goldhistory`;

CREATE TABLE `goldhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `amount` int(11) DEFAULT NULL COMMENT '操作金币数',
  `info` varchar(80) DEFAULT NULL COMMENT '金币详情（用途）',
  `time` varchar(30) DEFAULT NULL COMMENT '操作时间',
  `state` int(11) DEFAULT NULL COMMENT '状态（1收入，-1支出）',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `goldhistory_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `goldhistory` */

insert  into `goldhistory`(`id`,`userId`,`amount`,`info`,`time`,`state`) values (1,1,10,'注册','2018-04-15 19:48:36',1),(2,2,10,'注册','2018-04-15 19:51:45',1),(3,3,10,'注册','2018-04-15 19:52:03',1),(4,4,10,'注册','2018-04-15 19:52:21',1),(5,5,10,'注册','2018-04-15 19:52:38',1),(6,6,10,'注册','2018-04-15 19:52:53',1),(7,7,10,'注册','2018-04-15 19:53:11',1),(8,8,10,'注册','2018-04-15 19:53:26',1),(9,9,10,'注册','2018-04-15 19:53:45',1),(10,10,10,'注册','2018-04-15 19:54:01',1),(11,11,10,'注册','2018-04-15 19:54:52',1),(12,12,10,'注册','2018-04-15 19:55:11',1),(13,2,1,'每日签到','2018-04-15 20:01:45',1),(14,2,30,'支付宝充值','2018-04-16 19:06:33',1),(16,2,20,'余额充值','2018-04-16 19:55:01',1),(17,2,10,'余额充值','2018-04-16 19:59:23',1),(20,2,100,'支付宝充值','2018-04-16 21:09:55',1),(21,2,100,'金币提现','2018-04-16 21:10:32',0);

/*Table structure for table `identity` */

DROP TABLE IF EXISTS `identity`;

CREATE TABLE `identity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(15) DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `frontPhoto` varchar(150) DEFAULT NULL COMMENT '身份证正面',
  `backPhoto` varchar(150) DEFAULT NULL COMMENT '身份证反面',
  `askTime` varchar(32) DEFAULT NULL COMMENT '请求时间',
  `checkTime` varchar(32) DEFAULT NULL COMMENT '验证时间（通过或失败时间）',
  `failureReason` varchar(100) DEFAULT NULL COMMENT '失败原因',
  `checkState` int(11) NOT NULL DEFAULT '0' COMMENT '验证状态（0请求验证，1已通过，-1不通过）',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `identity_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `identity` */

/*Table structure for table `money` */

DROP TABLE IF EXISTS `money`;

CREATE TABLE `money` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '余额id，自增长',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `amount` int(11) DEFAULT NULL COMMENT '账户余额',
  `time` varchar(30) DEFAULT NULL COMMENT '时间',
  `payAmount` int(11) DEFAULT NULL COMMENT '历史充值数目',
  `getAmount` int(11) DEFAULT NULL COMMENT '历史提现数目',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `money_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `money` */

insert  into `money`(`id`,`userId`,`amount`,`time`,`payAmount`,`getAmount`) values (1,1,0,'2018-04-15 19:48:36',0,0),(2,2,11,'2018-04-15 19:51:45',10,6),(3,3,0,'2018-04-15 19:52:03',0,0),(4,4,0,'2018-04-15 19:52:21',0,0),(5,5,0,'2018-04-15 19:52:38',0,0),(6,6,0,'2018-04-15 19:52:53',0,0),(7,7,0,'2018-04-15 19:53:11',0,0),(8,8,0,'2018-04-15 19:53:26',0,0),(9,9,0,'2018-04-15 19:53:45',0,0),(10,10,0,'2018-04-15 19:54:01',0,0),(11,11,0,'2018-04-15 19:54:52',0,0),(12,12,0,'2018-04-15 19:55:11',0,0);

/*Table structure for table `moneyadd` */

DROP TABLE IF EXISTS `moneyadd`;

CREATE TABLE `moneyadd` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '余额充值id，自增长',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `addAmount` int(11) DEFAULT NULL COMMENT '充值数目',
  `addTime` varchar(30) DEFAULT NULL COMMENT '充值时间',
  `addPhoto` varchar(200) DEFAULT NULL COMMENT '支付宝充值截图',
  `getTime` varchar(30) DEFAULT NULL COMMENT '到账时间',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `moneyadd_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `moneyadd` */

insert  into `moneyadd`(`id`,`userId`,`addAmount`,`addTime`,`addPhoto`,`getTime`) values (1,2,10,'2018-04-16 11:48:07','2/9652b128-d4c3-4f06-a571-8400e4c00757.png','2018-04-16 14:55:15');

/*Table structure for table `moneyget` */

DROP TABLE IF EXISTS `moneyget`;

CREATE TABLE `moneyget` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '余额提现id，自增长',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `amount` int(11) DEFAULT NULL COMMENT '提现数目',
  `time` varchar(30) DEFAULT NULL COMMENT '请求时间',
  `payaccount` varchar(100) DEFAULT NULL COMMENT '提现支付宝号',
  `accountname` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `getTime` varchar(30) DEFAULT NULL COMMENT '后台审核时间',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `moneyget_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `moneyget` */

insert  into `moneyget`(`id`,`userId`,`amount`,`time`,`payaccount`,`accountname`,`getTime`) values (1,2,5,'2018-04-17 11:51:31','12312312','福','2018-04-17 14:20:39'),(2,2,1,'2018-04-17 14:21:33','2134','18219111621','2018-04-17 14:21:52');

/*Table structure for table `moneyhistory` */

DROP TABLE IF EXISTS `moneyhistory`;

CREATE TABLE `moneyhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '余额使用历史id，自增长',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `amount` int(11) DEFAULT NULL COMMENT '操作余额数',
  `info` varchar(80) DEFAULT NULL COMMENT '余额详情（用途）',
  `time` varchar(30) DEFAULT NULL COMMENT '操作时间',
  `state` int(11) DEFAULT NULL COMMENT '状态（1收入，-1支出）',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `moneyhistory_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `moneyhistory` */

insert  into `moneyhistory`(`id`,`userId`,`amount`,`info`,`time`,`state`) values (1,2,10,'余额充值','2018-04-16 14:55:15',1),(2,2,2,'充值金币','2018-04-16 19:55:01',0),(3,2,1,'充值金币','2018-04-16 19:59:23',0),(6,2,10,'金币提现','2018-04-16 21:10:32',1),(7,2,5,'余额提现','2018-04-17 14:20:39',0),(8,2,1,'余额提现','2018-04-17 14:21:52',0);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `content` varchar(220) NOT NULL COMMENT '内容',
  `time` varchar(35) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `senderId` int(11) NOT NULL COMMENT '发布者id',
  `typeId` int(11) NOT NULL COMMENT '发布类型id（零活、跑腿）',
  `money` int(11) DEFAULT '0' COMMENT '服务费用',
  `name` varchar(50) DEFAULT NULL COMMENT '资源名字',
  `startTime` varchar(32) DEFAULT NULL COMMENT '可使用开始时间',
  `endTime` varchar(32) DEFAULT NULL COMMENT '可使用结束时间',
  `detail` varchar(150) DEFAULT NULL COMMENT '服务详情、备注',
  `area` varchar(80) DEFAULT NULL COMMENT '所在区域（省市县）',
  `point` varchar(150) DEFAULT NULL COMMENT '详细坐标',
  `sendTime` varchar(32) DEFAULT NULL COMMENT '发布时间',
  `repealTime` varchar(32) DEFAULT NULL COMMENT '撤单时间',
  `repealReason` varchar(50) DEFAULT NULL COMMENT '撤单原因',
  `orderState` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态（0草稿、1抢单进行中、2服务进行中、3已结束、4已取消、-1管理员禁止该订单',
  `callName` varchar(15) DEFAULT NULL COMMENT '联系人',
  `callPhone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `seeAmount` int(11) DEFAULT '0' COMMENT '浏览数',
  PRIMARY KEY (`orderId`),
  KEY `senderId` (`senderId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `user` (`userId`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `ordertype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `ordertype` */

DROP TABLE IF EXISTS `ordertype`;

CREATE TABLE `ordertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bigtypeId` int(11) NOT NULL COMMENT '类型id',
  `typeName` varchar(15) NOT NULL COMMENT '类型名称',
  `state` int(11) NOT NULL COMMENT '类型状态（0禁用，1使用中）',
  `createTime` varchar(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `bigtypeId` (`bigtypeId`),
  CONSTRAINT `ordertype_ibfk_1` FOREIGN KEY (`bigtypeId`) REFERENCES `bigtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ordertype` */

/*Table structure for table `payaccount` */

DROP TABLE IF EXISTS `payaccount`;

CREATE TABLE `payaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(30) DEFAULT NULL COMMENT '更新时间',
  `payphoto` varchar(200) DEFAULT NULL COMMENT '收款码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `payaccount` */

insert  into `payaccount`(`id`,`time`,`payphoto`) values (1,'2018-04-15 19:50:55','da2c8b73-8136-4577-85f9-8c154ec1490a.jpg');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id，自动增长',
  `phone` varchar(15) NOT NULL COMMENT '手机（登录账号）',
  `password` varchar(112) NOT NULL COMMENT '密码',
  `name` varchar(15) DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(15) DEFAULT NULL COMMENT '昵称',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `age` int(11) DEFAULT '0' COMMENT '年龄',
  `sex` int(11) DEFAULT '1' COMMENT '性别（0女，1男）',
  `userInfo` varchar(150) DEFAULT NULL COMMENT '简介',
  `headicon` varchar(200) DEFAULT NULL COMMENT '头像',
  `registerTime` varchar(32) DEFAULT NULL COMMENT '注册时间',
  `banTime` varchar(32) DEFAULT NULL COMMENT '禁用时间',
  `payAccount` varchar(32) DEFAULT NULL COMMENT '支付账号',
  `permission` int(11) NOT NULL DEFAULT '0' COMMENT '权限（0普通用户，1可接单用户，2被禁用用户）',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`phone`,`password`,`name`,`nickname`,`address`,`age`,`sex`,`userInfo`,`headicon`,`registerTime`,`banTime`,`payAccount`,`permission`) values (1,'13531097736','ea289daceb77cafc67ab21a64b9c77dd','管理员','管理员',NULL,0,1,NULL,'icon001.png','2018-04-15 19:48:36',NULL,NULL,-1),(2,'18219111621','ea289daceb77cafc67ab21a64b9c77dd','18219111621','18219111621',NULL,0,1,NULL,'icon001.png','2018-04-15 19:51:45',NULL,NULL,0),(3,'18219111622','ea289daceb77cafc67ab21a64b9c77dd','18219111622','18219111622',NULL,0,1,NULL,'icon001.png','2018-04-15 19:52:03',NULL,NULL,0),(4,'18219111623','ea289daceb77cafc67ab21a64b9c77dd','18219111623','18219111623',NULL,0,1,NULL,'icon001.png','2018-04-15 19:52:21',NULL,NULL,0),(5,'18219111624','ea289daceb77cafc67ab21a64b9c77dd','18219111624','18219111624',NULL,0,1,NULL,'icon001.png','2018-04-15 19:52:38',NULL,NULL,0),(6,'18219111625','ea289daceb77cafc67ab21a64b9c77dd','18219111625','18219111625',NULL,0,1,NULL,'icon001.png','2018-04-15 19:52:53',NULL,NULL,0),(7,'18219111626','ea289daceb77cafc67ab21a64b9c77dd','18219111626','18219111626',NULL,0,1,NULL,'icon001.png','2018-04-15 19:53:11',NULL,NULL,0),(8,'18219111627','ea289daceb77cafc67ab21a64b9c77dd','18219111627','18219111627',NULL,0,1,NULL,'icon001.png','2018-04-15 19:53:26',NULL,NULL,0),(9,'18219111628','ea289daceb77cafc67ab21a64b9c77dd','18219111628','18219111628',NULL,0,1,NULL,'icon001.png','2018-04-15 19:53:45',NULL,NULL,0),(10,'18219111629','ea289daceb77cafc67ab21a64b9c77dd','18219111629','18219111629',NULL,0,1,NULL,'icon001.png','2018-04-15 19:54:01',NULL,NULL,0),(11,'18219111630','ea289daceb77cafc67ab21a64b9c77dd','18219111630','18219111630',NULL,0,1,NULL,'icon001.png','2018-04-15 19:54:52',NULL,NULL,0),(12,'18219111631','ea289daceb77cafc67ab21a64b9c77dd','18219111631','18219111631',NULL,0,1,NULL,'icon001.png','2018-04-15 19:55:11',NULL,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
