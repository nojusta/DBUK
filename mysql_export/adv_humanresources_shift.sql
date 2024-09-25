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
-- Table structure for table `humanresources_shift`
--

DROP TABLE IF EXISTS `humanresources_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humanresources_shift` (
  `ShiftID` tinyint unsigned NOT NULL COMMENT 'Primary key for Shift records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Shift description.',
  `StartTime` time(6) NOT NULL COMMENT 'Shift start time.',
  `EndTime` time(6) NOT NULL COMMENT 'Shift end time.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ShiftID`),
  UNIQUE KEY `AK_Shift_Name` (`Name`),
  UNIQUE KEY `AK_Shift_StartTime_EndTime` (`StartTime`,`EndTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Work shift lookup table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humanresources_shift`
--

LOCK TABLES `humanresources_shift` WRITE;
/*!40000 ALTER TABLE `humanresources_shift` DISABLE KEYS */;
INSERT INTO `humanresources_shift` VALUES (1,'Day','07:00:00.000000','15:00:00.000000','2008-04-29 18:30:00'),(2,'Evening','15:00:00.000000','23:00:00.000000','2008-04-29 18:30:00'),(3,'Night','23:00:00.000000','07:00:00.000000','2008-04-29 18:30:00');
/*!40000 ALTER TABLE `humanresources_shift` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:12
