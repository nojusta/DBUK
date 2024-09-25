-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: adv
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `humanresources_jobcandidate`
--

DROP TABLE IF EXISTS `humanresources_jobcandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humanresources_jobcandidate` (
  `JobCandidateID` int NOT NULL COMMENT 'Primary key for JobCandidate records.',
  `BusinessEntityID` int DEFAULT NULL COMMENT 'Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID.',
  `Resume` text COMMENT 'Résumé in XML format.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`JobCandidateID`),
  KEY `IX_JobCandidate_BusinessEntityID` (`BusinessEntityID`),
  CONSTRAINT `FK_JobCandidate_Employee_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `humanresources_employee` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Résumés submitted to Human Resources by job applicants.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humanresources_jobcandidate`
--

LOCK TABLES `humanresources_jobcandidate` WRITE;
/*!40000 ALTER TABLE `humanresources_jobcandidate` DISABLE KEYS */;
INSERT INTO `humanresources_jobcandidate` VALUES (1,NULL,NULL,'2007-06-22 18:30:00'),(2,NULL,NULL,'2007-06-22 18:30:00'),(3,NULL,NULL,'2007-06-22 18:30:00'),(4,274,NULL,'2013-12-22 13:02:21'),(5,NULL,NULL,'2007-06-22 18:30:00'),(6,NULL,NULL,'2007-06-22 18:30:00'),(7,NULL,NULL,'2007-06-22 18:30:00'),(8,212,NULL,'2013-12-22 13:02:21'),(9,NULL,NULL,'2007-06-22 18:30:00'),(10,NULL,NULL,'2007-06-22 18:30:00'),(11,NULL,NULL,'2007-06-22 18:30:00'),(12,NULL,NULL,'2007-06-22 18:30:00'),(13,NULL,NULL,'2007-06-22 18:30:00');
/*!40000 ALTER TABLE `humanresources_jobcandidate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:24
