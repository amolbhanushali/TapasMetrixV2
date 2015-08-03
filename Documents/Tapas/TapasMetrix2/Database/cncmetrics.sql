-- MySQL dump 10.13  Distrib 5.6.11, for Win64 (x86_64)
--
-- Host: localhost    Database: cncmetrics
-- ------------------------------------------------------
-- Server version	5.6.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



create database SLM;
use SLM;
--
-- Table structure for table `mst_activity_tbl`
--

DROP TABLE IF EXISTS `mst_activity_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_activity_tbl` (
  `activityId` varchar(30) NOT NULL,
  `activityName` varchar(50) DEFAULT NULL,
  `activityDesc` varchar(200) DEFAULT NULL,
  `parentActivity` varchar(30) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_activity_tbl`
--

LOCK TABLES `mst_activity_tbl` WRITE;
/*!40000 ALTER TABLE `mst_activity_tbl` DISABLE KEYS */;
INSERT INTO `mst_activity_tbl` VALUES ('1','CDF Creation','CDF created by the user in C&C team','0',1),('2','DMS Investigated','DMS Investigated by the user in C&C team','0',1),('3','Reporting','reporting and Doc','0',1),('4','Sanity Test','Sanity Test','0',1),('5','Kitting','Kitting','0',1),('6','Onsite Support','Onsite Support','0',1),('7','Training -C&C','Training -C&C','0',1),('8','DMS Development - C&C','CDF created by the user in C&C team','2',1),('9','DMS Change request','DMS Investigated by the user in C&C team','2',1),('10','DMS issues','DMS Investigated by the user in C&C team','2',1),('11','C&C Line Reporting','reporting and Doc','3',1),('12','Project Reporting','reporting and Doc','3',1),('13','TAPAS Reporting','reporting and Doc','3',1),('14','Content handling','Content Integration, Testing','0',1),('15','DMS Investigation - MIB','DMS Investigation - MIB','0',1),('16','MTBF Analysis','MTBF Analysis','0',1),('17','Crash Analysis','Crash Analysis','0',1),('18','RCA Analysis','RCA Analysis','0',1),('19','Tool Development','Tool Development','0',1),('20','Server setup - Offshore','Server setup - Offshore','0',1),('21','Activity Review -MIB','Activity Review -MIB','0',1),('22','Training -MIB','Training -MIB','0',1),('23','FOTA Creation','FOTA Creation','0',1),('24','FOTA Release','FOTA Release','0',1),('25','EMMA','EMMA','0',1),('26','Source','Source','0',1),('27','SPACE','SPACE','0',1),('28','S1 Signing','S1 Signing','0',1),('29','PP Configuration','PP Configuration','0',1),('30','Training - SRM','Training - SRM','0',1),('31','Activity Review -SRM','Activity Review -SRM','0',1),('32','SW Release','SW Release','0',1),('33','Tools Securing','Tools Securing','0',1),('34','Tools verification','Tools verification','33',1),('35','Tools configuration','Tools configuration','33',1),('36','SEVV','Verification of security parameter of SW & HW','0',1),('37','Milestone report','Milestone report','0',1),('38','GLA Checking','GLA Checking','0',1),('39','Tool Development - SWRTL','Tool Development - SWRTL','0',1),('40','GMS & Google Application cordination','GMS & Google Application cordination','0',1);
/*!40000 ALTER TABLE `mst_activity_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_product_tbl`
--

DROP TABLE IF EXISTS `mst_product_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_product_tbl` (
  `productId` varchar(30) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productDesc` varchar(200) DEFAULT NULL,
  `productPlatform` varchar(30) DEFAULT NULL,
  `releasePhase` varchar(20) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_product_tbl`
--

LOCK TABLES `mst_product_tbl` WRITE;
/*!40000 ALTER TABLE `mst_product_tbl` DISABLE KEYS */;
INSERT INTO `mst_product_tbl` VALUES ('1','Hayabusa','This is a Hayabusa Product on Blue platform','Blue3.1','MR',1),('2','Nozomi','This is a Nozomi Product on Fuji platform','Fuji','MR',1),('3','Nozomi2','This is a Nozomi2 Product on Fuji platform','Fuji','MR',1),('4','Hikari Row','This is a Hikari Row Product on Fuji platform','Fuji','MR',1),('5','Honami','This is a Honami Product on Rhine platform','Rhine','RTL',1),('6','Togari','This is a Togari Product on Rhine platform','Rhine','RTL',1),('7','Line Project','This is a Project for Line Project','Line Project','RTL',1),('8','TAPAS Project','This is a Project for TAPAS Project','TAPAS Project','RTL',1),('9','Sirius',NULL,NULL,NULL,NULL),('10','Castor',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mst_product_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_role_tbl`
--

DROP TABLE IF EXISTS `mst_role_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_role_tbl` (
  `roleId` varchar(30) NOT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(200) DEFAULT NULL,
  `teamId` varchar(30) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_role_tbl`
--

LOCK TABLES `mst_role_tbl` WRITE;
/*!40000 ALTER TABLE `mst_role_tbl` DISABLE KEYS */;
INSERT INTO `mst_role_tbl` VALUES ('1','Customization Engineer','Customization Engineer','1',1),('2','Customization Cordinator','Customization Cordinator','1',1),('3','Content Engineer','Content Engineer','1',1),('4','FTL - MIB','FTL - MIB','2',1),('5','Member - MIB','Member - MIB','2',1),('6','FTL - SRM','FTL - SRM','3',1),('7','Member - SRM','Member - SRM','3',1),('8','FTL - SWRTL','FTL - SWRTL','4',1),('9','Member - SWRTL','Member - SWRTL','4',1);
/*!40000 ALTER TABLE `mst_role_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_team_tbl`
--

DROP TABLE IF EXISTS `mst_team_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_team_tbl` (
  `teamId` int(11) NOT NULL AUTO_INCREMENT,
  `teamName` varchar(30) DEFAULT NULL,
  `teamDesc` varchar(30) DEFAULT NULL,
  `workLocation` varchar(30) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`teamId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_team_tbl`
--

LOCK TABLES `mst_team_tbl` WRITE;
/*!40000 ALTER TABLE `mst_team_tbl` DISABLE KEYS */;
INSERT INTO `mst_team_tbl` VALUES (1,'C&C','Content and Customization','offshore',1),(2,'MIB','Issue Handling ','offshore',1),(3,'SRM','Software Release Management','offshore',1),(4,'SW RTL','Software Launch & Planning','offshore',1),(5,'Manager','Management Team','offshore',1);
/*!40000 ALTER TABLE `mst_team_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_user_tbl`
--

DROP TABLE IF EXISTS `mst_user_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mst_user_tbl` (
  `userId` varchar(30) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `userRole` varchar(20) DEFAULT NULL,
  `LTEmail` varchar(50) DEFAULT NULL,
  `SonyEmail` varchar(50) DEFAULT NULL,
  `userWorkLocation` varchar(30) DEFAULT NULL,
  `teamId` varchar(30) DEFAULT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_user_tbl`
--

LOCK TABLES `mst_user_tbl` WRITE;
/*!40000 ALTER TABLE `mst_user_tbl` DISABLE KEYS */;
INSERT INTO `mst_user_tbl` VALUES ('user001','285085','pass123','admin','Harinarayan.Soni@lntinfotech.com','Harinarayan.X.Soni@sonymobile.com','offshore','1','HariNarayan','Soni',1),('user002','287308','pass123','user','sandip.ranjan@lntinfotech.com','Ranjan.X.sandip@sonymobile.com','offshore','1','Sandip','Ranjan',1),('user003','10603876','pass123','user','Amol.Bhanushali@lntinfotech.com','Bhanushali.X.Amol@sonymobile.com','offshore','1','Amol','Bhanushali',1),('user004','288774','pass123','admin','Tanu.Rawal@lntinfotech.com','Rawal.X.Tanu@Sonymobile.com','offshore','1','Tanu','Rawal',1),('user005','296589','pass123','user','hemant.gawande@lntinfotech.com','Gawande.X.Hemant@Sonymobile.com','offshore','1','Hemant','Gawande',1),('user006','290102','pass123','user','Bhuvaneswari.Veeravalli@lntinfotech.com','Veeravalli.X.Bhuvaneswari@Sonymobile.com','offshore','1','Bhuvaneswari','Veeravalli',1),('user007','10602683','pass123','user','Aravind.Babu@lntinfotech.com','Babu.X.Aravind@Sonymobile.com','offshore','2','Aravind','Babu',1),('user008','288181','pass123','admin','SudhirKumarRao.Arrabelly@lntinfotech.com','SudhirKumarRao.X.Arrabelly@sonymobile.com','offshore','2','Sudhir','Arrabelly',1),('user009','295259','pass123','user','','','offshore','2','Balaji ','Allanki',1),('user010','asokan123','pass123','user','','','offshore','2','Asokan','Chamala Balaraj',1),('user011','292240','pass123','user','','','offshore','2','Sivaprasad','Gude',1),('user012','292891','pass123','user','','','offshore','2','Gurudatta','Karmi',1),('user013','289144','pass123','user','','','offshore','2','Manoj Kumar','Mora',1),('user014','10603275','pass123','user','','','offshore','2','Parth','Morjaria',1),('user015','19603104','pass123','user','','','offshore','2','Dhamodharan','Nallasivam',1),('user016','295931','pass123','user','','','offshore','2','Athif','Pasha',1),('user017','292185','pass123','user','','','offshore','2','Vijay','viswanathan',1),('user018','289042','pass123','user','Anshul.Arora@lntinfotech.com','Arora.X.Anshul@Sonymobile.com','offshore','3','Anshul','Arora',1),('user019','10604358','pass123','admin','biplab.kundu@lntinfotech.com','Kundu.X.Biplab@Sonymobile.com','offshore','3','Biplab','Kundu',1),('user020','294617','pass123','user','Dileepkumar.injarapu@lntinfotech.com','Dileep.X.Injarapu@sonymobile.com','offshore','3','Dileepkumar','Injarapu',1),('user021','295439','pass123','user','PAVAN.SWARANKAR@LNTINFOTECH.COM','Pavan.X.Swarankar@sonymobile.com','offshore','3','PAVAN','SWARANKAR',1),('user022','10603314','pass123','user','Raju.kolati@lntinfotech.com','Raju.X.Kotati@sonymobile.com','offshore','3','Raju','Kolati',1),('user023','297365','pass123','user','Antonymary.Vincent@lntinfotech.com','Vincent.X.Antony@sonymobile.com','offshore','3','Antony Mary','Vincent',1),('user024','289059','pass123','user','Amala.Remigius@lntinfotech.com','Amala.x.Renigius@sonymobile.com','offshore','3','Amala','Remigius',1),('user025','297678','pass123','user','Niraj.Dhiraj@lntinfotech.com','Nirajkumar.x.Dhiraj@sonymobile.com','offshore','3','Nirajkumar','Dhiraj',1),('user026','297365','pass123','user','Antonymary.Vincent@lntinfotech.com','Vincent.X.Antony@sonymobile.com','offshore','3','Antony Mary','Vincent',1),('user027','289059','pass123','user','Amala.Remigius@lntinfotech.com','Amala.x.Renigius@sonymobile.com','offshore','3','Amala','Remigius',1),('user028','297678','pass123','user','Niraj.Dhiraj@lntinfotech.com','Nirajkumar.x.Dhiraj@sonymobile.com','offshore','3','Nirajkumar','Dhiraj',1),('user029','290995','pass123','user','sahana.koteshwar@lntinfotech.com','Koteshwar.X.Sahana@Sonymobile.com','offshore','4','Sahana','Koteshwar',1),('user030','289344','pass123','user','sujay.chakraborthy@lntinfotech.com','Chakraborthy.X.Sujay@Sonymobile.com','offshore','4','Sujay','Chakraborthy',1),('user031','716628','pass123','admin','V.Srikanth2@lntinfotech.com','Venkatesh.X.srikanth@Sonymobile.com','offshore','4','Srikanth','Venkatesh',1),('user032','289337','pass123','user','Shantharam.Someswaran@lntinfotech.com','Shantharam.X.Someswaran@sonymobile.com','offshore','4','Shantharam','Someswaran',1),('user033','10604600','pass123','user','Kaanchan.Rajagopalan@lntinfotech.com','Kaanchan.X.Rajagopalan@sonymobile.com','offshore','4','Kaanchan','Rajagopalan',1),('user034','290758','pass123','user','Rajyalakshami.puli@lntinfotech.com','puli.X.Rajyalakshami@sonymobile.com','offshore','1','Rajya Lakshami','Puli',1),('user035','286642','pass123','SuperUser','Jayakumar.Perambalam@lntinfotech.com','Jayakumar.X.Perambalam@sonymobile.com','offshore','5','Jayakumar','Perambalam',1),('user036','10607438','pass123','user','Saravana.KR@lntinfotech.com','Saravanakumar.X.Ramalingam@sonymobile.com','offshore','1','Saravanakumar','Ramalingam',1),('user037','10608265','pass123','user','Yuvaraj.Vijayakumar@lntinfotech.com','Yuvaraj.X.VijayKumar@sonymobile.com','offshore','1','Yuvaraj','Vijay',1),('user038','10608269','pass123','user','suresh.manoharan@lntinfotech.com','Suresh.X.Manoharan@sonymobile.com','offshore','1','Suresh','Manoharan',1),('user039','298679','pass123','user','prasanth.kankanala@lntinfotech.com','kankanala.X.prasanth@sonymobile.com','offshore','1','Prasanth','Kankanala',1),('user040','10603443','pass123','user','sanjeev.desai@lntinfotech.com','sanjeev.X.desai@sonymobile.com','offshore','1','Sanjeev','Desai',1);
/*!40000 ALTER TABLE `mst_user_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_incident_log_tbl`
--

DROP TABLE IF EXISTS `tbl_incident_log_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_incident_log_tbl` (
  `trnId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(30) DEFAULT NULL,
  `teamId` varchar(30) DEFAULT NULL,
  `productId` varchar(30) DEFAULT NULL,
  `activityId` varchar(30) DEFAULT NULL,
  `activityCount` int(11) DEFAULT NULL,
  `reviewerComment` varchar(250) DEFAULT NULL,
  `errorCount` int(11) DEFAULT NULL,
  `activityMonth` varchar(15) DEFAULT NULL,
  `reveiweruserId` varchar(30) DEFAULT NULL,
  `reveiwer_teamId` varchar(30) DEFAULT NULL,
  `trnActivityDate` datetime DEFAULT NULL,
  PRIMARY KEY (`trnId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_incident_log_tbl`
--

LOCK TABLES `tbl_incident_log_tbl` WRITE;
/*!40000 ALTER TABLE `tbl_incident_log_tbl` DISABLE KEYS */;
INSERT INTO `tbl_incident_log_tbl` VALUES (1,'user002','C&C','6','10',11,'Test 12 march',3,'March','user004','C&C','2014-03-12 10:25:10'),(2,'user002','C&C','3','1',5,'Demo TEsttt',2,'March','user004','C&C','2014-03-12 10:30:07'),(3,'user003','C&C','2','10',4,'Testttt',1,'March','user004','C&C','2014-03-12 11:51:49'),(4,'user002','C&C','1','1',44,'rerererer Test',5,'March','user004','C&C','2014-03-12 15:40:31'),(5,'user002','C&C','2','12',33,'Testttt',5,'March','user004','C&C','2014-03-12 16:21:59'),(6,'user003','C&C','10','4',5,'Test Purpose',1,'March','user004','C&C','2014-03-12 16:30:35'),(7,'user002','C&C','6','4',7,'testtttt',1,'March','user004','C&C','2014-03-12 17:44:45');
/*!40000 ALTER TABLE `tbl_incident_log_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_slm_incident`
--

DROP TABLE IF EXISTS `tbl_slm_incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_slm_incident` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `project` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `activityCount` int(11) DEFAULT NULL,
  `activityDate` date DEFAULT NULL,
  `errorCount` int(11) DEFAULT NULL,
  `reviewDate` date DEFAULT NULL,
  `reviewComment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_slm_incident`
--

LOCK TABLES `tbl_slm_incident` WRITE;
/*!40000 ALTER TABLE `tbl_slm_incident` DISABLE KEYS */;
INSERT INTO `tbl_slm_incident` VALUES (16,'Sandip','Togari ','CDF ',32,'2014-03-15',1,'2014-03-17','Sandip123'),(17,'Sandip','Sirius','FOTA',21,'2014-03-16',5,'2014-03-17','abcddd'),(18,'Sandip','Castor','CDF ',28,'2014-03-20',9,'2014-03-17','aqqqqqq'),(19,'Biplab','Sirius','FOTA',54,'2014-03-18',1,'2014-03-17','FOTA 1'),(20,'Priya','Amami','CDF ',1,'2014-03-17',5,'2014-03-18','test'),(21,'Sandip','Amami','FOTA',98,'2014-03-20',6,'2014-03-21','cccc test');
/*!40000 ALTER TABLE `tbl_slm_incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `ProductName` varchar(50) DEFAULT NULL,
  `May` double DEFAULT NULL,
  `June` double DEFAULT NULL,
  `April` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
INSERT INTO `temp` VALUES ('Hayabusa',7,5,0),('Nozomi',5,0,0);
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trn_roleactivity_tbl`
--

DROP TABLE IF EXISTS `trn_roleactivity_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trn_roleactivity_tbl` (
  `trnRoleActivityId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(30) DEFAULT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `activityId` varchar(30) DEFAULT NULL,
  `activityName` varchar(50) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`trnRoleActivityId`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trn_roleactivity_tbl`
--

LOCK TABLES `trn_roleactivity_tbl` WRITE;
/*!40000 ALTER TABLE `trn_roleactivity_tbl` DISABLE KEYS */;
INSERT INTO `trn_roleactivity_tbl` VALUES (1,'2','Customization Engineer','1','CDF Creation',1),(2,'2','Customization Engineer','8','DMS Development - C&C',1),(3,'2','Customization Engineer','9','DMS Change request',1),(4,'2','Customization Engineer','10','DMS issues',1),(5,'2','Customization Engineer','11','C&C Line Reporting',1),(6,'2','Customization Engineer','12','Project Reporting',1),(7,'2','Customization Engineer','13','TAPAS Reporting',1),(8,'2','Customization Engineer','4','Sanity Test',1),(9,'2','Customization Engineer','5','Kitting',1),(10,'2','Customization Engineer','6','Onsite Support',1),(11,'2','Customization Engineer','7','Training -C&C',1),(12,'1','Customization Cordinator','1','CDF Creation',1),(13,'1','Customization Cordinator','8','DMS Development - C&C',1),(14,'1','Customization Cordinator','9','DMS Change request',1),(15,'1','Customization Cordinator','10','DMS issues',1),(16,'1','Customization Cordinator','11','C&C Line Reporting',1),(17,'1','Customization Cordinator','12','Project Reporting',1),(18,'1','Customization Cordinator','13','TAPAS Reporting',1),(19,'1','Customization Cordinator','4','Sanity Test',1),(20,'1','Customization Cordinator','5','Kitting',1),(21,'1','Customization Cordinator','6','Onsite Support',1),(22,'1','Customization Cordinator','7','Training -C&C',1),(23,'1','Customization Cordinator','12','Project Reporting',1),(24,'3','Content Engineer','14','Content handling',1),(25,'4','FTL - MIB','15','DMS Investigation - MIB',1),(26,'4','FTL - MIB','16','MTBF Analysis',1),(27,'4','FTL - MIB','17','Crash Analysis',1),(28,'4','FTL - MIB','18','RCA Analysis',1),(29,'4','FTL - MIB','19','Tool Development',1),(30,'4','FTL - MIB','20','Server setup - Offshore',1),(31,'4','FTL - MIB','21','Activity Review -MIB',1),(32,'4','FTL - MIB','22','Training -MIB',1),(33,'5','Member - MIB','15','DMS Investigation - MIB',1),(34,'5','Member - MIB','16','MTBF Analysis',1),(35,'5','Member - MIB','17','Crash Analysis',1),(36,'5','Member - MIB','18','RCA Analysis',1),(37,'5','Member - MIB','19','Tool Development',1),(38,'5','Member - MIB','20','Server setup - Offshore',1),(39,'5','Member - MIB','22','Training -MIB',1),(40,'6','FTL - SRM','23','FOTA Creation',1),(41,'6','FTL - SRM','24','FOTA Release',1),(42,'6','FTL - SRM','25','EMMA',1),(43,'6','FTL - SRM','26','Source',1),(44,'6','FTL - SRM','27','SPACE',1),(45,'6','FTL - SRM','28','S1 Signing',1),(46,'6','FTL - SRM','29','PP Configuration',1),(47,'6','FTL - SRM','30','Training - SRM',1),(48,'6','FTL - SRM','31','Activity Review -SRM',1),(49,'7','Member - SRM','23','FOTA Creation',1),(50,'7','Member - SRM','24','FOTA Release',1),(51,'7','Member - SRM','25','EMMA',1),(52,'7','Member - SRM','26','Source',1),(53,'7','Member - SRM','27','SPACE',1),(54,'7','Member - SRM','28','S1 Signing',1),(55,'7','Member - SRM','29','PP Configuration',1),(56,'7','Member - SRM','30','Training - SRM',1),(57,'8','FTL - SWRTL','32','SW Release',1),(58,'8','FTL - SWRTL','34','Tools verification',1),(59,'8','FTL - SWRTL','35','Tools configuration',1),(60,'8','FTL - SWRTL','36','SEVV',1),(61,'8','FTL - SWRTL','37','Milestone report',1),(62,'9','Member - SWRTL','32','SW Release',1),(63,'9','Member - SWRTL','34','Tools verification',1),(64,'9','Member - SWRTL','35','Tools configuration',1),(65,'9','Member - SWRTL','36','SEVV',1),(66,'9','Member - SWRTL','37','Milestone report',1),(67,'10','GMS Co-ordinator','38','GLA Checking',1),(68,'10','GMS Co-ordinator','39','Tool Development - SWRTL',1),(69,'10','GMS Co-ordinator','40','GMS & Google Application cordination',1);
/*!40000 ALTER TABLE `trn_roleactivity_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trn_slmincident_tbl`
--

DROP TABLE IF EXISTS `trn_slmincident_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trn_slmincident_tbl` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) DEFAULT NULL,
  `project` varchar(30) DEFAULT NULL,
  `activity` varchar(30) DEFAULT NULL,
  `activityCount` int(11) DEFAULT NULL,
  `activityDate` date DEFAULT NULL,
  `loggedUser` varchar(30) DEFAULT NULL,
  `errorCount` int(11) DEFAULT NULL,
  `reviewDate` date DEFAULT NULL,
  `reviewComment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trn_slmincident_tbl`
--

LOCK TABLES `trn_slmincident_tbl` WRITE;
/*!40000 ALTER TABLE `trn_slmincident_tbl` DISABLE KEYS */;
INSERT INTO `trn_slmincident_tbl` VALUES (1,'Sandip','Honami ','CDF ',43,'2014-03-24',NULL,3,'2014-03-25','test 123'),(2,'Suresh','Amami','FOTA',43,'2014-03-18',NULL,22,'2014-03-18','wwwwwwwwwwwwwww'),(3,'Suresh','Sirius','FOTA',43,'2014-03-25',NULL,21,'2014-03-26','abcd'),(4,'Suresh','Honami ','REPORT',444,'2014-03-25','Sandip',7,'2014-03-26','abxcd'),(5,'Biplab','Honami ','FOTA',21,'2014-03-24','Tanu',4,'2014-03-26','aaaaaaaaaaaaa'),(6,'Biplab','Amami','DMS ',87,'2014-03-21','Sandip',7,'2014-03-26','TEST ONE TWO THREE'),(7,'Priya','Amami','CDF ',2,'2014-03-26','Sandip',0,'2014-03-26','cdf created'),(8,'Priya','Pollux','DMS ',10,'2014-03-17','Sandip',1,'2014-03-26','analyzed'),(9,'Biplab','Honami ','FOTA',56,'2014-03-18','Sandip',11,'2014-03-26','rrrrrrrr');
/*!40000 ALTER TABLE `trn_slmincident_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trn_useractivity_tbl`
--

DROP TABLE IF EXISTS `trn_useractivity_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trn_useractivity_tbl` (
  `trnId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` varchar(30) DEFAULT NULL,
  `activityId` varchar(30) DEFAULT NULL,
  `userId` varchar(30) DEFAULT NULL,
  `teamId` varchar(30) DEFAULT NULL,
  `roleId` varchar(30) DEFAULT NULL,
  `activityCount` int(11) DEFAULT NULL,
  `activityMonth` varchar(15) DEFAULT NULL,
  `userComment` varchar(250) DEFAULT NULL,
  `trnActivityDate` datetime DEFAULT NULL,
  PRIMARY KEY (`trnId`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trn_useractivity_tbl`
--

LOCK TABLES `trn_useractivity_tbl` WRITE;
/*!40000 ALTER TABLE `trn_useractivity_tbl` DISABLE KEYS */;
INSERT INTO `trn_useractivity_tbl` VALUES (559,'5','1','user039','1','user',1,'October','cdf creation','2013-10-28 14:42:54'),(560,'5','4','user039','1','user',4,'October','CDF sanity test','2013-10-28 14:43:16'),(561,'5','5','user036','1','user',10,'October','1276-1960\r\n1276-7203\r\n1276-1975 \r\n1276-1976\r\n1276-1978\r\n\r\n\r\n1276-8141\r\n1276-8142\r\n1276-8144\r\n1279-1471\r\n1279-1472\r\n','2013-10-28 14:54:45'),(562,'6','5','user002','1','user',2,'October','Two MTN ZA Kitting done.','2013-10-29 10:18:29'),(563,'6','10','user002','1','user',2,'October','Follow up two DMS01853392 and DMS02674083 and Investigated.','2013-10-29 10:19:26'),(564,'6','5','user002','1','user',3,'October','Three Sales Items of Customized TW merged.','2013-10-29 12:19:59'),(565,'6','1','user004','1','admin',2,'October','customized sa','2013-10-29 15:12:49'),(566,'6','4','user004','1','admin',2,'October','2 sanity ','2013-10-29 15:13:05'),(567,'6','1','user002','1','user',4,'March','Demo for Test','2014-03-10 11:13:22');
/*!40000 ALTER TABLE `trn_useractivity_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trn_userrole_tbl`
--

DROP TABLE IF EXISTS `trn_userrole_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trn_userrole_tbl` (
  `trnUserRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(30) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `roleId` varchar(30) DEFAULT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`trnUserRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trn_userrole_tbl`
--

LOCK TABLES `trn_userrole_tbl` WRITE;
/*!40000 ALTER TABLE `trn_userrole_tbl` DISABLE KEYS */;
INSERT INTO `trn_userrole_tbl` VALUES (1,'user001','285085','1','Customization',1),(2,'user001','285085','2','Customization',1),(3,'user001','285085','3','Content',1),(4,'user002','287308','2','Customization',1),(5,'user002','287308','3','Content',1),(6,'user003','10603876','2','Customization',1),(7,'user003','10603876','3','Content',1),(8,'user004','288774','2','Customization',1),(9,'user004','288774','3','Content',1),(10,'user005','296589','1','Customization',1),(11,'user005','296589','2','Customization',1),(12,'user005','296589','3','Content',1),(13,'user006','290102','2','Customization',1),(14,'user006','290102','3','Content',1),(15,'user007','10602683','5','Member - MIB',1),(16,'user008','288181','4','FTL - MIB',1),(17,'user009','295259','5','Member - MIB',1),(18,'user010','asokan123','5','Member - MIB',1),(19,'user011','292240','5','Member - MIB',1),(20,'user012','292891','5','Member - MIB',1),(21,'user013','289144','5','Member - MIB',1),(22,'user014','10603275','5','Member - MIB',1),(23,'user015','19603275','5','Member - MIB',1),(24,'user016','295931','5','Member - MIB',1),(25,'user017','292185','5','Member - MIB',1),(26,'user018','289042','7','Member - SRM',1),(27,'user019','10604358','6','FTL – SRM',1),(28,'user020','294617','7','Member - SRM',1),(29,'user021','295439','7','Member - SRM',1),(30,'user022','10603314','7','Member - SRM',1),(31,'user023','297365','7','Member - SRM',1),(32,'user024','289059','7','Member - SRM',1),(33,'user025','297678','7','Member - SRM',1),(34,'user026','297365','7','Member - SRM',1),(35,'user027','289059','7','Member - SRM',1),(36,'user028','297678','7','Member - SRM',1),(37,'user029','290995','9','Member - SWRTL',1),(38,'user030','289344','9','Member - SWRTL',1),(39,'user031','716628','8','FTL – SWRTL',1),(40,'user032','289337','9','Member - SWRTL',1),(41,'user033','10604600','9','Member - SWRTL',1),(42,'user030','289344','10','GMS Co-ordinator',1),(43,'user034','290758','2','Customization',1),(44,'user036','10607438','2','Customization',1),(45,'user037','10608265','2','Customization',1),(46,'user038','10608269','2','Customization',1),(47,'user039','298679','2','Customization',1),(48,'user040','10603443','2','Customization',1);
/*!40000 ALTER TABLE `trn_userrole_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-27 15:05:47
