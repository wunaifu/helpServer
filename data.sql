/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.51 : Database - helpserver
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
  `acceptState` int(11) NOT NULL DEFAULT '1' COMMENT '状态（0取消，1抢单中，2已确认待获取资源，3已获取资源租用中，4已完成，5待付款，6待评价，-1发布方拒绝）',
  `dateState` int(11) DEFAULT '1' COMMENT '租用状态（1正常，0超期，2',
  `backReason` varchar(50) DEFAULT NULL COMMENT '退单理由',
  `backTime` varchar(32) DEFAULT NULL COMMENT '退单时间0，-1，5',
  `acceptTime` varchar(32) DEFAULT NULL COMMENT '抢单时间1',
  `sureTime` varchar(32) DEFAULT NULL COMMENT '确认订单时间2',
  `finishTime` varchar(32) DEFAULT NULL COMMENT '订单完成时间4',
  `updateTime` varchar(32) DEFAULT NULL COMMENT '开始计费时间3',
  PRIMARY KEY (`id`),
  KEY `accepterId` (`accepterId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `acceptorder_ibfk_1` FOREIGN KEY (`accepterId`) REFERENCES `user` (`userId`),
  CONSTRAINT `acceptorder_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orderinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acceptorder` */

/*Table structure for table `bigtype` */

DROP TABLE IF EXISTS `bigtype`;

CREATE TABLE `bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL COMMENT '订单大类型的名字',
  `createTime` varchar(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `bigtype` */

insert  into `bigtype`(`id`,`typeName`,`createTime`) values (1,'住房出行','2018-05-03 22:56:16'),(2,'生活用品','2018-05-03 22:56:34'),(3,'其他','2018-05-03 22:56:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `gold` */

insert  into `gold`(`id`,`userId`,`goldAmount`,`time`,`state`,`payAmount`) values (1,1,10,'2018-05-03 22:54:22',0,0),(2,2,10,'2018-05-03 23:04:19',0,0),(3,3,10,'2018-05-03 23:04:36',0,0),(4,4,10,'2018-05-03 23:05:00',0,0),(5,5,10,'2018-05-03 23:05:25',0,0),(6,6,10,'2018-05-03 23:07:09',0,0),(7,7,10,'2018-05-03 23:07:36',0,0),(8,8,10,'2018-05-03 23:07:54',0,0),(9,9,10,'2018-05-03 23:08:08',0,0),(10,10,10,'2018-05-03 23:08:22',0,0),(11,11,10,'2018-05-03 23:08:37',0,0),(12,12,10,'2018-05-03 23:09:01',0,0),(13,13,10,'2018-05-03 23:09:15',0,0),(14,14,10,'2018-05-03 23:09:38',0,0),(15,15,10,'2018-05-03 23:09:53',0,0),(16,16,10,'2018-05-03 23:10:28',0,0),(17,17,10,'2018-05-03 23:10:44',0,0),(18,18,10,'2018-05-03 23:11:03',0,0),(19,19,10,'2018-05-03 23:11:18',0,0),(20,20,10,'2018-05-03 23:11:33',0,0),(21,21,10,'2018-05-03 23:11:52',0,0),(22,22,10,'2018-05-03 23:12:06',0,0),(23,23,10,'2018-05-03 23:12:30',0,0),(24,24,10,'2018-05-03 23:12:44',0,0),(25,25,10,'2018-05-03 23:12:57',0,0),(26,26,10,'2018-05-03 23:13:14',0,0),(27,27,10,'2018-05-03 23:13:29',0,0),(28,28,10,'2018-05-03 23:13:48',0,0),(29,29,10,'2018-05-03 23:14:01',0,0),(30,30,10,'2018-05-03 23:14:14',0,0),(31,31,10,'2018-05-03 23:14:29',0,0),(32,32,10,'2018-05-03 23:14:47',0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `goldhistory` */

insert  into `goldhistory`(`id`,`userId`,`amount`,`info`,`time`,`state`) values (1,1,10,'注册','2018-05-03 22:54:22',1),(2,2,10,'注册','2018-05-03 23:04:19',1),(3,3,10,'注册','2018-05-03 23:04:36',1),(4,4,10,'注册','2018-05-03 23:05:00',1),(5,5,10,'注册','2018-05-03 23:05:25',1),(6,6,10,'注册','2018-05-03 23:07:09',1),(7,7,10,'注册','2018-05-03 23:07:36',1),(8,8,10,'注册','2018-05-03 23:07:54',1),(9,9,10,'注册','2018-05-03 23:08:08',1),(10,10,10,'注册','2018-05-03 23:08:22',1),(11,11,10,'注册','2018-05-03 23:08:37',1),(12,12,10,'注册','2018-05-03 23:09:01',1),(13,13,10,'注册','2018-05-03 23:09:15',1),(14,14,10,'注册','2018-05-03 23:09:38',1),(15,15,10,'注册','2018-05-03 23:09:53',1),(16,16,10,'注册','2018-05-03 23:10:28',1),(17,17,10,'注册','2018-05-03 23:10:44',1),(18,18,10,'注册','2018-05-03 23:11:03',1),(19,19,10,'注册','2018-05-03 23:11:18',1),(20,20,10,'注册','2018-05-03 23:11:33',1),(21,21,10,'注册','2018-05-03 23:11:52',1),(22,22,10,'注册','2018-05-03 23:12:06',1),(23,23,10,'注册','2018-05-03 23:12:30',1),(24,24,10,'注册','2018-05-03 23:12:44',1),(25,25,10,'注册','2018-05-03 23:12:57',1),(26,26,10,'注册','2018-05-03 23:13:14',1),(27,27,10,'注册','2018-05-03 23:13:29',1),(28,28,10,'注册','2018-05-03 23:13:48',1),(29,29,10,'注册','2018-05-03 23:14:01',1),(30,30,10,'注册','2018-05-03 23:14:14',1),(31,31,10,'注册','2018-05-03 23:14:29',1),(32,32,10,'注册','2018-05-03 23:14:47',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `money` */

insert  into `money`(`id`,`userId`,`amount`,`time`,`payAmount`,`getAmount`) values (1,1,0,'2018-05-03 22:54:22',0,0),(2,2,0,'2018-05-03 23:04:19',0,0),(3,3,0,'2018-05-03 23:04:36',0,0),(4,4,0,'2018-05-03 23:05:00',0,0),(5,5,0,'2018-05-03 23:05:25',0,0),(6,6,0,'2018-05-03 23:07:09',0,0),(7,7,0,'2018-05-03 23:07:36',0,0),(8,8,0,'2018-05-03 23:07:54',0,0),(9,9,0,'2018-05-03 23:08:08',0,0),(10,10,0,'2018-05-03 23:08:22',0,0),(11,11,0,'2018-05-03 23:08:37',0,0),(12,12,0,'2018-05-03 23:09:01',0,0),(13,13,0,'2018-05-03 23:09:15',0,0),(14,14,0,'2018-05-03 23:09:38',0,0),(15,15,0,'2018-05-03 23:09:53',0,0),(16,16,0,'2018-05-03 23:10:28',0,0),(17,17,0,'2018-05-03 23:10:44',0,0),(18,18,0,'2018-05-03 23:11:03',0,0),(19,19,0,'2018-05-03 23:11:18',0,0),(20,20,0,'2018-05-03 23:11:33',0,0),(21,21,0,'2018-05-03 23:11:52',0,0),(22,22,0,'2018-05-03 23:12:06',0,0),(23,23,0,'2018-05-03 23:12:30',0,0),(24,24,0,'2018-05-03 23:12:44',0,0),(25,25,0,'2018-05-03 23:12:57',0,0),(26,26,0,'2018-05-03 23:13:14',0,0),(27,27,0,'2018-05-03 23:13:29',0,0),(28,28,0,'2018-05-03 23:13:48',0,0),(29,29,0,'2018-05-03 23:14:01',0,0),(30,30,0,'2018-05-03 23:14:14',0,0),(31,31,0,'2018-05-03 23:14:29',0,0),(32,32,0,'2018-05-03 23:14:47',0,0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `moneyadd` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `moneyhistory` */

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
  `acceptId` int(11) NOT NULL COMMENT '抢单表',
  `myId` int(11) NOT NULL COMMENT '评论者id',
  `hisId` int(11) NOT NULL COMMENT '被评论者id',
  `score` int(11) DEFAULT NULL COMMENT '评分（1-5）',
  `content` varchar(80) DEFAULT NULL COMMENT '评论',
  `time` varchar(32) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `myId` (`myId`),
  KEY `hisId` (`hisId`),
  KEY `acceptId` (`acceptId`),
  CONSTRAINT `ordercomment_ibfk_4` FOREIGN KEY (`acceptId`) REFERENCES `acceptorder` (`id`),
  CONSTRAINT `ordercomment_ibfk_2` FOREIGN KEY (`myId`) REFERENCES `user` (`userId`),
  CONSTRAINT `ordercomment_ibfk_3` FOREIGN KEY (`hisId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ordercomment` */

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
  `updateTime` varchar(32) DEFAULT NULL COMMENT '下架时间、禁用时间',
  `dayNumber` int(11) DEFAULT '0' COMMENT '可租用天数',
  `monthNumber` int(11) DEFAULT '0' COMMENT '可租用月数',
  `infopicture1` varchar(150) DEFAULT NULL COMMENT '详情图片1',
  `infopicture2` varchar(150) DEFAULT NULL COMMENT '详情图片2',
  PRIMARY KEY (`id`),
  KEY `senderId` (`senderId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `orderinfo_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `user` (`userId`),
  CONSTRAINT `orderinfo_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `ordertype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderinfo` */

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `ordertype` */

insert  into `ordertype`(`id`,`bigtypeId`,`typeName`,`state`,`createTime`) values (1,1,'租房',1,'2018-05-03 22:56:56'),(2,1,'汽车',1,'2018-05-03 22:57:04'),(3,1,'摩托车',1,'2018-05-03 22:57:12'),(4,1,'自行车',1,'2018-05-03 22:57:23'),(5,1,'滑板',1,'2018-05-03 22:57:50'),(6,2,'电视',1,'2018-05-03 22:58:12'),(7,2,'电饭煲',1,'2018-05-03 22:58:23'),(8,2,'冰箱',1,'2018-05-03 22:58:30'),(9,2,'沙发',1,'2018-05-03 22:58:39'),(10,2,'书本',1,'2018-05-03 22:58:52'),(11,2,'服装',1,'2018-05-03 22:59:49'),(12,3,'杂物',1,'2018-05-03 23:00:37'),(13,3,'其他',1,'2018-05-03 23:00:44');

/*Table structure for table `payaccount` */

DROP TABLE IF EXISTS `payaccount`;

CREATE TABLE `payaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(30) DEFAULT NULL COMMENT '更新时间',
  `payphoto` varchar(200) DEFAULT NULL COMMENT '收款码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `payaccount` */

insert  into `payaccount`(`id`,`time`,`payphoto`) values (1,'2018-01-01 12:10:10','da2c8b73-8136-4577-85f9-8c154ec1490a.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`phone`,`password`,`name`,`nickname`,`address`,`age`,`sex`,`userInfo`,`headicon`,`registerTime`,`banTime`,`payAccount`,`permission`,`credit`) values (1,'13531097736','ea289daceb77cafc67ab21a64b9c77dd','管理员','管理员',NULL,30,1,NULL,'icon001.png','2018-05-03 22:54:22',NULL,NULL,-1,'0'),(2,'18219111621','ea289daceb77cafc67ab21a64b9c77dd','李志强','李志强',NULL,20,1,NULL,'icon001.png','2018-05-03 23:04:19',NULL,NULL,0,'0'),(3,'18219111622','ea289daceb77cafc67ab21a64b9c77dd','张青','张青',NULL,22,0,NULL,'icon001.png','2018-05-03 23:04:36',NULL,NULL,0,'0'),(4,'18219111623','ea289daceb77cafc67ab21a64b9c77dd','吴用','吴用',NULL,18,1,NULL,'icon001.png','2018-05-03 23:05:00',NULL,NULL,0,'0'),(5,'18219111624','ea289daceb77cafc67ab21a64b9c77dd','罗振勇','罗振勇',NULL,24,1,NULL,'icon001.png','2018-05-03 23:05:25',NULL,NULL,0,'0'),(6,'18219111625','ea289daceb77cafc67ab21a64b9c77dd','荀志生','荀志生',NULL,19,1,NULL,'icon001.png','2018-05-03 23:07:09',NULL,NULL,0,'0'),(7,'18219111626','ea289daceb77cafc67ab21a64b9c77dd','司马超群','司马超群',NULL,25,1,NULL,'icon001.png','2018-05-03 23:07:36',NULL,NULL,0,'0'),(8,'18219111627','ea289daceb77cafc67ab21a64b9c77dd','李金江','李金江',NULL,45,1,NULL,'icon001.png','2018-05-03 23:07:54',NULL,NULL,0,'0'),(9,'18219111628','ea289daceb77cafc67ab21a64b9c77dd','陈晓佳','陈晓佳',NULL,12,1,NULL,'icon001.png','2018-05-03 23:08:08',NULL,NULL,0,'0'),(10,'18219111629','ea289daceb77cafc67ab21a64b9c77dd','蔡栋梁','蔡栋梁',NULL,55,1,NULL,'icon001.png','2018-05-03 23:08:22',NULL,NULL,0,'0'),(11,'18219111630','ea289daceb77cafc67ab21a64b9c77dd','梁佳亮','梁佳亮',NULL,32,1,NULL,'icon001.png','2018-05-03 23:08:37',NULL,NULL,0,'0'),(12,'18219111631','ea289daceb77cafc67ab21a64b9c77dd','罗嘉良','罗嘉良',NULL,12,1,NULL,'icon001.png','2018-05-03 23:09:01',NULL,NULL,0,'0'),(13,'18219111632','ea289daceb77cafc67ab21a64b9c77dd','张家辉','张家辉',NULL,31,1,NULL,'icon001.png','2018-05-03 23:09:15',NULL,NULL,0,'0'),(14,'18219111633','ea289daceb77cafc67ab21a64b9c77dd','林志聪','林志聪',NULL,30,1,NULL,'icon001.png','2018-05-03 23:09:38',NULL,NULL,0,'0'),(15,'18219111634','ea289daceb77cafc67ab21a64b9c77dd','曾松','曾松',NULL,25,1,NULL,'icon001.png','2018-05-03 23:09:53',NULL,NULL,0,'0'),(16,'18219111635','ea289daceb77cafc67ab21a64b9c77dd','何佳琪','何佳琪',NULL,20,0,NULL,'icon001.png','2018-05-03 23:10:28',NULL,NULL,0,'0'),(17,'18219111636','ea289daceb77cafc67ab21a64b9c77dd','李强','李强',NULL,24,1,NULL,'icon001.png','2018-05-03 23:10:44',NULL,NULL,0,'0'),(18,'18219111637','ea289daceb77cafc67ab21a64b9c77dd','张益达','张益达',NULL,28,1,NULL,'icon001.png','2018-05-03 23:11:03',NULL,NULL,0,'0'),(19,'18219111638','ea289daceb77cafc67ab21a64b9c77dd','司徒阳','司徒阳',NULL,52,1,NULL,'icon001.png','2018-05-03 23:11:18',NULL,NULL,0,'0'),(20,'18219111639','ea289daceb77cafc67ab21a64b9c77dd','令狐佳','令狐佳',NULL,29,0,NULL,'icon001.png','2018-05-03 23:11:33',NULL,NULL,0,'0'),(21,'18219111640','ea289daceb77cafc67ab21a64b9c77dd','罗佳佳','罗佳佳',NULL,31,0,NULL,'icon001.png','2018-05-03 23:11:52',NULL,NULL,0,'0'),(22,'18219111641','ea289daceb77cafc67ab21a64b9c77dd','张格吉','张格吉',NULL,46,1,NULL,'icon001.png','2018-05-03 23:12:06',NULL,NULL,0,'0'),(23,'18219111642','ea289daceb77cafc67ab21a64b9c77dd','18219111642','18219111642',NULL,37,1,NULL,'icon001.png','2018-05-03 23:12:30',NULL,NULL,0,'0'),(24,'18219111643','ea289daceb77cafc67ab21a64b9c77dd','18219111643','18219111643',NULL,36,1,NULL,'icon001.png','2018-05-03 23:12:44',NULL,NULL,0,'0'),(25,'18219111644','ea289daceb77cafc67ab21a64b9c77dd','18219111644','18219111644',NULL,31,1,NULL,'icon001.png','2018-05-03 23:12:57',NULL,NULL,0,'0'),(26,'18219111645','ea289daceb77cafc67ab21a64b9c77dd','18219111645','18219111645',NULL,27,1,NULL,'icon001.png','2018-05-03 23:13:14',NULL,NULL,0,'0'),(27,'18219111646','ea289daceb77cafc67ab21a64b9c77dd','18219111646','18219111646',NULL,23,1,NULL,'icon001.png','2018-05-03 23:13:29',NULL,NULL,0,'0'),(28,'18219111647','ea289daceb77cafc67ab21a64b9c77dd','18219111647','18219111647',NULL,22,1,NULL,'icon001.png','2018-05-03 23:13:48',NULL,NULL,0,'0'),(29,'18219111648','ea289daceb77cafc67ab21a64b9c77dd','18219111648','18219111648',NULL,22,1,NULL,'icon001.png','2018-05-03 23:14:01',NULL,NULL,0,'0'),(30,'18219111649','ea289daceb77cafc67ab21a64b9c77dd','18219111649','18219111649',NULL,22,1,NULL,'icon001.png','2018-05-03 23:14:14',NULL,NULL,0,'0'),(31,'18219111620','ea289daceb77cafc67ab21a64b9c77dd','18219111620','18219111620',NULL,22,1,NULL,'icon001.png','2018-05-03 23:14:29',NULL,NULL,0,'0'),(32,'18219111650','ea289daceb77cafc67ab21a64b9c77dd','18219111650','18219111650',NULL,22,1,NULL,'icon001.png','2018-05-03 23:14:47',NULL,NULL,0,'0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
