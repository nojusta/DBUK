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
-- Table structure for table `production_unitmeasure`
--

DROP TABLE IF EXISTS `production_unitmeasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_unitmeasure` (
  `UnitMeasureCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Primary key.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Unit of measure description.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`UnitMeasureCode`),
  UNIQUE KEY `AK_UnitMeasure_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Unit of measure lookup table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_unitmeasure`
--

LOCK TABLES `production_unitmeasure` WRITE;
/*!40000 ALTER TABLE `production_unitmeasure` DISABLE KEYS */;
INSERT INTO `production_unitmeasure` VALUES ('BOX','Boxes','2008-04-29 18:30:00'),('BTL','Bottle','2008-04-29 18:30:00'),('C','Celsius','2008-04-29 18:30:00'),('CAN','Canister','2008-04-29 18:30:00'),('CAR','Carton','2008-04-29 18:30:00'),('CBM','Cubic meters','2008-04-29 18:30:00'),('CCM','Cubic centimeter','2008-04-29 18:30:00'),('CDM','Cubic decimeter','2008-04-29 18:30:00'),('CM','Centimeter','2008-04-29 18:30:00'),('CM2','Square centimeter','2008-04-29 18:30:00'),('CR','Crate','2008-04-29 18:30:00'),('CS','Case','2008-04-29 18:30:00'),('CTN','Container','2008-04-29 18:30:00'),('DM','Decimeter','2008-04-29 18:30:00'),('DZ','Dozen','2008-04-29 18:30:00'),('EA','Each','2008-04-29 18:30:00'),('FT3','Cubic foot','2008-04-29 18:30:00'),('G','Gram','2008-04-29 18:30:00'),('GAL','Gallon','2008-04-29 18:30:00'),('IN','Inch','2008-04-29 18:30:00'),('KG','Kilogram','2008-04-29 18:30:00'),('KGV','Kilogram/cubic meter','2008-04-29 18:30:00'),('KM','Kilometer','2008-04-29 18:30:00'),('KT','Kiloton','2008-04-29 18:30:00'),('L','Liter','2008-04-29 18:30:00'),('LB','US pound','2008-04-29 18:30:00'),('M','Meter','2008-04-29 18:30:00'),('M2','Square meter','2008-04-29 18:30:00'),('M3','Cubic meter','2008-04-29 18:30:00'),('MG','Milligram','2008-04-29 18:30:00'),('ML','Milliliter','2008-04-29 18:30:00'),('MM','Millimeter','2008-04-29 18:30:00'),('OZ','Ounces','2008-04-29 18:30:00'),('PAK','Pack','2008-04-29 18:30:00'),('PAL','Pallet','2008-04-29 18:30:00'),('PC','Piece','2008-04-29 18:30:00'),('PCT','Percentage','2008-04-29 18:30:00'),('PT','Pint, US liquid','2008-04-29 18:30:00');
/*!40000 ALTER TABLE `production_unitmeasure` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:45
