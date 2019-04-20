/*
SQLyog Community v11.52 (32 bit)
MySQL - 10.1.29-MariaDB : Database - libmgmt
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`libmgmt` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `libmgmt`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookid` varchar(5) NOT NULL,
  `bookname` varchar(100) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `books` */

/*Table structure for table `booksid` */

DROP TABLE IF EXISTS `booksid`;

CREATE TABLE `booksid` (
  `copyid` varchar(8) NOT NULL,
  `bookid` varchar(5) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`copyid`),
  KEY `bookid` (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `booksid` */

/*Table structure for table `candidate` */

DROP TABLE IF EXISTS `candidate`;

CREATE TABLE `candidate` (
  `cid` varchar(4) NOT NULL,
  `cname` varchar(30) NOT NULL,
  `ctype` varchar(7) NOT NULL,
  `deptid` varchar(4) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `candidate` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `candidate` */

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `deptid` varchar(4) NOT NULL,
  `dname` varchar(30) NOT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `department` */

insert  into `department`(`deptid`,`dname`) values ('D01','COMPUTER SCIENCE & ENGINEERING'),('D02','INFORMATION TECHNOLOGY'),('D03','CIVIL'),('D04','MECHANICAL'),('D05','AUTOMOBILE'),('D06','ELECTRICAL');

/*Table structure for table `fine` */

DROP TABLE IF EXISTS `fine`;

CREATE TABLE `fine` (
  `tid` int(4) NOT NULL,
  `ownerid` varchar(4) NOT NULL,
  `fine_amount` int(10) DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  KEY `transaction` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fine` */

/*Table structure for table `issue` */

DROP TABLE IF EXISTS `issue`;

CREATE TABLE `issue` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` varchar(8) NOT NULL,
  `ownerid` varchar(4) NOT NULL,
  `issue_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `returned_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `owner` (`ownerid`),
  KEY `booksid` (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `issue` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` varchar(4) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
