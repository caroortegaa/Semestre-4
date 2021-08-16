CREATE DATABASE  IF NOT EXISTS `normalization` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `normalization`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: normalization
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `studentId` int DEFAULT NULL,
  `studentName` varchar(20) DEFAULT NULL,
  `feesPaid` int DEFAULT NULL,
  `courseName` varchar(45) DEFAULT NULL,
  `class1` varchar(45) DEFAULT NULL,
  `class2` varchar(45) DEFAULT NULL,
  `class3` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'John Smith',200,'Economics','Economics 1','Biology 1',NULL),(2,'Maria Griffin',500,'Computer Science','Biology 1','Business Intro','Programming 2'),(3,'Susan Johnson',400,'Medicine','Biology 2',NULL,NULL),(4,'Matt Long',850,'Dentistry',NULL,NULL,NULL);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_2`
--

DROP TABLE IF EXISTS `classes_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_2` (
  `studentName` varchar(20) DEFAULT NULL,
  `feesPaid` date DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `subject1` varchar(45) DEFAULT NULL,
  `subject2` varchar(45) DEFAULT NULL,
  `subject3` varchar(45) DEFAULT NULL,
  `subject4` varchar(45) DEFAULT NULL,
  `teacherName` varchar(45) DEFAULT NULL,
  `teacherAddress` varchar(45) DEFAULT NULL,
  `courseName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_2`
--

LOCK TABLES `classes_2` WRITE;
/*!40000 ALTER TABLE `classes_2` DISABLE KEYS */;
INSERT INTO `classes_2` VALUES ('John Smith','2000-06-18','1991-08-04','3 Main Street, North Boston 56125','Economics 1 (Business)','Biology 1 (Science)',NULL,NULL,'James Peterson','44 March Way, Glebe 56100','Economics'),('Maria Griffin','2001-05-14','1992-09-10','16 Leeds Road, South Boston 56128','Biology 1 (Science)','Business Intro (Business)','Programming 2 (IT)',NULL,'James Peterson, 44 March Way','Glebe 56100','Computer Science'),('Susan Johnson','2001-02-03','1991-01-13','21 Arrow Street, South Boston 56128','Biology 2 (Science)',NULL,NULL,NULL,'Sarah Francis',NULL,'Medicine'),('Matt Long','2002-04-29','1992-04-25','14 Milk Lane, South Boston 56128',NULL,NULL,NULL,NULL,'Shane Cobson','105 Mist Road, Faulkner 56410','Dentistry');
/*!40000 ALTER TABLE `classes_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffbranch`
--

DROP TABLE IF EXISTS `staffbranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffbranch` (
  `staffNo` varchar(4) NOT NULL,
  `sName` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `salary` decimal(18,0) DEFAULT NULL,
  `branchNo` varchar(4) DEFAULT NULL,
  `bAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffbranch`
--

LOCK TABLES `staffbranch` WRITE;
/*!40000 ALTER TABLE `staffbranch` DISABLE KEYS */;
INSERT INTO `staffbranch` VALUES ('SA9','Mary Howe','Assistant',9000,'B007','16 Argyll St Aberdeen'),('SG14','David Ford','Supervisor',18000,'B003','163 Main St Glasgow'),('SG37','Ann Beech','Assistant',9000,'B003','163 Main St Glasgow'),('SG5','Susan Brand','Manager',30000,'B003','163 Main St Glasgow'),('SL21','John White','Manager',30000,'B005','22 Deer RD London'),('SL41','Julie Lee','Assistant',9000,'B005','22 Deer RD London');
/*!40000 ALTER TABLE `staffbranch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-24  6:49:06
