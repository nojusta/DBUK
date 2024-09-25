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
-- Table structure for table `production_productmodelillustration`
--

DROP TABLE IF EXISTS `production_productmodelillustration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_productmodelillustration` (
  `ProductModelID` int NOT NULL COMMENT 'Primary key. Foreign key to ProductModel.ProductModelID.',
  `IllustrationID` int NOT NULL COMMENT 'Primary key. Foreign key to Illustration.IllustrationID.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductModelID`,`IllustrationID`),
  KEY `FK_ProductModelIllustration_Illustration_IllustrationID` (`IllustrationID`),
  CONSTRAINT `FK_ProductModelIllustration_Illustration_IllustrationID` FOREIGN KEY (`IllustrationID`) REFERENCES `production_illustration` (`IllustrationID`),
  CONSTRAINT `FK_ProductModelIllustration_ProductModel_ProductModelID` FOREIGN KEY (`ProductModelID`) REFERENCES `production_productmodel` (`ProductModelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping product models and illustrations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_productmodelillustration`
--

LOCK TABLES `production_productmodelillustration` WRITE;
/*!40000 ALTER TABLE `production_productmodelillustration` DISABLE KEYS */;
INSERT INTO `production_productmodelillustration` VALUES (7,3,'2014-01-09 09:11:02'),(10,3,'2014-01-09 09:11:02'),(47,4,'2014-01-09 09:11:02'),(47,5,'2014-01-09 09:11:02'),(48,4,'2014-01-09 09:11:02'),(48,5,'2014-01-09 09:11:02'),(67,6,'2014-01-09 09:11:02');
/*!40000 ALTER TABLE `production_productmodelillustration` ENABLE KEYS */;
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
