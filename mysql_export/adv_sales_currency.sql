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
-- Table structure for table `sales_currency`
--

DROP TABLE IF EXISTS `sales_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_currency` (
  `CurrencyCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'The ISO code for the Currency.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Currency name.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`CurrencyCode`),
  UNIQUE KEY `AK_Currency_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Lookup table containing standard ISO currencies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_currency`
--

LOCK TABLES `sales_currency` WRITE;
/*!40000 ALTER TABLE `sales_currency` DISABLE KEYS */;
INSERT INTO `sales_currency` VALUES ('AED','Emirati Dirham','2008-04-29 18:30:00'),('AFA','Afghani','2008-04-29 18:30:00'),('ALL','Lek','2008-04-29 18:30:00'),('AMD','Armenian Dram','2008-04-29 18:30:00'),('ANG','Netherlands Antillian Guilder','2008-04-29 18:30:00'),('AOA','Kwanza','2008-04-29 18:30:00'),('ARS','Argentine Peso','2008-04-29 18:30:00'),('ATS','Shilling','2008-04-29 18:30:00'),('AUD','Australian Dollar','2008-04-29 18:30:00'),('AWG','Aruban Guilder','2008-04-29 18:30:00'),('AZM','Azerbaijanian Manat','2008-04-29 18:30:00'),('BBD','Barbados Dollar','2008-04-29 18:30:00'),('BDT','Taka','2008-04-29 18:30:00'),('BEF','Belgian Franc','2008-04-29 18:30:00'),('BGN','Bulgarian Lev','2008-04-29 18:30:00'),('BHD','Bahraini Dinar','2008-04-29 18:30:00'),('BND','Brunei Dollar','2008-04-29 18:30:00'),('BOB','Boliviano','2008-04-29 18:30:00'),('BRL','Brazilian Real','2008-04-29 18:30:00'),('BSD','Bahamian Dollar','2008-04-29 18:30:00'),('BTN','Ngultrum','2008-04-29 18:30:00'),('CAD','Canadian Dollar','2008-04-29 18:30:00'),('CHF','Swiss Franc','2008-04-29 18:30:00'),('CLP','Chilean Peso','2008-04-29 18:30:00'),('CNY','Yuan Renminbi','2008-04-29 18:30:00'),('COP','Colombian Peso','2008-04-29 18:30:00'),('CRC','Costa Rican Colon','2008-04-29 18:30:00'),('CYP','Cyprus Pound','2008-04-29 18:30:00'),('CZK','Czech Koruna','2008-04-29 18:30:00'),('DEM','Deutsche Mark','2008-04-29 18:30:00'),('DKK','Danish Krone','2008-04-29 18:30:00'),('DOP','Dominican Peso','2008-04-29 18:30:00'),('DZD','Algerian Dinar','2008-04-29 18:30:00'),('EEK','Kroon','2008-04-29 18:30:00'),('EGP','Egyptian Pound','2008-04-29 18:30:00'),('ESP','Spanish Peseta','2008-04-29 18:30:00'),('EUR','EURO','2008-04-29 18:30:00'),('FIM','Markka','2008-04-29 18:30:00'),('FJD','Fiji Dollar','2008-04-29 18:30:00'),('FRF','French Franc','2008-04-29 18:30:00'),('GBP','United Kingdom Pound','2008-04-29 18:30:00'),('GHC','Cedi','2008-04-29 18:30:00'),('GRD','Drachma','2008-04-29 18:30:00'),('GTQ','Quetzal','2008-04-29 18:30:00'),('HKD','Hong Kong Dollar','2008-04-29 18:30:00'),('HRK','Croatian Kuna','2008-04-29 18:30:00'),('HUF','Forint','2008-04-29 18:30:00'),('IDR','Rupiah','2008-04-29 18:30:00'),('IEP','Irish Pound','2008-04-29 18:30:00'),('ILS','New Israeli Shekel','2008-04-29 18:30:00'),('INR','Indian Rupee','2008-04-29 18:30:00'),('ISK','Iceland Krona','2008-04-29 18:30:00'),('ITL','Italian Lira','2008-04-29 18:30:00'),('JMD','Jamaican Dollar','2008-04-29 18:30:00'),('JOD','Jordanian Dinar','2008-04-29 18:30:00'),('JPY','Yen','2008-04-29 18:30:00'),('KES','Kenyan Shilling','2008-04-29 18:30:00'),('KRW','Won','2008-04-29 18:30:00'),('KWD','Kuwaiti Dinar','2008-04-29 18:30:00'),('LBP','Lebanese Pound','2008-04-29 18:30:00'),('LKR','Sri Lankan Rupee','2008-04-29 18:30:00'),('LTL','Lithuanian Litas','2008-04-29 18:30:00'),('LVL','Latvian Lats','2008-04-29 18:30:00'),('MAD','Moroccan Dirham','2008-04-29 18:30:00'),('MTL','Maltese Lira','2008-04-29 18:30:00'),('MUR','Mauritius Rupee','2008-04-29 18:30:00'),('MVR','Rufiyaa','2008-04-29 18:30:00'),('MXN','Mexican Peso','2008-04-29 18:30:00'),('MYR','Malaysian Ringgit','2008-04-29 18:30:00'),('NAD','Namibia Dollar','2008-04-29 18:30:00'),('NGN','Naira','2008-04-29 18:30:00'),('NLG','Netherlands Guilder','2008-04-29 18:30:00'),('NOK','Norwegian Krone','2008-04-29 18:30:00'),('NPR','Nepalese Rupee','2008-04-29 18:30:00'),('NZD','New Zealand Dollar','2008-04-29 18:30:00'),('OMR','Omani Rial','2008-04-29 18:30:00'),('PAB','Balboa','2008-04-29 18:30:00'),('PEN','Nuevo Sol','2008-04-29 18:30:00'),('PHP','Philippine Peso','2008-04-29 18:30:00'),('PKR','Pakistan Rupee','2008-04-29 18:30:00'),('PLN','Zloty','2008-04-29 18:30:00'),('PLZ','Polish Zloty(old)','2008-04-29 18:30:00'),('PTE','Portuguese Escudo','2008-04-29 18:30:00'),('PYG','Guarani','2008-04-29 18:30:00'),('ROL','Leu','2008-04-29 18:30:00'),('RUB','Russian Ruble','2008-04-29 18:30:00'),('RUR','Russian Ruble(old)','2008-04-29 18:30:00'),('SAR','Saudi Riyal','2008-04-29 18:30:00'),('SEK','Swedish Krona','2008-04-29 18:30:00'),('SGD','Singapore Dollar','2008-04-29 18:30:00'),('SIT','Tolar','2008-04-29 18:30:00'),('SKK','Slovak Koruna','2008-04-29 18:30:00'),('SVC','El Salvador Colon','2008-04-29 18:30:00'),('THB','Baht','2008-04-29 18:30:00'),('TND','Tunisian Dinar','2008-04-29 18:30:00'),('TRL','Turkish Lira','2008-04-29 18:30:00'),('TTD','Trinidad and Tobago Dollar','2008-04-29 18:30:00'),('TWD','New Taiwan Dollar','2008-04-29 18:30:00'),('USD','US Dollar','2008-04-29 18:30:00'),('UYU','Uruguayan Peso','2008-04-29 18:30:00'),('VEB','Bolivar','2008-04-29 18:30:00'),('VND','Dong','2008-04-29 18:30:00'),('XOF','CFA Franc BCEAO','2008-04-29 18:30:00'),('ZAR','Rand','2008-04-29 18:30:00'),('ZWD','Zimbabwe Dollar','2008-04-29 18:30:00');
/*!40000 ALTER TABLE `sales_currency` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:40
