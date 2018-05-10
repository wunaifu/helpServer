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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `acceptorder` */

insert  into `acceptorder`(`id`,`accepterId`,`orderId`,`moneyType`,`money`,`number`,`getType`,`acceptState`,`dateState`,`backReason`,`backTime`,`acceptTime`,`sureTime`,`finishTime`,`updateTime`) values (1,3,1,0,5,1,6,6,1,NULL,'2018-02-05 04:33:35','2018-02-01 04:17:43','2018-02-01 04:19:27','2018-02-05 04:33:10','2018-02-01 04:19:53'),(2,2,2,1,300,1,1,6,1,NULL,'2018-02-23 04:39:49','2018-02-01 04:29:19','2018-02-01 04:30:30','2018-02-23 04:39:34','2018-02-01 04:30:32'),(3,3,2,1,300,1,1,3,1,NULL,NULL,'2018-02-23 04:44:53','2018-02-23 04:45:18',NULL,'2018-02-23 04:45:20');

/*Table structure for table `backdata` */

DROP TABLE IF EXISTS `backdata`;

CREATE TABLE `backdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `allMoney` int(11) DEFAULT NULL COMMENT '总赚取的服务费',
  `allMen` int(11) DEFAULT NULL COMMENT '总注册人数',
  `allOrders` int(11) DEFAULT NULL COMMENT '总租借成交数',
  `year` int(11) DEFAULT NULL COMMENT '统计年份',
  `month` int(11) DEFAULT NULL COMMENT '统计月份',
  `monthMoney` int(11) DEFAULT NULL COMMENT '统计月份赚取的服务费',
  `monthMen` int(11) DEFAULT NULL COMMENT '月注册人数',
  `monthOrders` int(11) DEFAULT NULL COMMENT '月租借成交数',
  `time` varchar(32) DEFAULT NULL COMMENT '统计时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `backdata` */

insert  into `backdata`(`id`,`allMoney`,`allMen`,`allOrders`,`year`,`month`,`monthMoney`,`monthMen`,`monthOrders`,`time`) values (1,0,1,0,2018,1,0,1,0,'2018-01-01 00:00:10'),(2,4,4,2,2018,2,4,3,2,'2018-03-01 04:00:00'),(3,0,0,0,2018,3,0,0,0,'2018-01-01 00:00:10'),(4,0,0,0,2018,4,0,0,0,'2018-05-01 04:00:00'),(5,0,0,0,2018,5,0,0,0,'2018-01-01 00:00:10'),(6,0,0,0,2018,6,0,0,0,'2018-01-01 00:00:10'),(7,0,0,0,2018,7,0,0,0,'2018-01-01 00:00:10'),(8,0,0,0,2018,8,0,0,0,'2018-01-01 00:00:10'),(9,0,0,0,2018,9,0,0,0,'2018-01-01 00:00:10'),(10,0,0,0,2018,10,0,0,0,'2018-01-01 00:00:10'),(11,0,0,0,2018,11,0,0,0,'2018-01-01 00:00:10'),(12,0,0,0,2018,12,0,0,0,'2018-01-01 00:00:10');

/*Table structure for table `bigtype` */

DROP TABLE IF EXISTS `bigtype`;

CREATE TABLE `bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL COMMENT '订单大类型的名字',
  `createTime` varchar(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `bigtype` */

insert  into `bigtype`(`id`,`typeName`,`createTime`) values (1,'住房出行','2018-01-01 00:03:00'),(2,'生活用品','2018-01-01 00:03:16'),(3,'其他物品','2018-01-01 00:03:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `gold` */

insert  into `gold`(`id`,`userId`,`goldAmount`,`time`,`state`,`payAmount`) values (1,1,10,'2017-12-31 08:47:10',0,0),(2,2,11,'2018-01-01 00:00:15',0,0),(3,3,10,'2018-02-01 04:02:10',0,0),(4,4,10,'2018-02-01 04:02:27',0,0),(5,5,10,'2018-02-01 04:02:43',0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `goldhistory` */

insert  into `goldhistory`(`id`,`userId`,`amount`,`info`,`time`,`state`) values (1,1,10,'注册','2017-12-31 08:47:10',1),(2,2,10,'注册','2018-01-01 00:00:15',1),(3,3,10,'注册','2018-02-01 04:02:10',1),(4,4,10,'注册','2018-02-01 04:02:27',1),(5,5,10,'注册','2018-02-01 04:02:43',1),(6,2,1,'每日签到','2018-02-01 04:11:20',1);

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

insert  into `identity`(`id`,`userId`,`name`,`idcard`,`frontPhoto`,`backPhoto`,`askTime`,`checkTime`,`failureReason`,`checkState`) values (1,2,'吴乃福','2342431234143','2/8593d928-dc44-44d9-932e-d81b9251d4b7.png','2/5b5e6865-bc56-49ac-85ac-cdb896a45dcf.png','2018-02-01 04:12:17','2018-02-01 04:14:56','认证通过',1),(2,3,'张四喜','1234123412132','3/1eb59d0c-617d-417a-931b-755d0bd1f96b.png','3/06bc0df3-2b88-40e1-aadc-ebbdf76ed852.png','2018-02-01 04:14:46','2018-02-01 04:14:59','认证通过',1),(3,4,'李大钱','234234234234','4/edeae437-efc1-46b1-a99d-e10f19cba42a.png','4/9c8c01c2-d4bf-4418-95fe-53d0262c2175.png','2018-02-01 04:22:18','2018-02-23 04:42:21','认证通过',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `money` */

insert  into `money`(`id`,`userId`,`amount`,`time`,`payAmount`,`getAmount`) values (1,1,0,'2017-12-31 08:47:10',0,0),(2,2,199,'2018-01-01 00:00:15',500,0),(3,3,680,'2018-02-01 04:02:10',900,0),(4,4,1077,'2018-02-01 04:02:27',800,0),(5,5,0,'2018-02-01 04:02:43',0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `moneyadd` */

insert  into `moneyadd`(`id`,`userId`,`addAmount`,`addTime`,`addPhoto`,`getTime`) values (1,2,500,'2018-02-01 04:07:04','2/4a34eea2-e4ed-451d-a26f-be95d4f2853d.png','2018-02-01 04:07:35'),(2,3,900,'2018-02-01 04:16:56','3/39d0551f-97c0-467c-8205-316951daa695.png','2018-02-01 04:17:09'),(3,4,800,'2018-02-01 04:20:43','4/9edab013-ce80-4df9-a56c-2d307fbf7584.png','2018-02-01 04:24:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `moneyhistory` */

insert  into `moneyhistory`(`id`,`userId`,`amount`,`info`,`time`,`state`) values (1,2,500,'余额充值','2018-02-01 04:07:35',1),(2,2,20,'服务保障金','2018-02-01 04:09:56',0),(3,3,900,'余额充值','2018-02-01 04:17:09',1),(4,3,50,'服务押金','2018-02-01 04:17:43',0),(5,4,800,'余额充值','2018-02-01 04:24:46',1),(6,4,20,'服务保障金','2018-02-01 04:28:25',0),(7,2,200,'服务押金','2018-02-01 04:29:19',0),(8,3,50,'押金归还','2018-02-05 04:33:35',1),(9,3,20,'服务租金','2018-02-05 04:33:35',0),(10,2,20,'服务租金','2018-02-05 04:33:35',1),(11,2,1,'平台使用费用','2018-02-05 04:33:35',0),(12,2,200,'押金归还','2018-02-23 04:39:49',1),(13,2,300,'服务租金','2018-02-23 04:39:49',0),(14,4,300,'服务租金','2018-02-23 04:39:49',1),(15,4,3,'平台使用费用','2018-02-23 04:39:49',0),(16,3,200,'服务押金','2018-02-23 04:44:53',0);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `content` varchar(220) NOT NULL COMMENT '内容',
  `time` varchar(35) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`time`) values (1,'恭喜平台迎来第一位用户','恭喜平台迎来第一位用户','2018-01-01 00:06:47'),(2,'谢谢各位用户的支持','谢谢各位用户的支持','2018-01-01 00:07:20'),(3,'恭喜***用户提现成功','恭喜***用户提现成功','2018-01-01 00:07:50'),(4,'恭喜***租借成功','恭喜***租借成功','2018-01-01 00:08:02'),(5,'恭喜***在平台赚取第一桶金','恭喜***在平台赚取第一桶金','2018-01-01 00:08:24');

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
  CONSTRAINT `ordercomment_ibfk_2` FOREIGN KEY (`myId`) REFERENCES `user` (`userId`),
  CONSTRAINT `ordercomment_ibfk_3` FOREIGN KEY (`hisId`) REFERENCES `user` (`userId`),
  CONSTRAINT `ordercomment_ibfk_4` FOREIGN KEY (`acceptId`) REFERENCES `acceptorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `ordercomment` */

insert  into `ordercomment`(`id`,`acceptId`,`myId`,`hisId`,`score`,`content`,`time`) values (1,1,2,3,5,'好评','2018-02-05 04:34:05'),(2,1,3,2,5,'车很好骑','2018-02-05 04:34:34'),(3,2,4,2,5,'好评','2018-02-23 04:40:38'),(4,2,2,4,5,'好评','2018-02-23 04:40:48');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `orderinfo` */

insert  into `orderinfo`(`id`,`senderId`,`typeId`,`moneyAmount`,`foodName`,`amount`,`outAmount`,`dayMoney`,`monthMoney`,`startTime`,`endTime`,`orderDetail`,`city`,`address`,`pointInfo`,`lng`,`lat`,`sendTime`,`repealTime`,`repealReason`,`orderState`,`callName`,`callPhone`,`seeAmount`,`picture`,`updateTime`,`dayNumber`,`monthNumber`,`infopicture1`,`infopicture2`) values (1,2,3,50,'蓝色山地车',2,0,5,100,NULL,NULL,'蓝色山地车，新车，原价1200，现在不骑，想租出去赚点租金','江门市','江门市蓬江区五邑大学玫瑰园宿舍','江门市蓬江区五邑大学-玫瑰园宿舍','113.092424','22.600614','2018-02-01 04:09:56',NULL,NULL,1,'吴先生','18219111626',0,'2/da362751-cfaf-4a64-9347-830e42e9278b.jpg','2018-02-01 04:18:46',30,6,'2/15fb4119-681b-4986-bcb6-bf2382c44af3.jpg','2/1e9c464a-1d1d-4804-b71e-3f5d4e0a17f5.jpg'),(2,4,1,200,'20平廉价房出租',1,1,0,300,NULL,NULL,'廉价商品房出租，有独立卫生间，采光好','江门市','蓬江区胜利路88号','江门市蓬江区胜利路117号','113.087751','22.587034','2018-02-01 04:28:25',NULL,NULL,1,'李先生','18219111626',0,'4/041fb8d4-40fc-4cfa-bfae-fcacf70223be.jpg',NULL,0,12,'4/78e9aaab-dcf0-42ce-9934-0c3b93fa7573.jpg','4/e0aa8501-ff57-4f74-92ac-25bb58d007dd.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `ordertype` */

insert  into `ordertype`(`id`,`bigtypeId`,`typeName`,`state`,`createTime`) values (1,1,'租房',1,'2018-01-01 00:03:36'),(2,1,'汽车',1,'2018-01-01 00:03:42'),(3,1,'自行车',1,'2018-01-01 00:03:47'),(4,1,'摩托车',1,'2018-01-01 00:03:58'),(5,2,'电视',1,'2018-01-01 00:04:08'),(6,2,'衣服',1,'2018-01-01 00:04:15'),(7,2,'滑板',1,'2018-01-01 00:04:27'),(8,2,'风扇',1,'2018-01-01 00:05:03'),(9,2,'冰箱',1,'2018-01-01 00:05:13'),(10,2,'书本',1,'2018-01-01 00:05:22'),(11,3,'显示屏',1,'2018-01-01 00:06:10'),(12,3,'其他',1,'2018-01-01 00:06:18');

/*Table structure for table `payaccount` */

DROP TABLE IF EXISTS `payaccount`;

CREATE TABLE `payaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(30) DEFAULT NULL COMMENT '更新时间',
  `payphoto` varchar(200) DEFAULT NULL COMMENT '收款码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `payaccount` */

insert  into `payaccount`(`id`,`time`,`payphoto`) values (1,'2017-12-31 23:59:12','9202ca51-bc17-4106-b665-5f06f362df7e.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`phone`,`password`,`name`,`nickname`,`address`,`age`,`sex`,`userInfo`,`headicon`,`registerTime`,`banTime`,`payAccount`,`permission`,`credit`) values (1,'13531097736','ea289daceb77cafc67ab21a64b9c77dd','管理员','管理员',NULL,0,1,NULL,'icon001.png','2017-12-31 08:47:10',NULL,NULL,-1,'0'),(2,'18219111621','ea289daceb77cafc67ab21a64b9c77dd','吴乃福','吴乃福','江门市蓬江区五邑大学玫瑰园宿舍',22,1,'学生','2/9556eec3-b0c8-4e92-a502-3b707ffeb103.png','2018-01-01 00:00:15',NULL,NULL,1,'5.0'),(3,'18219111622','ea289daceb77cafc67ab21a64b9c77dd','18219111622','18219111622',NULL,0,1,NULL,'icon001.png','2018-02-01 04:02:10',NULL,NULL,1,'5.0'),(4,'18219111623','ea289daceb77cafc67ab21a64b9c77dd','李大钱','李大钱','胜利路',23,1,'店家','4/4255d55b-3df4-4d5f-b938-d9f1c7650730.jpg','2018-02-01 04:02:27',NULL,NULL,1,'5.0'),(5,'18219111624','ea289daceb77cafc67ab21a64b9c77dd','18219111624','18219111624',NULL,0,1,NULL,'icon001.png','2018-02-01 04:02:43',NULL,NULL,0,'0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
