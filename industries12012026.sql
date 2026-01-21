CREATE DATABASE  IF NOT EXISTS `industries` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `industries`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: industries
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `about_hero`
--

DROP TABLE IF EXISTS `about_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` text,
  `description` text,
  `background_image` text NOT NULL,
  `logo_cards` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_hero`
--

LOCK TABLES `about_hero` WRITE;
/*!40000 ALTER TABLE `about_hero` DISABLE KEYS */;
INSERT INTO `about_hero` VALUES (1,'A Story of Passion, Determination, and Growth',NULL,NULL,'http://localhost:8080/uploads/images/image-1765796202370-595742764.jpg','[]',1,'2025-11-27 07:07:46','2025-12-15 10:56:46');
/*!40000 ALTER TABLE `about_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_journey`
--

DROP TABLE IF EXISTS `about_journey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_journey` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `summary` text,
  `image` text,
  `images` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_journey`
--

LOCK TABLES `about_journey` WRITE;
/*!40000 ALTER TABLE `about_journey` DISABLE KEYS */;
INSERT INTO `about_journey` VALUES (1,'Our Journey','','http://localhost:8080/uploads/images/image-1765796453681-969739065.jpg','[]',1,'2025-11-27 09:56:52','2025-12-15 11:00:56');
/*!40000 ALTER TABLE `about_journey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_page_sections`
--

DROP TABLE IF EXISTS `about_page_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_page_sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_page_sections`
--

LOCK TABLES `about_page_sections` WRITE;
/*!40000 ALTER TABLE `about_page_sections` DISABLE KEYS */;
INSERT INTO `about_page_sections` VALUES (1,'ABOUT  US','Refex Industries Limited is a dynamic, diversified enterprise with strategic interests in refrigerant gases, coal and ash management, power trading, clean mobility, and renewable energy. We are committed to sustainability, innovation, and long-term value creation across sectors critical to India\'s growth.\n\n\nWe specialize in eco-friendly refrigerant gas trading with multiple cylinder size options, offering reliable and sustainable cooling solutions. In the energy domain, Refex provides integrated services for responsible coal supply, handling and ash utilization. With a Category-I license for interstate power trading, we enable electricity transactions across the country.\n\n\nRefex Green Mobility Limited, our clean mobility arm, offers four-wheeler vehicles running on clean fuel along with a technology-enabled platform and a professional driver partner to serve the corporates and demand aggregator platforms.\n\n\nOur renewable energy subsidiary, Venwind , focuses on revolutionising wind energy manufacturing in India through cutting-edge technology, localised production and sustainable growth.\n\n\nTogether, our businesses drive impactful, scalable solutions aligned with a cleaner, more efficient future',1,'2025-11-27 07:21:17','2025-11-28 18:17:05');
/*!40000 ALTER TABLE `about_page_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_presence`
--

DROP TABLE IF EXISTS `about_presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_presence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `map_image` text,
  `presence_text_image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_presence`
--

LOCK TABLES `about_presence` WRITE;
/*!40000 ALTER TABLE `about_presence` DISABLE KEYS */;
INSERT INTO `about_presence` VALUES (1,'Refex Vertical Wise Presence','Spanning Across the Nation','/uploads/images/image-1767868499242-797335270.png','/uploads/images/image-1767868407133-686582603.png',1,'2025-11-27 09:34:39','2026-01-08 10:35:01');
/*!40000 ALTER TABLE `about_presence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_sections`
--

DROP TABLE IF EXISTS `about_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_sections`
--

LOCK TABLES `about_sections` WRITE;
/*!40000 ALTER TABLE `about_sections` DISABLE KEYS */;
INSERT INTO `about_sections` VALUES (1,'About US','Refex Industries Limited is a dynamic, diversified enterprise with strategic interests in refrigerant gases, coal and ash management, power trading, clean mobility, and renewable energy. We are committed to sustainability, innovation, and long-term value creation across sectors critical to India\'s growth.','hover ','#7abc43',0,1,'2025-11-27 04:52:35','2025-11-27 04:52:35');
/*!40000 ALTER TABLE `about_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_vision_mission`
--

DROP TABLE IF EXISTS `about_vision_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_vision_mission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vision_title` varchar(255) NOT NULL,
  `vision_description` text,
  `vision_image` text,
  `mission_title` varchar(255) NOT NULL,
  `mission_image` text,
  `mission_points_json` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_vision_mission`
--

LOCK TABLES `about_vision_mission` WRITE;
/*!40000 ALTER TABLE `about_vision_mission` DISABLE KEYS */;
INSERT INTO `about_vision_mission` VALUES (1,'Vision','Refex aims to be a globally admired conglomerate, driving long-term sustainable growth through innovation, purposeful collaborations and partnerships, and an unwavering commitment to excellence, while contributing meaningfully to societal progress','http://localhost:8080/uploads/images/image-1765796270652-62975962.jpg','Mission',NULL,'[]',1,'2025-11-27 07:28:23','2025-12-15 10:57:53');
/*!40000 ALTER TABLE `about_vision_mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ash_utilization_clients`
--

DROP TABLE IF EXISTS `ash_utilization_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ash_utilization_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` enum('thermal','cement','concessionaires') NOT NULL,
  `image` text NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ash_utilization_clients`
--

LOCK TABLES `ash_utilization_clients` WRITE;
/*!40000 ALTER TABLE `ash_utilization_clients` DISABLE KEYS */;
INSERT INTO `ash_utilization_clients` VALUES (1,'thermal','http://localhost:8080/uploads/images/image-1765799964605-201389511.jpg',1,1,'2025-11-27 10:50:51','2025-12-15 11:59:26'),(2,'thermal','http://localhost:8080/uploads/images/image-1765799981774-361272526.jpg',2,1,'2025-11-27 10:50:51','2025-12-15 11:59:44'),(3,'thermal','http://localhost:8080/uploads/images/image-1765800005758-68207204.jpg',3,1,'2025-11-27 10:50:51','2025-12-15 12:00:08'),(4,'thermal','http://localhost:8080/uploads/images/image-1765800018288-807161989.jpg',4,0,'2025-11-27 10:50:51','2025-12-15 12:00:20'),(5,'thermal','http://localhost:8080/uploads/images/image-1765800046522-596789751.jpg',5,1,'2025-11-27 10:50:51','2025-12-15 12:00:48'),(6,'thermal','http://localhost:8080/uploads/images/image-1765800058991-724953882.jpg',6,1,'2025-11-27 10:50:51','2025-12-15 12:01:23'),(7,'thermal','http://localhost:8080/uploads/images/image-1765800099152-934250093.jpg',7,1,'2025-11-27 10:50:51','2025-12-15 12:01:41'),(8,'thermal','http://localhost:8080/uploads/images/image-1765800122867-718853108.jpg',8,1,'2025-11-27 10:50:51','2025-12-15 12:02:04'),(9,'thermal','http://localhost:8080/uploads/images/image-1765800153694-753528785.jpg',9,1,'2025-11-27 10:50:51','2025-12-15 12:02:35'),(10,'cement','http://localhost:8080/uploads/images/image-1765800168707-271353393.jpg',1,1,'2025-11-27 10:50:51','2025-12-15 12:02:50'),(11,'cement','http://localhost:8080/uploads/images/image-1765800181750-317189912.jpg',2,1,'2025-11-27 10:50:51','2025-12-15 12:03:04'),(12,'cement','http://localhost:8080/uploads/images/image-1765800198635-676995125.jpg',3,1,'2025-11-27 10:50:51','2025-12-15 12:03:21'),(13,'cement','http://localhost:8080/uploads/images/image-1765800215515-874911086.jpg',4,1,'2025-11-27 10:50:51','2025-12-15 12:03:37'),(14,'cement','http://localhost:8080/uploads/images/image-1765800230490-564246760.jpg',5,1,'2025-11-27 10:50:51','2025-12-15 12:03:52'),(15,'cement','http://localhost:8080/uploads/images/image-1765800242487-234645897.jpg',6,1,'2025-11-27 10:50:51','2025-12-15 12:04:04'),(16,'cement','http://localhost:8080/uploads/images/image-1765800254498-163173857.jpg',7,1,'2025-11-27 10:50:51','2025-12-15 12:04:16'),(17,'cement','http://localhost:8080/uploads/images/image-1765800277671-419791042.jpg',8,1,'2025-11-27 10:50:51','2025-12-15 12:04:40'),(18,'cement','http://localhost:8080/uploads/images/image-1765800291606-588058928.jpg',9,1,'2025-11-27 10:50:51','2025-12-15 12:04:53'),(19,'concessionaires','http://localhost:8080/uploads/images/image-1765800316273-897853505.jpg',1,1,'2025-11-27 10:50:51','2025-12-15 12:05:18'),(20,'concessionaires','http://localhost:8080/uploads/images/image-1765800359409-516816612.jpg',2,1,'2025-11-27 10:50:51','2025-12-15 12:06:01'),(21,'concessionaires','http://localhost:8080/uploads/images/image-1765800385170-237284585.jpg',3,1,'2025-11-27 10:50:51','2025-12-15 12:06:27'),(22,'concessionaires','http://localhost:8080/uploads/images/image-1765800407055-564050216.jpg',4,1,'2025-11-27 10:50:51','2025-12-15 12:06:48'),(23,'concessionaires','http://localhost:8080/uploads/images/image-1765800429340-362864845.jpg',5,1,'2025-11-27 10:50:51','2025-12-15 12:07:11'),(24,'concessionaires','http://localhost:8080/uploads/images/image-1765800453670-627117923.jpg',6,1,'2025-11-27 10:50:51','2025-12-15 12:07:36'),(25,'concessionaires','http://localhost:8080/uploads/images/image-1765800471435-458057706.jpg',7,1,'2025-11-27 10:50:51','2025-12-15 12:07:53'),(26,'concessionaires','http://localhost:8080/uploads/images/image-1765800487868-896064900.jpg',8,1,'2025-11-27 10:50:51','2025-12-15 12:08:10'),(27,'concessionaires','http://localhost:8080/uploads/images/image-1765800508214-605326300.jpg',9,1,'2025-11-27 10:50:51','2025-12-15 12:08:29'),(28,'concessionaires','http://localhost:8080/uploads/images/image-1765800522745-460813527.jpg',10,1,'2025-11-27 10:50:51','2025-12-15 12:08:44'),(29,'concessionaires','http://localhost:8080/uploads/images/image-1765800537882-814551621.jpg',11,1,'2025-11-27 10:50:51','2025-12-15 12:08:59'),(30,'concessionaires','http://localhost:8080/uploads/images/image-1765800567110-281006799.jpg',12,1,'2025-11-27 10:50:51','2025-12-15 12:09:28'),(31,'concessionaires','http://localhost:8080/uploads/images/image-1765800587889-119933431.jpg',13,1,'2025-11-27 10:50:51','2025-12-15 12:09:50');
/*!40000 ALTER TABLE `ash_utilization_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ash_utilization_features`
--

DROP TABLE IF EXISTS `ash_utilization_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ash_utilization_features` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ash_utilization_features`
--

LOCK TABLES `ash_utilization_features` WRITE;
/*!40000 ALTER TABLE `ash_utilization_features` DISABLE KEYS */;
INSERT INTO `ash_utilization_features` VALUES (1,'Expertise in Managing Large-Scale Projects','Proven capability to handle complex operations efficiently.','http://localhost:8080/uploads/images/image-1765799453103-71865450.png',1,1,'2025-11-27 10:27:54','2025-12-15 11:50:54'),(2,'Centralized Operations','Digital work orders, sensor-based diesel management, centralized data collection, and GPS fleet tracking for seamless execution.','http://localhost:8080/uploads/images/image-1765799469289-831640741.png',2,1,'2025-11-27 10:27:54','2025-12-15 11:51:10'),(3,'Customer Centricity','Tailored solutions with transparent communication.','http://localhost:8080/uploads/images/image-1765799482849-137373554.png',3,1,'2025-11-27 10:27:54','2025-12-15 11:51:25'),(4,'Safety & Compliance','Highest safety standards with full regulatory adherence.','https://refex.co.in/wp-content/uploads/2024/12/competitive-price-2.png',4,1,'2025-11-27 10:27:54','2025-11-27 10:27:54'),(5,'Efficiency & Reliability','Fast, reliable ash services with minimal disruption.','http://localhost:8080/uploads/images/image-1765799566815-3476616.svg',5,1,'2025-11-27 10:27:54','2025-12-15 11:52:49'),(6,'Innovation & Adaptability','Adoption of new technologies and flexibility to evolving customer needs.','http://localhost:8080/uploads/images/image-1765799624001-142966035.png',6,1,'2025-11-27 10:27:54','2025-12-15 11:53:45'),(7,'Environmental Responsibility','Sustainable, regulation-compliant ash management practices.','http://localhost:8080/uploads/images/image-1765799676654-687879512.png',7,1,'2025-11-27 10:27:54','2025-12-15 11:54:38'),(8,'Cost-Effective Solutions','Affordable services designed to meet power plant budgets.','http://localhost:8080/uploads/images/image-1765799692675-36014869.png',8,1,'2025-11-27 10:27:54','2025-12-15 11:54:54');
/*!40000 ALTER TABLE `ash_utilization_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ash_utilization_hero`
--

DROP TABLE IF EXISTS `ash_utilization_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ash_utilization_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `slides` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ash_utilization_hero`
--

LOCK TABLES `ash_utilization_hero` WRITE;
/*!40000 ALTER TABLE `ash_utilization_hero` DISABLE KEYS */;
INSERT INTO `ash_utilization_hero` VALUES (1,'ASH UTILIZATION AND COAL HANDLING','One-stop solution for all your Ash and Coal Requirements','[{\"image\": \"http://localhost:8080/uploads/images/image-1765799394210-223412193.jpg\"}, {\"image\": \"http://localhost:8080/uploads/images/image-1765799410057-537673448.webp\"}]',1,'2025-11-27 10:06:53','2025-12-15 11:50:12');
/*!40000 ALTER TABLE `ash_utilization_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ash_utilization_impacts`
--

DROP TABLE IF EXISTS `ash_utilization_impacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ash_utilization_impacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `icon` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ash_utilization_impacts`
--

LOCK TABLES `ash_utilization_impacts` WRITE;
/*!40000 ALTER TABLE `ash_utilization_impacts` DISABLE KEYS */;
INSERT INTO `ash_utilization_impacts` VALUES (1,'2000+','Fleet network','http://localhost:8080/uploads/images/image-1765799883344-874277401.svg',1,1,'2025-11-27 10:33:47','2025-12-15 11:58:05'),(2,'40+','Power projects','http://localhost:8080/uploads/images/image-1765799894862-477385363.png',2,1,'2025-11-27 10:33:47','2025-12-15 11:58:17'),(3,'70,000 MT','Ash handled daily','http://localhost:8080/uploads/images/image-1765799907004-91728055.svg',3,1,'2025-11-27 10:33:47','2025-12-15 11:58:29'),(4,'15+','Presence in states','http://localhost:8080/uploads/images/image-1765799920022-803069070.svg',4,1,'2025-11-27 10:33:47','2025-12-15 11:58:41');
/*!40000 ALTER TABLE `ash_utilization_impacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ash_utilization_services`
--

DROP TABLE IF EXISTS `ash_utilization_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ash_utilization_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` text,
  `image_position` enum('left','right') NOT NULL DEFAULT 'left',
  `intro` text,
  `subtitle` text,
  `points_json` json DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ash_utilization_services`
--

LOCK TABLES `ash_utilization_services` WRITE;
/*!40000 ALTER TABLE `ash_utilization_services` DISABLE KEYS */;
INSERT INTO `ash_utilization_services` VALUES (1,'Ash Utilisation','http://localhost:8080/uploads/images/image-1765799936854-428756084.jpg','left','Ash, if released into the atmosphere, can cause significant environmental harm. Refex plays a vital role in its safe and responsible utilisation by ensuring efficient transportation from plant silos and dykes to designated sites using trucks, hywas, bulkers, and rail rakes. The ash is then utilised at various locations in full compliance with regulatory standards.','With a strong focus on innovation and environmental stewardship, Refex continues to be a trusted partner in ash management solutions, supporting power plants through:','[\"Extensive network of fleets and vendor partners\", \"Advanced tracking technology, sensors and equipment providing real-time information\", \"Customized solutions tailored to the needs of power plant operators.\", \"Comprehensive utilisation strategy for both Fly Ash and Pond Ash for each power plant\", \"Strong partnerships with cement companies, road concessionaires, brick manufacturers, mine operators and government agencies\", \"100% compliance to MOEF guidelines and Pollution Control Board standards\"]',1,1,'2025-11-27 10:42:14','2025-12-15 11:59:01'),(2,'Coal Supply and Handling','http://localhost:8080/uploads/images/image-1765799951089-964646380.jpg','left','Refex is dedicated to guaranteeing the seamless and efficient supply of coal to various power plants at competitive prices.','We also provide comprehensive services for over burden excavation and coal yard management encompassing,','[\"Coal handling Plant Room Operations\", \"Segregation of Coal and Stone\", \"Housekeeping\", \"Initial Crushing\", \"Management of Heavy Machinery\", \"Maintenance of CHP Equipment\"]',2,1,'2025-11-27 10:42:14','2025-12-15 11:59:13');
/*!40000 ALTER TABLE `ash_utilization_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ash_utilization_who_we_are`
--

DROP TABLE IF EXISTS `ash_utilization_who_we_are`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ash_utilization_who_we_are` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slides` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ash_utilization_who_we_are`
--

LOCK TABLES `ash_utilization_who_we_are` WRITE;
/*!40000 ALTER TABLE `ash_utilization_who_we_are` DISABLE KEYS */;
INSERT INTO `ash_utilization_who_we_are` VALUES (1,'WHO WE ARE','Refex, a leader in the ash utilization sector since its entry in 2018, specializes in providing ash management services for coalfired power plants, helping them mitigate the environmental pollution caused by coal combustion.\n\nAs the largest organized player in India\'s ash management industry, we have successfully worked across 40+ plants and repurposed the ash generated for construction of roads, highways and embankments; for filling of mines and low-lying areas, and manufacturing of cement and bricks, thereby fostering sustainable infrastructure development.\n\nKnown for our reliable, and high-quality services, we employ advanced technologies and extensive network of fleet for the safe collection, transportation, and utilization of ash, with a strong emphasis on sustainability.','[{\"image\": \"http://localhost:8080/uploads/images/image-1765799428912-933204640.jpg\"}, {\"image\": \"http://localhost:8080/uploads/images/image-1765799435775-920350617.jpg\"}]',1,'2025-11-27 10:14:30','2025-12-15 11:50:37');
/*!40000 ALTER TABLE `ash_utilization_who_we_are` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,'Best Organisations for Women 2024 Award by ET Now','http://localhost:8080/uploads/images/image-1765794440111-468932161.png',1,1,'2025-11-27 06:53:04','2025-12-15 10:27:21'),(2,'Most Diversified Sustainable Company (India) by The Business Concept. UK','http://localhost:8080/uploads/images/image-1765794449168-950829577.png',2,1,'2025-11-27 06:53:04','2025-12-15 10:27:31'),(3,'Bronze Prize of Asia\'s Best Integrated Report for our First-ever Sustainability Report by AIRA','http://localhost:8080/uploads/images/image-1765794469954-891202859.png',3,1,'2025-11-27 06:53:04','2025-12-15 10:27:51'),(4,'GOLD STEVIE AWARD WINNER Conglomerates Category (Medium Size)','http://localhost:8080/uploads/images/image-1765794482591-168979673.png',4,1,'2025-11-27 06:53:04','2025-12-15 10:28:04'),(5,'International Green Apple Environment Award 2024','http://localhost:8080/uploads/images/image-1765794494086-591530364.png',5,1,'2025-11-27 06:53:04','2025-12-15 10:28:15'),(6,'Best Waste Management Solution Award','http://localhost:8080/uploads/images/image-1765794544127-897961420.png',6,1,'2025-11-27 06:53:04','2025-12-15 10:29:07'),(7,'ESG Excellence Award by ESG Grit Awards','http://localhost:8080/uploads/images/image-1765794576338-301255256.png',7,1,'2025-11-27 06:53:04','2025-12-15 10:29:38'),(8,'Great Place to Work Certified Apr 2025 - Apr 2026 India','http://localhost:8080/uploads/images/image-1765794591880-364661570.png',8,1,'2025-11-27 06:53:04','2025-12-15 10:29:52'),(9,'Most Preferred Workplace 2025-2026 by Marksmen Daily','http://localhost:8080/uploads/images/image-1765794605280-546247197.png',9,1,'2025-11-27 06:53:04','2025-12-15 10:30:06');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capabilities_facility`
--

DROP TABLE IF EXISTS `capabilities_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capabilities_facility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  `established` varchar(255) DEFAULT NULL,
  `image` text,
  `capabilities` json DEFAULT NULL,
  `approvals` json DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `order` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capabilities_facility`
--

LOCK TABLES `capabilities_facility` WRITE;
/*!40000 ALTER TABLE `capabilities_facility` DISABLE KEYS */;
/*!40000 ALTER TABLE `capabilities_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capabilities_hero`
--

DROP TABLE IF EXISTS `capabilities_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capabilities_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `description` text,
  `sub_description` text,
  `background_image` text NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capabilities_hero`
--

LOCK TABLES `capabilities_hero` WRITE;
/*!40000 ALTER TABLE `capabilities_hero` DISABLE KEYS */;
/*!40000 ALTER TABLE `capabilities_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capabilities_research`
--

DROP TABLE IF EXISTS `capabilities_research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capabilities_research` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `image` text,
  `api_card` json DEFAULT NULL,
  `fdf_card` json DEFAULT NULL,
  `promise` json DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capabilities_research`
--

LOCK TABLES `capabilities_research` WRITE;
/*!40000 ALTER TABLE `capabilities_research` DISABLE KEYS */;
/*!40000 ALTER TABLE `capabilities_research` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committee_members`
--

DROP TABLE IF EXISTS `committee_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `committee_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `committee_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `committee_id` (`committee_id`),
  CONSTRAINT `committee_members_ibfk_1` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee_members`
--

LOCK TABLES `committee_members` WRITE;
/*!40000 ALTER TABLE `committee_members` DISABLE KEYS */;
INSERT INTO `committee_members` VALUES (1,1,'Mr. Ramesh Dugar','Independent Director','Chairman',0,1,'2025-11-27 08:58:50','2025-11-27 08:58:50'),(2,1,'Mr. Dinesh Kumar Agarwal','Whole-time Director & CFO','Member',1,1,'2025-11-27 08:58:50','2025-11-27 08:58:50'),(3,1,'Mr. Sivaramakrishnan Vasudevan','Independent Director','Member',2,1,'2025-11-27 08:58:50','2025-11-27 08:58:50'),(4,2,'Mr. Ramesh Dugar','Independent Director','Chairman',0,1,'2025-11-27 09:00:04','2025-11-27 09:00:04'),(5,2,'Mr. Anil Jain','Managing Director','Member',1,1,'2025-11-27 09:00:04','2025-11-27 09:00:04'),(6,2,'Mr. Sivaramakrishnan Vasudevan','Independent Director','Member',2,1,'2025-11-27 09:00:04','2025-11-27 09:00:04'),(7,3,'Ms. Latha Venkatesh','Independent Director','Chairman',0,1,'2025-11-27 09:01:21','2025-11-27 09:01:21'),(8,3,'Mr. Dinesh Kumar Agarwal','Whole-time director & CFO','Member',1,1,'2025-11-27 09:01:21','2025-11-27 09:01:21'),(9,3,'Ms. Susmitha Siripurapu','Non-Executive Director','Member',2,1,'2025-11-27 09:01:21','2025-11-27 09:01:21'),(10,4,'Mr. Sivaramakrishnan Vasudevan','Independent Director','Chairman',0,1,'2025-11-27 09:03:31','2025-11-27 09:03:31'),(11,4,'Mr. Dinesh Kumar Agarwal','Whole-time director & CFO','Member',1,1,'2025-11-27 09:03:31','2025-11-27 09:03:31'),(12,4,'Mr. Anil Jain','Executive Director','Member',2,1,'2025-11-27 09:03:31','2025-11-27 09:03:31'),(18,5,'Mr. Dinesh Kumar Agarwal','Whole-time director & CFO','Chairperson',0,1,'2025-11-27 09:06:00','2025-11-27 09:06:00'),(19,5,'Ms. Susmitha Siripurapu','Non-Executive Director','Member',1,1,'2025-11-27 09:06:00','2025-11-27 09:06:00'),(20,5,'Mr. Sivaramakrishnan Vasudevan','Independent Director','Member',2,1,'2025-11-27 09:06:00','2025-11-27 09:06:00'),(21,5,'Ms. Harini.S','VP-Legal (Holding Co.)','Member',3,1,'2025-11-27 09:06:00','2025-11-27 09:06:00'),(22,5,'Mr. Sachin Navtosh Jha','Chief of Staff (Holding Co.)','Member',4,1,'2025-11-27 09:06:00','2025-11-27 09:06:00'),(23,6,'Mr. Anil Jain','Managing Director','Chairman',0,1,'2025-11-27 09:07:24','2025-11-27 09:07:24'),(24,6,'Mr. Dinesh Kumar Agarwal','Whole-time director & CFO','Member',1,1,'2025-11-27 09:07:24','2025-11-27 09:07:24'),(25,6,'Ms. Susmitha Siripurapu','Non-Executive Director','Member',2,1,'2025-11-27 09:07:24','2025-11-27 09:07:24');
/*!40000 ALTER TABLE `committee_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committees`
--

DROP TABLE IF EXISTS `committees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `committees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committees`
--

LOCK TABLES `committees` WRITE;
/*!40000 ALTER TABLE `committees` DISABLE KEYS */;
INSERT INTO `committees` VALUES (1,'Audit Committee',1,1,'2025-11-27 08:58:50','2025-11-27 08:58:50'),(2,'Nomination & Remuneration Committee',2,1,'2025-11-27 09:00:04','2025-11-27 09:00:04'),(3,'Stakeholders Relationship Committee',3,1,'2025-11-27 09:01:21','2025-11-27 09:01:21'),(4,'Corporate Social Responsibility Committee',4,1,'2025-11-27 09:03:31','2025-11-27 09:03:31'),(5,'Risk Management Committee',5,1,'2025-11-27 09:05:14','2025-11-27 09:06:00'),(6,'Banking & Authorization Committee',6,1,'2025-11-27 09:07:24','2025-11-27 09:07:24');
/*!40000 ALTER TABLE `committees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_form`
--

DROP TABLE IF EXISTS `contact_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` text,
  `map_embed_url` text,
  `form_endpoint_url` text NOT NULL,
  `success_message` text,
  `error_message` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_form`
--

LOCK TABLES `contact_form` WRITE;
/*!40000 ALTER TABLE `contact_form` DISABLE KEYS */;
INSERT INTO `contact_form` VALUES (1,'Get in Touchh','Have Questions? We\'re happy to help!','https://maps.google.com/maps?q=Refex%20Industries%20Limited%202nd%20Floor%2C%20No.313%2C%20Refex%20Towers%2C%20Sterling%20Road%2C%20Valluvar%20Kottam%20High%20Road%2C%20Nungambakkam%2C%20Chennai%2C%20Tamil%20Nadu%20-%20600034&amp;t=m&amp;z=17&amp;output=embed&amp;iwloc=near','https://readdy.ai/api/form/d4ijdrv1vras6h6ft1qg','Thank you! Your message has been sent successfully.','Sorry, there was an error sending your message. Please try again.',1,'2025-11-27 22:19:34','2025-11-27 22:21:04'),(2,'Get in Touch','Have Questions? We\'re happy to help!','https://maps.google.com/maps?q=Refex%20Industries%20Limited%202nd%20Floor%2C%20No.313%2C%20Refex%20Towers%2C%20Sterling%20Road%2C%20Valluvar%20Kottam%20High%20Road%2C%20Nungambakkam%2C%20Chennai%2C%20Tamil%20Nadu%20-%20600034&t=m&z=17&output=embed&iwloc=near','https://readdy.ai/api/form/d4ijdrv1vras6h6ft1qg','Thank you! Your message has been sent successfully.','Sorry, there was an error sending your message. Please try again.',1,'2025-11-27 22:24:23','2025-11-27 22:24:23');
/*!40000 ALTER TABLE `contact_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_hero`
--

DROP TABLE IF EXISTS `contact_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `background_image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_hero`
--

LOCK TABLES `contact_hero` WRITE;
/*!40000 ALTER TABLE `contact_hero` DISABLE KEYS */;
INSERT INTO `contact_hero` VALUES (1,'CONTACT US','Drop us a line, we\'d love to hear from you.','http://localhost:8080/uploads/images/image-1765903351434-503890339.jpg',1,'2025-11-27 22:03:05','2025-12-16 16:42:39');
/*!40000 ALTER TABLE `contact_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_solutions`
--

DROP TABLE IF EXISTS `digital_solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digital_solutions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_title` varchar(255) NOT NULL,
  `card_subtitle` varchar(255) DEFAULT NULL,
  `card_description` text,
  `order` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_solutions`
--

LOCK TABLES `digital_solutions` WRITE;
/*!40000 ALTER TABLE `digital_solutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_award`
--

DROP TABLE IF EXISTS `esg_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_award` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_award`
--

LOCK TABLES `esg_award` WRITE;
/*!40000 ALTER TABLE `esg_award` DISABLE KEYS */;
INSERT INTO `esg_award` VALUES (1,'/uploads/images/image-1765816602155-192434509.png','Most Diversified Sustainable Company (India) by The Business Concept',1,1,'2025-11-27 20:20:45','2025-12-15 16:36:44'),(2,'/uploads/images/image-1765816622169-594133179.png','Bronze Prize of Asia\'s Best Integrated Report for our First-ever Sustainability Report by AIRA',2,1,'2025-11-27 20:20:45','2025-12-15 16:37:04'),(3,'/uploads/images/image-1765816637903-886621510.png','International Green Apple Environment Award 2024',3,1,'2025-11-27 20:20:45','2025-12-15 16:37:20'),(4,'/uploads/images/image-1765816665493-449156288.png','Best Waste Management Solution Award',4,1,'2025-11-27 20:20:45','2025-12-15 16:37:53'),(5,'/uploads/images/image-1765816692174-272639851.png','ESG Excellence Award by ESG Grit Awards',5,1,'2025-11-27 20:20:45','2025-12-15 16:38:17');
/*!40000 ALTER TABLE `esg_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_awards_section`
--

DROP TABLE IF EXISTS `esg_awards_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_awards_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_awards_section`
--

LOCK TABLES `esg_awards_section` WRITE;
/*!40000 ALTER TABLE `esg_awards_section` DISABLE KEYS */;
INSERT INTO `esg_awards_section` VALUES (1,'Awards & Accolades',1,'2025-11-27 20:20:45','2025-11-27 20:20:45');
/*!40000 ALTER TABLE `esg_awards_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_collaboration_section`
--

DROP TABLE IF EXISTS `esg_collaboration_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_collaboration_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_collaboration_section`
--

LOCK TABLES `esg_collaboration_section` WRITE;
/*!40000 ALTER TABLE `esg_collaboration_section` DISABLE KEYS */;
INSERT INTO `esg_collaboration_section` VALUES (1,'Collaboration & Membership',1,'2025-11-27 20:33:29','2025-11-27 20:33:29');
/*!40000 ALTER TABLE `esg_collaboration_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_developmental_org`
--

DROP TABLE IF EXISTS `esg_developmental_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_developmental_org` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `logo` text NOT NULL,
  `content` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_developmental_org`
--

LOCK TABLES `esg_developmental_org` WRITE;
/*!40000 ALTER TABLE `esg_developmental_org` DISABLE KEYS */;
INSERT INTO `esg_developmental_org` VALUES (1,'Damooga Foundation','/uploads/images/image-1765816856015-884564566.png','Damooga Foundation is a leading IT-enabled environmental NGO in India. Founded in 2014, it is driven by a group of young and passionate nature lovers. Damooga collaborates with individuals, corporate houses, educational and non-educational institutions, social groups and communities, NGOs, social entrepreneurs, and anyone committed to creating a positive impact on society and the environment.',1,1,'2025-11-27 20:33:29','2025-12-15 16:40:59'),(2,'Friends of Tribals Society','/uploads/images/image-1765816835870-761064644.jpg','Friends of Tribals Society (FTS), established in 1989 and based in Kolkata, is a non-profit organization dedicated to uplifting underprivileged rural and tribal communities across India. Operating through 37 chapters in 25 states, its flagship initiative—the One Teacher School (OTS) or Ekal Vidyalaya—provides non-formal primary education to children aged 4 to 14. These schools focus on five key areas: functional literacy, healthcare, development education, empowerment, and value-based education (Sanskar). FTS was honored with the Gandhi Peace Prize in 2017 for its impactful grassroots work.',2,1,'2025-11-27 20:33:29','2025-12-15 16:40:39');
/*!40000 ALTER TABLE `esg_developmental_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_developmental_orgs_section`
--

DROP TABLE IF EXISTS `esg_developmental_orgs_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_developmental_orgs_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_developmental_orgs_section`
--

LOCK TABLES `esg_developmental_orgs_section` WRITE;
/*!40000 ALTER TABLE `esg_developmental_orgs_section` DISABLE KEYS */;
INSERT INTO `esg_developmental_orgs_section` VALUES (1,'Developmental Organizations',1,'2025-11-27 20:33:29','2025-11-27 20:33:29');
/*!40000 ALTER TABLE `esg_developmental_orgs_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_governance_item`
--

DROP TABLE IF EXISTS `esg_governance_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_governance_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_governance_item`
--

LOCK TABLES `esg_governance_item` WRITE;
/*!40000 ALTER TABLE `esg_governance_item` DISABLE KEYS */;
INSERT INTO `esg_governance_item` VALUES (1,'Grievance Mechanism','/uploads/pdfs/pdf-1765817850519-906077424.pdf',1,1,'2025-11-27 20:49:51','2025-12-15 16:57:33'),(2,'Annual Reports','/uploads/pdfs/pdf-1765817864766-515711725.pdf',2,1,'2025-11-27 20:49:51','2025-12-15 16:57:46'),(3,'BRSR','/uploads/pdfs/pdf-1765817876307-371826558.pdf',3,1,'2025-11-27 20:49:51','2025-12-15 16:57:57');
/*!40000 ALTER TABLE `esg_governance_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_governance_section`
--

DROP TABLE IF EXISTS `esg_governance_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_governance_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_governance_section`
--

LOCK TABLES `esg_governance_section` WRITE;
/*!40000 ALTER TABLE `esg_governance_section` DISABLE KEYS */;
INSERT INTO `esg_governance_section` VALUES (1,'Governance',1,'2025-11-27 20:49:51','2025-11-27 20:49:51');
/*!40000 ALTER TABLE `esg_governance_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_hero`
--

DROP TABLE IF EXISTS `esg_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description1` text,
  `description2` text,
  `background_image` text,
  `button1_text` varchar(255) DEFAULT NULL,
  `button1_link` varchar(255) DEFAULT NULL,
  `button2_text` varchar(255) DEFAULT NULL,
  `button2_link` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_hero`
--

LOCK TABLES `esg_hero` WRITE;
/*!40000 ALTER TABLE `esg_hero` DISABLE KEYS */;
INSERT INTO `esg_hero` VALUES (1,'ESG','At Refex, we\'re constantly changing from the inside to change the world outside.','Learn how our business strives to make a difference.','/uploads/images/image-1765815679349-602481222.jpg','Download Sustainability Report','/uploads/pdfs/pdf-1765876725095-265499663.pdf','BRSR Report','/uploads/pdfs/pdf-1765817678732-619859739.pdf',1,'2025-11-27 18:26:36','2025-12-16 09:18:47');
/*!40000 ALTER TABLE `esg_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_hr_item`
--

DROP TABLE IF EXISTS `esg_hr_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_hr_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_hr_item`
--

LOCK TABLES `esg_hr_item` WRITE;
/*!40000 ALTER TABLE `esg_hr_item` DISABLE KEYS */;
INSERT INTO `esg_hr_item` VALUES (1,'Employee Benefits and ESOP','/uploads/pdfs/pdf-1765817896030-870991829.pdf',1,1,'2025-11-27 20:59:15','2025-12-15 16:58:18');
/*!40000 ALTER TABLE `esg_hr_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_hr_section`
--

DROP TABLE IF EXISTS `esg_hr_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_hr_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_hr_section`
--

LOCK TABLES `esg_hr_section` WRITE;
/*!40000 ALTER TABLE `esg_hr_section` DISABLE KEYS */;
INSERT INTO `esg_hr_section` VALUES (1,'HR',1,'2025-11-27 20:59:15','2025-11-27 20:59:15');
/*!40000 ALTER TABLE `esg_hr_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_main_collaboration`
--

DROP TABLE IF EXISTS `esg_main_collaboration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_main_collaboration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `logo` text NOT NULL,
  `content` text,
  `large_image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_main_collaboration`
--

LOCK TABLES `esg_main_collaboration` WRITE;
/*!40000 ALTER TABLE `esg_main_collaboration` DISABLE KEYS */;
INSERT INTO `esg_main_collaboration` VALUES (1,'United Nations Global Compact – Network India (UNGC NI)','/uploads/images/image-1765816945151-566402994.jpg','The UN Global Compact Network India serves as a vital platform for advancing the ten universally endorsed principles within the Indian business landscape. These principles, integral to fostering sustainable and responsible corporate citizenship, align with broader global objectives like the Millennium Development Goals (MDGs) and post-2015 development agendas.','/uploads/images/image-1765816954536-93567538.jpg',1,'2025-11-27 20:33:29','2025-12-15 16:42:36');
/*!40000 ALTER TABLE `esg_main_collaboration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_policies_section`
--

DROP TABLE IF EXISTS `esg_policies_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_policies_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_policies_section`
--

LOCK TABLES `esg_policies_section` WRITE;
/*!40000 ALTER TABLE `esg_policies_section` DISABLE KEYS */;
INSERT INTO `esg_policies_section` VALUES (1,'ESG POLICIES','Sustainable development is a fundamental value we prioritize. Our management team is deeply dedicated to this objective, ensuring it is embedded in our policies and procedures covering environmental, social, and governance aspects.',1,'2025-11-27 18:56:01','2025-11-27 18:56:01');
/*!40000 ALTER TABLE `esg_policies_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_policy`
--

DROP TABLE IF EXISTS `esg_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_policy`
--

LOCK TABLES `esg_policy` WRITE;
/*!40000 ALTER TABLE `esg_policy` DISABLE KEYS */;
INSERT INTO `esg_policy` VALUES (1,'Quality Policy','/uploads/images/image-1765815859351-530262931.jpg','/uploads/pdfs/pdf-1765817715145-83707794.pdf',1,1,'2025-11-27 18:56:01','2025-12-15 16:55:17'),(2,'EHS policy','/uploads/images/image-1765815871672-974656745.jpg','/uploads/pdfs/pdf-1765817727211-869386474.pdf',2,1,'2025-11-27 18:56:01','2025-12-15 16:55:29'),(3,'Sustainability Policy','/uploads/images/image-1765815907602-622691855.jpg','/uploads/pdfs/pdf-1765817742370-75353604.pdf',3,1,'2025-11-27 18:56:01','2025-12-15 16:55:45'),(4,'Grievance Policy','/uploads/images/image-1765815927973-97714603.png','/uploads/pdfs/pdf-1765817756204-120953420.pdf',4,1,'2025-11-27 18:56:01','2025-12-15 16:55:58');
/*!40000 ALTER TABLE `esg_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_program`
--

DROP TABLE IF EXISTS `esg_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_program` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `content` text NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_program`
--

LOCK TABLES `esg_program` WRITE;
/*!40000 ALTER TABLE `esg_program` DISABLE KEYS */;
INSERT INTO `esg_program` VALUES (1,'Energy Transition Program','/uploads/images/image-1765816070072-471052885.jpg','<div class=\"space-y-4\"><p>As a part of our commitment to clean energy transition, we are becoming increasingly reliant on renewable energy sources for conducting our business operations. In the financial year (FY2022-23), we commissioned 50.76 KWp rooftop solar power plant at our Refrigerant gas factory.</p><p>The plant uses \'Solex\' make 545 WP, Mono PERC PV solar modules, and \'Growatt\' make solar inverters. The solar power plant will be generating 92,637 units per year offsetting 65 MT of CO2 and is a significant step towards our Net Zero Goal through this energy transition program.</p><p>The plant is now operational 100 % on renewable solar energy. The plant is a net explorer of solar energy in FY2024-25 which will be a significant milestone in our sustainability journey.</p></div>',1,1,'2025-11-27 19:48:44','2025-12-15 16:27:53'),(2,'Water Stewardship','/uploads/images/image-1765816084641-372566196.jpg','<div class=\"space-y-4\"><p>We are dedicated to water stewardship and have undertaken comprehensive measures to ensure its effective implementation. Rainwater harvesting and ground recharge wells have therefore been made mandatory at all operational sites.</p><ul class=\"list-none space-y-2\"><li><span>Under the </span><strong>Nirmal Jal initiative</strong><span>, restored </span><strong>22,000 sq. ft. Vannan Pond</strong><span> in Ward 29, Kunrathur Municipality, Kanchipuram District—previously silted and polluted, causing odor and pest issues.</span></li><li><span>Successfully restored a </span><strong>28,000 sq. ft. water body</strong><span> in the remote hilltop village of </span><strong>Nekhnamali</strong><span>.</span></li><li><span>Initiated restoration of a </span><strong>1 km-long water body</strong><span> in </span><strong>Kholan village</strong><span>, </span><strong>Titlagarh district</strong><span>.</span></li></ul><p>By reducing freshwater demand, offsetting our water demand through waterbodies restoration & rainwater harvesting, and with the judicious use of water resources, we aim to achieve water positivity by 2035.</p></div>',2,1,'2025-11-27 19:48:44','2025-12-15 16:28:07'),(3,'Material Circularity and Waste Management','/uploads/images/image-1765816102439-215270408.jpg','<div class=\"space-y-4\"><p>Ash generated by thermal power plants bears serious risks of environmental hazards. We have developed an unmatched capability in mitigating this through our eco-friendly, innovative and collaborative management practices in disposing, recycling and repurposing fly ash and bottom ash in a safe and sustainable manner contributing significantly to environmental protection.</p><p>Having established a comprehensive business network, comprising manufacturers, contractors, and abandoned mine owners, we maximise waste recycling in an eco-friendly manner as well as provide regular training on waste management awareness to relevant stakeholders. As the largest organized player in India\'s ash management industry, Refex has successfully worked across 30+ plants and utilized more than 250 lakh metric tons of ash over the past six years.</p></div>',3,1,'2025-11-27 19:48:44','2025-12-15 16:28:25'),(4,'Health & Safety','/uploads/images/image-1765816149520-659217805.jpg','<div class=\"space-y-4\"><p>At Refex, the health and safety of our employees and workers is a top priority, which is why we have implemented Mission Zero Harm to property, people and the environment. To achieve this, we have successfully implemented the occupational health and safety management system (OHSMS) and are certified to ISO 4500:2015.</p><p>This comprehensive approach to occupational health and safety management enables us to proactively identify and address potential hazards, ensuring the prevention of incidents/accidents and the promotion of a safety-oriented culture. Through meticulous risk assessments, thorough employee training, and a commitment to continuous improvement, we strive to create a work environment that is safe and conducive to the well-being of our employees, workers, and value chain partners. The safety performance remained strong, with zero fatalities, zero reportable lost time injuries.</p></div>',4,1,'2025-11-27 19:48:44','2025-12-15 16:29:12'),(5,'CSR Thrust Areas & Projects','/uploads/images/image-1765816164657-295026997.jpg','<div class=\"space-y-4\"><p>Creating significant social value and making a positive impact in our communities is integral to our business ethos. Our Corporate Social Responsibility (CSR) initiatives are meticulously executed with transparency and accountability, underscoring our dedication to ethical business conduct. Refex focuses on four major thematic areas of CSR activities for end-value creation namely biodiversity conservation, water stewardship, education, and healthcare.</p><ul class=\"space-y-3\"><li class=\"flex items-start gap-3\"><i class=\"ri-check-line text-[#7cd244] text-xl flex-shrink-0 mt-1\"></i><div><strong class=\"text-gray-900\">Education:</strong><ul class=\"mt-2 space-y-1 ml-4\"><li class=\"flex items-start gap-2\"><strong class=\"flex-shrink-0\">-</strong><span>Financial aid to socially and economically backward students</span></li><li class=\"flex items-start gap-2\"><strong class=\"flex-shrink-0\">-</strong><span>Trophy prize distribution to cultivate interest in education</span></li><li class=\"flex items-start gap-2\"><strong class=\"flex-shrink-0\">-</strong><span>Supported 30 tribal schools across 30 villages in Chhattisgarh, benefiting around 600 children by improving access to quality early education.</span></li><li class=\"flex items-start gap-2\"><strong class=\"flex-shrink-0\">-</strong><span>In Bhasma, Sundargarh district, support extended to a residential school for 45 students, including orphans and children from underprivileged backgrounds.</span></li></ul></div></li><li class=\"flex items-start gap-3\"><i class=\"ri-check-line text-[#7cd244] text-xl flex-shrink-0 mt-1\"></i><span class=\"text-gray-900\"><strong>Biodiversity Conservation</strong></span></li><li class=\"flex items-start gap-3\"><i class=\"ri-check-line text-[#7cd244] text-xl flex-shrink-0 mt-1\"></i><span class=\"text-gray-900\"><strong>Water Stewardship</strong></span></li><li class=\"flex items-start gap-3\"><i class=\"ri-check-line text-[#7cd244] text-xl flex-shrink-0 mt-1\"></i><span class=\"text-gray-900\"><strong>Healthcare</strong></span></li></ul></div>',5,1,'2025-11-27 19:48:44','2025-12-15 16:29:28');
/*!40000 ALTER TABLE `esg_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_programs_section`
--

DROP TABLE IF EXISTS `esg_programs_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_programs_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_programs_section`
--

LOCK TABLES `esg_programs_section` WRITE;
/*!40000 ALTER TABLE `esg_programs_section` DISABLE KEYS */;
INSERT INTO `esg_programs_section` VALUES (1,'PROGRAMS',1,'2025-11-27 19:48:44','2025-11-27 19:48:44');
/*!40000 ALTER TABLE `esg_programs_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_refex_on_esg`
--

DROP TABLE IF EXISTS `esg_refex_on_esg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_refex_on_esg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_refex_on_esg`
--

LOCK TABLES `esg_refex_on_esg` WRITE;
/*!40000 ALTER TABLE `esg_refex_on_esg` DISABLE KEYS */;
INSERT INTO `esg_refex_on_esg` VALUES (1,'Refex on ESG','At Refex Industries Limited, we believe in creating a better world through sustainable business practices. We prioritize People, Planet, and Profit equally and are committed to becoming an ESG champion and carbon-neutral company.\n\nBy aligning with the United Nations Sustainable Development Goals, we are taking action towards a brighter future. We invite you to join hands with Refex Group in our efforts towards sustainability and make a positive impact on the world!','/uploads/images/image-1765815698445-474664639.jpg',1,'2025-11-27 18:32:42','2025-12-15 16:21:40');
/*!40000 ALTER TABLE `esg_refex_on_esg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_report`
--

DROP TABLE IF EXISTS `esg_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_report`
--

LOCK TABLES `esg_report` WRITE;
/*!40000 ALTER TABLE `esg_report` DISABLE KEYS */;
INSERT INTO `esg_report` VALUES (1,'Sustainability Report','/uploads/images/image-1765876767489-925282129.jpg','/uploads/pdfs/pdf-1765876744406-741984587.pdf',1,1,'2025-11-27 19:03:35','2025-12-16 09:19:31'),(2,'BRSR','/uploads/images/image-1765815975652-392550065.jpg','/uploads/pdfs/pdf-1765817786941-340464918.pdf',2,1,'2025-11-27 19:03:35','2025-12-15 16:56:31'),(3,'ESG Performance Dashboard','/uploads/images/image-1765815986368-883738685.jpg','/uploads/pdfs/pdf-1765817802708-889722735.pdf',3,1,'2025-11-27 19:03:35','2025-12-15 16:56:45');
/*!40000 ALTER TABLE `esg_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_reports_section`
--

DROP TABLE IF EXISTS `esg_reports_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_reports_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_reports_section`
--

LOCK TABLES `esg_reports_section` WRITE;
/*!40000 ALTER TABLE `esg_reports_section` DISABLE KEYS */;
INSERT INTO `esg_reports_section` VALUES (1,'REPORTS',1,'2025-11-27 19:03:35','2025-11-27 19:03:35');
/*!40000 ALTER TABLE `esg_reports_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_sdg_section`
--

DROP TABLE IF EXISTS `esg_sdg_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_sdg_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_sdg_section`
--

LOCK TABLES `esg_sdg_section` WRITE;
/*!40000 ALTER TABLE `esg_sdg_section` DISABLE KEYS */;
INSERT INTO `esg_sdg_section` VALUES (1,'SUSTAINABLE DEVELOPMENT GOALS','We\'re all about making the world a better place! We\'re committed to working with India and the UN to achieve United Nations Sustainable Development Goals, because we know that together we can make a big difference. We\'re not just focused on making our shareholders happy – we\'re all about creating value for everyone involved, including the planet!\n\nWe\'re so proud to be a member of UNGC and to be working with partners around the world to make the world a better place. We\'re all about ethical business practices and doing our part to solve some of the biggest challenges of our time. Let\'s make the world a better place, together!','/uploads/images/image-1765816219043-831141498.jpg',1,'2025-11-27 19:56:09','2025-12-15 16:30:21');
/*!40000 ALTER TABLE `esg_sdg_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_sustainable_business`
--

DROP TABLE IF EXISTS `esg_sustainable_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_sustainable_business` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_sustainable_business`
--

LOCK TABLES `esg_sustainable_business` WRITE;
/*!40000 ALTER TABLE `esg_sustainable_business` DISABLE KEYS */;
INSERT INTO `esg_sustainable_business` VALUES (1,'Sustainable Business Model','In the fast-evolving landscape of the business world, only a handful of companies manage to transcend the boundaries of their niche and ascend to the coveted status of a regime. Refex Industries Limited stands tall among such remarkable success stories that have taken India to the world – from our humble beginnings in a specialized market in refrigerant gases to becoming a major entity working across diverse business verticals. Refex Industries Limited\'s business model is pivotal to sustainability, innovation, and offering eco-friendly solutions.\n\nAlongside these efforts, our ash handling division continues to mitigate environmental risks and climate change by facilitating mine rehabilitation, recycling coal ash and ensuring material circularity, converting degraded land into usable spaces, and reducing the strain on agricultural and forest areas.\n\nRefex Green Mobility Limited (RGML), a subsidiary of Refex Industries Limited (RIL), proudly emerged into the mobility space during the fiscal year 2022-23, making a profound statement of Refex Group\'s unwavering dedication to embracing a green business model and making substantial contributions to combat climate change.\n\nVenwind Refex is advancing India\'s clean energy transition through sustainable wind turbine manufacturing. In collaboration with global technology leaders, we deliver efficient, reliable, and environmentally responsible solutions—driven by local production and a strong supply chain to enable scalable, low-carbon growth.','/uploads/images/image-1765815833387-139034957.jpg',1,'2025-11-27 18:47:56','2025-12-15 16:23:56');
/*!40000 ALTER TABLE `esg_sustainable_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_unsdg_action`
--

DROP TABLE IF EXISTS `esg_unsdg_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_unsdg_action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `points` json NOT NULL,
  `video` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_unsdg_action`
--

LOCK TABLES `esg_unsdg_action` WRITE;
/*!40000 ALTER TABLE `esg_unsdg_action` DISABLE KEYS */;
INSERT INTO `esg_unsdg_action` VALUES (1,'/uploads/images/image-1765816253346-797027984.png','Good Health and Well-being','[\"Affordable medical diagnosis through our indigenously made affordable MRI and X-ray machines\", \"Certified with ISO 45001 through a successful implementation of the Occupational Health and Safety Management System\", \"Regular sessions conducted on the mental well-being of employees followed by counseling\"]',NULL,1,1,'2025-11-27 20:10:22','2025-12-15 16:30:57'),(2,'/uploads/images/image-1765816273406-78336364.png','Quality Education','[\"Merit scholarship and financial support to 5 Children in Ramakrishna Mission School, Chennai\", \"Accommodation support for 30 UPSC appearing candidates in Delhi NCR region\", \"Supported 30 tribal schools across 30 villages in Chhattisgarh, benefiting around 600 children by improving access to quality early education\", \"In Bhasma, Sundargarh district, support extended to a residential school for 45 students, including orphans and children from underprivileged backgrounds\"]',NULL,2,1,'2025-11-27 20:10:22','2025-12-15 16:31:16'),(3,'/uploads/images/image-1765816289589-142332075.png','Gender Equality','[\"Currently, women make up 11% of our workforce, and we aim to increase this representation to 15% within the next two years\", \"Implemented a \'Wellness Work from Home\' choice, enabling women to prioritise self-care during their menstrual cycle\"]',NULL,3,1,'2025-11-27 20:10:22','2025-12-15 16:31:33'),(4,'/uploads/images/image-1765816309752-912176114.png','Clean Water & Sanitation','[\"Our \\\"Nirmal Jal\\\" initiative strives to ensure accessible clean water by rejuvenating dependent water bodies and rainwater harvesting\", \"We aim to become water positive by 2035\"]','https://www.youtube.com/embed/Jlk4HC70Jek?rel=0&modestbranding=1&showinfo=0&controls=0',4,1,'2025-11-27 20:10:22','2025-12-15 16:31:52'),(5,'/uploads/images/image-1765816329202-439844220.png','Affordable & Clean Energy','[\"Operating a 68 MW solar power facility at the Bhilai Plant, and supplying uninterupted solar energy to South East Central Railway through a power purchase agreement (PPA)\", \"Incorporated smart grid systems to elevate the efficiency and dependability of the solar power plant\", \"Set up and commissioned two 1MW - 2MWH-BESS Solar Plant at Pratapur and Siachen for Indian Army\", \"Our refrigerant gas plant is operational on 100% renewable solar energy\"]',NULL,5,1,'2025-11-27 20:10:22','2025-12-15 16:32:11'),(6,'/uploads/images/image-1765816354435-77180212.png','Industry, Innovation and Infrastructure','[\"MedTech pioneers groundbreaking medical imaging technology, encompassing indigenously made X-ray and MRI machines, empowered by innovation and digital imaging for elevated diagnostics\", \"Venwind Refex is focused on advancing India\'s clean energy future by manufacturing sustainable wind turbines to deliver scalable, low-carbon energy solutions.\"]',NULL,6,1,'2025-11-27 20:10:22','2025-12-15 16:32:37'),(7,'/uploads/images/image-1765816374196-265641588.png','Reduced Inequalities','[\"Workforce Experience Blend: A harmonious mix of youthful energy and seasoned expertise among Refexians\", \"We offer regional religious holidays that cater to their diverse festive observances, with a holiday calendar tailored to respect individual religious inclinations\", \"We have well-rounded diversity within our organisation, embracing a harmonious mix of religious, linguistic, geographical, and age variations\"]',NULL,7,1,'2025-11-27 20:10:22','2025-12-15 16:33:23'),(8,'/uploads/images/image-1765816422590-462678210.png','Sustainable Cities and Communities','[\"RGML\'s pioneering services promote sustainable urban transportation by transitioning businesses to EVs for employees commuting in the B2B model and B2B2C model in major cities like Mumbai, Bengaluru, Hyderabad, Pune, and Chennai\"]',NULL,8,1,'2025-11-27 20:10:22','2025-12-15 16:33:45'),(9,'/uploads/images/image-1765816527466-995905982.png','Responsible Consumption & Production','[\"Ash and Coal handling business facilitates eco-friendly disposal and management of ash partnering with the cement manufacturing plant, brick manufacturer, and block industries ensuring circularity of material and GHG emission reduction\"]',NULL,9,1,'2025-11-27 20:10:22','2025-12-15 16:35:29'),(10,'/uploads/images/image-1765816545908-844322359.png','Climate Action','[\"Refex strives for an annual 10% reduction in energy intensity relative to the FY 2022-23 baseline\", \"Target to become carbon neutral by 2040\", \"More focus to utilize renewable energy for company operations\"]',NULL,10,1,'2025-11-27 20:10:22','2025-12-15 16:35:50'),(11,'/uploads/images/image-1765816567113-401149899.png','Life on Land','[\"Pledged to plant and nurture 1,00,000 saplings by 2035.\", \"Planted 5000 saplings in FY 2023-24 and in the process of planting 10,000 mangrove saplings by FY 2026\", \"Collaborating with UNGC Network India and established a Corporate Centre on Biodiversity Conservation.\"]',NULL,11,1,'2025-11-27 20:10:22','2025-12-15 16:36:10'),(12,'/uploads/images/image-1765816586598-993592412.png','Partnerships for the Goals','[\"Refex is proud to be part of the United Nations Global Compact (UNGC). By joining forces with other partners, we\'re committed to ethical business practices and addressing the most pressing social and environmental issues\", \"We\'ve built a strong network of partners in the cement, brick, and block industries, local governments, educational institutions, concrete producers, road contractors, NGO, power plant operators and other industrial houses to promote and achieve UNSDG\"]',NULL,12,1,'2025-11-27 20:10:22','2025-12-15 16:36:28');
/*!40000 ALTER TABLE `esg_unsdg_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_unsdg_actions_section`
--

DROP TABLE IF EXISTS `esg_unsdg_actions_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_unsdg_actions_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_unsdg_actions_section`
--

LOCK TABLES `esg_unsdg_actions_section` WRITE;
/*!40000 ALTER TABLE `esg_unsdg_actions_section` DISABLE KEYS */;
INSERT INTO `esg_unsdg_actions_section` VALUES (1,'UN SDGs and our Actions',1,'2025-11-27 20:10:22','2025-11-27 20:10:22');
/*!40000 ALTER TABLE `esg_unsdg_actions_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flip_cards`
--

DROP TABLE IF EXISTS `flip_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flip_cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `back_image` text,
  `link` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flip_cards`
--

LOCK TABLES `flip_cards` WRITE;
/*!40000 ALTER TABLE `flip_cards` DISABLE KEYS */;
INSERT INTO `flip_cards` VALUES (1,'Sustainability & ESG','Minimizing our environmental impact, supporting ethical practices, and driving positive change for future generations.','http://localhost:8080/uploads/images/image-1765793585225-114752867.jpg','http://localhost:8080/uploads/images/image-1765793596632-45690721.webp','/esg/',1,1,'2025-11-27 05:53:58','2025-12-15 10:13:20'),(2,'Investors','Explore our financial reports, stock information, investor presentations, and key announcements to learn more about how we\'re building a future-focused business.','http://localhost:8080/uploads/images/image-1765793624972-599915214.jpg','http://localhost:8080/uploads/images/image-1765793695498-392064567.webp','/investors/',2,1,'2025-11-27 05:54:50','2025-12-15 10:14:57'),(3,'Life At Refex','Empowering people, celebrating diversity, and creating a culture where everyone feels valued.','https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/8818c5d55c5844bdefd4f3d1721b90ed.png','https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/c46bbd8b593bd9cb6b8790cb61632cd7.png','https://www.refex.group/careers/',3,1,'2025-11-27 05:55:53','2025-11-27 05:55:53');
/*!40000 ALTER TABLE `flip_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer`
--

DROP TABLE IF EXISTS `footer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sections` json NOT NULL COMMENT 'Array of footer sections with title and links',
  `social_links` json NOT NULL COMMENT 'Array of social media links with platform, url, and icon',
  `contact_email` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `nse_scrip_code` varchar(255) DEFAULT NULL,
  `bse_scrip_symbol` varchar(255) DEFAULT NULL,
  `isin` varchar(255) DEFAULT NULL,
  `complaints_title` varchar(255) DEFAULT NULL,
  `complaints_phone` varchar(255) DEFAULT NULL,
  `complaints_phone_url` text,
  `complaints_email` varchar(255) DEFAULT NULL,
  `copyright_text` text,
  `copyright_link` text,
  `copyright_link_text` varchar(255) DEFAULT NULL,
  `bottom_links` json NOT NULL COMMENT 'Array of bottom links (Privacy Policy, Terms of Use, etc.)',
  `background_image` text,
  `background_image_opacity` float DEFAULT '0.1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer`
--

LOCK TABLES `footer` WRITE;
/*!40000 ALTER TABLE `footer` DISABLE KEYS */;
INSERT INTO `footer` VALUES (2,'[{\"links\": [{\"href\": \"/about-us#core-values\", \"name\": \" Core Values\"}, {\"href\": \"/about-us#our-presence\", \"name\": \" Our Presence\"}, {\"href\": \"https://www.refex.group/diversity-inclusion/\", \"name\": \"Diversity & Inclusion\"}, {\"href\": \"/newsroom/\", \"name\": \" Newsroom\"}, {\"href\": \"https://www.refex.group/gallery/\", \"name\": \" Gallery\"}, {\"href\": \"https://www.refex.group/careers/\", \"name\": \" Careers\"}, {\"href\": \"https://www.refex.group/careers/?slide=3\", \"name\": \"ESOP Testimonials\"}], \"title\": \"About Us\"}, {\"links\": [{\"href\": \"/ash-utilization\", \"name\": \"Ash Utilization and Coal Handling\"}, {\"href\": \"/green-mobility\", \"name\": \"Green Mobility\"}, {\"href\": \"/venwind-refex\", \"name\": \" Venwind Refex\"}, {\"href\": \"/refrigerant-gas\", \"name\": \" Refrigerant Gas\"}], \"title\": \"Business\"}, {\"links\": [{\"href\": \"/esg/#refex-esg\", \"name\": \" Refex on ESG\"}, {\"href\": \"/esg/#esg-policies\", \"name\": \" ESG Policies\"}], \"title\": \"Sustainability\"}, {\"links\": [{\"href\": \"/investors/financial-information/\", \"name\": \" Financial Results\"}, {\"href\": \"/investors/annual-reports/\", \"name\": \" Annual Reports\"}, {\"href\": \"/investors/general-meeting-updates/\", \"name\": \" Notice of Board Meetings\"}, {\"href\": \"/investors/policies/\", \"name\": \" Policies\"}, {\"href\": \"/investors/credit-ratings/\", \"name\": \" Credit Ratings\"}, {\"href\": \"/investor-information/\", \"name\": \" Investor Information\"}, {\"href\": \"/investors/newspaper-publication/\", \"name\": \" Newspaper Publication\"}], \"title\": \"Investors\"}]','[{\"url\": \"https://www.facebook.com/refexindustrieslimited/\", \"icon\": \"ri-facebook-fill\", \"platform\": \"Facebook\"}, {\"url\": \"https://x.com/GroupRefex\", \"icon\": \"ri-twitter-x-fill\", \"platform\": \"Twitter\"}, {\"url\": \"https://www.youtube.com/@refexgroup\", \"icon\": \"ri-youtube-fill\", \"platform\": \"Youtube\"}, {\"url\": \"https://www.linkedin.com/company/refex-group/\", \"icon\": \"ri-linkedin-fill\", \"platform\": \"LinkedIn\"}, {\"url\": \"https://www.instagram.com/refexgroup/\", \"icon\": \"ri-instagram-fill\", \"platform\": \"Instagram\"}]','investor.relations@refex.co.in','L45200TN2002PLC049601',' REFEX',' 532884','INE056I01025','For any Complaints','+91 96297 38734','https://web.whatsapp.com/','refexcares@refex.co.in','© 2025','https://refex.co.in/#',NULL,'[{\"href\": \"/privacy-policy\", \"name\": \"Privacy Policy\"}, {\"href\": \"/terms-of-use\", \"name\": \"Terms of Use\"}]','http://localhost:8080/uploads/images/image-1765909433012-582136819.jpg',0.1,1,'2025-12-06 07:44:33','2025-12-16 18:46:25');
/*!40000 ALTER TABLE `footer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_brand_values`
--

DROP TABLE IF EXISTS `green_mobility_brand_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_brand_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `icon` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_brand_values`
--

LOCK TABLES `green_mobility_brand_values` WRITE;
/*!40000 ALTER TABLE `green_mobility_brand_values` DISABLE KEYS */;
INSERT INTO `green_mobility_brand_values` VALUES (1,'RELIABILITY','http://localhost:8080/uploads/images/image-1765801368112-167374910.png',1,1,'2025-11-27 11:12:54','2025-12-15 12:22:53'),(2,'SUSTAINABILITY','http://localhost:8080/uploads/images/image-1765801382507-469878640.png',2,1,'2025-11-27 11:12:54','2025-12-15 12:23:07'),(3,'SAFETY','http://localhost:8080/uploads/images/image-1765801404929-654814477.png',3,1,'2025-11-27 11:12:54','2025-12-15 12:23:28');
/*!40000 ALTER TABLE `green_mobility_brand_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_clients`
--

DROP TABLE IF EXISTS `green_mobility_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_clients`
--

LOCK TABLES `green_mobility_clients` WRITE;
/*!40000 ALTER TABLE `green_mobility_clients` DISABLE KEYS */;
INSERT INTO `green_mobility_clients` VALUES (1,'http://localhost:8080/uploads/images/image-1765801924725-750186085.jpg',1,1,'2025-11-27 12:20:28','2025-12-15 12:32:07'),(2,'http://localhost:8080/uploads/images/image-1765801935974-351525538.jpg',2,1,'2025-11-27 12:20:28','2025-12-15 12:32:17'),(3,'http://localhost:8080/uploads/images/image-1765801975191-263620590.jpg',4,1,'2025-11-27 12:20:28','2025-12-15 12:32:57'),(4,'http://localhost:8080/uploads/images/image-1765801947075-819270883.jpg',3,1,'2025-11-27 12:20:28','2025-12-15 12:32:40'),(5,'http://localhost:8080/uploads/images/image-1765801989974-418159840.jpg',5,1,'2025-11-27 12:20:28','2025-12-15 12:33:11'),(6,'http://localhost:8080/uploads/images/image-1765802004623-35170094.jpg',6,1,'2025-11-27 12:20:28','2025-12-15 12:33:27'),(7,'http://localhost:8080/uploads/images/image-1765802028702-868372290.jpg',7,1,'2025-11-27 12:20:28','2025-12-15 12:33:51');
/*!40000 ALTER TABLE `green_mobility_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_hero`
--

DROP TABLE IF EXISTS `green_mobility_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `slides` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_hero`
--

LOCK TABLES `green_mobility_hero` WRITE;
/*!40000 ALTER TABLE `green_mobility_hero` DISABLE KEYS */;
INSERT INTO `green_mobility_hero` VALUES (1,'Refex Mobility','The Most Trusted, Sustainable Mobility Partner in India','[{\"image\": \"http://localhost:8080/uploads/images/image-1765801290503-223945186.jpg\"}, {\"image\": \"http://localhost:8080/uploads/images/image-1765801298664-636244836.jpg\"}]',1,'2025-11-27 11:00:01','2025-12-15 12:21:39');
/*!40000 ALTER TABLE `green_mobility_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_impacts`
--

DROP TABLE IF EXISTS `green_mobility_impacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_impacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `icon` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_impacts`
--

LOCK TABLES `green_mobility_impacts` WRITE;
/*!40000 ALTER TABLE `green_mobility_impacts` DISABLE KEYS */;
INSERT INTO `green_mobility_impacts` VALUES (1,'436.16 lakh / 4.36+ crore','e-Kms covered','http://localhost:8080/uploads/images/image-1765801651866-697733675.svg',1,1,'2025-11-27 11:55:21','2025-12-15 12:27:34'),(2,'19+ lakh','Happy Riders','http://localhost:8080/uploads/images/image-1765801676574-74684416.svg',2,1,'2025-11-27 11:55:21','2025-12-15 12:27:58'),(3,'7.6+ lakh','Rides Completed','http://localhost:8080/uploads/images/image-1765801687094-11845227.svg',3,1,'2025-11-27 11:55:21','2025-12-15 12:28:09'),(4,'28.35+ lakh kg','Tailpipe CO₂ abated','http://localhost:8080/uploads/images/image-1765801758792-249919895.svg',4,1,'2025-11-27 11:55:21','2025-12-15 12:29:20');
/*!40000 ALTER TABLE `green_mobility_impacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_our_services`
--

DROP TABLE IF EXISTS `green_mobility_our_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_our_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` text,
  `description` text,
  `additional_text` text,
  `features_json` json DEFAULT NULL,
  `ride_types_json` json DEFAULT NULL,
  `cities_json` json DEFAULT NULL,
  `buttons_json` json DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_our_services`
--

LOCK TABLES `green_mobility_our_services` WRITE;
/*!40000 ALTER TABLE `green_mobility_our_services` DISABLE KEYS */;
INSERT INTO `green_mobility_our_services` VALUES (1,'EMPLOYEE TRANSPORTATION','http://localhost:8080/uploads/images/image-1765801822752-180946685.jpg','Our Employee Transfer service provides efficient and reliable transportation with multiple customizable models designed to meet the unique needs of each organization. Our employee commute service ensures a safe and seamless experience with clean cars and verified, professional drivers.','We are the most preferred mobility partner for leading MNCs, helping them transition to cleaner mobility solutions that align with their sustainability goals.','[{\"icon\": \"ri-money-dollar-circle-line\", \"title\": \"Cost Savings\"}, {\"icon\": \"ri-calendar-check-line\", \"title\": \"Easy Booking\"}, {\"icon\": \"ri-map-pin-line\", \"title\": \"Live-Tracking\"}]',NULL,NULL,NULL,1,1,'2025-11-27 12:03:45','2025-12-15 12:30:27'),(2,'ON-CALL / ON-DEMAND RIDES','http://localhost:8080/uploads/images/image-1765801893211-343307766.jpg','Refex Green Mobility offers flexible and customizable on-call ride packages for corporates and events designed to meet varying distance and time requirements. Choose from options such as 4hr/40km, 8hr/80km, or 10hr/100km, with the ability to tailor services based on your specific needs.',NULL,NULL,'[{\"icon\": \"ri-car-line\", \"title\": \"LOCAL RIDES\"}, {\"icon\": \"ri-plane-line\", \"title\": \"AIRPORT RIDES\"}]','[\"Chennai\", \"Bengaluru\", \"Mumbai\", \"Hyderabad\", \"Delhi\"]',NULL,2,1,'2025-11-27 12:03:45','2025-12-15 12:31:36'),(3,'CORPORATE AIRPORT TRANSFERS','http://localhost:8080/uploads/images/image-1765801907626-410133489.jpg','Individual travellers can conveniently book airport rides through the Refex Mobility app and Website for a hassle-free experience. Available in Chennai, Bangalore, Mumbai, Hyderabad, Delhi.','Individual travelers can conveniently book airport rides through the Refex eVeelz app and Website for a hassle free experience.',NULL,NULL,NULL,'[{\"link\": \"https://refex.co.in/wp-content/uploads/2024/12/Qr-code-eveelz.png\", \"text\": \"Download App\"}, {\"link\": \"https://booking.eveelz.in/\", \"text\": \"Book Airport Taxi\"}]',3,1,'2025-11-27 12:03:45','2025-12-15 12:31:50');
/*!40000 ALTER TABLE `green_mobility_our_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_services`
--

DROP TABLE IF EXISTS `green_mobility_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` text,
  `image_position` enum('left','right') NOT NULL DEFAULT 'left',
  `subtitle` text,
  `points_json` json DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_services`
--

LOCK TABLES `green_mobility_services` WRITE;
/*!40000 ALTER TABLE `green_mobility_services` DISABLE KEYS */;
INSERT INTO `green_mobility_services` VALUES (1,'Reliable Transport Solution','http://localhost:8080/uploads/images/image-1765801601409-296442844.png','left','We provide bundled offerings –','[\"Corporate transport solutions\", \"Complete in-house fleet management\", \"Technology-integrated operations\", \"Premium experience with well-trained, courteous chauffeurs\", \"End-to-end route mapping for transport efficiency\", \"Real-time, tech-driven vehicle monitoring\", \"Ensured employee safety and security\"]',1,1,'2025-11-27 11:31:50','2025-12-15 12:26:46'),(2,'Leveraging Technology','http://localhost:8080/uploads/images/image-1765801615548-607795340.jpg','left',NULL,'[\"End-to-end monitoring via a command and control centre\", \"Battery Management System\", \"Exclusive App available for Commuters, Drivers, Corporate Supervisors\", \"Alerts and notifications, routing algorithms (safety measures), instant billing, etc.\", \"Analytics dashboard\"]',2,1,'2025-11-27 11:31:50','2025-12-15 12:26:59'),(3,'Safety Guaranteed','http://localhost:8080/uploads/images/image-1765801628881-20050387.jpg','left','We ensure the complete safety of your employees and commuters and have in place a very robust protocol and practices.','[\"Complete background verification of our drivers\", \"Highly trained and skilful chauffeurs\", \"Digital remote monitoring, speed governance, and GPS\", \"Regular medical screening and fitness checks of our Chauffeurs\", \"Regular behavioural training for our Chauffeurs to sensitize them on how to deal with the LGBT community, persons with special abilities, and elderly persons\", \"Swift action on complaints received through our helpline number\"]',3,1,'2025-11-27 11:31:50','2025-12-15 12:27:13');
/*!40000 ALTER TABLE `green_mobility_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_sustainability`
--

DROP TABLE IF EXISTS `green_mobility_sustainability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_sustainability` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `additional_text` text,
  `background_image` text,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_sustainability`
--

LOCK TABLES `green_mobility_sustainability` WRITE;
/*!40000 ALTER TABLE `green_mobility_sustainability` DISABLE KEYS */;
INSERT INTO `green_mobility_sustainability` VALUES (1,'SUSTAINABLE MOBILITY REDEFINED','With Refex Mobility, embrace a new standard in urban commuting. Our cleaner-fuelled vehicles, from comfortable sedans to premium SUVs, are tailored for efficiency and environmental responsibility.','Whether it\'s for daily commute or corporate bookings, we have the right vehicles','http://localhost:8080/uploads/images/image-1765802047790-363683407.jpg','Visit Website','https://refexmobility.com/',1,'2025-11-27 12:26:58','2025-12-15 12:34:10');
/*!40000 ALTER TABLE `green_mobility_sustainability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_testimonials`
--

DROP TABLE IF EXISTS `green_mobility_testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_testimonials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_testimonials`
--

LOCK TABLES `green_mobility_testimonials` WRITE;
/*!40000 ALTER TABLE `green_mobility_testimonials` DISABLE KEYS */;
INSERT INTO `green_mobility_testimonials` VALUES (1,'Refex eVeelz sets a golden standard for airport transfers. We are happy with consistently reliable, professional drivers and impeccable service every time. For premium eco-friendly airport rides, Refex Green Mobility is our only choice.','Varun Keswani','Transferz','http://localhost:8080/uploads/images/image-1765802068004-960480030.png',0,1,'2025-11-27 12:35:27','2025-12-15 12:34:29'),(2,'We bring in a lot of guest speakers and mentors, and this mobility service has made a world of difference. Our guests always comment on how smooth the ride is, and they appreciate not having to figure out transportation after a long flight. It makes everything easier for us and for them.','Anonymous',NULL,'http://localhost:8080/uploads/images/image-1765802078686-423357221.jpeg',1,1,'2025-11-27 12:35:27','2025-12-15 12:34:43'),(3,'We are happy with the employee transportation service! It has definitely improved our team\'s daily travel experience. Reliable, punctual, safe and comfortable','Anonymous',NULL,'http://localhost:8080/uploads/images/image-1765802138008-151717394.jpeg',2,1,'2025-11-27 12:35:27','2025-12-15 12:35:41'),(4,'I booked this ride for my daughter who was travelling alone. This time she was so happy because of the receiving method and behaviour of the driver. Extremely happy!','Anonymous',NULL,'http://localhost:8080/uploads/images/image-1765802151319-428179878.jpeg',3,1,'2025-11-27 12:35:27','2025-12-15 12:35:53');
/*!40000 ALTER TABLE `green_mobility_testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_who_we_are`
--

DROP TABLE IF EXISTS `green_mobility_who_we_are`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_who_we_are` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slides` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_who_we_are`
--

LOCK TABLES `green_mobility_who_we_are` WRITE;
/*!40000 ALTER TABLE `green_mobility_who_we_are` DISABLE KEYS */;
INSERT INTO `green_mobility_who_we_are` VALUES (1,'WHO WE ARE','Refex Green Mobility Limited (RGML) is a wholly-owned subsidiary of Refex Group\'s flagship listed entity, Refex Industries Limited. RGML underscores the group\'s commitment to sustainability and delivers clean mobility services for corporate transportation needs and B2B2C use cases with 1400+ company-owned vehicles. It leverages technology and aims to transform the mobility sector.\n\nOperating under the brand name \"Refex Mobility\", RGML runs 100% cleaner-fueled vehicles. At Refex Mobility, we go beyond transportation, and we invite you to be part of a movement redefining sustainable mobility.\n\nEnhance your journey with us and step into a future where sustainability meets innovation.','[{\"image\": \"http://localhost:8080/uploads/images/image-1765801326575-259610516.jpg\"}, {\"image\": \"http://localhost:8080/uploads/images/image-1765801337556-916677957.jpg\"}]',1,'2025-11-27 11:06:01','2025-12-15 12:22:18');
/*!40000 ALTER TABLE `green_mobility_who_we_are` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `green_mobility_why_choose_us`
--

DROP TABLE IF EXISTS `green_mobility_why_choose_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `green_mobility_why_choose_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `icon` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `green_mobility_why_choose_us`
--

LOCK TABLES `green_mobility_why_choose_us` WRITE;
/*!40000 ALTER TABLE `green_mobility_why_choose_us` DISABLE KEYS */;
INSERT INTO `green_mobility_why_choose_us` VALUES (1,'Clean, sanitized and well-maintained vehicles','http://localhost:8080/uploads/images/image-1765801462640-467976887.png',1,1,'2025-11-27 11:20:34','2025-12-15 12:24:24'),(2,'Professionally trained and compliant chauffeurs','http://localhost:8080/uploads/images/image-1765801476215-579156788.png',2,1,'2025-11-27 11:20:34','2025-12-15 12:24:38'),(3,'Robust travel safety features available','http://localhost:8080/uploads/images/image-1765801487412-352346984.png',3,1,'2025-11-27 11:20:34','2025-12-15 12:24:48'),(4,'Tech-driven trip management tools','http://localhost:8080/uploads/images/image-1765801509684-155778159.png',4,1,'2025-11-27 11:20:34','2025-12-15 12:25:11'),(5,'Zero cancellation','http://localhost:8080/uploads/images/image-1765801536377-339990993.svg',5,1,'2025-11-27 11:20:34','2025-12-15 12:25:38'),(6,'Customized packages to suit your needs','http://localhost:8080/uploads/images/image-1765801562418-553880809.svg',6,1,'2025-11-27 11:20:34','2025-12-15 12:26:04'),(7,'Centralized management for the entire fleet','http://localhost:8080/uploads/images/image-1765801580053-36262253.svg',7,1,'2025-11-27 11:20:34','2025-12-15 12:26:22');
/*!40000 ALTER TABLE `green_mobility_why_choose_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logo_url` text NOT NULL,
  `logo_alt` varchar(255) DEFAULT NULL,
  `show_stock_info` tinyint(1) NOT NULL DEFAULT '1',
  `bse_price` varchar(255) DEFAULT NULL,
  `bse_change` varchar(255) DEFAULT NULL,
  `bse_change_indicator` varchar(255) DEFAULT 'down',
  `nse_price` varchar(255) DEFAULT NULL,
  `nse_change` varchar(255) DEFAULT NULL,
  `nse_change_indicator` varchar(255) DEFAULT 'down',
  `navigation_items` json NOT NULL COMMENT 'Array of navigation items with name, href, dropdown items, etc.',
  `contact_button_text` varchar(255) NOT NULL DEFAULT 'Contact Us',
  `contact_button_href` varchar(255) NOT NULL DEFAULT '/contact/',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header`
--

LOCK TABLES `header` WRITE;
/*!40000 ALTER TABLE `header` DISABLE KEYS */;
INSERT INTO `header` VALUES (1,'http://localhost:8080/uploads/images/image-1765906722123-149664839.svg','Refex Industries Limited',1,NULL,NULL,'down',NULL,NULL,'down','[{\"href\": \"/\", \"name\": \"Home\", \"dropdown\": []}, {\"href\": \"/about-us\", \"name\": \"About Us\", \"dropdown\": [{\"href\": \"/about-us#mission-vision\", \"name\": \"Vision & Mission\"}, {\"href\": \"/about-us#core-values\", \"name\": \"Core Values\"}, {\"href\": \"/about-us#board-members\", \"name\": \"Board Members\"}, {\"href\": \"/about-us#our-presence\", \"name\": \"Our Presence\"}, {\"href\": \"https://www.refex.group/diversity-inclusion/\", \"name\": \"Diversity & Inclusion\"}, {\"href\": \"/newsroom/\", \"name\": \"Newsroom\"}, {\"href\": \"https://www.refex.group/gallery/\", \"name\": \"Gallery\"}, {\"href\": \"https://www.refex.group/careers/\", \"name\": \"Careers\"}]}, {\"href\": \"#business\", \"name\": \"Business\", \"dropdown\": [{\"href\": \"/ash-utilization\", \"name\": \"Ash Utilization and Coal Handling\"}, {\"href\": \"/green-mobility\", \"name\": \"Green Mobility\"}, {\"href\": \"/venwind-refex\", \"name\": \"Venwind Refex\"}, {\"href\": \"/refrigerant-gas\", \"name\": \"Refrigerant Gas\"}]}, {\"href\": \"/investors\", \"name\": \"Investors\", \"dropdown\": [{\"href\": \"#\", \"name\": \"Smart ODR\", \"submenu\": [{\"href\": \"https://www.sebi.gov.in/legal/master-circulars/aug-2023/online-resolution-of-disputes-in-the-indian-securities-market_75220.html\", \"name\": \"SEBI Circular or ODR\"}, {\"href\": \"https://refex.co.in/wp-content/uploads/2025/05/Online-Resolution-Of-Disputes.pdf\", \"name\": \"Online Dispute Resolution\"}, {\"href\": \"https://smartodr.in/login\", \"name\": \"Link to Smart ODR\"}], \"hasSubmenu\": true}]}, {\"href\": \"/esg\", \"name\": \"ESG\", \"dropdown\": []}]','Contact Us','/contact/',1,'2025-11-28 05:38:40','2025-12-22 05:31:52');
/*!40000 ALTER TABLE `header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero_slides`
--

DROP TABLE IF EXISTS `hero_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hero_slides` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero_slides`
--

LOCK TABLES `hero_slides` WRITE;
/*!40000 ALTER TABLE `hero_slides` DISABLE KEYS */;
INSERT INTO `hero_slides` VALUES (2,'Ash Utilization And Coal Handling','http://localhost:8080/uploads/images/image-1765902174807-302579232.webp',1,1,'2025-11-27 04:38:27','2025-12-16 16:23:01'),(3,'Green Mobility','http://localhost:8080/uploads/images/image-1765901637708-529947487.jpg',2,1,'2025-11-27 04:38:27','2025-12-16 16:14:06'),(4,'Venwind Refex','http://localhost:8080/uploads/images/image-1765901672951-590841675.jpg',3,1,'2025-11-27 04:38:27','2025-12-16 16:14:35'),(5,'Refrigerant Gas','http://localhost:8080/uploads/images/image-1765901694564-293718381.jpg',4,1,'2025-11-27 04:38:27','2025-12-16 16:14:58');
/*!40000 ALTER TABLE `hero_slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innovation_transformation`
--

DROP TABLE IF EXISTS `innovation_transformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `innovation_transformation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_title` varchar(255) NOT NULL,
  `section_description` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innovation_transformation`
--

LOCK TABLES `innovation_transformation` WRITE;
/*!40000 ALTER TABLE `innovation_transformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `innovation_transformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors_hero`
--

DROP TABLE IF EXISTS `investors_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Investors',
  `background_image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors_hero`
--

LOCK TABLES `investors_hero` WRITE;
/*!40000 ALTER TABLE `investors_hero` DISABLE KEYS */;
INSERT INTO `investors_hero` VALUES (1,'Investors','/uploads/images/image-1765819148901-658205528.jpg',1,'2025-12-03 05:51:02','2025-12-15 18:47:14');
/*!40000 ALTER TABLE `investors_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors_historical_stock_quote`
--

DROP TABLE IF EXISTS `investors_historical_stock_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors_historical_stock_quote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Historical Stock Quote',
  `column_date` varchar(255) DEFAULT 'DATE',
  `column_open` varchar(255) DEFAULT 'OPEN',
  `column_high` varchar(255) DEFAULT 'HIGH',
  `column_low` varchar(255) DEFAULT 'LOW',
  `column_close` varchar(255) DEFAULT 'CLOSE',
  `column_volume` varchar(255) DEFAULT 'VOLUME',
  `column_trade_value` varchar(255) DEFAULT 'TRADE VALUE',
  `column_trades` varchar(255) DEFAULT 'No. OF TRADES',
  `filter1_m` varchar(255) DEFAULT '1M',
  `filter3_m` varchar(255) DEFAULT '3M',
  `filter6_m` varchar(255) DEFAULT '6M',
  `filter1_y` varchar(255) DEFAULT '1Y',
  `default_exchange` varchar(255) DEFAULT 'BSE',
  `records_per_page` int DEFAULT '10',
  `nonce` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors_historical_stock_quote`
--

LOCK TABLES `investors_historical_stock_quote` WRITE;
/*!40000 ALTER TABLE `investors_historical_stock_quote` DISABLE KEYS */;
INSERT INTO `investors_historical_stock_quote` VALUES (1,'Historical Stock Quote','DATE','OPEN','HIGH','LOW','CLOSE','VOLUME','TRADE VALUE','No. OF TRADES','1M','3M','6M','1Y','BSE',10,'98b39108dc',1,'2025-12-05 04:14:09','2025-12-16 10:38:48');
/*!40000 ALTER TABLE `investors_historical_stock_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors_key_personnel`
--

DROP TABLE IF EXISTS `investors_key_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors_key_personnel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` text,
  `address2` text,
  `address3` text,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `display_order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors_key_personnel`
--

LOCK TABLES `investors_key_personnel` WRITE;
/*!40000 ALTER TABLE `investors_key_personnel` DISABLE KEYS */;
INSERT INTO `investors_key_personnel` VALUES (1,'Mr. Anil Jain','Managing Director','Refex Industries Limited',NULL,NULL,NULL,'+91-44 – 3504 0050',NULL,0,1,'2025-12-03 11:06:32','2025-12-04 07:28:00'),(2,'Mr. Dinesh Kumar Agarwal','Whole-time Director & Chief Financial Officer','Refex Industries Limited',NULL,NULL,NULL,'+91-44 – 3504 0050',NULL,1,1,'2025-12-03 11:06:32','2025-12-03 11:06:32'),(3,'Mr. Ankit Poddar','Company Secretary / Compliance Officer','Refex Industries Limited,','2nd Floor, No.313, Refex Towers, Sterling Road,','Valluvar Kottam High Road, Nungambakkam,','Chennai – 600034, Tamil Nadu.','+91-44 – 3504 0050','investor.relations@refex.co.in',2,1,'2025-12-03 11:06:32','2025-12-03 11:06:32');
/*!40000 ALTER TABLE `investors_key_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors_page_content`
--

DROP TABLE IF EXISTS `investors_page_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors_page_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `has_year_filter` tinyint(1) NOT NULL DEFAULT '0',
  `filter_items` json DEFAULT NULL,
  `sections` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `show_publish_date` tinyint(1) NOT NULL DEFAULT '0',
  `show_cms_publish_date` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `slug_2` (`slug`),
  UNIQUE KEY `slug_3` (`slug`),
  UNIQUE KEY `slug_4` (`slug`),
  UNIQUE KEY `slug_5` (`slug`),
  UNIQUE KEY `slug_6` (`slug`),
  UNIQUE KEY `slug_7` (`slug`),
  UNIQUE KEY `slug_8` (`slug`),
  UNIQUE KEY `slug_9` (`slug`),
  UNIQUE KEY `slug_10` (`slug`),
  UNIQUE KEY `slug_11` (`slug`),
  UNIQUE KEY `slug_12` (`slug`),
  UNIQUE KEY `slug_13` (`slug`),
  UNIQUE KEY `slug_14` (`slug`),
  UNIQUE KEY `slug_15` (`slug`),
  UNIQUE KEY `slug_16` (`slug`),
  UNIQUE KEY `slug_17` (`slug`),
  UNIQUE KEY `slug_18` (`slug`),
  UNIQUE KEY `slug_19` (`slug`),
  UNIQUE KEY `slug_20` (`slug`),
  UNIQUE KEY `slug_21` (`slug`),
  UNIQUE KEY `slug_22` (`slug`),
  UNIQUE KEY `slug_23` (`slug`),
  UNIQUE KEY `slug_24` (`slug`),
  UNIQUE KEY `slug_25` (`slug`),
  UNIQUE KEY `slug_26` (`slug`),
  UNIQUE KEY `slug_27` (`slug`),
  UNIQUE KEY `slug_28` (`slug`),
  UNIQUE KEY `slug_29` (`slug`),
  UNIQUE KEY `slug_30` (`slug`),
  UNIQUE KEY `slug_31` (`slug`),
  UNIQUE KEY `slug_32` (`slug`),
  UNIQUE KEY `slug_33` (`slug`),
  UNIQUE KEY `slug_34` (`slug`),
  UNIQUE KEY `slug_35` (`slug`),
  UNIQUE KEY `slug_36` (`slug`),
  UNIQUE KEY `slug_37` (`slug`),
  UNIQUE KEY `slug_38` (`slug`),
  UNIQUE KEY `slug_39` (`slug`),
  UNIQUE KEY `slug_40` (`slug`),
  UNIQUE KEY `slug_41` (`slug`),
  UNIQUE KEY `slug_42` (`slug`),
  UNIQUE KEY `slug_43` (`slug`),
  UNIQUE KEY `slug_44` (`slug`),
  UNIQUE KEY `slug_45` (`slug`),
  UNIQUE KEY `slug_46` (`slug`),
  UNIQUE KEY `slug_47` (`slug`),
  UNIQUE KEY `slug_48` (`slug`),
  UNIQUE KEY `slug_49` (`slug`),
  UNIQUE KEY `slug_50` (`slug`),
  UNIQUE KEY `slug_51` (`slug`),
  UNIQUE KEY `slug_52` (`slug`),
  UNIQUE KEY `slug_53` (`slug`),
  UNIQUE KEY `slug_54` (`slug`),
  UNIQUE KEY `slug_55` (`slug`),
  UNIQUE KEY `slug_56` (`slug`),
  UNIQUE KEY `slug_57` (`slug`),
  UNIQUE KEY `slug_58` (`slug`),
  UNIQUE KEY `slug_59` (`slug`),
  UNIQUE KEY `slug_60` (`slug`),
  UNIQUE KEY `slug_61` (`slug`),
  UNIQUE KEY `slug_62` (`slug`),
  UNIQUE KEY `slug_63` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors_page_content`
--

LOCK TABLES `investors_page_content` WRITE;
/*!40000 ALTER TABLE `investors_page_content` DISABLE KEYS */;
INSERT INTO `investors_page_content` VALUES (1,'financial-information','Financial Information',1,'[\"2025-26\", \"2024-25\", \"2023-24\", \"2022-23\", \"2021-22\", \"2020-21\", \"2019-20\", \"2018-19\", \"2017-18\", \"2016-17\", \"2015-16\", \"2014-15\"]','[{\"title\": \"Financial Results\", \"documents\": [{\"date\": \"30/06/2014\", \"year\": \"2014-15\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Un-Audited-financial-results-30.06.2014.pdf\"}, {\"date\": \"30/09/2014\", \"year\": \"2014-15\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/UNAUDITEDFINANCIALRESULTS-30.09.2014.pdf\"}, {\"date\": \"31/12/2014\", \"year\": \"2014-15\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-31.12.2014.pdf\"}, {\"date\": \"30/06/2015\", \"year\": \"2015-16\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Result_30June2015.pdf\"}, {\"date\": \"30/09/2015\", \"year\": \"2015-16\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results_30.09.2015.pdf\"}, {\"date\": \"31/12/2015\", \"year\": \"2015-16\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Financial-Result_31.12.2015.pdf\"}, {\"date\": \"30/06/2016\", \"year\": \"2016-17\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"wp-content/uploads/investor-media/Unaudited-Financial-Results_30-06-2016.pdf\"}, {\"date\": \"30/09/2016\", \"year\": \"2016-17\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Finaicial-Results_30.06.2016.pdf\"}, {\"date\": \"31/12/2016\", \"year\": \"2016-17\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/UnauditedFinancialResults31122016Refex-_.pdf\"}, {\"date\": \"30/06/2017\", \"year\": \"2017-18\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30.06.2017.pdf\"}, {\"date\": \"30/09/2017\", \"year\": \"2017-18\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Quarterly-Results-Q2-halfyearly-30.09.2017.pdf\"}, {\"date\": \"31/12/2017\", \"year\": \"2017-18\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaduited-Financial-Results.pdf\"}, {\"date\": \"31/03/2018\", \"year\": \"2017-18\", \"title\": \"Audited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Audited-Financial-Results-31032018.pdf\"}, {\"date\": \"30/06/2018\", \"year\": \"2018-19\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30062018.pdf\"}, {\"date\": \"30/09/2018\", \"year\": \"2018-19\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30092018.pdf\"}, {\"date\": \"31/12/2018\", \"year\": \"2018-19\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-31122018.pdf\"}, {\"date\": \"31/03/2019\", \"year\": \"2018-19\", \"title\": \"Audited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Audited-Financial-Results-31032019.pdf\"}, {\"date\": \"30/06/2019\", \"year\": \"2019-20\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30062019.pdf\"}, {\"date\": \"30/09/2019\", \"year\": \"2019-20\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30092019.pdf\"}, {\"date\": \"31/12/2019\", \"year\": \"2019-20\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-31122019.pdf\"}, {\"date\": \"31/03/2020\", \"year\": \"2019-20\", \"title\": \"Audited Financial Results for the Quarter and Year ended\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Audited-Financial-Results-Mar2020.pdf\"}, {\"date\": \"30/06/2020\", \"year\": \"2020-21\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited_Financial_Results-30.06.2020.pdf\"}, {\"date\": \"30/09/2020\", \"year\": \"2020-21\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30092020.pdf\"}, {\"date\": \"31/12/2020\", \"year\": \"2020-21\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-31122020.pdf\"}, {\"date\": \"31/03/2021\", \"year\": \"2020-21\", \"title\": \"Audited Financial Results for the Quarter and Year ended\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Audited-Financial-Results-Mar2021.pdf\"}, {\"date\": \"30/06/2021\", \"year\": \"2021-22\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited_Financial_Results-30.06.2021.pdf\"}, {\"date\": \"30/09/2021\", \"year\": \"2021-22\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited_Financial_Results-30.09.2021.pdf\"}, {\"date\": \"31/12/2021\", \"year\": \"2021-22\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-31.12.2021.pdf\"}, {\"date\": \"31/03/2022\", \"year\": \"2021-22\", \"title\": \"Audited Financial Results for the Quarter and Year ended\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_STX_Outcome_BM_06052022.pdf\"}, {\"date\": \"30/06/2022\", \"year\": \"2022-23\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_STX-Outcome_Q1_05.08.2022.pdf\"}, {\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30.09.2022.pdf\"}, {\"date\": \"31/12/2022\", \"year\": \"2022-23\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-31.12.2022.pdf\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"Audited Financial Results for the Quarter and Year ended\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Financial-Results-31032023.pdf\"}, {\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited_Financial_Results_30.06.2023.pdf\"}, {\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30-09-2023.pdf\"}, {\"date\": \"31/12/2023\", \"year\": \"2023-24\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-31-12-2023.pdf\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Audited Financial Results for the Quarter and Year ended\", \"pdfUrl\": \"/wp-content/uploads/investor-media/BM-Outcome.pdf\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30-06-2024.pdf\"}, {\"date\": \"30/09/2024\", \"year\": \"2024-25\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30-09-2024.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/2024/12/Unaudited-FS-Dec2024.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Integrated Filing (Financials) for 3rd Quarter ended\", \"pdfUrl\": \"/wp-content/uploads/2024/12/Integrated-Filing-Financials-for-3rd-Quarter-ending-on-December-31-2024.pdf\"}, {\"date\": \"31/03/2025\", \"year\": \"2024-25\", \"title\": \"RIL- Audited Financial Results for 4th Quarter and Financial Year ended\", \"pdfUrl\": \"/wp-content/uploads/2025/03/Outcome.pdf\"}, {\"date\": \"30/06/2025\", \"year\": \"2025-26\", \"title\": \"Unaudited Financial Results\", \"pdfUrl\": \"/wp-content/uploads/2025/06/Unaudited-FS-June-2025.pdf\"}, {\"date\": \"04/11/2025\", \"year\": \"2025-26\", \"title\": \"Un-Audited Financial Results – Q2 FY26\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_FS_Q2FY26.pdf\"}]}, {\"title\": \"Notice Of Board Meetings\", \"documents\": [{\"date\": \"30/06/2017\", \"year\": \"2017-18\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-Of-Board-Meeting-30-06-2017.pdf\"}, {\"date\": \"30/09/2017\", \"year\": \"2017-18\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-BM.pdf\"}, {\"date\": \"31/12/2017\", \"year\": \"2017-18\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-31032018.pdf\"}, {\"date\": \"31/03/2018\", \"year\": \"2017-18\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Board-Meeting-Intimation-31.12.2017.pdf\"}, {\"date\": \"30/06/2018\", \"year\": \"2018-19\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-30062018.pdf\"}, {\"date\": \"30/09/2018\", \"year\": \"2018-19\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-30092018.pdf\"}, {\"date\": \"31/12/2018\", \"year\": \"2018-19\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-31122018.pdf\"}, {\"date\": \"31/03/2019\", \"year\": \"2018-19\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_Board_Meeting_31_03_2019.pdf\"}, {\"date\": \"30/06/2019\", \"year\": \"2019-20\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting_30.06.2019.pdf\"}, {\"date\": \"30/09/2019\", \"year\": \"2019-20\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting_30.09.2019.pdf\"}, {\"date\": \"31/12/2019\", \"year\": \"2019-20\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting_31.12.2019.pdf\"}, {\"date\": \"31/03/2020\", \"year\": \"2019-20\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting_31.03.2020.pdf\"}, {\"date\": \"\", \"year\": \"2020-21\", \"title\": \"Intimation of Board Meeting Rights Issue\", \"pdfUrl\": \"wp-content/uploads/investor-media/Intimation_of_Board_Meeting_Rights_Issue.pdf\"}, {\"date\": \"30/06/2020\", \"year\": \"2020-21\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting-30.06.2020.pdf\"}, {\"date\": \"Intimation of Board Meeting\", \"year\": \"2020-21\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting_30.09.2020.pdf\"}, {\"date\": \"31/12/2020\", \"year\": \"2020-21\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting_31.12.2020.pdf\"}, {\"date\": \"30/06/2021\", \"year\": \"2021-22\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting-30.06.2021.pdf\"}, {\"date\": \"30/09/2021\", \"year\": \"2021-22\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting_30.09.2021.pdf\"}, {\"date\": \"31/12/2021\", \"year\": \"2021-22\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation_of_Board_Meeting_31.12.2021.pdf\"}, {\"date\": \"31/03/2022\", \"year\": \"2021-22\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-06.05.2022.pdf\"}, {\"date\": \"30/06/2022\", \"year\": \"2022-23\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-STX_Intimation_BM_05.08.2022.pdf\"}, {\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-30.09.2022.pdf\"}, {\"date\": \"31/12/2022\", \"year\": \"2022-23\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-31.12.2022.pdf\"}, {\"date\": \"1/03/2023\", \"year\": \"2022-23\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-31032023.pdf\"}, {\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/PriorIntimation.pdf\"}, {\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/intimation-of-Board-Meeting-30092023.pdf\"}, {\"date\": \"31/12/2023\", \"year\": \"2023-24\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-31-12-2023.pdf\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-31-03-2024.pdf\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-30-06-2024.pdf\"}, {\"date\": \"03/10/2024\", \"year\": \"2024-25\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-03-10-2024.pdf\"}, {\"date\": \"11/11/2024\", \"year\": \"2024-25\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-13-11-2024.pdf\"}, {\"date\": \"27/01/2025\", \"year\": \"2024-25\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Board-Meeting-27012025.pdf\"}, {\"date\": \"23/04/2025\", \"year\": \"2025-26\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/2025/04/RIL_BM_23042025_Intimation_sd.pdf\"}, {\"date\": \"19/06/2025\", \"year\": \"2025-26\", \"title\": \"Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/2025/06/RIL_BM_Intimation_12082025.pdf\"}, {\"date\": \"29/10/2025\", \"year\": \"2025-26\", \"title\": \"Intimation of Board Meeting – November 04, 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/10/RIL_BM_Intimation_Nov25_sd.pdf\"}]}]',1,'2025-12-10 04:52:42','2025-12-30 11:26:32',0,0),(2,'annual-reports','Annual Reports',1,'[\"2024-25\", \"2023-24\", \"2022-23\", \"2021-22\", \"2020-21\", \"2019-20\", \"2018-19\", \"2017-18\", \"2016-17\", \"2015-16\", \"2014-15\", \"2013-14\", \"2012-13\", \"2011-12\"]','[{\"title\": \"Annual Reports\", \"documents\": [{\"date\": \"\", \"year\": \"2011-12\", \"title\": \"Annual Report 2011-2012\", \"pdfUrl\": \"/wp-content/uploads/investor-media/2011_12_Annual_report.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2012-13\", \"title\": \"Annual Report 2012-2013\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual_Report_2012-2013.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2013-14\", \"title\": \"Annual Report 2012-2013\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual_Report_2013-2014.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2014-15\", \"title\": \"Annual Report 2014-2015\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex_Annual_Report_2014-2015.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2015-16\", \"title\": \"Annual Report 2015-2016\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Book-Final-.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2016-17\", \"title\": \"Annual Report 2016-2017\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual_Report_2016-2017.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2017-18\", \"title\": \"Annual Report 2017-2018\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex_Annual_Report_2017_2018.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2018-19\", \"title\": \"Annual Report 2018-2019\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Report_2019.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2019-20\", \"title\": \"Annual Report 2019-2020\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Report_2019-2020.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2020-21\", \"title\": \"Annual Report 2020-2021\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Report_2020-2021.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Annual Report 2021-2022\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Report-2021-2022.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Annual Report 2022-2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Report-2022-2023.pdf\", \"thumbnail\": \"\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Annual Report 2023-2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Annual-Report-2023-24.pdf\", \"thumbnail\": \"/wp-content/uploads/2023/12/Capture1.png\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Annual Report 2024-25\", \"pdfUrl\": \"/wp-content/uploads/2025/07/RIL_23rd_AR_FY24-25.pdf\", \"thumbnail\": \"/wp-content/uploads/2025/07/Capture.png\"}]}]',1,'2025-12-10 06:10:04','2025-12-29 17:35:07',0,0),(3,'general-meeting-updates','General Meeting Updates',1,'[\"2025-26\", \"2024-25\", \"2023-24\", \"2022-23\", \"2021-22\", \"2020-21\", \"2019-20\", \"2018-19\", \"2017-18\", \"2016-17\"]','[{\"title\": \"AGM Notice & Annual Report\", \"documents\": [{\"date\": \"\", \"year\": \"2023-24\", \"title\": \"AGM Notice & Annual Report 2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Notice-Annual-Report.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"AGM Notice & Annual Report 2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/AGM-Notice-and-Annual-Report-2024.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"AGM Notice & Annual Report 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/06/Refex-Industries-Limited_23rd-Annual-Report-FY-25.pdf\"}]}, {\"title\": \"Business Responsibility & Sustainability Report\", \"documents\": [{\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Business Responsibility & Sustainability Report\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex_Industries_BRSR_31st_Aug.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Business Responsibility & Sustainability Report 2023-24\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Responsibility-Sustainability-Report-2024.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"Business Responsibility & Sustainability Report – FY 2024-25\", \"pdfUrl\": \"/wp-content/uploads/2025/06/Refex_Industries_Limited_BRSR.pdf\"}]}, {\"title\": \"Postal Ballot Notice\", \"documents\": [{\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Postal Ballot Notice – FY 2023-24\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Postal-Ballot-Notice-FY-2023-24.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL – Postal Ballot Notice – April 2025 to May 2025 -01/FY25-26\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_PB_Notice_March2025.pdf\"}]}, {\"title\": \"Proceedings of General Meeting\", \"documents\": [{\"date\": \"\", \"year\": \"2016-17\", \"title\": \"Proceedings of the AGM, 2016\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ProceedingofAGMRefexIndustriesLimited2016.pdf\"}, {\"date\": \"\", \"year\": \"2017-18\", \"title\": \"Proceedings of the AGM, 2017\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ProceedingsofAGMRefex2017_Final.pdf\"}, {\"date\": \"\", \"year\": \"2018-19\", \"title\": \"Proceedings of the AGM, 2018\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Proceedings_of_AGM_2018.pdf\"}, {\"date\": \"\", \"year\": \"2019-20\", \"title\": \"Proceedings of the AGM, 2019\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Proceedings_of_AGM_2019.pdf\"}, {\"date\": \"\", \"year\": \"2020-21\", \"title\": \"Proceedings of the AGM, 2020\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Proceedings_of_AGM_2020.pdf\"}, {\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Proceedings of the AGM, 2021\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Proceedings_of_AGM_2021.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Proceedings of the AGM, 2022\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Outcome_AGM_23092022.pdf\"}, {\"date\": \"28/04/2023\", \"year\": \"2023-24\", \"title\": \"Proceedings of the AGM\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Proceedings-of-EGM-28.04.2023.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Proceedings of the AGM, 2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/REFEX-Proceedings-of-AGM-2023.pdf\"}, {\"date\": \"27/03/2024\", \"year\": \"2023-24\", \"title\": \"Proceedings of the AGM\", \"pdfUrl\": \"/wp-content/uploads/investor-media/REFEX-proceedings-of-EGM.pdf\"}, {\"date\": \"26/10/2024\", \"year\": \"2024-25\", \"title\": \"Proceedings of the AGM\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-EGM-Proceedings-26-10-2024-F.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"Proceedings of 23rd AGM – 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/07/RIL_23rd_AGM_Proceedings_sd.pdf\"}]}, {\"title\": \"Voting Results and Scrutinizer\'s Report\", \"documents\": [{\"date\": \"\", \"year\": \"2020-21\", \"title\": \"Voting Results & Scrutinizer Report,2020\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Voting-Results-Scrutinizers-Report-2020.pdf\"}, {\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Voting Results & Scrutinizer Report,2021\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Voting-Results-Scrutinizer-Report-2021.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Voting Results 2023 AGM\", \"pdfUrl\": \"wp-content/uploads/investor-media/Voting-Results-and-Scrutinizer-Report-EGM-2023.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Voting Results & Scrutinizer Report,2022\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Voting-Results-Scrutinizer-Report_2022.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Voting Results 2022 AGM\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Voting-Results-2022-AGM.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Voting Results & Scrutinizer Report, AGM 2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Voting-Results-Scrutinizer-Report-AGM-2023.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Voting Results & Scrutinizer Report, Postal Ballot 2023-24\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Voting-Results-Scrutinizer-Report-Postal-Ballot-2023-24.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Voting Results & Scrutinizer Report, 2nd EGM\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-Scrutinizer-Report-Sd.pdf\"}, {\"date\": \"30/08/2024\", \"year\": \"2024-25\", \"title\": \"Voting Results & Scrutinizer Report, AGM 2024\", \"pdfUrl\": \"/wp-content/uploads/2024/08/RIL_22nd_AGM_ScrutinizersReportandVotingResults.pdf\"}, {\"date\": \"26/10/2024\", \"year\": \"2024-25\", \"title\": \"Voting Results & Scrutinizer Report, EGM\", \"pdfUrl\": \"/wp-content/uploads/investor-media/E-voting-Result-and-Scrutinizer-Report.pdf\"}, {\"date\": \"02/05/2025\", \"year\": \"2025-26\", \"title\": \"RIL- Postal Ballot – Voting Results\", \"pdfUrl\": \"/wp-content/uploads/2025/05/RIL_PB_Outcome-signed.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL – 23rd AGM – 2025 – Voting Results & Scrutinizer Report\", \"pdfUrl\": \"/wp-content/uploads/2025/07/RIL_23rd_AGM_SR_VR_F_sd_compressed-1.pdf\"}]}, {\"title\": \"Disclosure under SEBI (SBEB & SE) Regulations, 2021\", \"documents\": [{\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"ESOP Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ESOP-Disclosure-2022-23.pdf\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"ESOP Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ESOP-Disclosure-as-on-June-30-2024.pdf\"}]}, {\"title\": \"Notice of Annual General Meeting\", \"documents\": [{\"date\": \"\", \"year\": \"2016-17\", \"title\": \"Notice Calling AGM – 2016\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Notice-calling-AGM-30-09-2016.pdf\"}, {\"date\": \"\", \"year\": \"2017-18\", \"title\": \"Notice Calling 15th AGM 2017\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Notice_AGM_2017.pdf\"}, {\"date\": \"\", \"year\": \"2018-19\", \"title\": \"Notice Calling AGM – 2018\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RILAGM%20_Notice_17-18.pdf\"}, {\"date\": \"\", \"year\": \"2019-20\", \"title\": \"Notice Calling AGM – 2019\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Notice_Calling_AGM_2019.pdf\"}, {\"date\": \"\", \"year\": \"2020-21\", \"title\": \"Notice Calling AGM – 2020\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Notice_Calling_RIL_AGM_2020.pdf\"}, {\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Notice Calling AGM – 2021\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Notice_Calling_RIL_AGM_2021.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Notice Calling AGM – 2022\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Notice-Calling-AGM-2022.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Notice Calling AGM – 2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Notice-Calling-AGM-2024.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Notice Calling 23rd AGM – 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/03/Refex_Industries_Limited_Notice_of_23rdAnnual_General_Meeting-FY25.pdf\"}]}, {\"title\": \"Notice of EGM\", \"documents\": [{\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Notice of 2nd EGM- FY 2023-24\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-EGM_Notice.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Notice Calling AGM – 2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Notice-Calling-AGM-2023.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Notice of 1st EGM- FY 2024-25\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-EGM-Notice-24-25.pdf\"}]}, {\"title\": \"PCS Certificate - Preferential Issue\", \"documents\": [{\"date\": \"\", \"year\": \"2023-24\", \"title\": \"PCS Certificate – Preferential Issue March 2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-SEBI-ICDR-PCS-Compliance-Certificate-Reg-163-Preferential-Issue.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"PCS Certificate – Preferential Issue October 2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/PCS-Certificate-Preferential-Issue-October-2024.pdf\"}]}, {\"title\": \"Valuation Report\", \"documents\": [{\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Valuation Report March 2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Valuation%20_Report.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Valuation report October 2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Valuation-report-October-2024.pdf\"}]}]',1,'2025-12-10 06:53:22','2025-12-29 17:22:53',0,0),(4,'investor-presentation','Investor Presentation',1,'[\"2025-26\", \"2024-25\", \"2023-24\"]','[{\"title\": \"Investor Presentation\", \"documents\": [{\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Refex – Investor Presentation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-Investor-Presentation.pdf\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Earnings presentation and Press Release\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Earnings-presentation-and-Press-Release-31-03-2024.pdf\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Earnings presentation and Press Release\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Earnings-presentation-and-Press-Release-31-06-2024.pdf\"}, {\"date\": \"30/09/2024\", \"year\": \"2024-25\", \"title\": \"Earnings presentation and Press Release\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Earnings-presentation-and-Press-Release-30-09-2024.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Earnings presentation and Press Release\", \"pdfUrl\": \"/wp-content/uploads/2025/04/Investor-Presentation.pdf\"}, {\"date\": \"28/02/2025\", \"year\": \"2024-25\", \"title\": \"RIL-Investor Presentation\", \"pdfUrl\": \"/wp-content/uploads/2025/04/Discussion_on_27_Feb_2025-Refex_Industries_Limited.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL-Investor Presentation-Q4 & FY25\", \"pdfUrl\": \"/wp-content/uploads/2025/04/RIL_Inv_Pres_Q4_FY25_sd.pdf\"}, {\"date\": \"13/08/2025\", \"year\": \"2025-26\", \"title\": \"Presentation-Q1 FY26\", \"pdfUrl\": \"/wp-content/uploads/2025/08/Investor-Presentation-on-Q1-FY26.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL-Investor Presentation-Q1 FY26\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Reg30-Disclosure-Acquisition-1.pdf\"}, {\"date\": \"06/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Investor Presentation-Q2 FY26\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_IP_Q2FY26.pdf\"}]}]',1,'2025-12-10 07:34:45','2025-12-29 16:27:11',0,0),(5,'code-of-fair-disclosure-upsi','Code of Fair Disclosure UPSI',0,'[]','[{\"title\": \"Code of Fair Disclosure UPSI\", \"documents\": [{\"date\": \"\", \"link\": \"/wp-content/uploads/2025/07/Code_of_Fair_Disclosure_UPSI.pdf\", \"year\": \"\", \"title\": \"Code of Fair Disclosure UPSI\", \"pdfUrl\": \"/wp-content/uploads/2025/07/Code_of_Fair_Disclosure_UPSI.pdf\", \"publishedDate\": \"\"}]}]',1,'2025-12-10 07:40:48','2025-12-29 12:06:11',0,0),(6,'policies','Policies',0,'[]','[{\"title\": \"Policies\", \"documents\": [{\"date\": \"\", \"link\": \"/wp-content/uploads/investor-media/CSR-Policy.pdf\", \"year\": \"\", \"title\": \"CSR Policy\", \"pdfUrl\": \"/wp-content/uploads/investor-media/CSR-Policy.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/2025/05/Nomination-Remuneration-Policy.pdf\", \"year\": \"\", \"title\": \"Nomination Remuneration Policy\", \"pdfUrl\": \"/wp-content/uploads/2025/05/Nomination-Remuneration-Policy.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/investor-media/Policy-on-Archive-and-Preservation-of-Document.pdf\", \"year\": \"\", \"title\": \"Policy on Archive and Preservation of documents\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Policy-on-Archive-and-Preservation-of-Document.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/2025/05/Policy-on-Related-Party-Transactions.pdf\", \"year\": \"\", \"title\": \"Policy on Related Party Transaction\", \"pdfUrl\": \"/wp-content/uploads/2025/05/Policy-on-Related-Party-Transactions.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/investor-media/Whistle-Blower-Policy-Vigil-Mechanism.pdf\", \"year\": \"\", \"title\": \"Vigil Mechanism or Whistle Blower Policy\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Whistle-Blower-Policy-Vigil-Mechanism.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/2025/05/Policy-on-Determining-Material-Subsidiary.pdf\", \"year\": \"\", \"title\": \"Policy for Determining Material Subsidiary\", \"pdfUrl\": \"/wp-content/uploads/2025/05/Policy-on-Determining-Material-Subsidiary.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/investor-media/Code-of-Conduct_BoDs-&-SM.pdf\", \"year\": \"\", \"title\": \"Code of Conduct BoDs & SM\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Code-of-Conduct_BoDs-&-SM.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/investor-media/Code_Insider.pdf\", \"year\": \"\", \"title\": \"Code for Trading in Securities by Designated Persons\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Code_Insider.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/investor-media/Refex-Anti-Bribery-Anti-Corruption-Policy.pdf\", \"year\": \"\", \"title\": \"Anti-Bribery Policy\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-Anti-Bribery-Anti-Corruption-Policy.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/2025/05/Revised-Policy-on-Determining-Materiality-01-06-2024-1.pdf\", \"year\": \"\", \"title\": \"Policy on Determining Materiality\", \"pdfUrl\": \"/wp-content/uploads/2025/05/Revised-Policy-on-Determining-Materiality-01-06-2024-1.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/investor-media/Refex-Grievance-Redressal-Policy-01-06-2024.pdf\", \"year\": \"\", \"title\": \"Grievance Redressal Mechanism Policy\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-Grievance-Redressal-Policy-01-06-2024.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/2025/04/Dividend-Distribution-Policy.pdf\", \"year\": \"\", \"title\": \"Dividend Distribution Policy\", \"pdfUrl\": \"/wp-content/uploads/2025/04/Dividend-Distribution-Policy.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/2025/05/Code_Insider.pdf\", \"year\": \"\", \"title\": \"Code for Trading in Securities by Designated Persons\", \"pdfUrl\": \"/wp-content/uploads/2025/05/Code_Insider.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"link\": \"/wp-content/uploads/2025/05/RIL_Risk_Management_Policy.pdf\", \"year\": \"\", \"title\": \"RIL - Risk Management Policy\", \"pdfUrl\": \"/wp-content/uploads/2025/05/RIL_Risk_Management_Policy.pdf\", \"publishedDate\": \"\"}]}]',1,'2025-12-10 07:48:50','2025-12-29 12:03:56',0,0),(7,'credit-ratings','Credit Ratings',1,'[\"2025-26\", \"2024-25\", \"2023-24\", \"2021-22\"]','[{\"title\": \"Credit Ratings\", \"documents\": [{\"year\": \"2021-22\", \"title\": \"Credit Rating\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Rating.pdf\", \"publishedDate\": \"19/01/2022\"}, {\"year\": \"2023-24\", \"title\": \"Credit Rating\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Credit-Rating-Jan-24-2024.pdf\", \"publishedDate\": \"14/01/2024\"}, {\"year\": \"2024-25\", \"title\": \"Credit Rating\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Credit-rating-24-10-2024.pdf\", \"publishedDate\": \"24/10/2024\"}, {\"year\": \"2025-26\", \"title\": \"Credit Rating\", \"pdfUrl\": \"/wp-content/uploads/2025/07/REFEX-INDUSTRIES-LIMITED_RL_08-07-2025_25212.pdf\", \"publishedDate\": \"07/07/2025\"}]}]',1,'2025-12-10 07:53:09','2025-12-30 11:31:18',0,0),(8,'recording-transcripts-of-post-earnings-quarterly-calls','Recording & Transcripts of Post Earnings / Quarterly Calls',1,'[\"2025-26\", \"2024-25\"]','[{\"title\": \"Recording and Transcripts\", \"audios\": [{\"name\": \"Audio Recording of Earnings Conference Call – Q4 & FY24\", \"year\": \"2024-25\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-Industries-Q4-FY24-Earnings-Call-Transcript.pdf\", \"audioUrl\": \"/wp-content/uploads/2024/05/Audio-Recording-of-Earnings-Conference-Call.mp3\"}, {\"name\": \"Audio Recording of Earnings Conference Call – Q1 & FY25\", \"year\": \"2024-25\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-Industries-Q1-FY25-Earnings-Call-Transcript-06-08-2024.pdf\", \"audioUrl\": \"/wp-content/uploads/2024/08/Audio_Recording_of_Earnings_Conference_Call_Q1_FY25.mp3\"}, {\"name\": \"Audio Recording of Earnings Conference Call – Q2 & H1 FY25\", \"year\": \"2024-25\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Transcript-of-Earnings-Conference-Call-Q2-H1FY25.pdf\", \"audioUrl\": \"/wp-content/uploads/2024/11/Refex-Industries-Q2-H1-FY25-Earnings-Call-Audio.mp3\"}, {\"name\": \"Audio Recording of Earnings Conference Call – Q3FY25\", \"year\": \"2024-25\", \"pdfUrl\": \"/wp-content/uploads/2025/01/Refex_Industries_Limited_Q3_FY25_Concall_Transcript.pdf\", \"audioUrl\": \"/wp-content/uploads/2025/01/Earning-Audio-Call-Q3FY25.mp3\"}, {\"name\": \"Audio Recordings of Earnings Conference Call – Q4 & FY25\", \"year\": \"2024-25\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL.pdf\", \"audioUrl\": \"/wp-content/uploads/2025/04/Q4_FY25-earnings_concall_audio.mp3\"}, {\"name\": \"Audio Recordings of Earnings Conference Call – Q1 FY 26\", \"year\": \"2025-26\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Earnings-Call-Transcript_Aug132025.pdf\", \"audioUrl\": \"/wp-content/uploads/2025/08/Q1-FY26.mp3\"}, {\"name\": \"Audio Recordings of Earnings Conference Call – Q2 FY 26\", \"year\": \"2025-26\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_Transcripts_Q2FY26-1.pdf\", \"audioUrl\": \"/wp-content/uploads/2025/11/Refex-Industries-Earnings-Nov06-2025-Audio.mp3\"}], \"contents\": [], \"documents\": []}]',1,'2025-12-10 07:57:21','2025-12-29 18:38:17',0,0),(9,'disclosure-of-material-events-or-information','Disclosure of Material Events or Information',1,'[\"2025-26\", \"2024-25\", \"2023-24\", \"2022-23\", \"2021-22\", \"2020-21\", \"2019-20\", \"2018-19\", \"2017-18\"]','[{\"title\": \"Disclosure of Material Events or Information\", \"documents\": [{\"date\": \"04/10/2017\", \"year\": \"2017-18\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_04.10.2017.pdf\"}, {\"date\": \"06/06/2018\", \"year\": \"2018-19\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_06.06.2018.pdf\"}, {\"date\": \"24/01/2019\", \"year\": \"2018-19\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_24.01.2019.pdf\"}, {\"date\": \"14/02/2019\", \"year\": \"2018-19\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_14.02.2019.pdf\"}, {\"date\": \"26/02/2019\", \"year\": \"2018-19\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_26.02.2019.pdf\"}, {\"date\": \"19/10/2019\", \"year\": \"2019-20\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_19.10.2019.pdf\"}, {\"date\": \"21/10/2019\", \"year\": \"2019-20\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_21.10.2019.pdf\"}, {\"date\": \"20/01/2020\", \"year\": \"2019-20\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_20.01.2020.pdf\"}, {\"date\": \"13/02/2020\", \"year\": \"2019-20\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_13.02.2020.pdf\"}, {\"date\": \"28/03/2020\", \"year\": \"2019-20\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_28.03.2020.pdf\"}, {\"date\": \"08/07/2020\", \"year\": \"2020-21\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_08.07.2020.pdf\"}, {\"date\": \"28/09/2020\", \"year\": \"2020-21\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_28.09.2020.pdf\"}, {\"date\": \"27/11/2020\", \"year\": \"2020-21\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_27.11.2020.pdf\"}, {\"date\": \"08/12/2020\", \"year\": \"2020-21\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_08.12.2020.pdf\"}, {\"date\": \"24/04/2021\", \"year\": \"2021-22\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_24.04.2021.pdf\"}, {\"date\": \"0/06/2021\", \"year\": \"2021-22\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_30.06.2021.pdf\"}, {\"date\": \"26/11/2021\", \"year\": \"2021-22\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_26.11.2021.pdf\"}, {\"date\": \"04/01/2022\", \"year\": \"2021-22\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_04.01.2022.pdf\"}, {\"date\": \"20/01/2022\", \"year\": \"2021-22\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_20.01.2022.pdf\"}, {\"date\": \"22/03/2022\", \"year\": \"2021-22\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_22.03.2022.pdf\"}, {\"date\": \"06/05/2022\", \"year\": \"2022-23\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg.30_Disclosure_06.05.2022.pdf\"}, {\"date\": \"05/08/2022\", \"year\": \"2022-23\", \"title\": \"RIL Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-05.08.2022.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Changes in Board\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Changes_in_the_Board_new.pdf\"}, {\"date\": \"13/09/2022\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg.30-Disclosure-13.09.2022.pdf\"}, {\"date\": \"19/09/2022\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_NRC-Intimaiton-to-STX_19092022_Revised.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure_Update on Pref. Issue_2022\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL%20Reg%2030%20Disclosure_Update%20on%20Pref.%20Issue_2022.pdf\"}, {\"date\": \"21/09/2022\", \"year\": \"2022-23\", \"title\": \"Refex STX Intimation Valuation Report\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-STX_Intimation_Valuation_Report_21092022.pdf\"}, {\"date\": \"21/09/2022\", \"year\": \"2022-23\", \"title\": \"Refex STX Outcome BAC\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-STX_Outcome_BAC_21.09.2022.pdf\"}, {\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-30.09.2022.pdf\"}, {\"date\": \"07/10/2022\", \"year\": \"2022-23\", \"title\": \"Refex STX Outcome BAC\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex-STX_Outcome_BAC_07.10.2022.pdf\"}, {\"date\": \"05/12/2022\", \"year\": \"2022-23\", \"title\": \"RIL Reg Office Shifting Reg 30\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-office-Shifting-Reg-30.pdf\"}, {\"date\": \"31/01/2023\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-31.01.2023.pdf\"}, {\"date\": \"02/03/2023\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-02.03.2023.pdf\"}, {\"date\": \"09/03/2023\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-09.03.2023.pdf\"}, {\"date\": \"15/03/2023\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-15.03.2023.pdf\"}, {\"date\": \"27/03/2023\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-27.03.2023.pdf\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-31.03.2023.pdf\"}, {\"date\": \"18/05/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Financial-Results-31032023.pdf\"}, {\"date\": \"19/05/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure ESOP\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ESOP.pdf\"}, {\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited_Financial_Results_30.06.2023.pdf\"}, {\"date\": \"01/09/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-01-09-2023.pdf\"}, {\"date\": \"12/09/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure ESOP\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ESOP-SE-Letter-Final-Sd.pdf\"}, {\"date\": \"15/09/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-15-09-2023.pdf\"}, {\"date\": \"0/09/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unaudited-Financial-Results-30-09-2023.pdf\"}, {\"date\": \"04/10/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-04-10-2023.pdf\"}, {\"date\": \"08/11/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-08-11-2023.pdf\"}, {\"date\": \"22/11/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-22-11-2023.pdf\"}, {\"date\": \"30/11/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-30-11-2023.pdf\"}, {\"date\": \"28/12/2023\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-28-12-2023.pdf\"}, {\"date\": \"08/01/2024\", \"year\": \"2023-24\", \"title\": \"RIL Reg 29 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-29-Intimation-08-01-2024.pdf\"}, {\"date\": \"02/02/2024\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-02-02-2024.pdf\"}, {\"date\": \"08/02/2024\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-08-02-2024.pdf\"}, {\"date\": \"28/02/2024\", \"year\": \"2023-24\", \"title\": \"RIL Reg 29 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-29-Intimation-28-02-2024.pdf\"}, {\"date\": \"28/03/2024\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Intimation-28-03-2024.pdf\"}, {\"date\": \"29/03/2024\", \"year\": \"2023-24\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Intimation-29-03-2024.pdf\"}, {\"date\": \"04/04/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Intimation-04-04-2024.pdf\"}, {\"date\": \"11/04/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Intimation-11-04-2024.pdf\"}, {\"date\": \"23/04/2024\", \"year\": \"2024-25\", \"title\": \"RIL Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Intimation-23-04-2024.pdf\"}, {\"date\": \"30/04/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Regulation30-30-04-2024.pdf\"}, {\"date\": \"02/05/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Resignation-02-05-2024.pdf\"}, {\"date\": \" 21/05/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Resignation-CFO.pdf\"}, {\"date\": \"21/05/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-Investor-meet-21-05-2024.pdf\"}, {\"date\": \"24/05/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/BM-Outcome.pdf\"}, {\"date\": \" 27/05/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation.30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Intimation-27-05-2024.pdf\"}, {\"date\": \"30/05/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Disclosure-30-05-2024-1.pdf\"}, {\"date\": \"08/06/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-Reg30-Investor-Meet.pdf\"}, {\"date\": \"12/06/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Outcome-Investors-Meet-Reg-30-Nuwama-12-06-2024.pdf\"}, {\"date\": \"21/06/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Intimation-21-06-2024.pdf\"}, {\"date\": \"27/06/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-27-06-2024.pdf\"}, {\"date\": \"1/07/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Intimation-01-07-2024.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Volume Increase Clarification_NSE\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Volume-Increase-Clarification-BSE.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Volume Increase Clarification_BSE\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Volume-Increase-Clarification-NSE.pdf\"}, {\"date\": \"04/07/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-04-07-2024.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Price Movement Clarification_NSE\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Price-Movement-Clarification-NSE.pdf\"}, {\"date\": \"22/07/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Intimation-22-07-2024.pdf\"}, {\"date\": \"31/07/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Intimation-31-07-2024.pdf\"}, {\"date\": \"31/07/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation.30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Intimation-31-07-2024.pdf\"}, {\"date\": \"05/08/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation.30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Disclosure-06-08-2024-2.pdf\"}, {\"date\": \" 05/08/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation.30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Intimation-05-08-2024.pdf\"}, {\"date\": \"6/08/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Intimation-05-08-2024.pdf\"}, {\"date\": \"06/08/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Disclosure-06-08-2024.pdf\"}, {\"date\": \"12/08/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Intimation-12-08-2024.pdf\"}, {\"date\": \"16/08/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg30-Disclosure-16-08-2024.pdf\"}, {\"date\": \"30/08/2024\", \"year\": \"2024-25\", \"title\": \"RIL Intimation Reg 30\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Intimation-Reg-30-30-08-2024.pdf\"}, {\"date\": \"14/09/2024\", \"year\": \"2024-25\", \"title\": \"RIL Intimation Reg 30\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Intimation-for-acquisition-14092024.pdf\"}, {\"date\": \"07/11/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-STX-Intimation-Allotment-Pref-Issue-07-11-2024.pdf\"}, {\"date\": \"08/11/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Intimation-of-Earnings-Call-Q2FY25.pdf\"}, {\"date\": \"13/11/2024\", \"year\": \"2024-25\", \"title\": \"RIL Regulation 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Intimation-13-11-2024.pdf\"}, {\"date\": \"14/11/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg 30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Intimation-14-11-2024.pdf\"}, {\"date\": \"15/11/2024\", \"year\": \"2024-25\", \"title\": \"RIL-Reg 30-Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Reg-30-Disclosure-15-11-2024.pdf\"}, {\"date\": \"20/12/2024\", \"year\": \"2024-25\", \"title\": \"RIL-Reg.30.-Disclosure\", \"pdfUrl\": \"/wp-content/uploads/2024/12/RIL_Reg.30-Intimation.pdf\"}, {\"date\": \"24/12/2024\", \"year\": \"2024-25\", \"title\": \"RIL-Reg.30.-Disclosure\", \"pdfUrl\": \"/wp-content/uploads/2024/12/RIL_Reg.30-Intimation-1.pdf\"}, {\"date\": \"30/12/2024\", \"year\": \"2024-25\", \"title\": \"RIL-Intimation of Trading Window Closure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Trading_Window_Closure_Notice-Q3FY25_30.12.2024.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"RIL Reg.30- Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Stx_Intimaiton_UR_30_Tax_Interest_Penalty_31.12.2024.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"RIL- Regulation 30-Intimation\", \"pdfUrl\": \"/wp-content/uploads/2024/12/RIL-Reg-30-Press-release.pdf\"}, {\"date\": \"13/01/2025\", \"year\": \"2024-25\", \"title\": \"RIL-Reg.30- Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_Reg-30_Intimation_wrt_allotment_pursuant_to_Exercise_of_ESOP_Vesting_13.01.2025.pdf\"}, {\"date\": \"16/01/2025\", \"year\": \"2024-25\", \"title\": \"RIL-Reg.30- Disclosure\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Regulation-30-Intimation-16012025.pdf\"}, {\"date\": \"22/01/2025\", \"year\": \"2024-25\", \"title\": \"RIL Reg.30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/2025/01/RIL_Intimation-Reg30_Earnings-Call.pdf\"}, {\"date\": \"28/01/2025\", \"year\": \"2024-25\", \"title\": \"RIL Reg.30 Intimation\", \"pdfUrl\": \"/wp-content/uploads/2025/01/RIL_Intimation-Reg-30_Earnings-Call_27.01.2025-1.pdf\"}, {\"date\": \"29/01/2025\", \"year\": \"2024-25\", \"title\": \"RIL-Reg.30.-Disclosure\", \"pdfUrl\": \"/wp-content/uploads/2025/01/RIL_Reg.30-Intimation.pdf\"}, {\"date\": \"24/02/2025\", \"year\": \"2024-25\", \"title\": \"RIL-Reg.30 Intimation-Incorporation of Step Down Subsidiary Company\", \"pdfUrl\": \"/wp-content/uploads/2025/02/NSE.pdf\"}, {\"date\": \"28/02/2025\", \"year\": \"2024-25\", \"title\": \"RIL-Reg 30 Intimation-Schedule of Investor Call\", \"pdfUrl\": \"/wp-content/uploads/2025/02/RIL_STX_sd.pdf\"}, {\"date\": \"03/03/2025\", \"year\": \"2024-25\", \"title\": \"Refex Industries-Media Release\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_Media_Release_sd.pdf\"}, {\"date\": \"25/03/2025\", \"year\": \"2024-25\", \"title\": \"RIL-Reg 30 RGML and Gensol – Investor Release\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL-Exchange_Intimation-25032025.pdf\"}, {\"date\": \"28/03/2025\", \"year\": \"2024-25\", \"title\": \"RIL- RGML & Gensol – Withdrawal of Proposal\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RGML_Gensol_sd.pdf\"}, {\"date\": \"28/03/2025\", \"year\": \"2024-25\", \"title\": \"RIL-Reg.30 Disclosure Outcome of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_Reg30_Outcome_PB_sd.pdf\"}, {\"date\": \"29/03/2025\", \"year\": \"2024-25\", \"title\": \"RIL-Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_Stx_GST_sd.pdf\"}, {\"date\": \"31/03/2025\", \"year\": \"2024-25\", \"title\": \"RIL- Closure of Trading Window\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_Trading_window_Closure_Q4FY25.pdf\"}, {\"date\": \" 03/04/2025\", \"year\": \"2025-26\", \"title\": \"RIL- GST Order – AP\", \"pdfUrl\": \"/wp-content/uploads/2025/04/RIL_Stx_intimation_GST_02042025_sd.pdf\"}, {\"date\": \"05/04/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Reg.30 – Appoint of SMP\", \"pdfUrl\": \"/wp-content/uploads/2025/04/Reg_30_SMP_Appointment_Intimation.pdf\"}, {\"date\": \"17/04/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Media Release – RGML & EV fleet\", \"pdfUrl\": \"/wp-content/uploads/2025/04/RIL_STX_Media_RGMLEV_17042025_sd.pdf\"}, {\"date\": \"24/04/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Earnings Call Intimation Q4 and Annual FY25\", \"pdfUrl\": \"/wp-content/uploads/2025/04/RIL_STX_sds.pdf\"}, {\"date\": \"24/04/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Media Release – Q4 & FY 25\", \"pdfUrl\": \"/wp-content/uploads/2025/04/RIL_Press_Release_FY25_sd.pdf\"}, {\"date\": \"05/06/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg.30- Disclosure\", \"pdfUrl\": \"/wp-content/uploads/2025/06/RIL_ESOP_Allotment_June2025_sd.pdf\"}, {\"date\": \"19/06/2025\", \"year\": \"2025-26\", \"title\": \"RIL- Reg.30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/2025/06/RIL_Reg.30_Disclosure_19.06.2025.pdf\"}, {\"date\": \"30/06/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Closure of Trading Window\", \"pdfUrl\": \"/wp-content/uploads/2025/06/RIL_CTW_Q1_FY26_sd.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Bagging of Order – July 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/07/Bagging-of-Order-July2025.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL – Reg.30 – Amendment to MOA – July 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/07/RIL_Intimation_Reg30_MOA_18072025_sd.pdf\"}, {\"date\": \"02/08/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg.30 – Amendment to MOA – July 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_NTPC_Order.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL-Reg. 29-Intimation of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Reg30-Intimation-of-Board-Meeting-05.08.2025.pdf\"}, {\"date\": \"06/08/2025\", \"year\": \"2025-26\", \"title\": \"RIL- Reg 30 – Earnings Call Intimation Q1 FY26\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Reg-30-Intimation-of-Earnings-Call-Q1-FY26.pdf\"}, {\"date\": \"11/08/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Media Release – RGML- Rebranding Intimation\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL-announcement-RGML-Rebranding-Intimation_11.08.2025.pdf\"}, {\"date\": \"11/08/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Reg. 30 Disclosure\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Reg30-Disclosure-Acquisition.pdf\"}, {\"date\": \"12/08/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Reg. 30 Disclosure-Outcome of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Reg-30-Disclosure-Outcome-of-the-Board-Meeting.pdf\"}, {\"date\": \"13/08/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Reg 30 – Bagging of Order\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Reg30-Disclosure-Award_of_Order_Receipt_of_Order.pdf\"}, {\"date\": \"13/08/2025\", \"year\": \"2025-26\", \"title\": \"RIL- Media Release – Q1 FY 26\", \"pdfUrl\": \"/wp-content/uploads/2025/08/Reg30-Media-Release-13.08.2025.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL- Reg 30 – Bagging of Order – September 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL_APPCDL_Order_sd.pdf\"}, {\"date\": \"06/09/2025\", \"year\": \"2025-26\", \"title\": \"RIL- Reg 30 – Allotment of OCD by Venwind Refex Power Limited – 06/09/2025\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL_STX_Intimation-for-OCD-Allotment_VRPL_06.09.2025_F.pdf\"}, {\"date\": \"12/09/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Incorporation of WOS – Refex Mobility Limited\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL_STX_Intimation-for-Incorporation_RML_Sep-12-2025_s.pdf\"}, {\"date\": \"22/09/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Outcome of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL_STXIntimationforCompositeScheme_F_22092025_sd.pdf\"}, {\"date\": \"22/09/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Press Release\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL_Media_Release_STX_sd.pdf\"}, {\"date\": \"24/09/2025\", \"year\": \"2025-26\", \"title\": \"RIL – VRPL Bagging of Order\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL_VRPL_STX_Intimation_Sep2025_sd.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL- Closure of Trading Window- Q2 FY 2025-26\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL_Trading_Window_Closure_Notice_Q2FY26_30092025_sd.pdf\"}, {\"date\": \"03/10/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Allotment of Securities\", \"pdfUrl\": \"/wp-content/uploads/2025/10/RIL_Intimation_STX_Reg30_Allotment_sd.pdf\"}, {\"date\": \"24/10/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Reg.30 – Appointment of SMP\", \"pdfUrl\": \"/wp-content/uploads/2025/10/RIL_Reg30_SMP_sd.pdf\"}, {\"date\": \"24/10/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Dhansar, Jharkhand – Bagging of Order\", \"pdfUrl\": \"/wp-content/uploads/2025/10/RIL_Jharkhand_Order_sd.pdf\"}, {\"date\": \"04/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Reg. 30 Disclosure Outcome of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_OutcomeoftheBM_04112025_sd.pdf\"}, {\"date\": \"05/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Media Release Q2 FY26\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_PressRelease_Q2FY26_final.pdf\"}, {\"date\": \"07/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Bagging Of Order – NTPC\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_NTPC_Nov_sd.pdf\"}, {\"date\": \"13/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Bagging Of Order – Vikas NHAI\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_NHAI_Order_Vikas_Nov2025_sd.pdf\"}, {\"date\": \"14/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Bagging Of Order – Chhattisgarh Genco\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_Chattisgarh_Genco.pdf\"}, {\"date\": \"17/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Reg.30 – Appointment of SMP\", \"pdfUrl\": \"/wp-content/uploads/2025/11/Reg30SMPAppointmentIntimation.pdf\"}, {\"date\": \"21/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – ESOP – November FY26\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_Reg30_ESOP_Nov2025_sd.pdf\"}, {\"date\": \"21/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Acquisition of REPPL by VRPL\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_STX_IntimationforAcquisition_RefexEngineer_19112025.pdf\"}, {\"date\": \"25/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Reg.30 Intimation – Incorporation of Step Down Subsidiary Company\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_STX_IntimationforIncorporation_VRPL_25112025-1.pdf\"}, {\"date\": \"27/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Bagging Of Order – NTPC Order\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_NTPC_Order_SCPL_sd-1.pdf\"}, {\"date\": \"28/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL Reg 30 – GST Order – Chhattisgarh\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_GST_Order_STX_Chattisgarh_Nov2025_sd-1.pdf\"}, {\"date\": \"29/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Bagging of Order – NTPC Limited\", \"pdfUrl\": \"/wp-content/uploads/2025/12/1.RIL_NTPC_Order_nov2025_sd.pdf\"}, {\"date\": \"01/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Bagging of Order – Vikas\", \"pdfUrl\": \"/wp-content/uploads/2025/12/2.RIL_NTPC_Order_Vikas_sd.pdf\"}, {\"date\": \"02/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – VRPL – MNRE\", \"pdfUrl\": \"/wp-content/uploads/2025/12/RIL-VRPL_STX-Intimation_ALMM_02.12.2025.pdf\"}, {\"date\": \"12/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Clarification on Media Rumors\", \"pdfUrl\": \"/wp-content/uploads/2025/12/RIL_STX_Clarification_12122025_sd.pdf\"}, {\"date\": \"14/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL-Reg.30 – Closure of Search Operations by Income-Tax Department\", \"pdfUrl\": \"https://refex.co.in/wp-content/uploads/2025/12/RIL_STX_ITDept_14122025_SD-1.pdf\"}, {\"date\": \"14/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Penalty by SEBI in Insider Trading Matter\", \"pdfUrl\": \"/wp-content/uploads/2025/12/RIL_STX_SEBI_penalty_14122025_SD.pdf\"}, {\"date\": \"15/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – NSE ESG Ratings\", \"pdfUrl\": \"/wp-content/uploads/2025/12/RIL_STX_ESG_Ratings_sd-1.pdf\"}, {\"date\": \"16/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – GST Demand Order – Raipur\", \"pdfUrl\": \"/wp-content/uploads/2025/12/RIL_Stx_Intimation_GST_Demand_sd.pdf\"}, {\"date\": \"7/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Bagging of Order for Transportation of Pond Ash\", \"pdfUrl\": \"/wp-content/uploads/2025/12/NTPC_sd.pdf\"}, {\"date\": \"18/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – Bagging of Order – VRPL\", \"pdfUrl\": \"/wp-content/uploads/2025/12/RIL_VRPL_WTG_sd.pdf\"}, {\"date\": \"19/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Reg 30 – GST Demand Order – Jodhpur (Rajasthan)\", \"pdfUrl\": \"/wp-content/uploads/2025/12/RIL_Stx_Intimation_GST-Demand_18122025_sd.pdf\"}, {\"date\": \"26/12/2025\", \"year\": \"2025-26\", \"title\": \"RIL – Closure of Trading Window – Q3 FY 2025-26\", \"pdfUrl\": \"/wp-content/uploads/2025/12/RIL_TWC_Q3_FY26_sd.pdf\"}]}]',1,'2025-12-10 09:39:22','2025-12-31 05:18:27',0,0),(10,'stock-exchange-quarterly-compliance','Stock Exchange Quarterly Compliance',1,'[\"2025-26\", \"2024-25\", \"2023-24\", \"2022-23\", \"2021-22\", \"2020-21\", \"2019-20\", \"2018-19\", \"2017-18\", \"2016-17\", \"2015-16\"]','[{\"title\": \"Shareholding Pattern\", \"documents\": [{\"date\": \"31/03/2016\", \"year\": \"2015-16\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern.pdf\"}, {\"date\": \"30/06/2016\", \"year\": \"2016-17\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern.pdf\"}, {\"date\": \"30/09/2016\", \"year\": \"2016-17\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern_30-06-2016.pdf\"}, {\"date\": \"31/12/2016\", \"year\": \"2016-17\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern_31.12.2016.pdf\"}, {\"date\": \"31/03/2017\", \"year\": \"2016-17\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/REFEX31032017-1.pdf\"}, {\"date\": \"30/06/2017\", \"year\": \"2017-18\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-Refex-Industries-Ltd-30062017.pdf\"}, {\"date\": \"30/09/2017\", \"year\": \"2017-18\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/SHP_REPORT.pdf\"}, {\"date\": \"31/12/2017\", \"year\": \"2017-18\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern.pdf\"}, {\"date\": \"31/03/2018\", \"year\": \"2017-18\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-RIL-31032018.pdf\"}, {\"date\": \"30/06/2018\", \"year\": \"2018-19\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-RIL-30062018.pdf\"}, {\"date\": \"30/09/2018\", \"year\": \"2018-19\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-RIL-30092018.pdf\"}, {\"date\": \"31/12/2018\", \"year\": \"2018-19\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-RIL-31122018.pdf\"}, {\"date\": \"31/03/2019\", \"year\": \"2018-19\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_31_03_2019.pdf\"}, {\"date\": \"30/06/2019\", \"year\": \"2019-20\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-RIL-30062019.pdf\"}, {\"date\": \"30/09/2019\", \"year\": \"2019-20\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-RIL-30092019.pdf\"}, {\"date\": \"31/12/2019\", \"year\": \"2019-20\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-RIL-31122019.pdf\"}, {\"date\": \"31/03/2020\", \"year\": \"2019-20\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_Industries_Ltd-31.03.2020.pdf\"}, {\"date\": \"30/06/2020\", \"year\": \"2020-21\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_Industries_Ltd-30.06.2020.pdf\"}, {\"date\": \" 19/08/2020\", \"year\": \"2020-21\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_Industries_Ltd-19.08.2020.pdf\"}, {\"date\": \"30/09/2020\", \"year\": \"2020-21\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_Industries_Ltd-30.09.2020.pdf\"}, {\"date\": \" 31/12/2020\", \"year\": \"2020-21\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_Industries_Ltd-31.12.2020.pdf\"}, {\"date\": \"31/03/2021\", \"year\": \"2020-21\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_Industries_Ltd-31.03.2021.pdf\"}, {\"date\": \" 30/06/2021\", \"year\": \"2021-22\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_Industries_Ltd-30.06.2021.pdf\"}, {\"date\": \"30/09/2021\", \"year\": \"2021-22\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_Industries_Ltd-30.09.2021.pdf\"}, {\"date\": \"31/12/2021\", \"year\": \"2021-22\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding_Pattern_Refex_Industries_Ltd-31.12.2021.pdf\"}, {\"date\": \"31/03/2022\", \"year\": \"2021-22\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-31.03.2022.pdf\"}, {\"date\": \"30/06/2022\", \"year\": \"2022-23\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-Refex-Industries-Limited-30062022.pdf\"}, {\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-30092022.pdf\"}, {\"date\": \"31/12/2022\", \"year\": \"2022-23\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-31.12.2022.pdf\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-Refex-Industries-Limited-31032023.pdf\"}, {\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-Refex-Industries-Limited-30062023.pdf\"}, {\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-Refex-Industries-Ltd-30-09-2023.pdf\"}, {\"date\": \"31/12/2023\", \"year\": \"2023-24\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-Refex-Industries-Ltd-31-12-2023.pdf\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-Refex-Industries-Ltd-31-03-2024.pdf\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-Refex-Industries-Ltd-30-06-2024.pdf\"}, {\"date\": \" 30/09/2024\", \"year\": \"2024-25\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern-Refex-Industries-Ltd-30-09-2024.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"ShareHolding Pattern Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Shareholding-Pattern.pdf\"}, {\"date\": \"31/03/2025\", \"year\": \"2024-25\", \"title\": \"Shareholding Pattern – Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_Reg31_SHP_Q4FY2425_Report.pdf\"}, {\"date\": \"30/06/2025\", \"year\": \"2025-26\", \"title\": \"Shareholding Pattern – Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Reg31-SHP_Q1FY26.pdf\"}, {\"date\": \"30/09/2025\", \"year\": \"2025-26\", \"title\": \"Shareholding Pattern – Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/2025/10/RIL_SHP_Q2FY26.pdf\"}, {\"date\": \"03/10/2025\", \"year\": \"2025-26\", \"title\": \"Shareholding Pattern under Reg 31(c) – Refex Industries Ltd\", \"pdfUrl\": \"/wp-content/uploads/2025/10/RIL_SHP_31c_03.10.2025.pdf\"}]}, {\"title\": \"Corporate Governance\", \"documents\": [{\"date\": \"30/06/2016\", \"year\": \"2016-17\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Corporate-Governance_-30062016.pdf\"}, {\"date\": \"30/09/2016\", \"year\": \"2016-17\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Corporate-Governance.pdf\"}, {\"date\": \"31/12/2016\", \"year\": \"2016-17\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/CG_31.12.2016.pdf\"}, {\"date\": \"31/03/2017\", \"year\": \"2016-17\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/CorporateGovernanceReport31032017.pdf\"}, {\"date\": \"30/06/2017\", \"year\": \"2017-18\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-On-Corporate-Governance-30062017.pdf\"}, {\"date\": \"30/09/2017\", \"year\": \"2017-18\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/CorporateGovernance30092017.pdf\"}, {\"date\": \"31/12/2017\", \"year\": \"2017-18\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Corporate-Governance-31.12.2017.pdf\"}, {\"date\": \"31/03/2018\", \"year\": \"2017-18\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-31032018.pdf\"}, {\"date\": \"30/06/2018\", \"year\": \"2018-19\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-30062018.pdf\"}, {\"date\": \"30/09/2018\", \"year\": \"2018-19\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-30092018.pdf\"}, {\"date\": \"31/12/2018\", \"year\": \"2018-19\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-31122018.pdf\"}, {\"date\": \"31/03/2019\", \"year\": \"2018-19\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Corporate_Governance_Report_31_03_2019.pdf\"}, {\"date\": \"30/06/2019\", \"year\": \"2019-20\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-30062019.pdf\"}, {\"date\": \"30/09/2019\", \"year\": \"2019-20\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-30092019.pdf\"}, {\"date\": \"31/12/2019\", \"year\": \"2019-20\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-31122019.pdf\"}, {\"date\": \"31/03/2020\", \"year\": \"2019-20\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-31.03.2020.pdf\"}, {\"date\": \"30/06/2020\", \"year\": \"2020-21\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-30.06.2020.pdf\"}, {\"date\": \"30/09/2020\", \"year\": \"2020-21\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-30.09.2020.pdf\"}, {\"date\": \"31/12/2020\", \"year\": \"2020-21\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-31.12.2020.pdf\"}, {\"date\": \" 31/03/2021\", \"year\": \"2020-21\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-31.03.2021.pdf\"}, {\"date\": \"30/06/2021\", \"year\": \"2021-22\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-30.06.2021.pdf\"}, {\"date\": \" 30/09/2021\", \"year\": \"2021-22\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-30.09.2021.pdf\"}, {\"date\": \"31/12/2021\", \"year\": \"2021-22\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ReportonCorporateGovernance-31.12.2021.pdf\"}, {\"date\": \"31/03/2022\", \"year\": \"2021-22\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Corporate-Governance-Report_March2022.pdf\"}, {\"date\": \"30/06/2022\", \"year\": \"2022-23\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Corporate-Governance-30062022.pdf\"}, {\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Corporate-Governance-Report-30092022.pdf\"}, {\"date\": \"31/12/2022\", \"year\": \"2022-23\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Corporate-Governance-Report-31.12.2022.pdf\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Corporate-Governance-31032023.pdf\"}, {\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Corporate-Governance-30062023.pdf\"}, {\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Corporate-Governance-30-09-2023.pdf\"}, {\"date\": \"31/12/2023\", \"year\": \"2023-24\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Corporate-Governance-31-12-2023.pdf\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Corporate-Governance-31-03-2024.pdf\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Corporate-Governance-30-06-2024.pdf\"}, {\"date\": \"30/09/2024\", \"year\": \"2024-25\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Corporate-Governance-30-09-2024.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Integrated Filing – Governance\", \"pdfUrl\": \"/wp-content/uploads/2024/12/RIL_CG_Integrated_Q3FY2425_report.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Report on Corporate Governance\", \"pdfUrl\": \"/wp-content/uploads/2024/12/Report-on-Corporate-Governance-1.pdf\"}]}, {\"title\": \"Investor Complaints\", \"documents\": [{\"date\": \"30/06/2016\", \"year\": \"2016-17\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Complaint-Report_30-06-2016.pdf\"}, {\"date\": \"30/09/2016\", \"year\": \"2016-17\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Complaint_30-09-2016.pdf\"}, {\"date\": \"31/12/2016\", \"year\": \"2016-17\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Compliant_-31.12.2016.pdf\"}, {\"date\": \"31/03/2017\", \"year\": \"2016-17\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Compliants_March-31.pdf\"}, {\"date\": \"30/06/2017\", \"year\": \"2017-18\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Complaints-30062017.pdf\"}, {\"date\": \"30/09/2017\", \"year\": \"2017-18\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/INvestor-Grievance.pdf\"}, {\"date\": \"31/12/2017\", \"year\": \"2017-18\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-31.12.2017.pdf\"}, {\"date\": \"31/03/2018\", \"year\": \"2017-18\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-31032018.pdf\"}, {\"date\": \"30/06/2018\", \"year\": \"2018-19\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-30062018.pdf\"}, {\"date\": \"30/09/2018\", \"year\": \"2018-19\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-30092018.pdf\"}, {\"date\": \"31/12/2018\", \"year\": \"2018-19\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-31122018.pdf\"}, {\"date\": \"31/03/2019\", \"year\": \"2018-19\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Cameo_Report_Investor_Grivenace_31_03_2019.pdf\"}, {\"date\": \"30/06/2019\", \"year\": \"2019-20\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-30062019.pdf\"}, {\"date\": \"30/09/2019\", \"year\": \"2019-20\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-30092019.pdf\"}, {\"date\": \"31/12/2019\", \"year\": \"2019-20\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-31122019.pdf\"}, {\"date\": \"31/03/2020\", \"year\": \"2019-20\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor_Grievance-31.03.2020.pdf\"}, {\"date\": \"30/06/2020\", \"year\": \"2020-21\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor_Grievance-30.06.2020.pdf\"}, {\"date\": \"30/09/2020\", \"year\": \"2020-21\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor_Grievance-30.09.2020.pdf\"}, {\"date\": \"31/12/2020\", \"year\": \"2020-21\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor_Grievance-31.12.2020.pdf\"}, {\"date\": \"31/03/2021\", \"year\": \"2020-21\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor_Grievance-31.03.2021.pdf\"}, {\"date\": \"30/06/2021\", \"year\": \"2021-22\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor_Grievance-30.06.2021.pdf\"}, {\"date\": \"30/09/2021\", \"year\": \"2021-22\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor_Grievance-30.09.2021.pdf\"}, {\"date\": \"31/12/2021\", \"year\": \"2021-22\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor_Grievance-31.12.2021.pdf\"}, {\"date\": \"31/03/2022\", \"year\": \"2021-22\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Complaints-31.03.2022.pdf\"}, {\"date\": \"30/06/2022\", \"year\": \"2022-23\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-30.06.2022.pdf\"}, {\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-30092022.pdf\"}, {\"date\": \"31/12/2022\", \"year\": \"2022-23\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-31.12.2022.pdf\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-Refex-Industries-Limited-31032023.pdf\"}, {\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-RIL-30062023.pdf\"}, {\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-30-09-2023.pdf\"}, {\"date\": \"31/12/2023\", \"year\": \"2023-24\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-31-12-2023.pdf\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-31-03-2024.pdf\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievance-31-06-2024.pdf\"}, {\"date\": \"30/09/2024\", \"year\": \"2024-25\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Investor-Grievances-30-09-2024.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Investor Complaints\", \"pdfUrl\": \"/wp-content/uploads/2024/12/Imvestors-Compliants-31.12.2024.pdf\"}]}, {\"title\": \"Reconciliation of Share Capital Audit\", \"documents\": [{\"date\": \"30/06/2016\", \"year\": \"2016-17\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliataion-of-Share-Capital-Audit_30-06-2016.pdf\"}, {\"date\": \"30/09/2016\", \"year\": \"2016-17\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-Sh-Capital-Audit_Sep-2016.pdf\"}, {\"date\": \"31/12/2016\", \"year\": \"2016-17\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-Sh-Capital-Audit-31122016.pdf\"}, {\"date\": \"31/03/2017\", \"year\": \"2016-17\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/SHARE-RECONCILATION-CERTIFICATE-MAR-2017.pdf\"}, {\"date\": \"30/06/2017\", \"year\": \"2017-18\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RECONCILIATION-OF-SHARE-CAPITAL-30-06-2017.pdf\"}, {\"date\": \"30/09/2017\", \"year\": \"2017-18\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-Share-Capital-Audit.pdf\"}, {\"date\": \"31/12/2017\", \"year\": \"2017-18\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RECONCILIATION-OF-SHARE-CAPITAL-DEC-17.pdf\"}, {\"date\": \"31/03/2018\", \"year\": \"2017-18\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RECONCILATION-OF-SHARE-CAPITAL-AUDIT-31032018.pdf\"}, {\"date\": \"30/06/2018\", \"year\": \"2018-19\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RECONCILIATION-OF-SHARE-CAPITAL-AUDIT-30062018.pdf\"}, {\"date\": \"30/09/2018\", \"year\": \"2018-19\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RECONCILIATION-OF-SHARECAPITAL-AUDIT-30092018.pdf\"}, {\"date\": \"31/12/2018\", \"year\": \"2018-19\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RECONCILIATION-OF-SHARE-CAPITAL-AUDIT-31122018.pdf\"}, {\"date\": \"31/03/2019\", \"year\": \"2018-19\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation_of_Share_Capital_Audit_31_03_2019.pdf\"}, {\"date\": \"30/06/2019\", \"year\": \"2019-20\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RECONCILIATION-OF-SHARE-CAPITAL-AUDIT-30062019.pdf\"}, {\"date\": \"30/09/2019\", \"year\": \"2019-20\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RECONCILIATION-OF-SHARECAPITAL-AUDIT-30092019.pdf\"}, {\"date\": \"31/12/2019\", \"year\": \"2019-20\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RECONCILIATION-OF-SHARE-CAPITAL-AUDIT-31122019.pdf\"}, {\"date\": \"31/03/2020\", \"year\": \"2019-20\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation_of_Share_capital_Audit-31.03.2020.pdf\"}, {\"date\": \"30/06/2020\", \"year\": \"2020-21\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation_of_Share_capital_Audit-30.06.2020.pdf\"}, {\"date\": \"30/09/2020\", \"year\": \"2020-21\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation_of_Share_capital_Audit-30.09.2020.pdf\"}, {\"date\": \"31/12/2020\", \"year\": \"2020-21\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation_of_Share_capital_Audit-31.12.2020.pdf\"}, {\"date\": \"31/03/2021\", \"year\": \"2020-21\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation_of_Share_capital_Audit-31.03.2021.pdf\"}, {\"date\": \"30/06/2021\", \"year\": \"2021-22\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation_of_Share_capital_Audit-30.06.2021.pdf\"}, {\"date\": \"30/09/2021\", \"year\": \"2021-22\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation_of_Share_capital_Audit-30.09.2021.pdf\"}, {\"date\": \"31/12/2021\", \"year\": \"2021-22\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation_of_Share_capital_Audit-31.12.2021.pdf\"}, {\"date\": \"31/03/2022\", \"year\": \"2021-22\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-Share-Capital-Audit-Report-31.03.2022.pdf\"}, {\"date\": \"30/06/2022\", \"year\": \"2022-23\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-Share-Capital-Audit-30062022.pdf\"}, {\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-share-capital-audit-30092022.pdf\"}, {\"date\": \"31/12/2022\", \"year\": \"2022-23\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconcilation-of-Sharecapital-31.12.2022.pdf\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-Share-Capital-Audit-31032023.pdf\"}, {\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-Share-Capital-Audit-30062023.pdf\"}, {\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-Share-capital-Audit-30-09-2023.pdf\"}, {\"date\": \"31/12/2023\", \"year\": \"2023-24\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-Share-capital-Audit-31-12-2023.pdf\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-Share-capital-Audit-31-03-2024.pdf\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-of-Share-Capital-Audit-30-06-2024.pdf\"}, {\"date\": \"30/09/2024\", \"year\": \"2024-25\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Reconciliation-Signed.pdf\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Reconciliation of Share Capital audit\", \"pdfUrl\": \"/wp-content/uploads/2024/12/Reconciliation-of-Share-Capital-Audit-Report.pdf\"}, {\"date\": \"31/03/2025\", \"year\": \"2024-25\", \"title\": \"Reconciliation of Share Capital Audit\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_Reg76_RSCAR_Q4FY25_sd.pdf\"}, {\"date\": \"30/06/2025\", \"year\": \"2025-26\", \"title\": \"Reconciliation of Share Capital Audit\", \"pdfUrl\": \"/wp-content/uploads/2025/06/RIL_RSCAR_Reg76_Q1FY26_sd.pdf\"}, {\"date\": \"30/09/2025\", \"year\": \"2025-26\", \"title\": \"Reconciliation of Share Capital Audit\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_RSCAR_Reg76_Q2FY26_sd.pdf\"}]}, {\"title\": \"Integrated Filing(Governance)\", \"documents\": [{\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Integrated Filing(Governance)-Q4 FY25\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_CGR_Q4_FY25_pdf.pdf\"}, {\"date\": \"30/06/2025\", \"year\": \"2025-26\", \"title\": \"Integrated Filing (Governance)\", \"pdfUrl\": \"/wp-content/uploads/2025/06/CGR.pdf\"}, {\"date\": \"30/09/2025\", \"year\": \"2025-26\", \"title\": \"Integrated Filing (Governance)\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_IG_FY26_Q2.pdf\"}]}, {\"title\": \"Disclosures of Related Party on Consolidated Basis\", \"documents\": [{\"date\": \"\", \"year\": \"2018-19\", \"title\": \"Report on Related Party March-2019\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Disclosure_on_Related_Party_March_2019.pdf\"}, {\"date\": \"\", \"year\": \"2019-20\", \"title\": \"Report on Related Party Sep-2019\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Disclosure_on_Related_Party_Sep_2019.pdf\"}, {\"date\": \"\", \"year\": \"2019-20\", \"title\": \"Report on Related Party March-2020\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report_on_Related_Party-March2020.pdf\"}, {\"date\": \"\", \"year\": \"2020-21\", \"title\": \"Report on Related Party September 2020\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_RPT_Reg.23.9_30.09.2020.pdf\"}, {\"date\": \"\", \"year\": \"2020-21\", \"title\": \"Report on Related Party March 2021\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_RPT_Reg.23.9_31.03.2021.pdf\"}, {\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Report on Related Party September 2021\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_RPT_Reg.23.9_30.09.2021.pdf\"}, {\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Report on Related Party March 2022\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Related-Party-March-2022.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Report on Related Party Transaction September 2022\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Related-Party-Transactions-September-2022.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Report on Related Party Transaction March 2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RPT.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Report on Related Party Transaction September 2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Report-on-Related-Party-Transaction-September-2023.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Report on Related Party Transaction March 2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Related-Party-Transaction-Report-Mar-2024.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Report on Related party Transaction September 2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Related-Party-Transaction-Report-30-09-2024.pdf\"}]}]',1,'2025-12-10 11:53:32','2025-12-30 06:45:13',0,0),(11,'familiarization-programme-for-independent-directors','Familiarization Programme for Independent Directors',0,'[]','[{\"title\": \"Familiarization Programme\", \"documents\": [{\"date\": \"\", \"year\": \"\", \"title\": \"Familiarization Programme for Independent Directors\", \"pdfUrl\": \"/wp-content/uploads/2025/05/RIL_FP_FY25.pdf\"}]}]',1,'2025-12-11 04:34:17','2025-12-29 11:48:16',0,0),(12,'terms-and-conditions-of-appointment-of-id','Terms and Conditions of Appointment of ID',0,'[]','[{\"title\": \"Terms and Conditions of Appointment\", \"documents\": [{\"date\": \"\", \"year\": \"\", \"title\": \"Terms and Condition for Appointment of Independent Director\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Terms-and-Condition-for-Appointment-of-Independent-Director.pdf\"}]}]',1,'2025-12-11 04:34:56','2025-12-29 11:46:51',0,0),(13,'ipo','IPO',0,'[]','[{\"title\": \"IPO Documents\", \"documents\": [{\"date\": \"\", \"year\": \"\", \"title\": \"Prospectus\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Prospectus-IPO.pdf\"}]}]',1,'2025-12-11 04:35:54','2025-12-29 11:45:42',0,0),(14,'rights-issue','Rights Issue',0,'[]','[{\"title\": \"Documents\", \"documents\": [{\"date\": \"\", \"title\": \"Refex Draft Letter of Offer\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Refex_Draft_Letter_of_Offer.pdf\", \"publishedDate\": \"\"}, {\"title\": \"Public Announcement Rights Issue\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Public_Announcement_Rights_Issue.pdf\"}, {\"title\": \"Outcome of Board Meeting\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Outcome_of_Board_Meeting_10-06-2020.pdf\"}, {\"title\": \"Advertisement Refex Industries\", \"pdfUrl\": \"/wp-content/uploads/investor-media/StatAd-RefexIndustries.pdf\"}]}, {\"title\": \"Issue Documents\", \"documents\": [{\"title\": \"ALOF (Refex Industries Limited)\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ALOF_Refex_Industries_Limited.pdf\"}, {\"title\": \"Application Form (Refex Industries Limited)\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Application_Form_Refex_Industries_Limited.pdf\"}, {\"title\": \"FAQs\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Application_Form_Refex_Industries_Limited.pdf\"}, {\"title\": \"Letter of Offer (Refex Industries Limited)\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Letter_of_Offer_Refex_Industries_Limited.pdf\"}]}, {\"title\": \"Material Documents\", \"documents\": [{\"title\": \"Prospectus IPO\", \"pdfUrl\": \"/wp-content/uploads/investor-media/prospectus_10-07-2017.pdf\"}, {\"title\": \"Consolidated Results March 2020\", \"pdfUrl\": \"/wp-content/uploads/investor-media/consolidated_results_march_2020.pdf\"}]}, {\"title\": \"Material Contracts\", \"documents\": [{\"title\": \"Banker to Issue Agreement (Escrow)\", \"pdfUrl\": \"/wp-content/uploads/investor-media/banker_to_issue_agreement_escrow.pdf\"}, {\"title\": \"Statements of Utilization\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Utilization-Statement.pdf\"}]}]',1,'2025-12-11 04:54:53','2025-12-29 11:44:19',0,0),(15,'financial-statement-of-subsidiary','Financial Statement of Subsidiary',1,'[\"2024-25\", \"2023-24\", \"2022-23\", \"2020-21\", \"2019-20\", \"2018-19\", \"2017-18\", \"2016-17\", \"2015-16\", \"2014-15\"]','[{\"title\": \"Refex EV Fleet Services Private Limited (Formerly O3 Mobility Private Limited)\", \"documents\": [{\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Financials of Refex EV Fleet 2023-24\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Financial-Refex-EV-Fleets-2023-24.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Financials of Refex EV Fleet – 2024-25\", \"pdfUrl\": \"/wp-content/uploads/2025/06/Signed-Refex-EV-FS-FY-2024-25.pdf\"}]}, {\"title\": \"Refex Green Mobility Limited (RGML)\", \"documents\": [{\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Financials of RGML 2023-24\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RGML-Financials-FY-2022-23.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Financials of RGML 2022-23\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Financials-of-RGML-2023-24.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Financials of RGML – 2024-25\", \"pdfUrl\": \"/wp-content/uploads/2025/07/new.pdf\"}]}, {\"title\": \"Venwind Refex Power Limited\", \"documents\": [{\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Financials of VRPL – 2024-25\", \"pdfUrl\": \"/wp-content/uploads/2025/06/VRPL_Audit_Report_FS-FY24-25.pdf\"}]}, {\"title\": \"Venwind Refex Power Services Limited\", \"documents\": [{\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Financials of VRPSL – 2024-25\", \"pdfUrl\": \"/wp-content/uploads/2025/06/VRPSL_Audit_Report_FS-FY24-25.pdf\"}]}, {\"title\": \"Vituza Solar Energy Limited\", \"documents\": [{\"date\": \"\", \"year\": \"2014-15\", \"title\": \"Financials of Vituza Solar 2014-15\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Financials-of-Vituza-Solar-for-the-year-ended-31.03.2015.pdf\"}, {\"date\": \"\", \"year\": \"2015-16\", \"title\": \"Financials of Vituza Solar 2015-16\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Vituza-Solar-Annual-Report-2015-16.pdf\"}, {\"date\": \"\", \"year\": \"2016-17\", \"title\": \"Financials of Vituza Solar 2016-17\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Vituza_Financials_2017.pdf\"}, {\"date\": \"\", \"year\": \"2017-18\", \"title\": \"Financials of Vituza Solar 2017-18\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Vituza_Solar_Financials_2017-18.pdf\"}, {\"date\": \"\", \"year\": \"2018-19\", \"title\": \"Financials of Vituza Solar 2018-19\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Vituza_Financials_2018-19.pdf\"}, {\"date\": \"\", \"year\": \"2019-20\", \"title\": \"Financials of Vituza Solar 2019-20\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Vituza_Financials_2019-20.pdf\"}, {\"date\": \"\", \"year\": \"2020-21\", \"title\": \"Financials of Vituza Solar 2020-21\", \"pdfUrl\": \"o.in/wp-content/uploads/investor-media/Vituza_Financials_2020-21.pdf\"}]}]',1,'2025-12-11 05:01:24','2025-12-29 11:27:11',0,1),(16,'annual-return','Annual Return',1,'[\"2024-25\", \"2023-24\", \"2022-23\", \"2021-22\", \"2020-21\", \"2019-20\", \"2018-19\"]','[{\"title\": \"Annual Return\", \"documents\": [{\"date\": \"\", \"year\": \"2018-19\", \"title\": \"Annual Return 2018-2019\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Return-2018-19.pdf\"}, {\"date\": \"\", \"year\": \"2019-20\", \"title\": \"Annual Return 2019-2020\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Return-2019-20.pdf\"}, {\"date\": \"\", \"year\": \"2020-21\", \"title\": \"Annual Return 2020-2021\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Return-2020-2021.pdf\"}, {\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Annual Return 2021-2022\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Annual-Return-2021-22.pdf\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"Annual Return 2022-2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-MGT-7-2022-23-RIL.pdf\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Annual Return 2023-2024\", \"pdfUrl\": \"/wp-content/uploads/2024/03/RIL_MGT7_pdfV_FY24.pdf\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"Annual Return 2024-2025\", \"pdfUrl\": \"/wp-content/uploads/2025/06/RIL_MGT7FY25.pdf\"}]}]',1,'2025-12-11 05:13:07','2025-12-29 11:10:43',0,0),(17,'book-closure-of-members-register-record-date','Book Closure of Members Register / Record Date',1,'[\"2023-24\", \"2022-23\", \"2021-22\", \"2020-21\", \"2019-20\", \"2018-19\", \"2017-18\"]','[{\"title\": \"Book Closure of Members Register\", \"documents\": [{\"date\": \"07/09/2017\", \"year\": \"2017-18\", \"title\": \"Book Closure of Members Register\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Book-Closure-of-Members-Register_07.09.2017.pdf\", \"publishedDate\": \"07/09/2017\"}, {\"date\": \"10/07/2018\", \"year\": \"2018-19\", \"title\": \"Book Closure of Members Register\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Book-Closure-of%20-Members-Register_10.07.2018.pdf\", \"publishedDate\": \"10/07/2018\"}, {\"date\": \"03/08/2018\", \"year\": \"2018-19\", \"title\": \"Book Closure of Members Register\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Book-Closure-of-Members-Register_03.08.2018.pdf\", \"publishedDate\": \"03/08/2018\"}, {\"date\": \"03/11/2018\", \"year\": \"2018-19\", \"title\": \"Book Closure of Members Register\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Book-Closure-of-Members-Register_03.11.2018.pdf\", \"publishedDate\": \"03/11/2018\"}, {\"date\": \"31/08/2019\", \"year\": \"2019-20\", \"title\": \"Book Closure of Members Register\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Book-Closure-of-Members-Register_31.08.2019.pdf\", \"publishedDate\": \"31/08/2019\"}, {\"date\": \"08/12/2020\", \"year\": \"2020-21\", \"title\": \"Book Closure of Members Register\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Book-Closure-of-Members-Register_08.12.2020.pdf\", \"publishedDate\": \"08/12/2020\"}, {\"date\": \"02/09/2021\", \"year\": \"2021-22\", \"title\": \"Book Closure of Members Register\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Book-Closure-of-Members-Register_02.09.2021.pdf\", \"publishedDate\": \"02/09/2021\"}, {\"date\": \"01/09/2022\", \"year\": \"2022-23\", \"title\": \"Book Closure of Members Register\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Book-Closure-of-Register-of-Members-01.09.2022.pdf\", \"publishedDate\": \"01/09/2022\"}, {\"date\": \"02/09/2023\", \"year\": \"2023-24\", \"title\": \"Book Closure of Members Register\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Book-Closure-of-Members-Register-02.09.2023.pdf\", \"publishedDate\": \"02/09/2023\"}, {\"date\": \"22/03/2024\", \"year\": \"2023-24\", \"title\": \"Record Date\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Record-date-22-03-2024.pdf\", \"publishedDate\": \"22/03/2024\"}]}]',1,'2025-12-11 05:18:31','2025-12-29 11:05:32',0,0),(18,'secretarial-compliance-report','Secretarial Compliance Report',1,'[\"2024-25\", \"2023-24\", \"2022-23\", \"2021-22\", \"2020-21\", \"2019-20\", \"2018-19\"]','[{\"title\": \"Secretarial Compliance Report\", \"documents\": [{\"date\": \"31/03/2019\", \"year\": \"2018-19\", \"title\": \"RIL 24A Compliance Report\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_24A_Compliance_Report_31.03.2019.pdf\", \"publishedDate\": \"31/03/2019\"}, {\"date\": \"31/03/2020\", \"year\": \"2019-20\", \"title\": \"RIL 24A Compliance Report\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_24A_Compliance_Report_31.03.2020.pdf\", \"publishedDate\": \"31/03/2020\"}, {\"date\": \"31/03/2021\", \"year\": \"2020-21\", \"title\": \"RIL 24A Compliance Report\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL_24A_Compliance_Report_31.03.2021.pdf\", \"publishedDate\": \"31/03/2021\"}, {\"date\": \"31/03/2022\", \"year\": \"2021-22\", \"title\": \"RIL 24A Compliance Report\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-24A-Compliance-Report-31.03.2022.pdf\", \"publishedDate\": \"31/03/2022\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"RIL 24A Compliance Report\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ASCR.pdf\", \"publishedDate\": \"31/03/2023\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"RIL 24A Compliance Report\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-24A-Compliance-Report-31.03.2024.pdf\", \"publishedDate\": \"31/03/2024\"}, {\"date\": \"31/03/2025\", \"year\": \"2024-25\", \"title\": \"RIL – 24A Compliance Report\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_ASCR_FY25_sd.pdf\", \"publishedDate\": \"31/03/2025\"}]}]',1,'2025-12-11 05:38:04','2025-12-29 10:51:56',0,1),(19,'investor-information','Investor Information',0,'[]','[{\"title\": \"Formats for Dividend Tax Exemptions\", \"documents\": [{\"date\": \"\", \"title\": \"TRC Template\", \"pdfUrl\": \"/wp-content/uploads/2025/08/TRC-Template.pdf\"}, {\"date\": \"\", \"title\": \"Self Declaration Insurance Company Mutual Fund AlF\", \"pdfUrl\": \"/wp-content/uploads/2025/08/Self-Declaration-Insurance-Company-Mutual-Fund-AlF.pdf\"}, {\"date\": \"\", \"title\": \"Form 15H\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-15H.pdf\"}, {\"date\": \"\", \"title\": \"Form 15G\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-15G.pdf\"}, {\"date\": \"\", \"title\": \"Form 10F\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-10F.pdf\"}]}, {\"title\": \"Forms for PAN, KYC etc. for the Shareholders holding securities in Physical Form\", \"documents\": [{\"date\": \"\", \"title\": \"Form No.SH14p\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-No.-SH-14_p.pdf\"}, {\"date\": \"\", \"title\": \"Form No.SH13p\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-No.-SH-13_p.pdf\"}, {\"date\": \"\", \"title\": \"Form ISR5\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-ISR5.pdf\"}, {\"date\": \"\", \"title\": \"Form ISR4\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-ISR-4.pdf\"}, {\"date\": \"\", \"title\": \"Form ISR3\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-ISR3.pdf\"}, {\"date\": \"\", \"title\": \"Form ISR2\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-ISR2.pdf\"}, {\"date\": \"\", \"title\": \"Form ISR1\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Form-ISR1.pdf\"}]}, {\"title\": \"Nomination for Demat Account\", \"documents\": [{\"date\": \"\", \"title\": \"Format: Opting-out Nomination\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Choice-of-Nomination-Declaration-for-opting-out-of-nomination.pdf\"}, {\"date\": \"\", \"title\": \"Format: Providing Nomination\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Choice-of-Nomination-Format-for-providing-Nomination.pdf\"}, {\"date\": \"\", \"title\": \"Choice of Nomination\", \"pdfUrl\": \"/wp-content/uploads/investor-media/CHOICE-OF-NOMINATION.pdf\"}]}, {\"title\": \"SEBI Circular\", \"documents\": [{\"date\": \"\", \"title\": \"SEBI Circular dated March 16, 2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/SEBI-Circular-dated-March-16-2023.pdf\"}, {\"date\": \"\", \"title\": \"SEBI Circular dated Nov 17, 2023\", \"pdfUrl\": \"/wp-content/uploads/investor-media/SEBI-Circular-dated-Nov-17-2023.pdf\"}, {\"date\": \"\", \"title\": \"SEBI Circular dated June 10, 2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/CHOICE-OF-NOMINATION.pdf\"}, {\"date\": \"\", \"title\": \"IEPFA Circular\", \"pdfUrl\": \"/wp-content/uploads/2025/08/Nodal-officer-letter.pdf\"}]}]',1,'2025-12-11 05:41:23','2025-12-29 09:45:33',0,0),(20,'newspaper-publication','Newspaper Publication',1,'[\"2025-26\", \"2024-25\", \"2023-24\", \"2022-23\", \"2021-22\"]','[{\"title\": \"September 2021\", \"documents\": [{\"date\": \"30/09/2021\", \"year\": \"2021-22\", \"title\": \"Business Standard Refex Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Refex-Results-30.09.2021.pdf\", \"publishedDate\": \"30/09/2021\"}, {\"date\": \"30/09/2021\", \"year\": \"2021-22\", \"title\": \"Dinamani Refex Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Refex-Results-30.09.2021.pdf\", \"publishedDate\": \"30/09/2021\"}]}, {\"title\": \"March 2022\", \"documents\": [{\"date\": \"31/03/2022\", \"year\": \"2021-22\", \"title\": \"Business Standard Refex Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Refex-Results-31.03.2022.pdf\", \"publishedDate\": \"31/03/2022\"}, {\"date\": \"31/03/2022\", \"year\": \"2021-22\", \"title\": \"Dinamani Refex Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Refex-Results-31.03.2022.pdf\", \"publishedDate\": \"31/03/2022\"}]}, {\"title\": \"December 2021\", \"documents\": [{\"date\": \"31/12/2021\", \"year\": \"2021-22\", \"title\": \"Business Standard Refex Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Refex-Results-31.12.2021.pdf\", \"publishedDate\": \"31/12/2021\"}, {\"date\": \"31/12/2021\", \"year\": \"2021-22\", \"title\": \"Dinamani Refex Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Refex-Results-31.12.2021.pdf\", \"publishedDate\": \"31/12/2021\"}]}, {\"title\": \"AGM\", \"documents\": [{\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Business Standard Refex AGM Notice\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Refex-AGM-Notice.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Dinamani Refex AGM Notice\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Refex-AGM-Notice.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"year\": \"2022-23\", \"title\": \"AGM Newspaper Ad and Corrigendum\", \"pdfUrl\": \"/wp-content/uploads/investor-media/AGM-Newspaper-ad-and-Corrigendum-2022.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"year\": \"2023-24\", \"title\": \"21st AGM Newspaper Publication\", \"pdfUrl\": \"/wp-content/uploads/investor-media/21st-AGM-Newspaper-Publication-2023.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"year\": \"2024-25\", \"title\": \"22nd AGM Newspaper Publication\", \"pdfUrl\": \"/wp-content/uploads/investor-media/22nd-AGM-Newspaper-Publication-2024.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"23rd AGM Pre-Notice – Newspaper Publication – 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/06/RIL_Reg47_PreNotice_Ad_sd.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"23rd AGM – Notice – Newspaper Publication – 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/06/RIL_NP_23rdAGM_Notice_sd-1.pdf\", \"publishedDate\": \"\"}]}, {\"title\": \"September 2022\", \"documents\": [{\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"Business Standard and Dinamani\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-and-Dinamani-30.09.2022.pdf\", \"publishedDate\": \"30/09/2022\"}]}, {\"title\": \"March 2023\", \"documents\": [{\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"Business Standard Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Busniess-Standard.pdf\", \"publishedDate\": \"31/03/2023\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"Dinamani Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani.pdf\", \"publishedDate\": \"31/03/2023\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"The Economic Times Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/The-Economic-times.pdf\", \"publishedDate\": \"31/03/2023\"}]}, {\"title\": \"June 2022\", \"documents\": [{\"date\": \"30/06/2022\", \"year\": \"2022-23\", \"title\": \"Dinamani Refex Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Refex-Results-30062022.pdf\", \"publishedDate\": \"30/06/2022\"}, {\"date\": \"30/06/2022\", \"year\": \"2022-23\", \"title\": \"Business Standard Refex Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Refex-Results-30062022.pdf\", \"publishedDate\": \"30/06/2022\"}]}, {\"title\": \"December 2022\", \"documents\": [{\"date\": \"31/12/2022\", \"year\": \"2022-23\", \"title\": \"Business Standard and Dinamani\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-and-Dinamani-31.12.2022.pdf\", \"publishedDate\": \"31/12/2022\"}]}, {\"title\": \"September 2023\", \"documents\": [{\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"Business Standard Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Results-30-09-2023.pdf\", \"publishedDate\": \"30/09/2023\"}, {\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"Dinamani Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Results-30-09-2023.pdf\", \"publishedDate\": \"30/09/2023\"}]}, {\"title\": \"Postal ballot\", \"documents\": [{\"date\": \"\", \"year\": \"2023-24\", \"title\": \"Postal ballot Notice Newspaper Publication\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Postal-ballot-Notice-Newspaper-Publication.pdf\", \"publishedDate\": \"\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL- Copy of Newspaper publication – Postal Ballot\", \"pdfUrl\": \"/wp-content/uploads/2025/04/RIL_Newspaper_sd.pdf\", \"publishedDate\": \"\"}]}, {\"title\": \"March 2024\", \"documents\": [{\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Business Standard Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Results-31-03-2024.pdf\", \"publishedDate\": \"31/03/2024\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Dinamani-Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Results-31-03-2024.pdf\", \"publishedDate\": \"31/03/2024\"}]}, {\"title\": \"June 2023\", \"documents\": [{\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"Business Standard Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/BS-Chennai.pdf\", \"publishedDate\": \"30/06/2023\"}, {\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"Dinamani Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Chennai.pdf\", \"publishedDate\": \"30/06/2023\"}, {\"date\": \"30/06/2023\", \"year\": \"2023-24\", \"title\": \"The Economic Times Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ET-Chennai.pdf\", \"publishedDate\": \"30/06/2023\"}]}, {\"title\": \"December 2023\", \"documents\": [{\"date\": \"31/12/2023\", \"year\": \"2023-24\", \"title\": \"Business Standard Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Results-31-12-2023.pdf\", \"publishedDate\": \"31/12/2023\"}, {\"date\": \"31/12/2023\", \"year\": \"2023-24\", \"title\": \"Dinamani Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Results-31-12-2023.pdf\", \"publishedDate\": \"31/12/2023\"}]}, {\"title\": \"September 2024\", \"documents\": [{\"date\": \"11/11/2024\", \"year\": \"2024-25\", \"title\": \"Business Standard Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Results-14-11-2024.pdf\", \"publishedDate\": \"11/11/2024\"}, {\"date\": \"15/11/2024\", \"year\": \"2024-25\", \"title\": \"Dinamani Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Results-15-11-2024.pdf\", \"publishedDate\": \"15/11/2024\"}]}, {\"title\": \"June 2024\", \"documents\": [{\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Business Standard Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Business-Standard-Results-31-06-2024.pdf\", \"publishedDate\": \"30/06/2024\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Dinamani Results\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Dinamani-Results-31-06-2024.pdf\", \"publishedDate\": \"30/06/2024\"}]}, {\"title\": \"December 2024\", \"documents\": [{\"date\": \"28/01/2025\", \"year\": \"2024-25\", \"title\": \"Business Standard Results\", \"pdfUrl\": \"/wp-content/uploads/2025/02/Dinamani-Results29012025.pdf\", \"publishedDate\": \"28/01/2025\"}, {\"date\": \"29/01/2025\", \"year\": \"2024-25\", \"title\": \"Dinamani Results\", \"pdfUrl\": \"https:/wp-content/uploads/2025/02/Dinamani-Results29012025.pdf\", \"publishedDate\": \"29/01/2025\"}]}, {\"title\": \"September 2025\", \"documents\": [{\"date\": \"05/11/2025\", \"year\": \"2025-26\", \"title\": \"RIL- Financial Results FY26\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_NewspaperPublication_Q2FY26.pdf\", \"publishedDate\": \"05/11/2025\"}]}, {\"title\": \"March 2025\", \"documents\": [{\"date\": \"25/04/2025\", \"year\": \"2025-26\", \"title\": \"RIL- Financial Results FY25\", \"pdfUrl\": \"https:/wp-content/uploads/2025/05/RIL_Newspaper_sds.pdf\", \"publishedDate\": \"25/04/2025\"}]}, {\"title\": \"June 2025\", \"documents\": [{\"date\": \"13/08/2025\", \"year\": \"2025-26\", \"title\": \"RIL- Financial Results FY26\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Newspaper-13.08.2025.pdf\", \"publishedDate\": \"13/08/2025\"}]}]',1,'2025-12-11 05:50:57','2025-12-29 09:05:06',1,1),(21,'unpaid-dividend-list-and-iepf-shares','Unpaid Dividend List and IEPF Shares',1,'[\"2024-25\", \"2023-24\", \"2022-23\", \"2021-22\"]','[{\"title\": \"Unpaid Dividend List and IEPF Shares\", \"audios\": [], \"contents\": [{\"title\": \"Mr. Ankit Poddar\", \"content\": \"Refex Industries Limited\\n2nd Floor, No.313, Refex Towers,\\nSterling Road, Valluvar Kottam High Road,\\nNungambakkam, Chennai,\\nTamil Nadu - 600034\\nPhone: 044 - 3504 0050\\nEmail: investor.relations@refex.co.in\", \"subtitle\": \"(Nodal Officer)\"}], \"documents\": [{\"date\": \"\", \"year\": \"2021-22\", \"title\": \"Shares transferred to IEPF\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-IEPF-SHARES-TRANSFERED-LIST.pdf\"}, {\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"Final Dividend 2021- Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Unpaid-and-Unclaimed-Final-Dividend-List-as-on-30.09.2022.pdf\", \"publishedDate\": \"30/09/2022\"}, {\"date\": \"30/09/2022\", \"year\": \"2022-23\", \"title\": \"Interim Dividend 2021- Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Unpaid-and-Unclaimed-Interim-Dividend-List-as-on-30.09.2022.pdf\", \"publishedDate\": \"30/09/2022\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"Final Dividend 2021- Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Final-Dividend_32229_31032023.pdf\", \"publishedDate\": \"31/03/2023\"}, {\"date\": \"31/03/2023\", \"year\": \"2022-23\", \"title\": \"Interim Dividend 2021- Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Interim-Dividend_91034_31032023.pdf\", \"publishedDate\": \"31/03/2023\"}, {\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"Final Dividend 2021- Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Unpaid-and-Unclaimed-Final-Dividend-List-as-on-30092023.pdf\", \"publishedDate\": \"30/09/2023\"}, {\"date\": \"30/09/2023\", \"year\": \"2023-24\", \"title\": \"Interim Dividend 2021- Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Unpaid-and-Unclaimed-Interim-Dividend-List-as-on-30092023.pdf\", \"publishedDate\": \"30/09/2023\"}, {\"date\": \"30/01/2024\", \"year\": \"2023-24\", \"title\": \"Final Dividend 2023- Unpaid and Unclaimed Dividend List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Unpaid-and-Unclaimed-Dividend-2023-List-as-on-30-01-2024.pdf\", \"publishedDate\": \"30/01/2024\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Final Dividend 2021- Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unpaid-and-Unclaimed-List-as-on-31-03-2024.pdf\", \"publishedDate\": \"31/03/2024\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Interim Dividend 2021- Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Interim-Dividend-2021-Unpaid-and-Unclaimed-List-as-on-31-03-2024.pdf\", \"publishedDate\": \"31/03/2024\"}, {\"date\": \"31/03/2024\", \"year\": \"2023-24\", \"title\": \"Final Dividend 2023 – Unpaid and Unclaimed Dividend List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Unpaid-and-Unclaimed-Dividend-List-as-on-31-03-2024.pdf\", \"publishedDate\": \"31/03/2024\"}, {\"date\": \"15/06/2024\", \"year\": \"2024-25\", \"title\": \"Interim Dividend 2024 – Unpaid and Unclaimed Dividend List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Interim-Dividend2024-Unpaid-and-Unclaimed-Dividend-List-as-on-15-06-2024.PDF\", \"publishedDate\": \"15/06/2024\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Final Dividend 2021 – Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Final-Dividend-2021-Unpaid-and-Unclaimed-List-as-on-30-06-2024.PDF\", \"publishedDate\": \"30/06/2024\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Final Dividend 2023 – Unpaid and Unclaimed Dividend List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Final-Dividend-2023-Unpaid-and-Unclaimed-Dividend-List-as-on-30-06-2024.PDF\", \"publishedDate\": \"30/06/2024\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Interim Dividend 2021- Unpaid and Unclaimed List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Interim-Dividend-2021-Unpaid-and-Unclaimed-List-as-on-30-06-2024.PDF\", \"publishedDate\": \"30/06/2024\"}, {\"date\": \"30/06/2024\", \"year\": \"2024-25\", \"title\": \"Interim Dividend 2024 – Unpaid and Unclaimed Dividend List\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Interim-Dividend-2024-Unpaid-and-Unclaimed-Dividend-List-as-on-30-06-2024.PDF\", \"publishedDate\": \"30/06/2024\"}, {\"date\": \"09/09/2024\", \"year\": \"2024-25\", \"title\": \"Interim dividend 2021- Unpaid and unclaimed list\", \"pdfUrl\": \"/wp-content/uploads/investor-media/unpain-listI1_2021.PDF\", \"publishedDate\": \"09/09/2024\"}, {\"date\": \"30/09/2024\", \"year\": \"2024-25\", \"title\": \"Final dividend 2021- Unpaid and unclaimed list\", \"pdfUrl\": \"/wp-content/uploads/investor-media/unpaid-list2021.PDF\", \"publishedDate\": \"30/09/2024\"}, {\"date\": \"30/09/2024\", \"year\": \"2024-25\", \"title\": \"Final dividend 2023- Unpaid and unclaimed Dividend list\", \"pdfUrl\": \"/wp-content/uploads/investor-media/unpain-list2023.PDF\", \"publishedDate\": \"30/09/2024\"}, {\"date\": \"30/09/2024\", \"year\": \"2024-25\", \"title\": \"Interim dividend 2024- Unpaid and unclaimed Dividend list\", \"pdfUrl\": \"/wp-content/uploads/investor-media/unpaid-listI1_2024.PDF\", \"publishedDate\": \"30/09/2024\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Final dividend 2021- Unpaid and unclaimed Dividend list\", \"pdfUrl\": \"/wp-content/uploads/2024/12/unpaid_list_2021.pdf\", \"publishedDate\": \"31/12/2024\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Final dividend 2023- Unpaid and unclaimed Dividend list\", \"pdfUrl\": \"/wp-content/uploads/2024/12/unpaid_list_2023.pdf\", \"publishedDate\": \"31/12/2024\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Interim dividend 2024- Unpaid and unclaimed Dividend list\", \"pdfUrl\": \"/wp-content/uploads/2024/12/unpaid_list_2024.pdf\", \"publishedDate\": \"31/12/2024\"}, {\"date\": \"31/12/2024\", \"year\": \"2024-25\", \"title\": \"Interim dividend 2021- Unpaid and unclaimed Dividend list\", \"pdfUrl\": \"/wp-content/uploads/2024/12/unpaid_list_I1_2021.pdf\", \"publishedDate\": \"31/12/2024\"}, {\"date\": \"31/03/2025\", \"year\": \"2024-25\", \"title\": \"Unpaid & unclaimed Dividend list – Consolidated\", \"pdfUrl\": \"/wp-content/uploads/2025/03/RIL_Unclaimed_Div_Data_March2025_Consolidated.pdf\", \"publishedDate\": \"31/03/2025\"}]}]',1,'2025-12-11 06:08:52','2025-12-29 06:34:28',0,1),(22,'disclosures-under-sast-regulations-2011','Disclosures under SAST Regulations 2011',0,'[]','[{\"title\": \"Disclosures under SAST Regulations 2011\", \"documents\": [{\"date\": \"\", \"title\": \"Disclosure under 10(6) SAST Regulations 2011\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Regulation-10(6)-SAST-Disclosure.pdf\"}, {\"date\": \"\", \"title\": \"Disclosure under 29(1) of SAST Regulations 2011\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Regulation-29-SAST_Change-in-Promoter.pdf\"}]}]',1,'2025-12-11 06:14:05','2025-12-29 06:15:51',0,0),(23,'employee-stock-option-scheme','Employee Stock Option Scheme',0,'[]','[{\"title\": \"Employee Stock Option Scheme\", \"documents\": [{\"date\": \"\", \"title\": \"Refex ESOP Scheme 2021\", \"pdfUrl\": \"/wp-content/uploads/2025/05/REFEX-ESOP-Scheme2021.pdf\"}, {\"date\": \"\", \"title\": \"ESOP Disclosure 2022-23\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ESOP-Disclosure-2022-23.pdf\"}, {\"date\": \"\", \"title\": \"ESOP Disclosure 2023-24\", \"pdfUrl\": \"/wp-content/uploads/investor-media/ESOP-Disclosure-2023-24.pdf\"}, {\"date\": \"\", \"title\": \"ESOP Disclosure 2024-25\", \"pdfUrl\": \"/wp-content/uploads/2025/07/RIL_ESOP_Disclosure_FY24-25.pdf\"}]}]',1,'2025-12-11 06:15:01','2025-12-29 06:08:18',0,0),(24,'monitoring-agency-report','Monitoring Agency Report',0,'[]','[{\"title\": \"Monitoring Agency Report\", \"audios\": [], \"contents\": [], \"documents\": [{\"date\": \"\", \"title\": \"Monitoring Agency Report 31/03/2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/REFEX-Monitoring-Agency-Report-Mar-2024.pdf\"}, {\"date\": \"\", \"title\": \"Monitoring Agency Report 31/06/2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Monitoring-Agency-Report-31-06-2024.pdf\"}, {\"date\": \"\", \"title\": \"Monitoring Agency Report 30/09/2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Monitoring-Agency-Report-30-09-2024.pdf\"}, {\"date\": \"\", \"title\": \"Monitoring Agency Report 30/09/2024\", \"pdfUrl\": \"/wp-content/uploads/2025/04/Monitoring-Agency-Report-for-the-quarter-ended-December-31-2024.pdf\"}, {\"date\": \"\", \"title\": \"Monitoring Agency Report - 31/03/2025\", \"pdfUrl\": \"/wp-content/uploads/2025/05/RIL_MAR_Q4_FY25_sd.pdf\"}, {\"date\": \"\", \"title\": \"Monitoring Agency Report - 30/06/2025\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_Monitoring-Agency-Report_June30-2025.pdf\"}, {\"date\": \"\", \"title\": \"Monitoring Agency Report - 30/09/2025\", \"pdfUrl\": \"/wp-content/uploads/2025/11/RIL_MAReport_Q2_FY26.pdf\"}]}]',1,'2025-12-11 06:16:25','2025-12-29 06:04:53',0,0),(25,'statement-of-deviation','Statement of Deviation',0,'[]','[{\"title\": \"Statement of Deviation\", \"audios\": [], \"contents\": [], \"documents\": [{\"date\": \"\", \"title\": \"Statement of Deviation 31/12/024\", \"pdfUrl\": \"/wp-content/uploads/2025/04/RIL_Statement-of-Deviation_27.01.2025.pdf\"}, {\"date\": \"\", \"title\": \"Statement of Deviation 30/09/2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/RIL-Statement-of-Deviation-30.-09-2024.pdf\"}, {\"date\": \"\", \"title\": \"Statement of Deviation 30/06/2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Statement-of-Deviation-30-06-2024.pdf\"}, {\"date\": \"\", \"title\": \"Statement of Deviation 30/03/2024\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Statement-of-Deviation-30-03-2024.pdf\"}]}]',1,'2025-12-11 06:17:17','2025-12-29 05:58:46',0,0),(26,'csr-activities','CSR Activities',0,'[]','[{\"title\": \"CSR Activities\", \"documents\": [{\"date\": \"\", \"title\": \"CSR Activities 2023-24\", \"pdfUrl\": \"/wp-content/uploads/investor-media/CSR-Activities-2023-24.pdf\"}]}]',1,'2025-12-11 06:17:39','2025-12-29 05:56:05',0,0),(27,'charter-documents','Charter Documents',0,'[]','[{\"title\": \"Charter Documents\", \"documents\": [{\"date\": \"\", \"title\": \"Articles of Association\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Articles_of_Association.pdf\"}, {\"date\": \"\", \"title\": \"Memorandum of Association\", \"pdfUrl\": \"/wp-content/uploads/2025/08/RIL_MOA_August-05-2025.pdf\"}, {\"date\": \"\", \"title\": \"Certificate of Incorporation\", \"pdfUrl\": \"/wp-content/uploads/investor-media/Certificate_of_Incorporation.pdf\"}]}]',1,'2025-12-11 06:18:20','2025-12-29 05:52:28',0,0),(28,'scheme-of-amalgamation-arrangement','Scheme of Amalgamation / Arrangement',0,'[]','[{\"title\": \"Scheme of Amalgamation Arrangement\", \"audios\": [], \"contents\": [], \"documents\": [{\"date\": \"\", \"year\": \"2025-26\", \"title\": \"Accounting Treatment ANNEXURE – 9A 9B 9C\", \"pdfUrl\": \"wp-content/uploads/2025/09/Accounting-Treatment-ANNEXURE-9A-9B-9C.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"Fairness Opinion ANNEXURE-3\", \"pdfUrl\": \"/wp-content/uploads/2025/09/Fairness-Opinion-ANNEXURE-3.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL – Financial Summary – ANNEXURE-8B\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL-Financial-Summary-ANNEXURE-8B.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL – Report of Audit Committee ANNEXURE-5\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL-Report-of-Audit-Committee-ANNEXURE-5.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL Compliance Report ANNEXURE-13\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL-Compliance-Report-ANNEXURE-13.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"Undertaking for Valuation – ANNEXURE- 2B\", \"pdfUrl\": \"https:/wp-content/uploads/2025/09/Undertaking-for-Valuation-ANNEXURE-2B.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"Auditor Certificate – NOC Evoting ANNEXURE-10A\", \"pdfUrl\": \"/wp-content/uploads/2025/09/Auditor-Certificate-NOC-Evoting-ANNEXURE-10A.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RGML – Financial Summary ANNEXURE- 8A\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RGML-Financial-Summary-ANNEXURE-8A.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL – No Debt Default ANNEXURE 12\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL-No-Debt-Default-ANNEXURE-12.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL – Report of Independent Driectors ANNEXURE-4\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL-Report-of-Independent-Driectors-ANNEXURE-4.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL RGML – NOC for FI ANNEXURE-11A,11B\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL-RGML-NOC-for-FI-ANNEXURE-11A11B.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"Valuation Report ANNEXURE- 2A\", \"pdfUrl\": \"/wp-content/uploads/2025/09/Valuation-Report-ANNEXURE-2A.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL RML – pre and post shareholding with PAN\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL-RML-pre-and-post-shareholding-with-PAN.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL RML – Pre and Post Shareholding Pattern without PAN\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL-RML-Pre-and-Post-Shareholding-Pattern-without-PAN.pdf\"}, {\"date\": \"\", \"year\": \"2025-26\", \"title\": \"RIL RGML – Composite Scheme of Amalgamation – September 2025\", \"pdfUrl\": \"/wp-content/uploads/2025/09/RIL-RGML_Scheme_September-2025.pdf\"}]}]',1,'2025-12-11 06:23:02','2025-12-29 05:45:58',0,0),(29,'registrar-transfer-agent','Registrar & Transfer Agent',0,'[]','[{\"title\": \"Registrar & Transfer Agent\", \"audios\": [], \"contents\": [{\"title\": \"Mr. R. D. Ramasamy, Director - M/s CAMEO CORPORATE SERVICES LIMITED\", \"content\": \"Subramanian Building,\\nNo.1, Club House Road,\\nChennai- 600002, Tamil Nadu.\\nPhone: 044-28460390\\nEmail: investor@cameoindia.com\", \"subtitle\": \"\"}], \"documents\": []}]',1,'2025-12-16 05:45:35','2025-12-16 05:45:35',0,0);
/*!40000 ALTER TABLE `investors_page_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors_related_links`
--

DROP TABLE IF EXISTS `investors_related_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors_related_links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `href` text NOT NULL,
  `display_order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors_related_links`
--

LOCK TABLES `investors_related_links` WRITE;
/*!40000 ALTER TABLE `investors_related_links` DISABLE KEYS */;
INSERT INTO `investors_related_links` VALUES (1,'Key Managerial Personnel','/investors/key-managerial-personnel/',0,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(2,'Financial Information','/investors/financial-information/',1,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(3,'Annual Reports','/investors/annual-reports/',2,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(4,'General Meeting Updates','/investors/general-meeting-updates/',3,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(5,'Investor Presentation','/investors/investor-presentation/',4,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(6,'Code of fair Disclosure UPSI','/investors/code-of-fair-disclosure-upsi/',5,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(7,'Policies','/investors/policies/',6,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(8,'Credit Ratings','/investors/credit-ratings/',7,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(9,'Recording & Transcripts of Post Earnings / Quarterly Calls','/investors/recording-transcripts-of-post-earnings-quarterly-calls/',8,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(10,'Disclosure of Material Events or Information','/investors/disclosure-of-material-events-or-information/',9,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(11,'Stock Exchange Quarterly Compliance','/investors/stock-exchange-quarterly-compliance/',10,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(12,'Familiarization Programme for Independent Directors','/investors/familiarization-programme-for-independent-directors/',11,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(13,'Terms and Conditions of Appointment of ID','/investors/terms-and-conditions-of-appointment-of-id/',12,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(14,'IPO','/investors/ipo/',13,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(15,'Rights Issue','/investors/rights-issue/',14,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(16,'Financial Statement of Subsidiary','/investors/financial-statement-of-subsidiary/',15,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(17,'Annual Return','/investors/annual-return/',16,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(18,'Book Closure of Members Register / Record Date','/investors/book-closure-of-members-register-record-date/',17,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(19,'Secretarial Compliance Report','/investors/secretarial-compliance-report/',18,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(20,'Investor Information','/investors/investor-information/',19,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(21,'Registrar & Transfer Agent','/investors/registrar-transfer-agent/',20,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(22,'Newspaper Publication','/investors/newspaper-publication/',21,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(23,'Unpaid Dividend List and IEPF Shares','/investors/unpaid-dividend-list-and-iepf-shares/',22,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(24,'Disclosures under SAST Regulations 2011','/investors/disclosures-under-sast-regulations-2011/',23,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(25,'Employee Stock Option Scheme','/investors/employee-stock-option-scheme/',24,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(26,'Monitoring Agency Report','/investors/monitoring-agency-report/',25,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(27,'Statement of Deviation','/investors/statement-of-deviation/',26,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(28,'CSR Activities','/investors/csr-activities/',27,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(29,'Charter Documents','/investors/charter-documents/',28,1,'2025-12-03 11:06:31','2025-12-03 11:06:31'),(30,'Scheme of Amalgamation / Arrangement','/investors/scheme-of-amalgamation-arrangement/',29,1,'2025-12-03 11:06:32','2025-12-03 11:06:32');
/*!40000 ALTER TABLE `investors_related_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors_related_links_section`
--

DROP TABLE IF EXISTS `investors_related_links_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors_related_links_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Related Links',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors_related_links_section`
--

LOCK TABLES `investors_related_links_section` WRITE;
/*!40000 ALTER TABLE `investors_related_links_section` DISABLE KEYS */;
INSERT INTO `investors_related_links_section` VALUES (1,'Related Links',1,'2025-12-03 11:06:31','2025-12-03 11:06:31');
/*!40000 ALTER TABLE `investors_related_links_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors_stock_chart`
--

DROP TABLE IF EXISTS `investors_stock_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors_stock_chart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'STOCK CHART',
  `filter_today` varchar(255) DEFAULT 'Today',
  `filter5_days` varchar(255) DEFAULT '5 Days',
  `filter1_month` varchar(255) DEFAULT '1 Month',
  `filter3_months` varchar(255) DEFAULT '3 Months',
  `filter6_months` varchar(255) DEFAULT '6 Months',
  `filter1_year` varchar(255) DEFAULT '1 Year',
  `filter3_years` varchar(255) DEFAULT '3 Years',
  `filter_y_t_d` varchar(255) DEFAULT 'YTD',
  `filter_m_a_x` varchar(255) DEFAULT 'MAX',
  `filter_custom` varchar(255) DEFAULT 'Custom',
  `default_chart_type` varchar(255) DEFAULT 'line',
  `default_exchange` varchar(255) DEFAULT 'BSE',
  `default_filter` varchar(255) DEFAULT 'Today',
  `nonce` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors_stock_chart`
--

LOCK TABLES `investors_stock_chart` WRITE;
/*!40000 ALTER TABLE `investors_stock_chart` DISABLE KEYS */;
INSERT INTO `investors_stock_chart` VALUES (1,'STOCK CHART','Today','5 Days','1 Month','3 Months','6 Months','1 Year','3 Years','YTD','MAX','Custom','line','BSE','Today','44efac5c14',1,'2025-12-03 08:33:23','2025-12-03 08:33:43');
/*!40000 ALTER TABLE `investors_stock_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors_stock_quote`
--

DROP TABLE IF EXISTS `investors_stock_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors_stock_quote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'STOCK QUOTE',
  `currency` varchar(255) NOT NULL DEFAULT 'Rupees',
  `column_currency` varchar(255) DEFAULT 'CURRENCY',
  `column_price` varchar(255) DEFAULT 'PRICE',
  `column_bid` varchar(255) DEFAULT 'BID',
  `column_offer` varchar(255) DEFAULT 'OFFER',
  `column_change` varchar(255) DEFAULT 'CHANGE IN (%)',
  `column_volume` varchar(255) DEFAULT 'VOLUME',
  `column_today_open` varchar(255) DEFAULT 'TODAY''S OPEN',
  `column_previous_close` varchar(255) DEFAULT 'PREVIOUS CLOSE',
  `column_intraday_high` varchar(255) DEFAULT 'INTRADAY HIGH',
  `column_intraday_low` varchar(255) DEFAULT 'INTRADAY LOW',
  `column_week_high52` varchar(255) DEFAULT '52 WEEK HIGH',
  `column_week_low52` varchar(255) DEFAULT '52 WEEK LOW',
  `footer_text` varchar(255) DEFAULT 'Pricing delayed by 5 minutes',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors_stock_quote`
--

LOCK TABLES `investors_stock_quote` WRITE;
/*!40000 ALTER TABLE `investors_stock_quote` DISABLE KEYS */;
INSERT INTO `investors_stock_quote` VALUES (1,'STOCK QUOTE','Rupees','CURRENCY','PRICE','BID','OFFER','CHANGE IN (%)','VOLUME','TODAY\'S OPEN','PREVIOUS CLOSE','INTRADAY HIGH','INTRADAY LOW','52 WEEK HIGH','52 WEEK LOW','Pricing delayed by 5 minutes',1,'2025-12-06 07:38:59','2025-12-06 07:38:59');
/*!40000 ALTER TABLE `investors_stock_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey_items`
--

DROP TABLE IF EXISTS `journey_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `year` varchar(255) DEFAULT NULL,
  `image` text,
  `color` varchar(255) DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey_items`
--

LOCK TABLES `journey_items` WRITE;
/*!40000 ALTER TABLE `journey_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `journey_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leadership_members`
--

DROP TABLE IF EXISTS `leadership_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leadership_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text,
  `achievements_json` text,
  `experience` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `image` text,
  `color` varchar(255) DEFAULT NULL,
  `linkedin` text,
  `biography` text,
  `directorship_details` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leadership_members`
--

LOCK TABLES `leadership_members` WRITE;
/*!40000 ALTER TABLE `leadership_members` DISABLE KEYS */;
INSERT INTO `leadership_members` VALUES (1,'Purvesh Kapadia','Group CHRO','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798779038-958975331.jpg',NULL,'https://www.linkedin.com/in/purveshkapadia/','In a career span of 25+ Years – Purvesh has played multiple strategic pinnacle roles ranging from CHRO-Managing Partner-COO-Director HR etc. Throughout his career he has taken up several challenging assignments and has been instrumental in redefining the HR process for several leading organizations globally. Business process reengineering is his exclusive strength tested and proven in his career span. His innate process-driven approach has helped in achieving double-digit top-line and bottom-line growth for several organizations, he has been associated with. He has worked with several prestigious organizations such as Terex, Intervalve India Ltd, Sheetal Group etc. Purvesh has also spent 10+ years in the IT Education sector.\n\nAcademically , he has a Master’s in Human Resources – Development & Management from Jamnalal Bajaj Institute of Management Studies and a Honours in Systems Management (Information Technology) from National Institute of Information Technology.  ',NULL,1,1,'2025-12-06 07:38:59','2025-12-15 11:39:43'),(2,'Jagdish Jain','Business Head – Ash & Coal Handling','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798793449-358416240.jpg',NULL,NULL,'Jagdish has over 20 years of experience in handling multiple businesses. Starting a business career at a very young age he has honed his business skills through his journey to now head the Ash and Coal business for Refex. His vast experience includes domains such as Steel, Construction, Transport, Refrigerants etc. where he proved his prowess as an entrepreneur. He is fuelled by his passion and drive to achieve his business goals. His key strengths include liaising, negotiation and fleet & transport management. He manages the thermal or power plants to ensure seamless functioning and is always in pursuit of expanding his business. \n\nAcademically, a Commerce graduate by education and has been recognized with multiple industry recognitions. ',NULL,2,1,'2025-12-06 07:38:59','2025-12-15 11:39:56'),(3,'Tarun Arora','Chief Business Officer - Ash & Coal Handling','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798816516-819353044.jpg',NULL,NULL,'Tarun Arora brings nearly two decades of techno-commercial expertise, having advanced from engineering roles to senior leadership positions across industries such as mining, logistics, and heavy industrial operations. His career reflects a deep business acumen—driving large-scale transformations, managing P&L portfolios exceeding ₹2000 crore, and leading cross-functional teams across India.\n\nTarun began his career as a Graduate Engineer Trainee, gaining hands-on experience in process management and operations. His drive for excellence and strategic insight led him to senior roles at Vedanta Group, including Business Head, Director – Commercial, and Chief Commercial Officer, where he led large-scale initiatives in logistics, procurement, and process optimization to enhance efficiency and profitability. He oversaw large-scale coal logistics operations worth over ₹1000 crore, driving efficiency, growth, and operational excellence across India.\n\nA graduate in Chemical Engineering from Thapar Institute of Engineering & Technology, Tarun further honed his leadership capabilities through an Executive MBA from S.P. Jain Institute of Management and Research (SPJIMR).\n\nAcademically, a Commerce graduate by education and has been recognized with multiple industry recognitions. ',NULL,3,1,'2025-12-06 07:38:59','2025-12-15 11:40:19'),(4,'Vishesh Mehta','Head – Business Development','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798833631-333333358.jpg',NULL,'https://www.linkedin.com/in/vishesh-mehta-13891372/','Dynamic business leader with 17+ years of cross-industry experience spanning operations, business development, and end-to-end project execution across power markets, real estate, industrial operations, and project management. Well-versed in regulatory engagement, client acquisition, market expansion, and managing large-scale operational workflows, including significant experience in the power sector.\n\nProven ability to lead diverse portfolios ranging from incubation centre development and residential construction to restaurant setups, film production, and multi-state business development for the fly ash division. Brings a strong blend of strategic thinking and on-ground execution, consistently delivering operational efficiency and business growth.\n\nHolds a Bachelor’s degree in Mechanical Engineering from Anna University, supported by a strong academic foundation from premier institutions in Chennai. Recognised for a hands-on leadership style, execution-driven mindset, and a sharp ability to convert ideas into scalable, sustainable outcomes.',NULL,4,1,'2025-12-06 07:38:59','2025-12-15 11:40:37'),(5,'Gautam Jain','Head – Investor Relations','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798849897-448422189.jpg',NULL,'https://www.linkedin.com/in/gautam-jain-019891/?','Gautam is a strategic thinker with over 20 years of experience in various functions, predominantly in Investor Relations and Strategy roles.\n\nHe has rich experience in all the IR-related activities viz. fund raising (IPO, QIPs, Rights, PE, etc), NDRs, managing sell-side analysts, representing to fund managers, analyst meets and concalls, etc.\n\nIn addition to the power and infrastructure sector, he has gained valuable exposure in various industries, viz. wood panel, EPC, Agri-warehousing, Coal mining, Real Estate, etc.\n\nAcademically, he has done an MBA (Finance) from ICFAI Business School, Bangalore in 2004.',NULL,5,1,'2025-12-06 07:38:59','2025-12-15 11:40:52'),(6,'Sahil Singla','President – Corporate Finance','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798869238-440303009.jpg',NULL,'https://www.linkedin.com/in/sahil-singla-1523064/','Sahil has over 19 years of experience in fundraising across sectors and has cumulatively raised more than USD 5 BN from Banks/FIs/Private Equity etc.  He has a unique blend of technical, financial and legal domain knowledge which sets him apart.  \n\nHis expertise is Project Structuring/Advisory, Equity Investments & Divestments, Financial Modelling, Business Analysis, Negotiations & Regulatory/Policy Advocacy. He has demonstrated experience in spearheading strategic initiatives and managing large key accounts.\n\nIn his earlier stints he has worked for various reputed organisations like JP Morgan, IL&FS Financial Services, SREI Infrastructure, PTC India Limited etc.\n\nSahil has completed his MBA in Finance from IMT Ghaziabad and his Bachelors in Legal Science from Government law college, Mumbai and a University topper in Law.',NULL,6,1,'2025-12-06 07:38:59','2025-12-15 11:41:11'),(7,'Sonal Jain','VP – Accounts & Taxation','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798886918-911734333.jpg',NULL,'https://www.linkedin.com/in/casonaljainjbp/','Sonal is an accomplished Chartered Accountant with excellent knowledge of financial reporting and accounting, having over 19 years’ of experience in Manufacturing and service industry including Transmission, Solar and EPC.\nHe has expertise in disclosure of information in financial reporting of the listed entities and evaluation of the Internal financial controls for the business and design and implementation of the internal controls in order to mitigate the financial risks. He has worked with numerous listed entities and has released quarterly/annual results of listed entity as per the requirement of SEBI/LODR.\nIn his past, he has led the “Cost Reduction Team” for KEC International Limited, Jabalpur plant and was able to reduce the conversion cost of the plant by 25% over a period of 5 years. He was a member of various Capex/Opex Negotiation committees and was able to make substantial savings.  He is an expert in identifying revenue leakages and ways of fixing the same. \nAcademically he graduated from Rani Durgavati University, Jabalpur and is a Fellow Member of ICAI. ',NULL,7,1,'2025-12-06 07:38:59','2025-12-15 11:41:41'),(8,'Ankit Poddar','Head - Company Secretarial','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798915576-952613761.jpg',NULL,'https://www.linkedin.com/in/ankit-poddar-4979461b/?originalSubdomain=in','Ankit has more than twelve years of experience in the Corporate Governance function. He is responsible for ensuring compliance with corporate and securities laws and corporate governance stipulations across Refex Group. His core area of expertise and operations has been statutory compliances, governance, corporate restructuring, corporate codes and policies, compliance management, investor relations, and all aspects of corporate secretarial function.\n\nPrior to Refex, he was associated with Sterlite Power (Vedanta Group Company) and his earlier stint was with Hindusthan Urban Infrastructure Limited and NGP Industries Limited. Academically, he is a Commerce (Hons.) Graduate from the University of Delhi and Law Graduate from Meerut University. He is an Associate Member of the Institute of Company Secretaries of India. Ankit has also completed an executive program in Compliance Management from the Indian School of Business.',NULL,8,1,'2025-12-06 07:38:59','2025-12-15 11:41:57'),(9,'Harini Sriraman','VP – Group General Counsel','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798931269-908378118.jpg',NULL,'https://www.linkedin.com/in/harini-sriraaman-a6850723/','Harini comes with over 17 years of experience in handling and addressing corporate legal and commercial matters and litigations.  She has worked with esteemed organizations like HCL Technologies Limited, Siva Group, Tattva Group (part of India Cements Group) apart from her association with the law office of M/s. Satish Parasaran at Chennai.\n\nAt Refex, as a General Counsel, she handles Contracts review and management, IPR Management, Litigation management, Mergers & Acquisitions, Corporate Governance and compliances, Disputes Resolution etc. She also heads the POSH committee. \n\nAcademically Harini is a qualified Commerce and Law graduate.  She is a certified M&A Professional – Legal & Business Strategies from Indian Academy of Law & Management, New Delhi.',NULL,9,1,'2025-12-06 07:38:59','2025-12-15 11:42:13'),(10,'Srividya Nirmalkumar','VP – Corporate Communications','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798945584-321777735.jpg',NULL,'https://www.linkedin.com/in/srividya-b-9b498414/','Srividya is an extremely goal-oriented communication professional with over 20 years of work experience in various leading organizations.  She is highly experienced in internal and external communication, social media, digital marketing and event management. Whether it is an analyst report or a marketing document, she is the go-to person. Srividya has also led diversity and inclusion and CSR initiatives in her career. She is very passionate about D&I, whether strategy or implementation and strives to make a difference to society. She has won several D&I awards and recognition for the various initiatives that she implemented. She has also been the head of the POSH committee. She has been recognized as a ‘star performer’ several times and has led award-winning teams. Her strengths include process definition and project management and has been highly acclaimed for the same. She has worked for highly reputed organizations such as Satyam, UST, Accenture, AGS Health etc. \n\nAcademically she has completed her Masters in Public Administration and post-graduation in Digital Marketing from Mudra Institute of Communications, Ahmedabad. \n\nAcademically, Lalitha has completed her graduation in Commerce and several other certifications pertaining to her domain. ',NULL,10,1,'2025-12-06 07:38:59','2025-12-15 11:42:28'),(11,'Suhail Shariff','VP – Administration & Facility','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798960088-883121770.jpg',NULL,NULL,'Suhail has over 23 years of Facility Management experience including Asset Management, Project Management, Security Services, Transitions and Change Management. A very goal-oriented leader, Suhail focuses on creating an enhanced customer experience through effective facility management solutions and has contributed to accomplishing critical FM transitions across India and global clients (APAC, EMEA  & America Regions). He has previously worked for esteemed organizations such as CB Richard Ellis, Cushman & Wakefield, and Jones Lang Lasalle.\nAcademically, Suhail holds a Commerce degree with a Certification in Leadership Programme issued by the Project Management Institute.',NULL,11,1,'2025-12-06 07:38:59','2025-12-15 11:42:53'),(12,'Srivaths Varadharajan','Group CTO','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765798986650-509184861.jpg',NULL,'https://www.linkedin.com/in/srivathsvn/','Srivaths Varadharajan is a global CTO|CIO|CDO| COO handling teams across engineering, Information technology, digital products, digital platforms, digital infrastructure, data science, digital marketing and design thinking. He has worked for institutions like Kotak Securities, Reliance, ICICI, Bharti Axa and also created Fintech startups as a founding team. He has over 25 years of experience in the BFSI, telecom, BPO, and airline industries, with a focus on driving Technology, digital, data, design, platforms, digital marketing, information security and PNL targets.\nAs a global Information technology, Digital products, digital platforms, Data and Design thinking evangelist, he has successfully delivered strategic solutions and innovations using cutting-edge technologies such as ML/AI, blockchain, digital, data and cloud. He has also been recognised as a top CIO 100 honoree and received awards for innovation from CNBC TV18 and Skoch.',NULL,12,1,'2025-12-06 07:38:59','2025-12-15 11:43:10'),(13,'Gagan Bihari Pattnaik','General Manager – ESG & Sustainability','Leadership Team',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765799006921-214383.jpg',NULL,'https://www.linkedin.com/in/gagan-pattnaik-cesga-cenv-miema-sep-usgbc-9752b715/','Gagan is a chartered environmentalist and sustainability professional (IEMA, UK, SEP-USGBC, USA) and a certified ESG analyst (CESGA®, EFFAS, Germany) with over 18 years of international experience. His assignments include geographies such as India, USA, and the Middle East in Sustainability and ESG domain in the setting and driving Corporate Sustainability/ESG Strategies leading to performance excellence. In a nutshell, his professional expertise\n\nincludes but is not limited to Decarbonization Strategy and Net Zero Goal, Climate Change and Adaptation, Built Sustainability (LEED), Energy Conservation, Audit, Sustainability Assurance & Verification, Circularity of Material, Water Stewardship, ESG Indices, and Matrices, ESG Performance\n\nDisclosure (BRSR, GRI, IIRC, TCFD, and CDP framework), CSR Project Implementation, Stakeholder Engagement, and Biodiversity Conservation program.\n\nAcademically Gagan is an M.Tech in Civil-Environmental Engineering, Distinction (UPTU, India, 2004). He also holds a Diploma in ESG Analysis (EFFAS, Germany), Certificate in Corporate Sustainability (NYU Stern, USA) and a Certificate in CSR (IICA, Ministry of Corporate Affairs, India)',NULL,13,1,'2025-12-06 07:38:59','2025-12-15 11:43:28'),(14,'Anil Jain','Chairman & Managing Director','Board Member',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765796337988-627466240.jpg',NULL,'https://www.linkedin.com/in/anil-jain-57864343/','Anil Jain is the Managing Director of Refex Group. Innately enterprising and venturesome since childhood, business came naturally to Anil. At the tender age of 17, Anil started to spend time in his family’s stainless steel trading business. His passion for identifying opportunities led him to the realm of refrigerant gas, during a meeting with a large air conditioning manufacturer. In 2002, he laid the foundation stone to set up his first refrigerant gas refilling plant under the name of Refex Refrigerants Limited (now Refex Industries Limited). Since then, there has been no looking back! Anil slowly and steadily expanded his business horizon, and Refex ventured into various business domains such as Renewable Energy, Ash & Coal, Pharma, Venture Capital, Airport Transportation, Medical Technology, Green Mobility, and Power Trading.\n\nThroughout his journey, Anil has been a mentor to many entrepreneurs. He wanted to be able to mentor more start-ups and give them the resources and platform they needed to succeed. He has successfully created many such entrepreneurs.\n\nAnil is strongly committed to sustainability and ensures Refex’s business model reflects the same ethos. For all this and much more, Anil has won several industry accolades such as ‘Trailblazer of Tamil Nadu’, ‘Young Entrepreneur’ by the Times Group, Stevie Award from the UK, Dun & Bradstreet Top 100 SMEs award etc. Refex Group under his leadership has been certified as a ‘Great Place to Work’ by GPTW for 2 years in a row.','1.Refex Renewables and Infrastructure Limited (Promoter & Non -Executive Director)\n2.Sherisha Technologies Private Limited (Managing Director)\n3.R.L.Fine Chem Private Limited\n4.Venwind Refex Limited\n5.Venwind Refex Power Limited\n6.Lee Pharma Limited\n7.Refex Green Power Limited\n8.3I Medical Technologies Private Limited\n9.Refex Airports and Transportation Private Limited\n10.Refex Beverages Private Limited\n11.SILRES Energy Solutions Private Limited\n12.EMCO Limited\n13.PHD Chamber of Commerce & Industry\n14.AJ Incubation Forum',1,1,'2025-12-08 02:01:57','2025-12-15 10:59:00'),(15,'Dinesh Kumar Agarwal','Whole-Time Director & Chief Financial Officer','Board Member',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765796347467-8419279.jpg',NULL,'https://www.linkedin.com/in/dinesh-agarwal-b561a714/','Mr. Dinesh Kumar Agarwal possesses refined entrepreneurial skills across diverse business domains, contributing to consistent success in all his business endeavours. Since 2014, his expertise, combined with his passion and zeal to grow the Company’s business, has accelerated our growth trajectory. Mr. Dinesh’s acumen in numbers has facilitated the growth of several businesses while his expertise in Corporate Finance, spanning Audit, Financial Accounting and Planning, Tax and Fundraising has helped raise over ₹ 5,000 Crores for his clients. He has worked with reputed organisations like Aircel and Brisk and holds diverse experience in Solar EPC segments and Utility-scale projects. He has also served as a consultant for start-ups, SMEs, established Corporate Houses, and International NGOs and has won several industry recognitions for his contribution to management stream and related areas.','1) Refex Renewables and Infrastructure Limited (Non-Executive Director)\n2) Sherisha Technologies Private Limited (Whole-time Director & CFO)\n3) Venwind Refex Limited\n4) Venwind Refex Power Limited\n5) Scorch Solar Energy Private Limited\n6) Singe Solar Energy Private Limited\n7) Sourashakthi Energy Private Limited\n8) Spangle Energy Private Limited\n9) Torrid Solar Power Private Limited\n10) Sparzana Aviation Private Limited\n11) Refex Life Sciences Private Limited\n12) Anam Medical Solutions Private Limited\n13) Anam API Fine Chemicals Private Limited\n14) Sherisha Infrastructure Private Limited\n15) VS Lignite Power Private Limited\n16) EMCO Limited\n17) AJ Incubation Forum\n18) Refex Solar Power Private Limited',2,1,'2025-12-08 02:04:15','2025-12-15 10:59:12'),(16,'Susmitha Siripurapu','Non-Executive Director','Board Member',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765796362882-207330655.jpg',NULL,'https://www.linkedin.com/in/susmitha-siripurapu-0a3bb380/','Susmitha is an accomplished Strategy and Program Management professional. She holds a Bachelors in Engineering degree from Osmania University with a specialization in Computer science. Post which, she worked in Consulting verticals with the BIG 4’s and helped large, multinational corporates optimize and digitalize the lease administration and accounting processes in their capital projects, optimize their facilities, and re-size their real estate portfolios. After 3 years of Consulting exposure, she pursued her Master’s in Business Administration from HEC Paris and Duke University. Ever since, she has been working in strategy roles and gained hands-on experience in developing data-driven strategic and managerial initiatives and ensuring timely and within-budget implementations. She possesses a demonstrated record in building strong leadership networks, collaborating across countries, and enabling high-performance operating models/teams across diversified industry verticals. She has proven to be adept at leveraging analytics for decision-making, formulating strategies for growth, improving efficiency in operations, and developing advanced reporting structures.\n\nAcademically completed an MBA from HEC Paris &  Duke University.','1) Refex Solar SPV Five Limited\n2) REFEX CBG SPV (MADURAI) LIMITED\n3) REFEX CBG SPV (SALEM) LIMITED\n4) REFEX CBG SPV (COIMBATORE) LIMITED\n5) VENWIND REFEX POWER SERVICES LIMITED',3,1,'2025-12-08 02:07:13','2025-12-15 10:59:25'),(17,'Dr. Vineet Kothari','Independent Director','Board Member',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765796373690-544256775.jpg',NULL,NULL,'Dr. Kothari is a Senior Advocate at the Supreme Court of India and a distinguished legal luminary, known for his expertise across Constitutional, Taxation (Domestic & International), Corporate, Insolvency, Arbitration, Property, and Family laws. His advisory work also spans key regulatory domains including FEMA, FERA, and PMLA. With a strong footprint in Alternate Dispute Resolution, he is empaneled with leading High Court–annexed arbitration centers across India, and serves on the panels of the Nani Palkhivala Arbitration Centre, Singapore International Arbitration Centre (SIAC), and Dubai International Arbitration Centre (DIAC). He is also a Senior Advisor to KPMG India and currently serves on the Governing Council of the Indian Council of Arbitration (ICA), FICCI.\n\n\nDr. Kothari’s illustrious judicial career includes serving as a Judge across the High Courts of Rajasthan, Karnataka, Madras, and Gujarat, and he has held the position of Acting Chief Justice at both the Madras and Gujarat High Courts.','ICAI Registered Valuers Organisation',4,1,'2025-12-08 02:08:54','2025-12-15 10:59:36'),(18,'Sivaramakrishnan Vasudevan','Independent Director','Board Member',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765796389322-858740973.jpg',NULL,NULL,'Mr. Sivaramakrishnan Vasudevan is a highly experienced finance professional. For the past 40 years, he has worked in the field of Corporate Law, Finance and allied subjects. He has wide exposure in diverse industries including plantation, textiles, mining, hospitality and banking and specialises in Appraisal, Valuation, and FEMA related matters. Over the years, he has handled corporate accounts and matters related to Audit and Tax, appeared before Tribunals, and participated in Board / Committee Meetings, with special reference to Nominee Directors from Financial Institutions / BIFR. He is an expert in vetting legal documents. Presently, he serves as a Consultant / Advisor to a Group of companies in Chennai. He is a commerce graduate and holds Fellow Membership of the Institute of Company Secretaries of India.','NIL',5,1,'2025-12-08 02:10:12','2025-12-15 10:59:51'),(19,'Latha Venkatesh','Independent Director','Board Member',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765796399603-214118886.jpg',NULL,NULL,'Ms. Latha Venkatesh is a qualified Cost and Management Accountant (CMA). She is a senior Auditor with eleven years of experience in practice. Having worked with clients in multiple industries, she has good knowledge and vast experience in cost audit, internal audits, processes and standards that significantly improve the opinion on company records, banking practices and management & taxation, technology driven performances. She has engaged with multiple business sectors like Engineering & Manufacturing, Construction & Civil Engineering and Banking.','1) Refex Renewables and Infrastructure Limited\n2) Torrid Solar Power Private Limited\n3) K.S. OILS LIMITED',6,1,'2025-12-08 02:11:37','2025-12-15 11:00:01'),(20,'Ramesh Dugar','Independent Director','Board Member',NULL,'[]',NULL,NULL,'http://localhost:8080/uploads/images/image-1765796415353-180492492.jpg',NULL,'https://www.linkedin.com/in/ramesh-dugar-461a1b132/','Mr. Ramesh Dugar, Director of Dugar Group of Companies, is a leading industrialist with vast experience in diverse fields such as Finance, Investments, and Real Estate. He plays a pivotal role in streamlining risk management and corporate governance for the Company. An enthusiastic and passionate leader who believes in contributing to society, he is a trustee for several charitable trusts. He also holds the prestigious positions of Chairman – All India Manufacturers Organisation and Vice Chairman – Hindustan Chamber of Commerce. Mr. Ramesh is a graduate in Commerce and holds a diploma in Marketing Management (LIBA) from Loyola.','1) Hindustan Chamber Of Commerce\n2) Goodworth Properties Private Limited\n3) Dugar Finance And Investments Limited',7,1,'2025-12-08 02:13:30','2025-12-15 11:00:17');
/*!40000 ALTER TABLE `leadership_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_histories`
--

DROP TABLE IF EXISTS `login_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_histories` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` enum('Logged-In','Logged-Out') DEFAULT 'Logged-In',
  `login_time` datetime NOT NULL,
  `logout_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_histories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_histories`
--

LOCK TABLES `login_histories` WRITE;
/*!40000 ALTER TABLE `login_histories` DISABLE KEYS */;
INSERT INTO `login_histories` VALUES ('082988a2-35e8-4603-a5e8-64b3a1473bea','c47ec327-d771-4f0d-9113-c14b45289955','Logged-In','2025-12-19 12:13:15','2025-12-19 12:13:15'),('11cbf850-d507-4d23-b1f1-3e59a345122d','c47ec327-d771-4f0d-9113-c14b45289955','Logged-Out','2025-12-19 12:23:22','2025-12-19 12:23:50'),('1cc677b5-bb62-4f92-a1e3-6aff0d97d29a','c47ec327-d771-4f0d-9113-c14b45289955','Logged-In','2025-12-19 12:13:34','2025-12-19 12:13:34'),('2391e8c2-29c3-4709-b2c3-651bad027110','c47ec327-d771-4f0d-9113-c14b45289955','Logged-In','2025-12-19 12:09:16','2025-12-19 12:09:16'),('5a8a3d8d-966e-441d-a61b-a83c41acc4a5','c47ec327-d771-4f0d-9113-c14b45289955','Logged-In','2025-12-19 12:09:43','2025-12-19 12:09:43'),('6df09409-ea3d-48ac-845f-2d7695f57109','c117b17e-7fc6-4d28-b4a3-f2e2ec753a84','Logged-In','2025-12-20 07:55:35','2025-12-20 07:55:35'),('731f441f-bfde-4001-bb60-907dab121011','c47ec327-d771-4f0d-9113-c14b45289955','Logged-In','2025-12-19 12:18:58','2025-12-19 12:18:58'),('74104924-141f-47e8-9e89-b09b332363f5','c47ec327-d771-4f0d-9113-c14b45289955','Logged-In','2025-12-19 12:19:34','2025-12-19 12:19:34'),('819926ac-03eb-49ff-9bd7-acc2fbac4d7d','c117b17e-7fc6-4d28-b4a3-f2e2ec753a84','Logged-Out','2025-12-22 10:33:39','2025-12-22 10:33:53'),('855c4199-4983-4e5c-90e6-5026b5e01508','c117b17e-7fc6-4d28-b4a3-f2e2ec753a84','Logged-Out','2025-12-19 12:22:02','2025-12-19 12:22:53'),('9e886c38-8b4f-46d6-9562-4517943e3139','c47ec327-d771-4f0d-9113-c14b45289955','Logged-Out','2025-12-22 10:34:43','2025-12-22 10:35:02'),('ab0c6aba-4719-4e65-bcd1-58ddb3f75283','c117b17e-7fc6-4d28-b4a3-f2e2ec753a84','Logged-Out','2025-12-22 04:44:18','2025-12-22 10:20:15'),('e0192991-4abb-484d-b651-c357f584b311','c117b17e-7fc6-4d28-b4a3-f2e2ec753a84','Logged-In','2025-12-23 06:41:32','2025-12-23 06:41:32'),('e5eafd2d-b312-4f78-aabc-f1b0162dd58c','c117b17e-7fc6-4d28-b4a3-f2e2ec753a84','Logged-Out','2025-12-22 10:35:12','2025-12-23 06:41:22'),('e75cdb94-356c-4006-8272-126e1c47e751','c117b17e-7fc6-4d28-b4a3-f2e2ec753a84','Logged-In','2025-12-19 12:24:02','2025-12-19 12:24:02'),('ef37d6ec-c1eb-4a02-a994-f506f1d5a326','c117b17e-7fc6-4d28-b4a3-f2e2ec753a84','Logged-In','2025-12-20 05:04:57','2025-12-20 05:04:57');
/*!40000 ALTER TABLE `login_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_items`
--

DROP TABLE IF EXISTS `news_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `published_date` datetime DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_items`
--

LOCK TABLES `news_items` WRITE;
/*!40000 ALTER TABLE `news_items` DISABLE KEYS */;
INSERT INTO `news_items` VALUES (1,'Dinesh Agarwal, CEO of Refex Group, on ET Now','http://localhost:8080/uploads/images/image-1765794424975-112004123.jpg','https://www.youtube.com/watch?v=vyiEp-hzhqU','Press Release',NULL,6,1,'2025-11-27 06:08:23','2025-12-15 10:27:07'),(2,'Refex Mobility expands operations to Delhi NCR','http://localhost:8080/uploads/images/image-1765794337995-261593789.jpg','https://auto.economictimes.indiatimes.com/news/aftermarket/refex-mobility-expands-operations-to-delhi-ncr/124252061','Press Release',NULL,1,1,'2025-11-27 06:08:23','2025-12-15 10:25:40'),(4,'Refex eVeelz rebrands as Refex Mobility; to consolidate focus on existing Tier-1 market','http://localhost:8080/uploads/images/image-1765794350101-199968110.jpg','https://auto.economictimes.indiatimes.com/news/aftermarket/refex-eveelz-rebrands-as-refex-mobility-to-consolidate-focus-on-existing-tier-1-market/123237339','News',NULL,2,1,'2025-11-27 06:08:23','2025-12-15 10:25:53'),(5,'Refex Group is the Official Sponsor of Chennai Super Kings','http://localhost:8080/uploads/images/image-1765794363212-462896112.jpg','https://www.aninews.in/news/business/refex-group-is-the-official-sponsor-of-chennai-super-kings20250327190124/','News',NULL,3,1,'2025-11-27 06:08:23','2025-12-15 10:26:05'),(6,'Refex Group Strengthens Leadership in Sustainability at UNGCNI Annual Convention 2025','http://localhost:8080/uploads/images/image-1765794404697-462696048.jpg','https://www.aninews.in/news/business/refex-group-strengthens-leadership-in-sustainability-at-ungcni-annual-convention-202520250215101613/','Press Release',NULL,5,1,'2025-11-27 06:08:23','2025-12-15 10:26:47'),(7,'Uber partners with Chennai-based Refex Green Mobility to deploy 1,000 EVs across cities','http://localhost:8080/uploads/images/image-1765794382047-767424644.jpg','https://www.thehindu.com/sci-tech/technology/uber-partners-with-chennai-based-refex-green-mobility-to-deploy-1000-evs-across-cities/article69316319.ece','News',NULL,4,1,'2025-11-27 06:33:27','2025-12-15 10:26:25');
/*!40000 ALTER TABLE `news_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsroom_event`
--

DROP TABLE IF EXISTS `newsroom_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsroom_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `link` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsroom_event`
--

LOCK TABLES `newsroom_event` WRITE;
/*!40000 ALTER TABLE `newsroom_event` DISABLE KEYS */;
INSERT INTO `newsroom_event` VALUES (1,'Refex Gheun Tak – A Women\'s Ultimate Frisbee Tournament','January 25, 2023','Times of India','http://localhost:8080/uploads/images/image-1765906161513-674040343.jpg','https://businessnewsthisweek.com/business/team-meraki-wins-refex-gheun-tak-a-womens-ultimate-frisbee-tournament/','Frisbee Tournament',1,1,'2025-11-27 21:45:15','2025-12-16 17:29:24'),(2,'Refex Group Road Safety Awareness event','January 11, 2023','Events','http://localhost:8080/uploads/images/image-1765906177121-131623668.jpg','https://navjeevanexpress.com/csr-initiative-refex-group-kick-starts-road-safety-campaign-on-anna-salai-in-chennai/','Awareness event',2,1,'2025-11-27 21:45:15','2025-12-16 17:29:44');
/*!40000 ALTER TABLE `newsroom_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsroom_hero`
--

DROP TABLE IF EXISTS `newsroom_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsroom_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `background_image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsroom_hero`
--

LOCK TABLES `newsroom_hero` WRITE;
/*!40000 ALTER TABLE `newsroom_hero` DISABLE KEYS */;
INSERT INTO `newsroom_hero` VALUES (1,'NEWSROOM','Get hyped for the latest buzz on our businesses and community initiatives, as well as inspiring stories about the amazing people behind them!','http://localhost:8080/uploads/images/image-1765904548827-252571329.jpg',1,'2025-11-27 21:19:58','2025-12-16 17:02:31');
/*!40000 ALTER TABLE `newsroom_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsroom_tab`
--

DROP TABLE IF EXISTS `newsroom_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsroom_tab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `key_2` (`key`),
  UNIQUE KEY `key_3` (`key`),
  UNIQUE KEY `key_4` (`key`),
  UNIQUE KEY `key_5` (`key`),
  UNIQUE KEY `key_6` (`key`),
  UNIQUE KEY `key_7` (`key`),
  UNIQUE KEY `key_8` (`key`),
  UNIQUE KEY `key_9` (`key`),
  UNIQUE KEY `key_10` (`key`),
  UNIQUE KEY `key_11` (`key`),
  UNIQUE KEY `key_12` (`key`),
  UNIQUE KEY `key_13` (`key`),
  UNIQUE KEY `key_14` (`key`),
  UNIQUE KEY `key_15` (`key`),
  UNIQUE KEY `key_16` (`key`),
  UNIQUE KEY `key_17` (`key`),
  UNIQUE KEY `key_18` (`key`),
  UNIQUE KEY `key_19` (`key`),
  UNIQUE KEY `key_20` (`key`),
  UNIQUE KEY `key_21` (`key`),
  UNIQUE KEY `key_22` (`key`),
  UNIQUE KEY `key_23` (`key`),
  UNIQUE KEY `key_24` (`key`),
  UNIQUE KEY `key_25` (`key`),
  UNIQUE KEY `key_26` (`key`),
  UNIQUE KEY `key_27` (`key`),
  UNIQUE KEY `key_28` (`key`),
  UNIQUE KEY `key_29` (`key`),
  UNIQUE KEY `key_30` (`key`),
  UNIQUE KEY `key_31` (`key`),
  UNIQUE KEY `key_32` (`key`),
  UNIQUE KEY `key_33` (`key`),
  UNIQUE KEY `key_34` (`key`),
  UNIQUE KEY `key_35` (`key`),
  UNIQUE KEY `key_36` (`key`),
  UNIQUE KEY `key_37` (`key`),
  UNIQUE KEY `key_38` (`key`),
  UNIQUE KEY `key_39` (`key`),
  UNIQUE KEY `key_40` (`key`),
  UNIQUE KEY `key_41` (`key`),
  UNIQUE KEY `key_42` (`key`),
  UNIQUE KEY `key_43` (`key`),
  UNIQUE KEY `key_44` (`key`),
  UNIQUE KEY `key_45` (`key`),
  UNIQUE KEY `key_46` (`key`),
  UNIQUE KEY `key_47` (`key`),
  UNIQUE KEY `key_48` (`key`),
  UNIQUE KEY `key_49` (`key`),
  UNIQUE KEY `key_50` (`key`),
  UNIQUE KEY `key_51` (`key`),
  UNIQUE KEY `key_52` (`key`),
  UNIQUE KEY `key_53` (`key`),
  UNIQUE KEY `key_54` (`key`),
  UNIQUE KEY `key_55` (`key`),
  UNIQUE KEY `key_56` (`key`),
  UNIQUE KEY `key_57` (`key`),
  UNIQUE KEY `key_58` (`key`),
  UNIQUE KEY `key_59` (`key`),
  UNIQUE KEY `key_60` (`key`),
  UNIQUE KEY `key_61` (`key`),
  UNIQUE KEY `key_62` (`key`),
  UNIQUE KEY `key_63` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsroom_tab`
--

LOCK TABLES `newsroom_tab` WRITE;
/*!40000 ALTER TABLE `newsroom_tab` DISABLE KEYS */;
INSERT INTO `newsroom_tab` VALUES (1,'press','Press Releases',1,1,1,'2025-11-27 21:54:38','2025-11-27 21:54:38'),(2,'events','Events',2,1,0,'2025-11-27 21:54:38','2025-11-27 21:54:38');
/*!40000 ALTER TABLE `newsroom_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offerings`
--

DROP TABLE IF EXISTS `offerings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offerings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text,
  `link` varchar(255) DEFAULT NULL,
  `metric` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `gradient` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offerings`
--

LOCK TABLES `offerings` WRITE;
/*!40000 ALTER TABLE `offerings` DISABLE KEYS */;
INSERT INTO `offerings` VALUES (1,'Ash Utilization and Coal Handling','Providing end-to-end ash handling/disposal, coal yard management, and coal trading solutions for thermal power plants','http://localhost:8080/uploads/images/image-1765792912552-76106071.webp','/ash-utilization',NULL,NULL,NULL,NULL,NULL,1,1,'2025-12-06 07:44:33','2025-12-15 10:01:56'),(2,'Green Mobility','Offering tailored mobility services for corporate commuting and daily rides, with a focus on sustainability through electric four-wheeler fleets.','http://localhost:8080/uploads/images/image-1765793262489-602378423.jpg','/green-mobility',NULL,NULL,NULL,NULL,NULL,2,1,'2025-12-06 07:44:33','2025-12-15 10:07:48'),(3,'Venwind Refex','Aiming to drive sustainable wind energy adoption nationwide with advanced 5.3 MW wind turbine manufacturing in India','http://localhost:8080/uploads/images/image-1765793200200-726200018.jpg','/venwind-refex',NULL,NULL,NULL,NULL,NULL,3,1,'2025-12-06 07:44:33','2025-12-15 10:06:43'),(4,'Refrigerant Gas','A leading global supplier specializing in eco-friendly refrigerant gases, equipped with automated filling, rigorous quality control, and certified storage facilities','http://localhost:8080/uploads/images/image-1765793218853-343313934.jpg','/refrigerant-gas',NULL,NULL,NULL,NULL,NULL,4,1,'2025-12-06 07:44:33','2025-12-15 10:07:01');
/*!40000 ALTER TABLE `offerings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_address`
--

DROP TABLE IF EXISTS `office_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `details` json NOT NULL,
  `image` text,
  `is_top_office` tinyint(1) NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_address`
--

LOCK TABLES `office_address` WRITE;
/*!40000 ALTER TABLE `office_address` DISABLE KEYS */;
INSERT INTO `office_address` VALUES (1,'Registered Office','[\"2nd Floor, No.313, Refex Towers,\", \"Sterling Road, Valluvar Kottam High Road,\", \"Nungambakkam, Chennai,\", \"Tamil Nadu, India – 600034\", \"Phone: +91-44 – 3504 0050\", \"Email: info@refex.co.in\"]','http://localhost:8080/uploads/images/image-1765903446312-608079235.jpg',1,1,1,'2025-11-27 22:12:33','2025-12-16 16:44:10'),(2,'Corporate Office','[\"Refex, 67, Bazullah Road,\", \"Next to Sri Ramakrishna Mission\", \"Matriculation Higher Secondary School\", \"T Nagar, Chennai, Tamil Nadu, India – 600017\"]','http://localhost:8080/uploads/images/image-1765903464262-22156968.jpg',1,2,1,'2025-11-27 22:12:33','2025-12-16 16:44:26'),(3,'Factory','[\"No: 1/171, Old Mahabalipuram Road,\", \"Thiruporur, Kanchipuram Dist – 603 110.\", \"Tamil Nadu, India – 600034\", \"Phone: +91-44 – 2744 5295\", \"Email: factory@refex.co.in\"]',NULL,0,1,1,'2025-11-27 22:12:33','2025-11-27 22:12:33'),(4,'Investors Grievances','[\"Mr. Ankit Poddar\", \"Company Secretary / Compliance Officer\", \"2nd Floor, No.313, Refex Towers,\", \"Sterling Road, Valluvar Kottam High Road,\", \"Nungambakkam, Chennai,\", \"Tamil Nadu, India – 600034\", \"Phone: +91-44 – 3504 0050\", \"Email: investor.relations@refex.co.in\"]',NULL,0,2,1,'2025-11-27 22:12:33','2025-11-27 22:12:33'),(5,'For Determining Materiality of Events','[\"Mr. Ankit Poddar – CS / Compliance Officer\", \"2nd Floor, No.313, Refex Towers,\", \"Sterling Road, Valluvar Kottam High Road,\", \"Nungambakkam, Chennai,\", \"Tamil Nadu, India – 600034\", \"Phone: +91-44 – 3504 0050\", \"Email: investor.relations@refex.co.in\"]',NULL,0,3,1,'2025-11-27 22:12:33','2025-11-27 22:15:02');
/*!40000 ALTER TABLE `office_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press_release`
--

DROP TABLE IF EXISTS `press_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `press_release` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `link` text NOT NULL,
  `is_video` tinyint(1) NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_release`
--

LOCK TABLES `press_release` WRITE;
/*!40000 ALTER TABLE `press_release` DISABLE KEYS */;
INSERT INTO `press_release` VALUES (1,'Dinesh Agarwal, CEO of Refex Group, on ET Now','November 11, 2025','ET NOW','http://localhost:8080/uploads/images/image-1765904600582-700604792.jpg','https://www.youtube.com/watch?v=vyiEp-hzhqU',1,1,1,'2025-11-27 21:35:27','2025-12-16 17:03:26'),(2,'Refex reports PBT at 30 crore in Q1 FY24','August 4, 2023','The Times of India','https://static.readdy.ai/image/d0ead66ce635a168f1e83b108be94826/f083fd9c51a4b154ca0967ca2ad3b996.jpeg','https://timesofindia.indiatimes.com/city/chennai/refex-reports-pbt-at-30-crore-in-q1-fy24/articleshow/102408182.cms?from=mdr',0,7,1,'2025-11-27 21:35:27','2025-12-16 17:15:39'),(3,'Refex Mobility expands operations to Delhi NCR','November 11, 2025','ET AUTO','http://localhost:8080/uploads/images/image-1765904644340-512897067.jpg','https://auto.economictimes.indiatimes.com/news/aftermarket/refex-eveelz-rebrands-as-refex-mobility-to-consolidate-focus-on-existing-tier-1-market/123237339',0,2,1,'2025-11-27 21:35:27','2025-12-16 17:04:17'),(4,'Refex eVeelz rebrands as Refex Mobility; to consolidate focus on existing Tier-1 market','November 11, 2025','ET AUTO','http://localhost:8080/uploads/images/image-1765904685851-240446812.jpg','https://www.aninews.in/news/business/refex-group-is-the-official-sponsor-of-chennai-super-kings20250327190124/',0,3,1,'2025-11-27 21:35:27','2025-12-16 17:05:45'),(5,'Refex Group is the Official Sponsor of Chennai Super Kings','March 27, 2025','ANI','http://localhost:8080/uploads/images/image-1765904798607-203393762.jpg','https://www.thehindu.com/sci-tech/technology/uber-partners-with-chennai-based-refex-green-mobility-to-deploy-1000-evs-across-cities/article69316319.ece',0,4,1,'2025-11-27 21:35:27','2025-12-16 17:07:37'),(6,'Refex Group Strengthens Leadership in Sustainability at UNGCNI Annual Convention 2025','February 15, 2025','ANI','http://localhost:8080/uploads/images/image-1765905175872-120181381.jpg','https://www.aninews.in/news/business/refex-group-strengthens-leadership-in-sustainability-at-ungcni-annual-convention-202520250215101613/',0,6,1,'2025-11-27 21:35:27','2025-12-16 17:13:00'),(7,'Refex Industries Q4 standalone net more than doubles to ₹51 cr.','May 19, 2023','THE HINDU','http://localhost:8080/uploads/images/image-1765905478290-493484045.jpg','https://www.businessworld.in/article/refex-industries-revenue-rises-from-rs-443-cr-to-rs-1629-cr-477197',0,8,1,'2025-11-27 21:35:27','2025-12-16 17:18:31'),(8,'Refex Industries Revenue Rises From Rs 443 Cr To Rs 1629 Cr','May 19, 2023','BW BUSINESSWORD','http://localhost:8080/uploads/images/image-1765905621828-491700997.jpg','https://www.businessworld.in/article/refex-industries-revenue-rises-from-rs-443-cr-to-rs-1629-cr-477197',0,9,1,'2025-11-27 21:35:27','2025-12-16 17:20:39'),(9,'Refex Industries’ share price hits upper circuit on good FY23 results','May 19, 2023','THE HINDU','http://localhost:8080/uploads/images/image-1765905729555-884752329.jpg','https://www.thehindubusinessline.com/markets/refex-industries-share-price-hits-upper-circuit-on-good-fy23-results/article66870987.ece',0,10,1,'2025-11-27 21:35:27','2025-12-16 17:22:37'),(10,'Refex Industries revenue grows over 4X in Dec quarter','February 9, 2024','THE TIMES OF INDIA','http://localhost:8080/uploads/images/image-1765905844499-646709231.jpg','https://timesofindia.indiatimes.com/city/chennai/refex-industries-revenue-grows-over-4x-in-dec-quarter/articleshow/97752411.cms?from=mdr',0,11,1,'2025-11-27 21:35:27','2025-12-16 17:24:22'),(11,'Women’s Ulitmate Frisbee Tournament To Be Sponsored By Refex Group','January 25, 2023','APN NEWS','http://localhost:8080/uploads/images/image-1765905963054-310419087.jpg','https://www.apnnews.com/womens-ulitmate-frisbee-tournament-to-be-sponsored-by-refex-group/',0,12,1,'2025-11-27 21:35:27','2025-12-16 17:26:05'),(12,'Refex Industries Limited grants ESOPs','September 19, 2022','THEPRINT','http://localhost:8080/uploads/images/image-1765906050299-836277871.jpg','https://theprint.in/ani-press-releases/refex-industries-limited-grants-esops/1148336/',0,13,1,'2025-11-27 21:35:27','2025-12-16 17:27:51'),(13,'Uber partners with Chennai-based Refex Green Mobility to deploy 1,000 EVs across cities','March 11, 2025','THE HINDU','http://localhost:8080/uploads/images/image-1765905003057-334125204.jpg','https://www.thehindu.com/sci-tech/technology/uber-partners-with-chennai-based-refex-green-mobility-to-deploy-1000-evs-across-cities/article69316319.ece',0,5,1,'2025-12-16 17:10:23','2025-12-16 17:10:23');
/*!40000 ALTER TABLE `press_release` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_hero`
--

DROP TABLE IF EXISTS `product_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `background_image` text,
  `overlay_from` varchar(255) DEFAULT 'rgba(0,0,0,0.5)',
  `overlay_to` varchar(255) DEFAULT 'rgba(0,0,0,0.3)',
  `title_line1` varchar(255) DEFAULT NULL,
  `title_line2` varchar(255) DEFAULT NULL,
  `subtitle` text,
  `highlight_text` varchar(255) DEFAULT NULL,
  `description` text,
  `title_color` varchar(255) DEFAULT '#ffffff',
  `subtitle_color` varchar(255) DEFAULT 'rgba(255,255,255,0.9)',
  `description_color` varchar(255) DEFAULT 'rgba(255,255,255,0.8)',
  `aos_type` varchar(255) DEFAULT NULL,
  `aos_duration` int DEFAULT NULL,
  `aos_delay` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_hero`
--

LOCK TABLES `product_hero` WRITE;
/*!40000 ALTER TABLE `product_hero` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refrigerant_gas_client`
--

DROP TABLE IF EXISTS `refrigerant_gas_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refrigerant_gas_client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerant_gas_client`
--

LOCK TABLES `refrigerant_gas_client` WRITE;
/*!40000 ALTER TABLE `refrigerant_gas_client` DISABLE KEYS */;
INSERT INTO `refrigerant_gas_client` VALUES (1,'/uploads/images/image-1765804840014-859011299.jpg',1,1,'2025-11-27 18:16:06','2025-12-15 13:20:42'),(2,'/uploads/images/image-1765804851925-518923920.jpg',2,1,'2025-11-27 18:16:06','2025-12-15 13:20:53'),(3,'/uploads/images/image-1765804862101-807315179.jpg',3,1,'2025-11-27 18:16:06','2025-12-15 13:21:03'),(4,'/uploads/images/image-1765804938277-906208358.jpg',4,1,'2025-11-27 18:16:06','2025-12-15 13:22:21'),(5,'/uploads/images/image-1765804954451-873502012.jpg',5,1,'2025-11-27 18:16:06','2025-12-15 13:22:35'),(6,'/uploads/images/image-1765804971156-100235716.jpg',6,1,'2025-11-27 18:16:06','2025-12-15 13:22:53'),(7,'/uploads/images/image-1765804990261-906242386.jpg',7,1,'2025-11-27 18:16:06','2025-12-15 13:23:12'),(8,'/uploads/images/image-1765805006114-135818346.jpg',8,1,'2025-11-27 18:16:06','2025-12-15 13:23:28'),(9,'/uploads/images/image-1765805017712-460772120.jpg',9,1,'2025-11-27 18:16:06','2025-12-15 13:23:39');
/*!40000 ALTER TABLE `refrigerant_gas_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refrigerant_gas_hero`
--

DROP TABLE IF EXISTS `refrigerant_gas_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refrigerant_gas_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `slides` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerant_gas_hero`
--

LOCK TABLES `refrigerant_gas_hero` WRITE;
/*!40000 ALTER TABLE `refrigerant_gas_hero` DISABLE KEYS */;
INSERT INTO `refrigerant_gas_hero` VALUES (1,'Refrigerant Gas','Pioneers and Conscious Innovators in the Refrigerant gas Industry','[{\"image\": \"/uploads/images/image-1765803985505-654206339.jpg\"}, {\"image\": \"/uploads/images/image-1765803993707-687345294.jpg\"}]',1,'2025-11-27 17:29:37','2025-12-15 13:06:36');
/*!40000 ALTER TABLE `refrigerant_gas_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refrigerant_gas_impact`
--

DROP TABLE IF EXISTS `refrigerant_gas_impact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refrigerant_gas_impact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `icon` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerant_gas_impact`
--

LOCK TABLES `refrigerant_gas_impact` WRITE;
/*!40000 ALTER TABLE `refrigerant_gas_impact` DISABLE KEYS */;
INSERT INTO `refrigerant_gas_impact` VALUES (1,'450 +','Dealers and Distributions','/uploads/images/image-1765804549910-997331759.svg',1,1,'2025-11-27 18:01:25','2025-12-15 13:15:52'),(2,'Delhi & Mumbai','Warehouses','/uploads/images/image-1765804573332-312086972.svg',2,1,'2025-11-27 18:01:25','2025-12-15 13:16:37'),(3,'Tamil Nadu','Refilling Facility','/uploads/images/image-1765804625292-238574213.svg',3,1,'2025-11-27 18:01:25','2025-12-15 13:17:07'),(4,'1st Company','To introduce disposable Cans\nProvide 450 ml Refilling Cans','/uploads/images/image-1765804643690-311320333.svg',4,1,'2025-11-27 18:01:25','2025-12-15 13:17:26'),(5,'Range of Products','R32, R134A, R404A, R407C, R410A, R22, R290, R600a, HC Blend and Butane','/uploads/images/image-1765804655307-695397824.svg',5,1,'2025-11-27 18:01:25','2025-12-15 13:17:37'),(6,'1st ISO Certified','Refrigerant Gas filling unit in India','/uploads/images/image-1765804668924-5829929.svg',6,1,'2025-11-27 18:01:25','2025-12-15 13:17:51');
/*!40000 ALTER TABLE `refrigerant_gas_impact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refrigerant_gas_product`
--

DROP TABLE IF EXISTS `refrigerant_gas_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refrigerant_gas_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerant_gas_product`
--

LOCK TABLES `refrigerant_gas_product` WRITE;
/*!40000 ALTER TABLE `refrigerant_gas_product` DISABLE KEYS */;
INSERT INTO `refrigerant_gas_product` VALUES (1,'/uploads/images/image-1765804687911-282772658.jpg','R22','/product/r22',1,1,'2025-11-27 18:09:09','2025-12-15 13:18:10'),(2,'/uploads/images/image-1765804699214-579341872.jpg','R404A','/product/r404a',2,1,'2025-11-27 18:09:09','2025-12-15 13:18:21'),(3,'/uploads/images/image-1765804711438-392359104.jpg','HFC-134A','/product/hfc-134a',3,1,'2025-11-27 18:09:09','2025-12-15 13:18:33'),(4,'/uploads/images/image-1765804727523-328530984.png','R32','/product/r32',4,1,'2025-11-27 18:09:09','2025-12-15 13:18:49'),(5,'/uploads/images/image-1765804743192-756316655.png','R407C','/product/r407c',5,1,'2025-11-27 18:09:09','2025-12-15 13:19:10'),(6,'/uploads/images/image-1765804763237-946916986.jpg','R410A','/product/r410a',6,1,'2025-11-27 18:09:09','2025-12-15 13:19:25'),(7,'/uploads/images/image-1765804782058-771946426.jpg','R600A','/product/r600a',7,1,'2025-11-27 18:09:09','2025-12-15 13:19:43'),(8,'https://refex.co.in/wp-content/uploads/2024/12/r-290a.jpg','R290','/product/r290',8,1,'2025-11-27 18:09:09','2025-11-27 18:09:09'),(9,'/uploads/images/image-1765804795678-810177323.jpg','Hydrocarbon','/product/hydrocarbon',9,1,'2025-11-27 18:09:09','2025-12-15 13:19:57'),(10,'/uploads/images/image-1765804811184-554925623.jpg','Butane','/product/butane',10,1,'2025-11-27 18:09:09','2025-12-15 13:20:13'),(11,'/uploads/images/image-1765804825173-28109731.jpg','Copper Tubes','/product/copper-tubes',11,1,'2025-11-27 18:09:09','2025-12-15 13:20:27');
/*!40000 ALTER TABLE `refrigerant_gas_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refrigerant_gas_product_tab`
--

DROP TABLE IF EXISTS `refrigerant_gas_product_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refrigerant_gas_product_tab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tab_id` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `image` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tab_id` (`tab_id`),
  UNIQUE KEY `tab_id_2` (`tab_id`),
  UNIQUE KEY `tab_id_3` (`tab_id`),
  UNIQUE KEY `tab_id_4` (`tab_id`),
  UNIQUE KEY `tab_id_5` (`tab_id`),
  UNIQUE KEY `tab_id_6` (`tab_id`),
  UNIQUE KEY `tab_id_7` (`tab_id`),
  UNIQUE KEY `tab_id_8` (`tab_id`),
  UNIQUE KEY `tab_id_9` (`tab_id`),
  UNIQUE KEY `tab_id_10` (`tab_id`),
  UNIQUE KEY `tab_id_11` (`tab_id`),
  UNIQUE KEY `tab_id_12` (`tab_id`),
  UNIQUE KEY `tab_id_13` (`tab_id`),
  UNIQUE KEY `tab_id_14` (`tab_id`),
  UNIQUE KEY `tab_id_15` (`tab_id`),
  UNIQUE KEY `tab_id_16` (`tab_id`),
  UNIQUE KEY `tab_id_17` (`tab_id`),
  UNIQUE KEY `tab_id_18` (`tab_id`),
  UNIQUE KEY `tab_id_19` (`tab_id`),
  UNIQUE KEY `tab_id_20` (`tab_id`),
  UNIQUE KEY `tab_id_21` (`tab_id`),
  UNIQUE KEY `tab_id_22` (`tab_id`),
  UNIQUE KEY `tab_id_23` (`tab_id`),
  UNIQUE KEY `tab_id_24` (`tab_id`),
  UNIQUE KEY `tab_id_25` (`tab_id`),
  UNIQUE KEY `tab_id_26` (`tab_id`),
  UNIQUE KEY `tab_id_27` (`tab_id`),
  UNIQUE KEY `tab_id_28` (`tab_id`),
  UNIQUE KEY `tab_id_29` (`tab_id`),
  UNIQUE KEY `tab_id_30` (`tab_id`),
  UNIQUE KEY `tab_id_31` (`tab_id`),
  UNIQUE KEY `tab_id_32` (`tab_id`),
  UNIQUE KEY `tab_id_33` (`tab_id`),
  UNIQUE KEY `tab_id_34` (`tab_id`),
  UNIQUE KEY `tab_id_35` (`tab_id`),
  UNIQUE KEY `tab_id_36` (`tab_id`),
  UNIQUE KEY `tab_id_37` (`tab_id`),
  UNIQUE KEY `tab_id_38` (`tab_id`),
  UNIQUE KEY `tab_id_39` (`tab_id`),
  UNIQUE KEY `tab_id_40` (`tab_id`),
  UNIQUE KEY `tab_id_41` (`tab_id`),
  UNIQUE KEY `tab_id_42` (`tab_id`),
  UNIQUE KEY `tab_id_43` (`tab_id`),
  UNIQUE KEY `tab_id_44` (`tab_id`),
  UNIQUE KEY `tab_id_45` (`tab_id`),
  UNIQUE KEY `tab_id_46` (`tab_id`),
  UNIQUE KEY `tab_id_47` (`tab_id`),
  UNIQUE KEY `tab_id_48` (`tab_id`),
  UNIQUE KEY `tab_id_49` (`tab_id`),
  UNIQUE KEY `tab_id_50` (`tab_id`),
  UNIQUE KEY `tab_id_51` (`tab_id`),
  UNIQUE KEY `tab_id_52` (`tab_id`),
  UNIQUE KEY `tab_id_53` (`tab_id`),
  UNIQUE KEY `tab_id_54` (`tab_id`),
  UNIQUE KEY `tab_id_55` (`tab_id`),
  UNIQUE KEY `tab_id_56` (`tab_id`),
  UNIQUE KEY `tab_id_57` (`tab_id`),
  UNIQUE KEY `tab_id_58` (`tab_id`),
  UNIQUE KEY `tab_id_59` (`tab_id`),
  UNIQUE KEY `tab_id_60` (`tab_id`),
  UNIQUE KEY `tab_id_61` (`tab_id`),
  UNIQUE KEY `tab_id_62` (`tab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerant_gas_product_tab`
--

LOCK TABLES `refrigerant_gas_product_tab` WRITE;
/*!40000 ALTER TABLE `refrigerant_gas_product_tab` DISABLE KEYS */;
INSERT INTO `refrigerant_gas_product_tab` VALUES (1,'quality','Product Qualityy','/uploads/images/image-1765804277427-108781443.jpg',1,1,'2025-11-27 17:51:32','2025-12-15 13:11:19'),(2,'safety','Product Safety','/uploads/images/image-1765804293206-128663943.jpg',2,1,'2025-11-27 17:51:32','2025-12-15 13:11:36'),(3,'applications','Product Applications','/uploads/images/image-1765804309256-955477096.jpg',3,1,'2025-11-27 17:51:32','2025-12-15 13:11:53');
/*!40000 ALTER TABLE `refrigerant_gas_product_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refrigerant_gas_product_tab_point`
--

DROP TABLE IF EXISTS `refrigerant_gas_product_tab_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refrigerant_gas_product_tab_point` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tab_id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerant_gas_product_tab_point`
--

LOCK TABLES `refrigerant_gas_product_tab_point` WRITE;
/*!40000 ALTER TABLE `refrigerant_gas_product_tab_point` DISABLE KEYS */;
INSERT INTO `refrigerant_gas_product_tab_point` VALUES (1,'quality','Purity and Commitment','Our refrigerants are >99.9% pure. Refex is fundamentally committed to ensuring the quality of our materials from filling to customer service, meeting safety, quality, and performance expectations.',1,1,'2025-11-27 17:51:32','2025-11-27 17:55:36'),(2,'quality','Continuous Improvement','We are dedicated to continuous improvement, innovation, and implementation, staying in pace with market revolutions.',2,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(3,'quality','Customer Satisfaction','Our success stands on the pillars of Quality, Delivery, and Customer Satisfaction.',3,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(4,'quality','Quality Assurance','Each customer receives a Certificate of Analysis conforming to the highest quality standards for all our processes. Products are tested and analyzed before and after refilling in our state-of-the-art laboratory.',4,0,'2025-11-27 17:51:32','2025-11-27 17:53:52'),(5,'safety','Dedicated Storage Facilities','Each product has a dedicated, secure storage facility approved by Facilities that maintains 100% compliance with required regulations and is equipped with the best safety devices.',1,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(6,'safety','ISO Certification','Certified with ISO 14001:2015. Products are tested and analyzed for gas purity and moisture content before and after filling, ensuring the quality of both our cylinders and customers\' cylinders before filling.',2,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(7,'safety','Quality Refilling','At Refex, quality and safety are paramount. Every gas cylinder is stored in PESO and PCB-approved facilities and undergoes rigorous testing in our ISO 14001:2015 certified in-house lab. We ensure each product meets strict purity and moisture standards before and after refilling, using top-grade fabricators and adhering to full regulatory compliance for safe, reliable refilling.',3,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(8,'safety','Cylinder Refurbishment','Takes special precautions for cylinders. Our refurbishment system is a benchmark in the industry, including internal cleaning, internal drying, removal of old paint and repainting on every rotation, and valve replacement.',4,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(9,'applications',NULL,'Commercial & Domestic Refrigeration',1,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(10,'applications',NULL,'Commercial & Domestic Air Conditioning',2,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(11,'applications',NULL,'Chillers for Buildings & Large Systems',3,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(12,'applications',NULL,'Automotive Air Conditioning',4,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(13,'applications',NULL,'Industrial Refrigeration',5,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(14,'applications',NULL,'Cold Storage Refrigeration',6,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(15,'applications',NULL,'Food Processing',7,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(16,'applications',NULL,'Aerosol Propellants',8,1,'2025-11-27 17:51:32','2025-11-27 17:51:32'),(17,'quality','Quality Assurance','Each customer receives a Certificate of Analysis conforming to the highest quality standards for all our processes. Products are tested and analyzed before and after refilling in our state-of-the-art laboratory.',4,1,'2025-11-27 17:56:30','2025-11-27 17:56:30');
/*!40000 ALTER TABLE `refrigerant_gas_product_tab_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refrigerant_gas_who_we_are`
--

DROP TABLE IF EXISTS `refrigerant_gas_who_we_are`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refrigerant_gas_who_we_are` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `main_image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerant_gas_who_we_are`
--

LOCK TABLES `refrigerant_gas_who_we_are` WRITE;
/*!40000 ALTER TABLE `refrigerant_gas_who_we_are` DISABLE KEYS */;
INSERT INTO `refrigerant_gas_who_we_are` VALUES (1,'Who we are','Refex Industries Limited, established in 2002, is a pioneer in eco-friendly refrigerant gases across India. We specialize in replacing harmful CFCs and HCFCs with environmentally friendly alternatives. Our product range includes refrigerants, foam-blowing agents, and aerosol propellants, backed by advanced technology that sets industry standards.\n\nWith over 22 years of experience, Refex has built a sterling reputation for delivering eco-friendly refrigerant solutions that exceed industry standards. Their emphasis on innovation and sustainability has positioned them as a premier supplier in the HVAC and refrigeration sectors.\n\nRefex is known for superior quality, reliability, and commitment to sustainability. Our innovative approach and reliable logistics network ensure rapid delivery and customer satisfaction. We continue to set industry benchmarks, driven by sustainability and technological advancement.','/uploads/images/image-1765804006910-687035639.jpg',1,'2025-11-27 17:35:42','2025-12-15 13:06:48');
/*!40000 ALTER TABLE `refrigerant_gas_who_we_are` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refrigerant_gas_why_choose_us`
--

DROP TABLE IF EXISTS `refrigerant_gas_why_choose_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refrigerant_gas_why_choose_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `icon` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerant_gas_why_choose_us`
--

LOCK TABLES `refrigerant_gas_why_choose_us` WRITE;
/*!40000 ALTER TABLE `refrigerant_gas_why_choose_us` DISABLE KEYS */;
INSERT INTO `refrigerant_gas_why_choose_us` VALUES (1,'Superior Quality','Adherence to the highest standards, surpassing industry expectations.','/uploads/images/image-1765804129525-589564337.png',1,1,'2025-11-27 17:42:06','2025-12-15 13:08:53'),(2,'Eco-Friendly Solutions','Environmentally friendly products aligning with global sustainability goals.','/uploads/images/image-1765804142749-568604365.png',2,1,'2025-11-27 17:42:06','2025-12-15 13:09:05'),(3,'Cutting-Edge Technology','Advanced technology ensures the finest quality products.','/uploads/images/image-1765804155725-36682493.png',3,1,'2025-11-27 17:42:06','2025-12-15 13:09:22'),(4,'Competitive Pricing','Market-leading prices without compromising on quality.','/uploads/images/image-1765804208279-941108991.png',4,1,'2025-11-27 17:42:06','2025-12-15 13:10:09'),(5,'Reliable Delivery','Well-connected logistics ensure timely and reliable delivery.','/uploads/images/image-1765804218475-629396003.png',5,1,'2025-11-27 17:42:06','2025-12-15 13:10:21'),(6,'Extensive Experience','With two decades of experience, we have the expertise to meet your needs effectively.','/uploads/images/image-1765804235493-358596449.png',6,1,'2025-11-27 17:42:06','2025-12-15 13:10:42');
/*!40000 ALTER TABLE `refrigerant_gas_why_choose_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regulatory_approvals`
--

DROP TABLE IF EXISTS `regulatory_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regulatory_approvals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text,
  `link` text,
  `color` varchar(255) DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regulatory_approvals`
--

LOCK TABLES `regulatory_approvals` WRITE;
/*!40000 ALTER TABLE `regulatory_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `regulatory_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_innovations`
--

DROP TABLE IF EXISTS `research_innovations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_innovations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_title` varchar(255) NOT NULL,
  `card_subtitle` varchar(255) DEFAULT NULL,
  `card_description` text,
  `order` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_innovations`
--

LOCK TABLES `research_innovations` WRITE;
/*!40000 ALTER TABLE `research_innovations` DISABLE KEYS */;
/*!40000 ALTER TABLE `research_innovations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (1,'Years of Legacy','23+','Years of Legacy of People','http://localhost:8080/uploads/images/image-1765794796563-281539633.svg','#4ade80',1,1,'2025-11-27 05:32:24','2025-12-15 10:33:20'),(2,'People','500+','people','http://localhost:8080/uploads/images/image-1765794812941-763041020.svg','#4ade80',2,1,'2025-11-27 05:33:55','2025-12-15 10:33:36'),(3,'Presence','Pan India','Pan India','http://localhost:8080/uploads/images/image-1765794835116-233173334.svg','#4ade80',3,1,'2025-11-27 05:37:00','2025-12-15 10:33:57');
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sticky_nav_items`
--

DROP TABLE IF EXISTS `sticky_nav_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sticky_nav_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `href` varchar(255) NOT NULL,
  `section_id` varchar(255) NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sticky_nav_items`
--

LOCK TABLES `sticky_nav_items` WRITE;
/*!40000 ALTER TABLE `sticky_nav_items` DISABLE KEYS */;
INSERT INTO `sticky_nav_items` VALUES (1,'Mission & Vision','#mission-vision','mission-vision',1,1,'2025-11-27 07:16:53','2025-11-27 07:18:12'),(2,'Core Values','#core-values','core-values',2,1,'2025-11-27 07:16:53','2025-11-27 07:16:53'),(3,'Board Members','#board-members','board-members',3,1,'2025-11-27 07:16:53','2025-11-27 07:16:53'),(4,'Our Presence','#our-presence','our-presence',4,1,'2025-11-27 07:16:53','2025-11-27 07:16:53');
/*!40000 ALTER TABLE `sticky_nav_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sustainability_footer_section`
--

DROP TABLE IF EXISTS `sustainability_footer_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sustainability_footer_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` text,
  `cta_text` varchar(255) DEFAULT NULL,
  `cta_icon` varchar(255) DEFAULT NULL,
  `background_image_url` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sustainability_footer_section`
--

LOCK TABLES `sustainability_footer_section` WRITE;
/*!40000 ALTER TABLE `sustainability_footer_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `sustainability_footer_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sustainability_heart`
--

DROP TABLE IF EXISTS `sustainability_heart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sustainability_heart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_title` varchar(255) DEFAULT NULL,
  `main_subtitle` text,
  `sections` json DEFAULT NULL,
  `commitments` json DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sustainability_heart`
--

LOCK TABLES `sustainability_heart` WRITE;
/*!40000 ALTER TABLE `sustainability_heart` DISABLE KEYS */;
/*!40000 ALTER TABLE `sustainability_heart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sustainability_hero`
--

DROP TABLE IF EXISTS `sustainability_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sustainability_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `background_image` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sustainability_hero`
--

LOCK TABLES `sustainability_hero` WRITE;
/*!40000 ALTER TABLE `sustainability_hero` DISABLE KEYS */;
/*!40000 ALTER TABLE `sustainability_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sustainability_policy`
--

DROP TABLE IF EXISTS `sustainability_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sustainability_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `order` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sustainability_policy`
--

LOCK TABLES `sustainability_policy` WRITE;
/*!40000 ALTER TABLE `sustainability_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `sustainability_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sustainability_sdg_card`
--

DROP TABLE IF EXISTS `sustainability_sdg_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sustainability_sdg_card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `contribution` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `order` int DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sustainability_sdg_card`
--

LOCK TABLES `sustainability_sdg_card` WRITE;
/*!40000 ALTER TABLE `sustainability_sdg_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `sustainability_sdg_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sustainability_social_section`
--

DROP TABLE IF EXISTS `sustainability_social_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sustainability_social_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_title` varchar(255) DEFAULT NULL,
  `section_description` text,
  `is_active` tinyint(1) DEFAULT '1',
  `csr_cards` json DEFAULT NULL,
  `csr_impact_title` varchar(255) DEFAULT NULL,
  `csr_impact_description` text,
  `csr_impact_items` json DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sustainability_social_section`
--

LOCK TABLES `sustainability_social_section` WRITE;
/*!40000 ALTER TABLE `sustainability_social_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `sustainability_social_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sustainability_vision_mission`
--

DROP TABLE IF EXISTS `sustainability_vision_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sustainability_vision_mission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_title` varchar(255) DEFAULT NULL,
  `section_subtitle` varchar(255) DEFAULT NULL,
  `vision_title` varchar(255) DEFAULT NULL,
  `vision_subtitle` varchar(255) DEFAULT NULL,
  `vision_description` text,
  `vision_points` json DEFAULT NULL,
  `mission_title` varchar(255) DEFAULT NULL,
  `mission_subtitle` varchar(255) DEFAULT NULL,
  `mission_points` json DEFAULT NULL,
  `stats` json DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sustainability_vision_mission`
--

LOCK TABLES `sustainability_vision_mission` WRITE;
/*!40000 ALTER TABLE `sustainability_vision_mission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sustainability_vision_mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(85) DEFAULT NULL,
  `last_name` varchar(85) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `api_key` text,
  `user_type` enum('Admin','CHRO','HR','InvestorsCMS') DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `modified_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `deleted_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('c117b17e-7fc6-4d28-b4a3-f2e2ec753a84','Admin','User','9999999998','admin@refex.com','$2b$10$fzcN2uIkXJ0nWDeXYmYvy.5gdkal4zyKUoSUdpJyTxIQoXMJ6qNBa',NULL,'Admin',1,NULL,NULL,NULL,'2025-12-19 12:21:04','2025-12-19 12:21:04',NULL),('c47ec327-d771-4f0d-9113-c14b45289955','Investors','CMS User','9999999999','investors@refex.com','$2b$10$sLawJsLkWRWph1Q.mCeseuM6tC3pRqEQcghw0SgyjGzZK6UTHrfze',NULL,'InvestorsCMS',1,NULL,NULL,NULL,'2025-12-19 12:08:40','2025-12-19 12:08:40',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `value_items`
--

DROP TABLE IF EXISTS `value_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `value_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `letter` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `value_items`
--

LOCK TABLES `value_items` WRITE;
/*!40000 ALTER TABLE `value_items` DISABLE KEYS */;
INSERT INTO `value_items` VALUES (1,'P','Principled Excellence','Doing what\'s right, with integrity and intention','http://localhost:8080/uploads/images/image-1765796289740-897271326.jpg',NULL,NULL,1,1,'2025-12-06 07:38:59','2025-12-15 10:58:11'),(2,'A','Authenticity','Bringing your true self to work, and honouring that in others.','http://localhost:8080/uploads/images/image-1765796299555-272502147.jpg',NULL,NULL,2,1,'2025-12-06 07:38:59','2025-12-15 10:58:21'),(3,'C','Customer Value','Keeping our customers at the heart of everything we do.','http://localhost:8080/uploads/images/image-1765796311843-342614647.jpg',NULL,NULL,3,1,'2025-12-06 07:38:59','2025-12-15 10:58:33'),(4,'E','Esteem Culture','Fostering a workplace where respect, dignity, and belonging are everyday experiences.','http://localhost:8080/uploads/images/image-1765796323310-645293917.jpg',NULL,NULL,4,1,'2025-12-06 07:38:59','2025-12-15 10:58:45');
/*!40000 ALTER TABLE `value_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venwind_refex_hero`
--

DROP TABLE IF EXISTS `venwind_refex_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venwind_refex_hero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `background_image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venwind_refex_hero`
--

LOCK TABLES `venwind_refex_hero` WRITE;
/*!40000 ALTER TABLE `venwind_refex_hero` DISABLE KEYS */;
INSERT INTO `venwind_refex_hero` VALUES (1,'Venwind Refex','Explore the power of cutting-edge manufacturing technology in partnership with Vensys Energy AG, Germany','/uploads/images/image-1765803091154-437560944.jpg',1,'2025-11-27 12:57:42','2025-12-15 12:51:36');
/*!40000 ALTER TABLE `venwind_refex_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venwind_refex_technical_spec`
--

DROP TABLE IF EXISTS `venwind_refex_technical_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venwind_refex_technical_spec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `icon` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venwind_refex_technical_spec`
--

LOCK TABLES `venwind_refex_technical_spec` WRITE;
/*!40000 ALTER TABLE `venwind_refex_technical_spec` DISABLE KEYS */;
INSERT INTO `venwind_refex_technical_spec` VALUES (1,'26016 m2','Swept Area','/uploads/images/image-1765803403148-600673685.svg',1,1,'2025-11-27 17:17:26','2025-12-15 12:56:47'),(2,'130m','Hub Height','/uploads/images/image-1765803417978-470104617.svg',2,1,'2025-11-27 17:17:26','2025-12-15 12:57:00'),(3,'2.5 m/s','Cut-in Wind Speed','/uploads/images/image-1765803434911-31820525.svg',3,1,'2025-11-27 17:17:26','2025-12-15 12:57:17'),(4,'IEC S','Class','/uploads/images/image-1765803449159-110456517.svg',4,1,'2025-11-27 17:17:26','2025-12-15 12:57:32');
/*!40000 ALTER TABLE `venwind_refex_technical_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venwind_refex_visit_website`
--

DROP TABLE IF EXISTS `venwind_refex_visit_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venwind_refex_visit_website` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` text,
  `background_image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venwind_refex_visit_website`
--

LOCK TABLES `venwind_refex_visit_website` WRITE;
/*!40000 ALTER TABLE `venwind_refex_visit_website` DISABLE KEYS */;
INSERT INTO `venwind_refex_visit_website` VALUES (1,'TO KNOW MORE ABOUT VENWIND REFEX, CLICK ON','Visit Website','https://venwindrefex.com/','/uploads/images/image-1765803570692-200541634.jpg',1,'2025-11-27 17:21:37','2025-12-15 12:59:34');
/*!40000 ALTER TABLE `venwind_refex_visit_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venwind_refex_who_we_are`
--

DROP TABLE IF EXISTS `venwind_refex_who_we_are`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venwind_refex_who_we_are` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `main_image` text,
  `small_image` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venwind_refex_who_we_are`
--

LOCK TABLES `venwind_refex_who_we_are` WRITE;
/*!40000 ALTER TABLE `venwind_refex_who_we_are` DISABLE KEYS */;
INSERT INTO `venwind_refex_who_we_are` VALUES (1,'Who we are','Venwind Refex is a joint venture between Refex and Venwind, committed to revolutionizing wind energy in India through advanced turbine technology and sustainable solutions. With a clear vision to become one of India\'s leading wind turbine OEMs, we combine global innovation with deep local insights.\n\nThrough an exclusive technology license from Vensys Energy AG, Germany, we manufacture cutting-edge 5.3 MW wind turbines featuring a hybrid drivetrain and permanent magnet generator (PMG). This technology is proven worldwide—with over 120 GW of Vensys-powered wind turbines operating across five continents, in a wide range of environments and energy markets.\n\nOur advanced manufacturing facility in India is purpose-built to scale, with a goal of reaching 5 GW in annual production capacity within five years, contributing meaningfully to India\'s renewable energy targets and the global energy transition.','/uploads/images/image-1765803109939-445798568.jpg','/uploads/images/image-1765803116331-455638106.jpg',1,'2025-11-27 13:05:15','2025-12-15 12:51:58');
/*!40000 ALTER TABLE `venwind_refex_who_we_are` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venwind_refex_why_choose_us`
--

DROP TABLE IF EXISTS `venwind_refex_why_choose_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venwind_refex_why_choose_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `icon` text,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venwind_refex_why_choose_us`
--

LOCK TABLES `venwind_refex_why_choose_us` WRITE;
/*!40000 ALTER TABLE `venwind_refex_why_choose_us` DISABLE KEYS */;
INSERT INTO `venwind_refex_why_choose_us` VALUES (1,'Hybrid Drive-Train for Superior Efficiency','Gearbox + medium-speed PMG delivers high performance, reliability, and energy efficiency','/uploads/images/image-1765803312469-490279136.svg',1,1,'2025-11-27 17:11:13','2025-12-15 12:55:14'),(2,'Globally Proven Technology','Deployed in Australia, South Africa, Brazil, and the Middle East, proving reliability across diverse conditions','/uploads/images/image-1765803326044-176909583.svg',2,1,'2025-11-27 17:11:13','2025-12-15 12:55:28'),(3,'Rapid Deployment','Designed for fast manufacturing and installation to meet tight project schedules','/uploads/images/image-1765803336836-740159145.svg',3,1,'2025-11-27 17:11:13','2025-12-15 12:55:38'),(4,'Lower Operational Costs','Hybrid system reduces maintenance and enhances reliability, cutting long-term Opex','/uploads/images/image-1765803347829-13998935.svg',4,1,'2025-11-27 17:11:13','2025-12-15 12:55:50'),(5,'Reduced BOP Costs','Larger WTG sizes cut infrastructure needs, delivering 20–25% savings','/uploads/images/image-1765803367817-213921491.svg',5,1,'2025-11-27 17:11:13','2025-12-15 12:56:10'),(6,'Lower LCOE','Improved technology and BOP savings drive down energy costs','/uploads/images/image-1765803380597-731159515.svg',6,1,'2025-11-27 17:11:13','2025-12-15 12:56:22');
/*!40000 ALTER TABLE `venwind_refex_why_choose_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'industries'
--

--
-- Dumping routines for database 'industries'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-12 10:58:54
