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
-- Table structure for table `production_productcategory`
--

DROP TABLE IF EXISTS `production_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_productcategory` (
  `ProductCategoryID` int NOT NULL COMMENT 'Primary key for ProductCategory records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Category description.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductCategoryID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_ProductCategory_Name` (`Name`),
  UNIQUE KEY `AK_ProductCategory_rowguid` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='High-level product categorization.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_productcategory`
--

LOCK TABLES `production_productcategory` WRITE;
/*!40000 ALTER TABLE `production_productcategory` DISABLE KEYS */;
INSERT INTO `production_productcategory` VALUES (1,'Bikes','CFBDA25C-DF71-47A7-B81B-64EE161AA37C','2008-04-29 18:30:00'),(2,'Components','C657828D-D808-4ABA-91A3-AF2CE02300E9','2008-04-29 18:30:00'),(3,'Clothing','10A7C342-CA82-48D4-8A38-46A2EB089B74','2008-04-29 18:30:00'),(4,'Accessories','2BE3BE36-D9A2-4EEE-B593-ED895D97C2A6','2008-04-29 18:30:00');
/*!40000 ALTER TABLE `production_productcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:25
