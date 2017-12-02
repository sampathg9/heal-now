CREATE DATABASE  IF NOT EXISTS `heal_now_dev` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `heal_now_dev`;
-- MySQL dump 10.15  Distrib 10.0.33-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: heal_now_dev
-- ------------------------------------------------------
-- Server version	10.0.33-MariaDB-1~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `appointment_on` datetime NOT NULL,
  `specialization_id` int(10) unsigned DEFAULT NULL,
  `doctor_id` int(10) unsigned DEFAULT NULL,
  `symptoms` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointments_user_id_idx` (`user_id`),
  KEY `fk_appointments_doctor_id_idx` (`doctor_id`),
  KEY `fk_appointments_specialization_id_idx` (`specialization_id`),
  CONSTRAINT `fk_appointments_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointments_specialization_id` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `specialization` varchar(45) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_doctors_user_id_idx` (`user_id`),
  CONSTRAINT `fk_doctors_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_name` varchar(500) NOT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializations`
--

DROP TABLE IF EXISTS `specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specializations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializations`
--

LOCK TABLES `specializations` WRITE;
/*!40000 ALTER TABLE `specializations` DISABLE KEYS */;
INSERT INTO `specializations` VALUES (3,'Medical Doctor','','2017-12-02 16:12:38','2017-12-02 16:12:38',1),(4,'Pediatrics',NULL,'2017-12-02 16:12:38','2017-12-02 16:12:38',NULL),(5,'Psychologist','','2017-12-02 16:12:38','2017-12-02 16:12:38',1);
/*!40000 ALTER TABLE `specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptoms`
--

DROP TABLE IF EXISTS `symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptoms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms`
--

LOCK TABLES `symptoms` WRITE;
/*!40000 ALTER TABLE `symptoms` DISABLE KEYS */;
INSERT INTO `symptoms` VALUES (1,'Fever',NULL,'General','2017-12-02 16:14:55','2017-12-02 16:14:55',1),(2,'Weight loss/gain',NULL,'General','2017-12-02 16:14:55','2017-12-02 16:14:55',1),(3,'Difficulty sleeping',NULL,'General','2017-12-02 16:14:55','2017-12-02 16:14:55',1),(4,'Loss of Appetite',NULL,'General','2017-12-02 16:14:55','2017-12-02 16:14:55',1),(5,'Mood changes',NULL,'General','2017-12-02 16:14:55','2017-12-02 16:14:55',1),(6,'Fatigue/weakness',NULL,'General','2017-12-02 16:14:55','2017-12-02 16:14:55',1),(7,'Headache',NULL,'Head/Neck','2017-12-02 16:18:38','2017-12-02 16:18:38',1),(8,'Vision changes',NULL,'Head/Neck','2017-12-02 16:18:38','2017-12-02 16:18:38',1),(9,'Hearing loss',NULL,'Head/Neck','2017-12-02 16:18:38','2017-12-02 16:18:38',1),(10,'Nasal discharge',NULL,'Head/Neck','2017-12-02 16:18:38','2017-12-02 16:18:38',1),(11,'Congestion/sinus problems','','Head/Neck','2017-12-02 16:18:38','2017-12-02 16:18:38',1),(12,'Sore throat',NULL,'Head/Neck','2017-12-02 16:18:38','2017-12-02 16:18:38',1),(13,'Allergies',NULL,'Head/Neck','2017-12-02 16:18:38','2017-12-02 16:18:38',1),(14,'Numbness/tingling',NULL,'Head/Neck','2017-12-02 16:18:38','2017-12-02 16:18:38',1),(15,'Chest pain',NULL,'Chest','2017-12-02 16:21:18','2017-12-02 16:21:18',1),(16,'Cough',NULL,'Chest','2017-12-02 16:21:18','2017-12-02 16:21:18',1),(17,'Sputum',NULL,'Chest','2017-12-02 16:21:18','2017-12-02 16:21:18',1),(18,'Shortness of breath',NULL,'Chest','2017-12-02 16:21:18','2017-12-02 16:21:18',1),(19,'Nausea/vomiting',NULL,'Gastrointestinal','2017-12-02 16:23:14','2017-12-02 16:23:14',1),(20,'Heartburn',NULL,'Gastrointestinal','2017-12-02 16:23:14','2017-12-02 16:23:14',1),(21,'Diarrhea',NULL,'Gastrointestinal','2017-12-02 16:23:14','2017-12-02 16:23:14',1),(22,'Constipation',NULL,'Gastrointestinal','2017-12-02 16:23:14','2017-12-02 16:23:14',1),(23,'Abdominal pain/ discomfort',NULL,'Gastrointestinal','2017-12-02 16:23:14','2017-12-02 16:23:14',1),(24,'Discomfort/ burning with urination',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(25,'Blood in urine',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(26,'Frequent urination',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(27,'History of sexually transmitted infections',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(28,'Irregular periods',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(29,'vaginal bleeding',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(30,'vaginal discharge',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(31,'penile discharge',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(32,'Testicular swelling',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(33,'Testicular pain',NULL,'Genitourinary','2017-12-02 16:25:18','2017-12-02 16:25:18',1),(34,'muscle pain',NULL,'Musculoskeletal','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(35,'Limited motion / mobility',NULL,'Musculoskeletal','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(36,'Muscle weakness',NULL,'Musculoskeletal','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(37,'Back Pain',NULL,'Musculoskeletal','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(38,'Joint Replacement',NULL,'Musculoskeletal','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(39,'Bleeding',NULL,'Skin','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(40,'Itching',NULL,'Skin','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(41,'Swelling',NULL,'Skin','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(42,'Skin rashes / bumps',NULL,'Skin','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(43,'Brusing / discoloration',NULL,'Skin','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(44,'Sores',NULL,'Skin','2017-12-02 16:28:21','2017-12-02 16:28:21',1),(45,'Bites',NULL,'Skin','2017-12-02 16:28:21','2017-12-02 16:28:21',1);
/*!40000 ALTER TABLE `symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(500) NOT NULL,
  `expire_on` datetime DEFAULT NULL,
  `status` tinyint(2) unsigned DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-02 17:25:55
