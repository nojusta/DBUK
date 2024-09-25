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
-- Table structure for table `production_productdocument`
--

DROP TABLE IF EXISTS `production_productdocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_productdocument` (
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID.',
  `DocumentNode` varchar(255) NOT NULL COMMENT 'Document identification number. Foreign key to Document.DocumentNode.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductID`,`DocumentNode`),
  KEY `FK_ProductDocument_Document_DocumentNode` (`DocumentNode`),
  CONSTRAINT `FK_ProductDocument_Document_DocumentNode` FOREIGN KEY (`DocumentNode`) REFERENCES `production_document` (`DocumentNode`),
  CONSTRAINT `FK_ProductDocument_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `production_product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping products to related product documents.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_productdocument`
--

LOCK TABLES `production_productdocument` WRITE;
/*!40000 ALTER TABLE `production_productdocument` DISABLE KEYS */;
INSERT INTO `production_productdocument` VALUES (317,'/2/1/','2013-12-29 08:21:58'),(318,'/2/1/','2013-12-29 08:21:58'),(319,'/2/1/','2013-12-29 08:21:58'),(506,'/3/1/','2013-12-29 08:21:58'),(506,'/3/2/','2013-12-29 08:21:58'),(514,'/3/4/','2013-12-29 08:21:58'),(515,'/3/4/','2013-12-29 08:21:58'),(516,'/3/4/','2013-12-29 08:21:58'),(517,'/3/4/','2013-12-29 08:21:58'),(518,'/3/4/','2013-12-29 08:21:58'),(519,'/3/4/','2013-12-29 08:21:58'),(520,'/3/4/','2013-12-29 08:21:58'),(521,'/3/4/','2013-12-29 08:21:58'),(522,'/3/4/','2013-12-29 08:21:58'),(928,'/2/1/','2013-12-29 08:21:58'),(929,'/2/1/','2013-12-29 08:21:58'),(930,'/2/1/','2013-12-29 08:21:58'),(931,'/2/1/','2013-12-29 08:21:58'),(932,'/2/1/','2013-12-29 08:21:58'),(933,'/2/1/','2013-12-29 08:21:58'),(934,'/2/1/','2013-12-29 08:21:58'),(935,'/3/3/','2013-12-29 08:21:58'),(936,'/3/3/','2013-12-29 08:21:58'),(937,'/3/3/','2013-12-29 08:21:58'),(938,'/3/3/','2013-12-29 08:21:58'),(939,'/3/3/','2013-12-29 08:21:58'),(940,'/3/3/','2013-12-29 08:21:58'),(941,'/3/3/','2013-12-29 08:21:58'),(977,'/1/1/','2013-12-29 08:21:58'),(997,'/1/1/','2013-12-29 08:21:58'),(998,'/1/1/','2013-12-29 08:21:58'),(999,'/1/1/','2013-12-29 08:21:58');
/*!40000 ALTER TABLE `production_productdocument` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:41
