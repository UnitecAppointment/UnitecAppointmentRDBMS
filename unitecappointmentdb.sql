CREATE DATABASE  IF NOT EXISTS `unitecappointmentdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `unitecappointmentdb`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: unitecappointmentdb
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `date` varchar(50) NOT NULL,
  `start` varchar(50) NOT NULL,
  `end` varchar(50) NOT NULL,
  `lecturerusername` varchar(100) NOT NULL,
  `studentusername` varchar(100) DEFAULT NULL,
  `isActive` varchar(10) NOT NULL,
  PRIMARY KEY (`start`,`end`,`lecturerusername`,`date`),
  KEY `studentFK_idx` (`studentusername`),
  KEY `lecturerFK_idx` (`lecturerusername`),
  CONSTRAINT `lecturerFK1` FOREIGN KEY (`lecturerusername`) REFERENCES `lecturer` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `studentFK1` FOREIGN KEY (`studentusername`) REFERENCES `student` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES ('2016-10-20','10:00','10:20','bahman ',NULL,'available');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department` varchar(50) NOT NULL,
  PRIMARY KEY (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecturer` (
  `username` varchar(100) NOT NULL,
  `title` varchar(45) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `password` varchar(24) NOT NULL,
  `salt` varchar(24) NOT NULL,
  `department` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES ('bahman','Mr.','Bahman','Sarrafpour','HFBtxKIudUuiYjZd8j8Hxw==','DBrzy1ANbFtIA4OFzq5Epg==','Computer Science','e-9p@hotmail.com'),('mark','Dr.','Mark','McNeil','COA8GE6VlxUHiVor8JYBrA==','FBR1RhlXfqHayEaK/R+CJg==','Computer Science','e-9p@hotmail.com');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `username` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `password` varchar(24) NOT NULL,
  `salt` varchar(24) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('amal','Amelia','Mcneil','HxAt3y+V3BbOFGZoEUnTUA==','ZUc8wfZiMmYf6dbbgRT55w==','e-9p@hotmail.com'),('nawaf','Nawaf','Altuwayjiri','DvAJmOVXSY0uwE1KIvRTqw==','g1+6K8PbP47GlDO2S8br3g==','e-9p@hotmail.com'),('osh','Oshada','Koralage','TDpwmgX20ZydRo3r4MLRTQ==','WzOXJktbn/QxU2JN2qCk5Q==','e-9p@hotmail.com'),('zezo','Marzouq','Almarzooq','VNdTKuubW/vZH6E36EM9Vw==','lxcs1/6QcpM4LJV6Syoc0g==','e-9p@hotmail.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentlecturerassignment`
--

DROP TABLE IF EXISTS `studentlecturerassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentlecturerassignment` (
  `lecturerusername` varchar(100) NOT NULL,
  `studentusername` varchar(100) NOT NULL,
  `subject` varchar(45) NOT NULL,
  PRIMARY KEY (`lecturerusername`,`studentusername`,`subject`),
  KEY `studentfk_idx` (`studentusername`),
  CONSTRAINT `lecturerfk` FOREIGN KEY (`lecturerusername`) REFERENCES `lecturer` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `studentfk` FOREIGN KEY (`studentusername`) REFERENCES `student` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentlecturerassignment`
--

LOCK TABLES `studentlecturerassignment` WRITE;
/*!40000 ALTER TABLE `studentlecturerassignment` DISABLE KEYS */;
INSERT INTO `studentlecturerassignment` VALUES ('bahman','amal','Cyber Security'),('bahman','amal','Hardware Technologies'),('mark','amal','Programming Fundementals'),('bahman','nawaf','Hardware Technologies'),('bahman','osh','Hardware Technologies'),('mark','osh','Programming Fundementals');
/*!40000 ALTER TABLE `studentlecturerassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subject` varchar(45) NOT NULL,
  `department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-23 16:24:48
