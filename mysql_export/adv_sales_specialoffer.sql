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
-- Table structure for table `sales_specialoffer`
--

DROP TABLE IF EXISTS `sales_specialoffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_specialoffer` (
  `SpecialOfferID` int NOT NULL COMMENT 'Primary key for SpecialOffer records.',
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Discount description.',
  `DiscountPct` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount precentage.',
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Discount type category.',
  `Category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Group the discount applies to such as Reseller or Customer.',
  `StartDate` datetime(6) NOT NULL COMMENT 'Discount start date.',
  `EndDate` datetime(6) NOT NULL COMMENT 'Discount end date.',
  `MinQty` int NOT NULL DEFAULT '0' COMMENT 'Minimum discount percent allowed.',
  `MaxQty` int DEFAULT NULL COMMENT 'Maximum discount percent allowed.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`SpecialOfferID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SpecialOffer_rowguid` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sale discounts lookup table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_specialoffer`
--

LOCK TABLES `sales_specialoffer` WRITE;
/*!40000 ALTER TABLE `sales_specialoffer` DISABLE KEYS */;
INSERT INTO `sales_specialoffer` VALUES (1,'No Discount',0.0000,'No Discount','No Discount','2011-05-01 00:00:00.000000','2014-11-30 00:00:00.000000',0,NULL,'0290C4F5-191F-4337-AB6B-0A2DDE03CBF9','2011-03-31 18:30:00'),(2,'Volume Discount 11 to 14',0.0200,'Volume Discount','Reseller','2011-05-31 00:00:00.000000','2014-05-30 00:00:00.000000',11,14,'D7542EE7-15DB-4541-985C-5CC27AEF26D6','2011-04-30 18:30:00'),(3,'Volume Discount 15 to 24',0.0500,'Volume Discount','Reseller','2011-05-31 00:00:00.000000','2014-05-30 00:00:00.000000',15,24,'4BDBCC01-8CF7-40A9-B643-40EC5B717491','2011-04-30 18:30:00'),(4,'Volume Discount 25 to 40',0.1000,'Volume Discount','Reseller','2011-05-31 00:00:00.000000','2014-05-30 00:00:00.000000',25,40,'504B5E85-8F3F-4EBC-9E1D-C1BC5DEA9AA8','2011-04-30 18:30:00'),(5,'Volume Discount 41 to 60',0.1500,'Volume Discount','Reseller','2011-05-31 00:00:00.000000','2014-05-30 00:00:00.000000',41,60,'677E1D9D-944F-4E81-90E8-47EB0A82D48C','2011-04-30 18:30:00'),(6,'Volume Discount over 60',0.2000,'Volume Discount','Reseller','2011-05-31 00:00:00.000000','2014-05-30 00:00:00.000000',61,NULL,'8157F569-4E8D-46B6-9347-5D0F726A9439','2011-04-30 18:30:00'),(7,'Mountain-100 Clearance Sale',0.3500,'Discontinued Product','Reseller','2012-04-13 00:00:00.000000','2012-05-29 00:00:00.000000',0,NULL,'7DF15BF5-6C05-47E7-80A4-22BD1CE59A72','2012-03-13 18:30:00'),(8,'Sport Helmet Discount-2002',0.1000,'Seasonal Discount','Reseller','2012-05-30 00:00:00.000000','2012-06-29 00:00:00.000000',0,NULL,'20C5D2CC-A38F-48F8-AC9A-8F15943E52AE','2012-04-29 18:30:00'),(9,'Road-650 Overstock',0.3000,'Excess Inventory','Reseller','2012-05-30 00:00:00.000000','2012-07-30 00:00:00.000000',0,NULL,'0CF8472B-F9E6-4945-9E09-549D7DDE2198','2012-04-29 18:30:00'),(10,'Mountain Tire Sale',0.5000,'Excess Inventory','Customer','2013-05-14 00:00:00.000000','2013-07-29 00:00:00.000000',0,NULL,'220444AD-2EF3-4E4C-87E9-3AA6EE39A877','2013-04-13 18:30:00'),(11,'Sport Helmet Discount-2003',0.1500,'Seasonal Discount','Reseller','2013-05-30 00:00:00.000000','2013-06-29 00:00:00.000000',0,NULL,'E72DAB1D-F44D-448B-9FE2-F259A2F0210D','2013-04-29 18:30:00'),(12,'LL Road Frame Sale',0.3500,'Excess Inventory','Reseller','2013-05-30 00:00:00.000000','2013-07-14 00:00:00.000000',0,NULL,'C0AF1C89-9722-4235-9248-3FBA4D9E5841','2013-04-29 18:30:00'),(13,'Touring-3000 Promotion',0.1500,'New Product','Reseller','2013-05-30 00:00:00.000000','2013-08-29 00:00:00.000000',0,NULL,'5061CCE4-E021-45A8-9A75-DFB36CBBCE85','2013-04-29 18:30:00'),(14,'Touring-1000 Promotion',0.2000,'New Product','Reseller','2013-05-30 00:00:00.000000','2013-08-29 00:00:00.000000',0,NULL,'1AF84A9E-A98C-4BD9-B48F-DC2B8B6B010B','2013-04-29 18:30:00'),(15,'Half-Price Pedal Sale',0.5000,'Seasonal Discount','Customer','2013-07-14 00:00:00.000000','2013-08-14 00:00:00.000000',0,NULL,'03E3594D-6EBB-46A6-B8EE-A9289C0C2E47','2013-06-13 18:30:00'),(16,'Mountain-500 Silver Clearance Sale',0.4000,'Discontinued Product','Reseller','2014-03-31 00:00:00.000000','2014-05-30 00:00:00.000000',0,NULL,'EB7CB484-BCCF-4D2D-BF73-521B20014174','2014-02-28 18:30:00');
/*!40000 ALTER TABLE `sales_specialoffer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:42
