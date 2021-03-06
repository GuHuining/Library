-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library
-- ------------------------------------------------------
-- Server version	5.7.31-log

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

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `administratorID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`administratorID`),
  UNIQUE KEY `Administrator_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'huining','gu20000927'),(2,'Test','asdfasdf');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `cardNO` varchar(10) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `Borrower_username_uindex` (`username`),
  UNIQUE KEY `Borrower_cardNO_uindex` (`cardNO`),
  CONSTRAINT `Borrower_card_cardNO_fk` FOREIGN KEY (`cardNO`) REFERENCES `card` (`cardNO`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='借阅者';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES (1,'284133','testuser','testuser'),(3,'284134','huining','123123'),(19,NULL,'huining12138','123123'),(21,NULL,'testtest','123123');
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowertype`
--

DROP TABLE IF EXISTS `borrowertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowertype` (
  `borrowerType` varchar(10) NOT NULL,
  `period` int(11) NOT NULL,
  `maxBorrowNumber` int(11) NOT NULL,
  PRIMARY KEY (`borrowerType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowertype`
--

LOCK TABLES `borrowertype` WRITE;
/*!40000 ALTER TABLE `borrowertype` DISABLE KEYS */;
INSERT INTO `borrowertype` VALUES ('本科生',14,5),('研究生',21,7);
/*!40000 ALTER TABLE `borrowertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowitem`
--

DROP TABLE IF EXISTS `borrowitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowitem` (
  `borrowItemID` int(11) NOT NULL AUTO_INCREMENT,
  `cardNO` varchar(10) NOT NULL,
  `publicationID` int(11) NOT NULL,
  `borrowDate` datetime NOT NULL,
  `dueDate` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`borrowItemID`),
  KEY `BorrowItem_card_cardNO_fk` (`cardNO`),
  KEY `BorrowItem_publication_publicationID_fk` (`publicationID`),
  CONSTRAINT `BorrowItem_card_cardNO_fk` FOREIGN KEY (`cardNO`) REFERENCES `card` (`cardNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BorrowItem_publication_publicationID_fk` FOREIGN KEY (`publicationID`) REFERENCES `publication` (`publicationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowitem`
--

LOCK TABLES `borrowitem` WRITE;
/*!40000 ALTER TABLE `borrowitem` DISABLE KEYS */;
INSERT INTO `borrowitem` VALUES (20,'284133',1,'2020-12-16 21:35:40',NULL,0),(21,'284133',1,'2020-12-16 21:35:41',NULL,0),(27,'284133',1,'2020-12-16 21:58:37',NULL,0),(28,'284133',1,'2020-12-17 16:13:48',NULL,0),(29,'284133',1,'2020-12-23 22:46:52',NULL,0);
/*!40000 ALTER TABLE `borrowitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `cardNO` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `major` varchar(10) NOT NULL,
  `borrowerType` varchar(10) NOT NULL,
  `currentBorrowNumber` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cardNO`),
  KEY `card_borrowertype_borrowerType_fk` (`borrowerType`),
  CONSTRAINT `card_borrowertype_borrowerType_fk` FOREIGN KEY (`borrowerType`) REFERENCES `borrowertype` (`borrowerType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='借阅证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES ('284133','张三','软件工程','本科生',5),('284134','李四','土木工程','研究生',0);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarian` (
  `librarianID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`librarianID`),
  UNIQUE KEY `Librarian_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='图书管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES (1,'huining','123456');
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lostitem`
--

DROP TABLE IF EXISTS `lostitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lostitem` (
  `lostItemID` int(11) NOT NULL AUTO_INCREMENT,
  `cardNO` varchar(10) NOT NULL,
  `borrowItemID` int(11) NOT NULL,
  `lostDate` datetime NOT NULL,
  PRIMARY KEY (`lostItemID`),
  KEY `lostitem_borrowitem_borrowItemID_fk` (`borrowItemID`),
  KEY `lostitem_card_cardNO_fk` (`cardNO`),
  CONSTRAINT `lostitem_borrowitem_borrowItemID_fk` FOREIGN KEY (`borrowItemID`) REFERENCES `borrowitem` (`borrowItemID`),
  CONSTRAINT `lostitem_card_cardNO_fk` FOREIGN KEY (`cardNO`) REFERENCES `card` (`cardNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lostitem`
--

LOCK TABLES `lostitem` WRITE;
/*!40000 ALTER TABLE `lostitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lostitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `orderItemID` int(11) NOT NULL AUTO_INCREMENT,
  `publicationID` int(11) NOT NULL,
  `cardNO` varchar(10) NOT NULL,
  `orderDate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderItemID`),
  KEY `orderitem_card_cardNO_fk` (`cardNO`),
  KEY `orderitem_publication_publicationID_fk` (`publicationID`),
  CONSTRAINT `orderitem_card_cardNO_fk` FOREIGN KEY (`cardNO`) REFERENCES `card` (`cardNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_publication_publicationID_fk` FOREIGN KEY (`publicationID`) REFERENCES `publication` (`publicationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,'284133','2020-12-20 22:42:58',0),(4,3,'284134','2020-12-24 17:03:37',0);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication` (
  `publicationID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `inventory` int(11) NOT NULL DEFAULT '0',
  `publicationType` varchar(10) NOT NULL,
  `author` varchar(64) NOT NULL,
  PRIMARY KEY (`publicationID`),
  KEY `publication_publicationtype_publicationType_fk` (`publicationType`),
  CONSTRAINT `publication_publicationtype_publicationType_fk` FOREIGN KEY (`publicationType`) REFERENCES `publicationtype` (`publicationType`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES (1,'C Primer Plus','978-7-115-13022-8',35,20,15,'图书','Stephen Prata'),(3,'三体','9877548345467',44,14,14,'图书','刘慈欣');
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicationtype`
--

DROP TABLE IF EXISTS `publicationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicationtype` (
  `publicationType` varchar(10) NOT NULL,
  `fine` int(11) NOT NULL,
  PRIMARY KEY (`publicationType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicationtype`
--

LOCK TABLES `publicationtype` WRITE;
/*!40000 ALTER TABLE `publicationtype` DISABLE KEYS */;
INSERT INTO `publicationtype` VALUES ('图书',15),('杂志',10);
/*!40000 ALTER TABLE `publicationtype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-26 14:27:02
