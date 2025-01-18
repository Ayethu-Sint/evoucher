-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: evoucher
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `authority` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'user1','ROLE_USER'),(2,'admin','ROLE_ADMIN'),(3,'user1','ROLE_USER'),(4,'admin','ROLE_ADMIN'),(5,'user1','ROLE_USER'),(6,'admin','ROLE_ADMIN');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_voucher`
--

DROP TABLE IF EXISTS `e_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_voucher` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb3_general_mysql500_ci DEFAULT NULL,
  `description` text COLLATE utf8mb3_general_mysql500_ci DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb3_general_mysql500_ci DEFAULT NULL,
  `amount` double(20,3) NOT NULL,
  `payment_method` varchar(45) COLLATE utf8mb3_general_mysql500_ci NOT NULL,
  `payment_discount_percentage` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `buy_type` varchar(50) COLLATE utf8mb3_general_mysql500_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_general_mysql500_ci DEFAULT NULL,
  `phone_number` varchar(25) COLLATE utf8mb3_general_mysql500_ci DEFAULT NULL,
  `max_limit_per_user` int(11) DEFAULT NULL,
  `gift_limit_per_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_voucher`
--

LOCK TABLES `e_voucher` WRITE;
/*!40000 ALTER TABLE `e_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `item_name` varchar(45) NOT NULL,
  `item_description` text DEFAULT NULL,
  `price` double(20,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `header_id` bigint(64) NOT NULL,
  `payment_type_id` bigint(64) NOT NULL,
  `amount` double(20,3) NOT NULL,
  PRIMARY KEY (`id`,`header_id`,`payment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_details` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `header_id` bigint(64) NOT NULL,
  `item_id` bigint(64) NOT NULL,
  `price` double(20,3) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(20,3) NOT NULL,
  `dis_amount` double(20,3) DEFAULT NULL,
  PRIMARY KEY (`id`,`header_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_header`
--

DROP TABLE IF EXISTS `payment_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_header` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `total_amount` double(20,3) DEFAULT NULL,
  `total_dis_amount` double(20,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_header`
--

LOCK TABLES `payment_header` WRITE;
/*!40000 ALTER TABLE `payment_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `payment_code` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_mysql500_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_mysql500_ci DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo_code`
--

DROP TABLE IF EXISTS `promo_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promo_code` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `voucher_id` bigint(64) NOT NULL,
  `qr_code_image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `used` bit(1) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo_code`
--

LOCK TABLES `promo_code` WRITE;
/*!40000 ALTER TABLE `promo_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `access_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pddrhgwxnms2aceeku9s2ewy5` (`access_token`),
  KEY `FKiblu4cjwvyntq3ugo31klp1c6` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','$2a$10$cXuOqg76TNvcyOVo5FmRNueaTsxN0HV7v6YXAvnqigglBp/5i/pUm',''),(2,'admin','$2a$10$cZ6IqEcFKiZu/jJQvGtNeeaSRY3pJ0f1YxV1DAXtIOVCXUpWjHubS',''),(3,'user1','$2a$10$IattrBS0GlLIFvOdD.VkkeuHnC1cokJ13vqLpNbYh7AkiXxCzQAQK',''),(4,'admin','$2a$10$lcXY8LTrRrp5vglB/TsLSe7vBT6iIfjdoxAo7S1waVZEN.KqFU9W.',''),(5,'user1','$2a$10$60L0iNbTEUz76YMVyzm8Au/xtdokWVkj0O4XUc8pNFgxawH9Z3zl2',''),(6,'admin','$2a$10$oIOIJKWV0OHy94DRHGGlxuLfrpHhbLfqgEHjdtEGZM4HCVb2nmBDK','');
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

-- Dump completed on 2025-01-18 22:55:10
