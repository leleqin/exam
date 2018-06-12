/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - test
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_username` varchar(12) NOT NULL,
  `user_password` varchar(12) NOT NULL,
  `user_nickname` varchar(25) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_username`,`user_password`,`user_nickname`) values (1,'admin','admin','杨攒劲'),(2,'test1','test1','张三'),(3,'test2','test1','test1'),(4,'test3','test1','test1'),(5,'test4','test1','test1'),(6,'test5','test1','test1'),(7,'test6','test1','test1'),(8,'test7','test1','test1'),(9,'test8','test1','test1'),(10,'test9','test1','test1'),(11,'test10','test1','test1'),(12,'test11','test1','test1'),(13,'test12','test1','test1'),(14,'test13','test1','test1'),(15,'test14','test1','test1'),(16,'test15','test1','test1'),(17,'test16','test1','test1'),(18,'test17','test1','test1'),(19,'test18','test1','test1'),(20,'test19','test1','test1'),(21,'test20','test1','test1'),(22,'test21','test1','test1'),(23,'test22','test1','test1'),(24,'test23','test1','test1'),(25,'test24','test1','test1'),(26,'test25','test1','test1'),(27,'test26','test1','test1'),(28,'test27','test1','test1'),(29,'test28','test1','test1'),(30,'test29','test1','test1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
