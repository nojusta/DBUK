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
-- Table structure for table `production_scrapreason`
--

DROP TABLE IF EXISTS `production_scrapreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_scrapreason` (
  `ScrapReasonID` smallint NOT NULL COMMENT 'Primary key for ScrapReason records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Failure description.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ScrapReasonID`),
  UNIQUE KEY `AK_ScrapReason_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Manufacturing failure reasons lookup table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_scrapreason`
--

LOCK TABLES `production_scrapreason` WRITE;
/*!40000 ALTER TABLE `production_scrapreason` DISABLE KEYS */;
INSERT INTO `production_scrapreason` VALUES (1,'Brake assembly not as ordered','2008-04-29 18:30:00'),(2,'Color incorrect','2008-04-29 18:30:00'),(3,'Gouge in metal','2008-04-29 18:30:00'),(4,'Drill pattern incorrect','2008-04-29 18:30:00'),(5,'Drill size too large','2008-04-29 18:30:00'),(6,'Drill size too small','2008-04-29 18:30:00'),(7,'Handling damage','2008-04-29 18:30:00'),(8,'Paint process failed','2008-04-29 18:30:00'),(9,'Primer process failed','2008-04-29 18:30:00'),(10,'Seat assembly not as ordered','2008-04-29 18:30:00'),(11,'Stress test failed','2008-04-29 18:30:00'),(12,'Thermoform temperature too high','2008-04-29 18:30:00'),(13,'Thermoform temperature too low','2008-04-29 18:30:00'),(14,'Trim length too long','2008-04-29 18:30:00'),(15,'Trim length too short','2008-04-29 18:30:00'),(16,'Wheel misaligned','2008-04-29 18:30:00');
/*!40000 ALTER TABLE `production_scrapreason` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:31
