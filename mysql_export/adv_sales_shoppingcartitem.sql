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
-- Table structure for table `sales_shoppingcartitem`
--

DROP TABLE IF EXISTS `sales_shoppingcartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_shoppingcartitem` (
  `ShoppingCartItemID` int NOT NULL COMMENT 'Primary key for ShoppingCartItem records.',
  `ShoppingCartID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Shopping cart identification number.',
  `Quantity` int NOT NULL DEFAULT '1' COMMENT 'Product quantity ordered.',
  `ProductID` int NOT NULL COMMENT 'Product ordered. Foreign key to Product.ProductID.',
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date the time the record was created.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ShoppingCartItemID`),
  KEY `IX_ShoppingCartItem_ShoppingCartID_ProductID` (`ShoppingCartID`,`ProductID`),
  KEY `FK_ShoppingCartItem_Product_ProductID` (`ProductID`),
  CONSTRAINT `FK_ShoppingCartItem_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `production_product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains online customer orders until the order is submitted or cancelled.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shoppingcartitem`
--

LOCK TABLES `sales_shoppingcartitem` WRITE;
/*!40000 ALTER TABLE `sales_shoppingcartitem` DISABLE KEYS */;
INSERT INTO `sales_shoppingcartitem` VALUES (2,'14951',3,862,'2013-11-09 12:24:08','2013-11-09 12:24:08'),(4,'20621',4,881,'2013-11-09 12:24:08','2013-11-09 12:24:08'),(5,'20621',7,874,'2013-11-09 12:24:08','2013-11-09 12:24:08');
/*!40000 ALTER TABLE `sales_shoppingcartitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:33
