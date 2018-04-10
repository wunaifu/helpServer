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
  `acceptorderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '接单表id',
  `accepterId` int(11) DEFAULT NULL COMMENT '接单者id',
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `acceptTime` varchar(32) DEFAULT NULL COMMENT '接单时间',
  `backReason` varchar(50) DEFAULT NULL COMMENT '退单理由',
  `backTime` varchar(32) DEFAULT NULL COMMENT '退单时间（为空未取消，不空接单中）',
  `acceptState` int(11) NOT NULL DEFAULT '1' COMMENT '状态（1接单，0取消，2已完成，3发布方取消）',
  PRIMARY KEY (`acceptorderId`),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `bigtype` */

insert  into `bigtype`(`id`,`typeName`,`createTime`) values (1,'其他','2018-03-20 16:36:08'),(2,'家教','2018-03-20 16:40:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `gold` */

insert  into `gold`(`id`,`userId`,`goldAmount`,`time`,`state`,`payAmount`) values (1,1,15,'2018-02-09 20:16:43',0,0),(2,2,40,'2018-02-09 20:23:42',1,10),(3,3,25,'2018-02-10 10:15:31',0,10),(4,4,10,'2018-02-10 10:44:04',0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `goldadd` */

insert  into `goldadd`(`id`,`userId`,`addAmount`,`addTime`,`addPhoto`,`getTime`) values (1,2,1,'2018-02-10 13:08:35','2/91137b8e-054c-4a15-b292-efbd42837956.png','2018-02-10 15:46:48'),(2,3,1,'2018-02-10 13:28:35','3/720de5f2-f53c-4988-9f7d-852629f0c399.png','2018-02-10 15:54:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `goldhistory` */

insert  into `goldhistory`(`id`,`userId`,`amount`,`info`,`time`,`state`) values (1,1,10,'注册','2018-02-09 20:16:43',1),(2,2,10,'注册','2018-02-09 20:23:42',1),(3,2,5,'每日签到','2018-02-10 09:22:24',1),(4,1,5,'每日签到','2018-02-10 09:30:57',1),(5,2,5,'每日签到','2018-02-10 10:00:02',1),(6,2,5,'每日签到','2018-02-10 10:10:07',1),(7,3,10,'注册','2018-02-10 10:15:31',1),(8,3,5,'每日签到','2018-02-10 10:15:38',1),(9,4,10,'注册','2018-02-10 10:44:04',1),(10,2,10,'金币充值','2018-02-10 15:46:48',1),(11,3,10,'金币充值','2018-02-10 15:54:24',1),(12,2,1,'每日签到','2018-02-11 09:26:23',1);

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

insert  into `identity`(`id`,`userId`,`name`,`idcard`,`frontPhoto`,`backPhoto`,`askTime`,`checkTime`,`failureReason`,`checkState`) values (1,2,'白云飞','440881194101011815','2/b474c350-5876-4fef-834f-b5f2c2071c32.png','2/f0a0da97-b504-4391-a954-ff43d3278196.png','2018-02-09 20:27:21','2018-02-09 20:30:43','认证通过',1),(2,3,'张青','23414452314551122','3/373870b8-684a-4396-a75e-86fdd263ca53.png','3/ff4b9636-660d-4775-8d14-38f6259f7430.png','2018-02-10 10:40:26',NULL,'请求认证',0),(3,4,'李伟青','45541452134623','4/22d4dcca-a8ca-4ba8-ba1f-6dc387c1b261.png','4/625bc18b-09bb-4261-a6b4-bcd6cca54a11.png','2018-02-10 10:47:48','2018-02-10 16:45:46','认证通过',1);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `content` varchar(220) NOT NULL COMMENT '内容',
  `time` varchar(35) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`time`) values (8,'淀粉','专题摘要2018年全国两会“部长通道”于3月3日下午全国政协十三届一次会议开幕会结束后正式开启。今年的“部长通道”得到了国务院各部门积极响应，将有数十位部门负责人在这里与大家见面。','2018-03-06 21:41:58'),(9,'单调函数','专题摘要2018年全国两会“部长通道”于3月3日下午全国政协十三届一次会议开幕会结束后正式开启。今年的“部长通道”得到了国务院各部门积极响应，将有数十位部门负责人在这里与大家见面。','2018-03-06 21:42:01'),(10,'大沙河','专题摘要2018年全国两会“部长通道”于3月3日下午全国政协十三届一次会议开幕会结束后正式开启。今年的“部长通道”得到了国务院各部门积极响应，将有数十位部门负责人在这里与大家见面。','2018-03-06 21:42:04'),(11,'稍等哈','专题摘要2018年全国两会“部长通道”于3月3日下午全国政协十三届一次会议开幕会结束后正式开启。今年的“部长通道”得到了国务院各部门积极响应，将有数十位部门负责人在这里与大家见面。','2018-03-06 21:42:08'),(12,'服务平啊打发打发多少哈哈沙发等发达','阿阿萨德哈哈哈是的哈是的发送到发送到发的发生的发生','2018-03-07 09:45:09'),(13,'还有个房间号房间风格和规范化和规','钙是广告应该我一个古怪哪个好尴尬和规划局规划','2018-03-07 09:50:32');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `senderId` int(11) NOT NULL COMMENT '发布者id',
  `typeId` int(11) NOT NULL COMMENT '发布类型id（零活、跑腿）',
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `commission` int(11) DEFAULT '0' COMMENT '佣金',
  `menAccount` int(11) DEFAULT '1' COMMENT '需求人数',
  `detailTime` varchar(32) DEFAULT NULL COMMENT '服务具体时间',
  `expendTime` varchar(32) DEFAULT NULL COMMENT '预计耗时',
  `serverInfo` varchar(150) DEFAULT NULL COMMENT '服务详情',
  `area` varchar(80) DEFAULT NULL COMMENT '所在区域（省市县）',
  `startPoint` varchar(80) DEFAULT NULL COMMENT '起点（街道）',
  `endPoint` varchar(80) DEFAULT NULL COMMENT '终点（街道）',
  `sendTime` varchar(32) DEFAULT NULL COMMENT '发布时间',
  `endTime` varchar(32) DEFAULT NULL COMMENT '抢单结束时间',
  `repealTime` varchar(32) DEFAULT NULL COMMENT '撤单时间',
  `repealReason` varchar(50) DEFAULT NULL COMMENT '撤单原因',
  `orderState` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态（0草稿、1抢单进行中、2服务进行中、3已结束、4已取消、-1管理员禁止该订单',
  `callName` varchar(15) DEFAULT NULL COMMENT '联系人',
  `callPhone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `seeAmount` int(11) DEFAULT NULL COMMENT '浏览数',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `ordertype` */

