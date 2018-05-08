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

insert  into `backdata`(`id`,`allMoney`,`allMen`,`allOrders`,`year`,`month`,`monthMoney`,`monthMen`,`monthOrders`,`time`) values (1,1,1,1,2018,1,1,1,1,NULL),(2,2,2,2,2018,2,2,2,2,NULL),(3,3,3,3,2018,3,3,3,3,NULL),(4,4,4,4,2018,4,4,4,4,NULL),(5,5,5,5,2018,5,5,5,5,NULL),(6,6,6,6,2018,6,6,6,6,NULL),(7,7,7,7,2018,7,7,7,7,NULL),(8,8,8,8,2018,8,8,8,8,NULL),(9,9,9,9,2018,9,9,9,9,NULL),(10,10,10,10,2018,10,10,10,10,NULL),(11,11,11,11,2018,11,11,11,11,NULL),(12,12,12,12,2018,12,12,12,12,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
