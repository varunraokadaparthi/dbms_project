CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `street` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `state` varchar(64) NOT NULL,
  `zip_code` int NOT NULL,
  `country` varchar(64) NOT NULL,
  PRIMARY KEY (`street`,`city`,`state`,`zip_code`,`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('111 Maple Ave','Beantown','MA',2115,'USA'),('123 Main St','Anytown','CA',90210,'USA'),('222 Chestnut St','Windy City','IL',60601,'USA'),('456 Oak St','Smallville','NY',12345,'USA'),('789 Pine St','Big City','TX',55555,'USA');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attended_by`
--

DROP TABLE IF EXISTS `attended_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attended_by` (
  `event_id` int NOT NULL,
  `user_id` int NOT NULL,
  KEY `attended_by_fk1` (`user_id`),
  KEY `attended_by_fk2` (`event_id`),
  CONSTRAINT `attended_by_fk1` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`),
  CONSTRAINT `attended_by_fk2` FOREIGN KEY (`event_id`) REFERENCES `uevent` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attended_by`
--

LOCK TABLES `attended_by` WRITE;
/*!40000 ALTER TABLE `attended_by` DISABLE KEYS */;
INSERT INTO `attended_by` VALUES (1,2),(1,4),(4,1),(3,5);
/*!40000 ALTER TABLE `attended_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `befriends`
--

DROP TABLE IF EXISTS `befriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `befriends` (
  `friend_id` int NOT NULL,
  `user_id` int NOT NULL,
  KEY `befriends_fk` (`user_id`),
  KEY `befriends_fk2` (`friend_id`),
  CONSTRAINT `befriends_fk` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`),
  CONSTRAINT `befriends_fk2` FOREIGN KEY (`friend_id`) REFERENCES `nuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `befriends`
--

LOCK TABLES `befriends` WRITE;
/*!40000 ALTER TABLE `befriends` DISABLE KEYS */;
INSERT INTO `befriends` VALUES (1,5),(1,3),(2,4),(2,3),(1,2),(3,5),(3,4),(4,5);
/*!40000 ALTER TABLE `befriends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carpool`
--

DROP TABLE IF EXISTS `carpool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carpool` (
  `carpool_id` int NOT NULL,
  `pickup_zipcode` int DEFAULT NULL,
  `dropoff_zipcode` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  PRIMARY KEY (`carpool_id`),
  KEY `carpool_fk1` (`user_id`),
  KEY `carpool_fk2` (`vehicle_id`),
  CONSTRAINT `carpool_fk1` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`),
  CONSTRAINT `carpool_fk2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carpool`
--

LOCK TABLES `carpool` WRITE;
/*!40000 ALTER TABLE `carpool` DISABLE KEYS */;
INSERT INTO `carpool` VALUES (1,2120,8052,2,3),(2,2120,8052,5,3),(3,2120,44406,1,1),(4,2120,44406,3,1);
/*!40000 ALTER TABLE `carpool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carpool_issue`
--

DROP TABLE IF EXISTS `carpool_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carpool_issue` (
  `ticket_id` int NOT NULL,
  `issue_description` text,
  `location` varchar(64) DEFAULT NULL,
  `carpool_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `includes_u_cp_fk1` (`carpool_id`),
  CONSTRAINT `includes_u_cp_fk1` FOREIGN KEY (`carpool_id`) REFERENCES `carpool` (`carpool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carpool_issue`
--

LOCK TABLES `carpool_issue` WRITE;
/*!40000 ALTER TABLE `carpool_issue` DISABLE KEYS */;
INSERT INTO `carpool_issue` VALUES (1,'CAR LATE','HUNTINGTON',1);
/*!40000 ALTER TABLE `carpool_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carpool_payment`
--

DROP TABLE IF EXISTS `carpool_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carpool_payment` (
  `cpayment_id` int NOT NULL,
  `carpool_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`cpayment_id`),
  KEY `cpayment_fk1` (`carpool_id`),
  KEY `cpayment_fk2` (`user_id`),
  CONSTRAINT `cpayment_fk1` FOREIGN KEY (`carpool_id`) REFERENCES `carpool` (`carpool_id`),
  CONSTRAINT `cpayment_fk2` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carpool_payment`
--

LOCK TABLES `carpool_payment` WRITE;
/*!40000 ALTER TABLE `carpool_payment` DISABLE KEYS */;
INSERT INTO `carpool_payment` VALUES (1,2,5),(2,3,3);
/*!40000 ALTER TABLE `carpool_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_support`
--

DROP TABLE IF EXISTS `customer_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_support` (
  `emp_id` varchar(15) NOT NULL,
  `designation` varchar(64) DEFAULT NULL,
  `emp_password` varchar(64) DEFAULT NULL,
  `work_status` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_support`
--

LOCK TABLES `customer_support` WRITE;
/*!40000 ALTER TABLE `customer_support` DISABLE KEYS */;
INSERT INTO `customer_support` VALUES ('EMP1345','Level1','R2kB2LLH','0'),('EMP6342','Level2','HaEyPuwv','0'),('EMP8743','Level3','qNbpEEx9','0');
/*!40000 ALTER TABLE `customer_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_issue`
--

DROP TABLE IF EXISTS `event_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_issue` (
  `ticket_id` int NOT NULL,
  `issue_description` text,
  `issue_time` timestamp NULL DEFAULT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `has_e_ei_fk2` (`event_id`),
  CONSTRAINT `has_e_ei_fk2` FOREIGN KEY (`event_id`) REFERENCES `uevent` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_issue`
--

LOCK TABLES `event_issue` WRITE;
/*!40000 ALTER TABLE `event_issue` DISABLE KEYS */;
INSERT INTO `event_issue` VALUES (2,'EVENT ENTRY PROBLEM','2022-03-07 00:10:10',2);
/*!40000 ALTER TABLE `event_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_payment`
--

DROP TABLE IF EXISTS `event_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_payment` (
  `epayment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`epayment_id`),
  KEY `epayment_fk1` (`user_id`),
  KEY `epayment_fk2` (`event_id`),
  CONSTRAINT `epayment_fk1` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`),
  CONSTRAINT `epayment_fk2` FOREIGN KEY (`event_id`) REFERENCES `uevent` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_payment`
--

LOCK TABLES `event_payment` WRITE;
/*!40000 ALTER TABLE `event_payment` DISABLE KEYS */;
INSERT INTO `event_payment` VALUES (1,1,3),(2,3,3),(3,2,4),(4,5,4),(5,4,5);
/*!40000 ALTER TABLE `event_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interest` (
  `interest_type` varchar(64) NOT NULL,
  PRIMARY KEY (`interest_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` VALUES ('ART'),('FASHION'),('FILM'),('FOOD'),('GAMING'),('LITERATURE'),('MUSIC'),('OUTDOORS'),('PARTY'),('SPORTS'),('TECHNOLOGY'),('TRAVEL');
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `ticket_id` int NOT NULL,
  `issue_description` text,
  `emp_id` varchar(15) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `issue_cs_fk1` (`emp_id`),
  KEY `issue_user_fk2` (`user_id`),
  CONSTRAINT `issue_cs_fk1` FOREIGN KEY (`emp_id`) REFERENCES `customer_support` (`emp_id`),
  CONSTRAINT `issue_user_fk2` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (1,'CAR LATE','EMP1345',1),(2,'EVENT ENTRY PROBLEM','EMP1345',2);
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joins`
--

DROP TABLE IF EXISTS `joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `joins` (
  `user_id` int NOT NULL,
  `carpool_id` int NOT NULL,
  KEY `joins_fk1` (`user_id`),
  KEY `carpool_joins_fk1` (`carpool_id`),
  CONSTRAINT `carpool_joins_fk1` FOREIGN KEY (`carpool_id`) REFERENCES `carpool` (`carpool_id`),
  CONSTRAINT `joins_fk1` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joins`
--

LOCK TABLES `joins` WRITE;
/*!40000 ALTER TABLE `joins` DISABLE KEYS */;
INSERT INTO `joins` VALUES (5,2),(3,3);
/*!40000 ALTER TABLE `joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lives_at`
--

DROP TABLE IF EXISTS `lives_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lives_at` (
  `user_id` int NOT NULL,
  `street` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  KEY `fk1` (`user_id`),
  KEY `fk2` (`street`,`city`,`state`,`zip_code`,`country`),
  CONSTRAINT `fk1` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`),
  CONSTRAINT `fk2` FOREIGN KEY (`street`, `city`, `state`, `zip_code`, `country`) REFERENCES `address` (`street`, `city`, `state`, `zip_code`, `country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lives_at`
--

LOCK TABLES `lives_at` WRITE;
/*!40000 ALTER TABLE `lives_at` DISABLE KEYS */;
INSERT INTO `lives_at` VALUES (1,'123 Main St','Anytown','CA',90210,'USA'),(2,'456 Oak St','Smallville','NY',12345,'USA'),(3,'789 Pine St','Big City','TX',55555,'USA'),(4,'111 Maple Ave','Beantown','MA',2115,'USA'),(5,'222 Chestnut St','Windy City','IL',60601,'USA');
/*!40000 ALTER TABLE `lives_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message` text,
  PRIMARY KEY (`message_id`),
  KEY `messages_fk1` (`sender_id`),
  KEY `messages_fk2` (`receiver_id`),
  CONSTRAINT `messages_fk1` FOREIGN KEY (`sender_id`) REFERENCES `nuser` (`id`),
  CONSTRAINT `messages_fk2` FOREIGN KEY (`receiver_id`) REFERENCES `nuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,2,'Hi, how are you?'),(2,2,1,'I am doing well, thanks for asking.'),(3,1,3,'Hey, what are you up to?'),(4,3,1,'Nothing much, just hanging out at home.'),(5,2,4,'What did you do over the weekend?'),(6,4,2,'I went hiking in the mountains, it was beautiful.'),(7,3,4,'Do you want to go see a movie later?'),(8,4,3,'Sure, that sounds like fun.'),(9,5,1,'Hey, can I borrow your notes from class?'),(10,1,5,'Yeah, no problem, I will send them to you.'),(11,2,5,'Are you going to the party tonight?'),(12,5,2,'Yes, I am planning on going.');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuser`
--

DROP TABLE IF EXISTS `nuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nuser` (
  `id` int NOT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `phone_number` bigint DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(64) DEFAULT NULL,
  `email_id` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `upassword` varchar(64) DEFAULT NULL,
  `hint` varchar(64) DEFAULT NULL,
  `languages_known` text,
  `emp_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_support_fk` (`emp_id`),
  CONSTRAINT `customer_support_fk` FOREIGN KEY (`emp_id`) REFERENCES `customer_support` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuser`
--

LOCK TABLES `nuser` WRITE;
/*!40000 ALTER TABLE `nuser` DISABLE KEYS */;
INSERT INTO `nuser` VALUES (1,'John','Doe',1234567890,'1990-01-01','Male','johndoe@example.com','johndoe','SKdMhyNV','mother\'s maiden name','English, Spanish',NULL),(2,'Jane','Smith',2345678901,'1995-02-01','Female','janesmith@example.com','janesmith','awCwS3gY','first pet name','English, French',NULL),(3,'Bob','Johnson',3456789012,'1992-03-01','Male','bobjohnson@example.com','bobjohnson','DWKwL2cm','favorite color','English, German',NULL),(4,'Mary','Davis',4567890123,'1988-04-01','Female','marydavis@example.com','marydavis','6h8DkNna','street where grew up','English, Italian',NULL),(5,'David','Wilson',5678901234,'1985-05-01','Male','davidwilson@example.com','davidwilson','SeFvTZ7r','favorite movie','English, Chinese',NULL);
/*!40000 ALTER TABLE `nuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uevent`
--

DROP TABLE IF EXISTS `uevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uevent` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `timings` text,
  `max_people` int DEFAULT NULL,
  `fees` int DEFAULT NULL,
  `requirements` text,
  `street_name` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `min_age` int DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `agenda` text,
  `id` int NOT NULL,
  `interest_type` varchar(64) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `hosted_by` (`id`),
  KEY `event_interest` (`interest_type`),
  CONSTRAINT `event_interest` FOREIGN KEY (`interest_type`) REFERENCES `interest` (`interest_type`),
  CONSTRAINT `hosted_by` FOREIGN KEY (`id`) REFERENCES `nuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uevent`
--

LOCK TABLES `uevent` WRITE;
/*!40000 ALTER TABLE `uevent` DISABLE KEYS */;
INSERT INTO `uevent` VALUES (1,'7 TO 10 PM',500,10,'FANCY DRESS','123 Main St','Anytown',90210,21,'MASQUERADE PARTY','MUSIC, DANCE AND FOOD',2,'PARTY'),(2,'6 TO 8 PM',50,0,'NONE','1313 Maple St','Mapleton',84664,16,'LOCAL BOOK CLUB MEET','BOOK DISCUSSION AND COFFEE',3,'LITERATURE'),(3,'9 TO 11 PM',100,20,'CASUAL DRESS','1010 Cherry Ln','Cherryville',44406,18,'KARAOKE NIGHT','MUSIC AND KARIOKE',4,'MUSIC'),(4,'2 TO 5 PM',200,5,'BRING YOUR OWN MAT','3131 Maple Rd','Maple Shade',8052,16,'YOGA WORKSHOP','YOGA AND MEDITATION',5,'SPORTS'),(5,'7 TO 11 PM',400,30,'FORMAL DRESS','2424 Redwood Dr','Redwood City',94061,21,'GALA NIGHT','DINNER AND DANCE',2,'PARTY'),(6,'4 TO 7 PM',50,0,'NONE','2929 Elmwood Dr','Elmwood Park',53405,21,'ART EXHIBITION','ART DISPLAY AND DISCUSSION',4,'ART'),(7,'5 TO 7 PM',100,10,'CASUAL DRESS','1515 Walnut Ave','Walnut Creek',94596,16,'FILM SCREENING','FILM VIEWING AND DISCUSSION',5,'FILM');
/*!40000 ALTER TABLE `uevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_event`
--

DROP TABLE IF EXISTS `user_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_event` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  KEY `ue_fk1` (`user_id`),
  KEY `ue_fk2` (`event_id`),
  CONSTRAINT `ue_fk1` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`),
  CONSTRAINT `ue_fk2` FOREIGN KEY (`event_id`) REFERENCES `uevent` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_event`
--

LOCK TABLES `user_event` WRITE;
/*!40000 ALTER TABLE `user_event` DISABLE KEYS */;
INSERT INTO `user_event` VALUES (1,1),(2,3),(5,4);
/*!40000 ALTER TABLE `user_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interest`
--

DROP TABLE IF EXISTS `user_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interest` (
  `user_id` int NOT NULL,
  `interest_type` varchar(64) NOT NULL,
  KEY `ui_fk1` (`user_id`),
  KEY `ui_fk2` (`interest_type`),
  CONSTRAINT `ui_fk1` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`),
  CONSTRAINT `ui_fk2` FOREIGN KEY (`interest_type`) REFERENCES `interest` (`interest_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interest`
--

LOCK TABLES `user_interest` WRITE;
/*!40000 ALTER TABLE `user_interest` DISABLE KEYS */;
INSERT INTO `user_interest` VALUES (3,'PARTY'),(1,'MUSIC'),(2,'SPORTS'),(3,'MUSIC'),(4,'PARTY'),(5,'SPORTS');
/*!40000 ALTER TABLE `user_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicle_id` int NOT NULL,
  `registration_no` varchar(64) DEFAULT NULL,
  `vehicle_type` varchar(64) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  KEY `contains_fk2` (`vehicle_type`),
  KEY `owns_fk1` (`user_id`),
  CONSTRAINT `contains_fk2` FOREIGN KEY (`vehicle_type`) REFERENCES `vehicle_type` (`vehicle_type`),
  CONSTRAINT `owns_fk1` FOREIGN KEY (`user_id`) REFERENCES `nuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'TS07JD4013','SUV',1),(2,'TS07HV5816','SEDAN',1),(3,'CA123456','SEDAN',2),(4,'NY987654','SUV',3),(5,'TX456789','SEDAN',4),(6,'IL654321','SUV',5);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_type` (
  `vehicle_type` varchar(64) NOT NULL,
  PRIMARY KEY (`vehicle_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES ('SEDAN'),('SPORTS CAR'),('SUV'),('TRUCK'),('VAN');
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-02 17:09:23
