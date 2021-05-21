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
  `NFC ID` int NOT NULL,
  `SpaceID` int NOT NULL,
  `Open Date-time` datetime NOT NULL,
  `Closed Date-time` datetime NOT NULL,
  KEY `NFC ID_idx` (`NFC ID`),
  KEY `SpaceID_idx` (`SpaceID`),
  CONSTRAINT `NFC ID_access_table` FOREIGN KEY (`NFC ID`) REFERENCES `customers` (`NFC ID`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  `NFC ID` int NOT NULL,
  `ServiceID` int NOT NULL,
  `charge Date-time` datetime NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `charge` float NOT NULL,
  KEY `NFC ID_idx` (`NFC ID`),
  KEY `SereviceID_idx` (`ServiceID`),
  CONSTRAINT `NFC ID_charge_of_service` FOREIGN KEY (`NFC ID`) REFERENCES `customers` (`NFC ID`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  `NFC ID` int NOT NULL AUTO_INCREMENT,
  `First Name` varchar(45) NOT NULL,
  `Last Name` varchar(45) NOT NULL,
  `Birth Date` varchar(45) NOT NULL,
  `doc_num` int NOT NULL,
  `doc_type` varchar(45) NOT NULL,
  `issuing authority` varchar(45) NOT NULL,
  PRIMARY KEY (`NFC ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers emails`
--

DROP TABLE IF EXISTS `customers emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers emails` (
  `NFC ID` int NOT NULL,
  `email` varchar(45) NOT NULL,
  KEY `NFC ID_idx` (`NFC ID`),
  CONSTRAINT `NFC ID_table_emails` FOREIGN KEY (`NFC ID`) REFERENCES `customers` (`NFC ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers emails`
--

LOCK TABLES `customers emails` WRITE;
/*!40000 ALTER TABLE `customers emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers phones`
--

DROP TABLE IF EXISTS `customers phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers phones` (
  `NFC ID` int NOT NULL,
  `phone` varchar(45) NOT NULL,
  KEY `NFC ID_idx` (`NFC ID`),
  CONSTRAINT `NFC ID_customers_phones` FOREIGN KEY (`NFC ID`) REFERENCES `customers` (`NFC ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers phones`
--

LOCK TABLES `customers phones` WRITE;
/*!40000 ALTER TABLE `customers phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default services`
--

DROP TABLE IF EXISTS `default services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default services` (
  `ServiceID` int NOT NULL,
  KEY `ServiceID_idx` (`ServiceID`),
  CONSTRAINT `ServiceID_deafault_services_table` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default services`
--

LOCK TABLES `default services` WRITE;
/*!40000 ALTER TABLE `default services` DISABLE KEYS */;
/*!40000 ALTER TABLE `default services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll in`
--

DROP TABLE IF EXISTS `enroll in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll in` (
  `NFC ID` int NOT NULL,
  `Service ID` int NOT NULL,
  `enroll Date-time` datetime NOT NULL,
  KEY `NFC ID_idx` (`NFC ID`),
  KEY `ServiceID_idx` (`Service ID`),
  CONSTRAINT `NFC ID_enrolled_in` FOREIGN KEY (`NFC ID`) REFERENCES `customers` (`NFC ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ServiceID_enrolled_in` FOREIGN KEY (`Service ID`) REFERENCES `enrolled services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll in`
--

LOCK TABLES `enroll in` WRITE;
/*!40000 ALTER TABLE `enroll in` DISABLE KEYS */;
/*!40000 ALTER TABLE `enroll in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled services`
--

DROP TABLE IF EXISTS `enrolled services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled services` (
  `ServiceID` int NOT NULL,
  `enroll price` float NOT NULL,
  KEY `ServiceID_idx` (`ServiceID`),
  CONSTRAINT `ServiceID_enrolled_services` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled services`
--

LOCK TABLES `enrolled services` WRITE;
/*!40000 ALTER TABLE `enrolled services` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrolled services` ENABLE KEYS */;
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
  PRIMARY KEY (`SpaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provided to`
--

DROP TABLE IF EXISTS `provided to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provided to` (
  `ServiceID` int NOT NULL,
  `PlaceID` int NOT NULL,
  KEY `ServiceID_idx` (`ServiceID`),
  KEY `PlaceID_idx` (`PlaceID`),
  CONSTRAINT `ServiceID_provided_to` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SpaceID_provided_to` FOREIGN KEY (`PlaceID`) REFERENCES `places` (`SpaceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provided to`
--

LOCK TABLES `provided to` WRITE;
/*!40000 ALTER TABLE `provided to` DISABLE KEYS */;
/*!40000 ALTER TABLE `provided to` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visists`
--

DROP TABLE IF EXISTS `visists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visists` (
  `NFC ID` int NOT NULL,
  `SpaceID` int NOT NULL,
  `Arrival Date-time` datetime NOT NULL,
  `Departure Date-time` datetime NOT NULL,
  KEY `NFC ID_idx` (`NFC ID`),
  KEY `SpaceID_idx` (`SpaceID`),
  CONSTRAINT `NFC ID_Visists_table` FOREIGN KEY (`NFC ID`) REFERENCES `customers` (`NFC ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SpaceID_Visists_table` FOREIGN KEY (`SpaceID`) REFERENCES `places` (`SpaceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visists`
--

LOCK TABLES `visists` WRITE;
/*!40000 ALTER TABLE `visists` DISABLE KEYS */;
/*!40000 ALTER TABLE `visists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-21 12:34:58
