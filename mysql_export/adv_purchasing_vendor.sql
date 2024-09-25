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
-- Table structure for table `purchasing_vendor`
--

DROP TABLE IF EXISTS `purchasing_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasing_vendor` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key for Vendor records.  Foreign key to BusinessEntity.BusinessEntityID',
  `AccountNumber` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Vendor account (identification) number.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Company name.',
  `CreditRating` tinyint unsigned NOT NULL COMMENT '1 = Superior, 2 = Excellent, 3 = Above average, 4 = Average, 5 = Below average',
  `PreferredVendorStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Do not use if another vendor is available. 1 = Preferred over other vendors supplying the same product.',
  `ActiveFlag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Vendor no longer used. 1 = Vendor is actively used.',
  `PurchasingWebServiceURL` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Vendor URL.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE KEY `AK_Vendor_AccountNumber` (`AccountNumber`),
  CONSTRAINT `FK_Vendor_BusinessEntity_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `person_businessentity` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Companies from whom Adventure Works Cycles purchases parts or other goods.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasing_vendor`
--

LOCK TABLES `purchasing_vendor` WRITE;
/*!40000 ALTER TABLE `purchasing_vendor` DISABLE KEYS */;
INSERT INTO `purchasing_vendor` VALUES (1492,'AUSTRALI0001','Australia Bike Retailer',1,1,1,NULL,'2011-12-22 18:30:00'),(1494,'ALLENSON0001','Allenson Cycles',2,1,1,NULL,'2011-04-24 18:30:00'),(1496,'ADVANCED0001','Advanced Bicycles',1,1,1,NULL,'2011-04-24 18:30:00'),(1498,'TRIKES0001','Trikes, Inc.',2,1,1,NULL,'2012-02-02 18:30:00'),(1500,'MORGANB0001','Morgan Bike Accessories',1,1,1,NULL,'2012-02-01 18:30:00'),(1502,'CYCLING0001','Cycling Master',1,1,1,NULL,'2011-12-23 18:30:00'),(1504,'CHICAGO0002','Chicago Rent-All',2,1,1,NULL,'2011-12-23 18:30:00'),(1506,'GREENWOO0001','Greenwood Athletic Company',1,1,1,NULL,'2012-01-24 18:30:00'),(1508,'COMPETE0001','Compete Enterprises, Inc',1,1,1,NULL,'2011-12-23 18:30:00'),(1510,'INTERNAT0001','International',1,1,1,NULL,'2012-01-24 18:30:00'),(1512,'LIGHTSP0001','Light Speed',1,1,1,NULL,'2011-12-22 18:30:00'),(1514,'TRAINING0001','Training Systems',1,1,1,NULL,'2012-02-02 18:30:00'),(1516,'GARDNER0001','Gardner Touring Cycles',1,0,0,NULL,'2012-01-24 18:30:00'),(1518,'INTERNAT0004','International Trek Center',1,1,1,NULL,'2011-12-23 18:30:00'),(1520,'G&KBI0001','G & K Bicycle Corp.',1,1,1,NULL,'2011-12-23 18:30:00'),(1522,'FIRSTNA0001','First National Sport Co.',1,1,1,NULL,'2012-01-24 18:30:00'),(1524,'RECREATI0001','Recreation Place',4,1,1,NULL,'2012-02-01 18:30:00'),(1526,'INTERNAT0002','International Bicycles',1,1,1,NULL,'2012-01-24 18:30:00'),(1528,'IMAGEMA0001','Image Makers Bike Center',1,1,1,NULL,'2012-02-02 18:30:00'),(1530,'COMFORT0001','Comfort Road Bicycles',1,1,1,NULL,'2011-12-23 18:30:00'),(1532,'KNOPFLER0001','Knopfler Cycles',1,1,1,NULL,'2012-01-28 18:30:00'),(1534,'READYRE0001','Ready Rentals',1,1,1,NULL,'2012-02-01 18:30:00'),(1536,'CRUGERB0001','Cruger Bike Company',1,1,1,NULL,'2012-01-16 18:30:00'),(1538,'VISTARO0001','Vista Road Bikes',3,1,1,NULL,'2012-02-17 18:30:00'),(1540,'BERGERON0001','Bergeron Off-Roads',1,1,1,NULL,'2011-12-22 18:30:00'),(1542,'HILLSBI0001','Hill\'s Bicycle Service',1,1,1,NULL,'2012-01-24 18:30:00'),(1544,'CIRCUIT0001','Circuit Cycles',1,0,0,NULL,'2011-12-23 18:30:00'),(1546,'GREENLA0001','Green Lake Bike Company',1,1,1,NULL,'2012-01-28 18:30:00'),(1548,'CONSUMER0001','Consumer Cycles',3,1,1,NULL,'2011-12-23 18:30:00'),(1550,'MERITBI0001','Merit Bikes',5,1,1,NULL,'2012-02-02 18:30:00'),(1552,'SPORTSH0001','Sports House',1,1,1,NULL,'2012-01-24 18:30:00'),(1554,'WESTAMER0001','WestAmerica Bicycle Co.',1,0,1,NULL,'2012-02-17 18:30:00'),(1556,'WESTJUN0001','West Junction Cycles',1,1,1,NULL,'2012-02-17 18:30:00'),(1558,'MARSH0001','Marsh',1,1,1,NULL,'2012-02-02 18:30:00'),(1560,'CAPITAL0001','Capital Road Cycles',1,1,1,NULL,'2011-12-23 18:30:00'),(1562,'NORSTAN0001','Norstan Bike Hut',1,1,1,NULL,'2012-02-01 18:30:00'),(1564,'ILLINOIS0001','Illinois Trek & Clothing',1,1,1,NULL,'2011-12-22 18:30:00'),(1566,'BURNETT0001','Burnett Road Warriors',1,1,1,NULL,'2011-12-22 18:30:00'),(1568,'CUSTOMF0001','Custom Frames, Inc.',2,1,1,NULL,'2012-01-16 18:30:00'),(1570,'FIRSTRA0001','First Rate Bicycles',1,1,1,NULL,'2012-01-24 18:30:00'),(1572,'NATIONAL0001','National Bike Association',1,1,1,NULL,'2012-02-01 18:30:00'),(1574,'JEFFSSP0001','Jeff\'s Sporting Goods',1,1,1,NULL,'2011-12-23 18:30:00'),(1576,'SUPERIOR0001','Superior Bicycles',1,1,1,NULL,'2012-02-02 18:30:00'),(1578,'VISIONC0001','Vision Cycles, Inc.',1,0,1,NULL,'2012-02-17 18:30:00'),(1580,'LITWARE0001','Litware, Inc.',1,1,1,'www.litwareinc.com/','2011-04-24 18:30:00'),(1582,'INNERCI0001','Inner City Bikes',3,1,1,NULL,'2012-01-24 18:30:00'),(1584,'TREYRE0001','Trey Research',3,1,1,'www.treyresearch.net/','2012-01-24 18:30:00'),(1586,'MITCHELL0001','Mitchell Sports',1,1,1,NULL,'2012-02-01 18:30:00'),(1588,'SIGNATUR0001','Signature Cycles',2,1,1,NULL,'2012-02-01 18:30:00'),(1590,'SUPERSAL0001','SUPERSALES INC.',1,1,1,NULL,'2012-02-02 18:30:00'),(1592,'LINDELL0001','Lindell',1,1,1,NULL,'2012-01-28 18:30:00'),(1594,'FITNESS0001','Fitness Association',1,1,1,NULL,'2012-02-02 18:30:00'),(1596,'ADATUM0001','A. Datum Corporation',1,1,1,'www.adatum.com/','2011-12-23 18:30:00'),(1598,'CONTINEN0001','Continental Pro Cycles',3,1,1,NULL,'2011-12-23 18:30:00'),(1600,'FEDERAL0001','Federal Sport',3,1,1,NULL,'2012-01-24 18:30:00'),(1602,'BEAUMONT0001','Beaumont Bikes',1,0,1,NULL,'2011-12-22 18:30:00'),(1604,'BIKESAT0001','Bike Satellite Inc.',1,0,1,NULL,'2011-12-22 18:30:00'),(1606,'NORTHW0001','Northwind Traders',1,1,1,'www.northwindtraders.com/','2012-01-24 18:30:00'),(1608,'SPORTPL0001','Sport Playground',1,1,1,NULL,'2012-02-01 18:30:00'),(1610,'HYBRIDB0001','Hybrid Bicycle Center',1,1,1,NULL,'2012-01-24 18:30:00'),(1612,'MIDWEST0001','Midwest Sport, Inc.',1,1,1,NULL,'2012-02-01 18:30:00'),(1614,'RELIANCE0001','Reliance Fitness, Inc.',2,0,0,NULL,'2012-02-01 18:30:00'),(1616,'AURORAB0001','Aurora Bike Center',1,1,1,NULL,'2011-05-08 18:30:00'),(1618,'METROSP0001','Metro Sport Equipment',1,1,1,NULL,'2012-01-28 18:30:00'),(1620,'LAKEWOOD0001','Lakewood Bicycle',1,1,1,NULL,'2012-01-28 18:30:00'),(1622,'SPEEDCO0001','Speed Corporation',1,1,1,NULL,'2012-02-01 18:30:00'),(1624,'COMPETIT0001','Competition Bike Training Systems',1,1,1,NULL,'2011-12-23 18:30:00'),(1626,'HILLBIC0001','Hill Bicycle Center',1,1,1,NULL,'2012-01-24 18:30:00'),(1628,'BICYCLE0001','Bicycle Specialists',1,1,1,NULL,'2011-12-22 18:30:00'),(1630,'INDIANA0001','Indiana Bicycle Center',1,1,1,NULL,'2012-02-01 18:30:00'),(1632,'SPORTFA0001','Sport Fan Co.',1,1,1,NULL,'2012-02-01 18:30:00'),(1634,'GMASKI0001','GMA Ski & Bike',1,1,1,NULL,'2011-05-08 18:30:00'),(1636,'INTEGRAT0001','Integrated Sport Products',1,1,1,NULL,'2012-01-16 18:30:00'),(1638,'INLINEA0001','Inline Accessories',1,1,1,NULL,'2012-01-24 18:30:00'),(1640,'LEGENDC0001','Legend Cycles',1,1,1,NULL,'2012-02-01 18:30:00'),(1642,'ELECTRON0001','Electronic Bike Co.',1,1,1,NULL,'2012-02-01 18:30:00'),(1644,'INTERNAT0003','International Sport Assoc.',1,1,1,NULL,'2012-01-24 18:30:00'),(1646,'ELECTRON0002','Electronic Bike Repair & Supplies',1,1,1,NULL,'2012-01-16 18:30:00'),(1648,'WIDEWOR0001','Wide World Importers',2,1,1,'www.wideworldimporters.com/','2012-01-16 18:30:00'),(1650,'AMERICAN0001','American Bicycles and Wheels',1,1,1,NULL,'2011-04-24 18:30:00'),(1652,'VICTORY0001','Victory Bikes',5,1,1,NULL,'2012-02-17 18:30:00'),(1654,'AMERICAN0002','American Bikes',1,1,1,NULL,'2011-05-08 18:30:00'),(1656,'MOUNTAIN0001','Mountain Works',1,0,1,NULL,'2012-02-01 18:30:00'),(1658,'CROWLEY0001','Crowley Sport',1,1,1,NULL,'2011-12-23 18:30:00'),(1660,'MAGICCY0001','Magic Cycles',1,1,1,NULL,'2012-01-24 18:30:00'),(1662,'NORTHERN0001','Northern Bike Travel',3,1,1,NULL,'2012-02-01 18:30:00'),(1664,'ANDERSON0001','Anderson\'s Custom Bikes',1,1,1,NULL,'2011-05-08 18:30:00'),(1666,'LEAFRIV0001','Leaf River Terrain',1,0,1,NULL,'2012-01-28 18:30:00'),(1668,'TOURING0001','Touring Equipment Center',1,1,1,NULL,'2012-02-02 18:30:00'),(1670,'HOLIDAY0001','Holiday Skate & Cycle',1,1,1,NULL,'2012-02-02 18:30:00'),(1672,'EXPERTB0001','Expert Bike Co',1,1,1,NULL,'2012-01-24 18:30:00'),(1674,'VARSITY0001','Varsity Sport Co.',1,1,1,NULL,'2012-02-17 18:30:00'),(1676,'TEAMATH0001','Team Athletic Co.',1,1,1,NULL,'2012-02-02 18:30:00'),(1678,'PROSE0001','Proseware, Inc.',4,0,0,'www.proseware.com/','2011-05-08 18:30:00'),(1680,'JACKSON0001','Jackson Authority',1,1,1,NULL,'2012-01-24 18:30:00'),(1682,'PREMIER0001','Premier Sport, Inc.',1,1,1,NULL,'2012-02-01 18:30:00'),(1684,'PROFESSI0001','Professional Athletic Consultants',1,1,1,NULL,'2012-02-01 18:30:00'),(1686,'PROSPOR0001','Pro Sport Industries',1,0,1,NULL,'2012-02-01 18:30:00'),(1688,'WOODFIT0001','Wood Fitness',1,1,1,NULL,'2012-02-17 18:30:00'),(1690,'BLOOMING0001','Bloomington Multisport',1,1,1,NULL,'2011-12-22 18:30:00'),(1692,'CARLSON0001','Carlson Specialties',2,1,1,NULL,'2011-12-23 18:30:00'),(1694,'COMPETE0002','Compete, Inc.',1,1,1,NULL,'2011-12-23 18:30:00'),(1696,'CHICAGO0001','Chicago City Saddles',1,1,1,NULL,'2011-12-23 18:30:00'),(1698,'BUSINESS0001','Business Equipment Center',2,1,1,NULL,'2011-12-22 18:30:00');
/*!40000 ALTER TABLE `purchasing_vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:13
