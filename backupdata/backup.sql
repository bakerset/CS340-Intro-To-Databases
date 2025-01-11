-- MariaDB dump 10.19  Distrib 10.5.22-MariaDB, for Linux (x86_64)
--
-- Host: classmysql.engr.oregonstate.edu    Database: cs340_bakerset
-- ------------------------------------------------------
-- Server version	10.6.19-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `InvoiceDetails`
--

DROP TABLE IF EXISTS `InvoiceDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceDetails` (
  `InvoiceDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) NOT NULL,
  `ProductNumber` varchar(50) NOT NULL,
  `OrderQty` int(11) NOT NULL,
  `UnitPrice` decimal(19,2) NOT NULL,
  `LineTotal` decimal(18,2) NOT NULL,
  PRIMARY KEY (`InvoiceDetailsID`),
  KEY `InvoiceID` (`InvoiceID`),
  KEY `ProductNumber` (`ProductNumber`),
  CONSTRAINT `InvoiceDetails_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `Invoices` (`InvoiceID`),
  CONSTRAINT `InvoiceDetails_ibfk_2` FOREIGN KEY (`ProductNumber`) REFERENCES `Products` (`ProductNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceDetails`
--

LOCK TABLES `InvoiceDetails` WRITE;
/*!40000 ALTER TABLE `InvoiceDetails` DISABLE KEYS */;
INSERT INTO `InvoiceDetails` VALUES (1,1,'BK-M68S-38',1,2319.99,2319.99),(2,1,'HL-U509-R',2,34.99,69.98),(3,2,'BK-R89B-52',1,2443.35,2443.35),(4,3,'BK-T79U-50',2,2145.66,4291.32),(5,3,'BK-R89B-52',2,2199.01,4398.02),(6,3,'HL-U509',2,31.49,62.98);
/*!40000 ALTER TABLE `InvoiceDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices`
--

DROP TABLE IF EXISTS `Invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices` (
  `InvoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceDate` date NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`InvoiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices`
--

LOCK TABLES `Invoices` WRITE;
/*!40000 ALTER TABLE `Invoices` DISABLE KEYS */;
INSERT INTO `Invoices` VALUES (1,'2023-10-01',1),(2,'2023-10-02',2),(3,'2023-10-03',3);
/*!40000 ALTER TABLE `Invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `ProductNumber` varchar(50) NOT NULL,
  `ProductName` varchar(50) DEFAULT NULL,
  `SafetyStockLevel` int(11) DEFAULT NULL,
  `ReorderPoint` int(11) DEFAULT NULL,
  `StandardCost` decimal(19,2) DEFAULT NULL,
  `ListPrice` decimal(19,2) DEFAULT NULL,
  `DaysToManufacture` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES ('BB-7421','LL Bottom Bracket',500,375,23.97,53.99,1),('BB-9108','HL Bottom Bracket',500,375,53.94,121.49,1),('BK-M18B-40','Mountain-500 Black, 40',100,75,294.58,539.99,4),('BK-M18B-42','Mountain-500 Black, 42',100,75,294.58,539.99,4),('BK-M18B-44','Mountain-500 Black, 44',100,75,294.58,539.99,4),('BK-M18B-48','Mountain-500 Black, 48',100,75,294.58,539.99,4),('BK-M18B-52','Mountain-500 Black, 52',100,75,294.58,539.99,4),('BK-M18S-40','Mountain-500 Silver, 40',100,75,308.22,564.99,4),('BK-M18S-42','Mountain-500 Silver, 42',100,75,308.22,564.99,4),('BK-M18S-44','Mountain-500 Silver, 44',100,75,308.22,564.99,4),('BK-M18S-48','Mountain-500 Silver, 48',100,75,308.22,564.99,4),('BK-M18S-52','Mountain-500 Silver, 52',100,75,308.22,564.99,4),('BK-M38S-38','Mountain-400-W Silver, 38',100,75,419.78,769.49,4),('BK-M38S-40','Mountain-400-W Silver, 40',100,75,419.78,769.49,4),('BK-M38S-42','Mountain-400-W Silver, 42',100,75,419.78,769.49,4),('BK-M38S-46','Mountain-400-W Silver, 46',100,75,419.78,769.49,4),('BK-M68B-38','Mountain-200 Black, 38',100,75,1251.98,2294.99,4),('BK-M68B-42','Mountain-200 Black, 42',100,75,1251.98,2294.99,4),('BK-M68B-46','Mountain-200 Black, 46',100,75,1251.98,2294.99,4),('BK-M68S-38','Mountain-200 Silver, 38',100,75,1265.62,2319.99,4),('BK-M68S-42','Mountain-200 Silver, 42',100,75,1265.62,2319.99,4),('BK-M68S-46','Mountain-200 Silver, 46',100,75,1265.62,2319.99,4),('BK-R19B-44','Road-750 Black, 44',100,75,343.65,539.99,4),('BK-R19B-48','Road-750 Black, 48',100,75,343.65,539.99,4),('BK-R19B-52','Road-750 Black, 52',100,75,343.65,539.99,4),('BK-R19B-58','Road-750 Black, 58',100,75,343.65,539.99,4),('BK-R64Y-38','Road-550-W Yellow, 38',100,75,713.08,1120.49,4),('BK-R64Y-40','Road-550-W Yellow, 40',100,75,713.08,1120.49,4),('BK-R64Y-42','Road-550-W Yellow, 42',100,75,713.08,1120.49,4),('BK-R64Y-44','Road-550-W Yellow, 44',100,75,713.08,1120.49,4),('BK-R64Y-48','Road-550-W Yellow, 48',100,75,713.08,1120.49,4),('BK-R79Y-40','Road-350-W Yellow, 40',100,75,1082.51,1700.99,4),('BK-R79Y-42','Road-350-W Yellow, 42',100,75,1082.51,1700.99,4),('BK-R79Y-44','Road-350-W Yellow, 44',100,75,1082.51,1700.99,4),('BK-R79Y-48','Road-350-W Yellow, 48',100,75,1082.51,1700.99,4),('BK-R89B-44','Road-250 Black, 44',100,75,1554.95,2443.35,4),('BK-R89B-48','Road-250 Black, 48',100,75,1554.95,2443.35,4),('BK-R89B-52','Road-250 Black, 52',100,75,1554.95,2443.35,4),('BK-R89B-58','Road-250 Black, 58',100,75,1554.95,2443.35,4),('BK-R89R-58','Road-250 Red, 58',100,75,1554.95,2443.35,4),('BK-T18U-44','Touring-3000 Blue, 44',100,75,461.44,742.35,4),('BK-T18U-50','Touring-3000 Blue, 50',100,75,461.44,742.35,4),('BK-T18U-54','Touring-3000 Blue, 54',100,75,461.44,742.35,4),('BK-T18U-58','Touring-3000 Blue, 58',100,75,461.44,742.35,4),('BK-T18U-62','Touring-3000 Blue, 62',100,75,461.44,742.35,4),('BK-T18Y-44','Touring-3000 Yellow, 44',100,75,461.44,742.35,4),('BK-T18Y-50','Touring-3000 Yellow, 50',100,75,461.44,742.35,4),('BK-T18Y-54','Touring-3000 Yellow, 54',100,75,461.44,742.35,4),('BK-T18Y-58','Touring-3000 Yellow, 58',100,75,461.44,742.35,4),('BK-T18Y-62','Touring-3000 Yellow, 62',100,75,461.44,742.35,4),('BK-T44U-46','Touring-2000 Blue, 46',100,75,755.15,1214.85,4),('BK-T44U-50','Touring-2000 Blue, 50',100,75,755.15,1214.85,4),('BK-T44U-54','Touring-2000 Blue, 54',100,75,755.15,1214.85,4),('BK-T44U-60','Touring-2000 Blue, 60',100,75,755.15,1214.85,4),('BK-T79U-46','Touring-1000 Blue, 46',100,75,1481.94,2384.07,4),('BK-T79U-50','Touring-1000 Blue, 50',100,75,1481.94,2384.07,4),('BK-T79U-54','Touring-1000 Blue, 54',100,75,1481.94,2384.07,4),('BK-T79U-60','Touring-1000 Blue, 60',100,75,1481.94,2384.07,4),('BK-T79Y-46','Touring-1000 Yellow, 46',100,75,1481.94,2384.07,4),('BK-T79Y-50','Touring-1000 Yellow, 50',100,75,1481.94,2384.07,4),('BK-T79Y-54','Touring-1000 Yellow, 54',100,75,1481.94,2384.07,4),('BK-T79Y-60','Touring-1000 Yellow, 60',100,75,1481.94,2384.07,4),('CA-1098','AWC Logo Cap',4,3,6.92,8.99,0),('CH-0234','Chain',500,375,8.99,20.24,1),('CL-9009','Bike Wash - Dissolver',4,3,2.97,7.95,0),('CS-4759','LL Crankset',500,375,77.92,175.49,1),('CS-9183','HL Crankset',500,375,179.82,404.99,1),('FB-9873','Front Brakes',500,375,47.29,106.50,1),('FD-2342','Front Derailleur',500,375,40.62,91.49,1),('FR-M21B-42','LL Mountain Frame - Black, 42',500,375,136.79,249.79,1),('FR-M21B-44','LL Mountain Frame - Black, 44',500,375,136.79,249.79,1),('FR-M21B-48','LL Mountain Frame - Black, 48',500,375,136.79,249.79,1),('FR-M21S-40','LL Mountain Frame - Silver, 40',500,375,144.59,264.05,2),('FR-M21S-42','LL Mountain Frame - Silver, 42',500,375,144.59,264.05,1),('FR-M21S-44','LL Mountain Frame - Silver, 44',500,375,144.59,264.05,1),('FR-M21S-52','LL Mountain Frame - Silver, 52',500,375,144.59,264.05,1),('FR-M63S-40','ML Mountain Frame-W - Silver, 40',500,375,199.38,364.09,1),('FR-M63S-42','ML Mountain Frame-W - Silver, 42',500,375,199.38,364.09,1),('FR-M63S-46','ML Mountain Frame-W - Silver, 46',500,375,199.38,364.09,1),('FR-M94B-38','HL Mountain Frame - Black, 38',500,375,739.04,1349.60,2),('FR-M94B-42','HL Mountain Frame - Black, 42',500,375,739.04,1349.60,1),('FR-M94S-38','HL Mountain Frame - Silver, 38',500,375,747.20,1364.50,2),('FR-M94S-42','HL Mountain Frame - Silver, 42',500,375,747.20,1364.50,1),('FR-M94S-46','HL Mountain Frame - Silver, 46',500,375,747.20,1364.50,1),('FR-R38B-52','LL Road Frame - Black, 52',500,375,204.63,337.22,1),('FR-R38B-58','LL Road Frame - Black, 58',500,375,204.63,337.22,1),('FR-R72Y-38','ML Road Frame-W - Yellow, 38',500,375,360.94,594.83,2),('FR-R72Y-44','ML Road Frame-W - Yellow, 44',500,375,360.94,594.83,1),('FR-R72Y-48','ML Road Frame-W - Yellow, 48',500,375,360.94,594.83,1),('FR-R92B-44','HL Road Frame - Black, 44',500,375,868.63,1431.50,1),('FR-R92R-44','HL Road Frame - Red, 44',500,375,868.63,1431.50,1),('FR-R92R-62','HL Road Frame - Red, 62',500,375,868.63,1431.50,1),('FR-T67U-50','LL Touring Frame - Blue, 50',500,375,199.85,333.42,1),('FR-T67U-54','LL Touring Frame - Blue, 54',500,375,199.85,333.42,1),('FR-T67Y-44','LL Touring Frame - Yellow, 44',500,375,199.85,333.42,1),('FR-T67Y-50','LL Touring Frame - Yellow, 50',500,375,199.85,333.42,1),('FR-T67Y-62','LL Touring Frame - Yellow, 62',500,375,199.85,333.42,1),('FR-T98U-46','HL Touring Frame - Blue, 46',500,375,601.74,1003.91,1),('FR-T98U-50','HL Touring Frame - Blue, 50',500,375,601.74,1003.91,1),('FR-T98U-54','HL Touring Frame - Blue, 54',500,375,601.74,1003.91,1),('FR-T98U-60','HL Touring Frame - Blue, 60',500,375,601.74,1003.91,1),('FR-T98Y-46','HL Touring Frame - Yellow, 46',500,375,601.74,1003.91,1),('FR-T98Y-50','HL Touring Frame - Yellow, 50',500,375,601.74,1003.91,1),('FR-T98Y-54','HL Touring Frame - Yellow, 54',500,375,601.74,1003.91,1),('FR-T98Y-60','HL Touring Frame - Yellow, 60',500,375,601.74,1003.91,1),('GL-H102-L','Half-Finger Gloves, L',4,3,9.16,24.49,0),('GL-H102-M','Half-Finger Gloves, M',4,3,9.16,24.49,0),('GL-H102-S','Half-Finger Gloves, S',4,3,9.16,24.49,0),('HB-M243','LL Mountain Handlebars',500,375,19.78,44.54,1),('HB-M763','ML Mountain Handlebars',500,375,27.49,61.92,1),('HB-M918','HL Mountain Handlebars',500,375,53.40,120.27,1),('HB-R956','HL Road Handlebars',500,375,53.40,120.27,1),('HB-T928','HL Touring Handlebars',500,375,40.66,91.57,1),('HL-U509','Sport-100 Helmet, Black',4,3,13.09,34.99,0),('HL-U509-B','Sport-100 Helmet, Blue',4,3,13.09,34.99,0),('HL-U509-R','Sport-100 Helmet, Red',4,3,13.09,34.99,0),('HY-1023-70','Hydration Pack - 70 oz.',4,3,20.57,54.99,0),('LJ-0192-L','Long-Sleeve Logo Jersey, L',4,3,38.49,49.99,0),('LJ-0192-M','Long-Sleeve Logo Jersey, M',4,3,38.49,49.99,0),('LJ-0192-X','Long-Sleeve Logo Jersey, XL',4,3,38.49,49.99,0),('PD-M282','LL Mountain Pedal',500,375,17.98,40.49,1),('PD-M340','ML Mountain Pedal',500,375,27.57,62.09,1),('PD-M562','HL Mountain Pedal',500,375,35.96,80.99,1),('PD-R347','LL Road Pedal',500,375,17.98,40.49,1),('PD-R563','ML Road Pedal',500,375,27.57,62.09,1),('PD-R853','HL Road Pedal',500,375,35.96,80.99,1),('PD-T852','Touring Pedal',500,375,35.96,80.99,1),('PK-7098','Patch Kit/8 Patches',4,3,0.86,2.29,0),('RA-H123','Hitch Rack - 4-Bike',4,3,44.88,120.00,0),('RB-9231','Rear Brakes',500,375,47.29,106.50,1),('RD-2308','Rear Derailleur',500,375,53.93,121.46,1),('SE-M236','LL Mountain Seat/Saddle',500,375,12.04,27.12,1),('SE-M798','ML Mountain Seat/Saddle',500,375,17.38,39.14,1),('SE-M940','HL Mountain Seat/Saddle',500,375,23.37,52.64,1),('SE-R995','HL Road Seat/Saddle',500,375,23.37,52.64,1),('SE-T924','HL Touring Seat/Saddle',500,375,23.37,52.64,1),('SH-W890-L','Women\'s Mountain Shorts, L',4,3,26.18,69.99,0),('SH-W890-M','Women\'s Mountain Shorts, M',4,3,26.18,69.99,0),('SH-W890-S','Women\'s Mountain Shorts, S',4,3,26.18,69.99,0),('SJ-0194-L','Short-Sleeve Classic Jersey, L',4,3,41.57,53.99,0),('SJ-0194-S','Short-Sleeve Classic Jersey, S',4,3,41.57,53.99,0),('SJ-0194-X','Short-Sleeve Classic Jersey, XL',4,3,41.57,53.99,0),('SO-R809-L','Racing Socks, L',4,3,3.36,8.99,0),('SO-R809-M','Racing Socks, M',4,3,3.36,8.99,0),('VE-C304-M','Classic Vest, M',4,3,23.75,63.50,0),('VE-C304-S','Classic Vest, S',4,3,23.75,63.50,0),('WB-H098','Water Bottle - 30 oz.',4,3,1.87,4.99,0);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsg_cert`
--

DROP TABLE IF EXISTS `bsg_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsg_cert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsg_cert`
--

LOCK TABLES `bsg_cert` WRITE;
/*!40000 ALTER TABLE `bsg_cert` DISABLE KEYS */;
INSERT INTO `bsg_cert` VALUES (1,'Raptor'),(2,'Viper'),(3,'Mechanic'),(4,'Command');
/*!40000 ALTER TABLE `bsg_cert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsg_cert_people`
--

DROP TABLE IF EXISTS `bsg_cert_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsg_cert_people` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `bsg_cert_people_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `bsg_cert` (`id`),
  CONSTRAINT `bsg_cert_people_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `bsg_people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsg_cert_people`
--

LOCK TABLES `bsg_cert_people` WRITE;
/*!40000 ALTER TABLE `bsg_cert_people` DISABLE KEYS */;
INSERT INTO `bsg_cert_people` VALUES (2,2),(3,8),(4,2),(4,6);
/*!40000 ALTER TABLE `bsg_cert_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsg_people`
--

DROP TABLE IF EXISTS `bsg_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsg_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `homeworld` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `homeworld` (`homeworld`),
  CONSTRAINT `bsg_people_ibfk_1` FOREIGN KEY (`homeworld`) REFERENCES `bsg_planets` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsg_people`
--

LOCK TABLES `bsg_people` WRITE;
/*!40000 ALTER TABLE `bsg_people` DISABLE KEYS */;
INSERT INTO `bsg_people` VALUES (1,'William','Adama',3,62),(2,'Lee','Adama',3,30),(6,'Saul','Tigh',NULL,71),(8,'Galen','Tyrol',1,32);
/*!40000 ALTER TABLE `bsg_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsg_planets`
--

DROP TABLE IF EXISTS `bsg_planets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsg_planets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `population` bigint(20) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsg_planets`
--

LOCK TABLES `bsg_planets` WRITE;
/*!40000 ALTER TABLE `bsg_planets` DISABLE KEYS */;
INSERT INTO `bsg_planets` VALUES (1,'Gemenon',2800000000,'Old Gemenese','Oranu'),(2,'Leonis',2600000000,'Leonese','Luminere'),(3,'Caprica',4900000000,'Caprican','Caprica City'),(7,'Sagittaron',1700000000,NULL,'Tawa'),(16,'Aquaria',25000,NULL,NULL),(17,'Canceron',6700000000,NULL,'Hades'),(18,'Libran',2100000,NULL,NULL),(19,'Picon',1400000000,NULL,'Queestown'),(20,'Scorpia',450000000,NULL,'Celeste'),(21,'Tauron',2500000000,'Tauron','Hypatia'),(22,'Virgon',4300000000,NULL,'Boskirk'),(28,'Mars',2,'Binary','Olympus Mons');
/*!40000 ALTER TABLE `bsg_planets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsg_spaceship`
--

DROP TABLE IF EXISTS `bsg_spaceship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsg_spaceship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `separate_saucer_section` tinyint(1) DEFAULT 0,
  `length` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsg_spaceship`
--

LOCK TABLES `bsg_spaceship` WRITE;
/*!40000 ALTER TABLE `bsg_spaceship` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsg_spaceship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `full_name` (`first_name`,`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Sara','Smith','smiths@hello.com'),(2,'Miguel','Cabrera','mc@hello.com'),(3,'Bo','Chan\'g','bochang@hello.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostic`
--

DROP TABLE IF EXISTS `diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnostic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic`
--

LOCK TABLES `diagnostic` WRITE;
/*!40000 ALTER TABLE `diagnostic` DISABLE KEYS */;
INSERT INTO `diagnostic` VALUES (1,'MySQL is working for bakerset!');
/*!40000 ALTER TABLE `diagnostic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `full_name` (`first_name`,`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Ananya','Jaiswal','2008-04-10','ajaiswal@hello.com'),(2,'Michael','Fern','2015-07-19','michaelf@hello.com'),(3,'Abdul','Rehman','2018-02-27','rehman@hello.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comments` text DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `cid` (`cid`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Diamond','Should be done by Jan 2019',1),(2,'Chan\'g','Ongoing maintenance',3),(3,'The Robinson Project',NULL,2);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_on` (
  `pid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `due_date` date NOT NULL,
  PRIMARY KEY (`eid`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `project` (`id`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES (2,1,'2020-11-19'),(3,2,'2020-12-05'),(1,3,'2021-01-01');
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-18 15:04:06