insert  into `ordertype`(`id`,`bigtypeId`,`typeName`,`state`,`createTime`) values (1,1,'其他',1,'2018-03-20 16:36:33'),(2,1,'IT',1,'2018-03-20 16:37:38'),(3,2,'语文',1,'2018-03-20 16:40:38'),(4,2,'数学',1,'2018-03-20 16:40:45'),(5,2,'英语',1,'2018-03-20 16:40:50');

/*Table structure for table `payaccount` */

DROP TABLE IF EXISTS `payaccount`;

CREATE TABLE `payaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(30) DEFAULT NULL COMMENT '更新时间',
  `payphoto` varchar(200) DEFAULT NULL COMMENT '收款码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `payaccount` */

insert  into `payaccount`(`id`,`time`,`payphoto`) values (1,'2018-02-09 20:26:10','816e5ec9-bd84-4b11-b545-027f2ed4df14.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`phone`,`password`,`name`,`nickname`,`address`,`age`,`sex`,`userInfo`,`headicon`,`registerTime`,`banTime`,`payAccount`,`permission`) values (1,'13531097736','ea289daceb77cafc67ab21a64b9c77dd','管理员','管理员',NULL,0,1,NULL,'icon001.png','2018-02-09 20:16:43',NULL,NULL,-1),(2,'18219111621','ea289daceb77cafc67ab21a64b9c77dd','18219111621','18219111621','浙江',22,1,'我是一个摄影师','2/10068bf8-a264-4ef9-849b-82ccd6992aaf.jpg','2018-02-09 20:23:42',NULL,NULL,1),(3,'18219111622','ea289daceb77cafc67ab21a64b9c77dd','18219111622','18219111622',NULL,0,1,NULL,'icon001.png','2018-02-10 10:15:31',NULL,NULL,0),(4,'18219111623','ea289daceb77cafc67ab21a64b9c77dd','18219111623','18219111623',NULL,0,1,NULL,'icon001.png','2018-02-10 10:44:04',NULL,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
