-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: databases2021
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access` (
  `NFC_ID` int NOT NULL,
  `SpaceID` int NOT NULL,
  `Open Date-time` datetime NOT NULL,
  `Closed Date-time` datetime NOT NULL,
  `fully` int NOT NULL,
  KEY `NFC ID_idx` (`NFC_ID`),
  KEY `SpaceID_idx` (`SpaceID`),
  CONSTRAINT `NFC ID_access_table` FOREIGN KEY (`NFC_ID`) REFERENCES `customers` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SpaceID_access_table` FOREIGN KEY (`SpaceID`) REFERENCES `places` (`SpaceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge of service`
--

DROP TABLE IF EXISTS `charge of service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge of service` (
  `NFC_ID` int NOT NULL,
  `ServiceID` int NOT NULL,
  `charge Date-time` datetime NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `charge` float NOT NULL,
  KEY `NFC ID_idx` (`NFC_ID`),
  KEY `SereviceID_idx` (`ServiceID`),
  CONSTRAINT `NFC ID_charge_of_service` FOREIGN KEY (`NFC_ID`) REFERENCES `customers` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SereviceID_charge_of_service` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge of service`
--

LOCK TABLES `charge of service` WRITE;
/*!40000 ALTER TABLE `charge of service` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge of service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `NFC_ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `BirthDate` varchar(45) NOT NULL,
  `doc_num` int NOT NULL,
  `doc_type` varchar(45) NOT NULL,
  `IssuingAuthority` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `arrival` datetime NOT NULL,
  `departure` datetime NOT NULL,
  PRIMARY KEY (`NFC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_emails`
--

DROP TABLE IF EXISTS `customers_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_emails` (
  `NFC_ID` int NOT NULL,
  `email` varchar(45) NOT NULL,
  KEY `NFC ID_idx` (`NFC_ID`),
  CONSTRAINT `NFC_ID_table_emails` FOREIGN KEY (`NFC_ID`) REFERENCES `customers` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_emails`
--

LOCK TABLES `customers_emails` WRITE;
/*!40000 ALTER TABLE `customers_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_phones`
--

DROP TABLE IF EXISTS `customers_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_phones` (
  `NFC_ID` int NOT NULL,
  `phone` varchar(12) NOT NULL,
  KEY `NFC ID_customers_phones_idx` (`NFC_ID`),
  CONSTRAINT `NFC_ID_customers_phones` FOREIGN KEY (`NFC_ID`) REFERENCES `customers` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_phones`
--

LOCK TABLES `customers_phones` WRITE;
/*!40000 ALTER TABLE `customers_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_services`
--

DROP TABLE IF EXISTS `default_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_services` (
  `ServiceID` int NOT NULL,
  `stars` int DEFAULT NULL,
  KEY `ServiceID_idx` (`ServiceID`),
  CONSTRAINT `ServiceID_deafault_services_table` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_services`
--

LOCK TABLES `default_services` WRITE;
/*!40000 ALTER TABLE `default_services` DISABLE KEYS */;
INSERT INTO `default_services` VALUES (1,5),(2,5),(3,3);
/*!40000 ALTER TABLE `default_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll_in`
--

DROP TABLE IF EXISTS `enroll_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll_in` (
  `NFC_ID` int NOT NULL,
  `Service_ID` int NOT NULL,
  `Date_time` datetime NOT NULL,
  KEY `NFC ID_idx` (`NFC_ID`),
  KEY `ServiceID_idx` (`Service_ID`),
  CONSTRAINT `NFC ID_enrolled_in` FOREIGN KEY (`NFC_ID`) REFERENCES `customers` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ServiceID_enrolled_in` FOREIGN KEY (`Service_ID`) REFERENCES `enrolled_services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll_in`
--

LOCK TABLES `enroll_in` WRITE;
/*!40000 ALTER TABLE `enroll_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `enroll_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_services`
--

DROP TABLE IF EXISTS `enrolled_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled_services` (
  `ServiceID` int NOT NULL,
  `enroll price` float NOT NULL,
  KEY `ServiceID_idx` (`ServiceID`),
  CONSTRAINT `ServiceID_enrolled_services` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_services`
--

LOCK TABLES `enrolled_services` WRITE;
/*!40000 ALTER TABLE `enrolled_services` DISABLE KEYS */;
INSERT INTO `enrolled_services` VALUES (4,700.675),(5,86.9284),(6,526.434);
/*!40000 ALTER TABLE `enrolled_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `SpaceID` int NOT NULL,
  `SpaceName` varchar(45) NOT NULL,
  `ailse` varchar(1) DEFAULT NULL,
  `elevator` varchar(45) DEFAULT NULL,
  `groundfloor` tinyint DEFAULT NULL,
  `number_of_beds` int NOT NULL,
  PRIMARY KEY (`SpaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (0,'room 000','W','1',NULL,1),(1,'room 001','W','1',NULL,1),(2,'room 002','W','1',NULL,1),(3,'room 003','W','1',NULL,1),(4,'room 004','W','1',NULL,1),(5,'room 005','W','1',NULL,1),(6,'room 006','W','1',NULL,1),(7,'room 007','W','1',NULL,1),(8,'room 008','W','1',NULL,1),(9,'room 009','W','1',NULL,1),(10,'room 010','W','1',NULL,1),(11,'room 011','W','1',NULL,1),(12,'room 012','W','1',NULL,1),(13,'room 013','W','1',NULL,1),(14,'room 014','W','1',NULL,1),(15,'room 015','W','1',NULL,1),(16,'room 016','W','1',NULL,1),(17,'room 017','W','1',NULL,1),(18,'room 018','W','1',NULL,1),(19,'room 019','W','1',NULL,1),(20,'room 020','W','1',NULL,1),(21,'room 021','W','1',NULL,1),(22,'room 022','W','1',NULL,1),(23,'room 023','W','1',NULL,1),(24,'room 024','W','1',NULL,1),(25,'room 025','E','2',NULL,2),(26,'room 026','E','2',NULL,2),(27,'room 027','E','2',NULL,2),(28,'room 028','E','2',NULL,2),(29,'room 029','E','2',NULL,2),(30,'room 030','E','2',NULL,2),(31,'room 031','E','2',NULL,2),(32,'room 032','E','2',NULL,2),(33,'room 033','E','2',NULL,2),(34,'room 034','E','2',NULL,2),(35,'room 035','E','2',NULL,2),(36,'room 036','E','2',NULL,2),(37,'room 037','E','2',NULL,2),(38,'room 038','E','2',NULL,2),(39,'room 039','E','2',NULL,2),(40,'room 040','E','2',NULL,2),(41,'room 041','E','2',NULL,2),(42,'room 042','E','2',NULL,2),(43,'room 043','E','2',NULL,2),(44,'room 044','E','2',NULL,2),(45,'room 045','E','2',NULL,2),(46,'room 046','E','2',NULL,2),(47,'room 047','E','2',NULL,2),(48,'room 048','E','2',NULL,2),(49,'room 049','E','2',NULL,2),(50,'room 050','S','3',NULL,3),(51,'room 051','S','3',NULL,3),(52,'room 052','S','3',NULL,3),(53,'room 053','S','3',NULL,3),(54,'room 054','S','3',NULL,3),(55,'room 055','S','3',NULL,3),(56,'room 056','S','3',NULL,3),(57,'room 057','S','3',NULL,3),(58,'room 058','S','3',NULL,3),(59,'room 059','S','3',NULL,3),(60,'room 060','S','3',NULL,3),(61,'room 061','S','3',NULL,3),(62,'room 062','S','3',NULL,3),(63,'room 063','S','3',NULL,3),(64,'room 064','S','3',NULL,3),(65,'room 065','S','3',NULL,3),(66,'room 066','S','3',NULL,3),(67,'room 067','S','3',NULL,3),(68,'room 068','S','3',NULL,3),(69,'room 069','S','3',NULL,3),(70,'room 070','S','3',NULL,3),(71,'room 071','S','3',NULL,3),(72,'room 072','S','3',NULL,3),(73,'room 073','S','3',NULL,3),(74,'room 074','S','3',NULL,3),(75,'room 075','N','4',NULL,4),(76,'room 076','N','4',NULL,4),(77,'room 077','N','4',NULL,4),(78,'room 078','N','4',NULL,4),(79,'room 079','N','4',NULL,4),(80,'room 080','N','4',NULL,4),(81,'room 081','N','4',NULL,4),(82,'room 082','N','4',NULL,4),(83,'room 083','N','4',NULL,4),(84,'room 084','N','4',NULL,4),(85,'room 085','N','4',NULL,4),(86,'room 086','N','4',NULL,4),(87,'room 087','N','4',NULL,4),(88,'room 088','N','4',NULL,4),(89,'room 089','N','4',NULL,4),(90,'room 090','N','4',NULL,4),(91,'room 091','N','4',NULL,4),(92,'room 092','N','4',NULL,4),(93,'room 093','N','4',NULL,4),(94,'room 094','N','4',NULL,4),(95,'room 095','N','4',NULL,4),(96,'room 096','N','4',NULL,4),(97,'room 097','N','4',NULL,4),(98,'room 098','N','4',NULL,4),(99,'room 099','N','4',NULL,4),(100,'room 100','W','1',NULL,1),(101,'room 101','W','1',NULL,1),(102,'room 102','W','1',NULL,1),(103,'room 103','W','1',NULL,1),(104,'room 104','W','1',NULL,1),(105,'room 105','W','1',NULL,1),(106,'room 106','W','1',NULL,1),(107,'room 107','W','1',NULL,1),(108,'room 108','W','1',NULL,1),(109,'room 109','W','1',NULL,1),(110,'room 110','W','1',NULL,1),(111,'room 111','W','1',NULL,1),(112,'room 112','W','1',NULL,1),(113,'room 113','W','1',NULL,1),(114,'room 114','W','1',NULL,1),(115,'room 115','W','1',NULL,1),(116,'room 116','W','1',NULL,1),(117,'room 117','W','1',NULL,1),(118,'room 118','W','1',NULL,1),(119,'room 119','W','1',NULL,1),(120,'room 120','W','1',NULL,1),(121,'room 121','W','1',NULL,1),(122,'room 122','W','1',NULL,1),(123,'room 123','W','1',NULL,1),(124,'room 124','W','1',NULL,1),(125,'room 125','E','2',NULL,2),(126,'room 126','E','2',NULL,2),(127,'room 127','E','2',NULL,2),(128,'room 128','E','2',NULL,2),(129,'room 129','E','2',NULL,2),(130,'room 130','E','2',NULL,2),(131,'room 131','E','2',NULL,2),(132,'room 132','E','2',NULL,2),(133,'room 133','E','2',NULL,2),(134,'room 134','E','2',NULL,2),(135,'room 135','E','2',NULL,2),(136,'room 136','E','2',NULL,2),(137,'room 137','E','2',NULL,2),(138,'room 138','E','2',NULL,2),(139,'room 139','E','2',NULL,2),(140,'room 140','E','2',NULL,2),(141,'room 141','E','2',NULL,2),(142,'room 142','E','2',NULL,2),(143,'room 143','E','2',NULL,2),(144,'room 144','E','2',NULL,2),(145,'room 145','E','2',NULL,2),(146,'room 146','E','2',NULL,2),(147,'room 147','E','2',NULL,2),(148,'room 148','E','2',NULL,2),(149,'room 149','E','2',NULL,2),(150,'room 150','S','3',NULL,3),(151,'room 151','S','3',NULL,3),(152,'room 152','S','3',NULL,3),(153,'room 153','S','3',NULL,3),(154,'room 154','S','3',NULL,3),(155,'room 155','S','3',NULL,3),(156,'room 156','S','3',NULL,3),(157,'room 157','S','3',NULL,3),(158,'room 158','S','3',NULL,3),(159,'room 159','S','3',NULL,3),(160,'room 160','S','3',NULL,3),(161,'room 161','S','3',NULL,3),(162,'room 162','S','3',NULL,3),(163,'room 163','S','3',NULL,3),(164,'room 164','S','3',NULL,3),(165,'room 165','S','3',NULL,3),(166,'room 166','S','3',NULL,3),(167,'room 167','S','3',NULL,3),(168,'room 168','S','3',NULL,3),(169,'room 169','S','3',NULL,3),(170,'room 170','S','3',NULL,3),(171,'room 171','S','3',NULL,3),(172,'room 172','S','3',NULL,3),(173,'room 173','S','3',NULL,3),(174,'room 174','S','3',NULL,3),(175,'room 175','N','4',NULL,4),(176,'room 176','N','4',NULL,4),(177,'room 177','N','4',NULL,4),(178,'room 178','N','4',NULL,4),(179,'room 179','N','4',NULL,4),(180,'room 180','N','4',NULL,4),(181,'room 181','N','4',NULL,4),(182,'room 182','N','4',NULL,4),(183,'room 183','N','4',NULL,4),(184,'room 184','N','4',NULL,4),(185,'room 185','N','4',NULL,4),(186,'room 186','N','4',NULL,4),(187,'room 187','N','4',NULL,4),(188,'room 188','N','4',NULL,4),(189,'room 189','N','4',NULL,4),(190,'room 190','N','4',NULL,4),(191,'room 191','N','4',NULL,4),(192,'room 192','N','4',NULL,4),(193,'room 193','N','4',NULL,4),(194,'room 194','N','4',NULL,4),(195,'room 195','N','4',NULL,4),(196,'room 196','N','4',NULL,4),(197,'room 197','N','4',NULL,4),(198,'room 198','N','4',NULL,4),(199,'room 199','N','4',NULL,4),(200,'room 200','W','1',NULL,1),(201,'room 201','W','1',NULL,1),(202,'room 202','W','1',NULL,1),(203,'room 203','W','1',NULL,1),(204,'room 204','W','1',NULL,1),(205,'room 205','W','1',NULL,1),(206,'room 206','W','1',NULL,1),(207,'room 207','W','1',NULL,1),(208,'room 208','W','1',NULL,1),(209,'room 209','W','1',NULL,1),(210,'room 210','W','1',NULL,1),(211,'room 211','W','1',NULL,1),(212,'room 212','W','1',NULL,1),(213,'room 213','W','1',NULL,1),(214,'room 214','W','1',NULL,1),(215,'room 215','W','1',NULL,1),(216,'room 216','W','1',NULL,1),(217,'room 217','W','1',NULL,1),(218,'room 218','W','1',NULL,1),(219,'room 219','W','1',NULL,1),(220,'room 220','W','1',NULL,1),(221,'room 221','W','1',NULL,1),(222,'room 222','W','1',NULL,1),(223,'room 223','W','1',NULL,1),(224,'room 224','W','1',NULL,1),(225,'room 225','E','2',NULL,2),(226,'room 226','E','2',NULL,2),(227,'room 227','E','2',NULL,2),(228,'room 228','E','2',NULL,2),(229,'room 229','E','2',NULL,2),(230,'room 230','E','2',NULL,2),(231,'room 231','E','2',NULL,2),(232,'room 232','E','2',NULL,2),(233,'room 233','E','2',NULL,2),(234,'room 234','E','2',NULL,2),(235,'room 235','E','2',NULL,2),(236,'room 236','E','2',NULL,2),(237,'room 237','E','2',NULL,2),(238,'room 238','E','2',NULL,2),(239,'room 239','E','2',NULL,2),(240,'room 240','E','2',NULL,2),(241,'room 241','E','2',NULL,2),(242,'room 242','E','2',NULL,2),(243,'room 243','E','2',NULL,2),(244,'room 244','E','2',NULL,2),(245,'room 245','E','2',NULL,2),(246,'room 246','E','2',NULL,2),(247,'room 247','E','2',NULL,2),(248,'room 248','E','2',NULL,2),(249,'room 249','E','2',NULL,2),(250,'room 250','S','3',NULL,3),(251,'room 251','S','3',NULL,3),(252,'room 252','S','3',NULL,3),(253,'room 253','S','3',NULL,3),(254,'room 254','S','3',NULL,3),(255,'room 255','S','3',NULL,3),(256,'room 256','S','3',NULL,3),(257,'room 257','S','3',NULL,3),(258,'room 258','S','3',NULL,3),(259,'room 259','S','3',NULL,3),(260,'room 260','S','3',NULL,3),(261,'room 261','S','3',NULL,3),(262,'room 262','S','3',NULL,3),(263,'room 263','S','3',NULL,3),(264,'room 264','S','3',NULL,3),(265,'room 265','S','3',NULL,3),(266,'room 266','S','3',NULL,3),(267,'room 267','S','3',NULL,3),(268,'room 268','S','3',NULL,3),(269,'room 269','S','3',NULL,3),(270,'room 270','S','3',NULL,3),(271,'room 271','S','3',NULL,3),(272,'room 272','S','3',NULL,3),(273,'room 273','S','3',NULL,3),(274,'room 274','S','3',NULL,3),(275,'room 275','N','4',NULL,4),(276,'room 276','N','4',NULL,4),(277,'room 277','N','4',NULL,4),(278,'room 278','N','4',NULL,4),(279,'room 279','N','4',NULL,4),(280,'room 280','N','4',NULL,4),(281,'room 281','N','4',NULL,4),(282,'room 282','N','4',NULL,4),(283,'room 283','N','4',NULL,4),(284,'room 284','N','4',NULL,4),(285,'room 285','N','4',NULL,4),(286,'room 286','N','4',NULL,4),(287,'room 287','N','4',NULL,4),(288,'room 288','N','4',NULL,4),(289,'room 289','N','4',NULL,4),(290,'room 290','N','4',NULL,4),(291,'room 291','N','4',NULL,4),(292,'room 292','N','4',NULL,4),(293,'room 293','N','4',NULL,4),(294,'room 294','N','4',NULL,4),(295,'room 295','N','4',NULL,4),(296,'room 296','N','4',NULL,4),(297,'room 297','N','4',NULL,4),(298,'room 298','N','4',NULL,4),(299,'room 299','N','4',NULL,4),(300,'room 300','W','1',NULL,1),(301,'room 301','W','1',NULL,1),(302,'room 302','W','1',NULL,1),(303,'room 303','W','1',NULL,1),(304,'room 304','W','1',NULL,1),(305,'room 305','W','1',NULL,1),(306,'room 306','W','1',NULL,1),(307,'room 307','W','1',NULL,1),(308,'room 308','W','1',NULL,1),(309,'room 309','W','1',NULL,1),(310,'room 310','W','1',NULL,1),(311,'room 311','W','1',NULL,1),(312,'room 312','W','1',NULL,1),(313,'room 313','W','1',NULL,1),(314,'room 314','W','1',NULL,1),(315,'room 315','W','1',NULL,1),(316,'room 316','W','1',NULL,1),(317,'room 317','W','1',NULL,1),(318,'room 318','W','1',NULL,1),(319,'room 319','W','1',NULL,1),(320,'room 320','W','1',NULL,1),(321,'room 321','W','1',NULL,1),(322,'room 322','W','1',NULL,1),(323,'room 323','W','1',NULL,1),(324,'room 324','W','1',NULL,1),(325,'room 325','E','2',NULL,2),(326,'room 326','E','2',NULL,2),(327,'room 327','E','2',NULL,2),(328,'room 328','E','2',NULL,2),(329,'room 329','E','2',NULL,2),(330,'room 330','E','2',NULL,2),(331,'room 331','E','2',NULL,2),(332,'room 332','E','2',NULL,2),(333,'room 333','E','2',NULL,2),(334,'room 334','E','2',NULL,2),(335,'room 335','E','2',NULL,2),(336,'room 336','E','2',NULL,2),(337,'room 337','E','2',NULL,2),(338,'room 338','E','2',NULL,2),(339,'room 339','E','2',NULL,2),(340,'room 340','E','2',NULL,2),(341,'room 341','E','2',NULL,2),(342,'room 342','E','2',NULL,2),(343,'room 343','E','2',NULL,2),(344,'room 344','E','2',NULL,2),(345,'room 345','E','2',NULL,2),(346,'room 346','E','2',NULL,2),(347,'room 347','E','2',NULL,2),(348,'room 348','E','2',NULL,2),(349,'room 349','E','2',NULL,2),(350,'room 350','S','3',NULL,3),(351,'room 351','S','3',NULL,3),(352,'room 352','S','3',NULL,3),(353,'room 353','S','3',NULL,3),(354,'room 354','S','3',NULL,3),(355,'room 355','S','3',NULL,3),(356,'room 356','S','3',NULL,3),(357,'room 357','S','3',NULL,3),(358,'room 358','S','3',NULL,3),(359,'room 359','S','3',NULL,3),(360,'room 360','S','3',NULL,3),(361,'room 361','S','3',NULL,3),(362,'room 362','S','3',NULL,3),(363,'room 363','S','3',NULL,3),(364,'room 364','S','3',NULL,3),(365,'room 365','S','3',NULL,3),(366,'room 366','S','3',NULL,3),(367,'room 367','S','3',NULL,3),(368,'room 368','S','3',NULL,3),(369,'room 369','S','3',NULL,3),(370,'room 370','S','3',NULL,3),(371,'room 371','S','3',NULL,3),(372,'room 372','S','3',NULL,3),(373,'room 373','S','3',NULL,3),(374,'room 374','S','3',NULL,3),(375,'room 375','N','4',NULL,4),(376,'room 376','N','4',NULL,4),(377,'room 377','N','4',NULL,4),(378,'room 378','N','4',NULL,4),(379,'room 379','N','4',NULL,4),(380,'room 380','N','4',NULL,4),(381,'room 381','N','4',NULL,4),(382,'room 382','N','4',NULL,4),(383,'room 383','N','4',NULL,4),(384,'room 384','N','4',NULL,4),(385,'room 385','N','4',NULL,4),(386,'room 386','N','4',NULL,4),(387,'room 387','N','4',NULL,4),(388,'room 388','N','4',NULL,4),(389,'room 389','N','4',NULL,4),(390,'room 390','N','4',NULL,4),(391,'room 391','N','4',NULL,4),(392,'room 392','N','4',NULL,4),(393,'room 393','N','4',NULL,4),(394,'room 394','N','4',NULL,4),(395,'room 395','N','4',NULL,4),(396,'room 396','N','4',NULL,4),(397,'room 397','N','4',NULL,4),(398,'room 398','N','4',NULL,4),(399,'room 399','N','4',NULL,4),(400,'room 400','W','1',NULL,1),(401,'room 401','W','1',NULL,1),(402,'room 402','W','1',NULL,1),(403,'room 403','W','1',NULL,1),(404,'room 404','W','1',NULL,1),(405,'room 405','W','1',NULL,1),(406,'room 406','W','1',NULL,1),(407,'room 407','W','1',NULL,1),(408,'room 408','W','1',NULL,1),(409,'room 409','W','1',NULL,1),(410,'room 410','W','1',NULL,1),(411,'room 411','W','1',NULL,1),(412,'room 412','W','1',NULL,1),(413,'room 413','W','1',NULL,1),(414,'room 414','W','1',NULL,1),(415,'room 415','W','1',NULL,1),(416,'room 416','W','1',NULL,1),(417,'room 417','W','1',NULL,1),(418,'room 418','W','1',NULL,1),(419,'room 419','W','1',NULL,1),(420,'room 420','W','1',NULL,1),(421,'room 421','W','1',NULL,1),(422,'room 422','W','1',NULL,1),(423,'room 423','W','1',NULL,1),(424,'room 424','W','1',NULL,1),(425,'room 425','E','2',NULL,2),(426,'room 426','E','2',NULL,2),(427,'room 427','E','2',NULL,2),(428,'room 428','E','2',NULL,2),(429,'room 429','E','2',NULL,2),(430,'room 430','E','2',NULL,2),(431,'room 431','E','2',NULL,2),(432,'room 432','E','2',NULL,2),(433,'room 433','E','2',NULL,2),(434,'room 434','E','2',NULL,2),(435,'room 435','E','2',NULL,2),(436,'room 436','E','2',NULL,2),(437,'room 437','E','2',NULL,2),(438,'room 438','E','2',NULL,2),(439,'room 439','E','2',NULL,2),(440,'room 440','E','2',NULL,2),(441,'room 441','E','2',NULL,2),(442,'room 442','E','2',NULL,2),(443,'room 443','E','2',NULL,2),(444,'room 444','E','2',NULL,2),(445,'room 445','E','2',NULL,2),(446,'room 446','E','2',NULL,2),(447,'room 447','E','2',NULL,2),(448,'room 448','E','2',NULL,2),(449,'room 449','E','2',NULL,2),(450,'room 450','S','3',NULL,3),(451,'room 451','S','3',NULL,3),(452,'room 452','S','3',NULL,3),(453,'room 453','S','3',NULL,3),(454,'room 454','S','3',NULL,3),(455,'room 455','S','3',NULL,3),(456,'room 456','S','3',NULL,3),(457,'room 457','S','3',NULL,3),(458,'room 458','S','3',NULL,3),(459,'room 459','S','3',NULL,3),(460,'room 460','S','3',NULL,3),(461,'room 461','S','3',NULL,3),(462,'room 462','S','3',NULL,3),(463,'room 463','S','3',NULL,3),(464,'room 464','S','3',NULL,3),(465,'room 465','S','3',NULL,3),(466,'room 466','S','3',NULL,3),(467,'room 467','S','3',NULL,3),(468,'room 468','S','3',NULL,3),(469,'room 469','S','3',NULL,3),(470,'room 470','S','3',NULL,3),(471,'room 471','S','3',NULL,3),(472,'room 472','S','3',NULL,3),(473,'room 473','S','3',NULL,3),(474,'room 474','S','3',NULL,3),(475,'room 475','N','4',NULL,4),(476,'room 476','N','4',NULL,4),(477,'room 477','N','4',NULL,4),(478,'room 478','N','4',NULL,4),(479,'room 479','N','4',NULL,4),(480,'room 480','N','4',NULL,4),(481,'room 481','N','4',NULL,4),(482,'room 482','N','4',NULL,4),(483,'room 483','N','4',NULL,4),(484,'room 484','N','4',NULL,4),(485,'room 485','N','4',NULL,4),(486,'room 486','N','4',NULL,4),(487,'room 487','N','4',NULL,4),(488,'room 488','N','4',NULL,4),(489,'room 489','N','4',NULL,4),(490,'room 490','N','4',NULL,4),(491,'room 491','N','4',NULL,4),(492,'room 492','N','4',NULL,4),(493,'room 493','N','4',NULL,4),(494,'room 494','N','4',NULL,4),(495,'room 495','N','4',NULL,4),(496,'room 496','N','4',NULL,4),(497,'room 497','N','4',NULL,4),(498,'room 498','N','4',NULL,4),(499,'room 499','N','4',NULL,4),(500,'hair_saloon',NULL,NULL,1,0),(501,'bar 0',NULL,NULL,1,0),(502,'bar 1',NULL,NULL,1,0),(503,'bar 2',NULL,NULL,1,0),(504,'bar 3',NULL,NULL,1,0),(505,'bar 4',NULL,NULL,1,0),(506,'bar 5',NULL,NULL,1,0),(507,'restaurant 0',NULL,NULL,1,0),(508,'restaurant 1',NULL,NULL,1,0),(509,'restaurant 2',NULL,NULL,1,0),(510,'restaurant 3',NULL,NULL,1,0),(511,'meeting room 0',NULL,NULL,1,0),(512,'meeting room 1',NULL,NULL,1,0),(513,'meeting room 2',NULL,NULL,1,0),(514,'meeting room 3',NULL,NULL,1,0),(515,'meeting room 4',NULL,NULL,1,0),(516,'meeting room 5',NULL,NULL,1,0),(517,'meeting room 6',NULL,NULL,1,0),(518,'meeting room 7',NULL,NULL,1,0),(519,'meeting room 8',NULL,NULL,1,0),(520,'meeting room 9',NULL,NULL,1,0),(521,'gym 0',NULL,NULL,1,0),(522,'gym 1',NULL,NULL,1,0),(523,'gym 2',NULL,NULL,1,0),(524,'gym 3',NULL,NULL,1,0),(525,'saouna 0',NULL,NULL,1,0),(526,'saouna 1',NULL,NULL,1,0),(527,'saouna 2',NULL,NULL,1,0),(528,'saouna 3',NULL,NULL,1,0);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provided_to`
--

DROP TABLE IF EXISTS `provided_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provided_to` (
  `ServiceID` int NOT NULL,
  `PlaceID` int NOT NULL,
  KEY `ServiceID_idx` (`ServiceID`),
  KEY `PlaceID_idx` (`PlaceID`),
  CONSTRAINT `ServiceID_provided_to` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SpaceID_provided_to` FOREIGN KEY (`PlaceID`) REFERENCES `places` (`SpaceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provided_to`
--

LOCK TABLES `provided_to` WRITE;
/*!40000 ALTER TABLE `provided_to` DISABLE KEYS */;
INSERT INTO `provided_to` VALUES (7,0),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(7,13),(7,14),(7,15),(7,16),(7,17),(7,18),(7,19),(7,20),(7,21),(7,22),(7,23),(7,24),(7,25),(7,26),(7,27),(7,28),(7,29),(7,30),(7,31),(7,32),(7,33),(7,34),(7,35),(7,36),(7,37),(7,38),(7,39),(7,40),(7,41),(7,42),(7,43),(7,44),(7,45),(7,46),(7,47),(7,48),(7,49),(7,50),(7,51),(7,52),(7,53),(7,54),(7,55),(7,56),(7,57),(7,58),(7,59),(7,60),(7,61),(7,62),(7,63),(7,64),(7,65),(7,66),(7,67),(7,68),(7,69),(7,70),(7,71),(7,72),(7,73),(7,74),(7,75),(7,76),(7,77),(7,78),(7,79),(7,80),(7,81),(7,82),(7,83),(7,84),(7,85),(7,86),(7,87),(7,88),(7,89),(7,90),(7,91),(7,92),(7,93),(7,94),(7,95),(7,96),(7,97),(7,98),(7,99),(7,100),(7,101),(7,102),(7,103),(7,104),(7,105),(7,106),(7,107),(7,108),(7,109),(7,110),(7,111),(7,112),(7,113),(7,114),(7,115),(7,116),(7,117),(7,118),(7,119),(7,120),(7,121),(7,122),(7,123),(7,124),(7,125),(7,126),(7,127),(7,128),(7,129),(7,130),(7,131),(7,132),(7,133),(7,134),(7,135),(7,136),(7,137),(7,138),(7,139),(7,140),(7,141),(7,142),(7,143),(7,144),(7,145),(7,146),(7,147),(7,148),(7,149),(7,150),(7,151),(7,152),(7,153),(7,154),(7,155),(7,156),(7,157),(7,158),(7,159),(7,160),(7,161),(7,162),(7,163),(7,164),(7,165),(7,166),(7,167),(7,168),(7,169),(7,170),(7,171),(7,172),(7,173),(7,174),(7,175),(7,176),(7,177),(7,178),(7,179),(7,180),(7,181),(7,182),(7,183),(7,184),(7,185),(7,186),(7,187),(7,188),(7,189),(7,190),(7,191),(7,192),(7,193),(7,194),(7,195),(7,196),(7,197),(7,198),(7,199),(7,200),(7,201),(7,202),(7,203),(7,204),(7,205),(7,206),(7,207),(7,208),(7,209),(7,210),(7,211),(7,212),(7,213),(7,214),(7,215),(7,216),(7,217),(7,218),(7,219),(7,220),(7,221),(7,222),(7,223),(7,224),(7,225),(7,226),(7,227),(7,228),(7,229),(7,230),(7,231),(7,232),(7,233),(7,234),(7,235),(7,236),(7,237),(7,238),(7,239),(7,240),(7,241),(7,242),(7,243),(7,244),(7,245),(7,246),(7,247),(7,248),(7,249),(7,250),(7,251),(7,252),(7,253),(7,254),(7,255),(7,256),(7,257),(7,258),(7,259),(7,260),(7,261),(7,262),(7,263),(7,264),(7,265),(7,266),(7,267),(7,268),(7,269),(7,270),(7,271),(7,272),(7,273),(7,274),(7,275),(7,276),(7,277),(7,278),(7,279),(7,280),(7,281),(7,282),(7,283),(7,284),(7,285),(7,286),(7,287),(7,288),(7,289),(7,290),(7,291),(7,292),(7,293),(7,294),(7,295),(7,296),(7,297),(7,298),(7,299),(7,300),(7,301),(7,302),(7,303),(7,304),(7,305),(7,306),(7,307),(7,308),(7,309),(7,310),(7,311),(7,312),(7,313),(7,314),(7,315),(7,316),(7,317),(7,318),(7,319),(7,320),(7,321),(7,322),(7,323),(7,324),(7,325),(7,326),(7,327),(7,328),(7,329),(7,330),(7,331),(7,332),(7,333),(7,334),(7,335),(7,336),(7,337),(7,338),(7,339),(7,340),(7,341),(7,342),(7,343),(7,344),(7,345),(7,346),(7,347),(7,348),(7,349),(7,350),(7,351),(7,352),(7,353),(7,354),(7,355),(7,356),(7,357),(7,358),(7,359),(7,360),(7,361),(7,362),(7,363),(7,364),(7,365),(7,366),(7,367),(7,368),(7,369),(7,370),(7,371),(7,372),(7,373),(7,374),(7,375),(7,376),(7,377),(7,378),(7,379),(7,380),(7,381),(7,382),(7,383),(7,384),(7,385),(7,386),(7,387),(7,388),(7,389),(7,390),(7,391),(7,392),(7,393),(7,394),(7,395),(7,396),(7,397),(7,398),(7,399),(7,400),(7,401),(7,402),(7,403),(7,404),(7,405),(7,406),(7,407),(7,408),(7,409),(7,410),(7,411),(7,412),(7,413),(7,414),(7,415),(7,416),(7,417),(7,418),(7,419),(7,420),(7,421),(7,422),(7,423),(7,424),(7,425),(7,426),(7,427),(7,428),(7,429),(7,430),(7,431),(7,432),(7,433),(7,434),(7,435),(7,436),(7,437),(7,438),(7,439),(7,440),(7,441),(7,442),(7,443),(7,444),(7,445),(7,446),(7,447),(7,448),(7,449),(7,450),(7,451),(7,452),(7,453),(7,454),(7,455),(7,456),(7,457),(7,458),(7,459),(7,460),(7,461),(7,462),(7,463),(7,464),(7,465),(7,466),(7,467),(7,468),(7,469),(7,470),(7,471),(7,472),(7,473),(7,474),(7,475),(7,476),(7,477),(7,478),(7,479),(7,480),(7,481),(7,482),(7,483),(7,484),(7,485),(7,486),(7,487),(7,488),(7,489),(7,490),(7,491),(7,492),(7,493),(7,494),(7,495),(7,496),(7,497),(7,498),(7,499),(3,500),(1,501),(1,502),(1,503),(1,504),(1,505),(1,506),(2,507),(2,508),(2,509),(2,510),(6,511),(6,512),(6,513),(6,514),(6,515),(6,516),(6,517),(6,518),(6,519),(6,520),(4,521),(4,522),(4,523),(4,524),(5,525),(5,526),(5,527),(5,528);
/*!40000 ALTER TABLE `provided_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ServiceID` int NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'food-cocktail in bar'),(2,'food-cocktail in restaurant'),(3,'hair saloon'),(4,'gym'),(5,'saouna'),(6,'meeting room'),(7,'accommodation in a room');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `NFC_ID` int NOT NULL,
  `SpaceID` int NOT NULL,
  `Arrival Date-time` datetime NOT NULL,
  `Departure Date-time` datetime NOT NULL,
  KEY `NFC ID_idx` (`NFC_ID`),
  KEY `SpaceID_idx` (`SpaceID`),
  CONSTRAINT `NFC ID_Visists_table` FOREIGN KEY (`NFC_ID`) REFERENCES `customers` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SpaceID_Visists_table` FOREIGN KEY (`SpaceID`) REFERENCES `places` (`SpaceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-31  3:35:14
