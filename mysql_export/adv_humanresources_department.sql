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
-- Table structure for table `humanresources_department`
--

DROP TABLE IF EXISTS `humanresources_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humanresources_department` (
  `DepartmentID` smallint NOT NULL COMMENT 'Primary key for Department records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Name of the department.',
  `GroupName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Name of the group to which the department belongs.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `AK_Department_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Lookup table containing the departments within the Adventure Works Cycles company.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humanresources_department`
--

LOCK TABLES `humanresources_department` WRITE;
/*!40000 ALTER TABLE `humanresources_department` DISABLE KEYS */;
INSERT INTO `humanresources_department` VALUES (1,'Engineering','Research and Development','2008-04-29 18:30:00'),(2,'Tool Design','Research and Development','2008-04-29 18:30:00'),(3,'Sales','Sales and Marketing','2008-04-29 18:30:00'),(4,'Marketing','Sales and Marketing','2008-04-29 18:30:00'),(5,'Purchasing','Inventory Management','2008-04-29 18:30:00'),(6,'Research and Development','Research and Development','2008-04-29 18:30:00'),(7,'Production','Manufacturing','2008-04-29 18:30:00'),(8,'Production Control','Manufacturing','2008-04-29 18:30:00'),(9,'Human Resources','Executive General and Administration','2008-04-29 18:30:00'),(10,'Finance','Executive General and Administration','2008-04-29 18:30:00'),(11,'Information Services','Executive General and Administration','2008-04-29 18:30:00'),(12,'Document Control','Quality Assurance','2008-04-29 18:30:00'),(13,'Quality Assurance','Quality Assurance','2008-04-29 18:30:00'),(14,'Facilities and Maintenance','Executive General and Administration','2008-04-29 18:30:00'),(15,'Shipping and Receiving','Inventory Management','2008-04-29 18:30:00'),(16,'Executive','Executive General and Administration','2008-04-29 18:30:00');
/*!40000 ALTER TABLE `humanresources_department` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:20
