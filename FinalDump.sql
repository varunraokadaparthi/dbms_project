CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'123 Main St','Boston','MA',2108,'USA'),(2,'456 Oak Ave','Boston','MA',2116,'USA'),(3,'789 Maple St','Boston','MA',2110,'USA'),(4,'1010 Pine Blvd','Boston','MA',2215,'USA'),(5,'1313 Mockingbird Ln','Boston','MA',2109,'USA'),(6,'1515 Broadway','Boston','MA',2210,'USA'),(7,'1717 Elm St','Boston','MA',2129,'USA'),(8,'1919 Park St','Boston','MA',2127,'USA'),(9,'2121 Market St','Boston','MA',2114,'USA'),(10,'2323 Sunset Blvd','Boston','MA',2124,'USA'),(11,'2525 University Ave','Boston','MA',2130,'USA'),(12,'2727 Broadway','Boston','MA',2132,'USA'),(13,'2929 Park Rd','Boston','MA',2136,'USA'),(14,'3131 Cherry St','Boston','MA',2125,'USA'),(15,'3333 Vine St','Boston','MA',2121,'USA'),(16,'3535 Main St','Boston','MA',2119,'USA'),(17,'3737 Elm St','Boston','MA',2118,'USA'),(18,'3939 Market St','Boston','MA',2113,'USA');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attended_by`
--

DROP TABLE IF EXISTS `Attended_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attended_by` (
  `event_id` int NOT NULL,
  `user_id` int NOT NULL,
  UNIQUE KEY `unique_attended_by` (`event_id`,`user_id`),
  KEY `attended_by_fk1` (`user_id`),
  CONSTRAINT `attended_by_fk1` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attended_by_fk2` FOREIGN KEY (`event_id`) REFERENCES `Uevent` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attended_by`
--

LOCK TABLES `Attended_by` WRITE;
/*!40000 ALTER TABLE `Attended_by` DISABLE KEYS */;
INSERT INTO `Attended_by` VALUES (1,1),(2,1),(2,2),(3,3),(4,4),(6,4),(3,5),(5,5),(7,5),(6,6),(7,7),(8,7),(1,8),(8,8),(2,9),(3,9),(5,10),(6,10),(2,11),(6,11),(1,12),(7,12),(4,13),(7,13),(3,14),(6,14),(2,15),(5,15),(1,16),(4,16),(6,17),(7,17),(2,18),(3,18),(5,19),(6,19),(4,20),(7,20);
/*!40000 ALTER TABLE `Attended_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Befriends`
--

DROP TABLE IF EXISTS `Befriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Befriends` (
  `friend_id` int NOT NULL,
  `user_id` int NOT NULL,
  UNIQUE KEY `unique_friends` (`user_id`,`friend_id`),
  KEY `befriends_fk2` (`friend_id`),
  CONSTRAINT `befriends_fk` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `befriends_fk2` FOREIGN KEY (`friend_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Befriends`
--

LOCK TABLES `Befriends` WRITE;
/*!40000 ALTER TABLE `Befriends` DISABLE KEYS */;
INSERT INTO `Befriends` VALUES (2,1),(3,1),(3,2),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(5,4),(6,1),(6,2),(6,3),(6,4),(6,5),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),(11,7),(11,8),(11,9),(11,10),(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),(12,11),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10),(13,11),(13,12),(14,1),(14,2),(14,3),(14,4),(14,5),(14,6),(14,7),(14,8),(14,9),(14,10),(14,11),(14,12),(14,13),(15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,8),(15,9),(15,10),(15,11),(15,12),(15,13),(15,14),(16,1),(16,2),(16,3),(16,4),(16,5),(16,6),(16,7),(16,8),(16,9),(16,10),(16,11),(16,12),(16,13),(16,14),(16,15),(17,1),(17,2),(17,3),(17,4),(17,5),(17,6),(17,7),(17,8),(17,9),(17,10),(17,11),(17,12),(17,13),(17,14),(17,15),(17,16),(18,1),(18,2),(18,3),(18,4),(18,5),(18,6),(18,7),(18,8),(18,9),(18,10),(18,11),(18,12),(18,13),(18,14),(18,15),(18,16),(18,17),(19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7),(19,8),(19,9),(19,10),(19,11),(19,12),(19,13),(19,14),(19,15),(19,16),(19,17),(19,18),(20,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(20,9),(20,10),(20,11),(20,12),(20,13),(20,14),(20,15),(20,16),(20,17),(20,18),(20,19);
/*!40000 ALTER TABLE `Befriends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carpool`
--

DROP TABLE IF EXISTS `Carpool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carpool` (
  `carpool_id` int NOT NULL AUTO_INCREMENT,
  `pickup_zipcode` int DEFAULT NULL,
  `dropoff_zipcode` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `event_id` int NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`carpool_id`),
  KEY `carpool_fk1` (`user_id`),
  KEY `carpool_fk2` (`vehicle_id`),
  KEY `carpool_fk3` (`event_id`),
  CONSTRAINT `carpool_fk1` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carpool_fk2` FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicle` (`vehicle_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carpool_fk3` FOREIGN KEY (`event_id`) REFERENCES `UEvent` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carpool`
--

