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
  `accepterId` int(11) NOT NULL COMMENT '接单者id',
  `orderId` int(11) NOT NULL COMMENT '订单id',
  `moneyType` int(11) DEFAULT '0' COMMENT '计费方式（0日租，1月租）',
  `money` int(11) DEFAULT '0' COMMENT '周期内租金（日租金，月租金）',
  `number` int(11) DEFAULT '0' COMMENT '租用数量',
  `getType` int(11) DEFAULT '0' COMMENT '租用周期',
  `acceptState` int(11) NOT NULL DEFAULT '1' COMMENT '状态（1抢单中，0取消，2接单中，3已完成，4发布方取消）',
  `dateState` int(11) DEFAULT '1' COMMENT '租用状态（1正常，0超期，2',
  `backReason` varchar(50) DEFAULT NULL COMMENT '退单理由',
  `backTime` varchar(32) DEFAULT NULL COMMENT '退单时间0',
  `acceptTime` varchar(32) DEFAULT NULL COMMENT '抢单时间1',
  `sureTime` varchar(32) DEFAULT NULL COMMENT '确认订单时间2',
  `finishTime` varchar(32) DEFAULT NULL COMMENT '订单完成时间3',
  `updateTime` varchar(32) DEFAULT NULL COMMENT '状态更新时间4',
  PRIMARY KEY (`id`),
  KEY `accepterId` (`accepterId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `acceptorder_ibfk_1` FOREIGN KEY (`accepterId`) REFERENCES `user` (`userId`),
  CONSTRAINT `acceptorder_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orderinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

/*Data for the table `acceptorder` */

insert  into `acceptorder`(`id`,`accepterId`,`orderId`,`moneyType`,`money`,`number`,`getType`,`acceptState`,`dateState`,`backReason`,`backTime`,`acceptTime`,`sureTime`,`finishTime`,`updateTime`) values (1,3,2,0,2,1,10,6,NULL,NULL,'2018-05-02 10:23:20','2018-04-26 21:51:54','2018-05-02 10:22:30','2018-05-02 10:23:13','2018-05-02 10:23:00'),(2,3,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:53:32',NULL,NULL,NULL),(3,6,2,1,30,1,2,6,NULL,NULL,'2018-05-02 11:39:26','2018-04-26 21:57:21','2018-05-02 11:38:41','2018-05-02 11:38:57','2018-05-02 11:38:51'),(4,6,1,1,10,1,1,6,NULL,NULL,'2018-05-02 11:45:13','2018-04-26 21:57:43','2018-05-02 11:45:00','2018-05-02 11:45:09','2018-05-02 11:45:02'),(52,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(53,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(54,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(55,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(56,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(57,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(58,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(59,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(60,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(61,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(62,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(63,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(64,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(65,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(66,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(67,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(68,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(69,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(70,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(71,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(72,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(73,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(74,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(75,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(76,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(77,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(78,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(79,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(80,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(81,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(82,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(83,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(84,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(85,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(86,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(87,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(88,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL),(89,6,1,1,10,1,1,1,NULL,NULL,NULL,'2018-04-26 21:57:43',NULL,NULL,NULL);

/*Table structure for table `bigtype` */

DROP TABLE IF EXISTS `bigtype`;

CREATE TABLE `bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL COMMENT '订单大类型的名字',
  `createTime` varchar(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `bigtype` */

insert  into `bigtype`(`id`,`typeName`,`createTime`) values (1,'交通出行','2018-04-26 20:47:18'),(2,'租房建筑','2018-04-26 20:47:40'),(3,'家庭用品','2018-04-26 20:48:03'),(4,'其他','2018-04-26 20:48:13');

/*Table structure for table `collectorder` */

DROP TABLE IF EXISTS `collectorder`;

CREATE TABLE `collectorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `collectorId` int(11) DEFAULT NULL COMMENT '收藏者id',
  `collectTime` varchar(32) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `collectorId` (`collectorId`),
  CONSTRAINT `collectorder_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orderinfo` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `gold` */

insert  into `gold`(`id`,`userId`,`goldAmount`,`time`,`state`,`payAmount`) values (1,1,10,'2018-04-26 20:46:27',0,0),(2,2,11,'2018-04-26 20:51:10',1,0),(3,3,11,'2018-04-26 20:51:27',1,0),(4,4,11,'2018-04-26 20:51:44',1,0),(5,5,11,'2018-04-26 20:52:03',1,0),(6,6,11,'2018-04-26 20:52:20',1,0),(7,7,10,'2018-04-26 20:52:35',0,0),(8,8,11,'2018-04-26 20:52:55',1,0),(9,9,10,'2018-04-26 20:53:14',0,0),(10,10,10,'2018-04-26 20:53:34',0,0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goldadd` */

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `goldhistory` */

insert  into `goldhistory`(`id`,`userId`,`amount`,`info`,`time`,`state`) values (1,1,10,'注册','2018-04-26 20:46:27',1),(2,2,10,'注册','2018-04-26 20:51:10',1),(3,3,10,'注册','2018-04-26 20:51:27',1),(4,4,10,'注册','2018-04-26 20:51:44',1),(5,5,10,'注册','2018-04-26 20:52:03',1),(6,6,10,'注册','2018-04-26 20:52:20',1),(7,7,10,'注册','2018-04-26 20:52:35',1),(8,8,10,'注册','2018-04-26 20:52:55',1),(9,9,10,'注册','2018-04-26 20:53:14',1),(10,10,10,'注册','2018-04-26 20:53:34',1),(11,2,1,'每日签到','2018-04-26 20:53:47',1),(12,4,1,'每日签到','2018-04-26 20:56:44',1),(13,5,1,'每日签到','2018-04-26 20:57:09',1),(14,3,1,'每日签到','2018-04-26 21:33:44',1),(15,8,1,'每日签到','2018-04-26 21:43:04',1),(16,6,1,'每日签到','2018-04-26 21:55:05',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `identity` */

insert  into `identity`(`id`,`userId`,`name`,`idcard`,`frontPhoto`,`backPhoto`,`askTime`,`checkTime`,`failureReason`,`checkState`) values (1,5,'宋姐按','123123123123','5/200428a0-ae06-46d5-9bff-dd3d84968599.png','5/1d1d6299-0b98-417c-b3b5-cff88be8dce2.png','2018-04-26 21:06:12','2018-04-26 21:51:16','认证通过',1),(2,3,'宋江','9023407248923','3/f709bce2-207e-4d07-a811-1812f199715a.png','3/737957f8-d82a-41db-82c7-72b90f3d5262.png','2018-04-26 21:34:18','2018-04-26 21:51:13','认证通过',1),(3,6,'李江','12312312312312','6/801a37ed-1d4c-46de-b6f4-ddd0be756411.png','6/176afc60-06c3-47c9-afd5-9b58c1a78c3b.png','2018-04-26 21:56:32','2018-04-26 21:56:38','认证通过',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `money` */

insert  into `money`(`id`,`userId`,`amount`,`time`,`payAmount`,`getAmount`) values (1,1,0,'2018-04-26 20:46:27',0,0),(2,2,300,'2018-04-26 20:51:10',300,0),(3,3,370,'2018-04-26 20:51:27',400,0),(4,4,250,'2018-04-26 20:51:44',250,0),(5,5,89,'2018-04-26 20:52:03',100,0),(6,6,289,'2018-04-26 20:52:20',300,0),(7,7,0,'2018-04-26 20:52:35',0,0),(8,8,280,'2018-04-26 20:52:55',300,0),(9,9,0,'2018-04-26 20:53:14',0,0),(10,10,0,'2018-04-26 20:53:34',0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `moneyadd` */

insert  into `moneyadd`(`id`,`userId`,`addAmount`,`addTime`,`addPhoto`,`getTime`) values (1,2,300,'2018-04-26 20:55:28','2/454eb79a-383b-4c54-b5cb-1c08dbc9742d.png','2018-04-26 21:16:57'),(2,3,200,'2018-04-26 20:56:10','3/e66d34cc-20df-492a-9cd7-7adaf33cd57a.png','2018-04-26 21:17:06'),(3,4,250,'2018-04-26 20:56:38','4/4e64512b-dab0-4276-8fa4-08e85fc26f42.png','2018-04-26 21:17:09'),(4,5,100,'2018-04-26 20:57:05','5/fb2959c9-cce6-4a49-a855-e3bd5b635899.png','2018-04-26 21:17:11'),(5,8,300,'2018-04-26 21:43:22','8/1928a36f-2aa2-4a7e-8c4f-c0d53baa1d53.png','2018-04-26 21:43:34'),(6,3,200,'2018-04-26 21:52:55','3/a2465275-4a2c-42b0-ab4c-dd65d96f5aad.png','2018-04-26 21:53:19'),(7,6,300,'2018-04-26 21:55:02','6/882b720c-7621-451e-b1ca-28ca5259c504.png','2018-04-26 21:55:54');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `moneyget` */

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `moneyhistory` */

insert  into `moneyhistory`(`id`,`userId`,`amount`,`info`,`time`,`state`) values (1,2,300,'余额充值','2018-04-26 21:16:57',1),(2,3,200,'余额充值','2018-04-26 21:17:06',1),(3,4,250,'余额充值','2018-04-26 21:17:09',1),(4,5,100,'余额充值','2018-04-26 21:17:11',1),(5,5,20,'服务保障金','2018-04-26 21:24:51',0),(6,8,300,'余额充值','2018-04-26 21:43:34',1),(7,8,20,'服务保障金','2018-04-26 21:47:09',0),(8,3,200,'服务押金','2018-04-26 21:51:54',0),(9,3,200,'余额充值','2018-04-26 21:53:19',1),(10,3,30,'服务押金','2018-04-26 21:53:32',0),(11,6,300,'余额充值','2018-04-26 21:55:54',1),(12,6,200,'服务押金','2018-04-26 21:57:21',0),(13,6,30,'服务押金','2018-04-26 21:57:43',0),(14,3,200,'押金归还','2018-05-02 10:23:20',1),(15,3,1,'服务租金','2018-05-02 10:23:20',0),(16,8,200,'服务租金','2018-05-02 10:23:20',1),(17,8,1,'平台使用费用','2018-05-02 10:23:20',0),(18,6,200,'押金归还','2018-05-02 11:39:26',1),(19,6,60,'服务租金','2018-05-02 11:39:26',0),(20,6,200,'服务租金','2018-05-02 11:39:26',1),(21,6,1,'平台使用费用','2018-05-02 11:39:26',0),(22,6,30,'押金归还','2018-05-02 11:45:13',1),(23,6,10,'服务租金','2018-05-02 11:45:13',0),(24,5,30,'服务租金','2018-05-02 11:45:13',1),(25,5,1,'平台使用费用','2018-05-02 11:45:13',0);

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

/*Table structure for table `ordercomment` */

DROP TABLE IF EXISTS `ordercomment`;

CREATE TABLE `ordercomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '接单者评论发布者id',
  `acceptId` int(11) NOT NULL COMMENT '订单表id',
  `myId` int(11) NOT NULL COMMENT '评论者id',
  `hisId` int(11) NOT NULL COMMENT '被评论者id',
  `score` int(11) DEFAULT NULL COMMENT '评分（1-5）',
  `content` varchar(80) DEFAULT NULL COMMENT '评论',
  `time` varchar(32) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `orderId` (`acceptId`),
  KEY `myId` (`myId`),
  KEY `hisId` (`hisId`),
  CONSTRAINT `ordercomment_ibfk_1` FOREIGN KEY (`acceptId`) REFERENCES `acceptorder` (`id`),
  CONSTRAINT `ordercomment_ibfk_2` FOREIGN KEY (`myId`) REFERENCES `user` (`userId`),
  CONSTRAINT `ordercomment_ibfk_3` FOREIGN KEY (`hisId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `ordercomment` */

insert  into `ordercomment`(`id`,`acceptId`,`myId`,`hisId`,`score`,`content`,`time`) values (1,4,6,5,5,'很好','2018-05-02 16:38:58'),(2,4,5,6,5,'好','2018-05-02 16:39:39'),(3,3,8,6,5,'很好啊','2018-05-02 16:57:22'),(4,3,6,8,5,'66','2018-05-02 17:03:54'),(5,1,3,8,5,'2222','2018-05-02 17:04:26'),(6,1,8,3,5,'11111','2018-05-02 17:11:11'),(7,53,6,6,5,'9','2018-05-02 17:11:12'),(8,54,6,6,4,'8','2018-05-02 17:11:13'),(9,55,6,6,3,'7','2018-05-02 17:11:14'),(10,56,6,6,2,'6','2018-05-02 17:11:15'),(11,57,6,6,3,'5','2018-05-02 17:11:16'),(12,58,6,6,3,'4','2018-05-02 17:11:17'),(13,59,6,6,4,'3','2018-05-02 17:11:18'),(14,60,6,6,3,'2','2018-05-02 17:11:19'),(15,61,6,6,5,'1','2018-05-02 17:11:20'),(16,62,6,6,4,'6','2018-05-02 17:11:20');

/*Table structure for table `orderinfo` */

DROP TABLE IF EXISTS `orderinfo`;

CREATE TABLE `orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `senderId` int(11) NOT NULL DEFAULT '0' COMMENT '发布者id',
  `typeId` int(11) NOT NULL DEFAULT '0' COMMENT '发布类型id（汽车、房子、电器等）',
  `moneyAmount` int(11) DEFAULT '0' COMMENT '服务费用、押金',
  `foodName` varchar(50) DEFAULT NULL COMMENT '资源名字',
  `amount` int(11) DEFAULT NULL COMMENT '库存数量',
  `outAmount` int(11) DEFAULT '0' COMMENT '已出借数量',
  `dayMoney` int(11) DEFAULT NULL COMMENT '日租金',
  `monthMoney` int(11) DEFAULT NULL COMMENT '月租金',
  `startTime` varchar(32) DEFAULT NULL COMMENT '可使用开始时间',
  `endTime` varchar(32) DEFAULT NULL COMMENT '可使用结束时间',
  `orderDetail` varchar(150) DEFAULT NULL COMMENT '服务详情、备注',
  `city` varchar(30) DEFAULT NULL COMMENT '地级市',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `pointInfo` varchar(150) DEFAULT NULL COMMENT '详细坐标',
  `lng` varchar(30) DEFAULT NULL COMMENT '经度',
  `lat` varchar(30) DEFAULT NULL COMMENT '纬度',
  `sendTime` varchar(32) DEFAULT NULL COMMENT '发布时间',
  `repealTime` varchar(32) DEFAULT NULL COMMENT '撤单时间、下架时间',
  `repealReason` varchar(50) DEFAULT NULL COMMENT '撤单原因',
  `orderState` int(11) DEFAULT '0' COMMENT '订单状态（0草稿、1资源服务发布进行中、2已结束取消、-1管理员禁止该订单',
  `callName` varchar(15) DEFAULT NULL COMMENT '联系人',
  `callPhone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `seeAmount` int(11) DEFAULT '0' COMMENT '浏览数',
  `picture` varchar(150) DEFAULT NULL COMMENT '资源图片',
  `updateTime` varchar(32) DEFAULT NULL COMMENT '更新状态时间',
  `dayNumber` int(11) DEFAULT '0' COMMENT '可租用天数',
  `monthNumber` int(11) DEFAULT '0' COMMENT '可租用月数',
  `infopicture1` varchar(150) DEFAULT NULL COMMENT '详情图片1',
  `infopicture2` varchar(150) DEFAULT NULL COMMENT '详情图片2',
  PRIMARY KEY (`id`),
  KEY `senderId` (`senderId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `orderinfo_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `user` (`userId`),
  CONSTRAINT `orderinfo_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `ordertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

/*Data for the table `orderinfo` */

insert  into `orderinfo`(`id`,`senderId`,`typeId`,`moneyAmount`,`foodName`,`amount`,`outAmount`,`dayMoney`,`monthMoney`,`startTime`,`endTime`,`orderDetail`,`city`,`address`,`pointInfo`,`lng`,`lat`,`sendTime`,`repealTime`,`repealReason`,`orderState`,`callName`,`callPhone`,`seeAmount`,`picture`,`updateTime`,`dayNumber`,`monthNumber`,`infopicture1`,`infopicture2`) values (1,5,6,30,'2升电饭煲',1,0,2,10,NULL,NULL,'强力电饭煲，煮的饭香','江门市','江门市蓬江区五邑大学','江门市蓬江区五邑大学','113.090704','22.59913','2018-04-26 21:24:51',NULL,NULL,1,'宋先生','18215485455',0,'5/1bbed3f7-6e55-45b1-b28d-250dc3185793.jpg',NULL,30,3,'5/3f38e3c9-bd87-4ae5-b018-f83dc2703d57.jpg','5/925385f5-8b95-4728-abd4-71a1179b55e1.jpg'),(2,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(84,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速啥地方','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09','2018-05-02 20:25:49',NULL,2,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg','2018-05-02 20:07:30',30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(85,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(86,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(87,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(88,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(89,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(90,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(91,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(92,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(93,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(94,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(95,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(96,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(97,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(98,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(99,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(100,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(101,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(102,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(103,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(104,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(105,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(106,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(107,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(108,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(109,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(110,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(111,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(112,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(113,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(114,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(115,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(116,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(117,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(118,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(119,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(120,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09',NULL,NULL,1,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg'),(121,8,4,200,'蓝色山地车',1,0,2,30,NULL,NULL,'原价1200的山地，骑得很舒服，可调速','中山市','中山横栏镇横栏中学','中山市市辖区横栏中学-公交车站','113.260788','22.538678','2018-04-26 21:47:09','2018-05-02 20:33:45',NULL,2,'张小姐','1548484545',0,'8/9d8dffbc-d9f3-4e8b-9737-303893a5c248.jpg',NULL,30,6,'8/c255a604-ee79-4ee4-8146-ae3c05e20517.jpg','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `ordertype` */

insert  into `ordertype`(`id`,`bigtypeId`,`typeName`,`state`,`createTime`) values (1,1,'汽车',1,'2018-04-26 20:48:23'),(2,1,'摩托车',1,'2018-04-26 20:48:33'),(3,1,'电车',1,'2018-04-26 20:48:39'),(4,1,'自行车',1,'2018-04-26 20:48:44'),(5,2,'租房',1,'2018-04-26 20:49:12'),(6,3,'电饭煲',1,'2018-04-26 20:49:46'),(7,3,'电视',1,'2018-04-26 20:49:57'),(8,3,'冰箱',1,'2018-04-26 20:50:15'),(9,4,'其他',1,'2018-04-26 20:50:24');

/*Table structure for table `payaccount` */

DROP TABLE IF EXISTS `payaccount`;

CREATE TABLE `payaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(30) DEFAULT NULL COMMENT '更新时间',
  `payphoto` varchar(200) DEFAULT NULL COMMENT '收款码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `payaccount` */

insert  into `payaccount`(`id`,`time`,`payphoto`) values (1,'2018-04-26 20:55:03','34982d30-e6a3-4780-8cd5-c0b083253e48.jpg');

/*Table structure for table `sendercomment` */

DROP TABLE IF EXISTS `sendercomment`;

CREATE TABLE `sendercomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发布者评论接单者id',
  `orderId` int(11) NOT NULL COMMENT '订单表id',
  `senderId` int(11) NOT NULL COMMENT '发布者id',
  `accepterId` int(11) NOT NULL COMMENT '接单者id',
  `score` int(11) DEFAULT NULL COMMENT '评分（1-5）',
  `content` varchar(80) DEFAULT NULL COMMENT '评论',
  `time` varchar(32) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `senderId` (`senderId`),
  KEY `accepterId` (`accepterId`),
  CONSTRAINT `sendercomment_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orderinfo` (`id`),
  CONSTRAINT `sendercomment_ibfk_2` FOREIGN KEY (`senderId`) REFERENCES `user` (`userId`),
  CONSTRAINT `sendercomment_ibfk_3` FOREIGN KEY (`accepterId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sendercomment` */

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
  `credit` varchar(10) DEFAULT NULL COMMENT '信誉积分统计',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`phone`,`password`,`name`,`nickname`,`address`,`age`,`sex`,`userInfo`,`headicon`,`registerTime`,`banTime`,`payAccount`,`permission`,`credit`) values (1,'13531097736','ea289daceb77cafc67ab21a64b9c77dd','管理员','管理员',NULL,0,1,NULL,'icon001.png','2018-04-26 20:46:27',NULL,NULL,-1,'0'),(2,'18219111621','ea289daceb77cafc67ab21a64b9c77dd','李闻','李闻','中山',0,1,'我是谁','icon001.png','2018-04-26 20:51:10',NULL,NULL,0,'0'),(3,'18219111622','ea289daceb77cafc67ab21a64b9c77dd','宋江','宋江','江门蓬江',30,1,'家教','3/ba24c5bd-3780-45a4-a02c-533ab22c3d74.jpg','2018-04-26 20:51:27',NULL,NULL,1,'5.0'),(4,'18219111623','ea289daceb77cafc67ab21a64b9c77dd','18219111623','18219111623',NULL,0,1,NULL,'icon001.png','2018-04-26 20:51:44',NULL,NULL,0,'0'),(5,'18219111624','ea289daceb77cafc67ab21a64b9c77dd','宋姐按','宋姐岸','广东湛江',20,1,'你好','5/7e08eec9-55e2-491f-9ef9-a4f6d81c8a58.jpg','2018-04-26 20:52:03',NULL,NULL,1,'5.0'),(6,'18219111625','ea289daceb77cafc67ab21a64b9c77dd','李江','李江','12',0,1,'21','6/1a4238f7-adbb-48a4-a58f-5f2fc38cfd03.jpg','2018-04-26 20:52:20',NULL,NULL,1,'5.0'),(7,'18219111626','ea289daceb77cafc67ab21a64b9c77dd','18219111626','18219111626',NULL,0,1,NULL,'icon001.png','2018-04-26 20:52:35',NULL,NULL,0,'0'),(8,'18219111627','ea289daceb77cafc67ab21a64b9c77dd','张万金','张万金','啥地方',0,1,'12','8/eb092c6d-894e-4db3-adfa-b6951b8364f8.jpg','2018-04-26 20:52:55',NULL,NULL,0,'5.0'),(9,'18219111628','ea289daceb77cafc67ab21a64b9c77dd','18219111628','18219111628',NULL,0,1,NULL,'icon001.png','2018-04-26 20:53:14',NULL,NULL,0,'0'),(10,'18219111629','ea289daceb77cafc67ab21a64b9c77dd','18219111629','18219111629',NULL,0,1,NULL,'icon001.png','2018-04-26 20:53:34',NULL,NULL,0,'0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
