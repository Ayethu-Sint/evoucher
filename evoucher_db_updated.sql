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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'user1','ROLE_USER'),(2,'admin','ROLE_ADMIN'),(3,'user1','ROLE_USER'),(4,'admin','ROLE_ADMIN'),(5,'user1','ROLE_USER'),(6,'admin','ROLE_ADMIN'),(7,'user1','ROLE_USER'),(8,'admin','ROLE_ADMIN'),(9,'user1','ROLE_USER'),(10,'admin','ROLE_ADMIN'),(11,'user1','ROLE_USER'),(12,'admin','ROLE_ADMIN'),(13,'user1','ROLE_USER'),(14,'admin','ROLE_ADMIN'),(15,'user1','ROLE_USER'),(16,'admin','ROLE_ADMIN'),(17,'user1','ROLE_USER'),(18,'admin','ROLE_ADMIN'),(19,'user1','ROLE_USER'),(20,'admin','ROLE_ADMIN'),(21,'user1','ROLE_USER'),(22,'admin','ROLE_ADMIN'),(23,'user1','ROLE_USER'),(24,'admin','ROLE_ADMIN'),(25,'user1','ROLE_USER'),(26,'admin','ROLE_ADMIN'),(27,'user1','ROLE_USER'),(28,'admin','ROLE_ADMIN'),(29,'user1','ROLE_USER'),(30,'admin','ROLE_ADMIN'),(31,'user1','ROLE_USER'),(32,'admin','ROLE_ADMIN'),(33,'user1','ROLE_USER'),(34,'admin','ROLE_ADMIN'),(35,'user1','ROLE_USER'),(36,'admin','ROLE_ADMIN'),(37,'user1','ROLE_USER'),(38,'admin','ROLE_ADMIN'),(39,'user1','ROLE_USER'),(40,'admin','ROLE_ADMIN'),(41,'user1','ROLE_USER'),(42,'admin','ROLE_ADMIN'),(43,'user1','ROLE_USER'),(44,'admin','ROLE_ADMIN'),(45,'user1','ROLE_USER'),(46,'admin','ROLE_ADMIN'),(47,'user1','ROLE_USER'),(48,'admin','ROLE_ADMIN'),(49,'user1','ROLE_USER'),(50,'admin','ROLE_ADMIN'),(51,'user1','ROLE_USER'),(52,'admin','ROLE_ADMIN'),(53,'user1','ROLE_USER'),(54,'admin','ROLE_ADMIN'),(55,'user1','ROLE_USER'),(56,'admin','ROLE_ADMIN'),(57,'user1','ROLE_USER'),(58,'admin','ROLE_ADMIN'),(59,'user1','ROLE_USER'),(60,'admin','ROLE_ADMIN'),(61,'user1','ROLE_USER'),(62,'admin','ROLE_ADMIN'),(63,'user1','ROLE_USER'),(64,'admin','ROLE_ADMIN'),(65,'user1','ROLE_USER'),(66,'admin','ROLE_ADMIN'),(67,'user1','ROLE_USER'),(68,'admin','ROLE_ADMIN'),(69,'user1','ROLE_USER'),(70,'admin','ROLE_ADMIN'),(71,'user1','ROLE_USER'),(72,'admin','ROLE_ADMIN'),(73,'user1','ROLE_USER'),(74,'admin','ROLE_ADMIN'),(75,'user1','ROLE_USER'),(76,'admin','ROLE_ADMIN'),(77,'user1','ROLE_USER'),(78,'admin','ROLE_ADMIN');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_voucher`
--

LOCK TABLES `e_voucher` WRITE;
/*!40000 ALTER TABLE `e_voucher` DISABLE KEYS */;
INSERT INTO `e_voucher` VALUES (1,'Buy One Get One Free','Get two items for the price of one!','2025-12-31 00:00:00','https://example.com/images/evoucher.png',10.000,'VISA',20,2,'MySelf_Only','John Doe','+1234567890',5,3,'2025-01-19 03:07:20','2025-01-19 03:07:20','\0'),(2,'Buy One Get One Free','Get two items for the price of one!','2025-12-31 00:00:00','https://example.com/images/evoucher.png',10.000,'VISA',20,2,'MySelf_Only','John Doe','+1234567890',5,3,'2025-01-19 06:43:20','2025-01-19 06:43:20','');
/*!40000 ALTER TABLE `e_voucher` ENABLE KEYS */;
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
  `used` bit(1) DEFAULT b'0',
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`voucher_id`),
  KEY `id_idx` (`voucher_id`),
  CONSTRAINT `id` FOREIGN KEY (`voucher_id`) REFERENCES `e_voucher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo_code`
--

LOCK TABLES `promo_code` WRITE;
/*!40000 ALTER TABLE `promo_code` DISABLE KEYS */;
INSERT INTO `promo_code` VALUES (1,'901424XAGXC',1,'/QrCodes/901424XAGXC.png','2025-01-19 02:48:01','','+1234567890'),(2,'501309QCUIT',1,'/QrCodes/501309QCUIT.png','2025-01-19 02:48:01','\0','+1234567890'),(3,'051560SVKGU',2,'/QrCodes/051560SVKGU.png','2025-01-19 06:43:20','','+1234567890'),(4,'044173MVVJY',2,'/QrCodes/044173MVVJY.png','2025-01-19 06:43:20','\0','+1234567890');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (2,'2025-01-19 15:07:59','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczNzIxMjg3OSwiZXhwIjoxNzM3Mjk5Mjc5fQ.OKOsuWdGphBW6mXxmuKIApH2H6Pyr20BOe10VFIz3sQ');
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','$2a$10$cXuOqg76TNvcyOVo5FmRNueaTsxN0HV7v6YXAvnqigglBp/5i/pUm',''),(2,'admin','$2a$10$cZ6IqEcFKiZu/jJQvGtNeeaSRY3pJ0f1YxV1DAXtIOVCXUpWjHubS',''),(3,'user1','$2a$10$IattrBS0GlLIFvOdD.VkkeuHnC1cokJ13vqLpNbYh7AkiXxCzQAQK',''),(4,'admin','$2a$10$lcXY8LTrRrp5vglB/TsLSe7vBT6iIfjdoxAo7S1waVZEN.KqFU9W.',''),(5,'user1','$2a$10$60L0iNbTEUz76YMVyzm8Au/xtdokWVkj0O4XUc8pNFgxawH9Z3zl2',''),(6,'admin','$2a$10$oIOIJKWV0OHy94DRHGGlxuLfrpHhbLfqgEHjdtEGZM4HCVb2nmBDK',''),(7,'user1','$2a$10$2wMJ9UQTEkfuSDbvcTTgju5yFRpMiKpkt4/fKM4Bze2RrDaMuUa2O',''),(8,'admin','$2a$10$1XMvBdDDTQ/gmcuQQEdZiuZ6TMu7FrVqsfTxdfAgGEziPHHW3xp3y',''),(9,'user1','$2a$10$ZjNC.ZVa/ssmAAUXsiss7uylREbSzq9uKPCOtgCRyGVmmVD9WfJya',''),(10,'admin','$2a$10$trvKZgCBseGKO5rtkSgqyOEwjF.fg0TN86tElQLER8jNDUPB/NYcm',''),(11,'user1','$2a$10$qQTEFtEBlcYsLJmC8hHBB.7TjdadJOxqD0G0iCNrlKH5CXgloOAAa',''),(12,'admin','$2a$10$StJV8y7E3ylcKUTyPulEfuECqAXoMOeMDqcL5BYsNRJYsAblTEkLa',''),(13,'user1','$2a$10$6mofpNrYoAXdS45TyB/RPOTVziGlCrDfa3QDmlgd7GCn2Q6iLk8Xi',''),(14,'admin','$2a$10$4OU3VBtPCOX7AwCR3yKaJO5xOMR/gVdzKbo4mQP.ZEWJgjBpTptfG',''),(15,'user1','$2a$10$m9A8qj7In88B8AN.gg8An.yxJk1SevhYV6eKHPLAe5EF/LqwBqb0K',''),(16,'admin','$2a$10$sqcOij4wZBXyaXDSqv8.VeG8Vc/XkL0fMaBOXyipLMVLEizfkZM6G',''),(17,'user1','$2a$10$OPAleD2tked3DFLk2zhCbuHzJII9JJteSCUA9FvecgubL1JXJ6p36',''),(18,'admin','$2a$10$4bOuab00naVKVJ7h3qBS/uX0iwtt5xLNY7zuN/mKHoDyPhA0enwR.',''),(19,'user1','$2a$10$VcDgqiak2dZa0.qSXlvyBujEzeZuNtE3eGDn47tO6iz8x43lgCeHm',''),(20,'admin','$2a$10$6tjQLsK/8EunWunShsBb8Ou5rl84zXLmfIvB/ryrf/LFzRZ.YVpGK',''),(21,'user1','$2a$10$ah.Es0DDK0zmsNZDzzJchOZiUAHHvNcyVmPi9zdBiLyklSHFzessW',''),(22,'admin','$2a$10$KVTUs6F.vSWLYilTN4O6OehBmxASqtD9qQgZJVEPWtumuZDY31uVG',''),(23,'user1','$2a$10$TnF6wiKRZ3TlliXn4rU8z.uPO4NuuQxv.t499F70V7tGNINWI.oM6',''),(24,'admin','$2a$10$MGuIsM0c4LxbygPQSzkcC.MRVjWoGorb2cg3D6lqE.0PCiO8JyPqe',''),(25,'user1','$2a$10$Ly99QsYFsJ0YZT4c/Uz5Q.7gcPsnOGtcs5UJ1vzjlEkYfaHS2TkYW',''),(26,'admin','$2a$10$b03qntW2A9acL8Ah382xSO9v8ZSYVJslg3LVoidLei4HIqL7QETBa',''),(27,'user1','$2a$10$0jefJqmY0b2WuiEflYnBtuAA9uOdmmyyT6xTXxHEx4vVX4yy/u.TO',''),(28,'admin','$2a$10$Iru1uKrD.8ebnDOPzDEuvOG1nR.4reAAFZ3JdN0ae/tg0/PvRoEBK',''),(29,'user1','$2a$10$F5Qh7LWzdBwFq2BZvRVENetZDlrC5P.FWxTr0EUpNMGeWqZ4jIiQG',''),(30,'admin','$2a$10$UN9bV0ZL9.EbFQ9z61ziC.oNLeHIP.eB0idVKQvtk9vVGIdQemgg2',''),(31,'user1','$2a$10$A1l02MptQeOly94Ew8WE1uzrsWggJfuFwnMfROGVkPjV/fzHzxGdm',''),(32,'admin','$2a$10$2Pz1xbaXUfnCywqHnIwBturaXTvsPTmBWzzAj2NoeFq/.yqCYCvLS',''),(33,'user1','$2a$10$63cP4YgzxINoch25JH7S.u5C8d/ltL1MocW/f8zjquGSQfBt1LRO2',''),(34,'admin','$2a$10$M1OmSzeL5hwxP1kzbfoyEel8zHqGG8dcWaLZVYj6/Af.wu0xBspDu',''),(35,'user1','$2a$10$4OCa1FhnPWo3udUCKhQtfeB8Sy6ydkJzz6vO9dluNz.HtlnFXOv22',''),(36,'admin','$2a$10$MyDSTNxMqATX2Us3E95OYu2tLyaexCkuBI2o1eQ7UAxAwZxJEmqPW',''),(37,'user1','$2a$10$qQ0Z0kAcmD6dnVg/qUXHZuXFAnhcFx3/.dv4GfqpljsFcEoYlYlEK',''),(38,'admin','$2a$10$lnMKlyC7gMNjTHgYe9FjsuujHrZeqTUZEU.SnMLyPJAV082dcbVBi',''),(39,'user1','$2a$10$gWezetvQYoDVowz0eEsVJunhL6Z3KBEXjohouDpz9oQ1.BkH5y5BK',''),(40,'admin','$2a$10$6Si5mywyBBJHdIzr96vQ/uaVMZsb.UqViUwb9UEsmthtb8PexHlhe',''),(41,'user1','$2a$10$q.1Q.VPoJgfn3AEywQqf3OPtpkCggByHusg5ZM.0K1WRBoulPPnU2',''),(42,'admin','$2a$10$ZvEkMaSu1atc7fRUZTT9Huae1aSnKbTwltha6.uRo.t68JbVinX3y',''),(43,'user1','$2a$10$G1L/gxUEnVVZwwNF111wi.t38fcwdP4JhuJ.wVwRrMoyq25M/BjCq',''),(44,'admin','$2a$10$iwM6khntSJ5bVbncT.qsYOeIhKpB6ilusdSsymo8v1NFFXGWcwjLu',''),(45,'user1','$2a$10$7kvb2LtddTxI9Ph28it6VOhKiZN1LBAJKkf7kA9joaei8paT8KKJy',''),(46,'admin','$2a$10$yjq2Or3xahwJwDo481UgeObsfyBRbDc89jSl6VmTIXgjjO6UKDK0.',''),(47,'user1','$2a$10$KufHQNcCXPt97J8hOv7Dye8Wb/sxpNciS.DYSWnPSKQ.JWENrEc9y',''),(48,'admin','$2a$10$2p.vhvzc6Upmky9vOsc3UObDHyzwKvs7gDd4yAF0PaD34KBPSfE82',''),(49,'user1','$2a$10$T9WpnJ5YCTxMpSNLmbiVG.U7p4xoJxIWVWYgA9V8.F9GUdaxubhom',''),(50,'admin','$2a$10$ZOpRLI4GRP7lrFgDnDFbcu8GHEEphMFG0ga4xMMVYi.MLTrkuoKqe',''),(51,'user1','$2a$10$.l54ZTp7DEkwQSy2suU8g.GSSBdWN6wx8gJfeJS5NzBWzYCYETRCS',''),(52,'admin','$2a$10$uW3JXtpCQ/aAPUjkkiaNcuv.emlilNvgAc/4dji6jrzWptfmEZkXG',''),(53,'user1','$2a$10$9OA8Sssh8QiOjTWML/m4a.sKa0BqKT0FLPww8sbegELTYOTEmH2BK',''),(54,'admin','$2a$10$lxRKpyibSivdTj7jv7KmW.n7rpkLbEJXEzVqUBwjrUqeJpCNLLmmO',''),(55,'user1','$2a$10$oo9ZmfpLpUp7UZa3N8O5iunBUg8GTjmMAdE4YQJ9XuZHh3SfaEj4.',''),(56,'admin','$2a$10$yW8fpDJS1vMjtj8aa2S9tupIFbSu4/NYRSb2TLFggHf0bwsOj1HgG',''),(57,'user1','$2a$10$nGGfcBmqp5KI9L.IvW/0UOPmo/uN6ysVlR84Qq7gM25IhtHwdzuua',''),(58,'admin','$2a$10$UzYkGl/wVBLBbqY1gTyb8uFPM2sELapLm4Kj11Ueeh7CO32UeXlfm',''),(59,'user1','$2a$10$B9Yyw3g2CC44/UfR.MAaZO5i2XzWCeh24rvCvAEMNwT6Nod026DNS',''),(60,'admin','$2a$10$Vdd6VqnWHwpirIWxMYLpSu/VNITwJudcccBSWjdnJmQJH8DgV5TJm',''),(61,'user1','$2a$10$8Ka9/LjTS/NpH8xfqKnHwOe8.d6wTNLbXe/bUUDhyBk4EM8EVS6eq',''),(62,'admin','$2a$10$k3VA7.DLuAJGVoyuqjReQuZzl49jgN8tc8SakbMws7auDSBZ7OdhK',''),(63,'user1','$2a$10$jNxriXyq59afAA8WL/BQeOWCCEpFqrDsyktGL3ZGs8.NiU9g9akZi',''),(64,'admin','$2a$10$xcwaH6cigNjOazGpk0gdkuzCV24wCWLiyXuEMp14MNFvxV8SsNgym',''),(65,'user1','$2a$10$/wkId0Z5JZFZLQJHwlnWdOzWwRC6CNoDUspVTSVoJvsAyMuiOfvgK',''),(66,'admin','$2a$10$W2TsQS07AHUuPhwEgFHM7uxS7Gcq8.GPZZA55I12GEsVSMo4IL1qC',''),(67,'user1','$2a$10$Sbu3Ho0rbezpB9z2iSk0JeFpniYVBdaGfy2lmASTWHnXlbUV6USvO',''),(68,'admin','$2a$10$t9E.x1C1V3658kBlBgeffO3OzItOxr0u8cHeBEKsTe2C32l5RcUaW',''),(69,'user1','$2a$10$W1oHrZtW1WP3pOfhEzlFVe39HxfsuQG7.3vtxrbKInkEv7KRmHI1i',''),(70,'admin','$2a$10$B1ND8T04bjOAv5T3zs2n0egDJ5bztAlaIgOhLPQ6LO2cs2dLXtRT2',''),(71,'user1','$2a$10$0tYYBvBDE41My9mZVISjye9HN8qKURifoPEkAxRsSBP3GVoOgvdKm',''),(72,'admin','$2a$10$HFa7CZFSLad6m3EWCnpKR.U9GuD3AHKJa8Da4U44Fmj1sFzghj8Ha',''),(73,'user1','$2a$10$yz1qOl6m5FPW96Mk/UgJu.7iZrq7mypgWzeUuWN63wYLhw.cLH2uK',''),(74,'admin','$2a$10$WJr8m94XTCsK0XV4RMamEuu6TJdqBQHcfCsdxbQ6d.SMA2uIRpjLm',''),(75,'user1','$2a$10$uFzmukTISCYfCGmBSd8R/.55AIXpWr74.NNmn7Uc5aqFdlLi0P9Ru',''),(76,'admin','$2a$10$8itHZiiW/cDpYvy95wnqoeu8jzH95zB9gvJcVHVs9Qp2/GJ46zV8C',''),(77,'user1','$2a$10$70MXPhmLaIEKOImqW8dzbu3IHa9LhmeP7lqlMTgcjz4wAoNrBe0FC',''),(78,'admin','$2a$10$r89es8tpvC4akHYk6VljD.HeabbmL4yWqZg/7KTlzkfHl/IzIVnK2','');
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

-- Dump completed on 2025-01-19 16:45:44