LOCK TABLES `Carpool` WRITE;
/*!40000 ALTER TABLE `Carpool` DISABLE KEYS */;
INSERT INTO `Carpool` VALUES (1,2127,2108,8,8,1,5),(2,2108,2116,1,1,2,5),(3,2114,2116,9,9,2,5),(4,2116,2110,2,2,3,5),(5,2110,2109,3,3,5,5),(6,2124,2109,10,10,5,5),(7,2215,2210,4,4,6,5),(8,2109,2210,5,5,6,5),(9,2109,2129,5,5,7,5);
/*!40000 ALTER TABLE `Carpool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carpool_issue`
--

DROP TABLE IF EXISTS `Carpool_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carpool_issue` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `issue_description` text,
  `location` varchar(64) DEFAULT NULL,
  `carpool_id` int NOT NULL,
  `emp_id` varchar(15) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `includes_u_cp_fk1` (`carpool_id`),
  KEY `issue_cpi_fk2` (`emp_id`),
  KEY `issue_user_cpi_fk3` (`user_id`),
  CONSTRAINT `includes_u_cp_fk1` FOREIGN KEY (`carpool_id`) REFERENCES `Carpool` (`carpool_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issue_cpi_fk2` FOREIGN KEY (`emp_id`) REFERENCES `Customer_support` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issue_user_cpi_fk3` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carpool_issue`
--

LOCK TABLES `Carpool_issue` WRITE;
/*!40000 ALTER TABLE `Carpool_issue` DISABLE KEYS */;
INSERT INTO `Carpool_issue` VALUES (1001,'AC not working','Boylston Street',1,'CS004',16);
/*!40000 ALTER TABLE `Carpool_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carpool_Payment`
--

DROP TABLE IF EXISTS `Carpool_Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carpool_Payment` (
  `cpayment_id` varchar(64) NOT NULL,
  `carpool_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`cpayment_id`),
  KEY `cpayment_fk1` (`carpool_id`),
  KEY `cpayment_fk2` (`user_id`),
  CONSTRAINT `cpayment_fk1` FOREIGN KEY (`carpool_id`) REFERENCES `Carpool` (`carpool_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cpayment_fk2` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carpool_Payment`
--

LOCK TABLES `Carpool_Payment` WRITE;
/*!40000 ALTER TABLE `Carpool_Payment` DISABLE KEYS */;
INSERT INTO `Carpool_Payment` VALUES ('CP_1_12',1,12),('CP_1_16',1,16),('CP_2_11',2,11),('CP_2_15',2,15),('CP_3_18',3,18),('CP_4_14',4,14),('CP_4_18',4,18),('CP_5_15',5,15),('CP_6_19',6,19),('CP_7_17',7,17),('CP_7_19',7,19),('CP_8_11',8,11),('CP_8_14',8,14),('CP_9_12',9,12),('CP_9_13',9,13),('CP_9_17',9,17),('CP_9_20',9,20);
/*!40000 ALTER TABLE `Carpool_Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_support`
--

DROP TABLE IF EXISTS `Customer_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_support` (
  `emp_id` varchar(15) NOT NULL,
  `designation` varchar(64) DEFAULT NULL,
  `emp_password` varchar(64) DEFAULT NULL,
  `work_status` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_support`
--

LOCK TABLES `Customer_support` WRITE;
/*!40000 ALTER TABLE `Customer_support` DISABLE KEYS */;
INSERT INTO `Customer_support` VALUES ('CS001','Customer Support Representative','password123','0'),('CS002','Senior Customer Support Representative','password456','0'),('CS003','Customer Support Manager','password789','0'),('CS004','Customer Support Representative','passwordabc','1'),('CS005','Customer Support Representative','passworddef','1'),('CS006','Customer Support Representative','passwordghi','0');
/*!40000 ALTER TABLE `Customer_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event_issue`
--

DROP TABLE IF EXISTS `Event_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event_issue` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `issue_description` text,
  `issue_time` timestamp NULL DEFAULT NULL,
  `event_id` int NOT NULL,
  `emp_id` varchar(15) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `issue_ei_fk2` (`emp_id`),
  KEY `issue_user_ei_fk3` (`user_id`),
  KEY `has_e_ei_fk2` (`event_id`),
  CONSTRAINT `has_e_ei_fk2` FOREIGN KEY (`event_id`) REFERENCES `UEvent` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issue_ei_fk2` FOREIGN KEY (`emp_id`) REFERENCES `Customer_support` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `issue_user_ei_fk3` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event_issue`
--

LOCK TABLES `Event_issue` WRITE;
/*!40000 ALTER TABLE `Event_issue` DISABLE KEYS */;
INSERT INTO `Event_issue` VALUES (9122,'Event volume too high','2023-04-25 23:00:00',6,'CS005',10);
/*!40000 ALTER TABLE `Event_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event_Payment`
--

DROP TABLE IF EXISTS `Event_Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event_Payment` (
  `epayment_id` varchar(64) NOT NULL,
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`epayment_id`),
  KEY `epayment_fk1` (`user_id`),
  KEY `epayment_fk2` (`event_id`),
  CONSTRAINT `epayment_fk1` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `epayment_fk2` FOREIGN KEY (`event_id`) REFERENCES `UEvent` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event_Payment`
--

LOCK TABLES `Event_Payment` WRITE;
/*!40000 ALTER TABLE `Event_Payment` DISABLE KEYS */;
INSERT INTO `Event_Payment` VALUES ('EP_1_12',12,1),('EP_1_16',16,1),('EP_1_8',8,1),('EP_2_1',1,2),('EP_2_11',11,2),('EP_2_15',15,2),('EP_2_18',18,2),('EP_2_9',9,2),('EP_3_14',14,3),('EP_3_18',18,3),('EP_3_5',5,3),('EP_3_9',9,3),('EP_5_10',10,5),('EP_5_15',15,5),('EP_5_19',19,5),('EP_6_10',10,6),('EP_6_11',11,6),('EP_6_14',14,6),('EP_6_17',17,6),('EP_6_19',19,6),('EP_6_4',4,6),('EP_7_12',12,7),('EP_7_13',13,7),('EP_7_17',17,7),('EP_7_20',20,7),('EP_7_5',5,7),('EP_8_7',7,8);
/*!40000 ALTER TABLE `Event_Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interest`
--

DROP TABLE IF EXISTS `Interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Interest` (
  `interest_type` varchar(64) NOT NULL,
  PRIMARY KEY (`interest_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interest`
--

LOCK TABLES `Interest` WRITE;
/*!40000 ALTER TABLE `Interest` DISABLE KEYS */;
INSERT INTO `Interest` VALUES ('Art'),('Books'),('Cooking'),('Movies'),('Music'),('Photography'),('Sports'),('Technology'),('Travel'),('TV');
/*!40000 ALTER TABLE `Interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Joins`
--

DROP TABLE IF EXISTS `Joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Joins` (
  `user_id` int NOT NULL,
  `carpool_id` int NOT NULL,
  UNIQUE KEY `unique_joins` (`user_id`,`carpool_id`),
  KEY `carpool_joins_fk1` (`carpool_id`),
  CONSTRAINT `carpool_joins_fk1` FOREIGN KEY (`carpool_id`) REFERENCES `Carpool` (`carpool_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `joins_fk1` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Joins`
--

LOCK TABLES `Joins` WRITE;
/*!40000 ALTER TABLE `Joins` DISABLE KEYS */;
INSERT INTO `Joins` VALUES (12,1),(16,1),(11,2),(15,2),(18,3),(14,4),(18,4),(15,5),(19,6),(17,7),(19,7),(11,8),(14,8),(12,9),(13,9),(17,9),(20,9);
/*!40000 ALTER TABLE `Joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lives_at`
--

DROP TABLE IF EXISTS `Lives_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lives_at` (
  `user_id` int NOT NULL,
  `address_id` int DEFAULT NULL,
  UNIQUE KEY `unique_lives_at` (`user_id`,`address_id`),
  KEY `fk2` (`address_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lives_at`
--

LOCK TABLES `Lives_at` WRITE;
/*!40000 ALTER TABLE `Lives_at` DISABLE KEYS */;
INSERT INTO `Lives_at` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,1),(20,2);
/*!40000 ALTER TABLE `Lives_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message` text,
  `sent_at` timestamp NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `messages_fk1` (`sender_id`),
  KEY `messages_fk2` (`receiver_id`),
  CONSTRAINT `messages_fk1` FOREIGN KEY (`sender_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_fk2` FOREIGN KEY (`receiver_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES (1,1,2,'Hey, how are you?','2023-04-17 14:23:00'),(2,2,1,'I am doing well, thanks. How about you?','2023-04-17 14:24:00'),(3,1,2,'I am good too. Have you heard about the new cafe that just opened up?','2023-04-17 14:25:00'),(4,2,1,'No, I haven\'t. Where is it?','2023-04-17 14:26:00'),(5,1,2,'It\'s on Main Street. Want to check it out this weekend?','2023-04-17 14:27:00'),(6,2,1,'Sure, that sounds like a great idea.','2023-04-17 14:28:00'),(7,3,4,'Hey, what are you up to this weekend?','2023-04-17 14:30:00'),(8,4,3,'Not much, why?','2023-04-17 14:31:00'),(9,3,4,'I was thinking we could go to the beach. Want to come?','2023-04-17 14:32:00'),(10,4,3,'Yeah, that sounds like fun. What time?','2023-04-17 14:33:00'),(11,5,6,'Hey, I need your help with something. Are you available?','2023-04-17 14:35:00'),(12,6,5,'Sure, what do you need help with?','2023-04-17 14:36:00'),(13,5,6,'I need to move some furniture this weekend. Can you lend a hand?','2023-04-17 14:37:00'),(14,6,5,'Yeah, no problem. Just let me know when.','2023-04-17 14:38:00'),(15,7,8,'Hey, did you hear about the new restaurant in town?','2023-04-17 14:40:00'),(16,8,7,'No, what\'s it called?','2023-04-17 14:41:00'),(17,7,8,'It\'s called La Cucina. Want to try it out with me?','2023-04-17 14:42:00'),(18,8,7,'Sure, that sounds great!','2023-04-17 14:43:00'),(19,9,10,'Hey, I am bored. Do you want to hang out today?','2023-04-17 14:45:00'),(20,10,9,'Sure, what do you want to do?','2023-04-17 14:46:00'),(21,9,10,'How about we go to the park and play some frisbee?','2023-04-17 14:47:00'),(22,10,9,'Sounds like a plan. What time should we meet?','2023-04-17 14:51:00'),(23,11,12,'Hey, I need your advice on something. Can we chat?','2023-04-17 14:53:00'),(24,12,11,'Of course. What\'s up?','2023-04-17 14:54:00'),(25,11,12,'I am thinking of buying a new car, but I am not sure which one to get. Do you have any recommendations?','2023-04-17 14:55:00'),(26,12,11,'What\'s your budget?','2023-04-17 14:56:00'),(27,11,12,'Around $20,000','2023-04-17 14:57:00'),(28,12,11,'In that case, I would recommend checking out the Honda Civic or the Toyota Corolla. They are both reliable and affordable options.','2023-04-17 14:58:00'),(29,13,14,'Hey, I am throwing a party next week. Do you want to come?','2023-04-17 15:00:00'),(30,14,13,'Sure, that sounds like fun. What kind of party is it?','2023-04-17 15:01:00'),(31,13,14,'It\'s just a casual get-together. I am making some snacks and drinks, and we can play some board games or watch a movie.','2023-04-17 15:02:00'),(32,14,13,'Sounds like a good time. What time should I come over?','2023-04-17 15:03:00'),(33,15,16,'Hey, I need to borrow your calculator for the math test tomorrow. Can I swing by your place?','2023-04-17 15:05:00'),(34,16,15,'Sure, no problem. When do you want to come over?','2023-04-17 15:06:00'),(35,15,16,'How about after school today?','2023-04-17 15:07:00'),(36,16,15,'Sounds good. I\'ll be home by 4 pm.','2023-04-17 15:08:00'),(37,17,18,'Hey, do you want to go see a movie tonight?','2023-04-17 15:10:00'),(38,18,17,'Sure, what movie do you want to see?','2023-04-17 15:11:00'),(39,17,18,'How about that new action movie that just came out?','2023-04-17 15:12:00'),(40,18,17,'Sounds like a plan. What time should we meet?','2023-04-17 15:13:00'),(41,19,20,'Hey, I am thinking of getting a new haircut. Do you have any suggestions?','2023-04-17 15:15:00'),(42,20,19,'Yeah, I know a good salon. I can give you their number.','2023-04-17 15:16:00'),(43,19,20,'That would be great. Thanks!','2023-04-17 15:17:00'),(44,20,19,'No problem. Let me know if you need anything else.','2023-04-17 15:18:00'),(45,1,3,'Hey, are you free to hang out today?','2023-04-17 15:20:00'),(46,3,1,'Sorry, I am busy today. How about tomorrow?','2023-04-17 15:21:00'),(47,1,3,'That works. Let\'s meet at the park at noon?','2023-04-17 15:22:00'),(48,3,1,'Sounds good. See you tomorrow.','2023-04-17 15:23:00'),(49,2,4,'Hey, do you want to grab lunch today?','2023-04-17 15:25:00'),(50,4,2,'Sure, where do you want to go?','2023-04-17 15:26:00'),(51,2,4,'How about that new sandwich place on 5th Street?','2023-04-17 15:27:00'),(52,4,2,'Sounds good. What time?','2023-04-17 15:28:00'),(53,5,7,'Hey, do you want to go to the mall this weekend?','2023-04-17 15:30:00'),(54,7,5,'Sure, what day?','2023-04-17 15:31:00'),(55,5,7,'How about Saturday afternoon?','2023-04-17 15:32:00'),(56,7,5,'Sounds good. Let\'s meet at the food court at 2 pm.','2023-04-17 15:33:00'),(57,6,8,'Hey, can you help me study for the biology test?','2023-04-17 15:35:00'),(58,8,6,'Yeah, no problem. When do you want to study?','2023-04-17 15:36:00'),(59,6,8,'How about after school today?','2023-04-17 15:37:00'),(60,8,6,'Sure, I can meet you at the library at 4 pm.','2023-04-17 15:38:00'),(61,9,11,'Hey, do you want to play some video games later?','2023-04-17 15:40:00'),(62,11,9,'Sure, what game do you want to play?','2023-04-17 15:41:00'),(63,9,11,'How about Call of Duty?','2023-04-17 15:42:00'),(64,11,9,'Sounds good. I\'ll bring my controller.','2023-04-17 15:43:00'),(65,10,12,'Hey, do you want to go to the gym together tomorrow?','2023-04-17 15:45:00'),(66,12,10,'Yeah, that sounds like a good idea. What time?','2023-04-17 15:46:00'),(67,10,12,'How about 9 am?','2023-04-17 15:47:00'),(68,12,10,'Sure, I\'ll see you there.','2023-04-17 15:48:00'),(69,13,15,'Hey, I need your help with something. Can we meet up?','2023-04-17 15:50:00'),(70,15,13,'Sure, what do you need help with?','2023-04-17 15:51:00'),(71,13,15,'I am having trouble with my math homework. Can you explain this problem to me?','2023-04-17 15:52:00'),(72,15,13,'Yeah, let me take a look.','2023-04-17 15:53:00'),(73,14,16,'Hey, do you want to go to the concert next weekend?','2023-04-17 15:55:00'),(74,16,14,'Which concert?','2023-04-17 15:56:00'),(75,14,16,'It\'s a rock concert. I heard the band is really good.','2023-04-17 15:57:00'),(76,16,14,'Sounds like fun. What day is it?','2023-04-17 15:58:00'),(77,17,19,'Hey, do you want to grab some drinks after work today?','2023-04-17 16:00:00'),(78,19,17,'Sorry, I can\'t today. Maybe tomorrow?','2023-04-17 16:01:00'),(79,17,19,'That works. Let\'s meet at the bar on 3rd Street?','2023-04-17 16:02:00'),(80,19,17,'Sure, what time?','2023-04-17 16:03:00'),(81,18,20,'Hey, have you tried that new ice cream place on Main Street?','2023-04-17 16:05:00'),(82,20,18,'No, is it good?','2023-04-17 16:06:00'),(83,18,20,'Yeah, it\'s amazing. Want to go there this weekend?','2023-04-17 16:07:00'),(84,20,18,'Sure, let\'s do it.','2023-04-17 16:08:00'),(85,1,4,'Hey, can you help me move some boxes tomorrow?','2023-04-17 16:10:00'),(86,4,1,'Yeah, no problem. What time?','2023-04-17 16:11:00'),(87,1,4,'How about 10 am?','2023-04-17 16:12:00'),(88,4,1,'Sounds good. I\'ll bring my truck.','2023-04-17 16:13:00'),(89,2,5,'Hey, do you want to go for a bike ride this weekend?','2023-04-17 16:15:00'),(90,5,2,'Sure, where do you want to go?','2023-04-17 16:16:00'),(91,2,5,'How about the park?','2023-04-17 16:17:00'),(92,5,2,'Sounds good. What time?','2023-04-17 16:18:00'),(93,3,6,'Hey, I need to borrow your notes from last week\'s class. Can I come pick them up?','2023-04-17 16:20:00'),(94,6,3,'Sure, no problem. When do you want to come over?','2023-04-17 16:21:00'),(95,3,6,'How about after school today?','2023-04-17 16:22:00'),(96,6,3,'Sounds good. I\'ll be home by 4 pm.','2023-04-17 16:23:00'),(97,4,7,'Hey, do you want to go to the beach this weekend?','2023-04-17 16:25:00'),(98,7,4,'Yeah, that sounds like fun. Which beach do you want to go to?','2023-04-17 16:26:00'),(99,4,7,'How about the one in Santa Monica?','2023-04-17 16:27:00'),(100,7,4,'Sounds good. What time should we leave?','2023-04-17 16:28:00'),(101,5,8,'Hey, do you want to go hiking this weekend?','2023-04-17 16:30:00'),(102,8,5,'Sure, where do you want to go?','2023-04-17 16:31:00'),(103,5,8,'How about that trail in Griffith Park?','2023-04-17 16:32:00'),(104,8,5,'Sounds good. What time?','2023-04-17 16:33:00'),(105,6,9,'Hey, do you want to go see a play next weekend?','2023-04-17 16:35:00'),(106,9,6,'Sure, which play?','2023-04-17 16:36:00'),(107,6,9,'It\'s a Shakespeare play. I heard it\'s really good.','2023-04-17 16:37:00'),(108,9,6,'Sounds interesting. When is it?','2023-04-17 16:38:00'),(109,7,10,'Hey, do you want to grab dinner tonight?','2023-04-17 16:40:00'),(110,10,7,'Yeah, where do you want to go?','2023-04-17 16:41:00'),(111,7,10,'How about that Italian place on Main Street?','2023-04-17 16:42:00'),(112,10,7,'Sounds good. What time?','2023-04-17 16:43:00'),(113,8,11,'Hey, do you want to go to the arcade tonight?','2023-04-17 16:45:00'),(114,11,8,'Sure, what games do they have?','2023-04-17 16:46:00'),(115,8,11,'They have a lot of classic games like Pac-Man and Galaga.','2023-04-17 16:47:00'),(116,11,8,'Sounds like fun. What time should we meet?','2023-04-17 16:48:00'),(117,9,12,'Hey, do you want to go to the museum this weekend?','2023-04-17 16:50:00'),(118,12,9,'Yeah, that sounds like a good idea. Which museum?','2023-04-17 16:51:00'),(119,9,12,'How about the Natural History Museum?','2023-04-17 16:52:00'),(120,12,9,'Sounds interesting. What day is it?','2023-04-17 16:53:00'),(121,10,13,'Hey, do you want to go to the farmers market tomorrow?','2023-04-17 16:55:00'),(122,13,10,'Sure, what time?','2023-04-17 16:56:00'),(123,10,13,'How about 10 am?','2023-04-17 16:57:00'),(124,13,10,'Sounds good. Let\'s meet at the entrance.','2023-04-17 16:58:00'),(125,11,14,'Hey, do you want to go to the park and fly kites this weekend?','2023-04-17 17:00:00'),(126,14,11,'Sure, what day?','2023-04-17 17:01:00'),(127,11,14,'How about Sunday afternoon?','2023-04-17 17:02:00'),(128,14,11,'Sounds good. Let\'s meet at the park at 2 pm.','2023-04-17 17:03:00'),(129,12,15,'Hey, can I borrow your car this weekend?','2023-04-17 17:05:00'),(130,15,12,'Sorry, I need my car this weekend. Why do you need it?','2023-04-17 17:06:00'),(131,12,15,'I am going out of town and need a car to get around.','2023-04-17 17:07:00'),(132,15,12,'Sorry, I can\'t help you this time.','2023-04-17 17:08:00'),(133,13,16,'Hey, do you want to go to the amusement park next weekend?','2023-04-17 17:10:00'),(134,16,13,'Yeah, which amusement park?','2023-04-17 17:11:00'),(135,13,16,'It\'s called Fun World. They have a lot of roller coasters and water rides.','2023-04-17 17:12:00'),(136,16,13,'Sounds like fun. What day?','2023-04-17 17:13:00'),(137,14,17,'Hey, do you want to go see a movie tonight?','2023-04-17 17:15:00'),(138,17,14,'Sure, what movie do you want to see?','2023-04-17 17:16:00'),(139,14,17,'How about the new action movie that just came out?','2023-04-17 17:17:00'),(140,17,14,'Sounds good. What time?','2023-04-17 17:18:00'),(141,15,18,'Hey, do you want to go to the zoo this weekend?','2023-04-17 17:20:00'),(142,18,15,'Yeah, which zoo?','2023-04-17 17:21:00'),(143,15,18,'The one in Griffith Park.','2023-04-17 17:22:00'),(144,18,15,'Sounds like fun. What day?','2023-04-17 17:23:00'),(145,16,19,'Hey, do you want to go to the science museum this weekend?','2023-04-17 17:25:00'),(146,19,16,'Sure, which science museum?','2023-04-17 17:26:00'),(147,16,19,'The one downtown. They have a lot of cool exhibits.','2023-04-17 17:27:00'),(148,19,16,'Sounds interesting. What day is it?','2023-04-17 17:28:00'),(149,17,20,'Hey, do you want to go to the art museum this weekend?','2023-04-17 17:30:00'),(150,20,17,'Yeah, which art museum?','2023-04-17 17:31:00'),(151,17,20,'The one on Wilshire. They have a new exhibit I want to see.','2023-04-17 17:32:00'),(152,20,17,'Sounds interesting. What day?','2023-04-17 17:33:00');
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NUser`
--

DROP TABLE IF EXISTS `NUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NUser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `phone_number` bigint DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(64) DEFAULT NULL,
  `email_id` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `upassword` varchar(64) DEFAULT NULL,
  `hint` varchar(64) DEFAULT NULL,
  `emp_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id` (`email_id`),
  UNIQUE KEY `username` (`username`),
  KEY `customer_support_fk` (`emp_id`),
  CONSTRAINT `customer_support_fk` FOREIGN KEY (`emp_id`) REFERENCES `Customer_support` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NUser`
--

LOCK TABLES `NUser` WRITE;
/*!40000 ALTER TABLE `NUser` DISABLE KEYS */;
INSERT INTO `NUser` VALUES (1,'John','Doe',1234567890,'2000-01-01','Male','johndoe@gmail.com','johndoe','password123','What is your favorite color?',NULL),(2,'Jane','Doe',2345678901,'1995-02-14','Female','janedoe@yahoo.com','janedoe','password456','What is your pet\'s name?',NULL),(3,'Bob','Smith',3456789012,'1980-05-25','Male','bobsmith@hotmail.com','bobsmith','password789','What is your mother\'s maiden name?',NULL),(4,'Alice','Jones',4567890123,'1998-07-04','Female','alicejones@gmail.com','alicejones','passwordabc','What is the name of the street you grew up on?',NULL),(5,'Tom','Wilson',5678901234,'1992-10-31','Male','tomwilson@yahoo.com','tomwilson','passworddef','What is your favorite food?',NULL),(6,'Jenny','Lee',6789012345,'1985-12-25','Female','jennylee@gmail.com','jennylee','passwordghi','What is your favorite movie?',NULL),(7,'Mike','Brown',7890123456,'1975-03-14','Male','mikebrown@hotmail.com','mikebrown','passwordjkl','What is your favorite book?',NULL),(8,'Sarah','Davis',8901234567,'2001-06-15','Female','sarahdavis@yahoo.com','sarahdavis','passwordmno','What is your favorite animal?',NULL),(9,'David','Taylor',9012345678,'1990-09-08','Male','davidtaylor@gmail.com','davidtaylor','passwordpqr','What is your favorite hobby?',NULL),(10,'Megan','Clark',1234567890,'1988-12-31','Female','meganclark@hotmail.com','meganclark','passwordstu','What is your favorite TV show?','CS005'),(11,'Alex','Miller',2345678901,'1978-11-15','Male','alexmiller@gmail.com','alexmiller','passwordvwx','What is your favorite sport?',NULL),(12,'Emily','Thomas',3456789012,'1996-04-10','Female','emilythomas@yahoo.com','emilythomas','passwordyz1','What is your favorite color?',NULL),(13,'Jack','Roberts',4567890123,'1982-08-20','Male','jackroberts@gmail.com','jackroberts','password234','What is your father\'s middle name?',NULL),(14,'Lily','Garcia',5678901234,'1999-03-07','Female','lilygarcia@hotmail.com','lilygarcia','password567','What is the name of your first school?',NULL),(15,'Eric','Young',6789012345,'1993-09-12','Male','ericyoung@yahoo.com','ericyoung','password890','What is your favorite color?',NULL),(16,'Olivia','Allen',7890123456,'1995-11-22','Female','oliviaallen@gmail.com','oliviaallen','passwordabc1','What is your favorite food?','CS004'),(17,'Ryan','Green',8901234567,'1991-07-01','Male','ryangreen@hotmail.com','ryangreen','passworddef2','What is your favorite movie?',NULL),(18,'Grace','Baker',9012345678,'1987-05-18','Female','gracebaker@yahoo.com','gracebaker','passwordghi3','What is your favorite book?',NULL),(19,'Kevin','Evans',1234567890,'1983-12-04','Male','kevinevans@gmail.com','kevinevans','passwordjkl4','What is your favorite animal?',NULL),(20,'Emma','Johnson',2345678901,'1997-01-23','Female','emmajohnson@hotmail.com','emmajohnson','passwordmno5','What is your favorite hobby?',NULL);
/*!40000 ALTER TABLE `NUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `past_events`
--

DROP TABLE IF EXISTS `past_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `past_events` (
  `event_id` int NOT NULL,
  UNIQUE KEY `event_id` (`event_id`),
  CONSTRAINT `past_events_fk1` FOREIGN KEY (`event_id`) REFERENCES `UEvent` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `past_events`
--

LOCK TABLES `past_events` WRITE;
/*!40000 ALTER TABLE `past_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `past_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UEvent`
--

DROP TABLE IF EXISTS `UEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UEvent` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `max_people` int DEFAULT NULL,
  `fees` int DEFAULT NULL,
  `requirements` text,
  `street_name` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `min_age` int DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `agenda` text,
  `host_id` int NOT NULL,
  `interest_type` varchar(64) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `hosted_by` (`host_id`),
  KEY `event_interest` (`interest_type`),
  CONSTRAINT `event_interest` FOREIGN KEY (`interest_type`) REFERENCES `Interest` (`interest_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hosted_by` FOREIGN KEY (`host_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `start_before_end` CHECK ((`start_time` < `end_time`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UEvent`
--

LOCK TABLES `UEvent` WRITE;
/*!40000 ALTER TABLE `UEvent` DISABLE KEYS */;
INSERT INTO `UEvent` VALUES (1,'2023-04-20 14:00:00','2023-04-20 18:00:00',50,20,'Bring your own equipment','123 Main St','Boston',2108,18,'Basketball Tournament','Round-robin tournament with prizes for winners',1,'Sports'),(2,'2023-04-21 23:00:00','2023-04-22 02:00:00',30,10,'No dress code','456 Oak Ave','Boston',2116,21,'Live Music Night','Local artists playing live music',2,'Music'),(3,'2023-04-22 16:00:00','2023-04-22 19:00:00',20,5,'Bring your own snacks','789 Maple St','Boston',2110,16,'Movie Screening','Screening of the latest blockbuster movie',3,'Movies'),(4,'2023-04-23 15:00:00','2023-04-23 17:00:00',10,0,'None','1010 Pine Blvd','Boston',2215,12,'Storytelling Session','Sharing personal stories with friends',4,'Books'),(5,'2023-04-24 19:00:00','2023-04-24 22:00:00',40,15,'No age restrictions','1313 Mockingbird Ln','Boston',2109,18,'Art Exhibition','Featuring local artists and their work',5,'Art'),(6,'2023-04-25 22:00:00','2023-04-26 00:00:00',25,10,'No dress code','1515 Broadway','Boston',2210,21,'Cooking Class','Learn how to cook a delicious meal',6,'Cooking'),(7,'2023-04-26 13:00:00','2023-04-26 21:00:00',100,50,'Bring your own camera','1717 Elm St','Boston',2129,16,'Photography Workshop','Learn the basics of photography from experts',7,'Photography'),(8,'2023-04-27 14:00:00','2023-04-27 20:00:00',50,25,'No age restrictions','1919 Park St','Boston',2127,16,'Technology Expo','Featuring the latest tech products and services',8,'Technology');
/*!40000 ALTER TABLE `UEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Event`
--

DROP TABLE IF EXISTS `User_Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Event` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  UNIQUE KEY `unique_user_event` (`user_id`,`event_id`),
  KEY `ue_fk2` (`event_id`),
  CONSTRAINT `ue_fk1` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ue_fk2` FOREIGN KEY (`event_id`) REFERENCES `UEvent` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Event`
--

LOCK TABLES `User_Event` WRITE;
/*!40000 ALTER TABLE `User_Event` DISABLE KEYS */;
INSERT INTO `User_Event` VALUES (1,1),(8,1),(12,1),(16,1),(1,2),(2,2),(9,2),(11,2),(15,2),(18,2),(3,3),(9,3),(14,3),(18,3),(4,4),(13,4),(16,4),(20,4),(3,5),(5,5),(10,5),(15,5),(19,5),(4,6),(6,6),(10,6),(11,6),(14,6),(17,6),(19,6),(5,7),(7,7),(12,7),(13,7),(17,7),(20,7),(7,8),(8,8);
/*!40000 ALTER TABLE `User_Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_interest`
--

DROP TABLE IF EXISTS `User_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_interest` (
  `user_id` int NOT NULL,
  `interest_type` varchar(64) NOT NULL,
  UNIQUE KEY `unique_interest` (`user_id`,`interest_type`),
  KEY `ui_fk2` (`interest_type`),
  CONSTRAINT `ui_fk1` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ui_fk2` FOREIGN KEY (`interest_type`) REFERENCES `Interest` (`interest_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_interest`
--

LOCK TABLES `User_interest` WRITE;
/*!40000 ALTER TABLE `User_interest` DISABLE KEYS */;
INSERT INTO `User_interest` VALUES (3,'Art'),(5,'Art'),(10,'Art'),(15,'Art'),(19,'Art'),(4,'Books'),(13,'Books'),(16,'Books'),(20,'Books'),(4,'Cooking'),(6,'Cooking'),(10,'Cooking'),(14,'Cooking'),(19,'Cooking'),(3,'Movies'),(9,'Movies'),(14,'Movies'),(18,'Movies'),(1,'Music'),(2,'Music'),(9,'Music'),(18,'Music'),(5,'Photography'),(7,'Photography'),(12,'Photography'),(20,'Photography'),(1,'Sports'),(8,'Sports'),(12,'Sports'),(16,'Sports'),(7,'Technology'),(8,'Technology'),(13,'Technology'),(17,'Technology'),(6,'Travel'),(11,'Travel'),(17,'Travel'),(2,'TV'),(11,'TV'),(15,'TV');
/*!40000 ALTER TABLE `User_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicle` (
  `vehicle_id` int NOT NULL AUTO_INCREMENT,
  `registration_no` varchar(64) DEFAULT NULL,
  `vehicle_type` varchar(64) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE KEY `registration_no` (`registration_no`),
  KEY `contains_fk2` (`vehicle_type`),
  KEY `owns_fk1` (`user_id`),
  CONSTRAINT `contains_fk2` FOREIGN KEY (`vehicle_type`) REFERENCES `Vehicle_type` (`vehicle_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `owns_fk1` FOREIGN KEY (`user_id`) REFERENCES `NUser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES (1,'ABC123','SUV',1),(2,'DEF456','SEDAN',2),(3,'GHI789','SPORTS CAR',3),(4,'JKL012','TRUCK',4),(5,'MNO345','VAN',5),(6,'PQR678','SUV',6),(7,'STU901','SEDAN',7),(8,'VWX234','SPORTS CAR',8),(9,'YZA567','TRUCK',9),(10,'BCD890','VAN',10);
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle_type`
--

DROP TABLE IF EXISTS `Vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicle_type` (
  `vehicle_type` varchar(64) NOT NULL,
  PRIMARY KEY (`vehicle_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle_type`
--

LOCK TABLES `Vehicle_type` WRITE;
/*!40000 ALTER TABLE `Vehicle_type` DISABLE KEYS */;
INSERT INTO `Vehicle_type` VALUES ('SEDAN'),('SPORTS CAR'),('SUV'),('TRUCK'),('VAN');
/*!40000 ALTER TABLE `Vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project'
--

--
-- Dumping routines for database 'project'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddFriend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFriend`(IN pfriend_id INT, IN puser_id INT)
BEGIN
    INSERT INTO befriends(friend_id, user_id) VALUES (pfriend_id, puser_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddInterest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddInterest`(IN puser_id INT, IN pinterest_type VARCHAR(64))
BEGIN
	INSERT INTO user_interest(user_id, interest_type) VALUES(puser_id, pinterest_type); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddMessage`(IN psender_id INT, IN preceiver_id INT, IN pmessage_text VARCHAR(255), IN psent_at DATETIME)
BEGIN
    INSERT INTO messages(sender_id, receiver_id, message, sent_at) VALUES (psender_id, preceiver_id, pmessage_text, psent_at);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddVehicle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddVehicle`(IN pregistration_no VARCHAR(64), IN pvehicle_type VARCHAR(64), IN puser_id INT)
BEGIN
    INSERT INTO vehicle (registration_no, vehicle_type, user_id)
    VALUES (pregistration_no, pvehicle_type, puser_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_login_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_login_proc`(IN pemp_id VARCHAR(15), IN pemp_password VARCHAR(64))
BEGIN
	SELECT * FROM customer_support WHERE emp_id=pemp_id AND emp_password=pemp_password;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AllComplaints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AllComplaints`()
BEGIN
	SELECT * FROM event_issue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `attend_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `attend_event`(IN pevent_id INT, IN puser_id INT)
BEGIN
    DECLARE attendance_count INT;

    SELECT COUNT(*) INTO attendance_count FROM Attended_by WHERE Attended_by.event_id = pevent_id AND Attended_by.user_id = puser_id;

    IF attendance_count = 0 THEN
        INSERT INTO Attended_by(event_id, user_id) VALUES(pevent_id, puser_id);
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckEventHosting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckEventHosting`(IN phost_id INT, IN pevent_id INT)
BEGIN
    SELECT * FROM uevent WHERE uevent.host_id = phost_id AND uevent.event_id = pevent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckIfUserIsHostingEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckIfUserIsHostingEvent`(IN puser_id INT, IN pevent_id INT)
BEGIN
    SELECT * FROM uevent WHERE host_id=puser_id AND event_id=pevent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckUserAttendingEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckUserAttendingEvent`(IN pevent_id INT, IN puser_id INT)
BEGIN
    SELECT * FROM Attended_by WHERE Attended_by.event_id = pevent_id AND Attended_by.user_id = puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckUserIssueForEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckUserIssueForEvent`(IN pevent_id INT, IN puser_id INT)
BEGIN
    SELECT * FROM event_issue WHERE event_issue.event_id = pevent_id AND event_issue.user_id = puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_attendance`(IN pevent_id INT, IN puser_id INT)
BEGIN
    SELECT * FROM Attended_by WHERE event_id=pevent_id AND user_id=puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_attendancev2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_attendancev2`(IN pevent_id INT, IN puser_id INT)
BEGIN
  SELECT * FROM Attended_by WHERE event_id = pevent_id AND user_id = puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateEvent`(
    IN p_start_time TIMESTAMP,
    IN p_end_time TIMESTAMP,
    IN p_max_people INT,
    IN p_fees INT,
    IN p_requirements TEXT,
    IN p_street_name VARCHAR(64),
    IN p_city VARCHAR(64),
    IN p_zip_code INT,
    IN p_min_age INT,
    IN p_title VARCHAR(64),
    IN p_agenda TEXT,
    IN p_host_id INT,
    IN p_interest_type VARCHAR(64)
)
BEGIN
    INSERT INTO UEvent (start_time, end_time, max_people, fees, requirements, street_name, city, zip_code, min_age, title, agenda, host_id, interest_type)
    VALUES (p_start_time, p_end_time, p_max_people, p_fees, p_requirements, p_street_name, p_city, p_zip_code, p_min_age, p_title, p_agenda, p_host_id, p_interest_type);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateIssue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateIssue`(IN pissue_description TEXT, IN pissue_time TIMESTAMP, IN pevent_id INT, IN pemp_id VARCHAR(15), IN puser_id INT)
BEGIN
	INSERT INTO event_issue (issue_description, issue_time, event_id, emp_id, user_id) VALUES (pissue_description, pissue_time, pevent_id, pemp_id, puser_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewMessage`(
  IN p_sender_id INT,
  IN p_receiver_id INT,
  IN p_message TEXT,
  IN p_sent_at DATETIME
)
BEGIN
  DECLARE v_sender_username VARCHAR(255);
  DECLARE v_receiver_username VARCHAR(255);
  
  -- Check if sender and receiver exist
  SELECT username INTO v_sender_username FROM nuser WHERE id = p_sender_id;
  SELECT username INTO v_receiver_username FROM nuser WHERE id = p_receiver_id;
  
  IF v_sender_username IS NULL OR v_receiver_username IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid sender or receiver ID';
  ELSE
    -- Insert new message
    INSERT INTO messages (sender_id, receiver_id, message, sent_at)
    VALUES (p_sender_id, p_receiver_id, p_message, p_sent_at);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteComplaint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteComplaint`(IN pticket_id INT)
BEGIN
	DELETE FROM event_issue WHERE ticket_id=pticket_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEvent`(IN pevent_id INT)
BEGIN
    DECLARE event_host_id INT;
    SELECT host_id INTO event_host_id FROM uevent WHERE event_id = pevent_id;

    IF (event_host_id IS NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Event not found';
    ELSE
        DELETE FROM uevent WHERE event_id = pevent_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteEventById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEventById`(IN p_event_id INT)
BEGIN
    DECLARE event_not_found BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET event_not_found = TRUE;
    
    DELETE FROM UEvent WHERE event_id = p_event_id;
    
    IF event_not_found OR ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT= 'Event not found';
	END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteUnjoins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUnjoins`(IN pcarpool_id INT, IN puser_id INT )
BEGIN
    DELETE FROM joins WHERE carpool_id=pcarpool_id AND user_id=puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUserById`(IN p_id INT)
BEGIN
    DECLARE user_not_found BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET user_not_found = TRUE;
    
    DELETE FROM NUser WHERE id = p_id;
    
    IF user_not_found OR ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_attendance`(IN pevent_id INT, IN puser_id INT)
BEGIN
    DELETE FROM attended_by WHERE attended_by.event_id = pevent_id AND attended_by.user_id = puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEvents`()
BEGIN
    SELECT * FROM UEvent;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllInterests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllInterests`()
BEGIN
    SELECT * FROM interest;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllInterestTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllInterestTypes`()
BEGIN
    SELECT * FROM interest;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllVehicleTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllVehicleTypes`()
BEGIN
    SELECT * FROM vehicle_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCarpool` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCarpool`(IN pcarpool_id INT)
BEGIN
    SELECT * FROM carpool WHERE carpool.carpool_id = pcarpool_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCarpoolDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCarpoolDetails`(IN puser_id INT)
BEGIN
    SELECT * FROM carpool WHERE user_id=puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCarpoolIDsForEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCarpoolIDsForEvent`(IN pevent_id INT)
BEGIN
    DECLARE err_msg VARCHAR(255) DEFAULT '';

    IF NOT EXISTS (SELECT * FROM UEvent WHERE event_id = pevent_id) THEN
        SET err_msg = 'Event not found';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    ELSE
        SELECT carpool_id FROM carpool WHERE event_id = pevent_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCarpoolsWithEventId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCarpoolsWithEventId`(IN pevent_id INT)
BEGIN
    SELECT * FROM carpool WHERE carpool.event_id = pevent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCarpoolv2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCarpoolv2`(IN pcarpool_id INT)
BEGIN
    SELECT * FROM carpool WHERE carpool_id = pcarpool_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDemographicData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDemographicData`()
BEGIN
    SELECT gender, COUNT(*) AS num_users FROM nuser GROUP BY gender;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEvent`(IN pevent_id INT)
BEGIN
    SELECT * FROM uevent WHERE uevent.event_id = pevent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEventById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEventById`(IN p_event_id INT)
BEGIN
    DECLARE event_not_found BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET event_not_found = TRUE;
    
    SELECT * FROM UEvent WHERE event_id = p_event_id;
    
    IF event_not_found THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Event not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEventName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEventName`(IN pevent_id INT)
BEGIN
    SELECT title,start_time FROM uevent WHERE event_id=pevent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEventNameAndStartTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEventNameAndStartTime`(IN pevent_id INT)
BEGIN
    DECLARE title VARCHAR(64);
    DECLARE start_time TIMESTAMP;
    
    SELECT uevent.title, uevent.start_time INTO title, start_time FROM uevent WHERE uevent.event_id = pevent_id;
    
    IF title IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Event not found';
    ELSE
        SELECT title, start_time;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEventNamev2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEventNamev2`(IN pevent_id INT)
BEGIN
    SELECT title FROM uevent WHERE event_id=pevent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFriends` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFriends`(IN puser_id INT)
BEGIN
    IF EXISTS (SELECT * FROM NUser WHERE id = puser_id) THEN
        SELECT friend_id FROM befriends WHERE user_id = puser_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMessages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMessages`(IN user1_id INT, IN user2_id INT)
BEGIN
    DECLARE message_count INT;
    SELECT COUNT(*) INTO message_count FROM messages WHERE (sender_id = user1_id AND receiver_id = user2_id) OR (sender_id = user2_id AND receiver_id = user1_id);
    
    IF message_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No messages found';
    ELSE
        SELECT * FROM messages WHERE (sender_id = user1_id AND receiver_id = user2_id) OR (sender_id = user2_id AND receiver_id = user1_id);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopEventRevenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTopEventRevenue`()
BEGIN
    SELECT e.event_id, e.title, COUNT(ab.user_id) AS attendance, COUNT(DISTINCT ep.epayment_id) AS revenue 
    FROM uevent AS e 
    LEFT JOIN attended_by AS ab ON e.event_id = ab.event_id 
    LEFT JOIN event_payment AS ep ON e.event_id = ep.event_id 
    GROUP BY e.event_id, e.title 
    ORDER BY revenue DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopFriendsCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTopFriendsCount`()
BEGIN
    SELECT nuser.id AS user_id, CONCAT(nuser.first_name, ' ', nuser.last_name) AS name, COUNT(*) AS num_friends
    FROM nuser
    INNER JOIN befriends ON nuser.id = befriends.user_id
    GROUP BY nuser.id, name
    ORDER BY num_friends DESC
    LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopInterests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTopInterests`()
BEGIN
    SELECT interest_type, COUNT(*) AS num_users
    FROM user_interest
    GROUP BY interest_type
    ORDER BY num_users DESC
    LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTopVehicleType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTopVehicleType`()
BEGIN
    SELECT vehicle_type, COUNT(DISTINCT user_id) AS num_users
    FROM vehicle
    GROUP BY vehicle_type
    ORDER BY num_users DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUser`(IN puser_id INT)
BEGIN
    IF EXISTS (SELECT 1 FROM NUser WHERE id = puser_id) THEN
        SELECT id, username FROM NUser WHERE id = puser_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserAttendingEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserAttendingEvents`(IN user_id INT)
BEGIN
    IF EXISTS (SELECT 1 FROM NUser WHERE id = user_id) THEN
        SELECT E.* FROM UEvent AS E 
        JOIN attended_by AS UA ON E.event_id = UA.event_id
        WHERE UA.user_id = user_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserById`(IN p_id INT)
BEGIN
    DECLARE user_not_found BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET user_not_found = TRUE;
    
    SELECT * FROM NUser WHERE id = p_id;
    
    IF user_not_found THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserCarpoolsHostedNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserCarpoolsHostedNumber`()
BEGIN
    SELECT nuser.id AS user_id, CONCAT(nuser.first_name, ' ', nuser.last_name) AS name, COUNT(carpool.carpool_id) AS num_carpools
    FROM nuser 
    LEFT JOIN carpool ON nuser.id = carpool.user_id 
    GROUP BY nuser.id, name 
    ORDER BY num_carpools DESC 
    LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserDetails`(IN puser_id INT)
BEGIN
    SELECT first_name, last_name, phone_number
    FROM nuser
    WHERE id = puser_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserHostedNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserHostedNumber`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'An error occurred while processing your request.';
    END;

    SELECT nuser.id AS user_id, CONCAT(nuser.first_name, ' ', nuser.last_name) AS name, COUNT(uevent.event_id) AS num_events
    FROM nuser 
    LEFT JOIN uevent ON nuser.id = uevent.host_id
    GROUP BY nuser.id, name 
    ORDER BY num_events DESC 
    LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserHostingEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserHostingEvents`(IN user_id INT)
BEGIN
    IF EXISTS (SELECT * FROM NUser WHERE id = user_id) THEN
        SELECT * FROM UEvent WHERE host_id = user_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserInterests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserInterests`(IN puser_id INT)
BEGIN
    DECLARE err_msg VARCHAR(255) DEFAULT '';

    IF NOT EXISTS (SELECT * FROM NUser WHERE id = puser_id) THEN
        SET err_msg = 'User not found';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    ELSE
        SELECT * FROM user_interest WHERE user_id = puser_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserInterestTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserInterestTypes`(IN puser_id INT)
BEGIN
    SELECT * FROM user_interest WHERE user_id = puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserJoinedCarpools` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserJoinedCarpools`(IN puser_id INT)
BEGIN
    SELECT * FROM joins WHERE joins.user_id = puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserName`(IN puser_id INT)
BEGIN
    DECLARE first_name VARCHAR(64);
    DECLARE last_name VARCHAR(64);
    
    SELECT nuser.first_name, nuser.last_name INTO first_name, last_name FROM nuser WHERE id = puser_id;
    
    IF first_name IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found';
    ELSE
        SELECT first_name, last_name;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserNameAndPhoneNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserNameAndPhoneNumber`(IN puser_id INT)
BEGIN
    DECLARE first_name VARCHAR(64);
    DECLARE last_name VARCHAR(64);
    DECLARE phone_number BIGINT;
    
    SELECT nuser.first_name, nuser.last_name, nuser.phone_number INTO first_name, last_name, phone_number FROM nuser WHERE id = puser_id;
    
    IF first_name IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found';
    ELSE
        SELECT first_name, last_name, phone_number;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserProfile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserProfile`(IN puser_id INT)
BEGIN
    SELECT * FROM nuser WHERE id = puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsersJoinedInCarpool` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersJoinedInCarpool`(IN pcarpool_id INT)
BEGIN
    SELECT * FROM joins WHERE joins.carpool_id = pcarpool_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsersWhoHostedCarpoolsUserJoined` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersWhoHostedCarpoolsUserJoined`(IN puser_id INT)
BEGIN
    IF EXISTS (SELECT * FROM joins WHERE user_id = puser_id) THEN
        SELECT user_id FROM carpool WHERE carpool_id in (SELECT carpool_id FROM joins WHERE user_id = puser_id);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found or has no carpools joined';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsersWhoJoinedUserCarpools` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersWhoJoinedUserCarpools`(IN puser_id INT)
BEGIN
    IF EXISTS (SELECT * FROM carpool WHERE user_id = puser_id) THEN
        SELECT user_id FROM joins WHERE carpool_id in (SELECT carpool_id FROM carpool WHERE user_id = puser_id);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found or has no carpools hosted';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsersWhoJoinedUserEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersWhoJoinedUserEvents`(IN user1_id INT)
BEGIN
    IF EXISTS (SELECT * FROM user_event WHERE user_event.user_id = user1_id) THEN
        SELECT user_id FROM user_event WHERE event_id IN (SELECT event_id FROM user_event WHERE user_id = user1_id) AND user_id != user1_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found or has no events joined';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsersWithSimilarInterests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersWithSimilarInterests`(IN puser_id INT)
BEGIN
    IF EXISTS (SELECT * FROM user_interest WHERE user_id = puser_id) THEN
        SELECT * FROM user_interest WHERE interest_type in (SELECT interest_type FROM user_interest WHERE user_id = puser_id);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found or has no interests';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserVehicles`(IN puser_id INT)
BEGIN
    SELECT vehicle_type, registration_no FROM vehicle WHERE user_id= puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVehicle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVehicle`(IN pvehicle_id INT, IN puser_id INT)
BEGIN
    SELECT *
    FROM vehicle
    WHERE vehicle_id = pvehicle_id AND user_id = puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVehicleDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVehicleDetails`(IN pvehicle_id INT)
BEGIN
    SELECT * FROM vehicle WHERE vehicle_id=pvehicle_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVehicleId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVehicleId`(IN pregistration_no VARCHAR(64), IN puser_id INT)
BEGIN
    DECLARE vehicle_id INT;
    
    SELECT vehicle.vehicle_id INTO vehicle_id FROM vehicle WHERE vehicle.registration_no = pregistration_no AND vehicle.user_id = puser_id;
    
    IF vehicle_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vehicle not found';
    ELSE
        SELECT vehicle_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_interests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_interests`()
BEGIN
    SELECT * FROM interest;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event`(IN pevent_id INT)
BEGIN
    SELECT * FROM UEvent WHERE event_id=pevent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_event_by_title` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event_by_title`(IN ptitle VARCHAR(255))
BEGIN
  SELECT * FROM uevent WHERE title=ptitle;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HasUserJoinedCarpool` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HasUserJoinedCarpool`(IN pcarpool_id INT, IN puser_id INT)
BEGIN
    DECLARE err_msg VARCHAR(255) DEFAULT '';

    IF NOT EXISTS (SELECT * FROM NUser WHERE id = puser_id) THEN
        SET err_msg = 'User not found';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    ELSEIF NOT EXISTS (SELECT * FROM carpool WHERE carpool_id = pcarpool_id) THEN
        SET err_msg = 'Carpool not found';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    ELSE
		SELECT * FROM joins WHERE carpool_id = pcarpool_id AND user_id = puser_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertCarpool` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCarpool`(IN ppickup_zipcode INT, IN pdropoff_zipcode INT, IN puser_id INT, IN pvehicle_id INT, IN pevent_id INT, IN pprice INT)
BEGIN
    INSERT INTO carpool (pickup_zipcode, dropoff_zipcode, user_id, vehicle_id, event_id, price) VALUES (ppickup_zipcode, pdropoff_zipcode, puser_id, pvehicle_id, pevent_id, pprice);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertUserJoinInCarpool` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUserJoinInCarpool`(IN puser_id INT, IN pcarpool_id INT)
BEGIN
    INSERT INTO joins (user_id, carpool_id) VALUES (puser_id, pcarpool_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_event`(
  IN p_start_time DATETIME,
  IN p_end_time DATETIME,
  IN p_max_people INT,
  IN p_fees FLOAT,
  IN p_requirements TEXT,
  IN p_street_name VARCHAR(255),
  IN p_city VARCHAR(255),
  IN p_zip_code VARCHAR(10),
  IN p_min_age INT,
  IN p_title VARCHAR(255),
  IN p_agenda TEXT,
  IN p_host_id INT,
  IN p_interest_type VARCHAR(64)
)
BEGIN
  INSERT INTO uevent (
    start_time, 
    end_time, 
    max_people, 
    fees, 
    requirements, 
    street_name, 
    city, 
    zip_code, 
    min_age, 
    title, 
    agenda, 
    host_id, 
    interest_type
  )
  VALUES (
    p_start_time, 
    p_end_time, 
    p_max_people, 
    p_fees, 
    p_requirements, 
    p_street_name, 
    p_city, 
    p_zip_code, 
    p_min_age, 
    p_title, 
    p_agenda, 
    p_host_id, 
    p_interest_type
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IssueAvailableEmp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IssueAvailableEmp`(IN pwork_status CHAR(1), IN plimit INT)
BEGIN
	SELECT emp_id FROM customer_support WHERE work_status = pwork_status LIMIT plimit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IssueEventTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IssueEventTitle`(IN pevent_id INT)
BEGIN
	SELECT title FROM uevent WHERE event_id=pevent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IsUserRegisteredForEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IsUserRegisteredForEvent`(IN pevent_id INT, IN puser_id INT)
BEGIN
    DECLARE err_msg VARCHAR(255) DEFAULT '';

    IF NOT EXISTS (SELECT 1 FROM NUser WHERE id = user_id) THEN
        SET err_msg = 'User not found';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    ELSEIF NOT EXISTS (SELECT 1 FROM UEvent WHERE event_id = event_id) THEN
        SET err_msg = 'Event not found';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = err_msg;
    ELSE
        SELECT COUNT(*) AS is_registered FROM Attended_by WHERE event_id = pevent_id AND user_id = puser_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Messaging_recommendation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Messaging_recommendation`(IN puser_id INT)
BEGIN
	SELECT id, username FROM nuser WHERE id = puser_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveFriend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveFriend`(IN pfriend_id INT, IN puser_id INT)
BEGIN
    DELETE FROM befriends WHERE friend_id = pfriend_id AND user_id = puser_id;
    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Friend not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveInterestForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveInterestForUser`(IN puser_id INT, IN pinterest_type VARCHAR(64))
BEGIN
    IF EXISTS (SELECT * FROM user_interest WHERE user_id = puser_id AND interest_type = pinterest_type) THEN
        DELETE FROM user_interest WHERE user_id = puser_id AND interest_type = pinterest_type;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Interest not found for user';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveVehicle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveVehicle`(IN pvehicle_id INT)
BEGIN
    DELETE FROM vehicle WHERE vehicle_id = pvehicle_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_user_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_user_by_id`(IN puser_id INT)
BEGIN
    SELECT * FROM nuser WHERE id = puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddUser`(
	IN first_name VARCHAR(64),
	IN last_name VARCHAR(64),
	IN phone_number BIGINT,
	IN date_of_birth DATE,
	IN gender VARCHAR(64),
	IN email_id VARCHAR(64),
	IN username VARCHAR(64),
	IN upassword VARCHAR(64),
	IN hint VARCHAR(64)
)
BEGIN
	INSERT INTO NUser (first_name, last_name, phone_number, date_of_birth, gender, email_id, username, upassword, hint)
	VALUES (first_name, last_name, phone_number, date_of_birth, gender, email_id, username, upassword, hint);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteUser`(IN id INT)
BEGIN
	DELETE FROM NUser
	WHERE NUser.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetUserDetails`(IN id INT)
BEGIN
	SELECT *
	FROM NUser
	WHERE NUser.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUserHostEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetUserHostEvents`(IN id INT)
BEGIN
	SELECT UEvent.*
	FROM UEvent
	INNER JOIN User_Event ON UEvent.event_id = User_Event.event_id
	WHERE User_Event.user_id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateUser`(
	IN id INT,
	IN first_name VARCHAR(64),
	IN last_name VARCHAR(64),
	IN phone_number BIGINT,
	IN date_of_birth DATE,
	IN gender VARCHAR(64),
	IN email_id VARCHAR(64),
	IN username VARCHAR(64),
	IN upassword VARCHAR(64),
	IN hint VARCHAR(64)
)
BEGIN
	UPDATE NUser
	SET first_name = first_name,
    	last_name = last_name,
    	phone_number = phone_number,
    	date_of_birth = date_of_birth,
    	gender = gender,
    	email_id = email_id,
    	username = username,
    	upassword = upassword,
    	hint = hint
	WHERE NUser.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unjoin_carpool` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unjoin_carpool`(IN pcarpool_id INT, IN puser_id INT)
BEGIN
    DELETE FROM joins WHERE carpool_id=pcarpool_id AND user_id=puser_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateEventById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateEventById`(
    IN p_event_id INT,
    IN p_start_time TIMESTAMP,
    IN p_end_time TIMESTAMP,
    IN p_max_people INT,
    IN p_fees INT,
    IN p_requirements TEXT,
    IN p_street_name VARCHAR(64),
    IN p_city VARCHAR(64),
    IN p_zip_code INT,
    IN p_min_age INT,
    IN p_title VARCHAR(64),
    IN p_agenda TEXT,
    IN p_host_id INT,
    IN p_interest_type VARCHAR(64)
)
BEGIN
    DECLARE event_not_found BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET event_not_found = TRUE;
    
    UPDATE UEvent
    SET start_time = p_start_time,
        end_time = p_end_time,
        max_people = p_max_people,
        fees = p_fees,
        requirements = p_requirements,
        street_name = p_street_name,
        city = p_city,
        zip_code = p_zip_code,
        min_age = p_min_age,
        title = p_title,
        agenda = p_agenda,
        host_id = p_host_id,
        interest_type = p_interest_type
    WHERE event_id = p_event_id;
    
    IF event_not_found OR ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Event not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserById`(
    IN p_id INT,
    IN p_first_name VARCHAR(64),
    IN p_last_name VARCHAR(64),
    IN p_phone_number BIGINT,
    IN p_date_of_birth DATE,
    IN p_gender VARCHAR(64),
    IN p_email_id VARCHAR(64),
    IN p_username VARCHAR(64),
    IN p_upassword VARCHAR(64),
    IN p_hint VARCHAR(64)
)
BEGIN
    DECLARE user_not_found BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET user_not_found = TRUE;
    
    UPDATE NUser
    SET first_name = p_first_name,
        last_name = p_last_name,
        phone_number = p_phone_number,
        date_of_birth = p_date_of_birth,
        gender = p_gender,
        email_id = p_email_id,
        username = p_username,
        upassword = p_upassword,
        hint = p_hint
    WHERE id = p_id;
    
    IF user_not_found OR ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User not found';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateVehicle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateVehicle`(IN pregistration_no VARCHAR(64), IN pvehicle_type VARCHAR(64), IN pvehicle_id INT)
BEGIN
    UPDATE vehicle SET registration_no = pregistration_no, vehicle_type = pvehicle_type WHERE vehicle_id = pvehicle_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserByUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserByUsername`(IN pusername VARCHAR(64))
BEGIN
	SELECT * FROM NUser WHERE username=pusername;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserLogin`(IN pusername VARCHAR(64), IN pupassword VARCHAR(64))
BEGIN
    SELECT * FROM NUser WHERE username = pusername AND upassword = pupassword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-22  2:44:29
