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

/*Table structure for table `bigtype` */

DROP TABLE IF EXISTS `bigtype`;

CREATE TABLE `bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL COMMENT '订单大类型的名字',
  `createTime` varchar(30) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `content` varchar(220) NOT NULL COMMENT '内容',
  `time` varchar(35) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

/*Table structure for table `payaccount` */

DROP TABLE IF EXISTS `payaccount`;

CREATE TABLE `payaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(30) DEFAULT NULL COMMENT '更新时间',
  `payphoto` varchar(200) DEFAULT NULL COMMENT '收款码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
