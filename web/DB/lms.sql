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

insert  into `books`(`bookid`,`bookname`,`author`) values ('B0001','Software Engineering','Roger S. Pressman'),('B0002','Java Programming','Balaguruswamy');

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

insert  into `booksid`(`copyid`,`bookid`,`status`) values ('B0001001','B0001',0),('B0001002','B0001',0),('B0001003','B0001',0),('B0001004','B0001',0),('B0001005','B0001',0),('B0001006','B0001',0),('B0001007','B0001',0),('B0001008','B0001',0),('B0001009','B0001',0),('B0001010','B0001',0),('B0001011','B0001',0),('B0001012','B0001',0),('B0001013','B0001',0),('B0001014','B0001',0),('B0001015','B0001',0),('B0001016','B0001',0),('B0001017','B0001',0),('B0001018','B0001',0),('B0001019','B0001',0),('B0001020','B0001',0),('B0001021','B0001',0),('B0001022','B0001',0),('B0001023','B0001',0),('B0001024','B0001',0),('B0001025','B0001',0),('B0001026','B0001',0),('B0001027','B0001',0),('B0001028','B0001',0),('B0001029','B0001',0),('B0001030','B0001',0),('B0001031','B0001',0),('B0001032','B0001',0),('B0001033','B0001',0),('B0001034','B0001',0),('B0001035','B0001',0),('B0001036','B0001',0),('B0001037','B0001',0),('B0001038','B0001',0),('B0001039','B0001',0),('B0001040','B0001',0),('B0001041','B0001',0),('B0001042','B0001',0),('B0001043','B0001',0),('B0001044','B0001',0),('B0001045','B0001',0),('B0001046','B0001',0),('B0001047','B0001',0),('B0001048','B0001',0),('B0001049','B0001',0),('B0001050','B0001',0),('B0001051','B0001',0),('B0001052','B0001',0),('B0001053','B0001',0),('B0001054','B0001',0),('B0001055','B0001',0),('B0001056','B0001',0),('B0001057','B0001',0),('B0001058','B0001',0),('B0001059','B0001',0),('B0001060','B0001',0),('B0001061','B0001',0),('B0001062','B0001',0),('B0001063','B0001',0),('B0001064','B0001',0),('B0001065','B0001',0),('B0001066','B0001',0),('B0001067','B0001',0),('B0001068','B0001',0),('B0001069','B0001',0),('B0001070','B0001',0),('B0001071','B0001',0),('B0001072','B0001',0),('B0001073','B0001',0),('B0001074','B0001',0),('B0001075','B0001',0),('B0001076','B0001',0),('B0001077','B0001',0),('B0001078','B0001',0),('B0001079','B0001',0),('B0001080','B0001',0),('B0001081','B0001',0),('B0001082','B0001',0),('B0001083','B0001',0),('B0001084','B0001',0),('B0001085','B0001',0),('B0001086','B0001',0),('B0001087','B0001',0),('B0001088','B0001',0),('B0001089','B0001',0),('B0001090','B0001',0),('B0001091','B0001',0),('B0001092','B0001',0),('B0001093','B0001',0),('B0001094','B0001',0),('B0001095','B0001',0),('B0001096','B0001',0),('B0001097','B0001',0),('B0001098','B0001',0),('B0001099','B0001',0),('B0001100','B0001',0),('B0002001','B0002',0),('B0002002','B0002',0),('B0002003','B0002',0),('B0002004','B0002',0),('B0002005','B0002',0),('B0002006','B0002',0),('B0002007','B0002',0),('B0002008','B0002',0),('B0002009','B0002',0),('B0002010','B0002',0),('B0002011','B0002',0),('B0002012','B0002',0),('B0002013','B0002',0),('B0002014','B0002',0),('B0002015','B0002',0),('B0002016','B0002',0),('B0002017','B0002',0),('B0002018','B0002',0),('B0002019','B0002',0),('B0002020','B0002',0),('B0002021','B0002',0),('B0002022','B0002',0),('B0002023','B0002',0),('B0002024','B0002',0),('B0002025','B0002',0),('B0002026','B0002',0),('B0002027','B0002',0),('B0002028','B0002',0),('B0002029','B0002',0),('B0002030','B0002',0),('B0002031','B0002',0),('B0002032','B0002',0),('B0002033','B0002',0),('B0002034','B0002',0),('B0002035','B0002',0),('B0002036','B0002',0),('B0002037','B0002',0),('B0002038','B0002',0),('B0002039','B0002',0),('B0002040','B0002',0),('B0002041','B0002',0),('B0002042','B0002',0),('B0002043','B0002',0),('B0002044','B0002',0),('B0002045','B0002',0),('B0002046','B0002',0),('B0002047','B0002',0),('B0002048','B0002',0),('B0002049','B0002',0),('B0002050','B0002',0),('B0002051','B0002',0),('B0002052','B0002',0),('B0002053','B0002',0),('B0002054','B0002',0),('B0002055','B0002',0),('B0002056','B0002',0),('B0002057','B0002',0),('B0002058','B0002',0),('B0002059','B0002',0),('B0002060','B0002',0),('B0002061','B0002',0),('B0002062','B0002',0),('B0002063','B0002',0),('B0002064','B0002',0),('B0002065','B0002',0),('B0002066','B0002',0),('B0002067','B0002',0),('B0002068','B0002',0),('B0002069','B0002',0),('B0002070','B0002',0),('B0002071','B0002',0),('B0002072','B0002',0),('B0002073','B0002',0),('B0002074','B0002',0),('B0002075','B0002',0),('B0002076','B0002',0),('B0002077','B0002',0),('B0002078','B0002',0),('B0002079','B0002',0),('B0002080','B0002',0),('B0002081','B0002',0),('B0002082','B0002',0),('B0002083','B0002',0),('B0002084','B0002',0),('B0002085','B0002',0),('B0002086','B0002',0),('B0002087','B0002',0),('B0002088','B0002',0),('B0002089','B0002',0),('B0002090','B0002',0),('B0002091','B0002',0),('B0002092','B0002',0),('B0002093','B0002',0),('B0002094','B0002',0),('B0002095','B0002',0),('B0002096','B0002',0),('B0002097','B0002',0),('B0002098','B0002',0),('B0002099','B0002',0),('B0002100','B0002',0);

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

insert  into `candidate`(`cid`,`cname`,`ctype`,`deptid`) values ('S01','Anand Patel','Student','D01\n'),('T01','Akshat Soni','Teacher','D01\n');

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

insert  into `fine`(`tid`,`ownerid`,`fine_amount`,`paid`) values (4,'S01',100,1),(1,'T01',160,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `issue` */

insert  into `issue`(`tid`,`bookid`,`ownerid`,`issue_date`,`return_date`,`returned_status`) values (1,'B0002001','T01','2019-03-01','2019-03-24',1),(2,'B0001001','T01','2019-03-24','2019-03-24',1),(3,'B0001002','S01','2019-03-24','2019-03-24',1),(4,'B0002002','S01','2019-03-07','2019-03-24',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`cid`,`username`,`password`) values (1,'T01','akshat','akshat642'),(2,'S01','anand','anand214');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
