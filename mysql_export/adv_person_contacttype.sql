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
-- Table structure for table `person_contacttype`
--

DROP TABLE IF EXISTS `person_contacttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_contacttype` (
  `ContactTypeID` int NOT NULL COMMENT 'Primary key for ContactType records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Contact type description.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ContactTypeID`),
  UNIQUE KEY `AK_ContactType_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Lookup table containing the types of business entity contacts.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_contacttype`
--

LOCK TABLES `person_contacttype` WRITE;
/*!40000 ALTER TABLE `person_contacttype` DISABLE KEYS */;
INSERT INTO `person_contacttype` VALUES (1,'Accounting Manager','2008-04-29 18:30:00'),(2,'Assistant Sales Agent','2008-04-29 18:30:00'),(3,'Assistant Sales Representative','2008-04-29 18:30:00'),(4,'Coordinator Foreign Markets','2008-04-29 18:30:00'),(5,'Export Administrator','2008-04-29 18:30:00'),(6,'International Marketing Manager','2008-04-29 18:30:00'),(7,'Marketing Assistant','2008-04-29 18:30:00'),(8,'Marketing Manager','2008-04-29 18:30:00'),(9,'Marketing Representative','2008-04-29 18:30:00'),(10,'Order Administrator','2008-04-29 18:30:00'),(11,'Owner','2008-04-29 18:30:00'),(12,'Owner/Marketing Assistant','2008-04-29 18:30:00'),(13,'Product Manager','2008-04-29 18:30:00'),(14,'Purchasing Agent','2008-04-29 18:30:00'),(15,'Purchasing Manager','2008-04-29 18:30:00'),(16,'Regional Account Representative','2008-04-29 18:30:00'),(17,'Sales Agent','2008-04-29 18:30:00'),(18,'Sales Associate','2008-04-29 18:30:00'),(19,'Sales Manager','2008-04-29 18:30:00'),(20,'Sales Representative','2008-04-29 18:30:00');
/*!40000 ALTER TABLE `person_contacttype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:29
