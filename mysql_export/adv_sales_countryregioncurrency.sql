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
-- Table structure for table `sales_countryregioncurrency`
--

DROP TABLE IF EXISTS `sales_countryregioncurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_countryregioncurrency` (
  `CountryRegionCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ISO code for countries and regions. Foreign key to CountryRegion.CountryRegionCode.',
  `CurrencyCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ISO standard currency code. Foreign key to Currency.CurrencyCode.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`CountryRegionCode`,`CurrencyCode`),
  KEY `IX_CountryRegionCurrency_CurrencyCode` (`CurrencyCode`),
  CONSTRAINT `FK_CountryRegionCurrency_CountryRegion_CountryRegionCode` FOREIGN KEY (`CountryRegionCode`) REFERENCES `person_countryregion` (`CountryRegionCode`),
  CONSTRAINT `FK_CountryRegionCurrency_Currency_CurrencyCode` FOREIGN KEY (`CurrencyCode`) REFERENCES `sales_currency` (`CurrencyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping ISO currency codes to a country or region.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_countryregioncurrency`
--

LOCK TABLES `sales_countryregioncurrency` WRITE;
/*!40000 ALTER TABLE `sales_countryregioncurrency` DISABLE KEYS */;
INSERT INTO `sales_countryregioncurrency` VALUES ('AE','AED','2014-02-08 04:47:22'),('AR','ARS','2014-02-08 04:47:22'),('AT','ATS','2014-02-08 04:47:22'),('AT','EUR','2008-04-29 18:30:00'),('AU','AUD','2014-02-08 04:47:22'),('BB','BBD','2014-02-08 04:47:22'),('BD','BDT','2014-02-08 04:47:22'),('BE','BEF','2014-02-08 04:47:22'),('BE','EUR','2008-04-29 18:30:00'),('BG','BGN','2014-02-08 04:47:22'),('BH','BHD','2014-02-08 04:47:22'),('BN','BND','2014-02-08 04:47:22'),('BO','BOB','2014-02-08 04:47:22'),('BR','BRL','2014-02-08 04:47:22'),('BS','BSD','2014-02-08 04:47:22'),('BT','BTN','2014-02-08 04:47:22'),('CA','CAD','2014-02-08 04:47:22'),('CH','CHF','2014-02-08 04:47:22'),('CL','CLP','2014-02-08 04:47:22'),('CN','CNY','2014-02-08 04:47:22'),('CO','COP','2014-02-08 04:47:22'),('CR','CRC','2014-02-08 04:47:22'),('CY','CYP','2014-02-08 04:47:22'),('CZ','CZK','2014-02-08 04:47:22'),('DE','DEM','2014-02-08 04:47:22'),('DE','EUR','2014-02-08 04:47:22'),('DK','DKK','2014-02-08 04:47:22'),('DO','DOP','2014-02-08 04:47:22'),('DZ','DZD','2014-02-08 04:47:22'),('EC','USD','2014-02-08 04:47:22'),('EE','EEK','2014-02-08 04:47:22'),('EG','EGP','2014-02-08 04:47:22'),('ES','ESP','2014-02-08 04:47:22'),('ES','EUR','2008-04-29 18:30:00'),('FI','EUR','2008-04-29 18:30:00'),('FI','FIM','2014-02-08 04:47:22'),('FJ','FJD','2014-02-08 04:47:22'),('FR','EUR','2014-02-08 04:47:22'),('FR','FRF','2014-02-08 04:47:22'),('GB','GBP','2014-02-08 04:47:22'),('GH','GHC','2014-02-08 04:47:22'),('GR','EUR','2008-04-29 18:30:00'),('GR','GRD','2014-02-08 04:47:22'),('GT','GTQ','2014-02-08 04:47:22'),('HK','HKD','2014-02-08 04:47:22'),('HR','HRK','2014-02-08 04:47:22'),('HU','HUF','2014-02-08 04:47:22'),('ID','IDR','2014-02-08 04:47:22'),('IE','EUR','2008-04-29 18:30:00'),('IE','IEP','2014-02-08 04:47:22'),('IL','ILS','2014-02-08 04:47:22'),('IN','INR','2014-02-08 04:47:22'),('IS','ISK','2014-02-08 04:47:22'),('IT','EUR','2008-04-29 18:30:00'),('IT','ITL','2014-02-08 04:47:22'),('JM','JMD','2014-02-08 04:47:22'),('JO','JOD','2014-02-08 04:47:22'),('JP','JPY','2014-02-08 04:47:22'),('KE','KES','2014-02-08 04:47:22'),('KR','KRW','2014-02-08 04:47:22'),('KW','KWD','2014-02-08 04:47:22'),('LB','LBP','2014-02-08 04:47:22'),('LK','LKR','2014-02-08 04:47:22'),('LT','LTL','2014-02-08 04:47:22'),('LU','EUR','2008-04-29 18:30:00'),('LV','LVL','2014-02-08 04:47:22'),('MA','MAD','2014-02-08 04:47:22'),('MT','MTL','2014-02-08 04:47:22'),('MU','MUR','2014-02-08 04:47:22'),('MV','MVR','2014-02-08 04:47:22'),('MX','MXN','2014-02-08 04:47:22'),('MY','MYR','2014-02-08 04:47:22'),('NA','NAD','2014-02-08 04:47:22'),('NG','NGN','2014-02-08 04:47:22'),('NL','EUR','2008-04-29 18:30:00'),('NL','NLG','2014-02-08 04:47:22'),('NO','NOK','2014-02-08 04:47:22'),('NP','NPR','2014-02-08 04:47:22'),('NZ','NZD','2014-02-08 04:47:22'),('OM','OMR','2014-02-08 04:47:22'),('PA','PAB','2014-02-08 04:47:22'),('PE','PEN','2014-02-08 04:47:22'),('PH','PHP','2014-02-08 04:47:22'),('PK','PKR','2014-02-08 04:47:22'),('PL','PLN','2014-02-08 04:47:22'),('PL','PLZ','2014-02-08 04:47:22'),('PT','EUR','2008-04-29 18:30:00'),('PT','PTE','2014-02-08 04:47:22'),('PY','PYG','2014-02-08 04:47:22'),('RO','ROL','2014-02-08 04:47:22'),('RU','RUB','2014-02-08 04:47:22'),('RU','RUR','2014-02-08 04:47:22'),('SA','SAR','2014-02-08 04:47:22'),('SE','SEK','2014-02-08 04:47:22'),('SG','SGD','2014-02-08 04:47:22'),('SI','SIT','2014-02-08 04:47:22'),('SK','SKK','2014-02-08 04:47:22'),('SV','SVC','2014-02-08 04:47:22'),('TH','THB','2014-02-08 04:47:22'),('TN','TND','2014-02-08 04:47:22'),('TR','TRL','2014-02-08 04:47:22'),('TT','TTD','2014-02-08 04:47:22'),('TW','TWD','2014-02-08 04:47:22'),('US','USD','2014-02-08 04:47:22'),('UY','UYU','2014-02-08 04:47:22'),('VE','VEB','2014-02-08 04:47:22'),('VN','VND','2014-02-08 04:47:22'),('ZA','ZAR','2014-02-08 04:47:22'),('ZW','ZWD','2014-02-08 04:47:22');
/*!40000 ALTER TABLE `sales_countryregioncurrency` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14 12:31:10
