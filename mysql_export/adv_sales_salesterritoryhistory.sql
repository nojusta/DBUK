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
-- Table structure for table `sales_salesterritoryhistory`
--

DROP TABLE IF EXISTS `sales_salesterritoryhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_salesterritoryhistory` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key. The sales rep.  Foreign key to SalesPerson.BusinessEntityID.',
  `TerritoryID` int NOT NULL COMMENT 'Primary key. Territory identification number. Foreign key to SalesTerritory.SalesTerritoryID.',
  `StartDate` datetime(6) NOT NULL COMMENT 'Primary key. Date the sales representive started work in the territory.',
  `EndDate` datetime(6) DEFAULT NULL COMMENT 'Date the sales representative left work in the territory.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`TerritoryID`,`StartDate`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SalesTerritoryHistory_rowguid` (`rowguid`),
  KEY `FK_SalesTerritoryHistory_SalesTerritory_TerritoryID` (`TerritoryID`),
  CONSTRAINT `FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `sales_salesperson` (`BusinessEntityID`),
  CONSTRAINT `FK_SalesTerritoryHistory_SalesTerritory_TerritoryID` FOREIGN KEY (`TerritoryID`) REFERENCES `sales_salesterritory` (`TerritoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sales representative transfers to other sales territories.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_salesterritoryhistory`
--

LOCK TABLES `sales_salesterritoryhistory` WRITE;
/*!40000 ALTER TABLE `sales_salesterritoryhistory` DISABLE KEYS */;
INSERT INTO `sales_salesterritoryhistory` VALUES (275,2,'2011-05-31 00:00:00.000000','2012-11-29 00:00:00.000000','8563CE6A-00FF-47D7-BA4D-3C3E1CDEF531','2012-11-21 18:30:00'),(275,3,'2012-11-30 00:00:00.000000',NULL,'2F44304C-EE87-4C72-813E-CA75C5F61F4C','2012-11-22 18:30:00'),(276,4,'2011-05-31 00:00:00.000000',NULL,'64BCB1B3-A793-40BA-9859-D90F78C3F167','2011-05-23 18:30:00'),(277,2,'2012-11-30 00:00:00.000000',NULL,'132E4721-32DD-4A73-B556-1837F3A2B9AE','2012-11-22 18:30:00'),(277,3,'2011-05-31 00:00:00.000000','2012-11-29 00:00:00.000000','3E9F893D-5142-46C9-A76A-867D1E3D6F90','2012-11-21 18:30:00'),(278,6,'2011-05-31 00:00:00.000000',NULL,'B7C8F9F5-5FB8-47B3-BE73-1B9A14BDF8B9','2011-05-23 18:30:00'),(279,5,'2011-05-31 00:00:00.000000',NULL,'57D1CDCF-62CE-499F-8BE8-1BB71C4BB7EF','2011-05-23 18:30:00'),(280,1,'2011-05-31 00:00:00.000000','2012-09-29 00:00:00.000000','FD3F5566-10E2-4960-BE12-0365E5665881','2012-09-21 18:30:00'),(281,4,'2011-05-31 00:00:00.000000',NULL,'9D8754B2-C320-40DB-A77F-FF5A1BC0F46B','2011-05-23 18:30:00'),(282,6,'2011-05-31 00:00:00.000000','2012-05-29 00:00:00.000000','2C9F5240-D8BF-4F85-897D-6083146DBC4B','2012-05-21 18:30:00'),(282,10,'2012-05-30 00:00:00.000000',NULL,'92375465-38C6-4C86-ABA1-9838A2969475','2012-05-22 18:30:00'),(283,1,'2011-05-31 00:00:00.000000',NULL,'009F7660-44A6-4ADF-BD4B-A5D1B79993F5','2011-05-23 18:30:00'),(284,1,'2012-09-30 00:00:00.000000',NULL,'ED12F921-8023-48EF-84BD-94D942F4C009','2012-09-22 18:30:00'),(286,9,'2013-05-30 00:00:00.000000',NULL,'D664D989-2BEB-4F2C-A4AA-691018965283','2013-05-22 18:30:00'),(288,8,'2013-05-30 00:00:00.000000',NULL,'3E1360CB-32E0-4286-8D98-8539F1AB2550','2013-05-22 18:30:00'),(289,6,'2012-05-30 00:00:00.000000',NULL,'987613ED-33D6-42A6-B992-0B33E9234934','2012-05-22 18:30:00'),(290,7,'2012-05-30 00:00:00.000000',NULL,'8895E74D-6D38-4140-BBEA-A8136A2F480E','2012-05-22 18:30:00');
/*!40000 ALTER TABLE `sales_salesterritoryhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:37
