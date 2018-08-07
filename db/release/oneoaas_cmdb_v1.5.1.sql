-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: cmdb_v15
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `access_key`
--

DROP TABLE IF EXISTS `access_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `access_key_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `access_key_secret` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `is_disable` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `expire_time` bigint(20) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_key`
--

LOCK TABLES `access_key` WRITE;
/*!40000 ALTER TABLE `access_key` DISABLE KEYS */;
INSERT INTO `access_key` VALUES (31,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDc5OTU4MDcwLCJpYXQiOjE0NzkzNTMyNzAsInVzZXJuYW1lIjoiYWRtaW4ifQ.MfKe_lNcGx2abvKsDO-YJBrQ_az0ENIiNAP6wACay10',0,0,1479958070,'2016-11-17 11:27:50'),(32,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNDA5MjU3LCJpYXQiOjE0Nzk4MDQ0NTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.LIWP-HJk8pgqwPWo4GDhaHvVxz2s_Ntu2S8MAUxpUtI',0,0,1480409257,'2016-11-22 16:47:37'),(34,13,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNDkzMzAwLCJpYXQiOjE0Nzk4ODg1MDAsInVzZXJuYW1lIjoiV1dXIn0.x2DPmgwddlUxRHu6Uxv-VkS--muQIz1KpcJlwIevYAo',0,0,1480493300,'2016-11-23 16:08:21'),(36,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTAwNDUxLCJpYXQiOjE0Nzk4OTU2NTEsInVzZXJuYW1lIjoiYWRtaW4ifQ.EEOcQBWIlDiITWNScWLqZIeBg_Lw5ks2DIPb_mTCcYg',0,0,1480500451,'2016-11-23 18:07:32'),(37,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTAwNDUzLCJpYXQiOjE0Nzk4OTU2NTMsInVzZXJuYW1lIjoiYWRtaW4ifQ.xRXfpKww1W_ZyWotDAJUhTMdESzfn0UcNJPChIBr90I',0,0,1480500453,'2016-11-23 18:07:34'),(38,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTAwNDU2LCJpYXQiOjE0Nzk4OTU2NTYsInVzZXJuYW1lIjoiYWRtaW4ifQ.4_Y6H2C6BEKCoZCCyCrrx9Ox_eMStHikIdppEfgdRRs',0,0,1480500456,'2016-11-23 18:07:36'),(39,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTAwNDYwLCJpYXQiOjE0Nzk4OTU2NjAsInVzZXJuYW1lIjoiYWRtaW4ifQ.u80jxJ5hSSwPtaxW1eA6p1cEIJAlOhIbKEBVfMLOqNw',0,0,1480500460,'2016-11-23 18:07:40'),(40,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTAwNDYyLCJpYXQiOjE0Nzk4OTU2NjIsInVzZXJuYW1lIjoiYWRtaW4ifQ.AmXItf0BxUBEfkIn4lvwO10d2vz95ocqybPVeWcDAUQ',0,0,1480500462,'2016-11-23 18:07:42'),(41,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTAwNDcwLCJpYXQiOjE0Nzk4OTU2NzAsInVzZXJuYW1lIjoiYWRtaW4ifQ.SET34jFI4DTTRinOUoUL0giRFF4T5CC7A0NVgKVvoZg',0,0,1480500470,'2016-11-23 18:07:51'),(43,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTAwNDc1LCJpYXQiOjE0Nzk4OTU2NzUsInVzZXJuYW1lIjoiYWRtaW4ifQ.yXEI3MryGL8eIhmazMqODr12IU3JI1M5Hm2yHjJpvG4',0,0,1480500475,'2016-11-23 18:07:56'),(44,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTAwNDc5LCJpYXQiOjE0Nzk4OTU2NzksInVzZXJuYW1lIjoiYWRtaW4ifQ.obQxYxJ47I60ZxbtN1o-rJ7ubhvJS7n2C1D-AkOiqbc',0,0,1480500479,'2016-11-23 18:07:59'),(45,1,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTAwNDgyLCJpYXQiOjE0Nzk4OTU2ODIsInVzZXJuYW1lIjoiYWRtaW4ifQ.7RYXwspZ3cVmsJZM6Ca9F_CSCvth8q3yUhx30bZ6S34',0,0,1480500482,'2016-11-23 18:08:02'),(46,9,'frontend','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDgwNTc1MzY4LCJpYXQiOjE0Nzk5NzA1NjgsInVzZXJuYW1lIjoieXV5YW5neWFuZyJ9.0nTHF7aRWLLhOUdwGLoV0sXa41f1rGJe5wMBfDt2pgk',0,0,1480575368,'2016-11-24 14:56:08');
/*!40000 ALTER TABLE `access_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agreement`
--

DROP TABLE IF EXISTS `agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agreement` (
  `agreementid` bigint(20) NOT NULL AUTO_INCREMENT,
  `agreement_name` varchar(100) NOT NULL DEFAULT '',
  `agreement_no` varchar(100) NOT NULL DEFAULT '',
  `agreement_price` bigint(20) DEFAULT NULL,
  `agreement_sign_date` datetime DEFAULT NULL,
  `agreement_start_date` datetime DEFAULT NULL,
  `agreement_stop_date` datetime DEFAULT NULL,
  `agreement_signer` varchar(100) DEFAULT NULL,
  `agreement_path` varchar(100) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`agreementid`),
  UNIQUE KEY `agreement_name` (`agreement_name`),
  UNIQUE KEY `agreement_no` (`agreement_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreement`
--

LOCK TABLES `agreement` WRITE;
/*!40000 ALTER TABLE `agreement` DISABLE KEYS */;
INSERT INTO `agreement` VALUES (1,'ä¸­å›½å»ºæåˆåŒ','wan',111,NULL,NULL,NULL,'test','www/Ansibleç¬”è®°.pdf','test',4,1,1,'2016-11-24 19:00:00','','','2016-11-24 11:10:27');
/*!40000 ALTER TABLE `agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agreement_state`
--

DROP TABLE IF EXISTS `agreement_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agreement_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreement_state`
--

LOCK TABLES `agreement_state` WRITE;
/*!40000 ALTER TABLE `agreement_state` DISABLE KEYS */;
INSERT INTO `agreement_state` VALUES (1,'å·²ç­¾è®¢',0,'2016-06-09 22:50:12','han','han','2016-11-23 13:18:07'),(2,'å–æ¶ˆ',0,'2016-05-30 15:50:52','han','han','2016-05-30 15:50:59'),(6,'å¾…å¤„ç†',0,'2016-11-22 13:36:13','','','2016-11-22 13:36:13'),(9,'æ— æ³•æ‰§è¡Œ',0,'2016-11-22 13:50:05','','','2016-11-22 13:50:05'),(11,'åé¦ˆæ¶ˆæ¯ä¸­',0,'2016-11-22 13:56:03','','','2016-11-22 13:56:03'),(16,'åˆ é™¤',0,'2016-11-22 14:39:02','','','2016-11-22 14:39:02'),(82,'å¾…å®š',0,'2016-11-24 10:12:10','','','2016-11-24 10:12:10'),(83,'æ— æ³•å¤„ç†',0,'2016-11-24 10:12:38','','','2016-11-24 10:12:38');
/*!40000 ALTER TABLE `agreement_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app` (
  `appid` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) DEFAULT NULL,
  `app_parent_id` bigint(20) DEFAULT NULL,
  `teamown` varchar(256) DEFAULT NULL,
  `devown` varchar(256) DEFAULT NULL,
  `opsown` varchar(256) DEFAULT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `level_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
INSERT INTO `app` VALUES (35,'é—¨æˆ·ç½‘ç«™ä¸»ç«™A',0,'admin','admin','admin','test',3,1,'0000-00-00 00:00:00','','','2016-10-31 18:01:37'),(36,'è®¢å•ç³»ç»Ÿä¸»ç«™1',0,'admin','admin','admin','test',1,1,'0000-00-00 00:00:00','','','2016-10-31 18:01:57'),(37,'OpenAPIæ¥å£',0,'aaaaaa','bbbbb','dddddd','dretgtyeefdd',4,1,'2016-09-19 09:30:58','','','2016-10-31 18:02:19'),(39,'2112121',0,'','','','',1,0,'2016-11-23 15:27:54','','','2016-11-23 15:27:54'),(40,'1213',0,'','','','',1,0,'2016-11-23 15:33:54','','','2016-11-23 15:33:54'),(41,'221',0,'','','','',1,0,'2016-11-23 15:38:17','','','2016-11-23 15:38:17');
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_level`
--

DROP TABLE IF EXISTS `app_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_level`
--

LOCK TABLES `app_level` WRITE;
/*!40000 ALTER TABLE `app_level` DISABLE KEYS */;
INSERT INTO `app_level` VALUES (1,0,'2016-06-02 10:32:33','admin','admin','2016-06-02 10:32:46','ä¸€çº§ä¸šåŠ¡'),(2,0,'2016-06-02 10:33:29','admin','admin','2016-06-02 10:33:38','äºŒçº§ä¸šåŠ¡'),(3,0,'2016-06-02 10:35:25','admin','admin','2016-06-02 10:35:32','ä¸‰çº§ä¸šåŠ¡'),(4,0,'2016-06-02 10:35:49','admin','admin','2016-06-02 10:35:57','å››çº§ä¸šåŠ¡'),(5,0,'2016-06-02 10:36:38','admin','admin','2016-06-02 10:36:49','äº”çº§ä¸šåŠ¡');
/*!40000 ALTER TABLE `app_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asserts`
--

DROP TABLE IF EXISTS `asserts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asserts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `description` varchar(60) NOT NULL DEFAULT '',
  `inherits` tinyint(1) NOT NULL DEFAULT '0',
  `superclass` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `icon` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asserts`
--

LOCK TABLES `asserts` WRITE;
/*!40000 ALTER TABLE `asserts` DISABLE KEYS */;
INSERT INTO `asserts` VALUES (1,'datacenter','æ•°æ®ä¸­å¿ƒèµ„æº',0,0,0,0,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00',''),(2,'ipam','IPAMèµ„æº',0,0,0,0,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00',''),(3,'business','ä¸šåŠ¡èµ„æº',0,0,0,0,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00',''),(4,'virtualization','è™šæ‹ŸåŒ–èµ„æº',0,0,0,0,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00',''),(5,'cloud','äº‘èµ„æº',0,0,0,0,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00',''),(6,'supplier','ä¾›åº”å•†èµ„æº',0,0,0,0,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `asserts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asserts_instance`
--

DROP TABLE IF EXISTS `asserts_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asserts_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `inherits` tinyint(1) NOT NULL DEFAULT '1',
  `superclass` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `asserts_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `updateby` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `icon` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asserts_instance`
--

LOCK TABLES `asserts_instance` WRITE;
/*!40000 ALTER TABLE `asserts_instance` DISABLE KEYS */;
INSERT INTO `asserts_instance` VALUES (1,'datacenter','æ•°æ®ä¸­å¿ƒ',1,0,1,1,1,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-crosshairs'),(2,'room','æœºæˆ¿',1,0,1,1,1,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-home'),(3,'rack','æœºæŸœ',1,0,1,1,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-dropbox'),(4,'bandwidth','å¸¦å®½',1,0,1,1,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-signal'),(5,'hardware','ç¡¬ä»¶',1,0,1,1,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-bars'),(6,'server','æœåŠ¡å™¨',1,0,1,1,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-sitemap'),(7,'ip','IP',1,0,1,2,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-map-marker'),(8,'domain','åŸŸå',1,0,1,2,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-globe'),(9,'app','ä¸šåŠ¡æ¨¡å—',1,0,1,3,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-calendar'),(10,'vcenter','Vcenter',1,0,1,4,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-th-large'),(11,'aliyun','é˜¿é‡Œäº‘',1,0,1,5,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-cloud'),(12,'aws','AWS',1,0,1,5,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-unlink'),(13,'supplier','ä¾›åº”å•†',1,0,1,6,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-user'),(14,'agreement','åˆåŒ',1,0,1,100,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00','fa-gavel');
/*!40000 ALTER TABLE `asserts_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_index` bigint(20) NOT NULL DEFAULT '0',
  `province_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1,1,'åŒ—äº¬å¸‚'),(2,1,2,'å¤©æ´¥å¸‚'),(3,1,3,'ä¸Šæµ·å¸‚'),(4,1,4,'é‡åº†å¸‚'),(5,1,5,'çŸ³å®¶åº„å¸‚'),(6,2,5,'å”å±±å¸‚'),(7,3,5,'ç§¦çš‡å²›å¸‚'),(8,4,5,'é‚¯éƒ¸å¸‚'),(9,5,5,'é‚¢å°å¸‚'),(10,6,5,'ä¿å®šå¸‚'),(11,7,5,'å¼ å®¶å£å¸‚'),(12,8,5,'æ‰¿å¾·å¸‚'),(13,9,5,'æ²§å·å¸‚'),(14,10,5,'å»ŠåŠå¸‚'),(15,11,5,'è¡¡æ°´å¸‚'),(16,1,6,'å¤ªåŸå¸‚'),(17,2,6,'å¤§åŒå¸‚'),(18,3,6,'é˜³æ³‰å¸‚'),(19,4,6,'é•¿æ²»å¸‚'),(20,5,6,'æ™‹åŸå¸‚'),(21,6,6,'æœ”å·å¸‚'),(22,7,6,'æ™‹ä¸­å¸‚'),(23,8,6,'è¿åŸå¸‚'),(24,9,6,'å¿»å·å¸‚'),(25,10,6,'ä¸´æ±¾å¸‚'),(26,11,6,'å•æ¢å¸‚'),(27,1,7,'å°åŒ—å¸‚'),(28,2,7,'é«˜é›„å¸‚'),(29,3,7,'åŸºéš†å¸‚'),(30,4,7,'å°ä¸­å¸‚'),(31,5,7,'å°å—å¸‚'),(32,6,7,'æ–°ç«¹å¸‚'),(33,7,7,'å˜‰ä¹‰å¸‚'),(34,8,7,'å°åŒ—å¿'),(35,9,7,'å®œå…°å¿'),(36,10,7,'æ¡ƒå›­å¿'),(37,11,7,'æ–°ç«¹å¿'),(38,12,7,'è‹—æ —å¿'),(39,13,7,'å°ä¸­å¿'),(40,14,7,'å½°åŒ–å¿'),(41,15,7,'å—æŠ•å¿'),(42,16,7,'äº‘æ—å¿'),(43,17,7,'å˜‰ä¹‰å¿'),(44,18,7,'å°å—å¿'),(45,19,7,'é«˜é›„å¿'),(46,20,7,'å±ä¸œå¿'),(47,21,7,'æ¾æ¹–å¿'),(48,22,7,'å°ä¸œå¿'),(49,23,7,'èŠ±è²å¿'),(50,1,8,'æ²ˆé˜³å¸‚'),(51,2,8,'å¤§è¿å¸‚'),(52,3,8,'éå±±å¸‚'),(53,4,8,'æŠšé¡ºå¸‚'),(54,5,8,'æœ¬æºªå¸‚'),(55,6,8,'ä¸¹ä¸œå¸‚'),(56,7,8,'é”¦å·å¸‚'),(57,8,8,'è¥å£å¸‚'),(58,9,8,'é˜œæ–°å¸‚'),(59,10,8,'è¾½é˜³å¸‚'),(60,11,8,'ç›˜é”¦å¸‚'),(61,12,8,'é“å²­å¸‚'),(62,13,8,'æœé˜³å¸‚'),(63,14,8,'è‘«èŠ¦å²›å¸‚'),(64,1,9,'é•¿æ˜¥å¸‚'),(65,2,9,'å‰æ—å¸‚'),(66,3,9,'å››å¹³å¸‚'),(67,4,9,'è¾½æºå¸‚'),(68,5,9,'é€šåŒ–å¸‚'),(69,6,9,'ç™½å±±å¸‚'),(70,7,9,'æ¾åŸå¸‚'),(71,8,9,'ç™½åŸå¸‚'),(72,9,9,'å»¶è¾¹æœé²œæ—è‡ªæ²»å·'),(73,1,10,'å“ˆå°”æ»¨å¸‚'),(74,2,10,'é½é½å“ˆå°”å¸‚'),(75,3,10,'é¹¤å²—å¸‚'),(76,4,10,'åŒé¸­å±±å¸‚'),(77,5,10,'é¸¡è¥¿å¸‚'),(78,6,10,'å¤§åº†å¸‚'),(79,7,10,'ä¼Šæ˜¥å¸‚'),(80,8,10,'ç‰¡ä¸¹æ±Ÿå¸‚'),(81,9,10,'ä½³æœ¨æ–¯å¸‚'),(82,10,10,'ä¸ƒå°æ²³å¸‚'),(83,11,10,'é»‘æ²³å¸‚'),(84,12,10,'ç»¥åŒ–å¸‚'),(85,13,10,'å¤§å…´å®‰å²­åœ°åŒº'),(86,1,11,'å—äº¬å¸‚'),(87,2,11,'æ— é”¡å¸‚'),(88,3,11,'å¾å·å¸‚'),(89,4,11,'å¸¸å·å¸‚'),(90,5,11,'è‹å·å¸‚'),(91,6,11,'å—é€šå¸‚'),(92,7,11,'è¿äº‘æ¸¯å¸‚'),(93,8,11,'æ·®å®‰å¸‚'),(94,9,11,'ç›åŸå¸‚'),(95,10,11,'æ‰¬å·å¸‚'),(96,11,11,'é•‡æ±Ÿå¸‚'),(97,12,11,'æ³°å·å¸‚'),(98,13,11,'å®¿è¿å¸‚'),(99,1,12,'æ­å·å¸‚'),(100,2,12,'å®æ³¢å¸‚'),(101,3,12,'æ¸©å·å¸‚'),(102,4,12,'å˜‰å…´å¸‚'),(103,5,12,'æ¹–å·å¸‚'),(104,6,12,'ç»å…´å¸‚'),(105,7,12,'é‡‘åå¸‚'),(106,8,12,'è¡¢å·å¸‚'),(107,9,12,'èˆŸå±±å¸‚'),(108,10,12,'å°å·å¸‚'),(109,11,12,'ä¸½æ°´å¸‚'),(110,1,13,'åˆè‚¥å¸‚'),(111,2,13,'èŠœæ¹–å¸‚'),(112,3,13,'èšŒåŸ å¸‚'),(113,4,13,'æ·®å—å¸‚'),(114,5,13,'é©¬éå±±å¸‚'),(115,6,13,'æ·®åŒ—å¸‚'),(116,7,13,'é“œé™µå¸‚'),(117,8,13,'å®‰åº†å¸‚'),(118,9,13,'é»„å±±å¸‚'),(119,10,13,'æ»å·å¸‚'),(120,11,13,'é˜œé˜³å¸‚'),(121,12,13,'å®¿å·å¸‚'),(122,13,13,'å·¢æ¹–å¸‚'),(123,14,13,'å…­å®‰å¸‚'),(124,15,13,'äº³å·å¸‚'),(125,16,13,'æ± å·å¸‚'),(126,17,13,'å®£åŸå¸‚'),(127,1,14,'ç¦å·å¸‚'),(128,2,14,'å¦é—¨å¸‚'),(129,3,14,'è†ç”°å¸‚'),(130,4,14,'ä¸‰æ˜å¸‚'),(131,5,14,'æ³‰å·å¸‚'),(132,6,14,'æ¼³å·å¸‚'),(133,7,14,'å—å¹³å¸‚'),(134,8,14,'é¾™å²©å¸‚'),(135,9,14,'å®å¾·å¸‚'),(136,1,15,'å—æ˜Œå¸‚'),(137,2,15,'æ™¯å¾·é•‡å¸‚'),(138,3,15,'èä¹¡å¸‚'),(139,4,15,'ä¹æ±Ÿå¸‚'),(140,5,15,'æ–°ä½™å¸‚'),(141,6,15,'é¹°æ½­å¸‚'),(142,7,15,'èµ£å·å¸‚'),(143,8,15,'å‰å®‰å¸‚'),(144,9,15,'å®œæ˜¥å¸‚'),(145,10,15,'æŠšå·å¸‚'),(146,11,15,'ä¸Šé¥¶å¸‚'),(147,1,16,'æµå—å¸‚'),(148,2,16,'é’å²›å¸‚'),(149,3,16,'æ·„åšå¸‚'),(150,4,16,'æ£åº„å¸‚'),(151,5,16,'ä¸œè¥å¸‚'),(152,6,16,'çƒŸå°å¸‚'),(153,7,16,'æ½åŠå¸‚'),(154,8,16,'æµå®å¸‚'),(155,9,16,'æ³°å®‰å¸‚'),(156,10,16,'å¨æµ·å¸‚'),(157,11,16,'æ—¥ç…§å¸‚'),(158,12,16,'è±èŠœå¸‚'),(159,13,16,'ä¸´æ²‚å¸‚'),(160,14,16,'å¾·å·å¸‚'),(161,15,16,'èŠåŸå¸‚'),(162,16,16,'æ»¨å·å¸‚'),(163,17,16,'èæ³½å¸‚'),(164,1,17,'éƒ‘å·å¸‚'),(165,2,17,'å¼€å°å¸‚'),(166,3,17,'æ´›é˜³å¸‚'),(167,4,17,'å¹³é¡¶å±±å¸‚'),(168,5,17,'å®‰é˜³å¸‚'),(169,6,17,'é¹¤å£å¸‚'),(170,7,17,'æ–°ä¹¡å¸‚'),(171,8,17,'ç„¦ä½œå¸‚'),(172,9,17,'æ¿®é˜³å¸‚'),(173,10,17,'è®¸æ˜Œå¸‚'),(174,11,17,'æ¼¯æ²³å¸‚'),(175,12,17,'ä¸‰é—¨å³¡å¸‚'),(176,13,17,'å—é˜³å¸‚'),(177,14,17,'å•†ä¸˜å¸‚'),(178,15,17,'ä¿¡é˜³å¸‚'),(179,16,17,'å‘¨å£å¸‚'),(180,17,17,'é©»é©¬åº—å¸‚'),(181,18,17,'æµæºå¸‚'),(182,1,18,'æ­¦æ±‰å¸‚'),(183,2,18,'é»„çŸ³å¸‚'),(184,3,18,'åå °å¸‚'),(185,4,18,'è†å·å¸‚'),(186,5,18,'å®œæ˜Œå¸‚'),(187,6,18,'è¥„æ¨Šå¸‚'),(188,7,18,'é„‚å·å¸‚'),(189,8,18,'è†é—¨å¸‚'),(190,9,18,'å­æ„Ÿå¸‚'),(191,10,18,'é»„å†ˆå¸‚'),(192,11,18,'å’¸å®å¸‚'),(193,12,18,'éšå·å¸‚'),(194,13,18,'ä»™æ¡ƒå¸‚'),(195,14,18,'å¤©é—¨å¸‚'),(196,15,18,'æ½œæ±Ÿå¸‚'),(197,16,18,'ç¥å†œæ¶æ—åŒº'),(198,17,18,'æ©æ–½åœŸå®¶æ—è‹—æ—è‡ªæ²»å·'),(199,1,19,'é•¿æ²™å¸‚'),(200,2,19,'æ ªæ´²å¸‚'),(201,3,19,'æ¹˜æ½­å¸‚'),(202,4,19,'è¡¡é˜³å¸‚'),(203,5,19,'é‚µé˜³å¸‚'),(204,6,19,'å²³é˜³å¸‚'),(205,7,19,'å¸¸å¾·å¸‚'),(206,8,19,'å¼ å®¶ç•Œå¸‚'),(207,9,19,'ç›Šé˜³å¸‚'),(208,10,19,'éƒ´å·å¸‚'),(209,11,19,'æ°¸å·å¸‚'),(210,12,19,'æ€€åŒ–å¸‚'),(211,13,19,'å¨„åº•å¸‚'),(212,14,19,'æ¹˜è¥¿åœŸå®¶æ—è‹—æ—è‡ªæ²»å·'),(213,1,20,'å¹¿å·å¸‚'),(214,2,20,'æ·±åœ³å¸‚'),(215,3,20,'ç æµ·å¸‚'),(216,4,20,'æ±•å¤´å¸‚'),(217,5,20,'éŸ¶å…³å¸‚'),(218,6,20,'ä½›å±±å¸‚'),(219,7,20,'æ±Ÿé—¨å¸‚'),(220,8,20,'æ¹›æ±Ÿå¸‚'),(221,9,20,'èŒ‚åå¸‚'),(222,10,20,'è‚‡åº†å¸‚'),(223,11,20,'æƒ å·å¸‚'),(224,12,20,'æ¢…å·å¸‚'),(225,13,20,'æ±•å°¾å¸‚'),(226,14,20,'æ²³æºå¸‚'),(227,15,20,'é˜³æ±Ÿå¸‚'),(228,16,20,'æ¸…è¿œå¸‚'),(229,17,20,'ä¸œèå¸‚'),(230,18,20,'ä¸­å±±å¸‚'),(231,19,20,'æ½®å·å¸‚'),(232,20,20,'æ­é˜³å¸‚'),(233,21,20,'äº‘æµ®å¸‚'),(234,1,21,'å…°å·å¸‚'),(235,2,21,'é‡‘æ˜Œå¸‚'),(236,3,21,'ç™½é“¶å¸‚'),(237,4,21,'å¤©æ°´å¸‚'),(238,5,21,'å˜‰å³ªå…³å¸‚'),(239,6,21,'æ­¦å¨å¸‚'),(240,7,21,'å¼ æ–å¸‚'),(241,8,21,'å¹³å‡‰å¸‚'),(242,9,21,'é…’æ³‰å¸‚'),(243,10,21,'åº†é˜³å¸‚'),(244,11,21,'å®šè¥¿å¸‚'),(245,12,21,'é™‡å—å¸‚'),(246,13,21,'ä¸´å¤å›æ—è‡ªæ²»å·'),(247,14,21,'ç”˜å—è—æ—è‡ªæ²»å·'),(248,1,22,'æˆéƒ½å¸‚'),(249,2,22,'è‡ªè´¡å¸‚'),(250,3,22,'æ”€æèŠ±å¸‚'),(251,4,22,'æ³¸å·å¸‚'),(252,5,22,'å¾·é˜³å¸‚'),(253,6,22,'ç»µé˜³å¸‚'),(254,7,22,'å¹¿å…ƒå¸‚'),(255,8,22,'é‚å®å¸‚'),(256,9,22,'å†…æ±Ÿå¸‚'),(257,10,22,'ä¹å±±å¸‚'),(258,11,22,'å—å……å¸‚'),(259,12,22,'çœ‰å±±å¸‚'),(260,13,22,'å®œå®¾å¸‚'),(261,14,22,'å¹¿å®‰å¸‚'),(262,15,22,'è¾¾å·å¸‚'),(263,16,22,'é›…å®‰å¸‚'),(264,17,22,'å·´ä¸­å¸‚'),(265,18,22,'èµ„é˜³å¸‚'),(266,19,22,'é˜¿åè—æ—ç¾Œæ—è‡ªæ²»å·'),(267,20,22,'ç”˜å­œè—æ—è‡ªæ²»å·'),(268,21,22,'å‡‰å±±å½æ—è‡ªæ²»å·'),(269,1,23,'è´µé˜³å¸‚'),(270,2,23,'å…­ç›˜æ°´å¸‚'),(271,3,23,'éµä¹‰å¸‚'),(272,4,23,'å®‰é¡ºå¸‚'),(273,5,23,'é“œä»åœ°åŒº'),(274,6,23,'æ¯•èŠ‚åœ°åŒº'),(275,7,23,'é»”è¥¿å—å¸ƒä¾æ—è‹—æ—è‡ªæ²»å·'),(276,8,23,'é»”ä¸œå—è‹—æ—ä¾—æ—è‡ªæ²»å·'),(277,9,23,'é»”å—å¸ƒä¾æ—è‹—æ—è‡ªæ²»å·'),(278,1,24,'æµ·å£å¸‚'),(279,2,24,'ä¸‰äºšå¸‚'),(280,3,24,'äº”æŒ‡å±±å¸‚'),(281,4,24,'ç¼æµ·å¸‚'),(282,5,24,'å„‹å·å¸‚'),(283,6,24,'æ–‡æ˜Œå¸‚'),(284,7,24,'ä¸‡å®å¸‚'),(285,8,24,'ä¸œæ–¹å¸‚'),(286,9,24,'æ¾„è¿ˆå¿'),(287,10,24,'å®šå®‰å¿'),(288,11,24,'å±¯æ˜Œå¿'),(289,12,24,'ä¸´é«˜å¿'),(290,13,24,'ç™½æ²™é»æ—è‡ªæ²»å¿'),(291,14,24,'æ˜Œæ±Ÿé»æ—è‡ªæ²»å¿'),(292,15,24,'ä¹ä¸œé»æ—è‡ªæ²»å¿'),(293,16,24,'é™µæ°´é»æ—è‡ªæ²»å¿'),(294,17,24,'ä¿äº­é»æ—è‹—æ—è‡ªæ²»å¿'),(295,18,24,'ç¼ä¸­é»æ—è‹—æ—è‡ªæ²»å¿'),(296,1,25,'æ˜†æ˜å¸‚'),(297,2,25,'æ›²é–å¸‚'),(298,3,25,'ç‰æºªå¸‚'),(299,4,25,'ä¿å±±å¸‚'),(300,5,25,'æ˜­é€šå¸‚'),(301,6,25,'ä¸½æ±Ÿå¸‚'),(302,7,25,'æ€èŒ…å¸‚'),(303,8,25,'ä¸´æ²§å¸‚'),(304,9,25,'æ–‡å±±å£®æ—è‹—æ—è‡ªæ²»å·'),(305,10,25,'çº¢æ²³å“ˆå°¼æ—å½æ—è‡ªæ²»å·'),(306,11,25,'è¥¿åŒç‰ˆçº³å‚£æ—è‡ªæ²»å·'),(307,12,25,'æ¥šé›„å½æ—è‡ªæ²»å·'),(308,13,25,'å¤§ç†ç™½æ—è‡ªæ²»å·'),(309,14,25,'å¾·å®å‚£æ—æ™¯é¢‡æ—è‡ªæ²»å·'),(310,15,25,'æ€’æ±Ÿå‚ˆå‚ˆæ—è‡ªæ²»å·'),(311,16,25,'è¿ªåº†è—æ—è‡ªæ²»å·'),(312,1,26,'è¥¿å®å¸‚'),(313,2,26,'æµ·ä¸œåœ°åŒº'),(314,3,26,'æµ·åŒ—è—æ—è‡ªæ²»å·'),(315,4,26,'é»„å—è—æ—è‡ªæ²»å·'),(316,5,26,'æµ·å—è—æ—è‡ªæ²»å·'),(317,6,26,'æœæ´›è—æ—è‡ªæ²»å·'),(318,7,26,'ç‰æ ‘è—æ—è‡ªæ²»å·'),(319,8,26,'æµ·è¥¿è’™å¤æ—è—æ—è‡ªæ²»å·'),(320,1,27,'è¥¿å®‰å¸‚'),(321,2,27,'é“œå·å¸‚'),(322,3,27,'å®é¸¡å¸‚'),(323,4,27,'å’¸é˜³å¸‚'),(324,5,27,'æ¸­å—å¸‚'),(325,6,27,'å»¶å®‰å¸‚'),(326,7,27,'æ±‰ä¸­å¸‚'),(327,8,27,'æ¦†æ—å¸‚'),(328,9,27,'å®‰åº·å¸‚'),(329,10,27,'å•†æ´›å¸‚'),(330,1,28,'å—å®å¸‚'),(331,2,28,'æŸ³å·å¸‚'),(332,3,28,'æ¡‚æ—å¸‚'),(333,4,28,'æ¢§å·å¸‚'),(334,5,28,'åŒ—æµ·å¸‚'),(335,6,28,'é˜²åŸæ¸¯å¸‚'),(336,7,28,'é’¦å·å¸‚'),(337,8,28,'è´µæ¸¯å¸‚'),(338,9,28,'ç‰æ—å¸‚'),(339,10,28,'ç™¾è‰²å¸‚'),(340,11,28,'è´ºå·å¸‚'),(341,12,28,'æ²³æ± å¸‚'),(342,13,28,'æ¥å®¾å¸‚'),(343,14,28,'å´‡å·¦å¸‚'),(344,1,29,'æ‹‰è¨å¸‚'),(345,2,29,'é‚£æ›²åœ°åŒº'),(346,3,29,'æ˜Œéƒ½åœ°åŒº'),(347,4,29,'å±±å—åœ°åŒº'),(348,5,29,'æ—¥å–€åˆ™åœ°åŒº'),(349,6,29,'é˜¿é‡Œåœ°åŒº'),(350,7,29,'æ—èŠåœ°åŒº'),(351,1,30,'é“¶å·å¸‚'),(352,2,30,'çŸ³å˜´å±±å¸‚'),(353,3,30,'å´å¿ å¸‚'),(354,4,30,'å›ºåŸå¸‚'),(355,5,30,'ä¸­å«å¸‚'),(356,1,31,'ä¹Œé²æœ¨é½å¸‚'),(357,2,31,'å…‹æ‹‰ç›ä¾å¸‚'),(358,3,31,'çŸ³æ²³å­å¸‚ã€€'),(359,4,31,'é˜¿æ‹‰å°”å¸‚'),(360,5,31,'å›¾æœ¨èˆ’å…‹å¸‚'),(361,6,31,'äº”å®¶æ¸ å¸‚'),(362,7,31,'åé²ç•ªå¸‚'),(363,8,31,'é˜¿å…‹è‹å¸‚'),(364,9,31,'å–€ä»€å¸‚'),(365,10,31,'å“ˆå¯†å¸‚'),(366,11,31,'å’Œç”°å¸‚'),(367,12,31,'é˜¿å›¾ä»€å¸‚'),(368,13,31,'åº“å°”å‹’å¸‚'),(369,14,31,'æ˜Œå‰å¸‚ã€€'),(370,15,31,'é˜œåº·å¸‚'),(371,16,31,'ç±³æ³‰å¸‚'),(372,17,31,'åšä¹å¸‚'),(373,18,31,'ä¼Šå®å¸‚'),(374,19,31,'å¥å±¯å¸‚'),(375,20,31,'å¡”åŸå¸‚'),(376,21,31,'ä¹Œè‹å¸‚'),(377,22,31,'é˜¿å‹’æ³°å¸‚'),(378,1,32,'å‘¼å’Œæµ©ç‰¹å¸‚'),(379,2,32,'åŒ…å¤´å¸‚'),(380,3,32,'ä¹Œæµ·å¸‚'),(381,4,32,'èµ¤å³°å¸‚'),(382,5,32,'é€šè¾½å¸‚'),(383,6,32,'é„‚å°”å¤šæ–¯å¸‚'),(384,7,32,'å‘¼ä¼¦è´å°”å¸‚'),(385,8,32,'å·´å½¦æ·–å°”å¸‚'),(386,9,32,'ä¹Œå…°å¯Ÿå¸ƒå¸‚'),(387,10,32,'é”¡æ—éƒ­å‹’ç›Ÿ'),(388,11,32,'å…´å®‰ç›Ÿ'),(389,12,32,'é˜¿æ‹‰å–„ç›Ÿ'),(390,1,33,'æ¾³é—¨ç‰¹åˆ«è¡Œæ”¿åŒº'),(391,1,34,'é¦™æ¸¯ç‰¹åˆ«è¡Œæ”¿åŒº');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu`
--

DROP TABLE IF EXISTS `cpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

LOCK TABLES `cpu` WRITE;
/*!40000 ALTER TABLE `cpu` DISABLE KEYS */;
INSERT INTO `cpu` VALUES (1,'Xeon E3',0,'2016-06-03 16:57:26','admin','admin','2016-06-03 16:57:34'),(2,'Xeon E5',0,'2016-06-03 16:57:48','admin','admin','2016-06-03 16:57:58'),(3,'Xeon E7',0,'2016-06-03 16:58:11','admin','admin','2016-06-03 16:58:18'),(4,'Xeon 5600',0,'2016-06-03 16:58:34','admin','admin','2016-06-03 16:58:43');
/*!40000 ALTER TABLE `cpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datacenter`
--

DROP TABLE IF EXISTS `datacenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datacenter` (
  `dcid` bigint(20) NOT NULL AUTO_INCREMENT,
  `dcname` varchar(255) DEFAULT NULL,
  `dcprovince` varchar(256) DEFAULT NULL,
  `dccity` varchar(256) DEFAULT NULL,
  `dccounty` varchar(256) DEFAULT NULL,
  `dcaddress` varchar(256) DEFAULT NULL,
  `dcgeo` varchar(256) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `region_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter`
--

LOCK TABLES `datacenter` WRITE;
/*!40000 ALTER TABLE `datacenter` DISABLE KEYS */;
INSERT INTO `datacenter` VALUES (124,'ä¸Šæµ·æ¼•æ²³æ³¾æ•°æ®ä¸­å¿ƒ','ä¸Šæµ·','å¸‚è¾–åŒº','å¾æ±‡åŒº','112','1211','211221',3,3,4,0,'2016-11-18 13:34:44','','','2016-11-17 15:34:05'),(128,'1111','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','222','22','222',3,3,3,0,'2016-11-17 14:44:37','','','2016-11-17 14:44:37'),(129,'2321441','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','2414','1412','',3,3,3,0,'2016-11-17 14:44:44','','','2016-11-17 14:44:44'),(130,'555','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','333','222','555',3,3,3,0,'2016-11-17 14:45:17','','','2016-11-17 14:45:17'),(132,'ä¸Šæµ·å®å±±æ•°æ®ä¸­å¿ƒ','ä¸Šæµ·','å¸‚è¾–åŒº','å®å±±åŒº','å®å±±åŒº','','',4,3,3,1,'2016-11-18 23:17:01','','','2016-11-21 13:58:02'),(133,'ä¸Šæµ·å¾æ±‡æ•°æ®ä¸­å¿ƒ','ä¸Šæµ·','å¸‚è¾–åŒº','å®å±±åŒº','','','',4,23,4,1,'2016-11-18 23:17:35','','','2016-11-21 13:37:42'),(134,'ä¸Šæµ·é•¿å®æ•°æ®ä¸­å¿ƒ','ä¸Šæµ·','å¸‚è¾–åŒº','é•¿å®åŒº','','','',4,24,4,1,'2016-11-18 10:18:10','','','2016-11-18 10:18:10'),(136,'afegddfdfdffdfd','æ–°ç–†','ä¹Œé²æœ¨é½å¸‚','ä¹Œé²æœ¨é½å¿','','','',3,24,4,0,'2016-11-18 15:40:49','','','2016-11-18 15:40:49'),(138,'12332','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','','','',5,3,7,0,'2016-11-18 16:05:41','','','2016-11-18 16:05:41'),(142,'11212','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','','','',2,23,4,0,'2016-11-21 10:50:22','','','2016-11-21 10:50:22'),(144,'6996969','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','','','',2,3,4,0,'2016-11-21 11:03:19','','','2016-11-21 11:03:19'),(148,'111145','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','','','',2,3,4,0,'2016-11-21 11:28:07','','','2016-11-21 11:28:07'),(152,'556464','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','','','',5,3,4,0,'2016-11-21 12:58:39','','','2016-11-21 12:58:39'),(156,'89898','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','','','',9,23,7,0,'2016-11-21 13:37:24','','','2016-11-21 13:37:24'),(164,'3434','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','','','',4,23,4,0,'2016-11-22 09:43:03','','','2016-11-22 09:43:03'),(165,'2132131243534','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','','','',3,3,4,0,'2016-11-22 09:50:32','','','2016-11-22 09:50:32'),(167,'æ¶æ¶è¶£å‘³','ä¸Šæµ·','å¸‚è¾–åŒº','é»„æµ¦åŒº','','','',9,3,4,0,'2016-11-23 09:52:36','','','2016-11-23 09:52:36');
/*!40000 ALTER TABLE `datacenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datacenter_region`
--

DROP TABLE IF EXISTS `datacenter_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datacenter_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter_region`
--

LOCK TABLES `datacenter_region` WRITE;
/*!40000 ALTER TABLE `datacenter_region` DISABLE KEYS */;
INSERT INTO `datacenter_region` VALUES (2,'åä¸œ',0,'2016-06-01 19:47:22','han','han','2016-11-23 16:41:27'),(3,'ååŒ—',0,'2016-05-30 15:47:48','han','han','2016-05-30 15:47:56'),(4,'åå—',0,'2016-05-30 15:48:12','han','han','2016-05-30 15:48:14'),(5,'åä¸­',0,'2016-05-30 15:48:40','han','han','2016-05-30 15:48:48'),(9,'åè¥¿',0,'2016-10-26 07:15:12','','','2016-11-23 16:41:47'),(24,'èŠ±èŠ±',0,'2016-11-24 10:31:28','','','2016-11-24 10:31:28');
/*!40000 ALTER TABLE `datacenter_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datacenter_state`
--

DROP TABLE IF EXISTS `datacenter_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datacenter_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter_state`
--

LOCK TABLES `datacenter_state` WRITE;
/*!40000 ALTER TABLE `datacenter_state` DISABLE KEYS */;
INSERT INTO `datacenter_state` VALUES (3,'æ•…éšœ',0,'2016-05-30 15:51:35','han','han','2016-06-21 13:01:24'),(23,'æµ‹è¯•',0,'2016-11-18 10:17:21','','','2016-11-18 10:17:21'),(24,'ä½¿ç”¨ä¸­',0,'2016-11-18 10:18:00','','','2016-11-18 10:18:00');
/*!40000 ALTER TABLE `datacenter_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcprofile`
--

DROP TABLE IF EXISTS `dcprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcprofile` (
  `dcid` bigint(20) NOT NULL AUTO_INCREMENT,
  `dcname` varchar(255) DEFAULT NULL,
  `dcgeo` varchar(256) DEFAULT NULL,
  `dcsupplier` varchar(256) DEFAULT NULL,
  `dcbusiness` varchar(256) DEFAULT NULL,
  `dctechnology` varchar(256) DEFAULT NULL,
  `dcreceiver` varchar(256) DEFAULT NULL,
  `dcphone` varchar(256) DEFAULT NULL,
  `dcops` varchar(256) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcprofile`
--

LOCK TABLES `dcprofile` WRITE;
/*!40000 ALTER TABLE `dcprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dnspoddomain`
--

DROP TABLE IF EXISTS `dnspoddomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnspoddomain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cname_speedup` varchar(256) DEFAULT NULL,
  `created_on` varchar(256) DEFAULT NULL,
  `ext_status` varchar(256) DEFAULT NULL,
  `group_id` varchar(256) DEFAULT NULL,
  `is_mark` bigint(20) DEFAULT NULL,
  `is_vip` bigint(20) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `owner` varchar(256) DEFAULT NULL,
  `punycode` varchar(256) DEFAULT NULL,
  `records` varchar(256) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `searchengine_push` bigint(20) DEFAULT NULL,
  `ttl` varchar(256) DEFAULT NULL,
  `updated_on` varchar(256) DEFAULT NULL,
  `token_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  `grade_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspoddomain`
--

LOCK TABLES `dnspoddomain` WRITE;
/*!40000 ALTER TABLE `dnspoddomain` DISABLE KEYS */;
INSERT INTO `dnspoddomain` VALUES (1,'enable','2016-06-10 11:55:10','dnserror','2',0,0,'baidu.com','2','2','2','',0,'2','2016-06-09 06:30:10',2,1,1,1,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00'),(2,'enable','2016-11-16 14:16:24','enable','',1,1,'oneoaas.com','','','','',1,'','2016-11-16 14:16:26',0,1,1,1,'2016-09-21 09:37:38','','','2016-11-24 10:27:54'),(3,'enable','','enable','',1,1,'qq.com','','','','',1,'','',0,1,1,1,'2016-10-24 15:39:09','','','2016-10-24 15:39:09'),(4,'enable','','enable','',0,0,'bai.s.com','','','','',1,'','',0,1,1,1,'2016-11-23 14:38:20','','','2016-11-23 14:38:20'),(5,'','','','',0,0,'555.com','','','','',1,'','',0,1,1,1,'2016-11-23 14:38:31','','','2016-11-23 14:38:31'),(6,'enable','','enable','',0,0,'2121.com','','','','',1,'','',0,2,1,0,'2016-11-23 15:17:50','','','2016-11-23 15:17:50'),(7,'enable','','enable','',0,0,'qwwwq.com','','','','',1,'','',0,1,1,0,'2016-11-23 15:21:36','','','2016-11-23 15:21:36'),(8,'','','','',0,0,'','','','','',1,'','',0,1,1,0,'2016-11-23 15:21:49','','','2016-11-23 15:21:49'),(9,'enable','','enable','',0,0,'212.com','','','','',1,'','',0,1,2,1,'2016-11-23 15:22:47','','','2016-11-23 15:22:47');
/*!40000 ALTER TABLE `dnspoddomain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dnspoddomain_grade`
--

DROP TABLE IF EXISTS `dnspoddomain_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnspoddomain_grade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspoddomain_grade`
--

LOCK TABLES `dnspoddomain_grade` WRITE;
/*!40000 ALTER TABLE `dnspoddomain_grade` DISABLE KEYS */;
INSERT INTO `dnspoddomain_grade` VALUES (1,'æ—§å…è´¹å¥—é¤ (æ—§å¥—é¤)',0,'2016-06-06 13:50:48','admin','admin','2016-06-06 13:50:56'),(2,'ä¸ªäººè±ªåå¥—é¤ (æ—§å¥—é¤)',0,'2016-06-06 13:51:11','admin','admin','2016-06-06 13:51:19'),(3,'ä¼ä¸šâ…  (æ—§å¥—é¤)',0,'2016-06-06 13:51:56','admin','admin','2016-06-06 13:52:08'),(4,'ä¼ä¸šâ…¡ (æ—§å¥—é¤)',0,'2016-06-06 13:52:31','admin','admin','2016-06-06 13:52:39'),(5,'ä¼ä¸šâ…¢ (æ—§å¥—é¤)',0,'2016-06-06 13:53:02','admin','admin','2016-06-06 13:53:09'),(6,'å…è´¹å¥—é¤',0,'2016-06-06 13:53:24','admin','admin','2016-06-06 13:53:32'),(7,'ä¸ªäººä¸“ä¸šç‰ˆ',0,'2016-06-06 13:53:45','admin','admin','2016-06-06 13:53:53'),(8,'ä¼ä¸šåˆ›ä¸šç‰ˆ',0,'2016-06-06 13:54:11','admin','admin','2016-06-06 13:54:18'),(9,'ä¼ä¸šæ ‡å‡†ç‰ˆ',0,'2016-06-06 13:54:30','admin','admin','2016-06-06 13:54:38'),(10,'ä¼ä¸šæ——èˆ°ç‰ˆ',0,'2016-06-06 13:54:59','admin','admin','2016-06-06 13:55:07');
/*!40000 ALTER TABLE `dnspoddomain_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dnspoddomain_state`
--

DROP TABLE IF EXISTS `dnspoddomain_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnspoddomain_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspoddomain_state`
--

LOCK TABLES `dnspoddomain_state` WRITE;
/*!40000 ALTER TABLE `dnspoddomain_state` DISABLE KEYS */;
INSERT INTO `dnspoddomain_state` VALUES (1,'æ­£å¸¸',0,'2016-06-07 02:55:41','admin','admin','2016-11-18 15:17:58'),(2,'å·²æš‚åœè§£æ',0,'2016-06-06 13:56:17','admin','admin','2016-06-06 13:56:29'),(3,'å·²è¢«å°ç¦',0,'2016-06-06 13:56:58','admin','admin','2016-06-06 13:57:08'),(4,'å·²è¢«é”å®š',0,'2016-06-06 13:57:24','admin','admin','2016-06-06 13:57:32'),(6,'å¯¹æ–¹ç­”å¤',0,'2016-11-23 17:43:37','','','2016-11-23 17:43:37'),(7,'æˆ‘é—®é—®',0,'2016-11-23 17:44:14','','','2016-11-23 17:44:14');
/*!40000 ALTER TABLE `dnspoddomain_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dnspodrecord`
--

DROP TABLE IF EXISTS `dnspodrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnspodrecord` (
  `id` varchar(255) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT '',
  `line` varchar(255) NOT NULL DEFAULT '',
  `monitor_status` varchar(255) NOT NULL DEFAULT '',
  `mx` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `ttl` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `updated_on` varchar(255) NOT NULL DEFAULT '',
  `use_aqb` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `weight` varchar(255) NOT NULL DEFAULT '',
  `token_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspodrecord`
--

LOCK TABLES `dnspodrecord` WRITE;
/*!40000 ALTER TABLE `dnspodrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `dnspodrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dnspodtoken`
--

DROP TABLE IF EXISTS `dnspodtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnspodtoken` (
  `id` bigint(20) NOT NULL,
  `Token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspodtoken`
--

LOCK TABLES `dnspodtoken` WRITE;
/*!40000 ALTER TABLE `dnspodtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `dnspodtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docmanage`
--

DROP TABLE IF EXISTS `docmanage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docmanage` (
  `docmanageid` bigint(20) NOT NULL AUTO_INCREMENT,
  `docmanagename` varchar(255) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `docmanageno` varchar(256) DEFAULT NULL,
  `docpath` varchar(256) DEFAULT NULL,
  `doctype` varchar(256) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`docmanageid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docmanage`
--

LOCK TABLES `docmanage` WRITE;
/*!40000 ALTER TABLE `docmanage` DISABLE KEYS */;
INSERT INTO `docmanage` VALUES (1,'æ­£å¤§ç›‘æ§é¡¹ç›®åˆåŒ',0,'11','/app','å®Œæ•´','æ­£å¤§');
/*!40000 ALTER TABLE `docmanage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harddisk`
--

DROP TABLE IF EXISTS `harddisk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harddisk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harddisk`
--

LOCK TABLES `harddisk` WRITE;
/*!40000 ALTER TABLE `harddisk` DISABLE KEYS */;
INSERT INTO `harddisk` VALUES (1,'300G',0,'2016-06-03 17:05:09','admin','admin','2016-06-03 17:05:18'),(2,'500G',0,'2016-06-03 17:05:28','admin','admin','2016-06-03 17:05:37'),(3,'1T',0,'2016-06-03 17:05:51','admin','admin','2016-06-03 17:05:59'),(4,'1.5T',0,'2016-06-03 17:06:11','admin','admin','2016-06-03 17:06:19'),(5,'2T',0,'2016-06-03 17:06:28','admin','admin','2016-06-03 17:06:36');
/*!40000 ALTER TABLE `harddisk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardware`
--

DROP TABLE IF EXISTS `hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `online` bigint(20) DEFAULT NULL,
  `hardware_sn` varchar(256) DEFAULT NULL,
  `hardware_name` varchar(255) DEFAULT NULL,
  `manager_ip` varchar(255) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `rack_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `manage_ip` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware`
--

LOCK TABLES `hardware` WRITE;
/*!40000 ALTER TABLE `hardware` DISABLE KEYS */;
INSERT INTO `hardware` VALUES (5,1,'','æˆ‘å»é¢ä¸ºå…¨é¢',NULL,'',21,1,3,'',0,'2016-11-23 10:46:53','','','2016-11-23 10:46:53'),(6,1,'34444444','åä¸ºäº¤æ¢æœº',NULL,'',23,5,2,'192.168.182.130',1,'2016-11-29 07:09:36','','','2016-11-24 11:05:48'),(7,1,'2222','æ€ç§‘è·¯ç”±å™¨',NULL,'',23,49,2,'10.10.10.2',1,'2016-11-27 16:51:55','','','2016-11-24 11:05:37');
/*!40000 ALTER TABLE `hardware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardware_state`
--

DROP TABLE IF EXISTS `hardware_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware_state`
--

LOCK TABLES `hardware_state` WRITE;
/*!40000 ALTER TABLE `hardware_state` DISABLE KEYS */;
INSERT INTO `hardware_state` VALUES (2,'ç›‘æ§',0,'2016-06-02 15:16:30','admin','admin','2016-06-02 15:16:39'),(3,'æ•…éšœ',0,'2016-06-02 15:16:49','admin','admin','2016-06-02 15:16:57'),(8,'ä½¿ç”¨ä¸­',0,'2016-11-24 10:10:11','','','2016-11-24 10:10:11'),(9,'æµ‹è¯•',0,'2016-11-24 10:10:19','','','2016-11-24 10:10:19'),(10,'æš‚åœ',0,'2016-11-24 10:10:35','','','2016-11-24 10:10:35'),(11,'543',0,'2016-11-24 15:26:42','','','2016-11-24 15:26:42');
/*!40000 ALTER TABLE `hardware_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardware_type`
--

DROP TABLE IF EXISTS `hardware_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware_type`
--

LOCK TABLES `hardware_type` WRITE;
/*!40000 ALTER TABLE `hardware_type` DISABLE KEYS */;
INSERT INTO `hardware_type` VALUES (1,'CPU',0,'2016-06-24 16:47:57','admin','admin','2016-11-18 15:07:50'),(2,'å†…å­˜',0,'2016-06-23 14:48:05','admin','admin','2016-06-23 14:48:21'),(3,'ç¡¬ç›˜',0,'2016-06-23 14:48:09','admin','admin','2016-06-23 14:48:24'),(4,'å…‰é©±',0,'2016-06-23 14:48:11','admin','admin','2016-06-23 14:48:26'),(5,'äº¤æ¢æœº',0,'2016-06-23 14:48:14','admin','admin','2016-06-23 14:48:28'),(6,'é˜²ç«å¢™',0,'2016-06-23 14:48:16','admin','admin','2016-06-23 14:48:30'),(8,'æœåŠ¡å™¨',0,'2016-09-09 21:35:26','','','2016-09-09 21:35:26'),(47,'ç¡¬ä»¶',0,'2016-11-24 10:19:06','','','2016-11-24 10:19:06'),(48,'å›ºæ€ç¡¬ç›˜',0,'2016-11-24 10:48:58','','','2016-11-24 10:48:58'),(49,'è·¯ç”±å™¨',0,'2016-11-24 10:51:47','','','2016-11-24 10:51:47'),(50,'SSD',0,'2016-11-24 11:02:31','','','2016-11-24 11:02:31'),(51,'ç”µæº',0,'2016-11-24 11:06:22','','','2016-11-24 11:06:22'),(52,'ffff',0,'2016-11-24 15:03:21','','','2016-11-24 15:03:21'),(53,'321',0,'2016-11-24 15:26:17','','','2016-11-24 15:26:17');
/*!40000 ALTER TABLE `hardware_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,'CentOS 6.6 X64',0,'2016-06-04 06:01:46','admin','admin','2016-11-18 15:13:14'),(2,'Windows Server2012 R2',0,'2016-06-03 17:02:17','admin','admin','2016-06-03 17:02:26'),(3,'www',0,'2016-11-24 15:03:09','','','2016-11-24 15:03:09');
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internet_service_provider`
--

DROP TABLE IF EXISTS `internet_service_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internet_service_provider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internet_service_provider`
--

LOCK TABLES `internet_service_provider` WRITE;
/*!40000 ALTER TABLE `internet_service_provider` DISABLE KEYS */;
INSERT INTO `internet_service_provider` VALUES (1,'ä¸­å›½ç”µä¿¡',0,'2016-06-03 04:11:54','admin','admin','2016-11-18 14:35:22'),(2,'ä¸­å›½ç§»åŠ¨é€šä¿¡',0,'2016-06-02 15:12:16','admin','admin','2016-06-02 15:12:26'),(3,'ä¸­å›½è”é€š',0,'2016-06-02 15:12:38','admin','admin','2016-06-02 15:12:46'),(4,'åŒ—äº¬ç”µä¿¡é€š',0,'2016-06-02 15:12:59','admin','admin','2016-06-02 15:13:07'),(5,'å—æ–¹ç”µä¿¡',0,'2016-11-24 10:48:15','','','2016-11-24 10:48:15');
/*!40000 ALTER TABLE `internet_service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_address`
--

DROP TABLE IF EXISTS `ipam_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipam_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(11) DEFAULT NULL,
  `isgateway` int(11) DEFAULT NULL,
  `dnsname` varchar(128) DEFAULT NULL,
  `mac` varchar(128) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `owner` varchar(128) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `app_id` bigint(20) NOT NULL,
  `ipam_subnets_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_address`
--

LOCK TABLES `ipam_address` WRITE;
/*!40000 ALTER TABLE `ipam_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_subnets`
--

DROP TABLE IF EXISTS `ipam_subnets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipam_subnets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subnet` varchar(255) DEFAULT NULL,
  `mask` varchar(3) DEFAULT NULL,
  `pingsubnet` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `app_id` bigint(20) NOT NULL,
  `ipam_vlan_id` bigint(20) NOT NULL,
  `ipam_vrfs_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_subnets`
--

LOCK TABLES `ipam_subnets` WRITE;
/*!40000 ALTER TABLE `ipam_subnets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_subnets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vlan`
--

DROP TABLE IF EXISTS `ipam_vlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipam_vlan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `ipam_vlan_domain_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vlan`
--

LOCK TABLES `ipam_vlan` WRITE;
/*!40000 ALTER TABLE `ipam_vlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vlan_domain`
--

DROP TABLE IF EXISTS `ipam_vlan_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipam_vlan_domain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vlan_domain`
--

LOCK TABLES `ipam_vlan_domain` WRITE;
/*!40000 ALTER TABLE `ipam_vlan_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vlan_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipam_vrfs`
--

DROP TABLE IF EXISTS `ipam_vrfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipam_vrfs` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `rd` varchar(128) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipam_vrfs`
--

LOCK TABLES `ipam_vrfs` WRITE;
/*!40000 ALTER TABLE `ipam_vrfs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipam_vrfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(255) DEFAULT NULL,
  `email` varchar(11) DEFAULT NULL,
  `telphone` varchar(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'æˆ´å°”','dell@','123233',NULL,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00'),(2,'æƒ æ™®','huipu@','453454',NULL,NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00'),(16,'æ€ç§‘','sike@','233322','',NULL,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00'),(17,'æµªæ½®','','','',0,'2016-11-24 02:45:58','','','2016-11-23 15:33:05'),(18,'è”æƒ³','','','',0,'2016-11-23 13:46:19','','','2016-11-23 13:46:19'),(19,'åä¸º','','','',0,'2016-11-23 13:49:16','','','2016-11-23 13:49:16');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memory`
--

DROP TABLE IF EXISTS `memory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memory`
--

LOCK TABLES `memory` WRITE;
/*!40000 ALTER TABLE `memory` DISABLE KEYS */;
INSERT INTO `memory` VALUES (1,'1GB',0,'2016-06-03 16:59:13','admin','admin','2016-06-03 16:59:20'),(2,'2GB',0,'2016-06-03 16:59:33','admin','admin','2016-06-03 16:59:41'),(3,'4GB',0,'2016-06-03 16:59:52','admin','admin','2016-06-03 16:59:59'),(4,'8GB',0,'2016-06-03 17:00:09','admin','admin','2016-06-03 17:00:18'),(5,'16GB',0,'2016-06-03 17:00:30','admin','admin','2016-06-03 17:00:38');
/*!40000 ALTER TABLE `memory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menuId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(50) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT '',
  `updateby` varchar(100) DEFAULT '',
  `updatetime` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `level` bigint(5) DEFAULT NULL,
  `logo` varchar(20) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,'root.resource_manage','èµ„æºç®¡ç†','',0,0,NULL,'admin','','2016-10-25 23:59:00',0,1,'fa fa-exchange',''),(3,'root.system_manage','ç³»ç»Ÿç®¡ç†','',0,0,NULL,'admin','','2016-10-25 23:59:05',0,1,'fa fa-hand-o-right',''),(33,'root.systemuser','ç”¨æˆ·ç®¡ç†','/systemuser',3,0,NULL,'admin','','2016-10-25 23:59:05',0,2,'',''),(34,'root.systemconfig','ç³»ç»Ÿé…ç½®','/systemconfig',3,0,NULL,'admin','','2016-10-25 23:59:06',0,2,'',''),(45,'root.system_api','APIè®¿é—®','/system_api',3,0,'2016-07-19 06:37:15','oneoaas','','2016-10-25 23:59:06',0,2,'0',''),(46,'root.dashboard','èµ„æºå¯è§†åŒ–','/resource_view',0,0,NULL,'admin','','2016-11-24 15:27:05',0,1,'fa fa-eye',''),(47,'root.resource_quick','åˆ†ç±»æŸ¥è¯¢','/resource_quick',1,0,NULL,'admin','','2016-10-25 23:59:00',0,2,'',''),(50,'root.resource_tree','èµ„æºæ ‘','/resource_tree',46,1,'2016-09-17 22:24:40','oneoaas','','2016-10-25 23:59:07',0,2,'fa fa-tachometer',''),(51,'root.resource_topo','æ‹“æ‰‘å›¾','/resource_topo',46,0,'2016-09-18 11:25:29','oneoaas','','2016-11-24 15:27:05',0,2,'fa fa-tachometer',''),(52,'root.manageresources.datacenter({assertsId:1})','æ•°æ®ä¸­å¿ƒèµ„æº','/datacenter',2,0,NULL,'','','2016-11-24 15:27:05',0,0,'',''),(53,'root.manageresources.bandwidth({assertsId:2})','IPAMèµ„æº','/ipam',2,0,NULL,'','',NULL,0,NULL,NULL,NULL),(54,'root.manageresources.app({assertsId:3})','ä¸šåŠ¡èµ„æº','/business',2,0,NULL,'','',NULL,0,NULL,NULL,NULL),(55,'root.manageresources.vcenter({assertsId:4})','è™šæ‹ŸåŒ–èµ„æº','/virtualization',2,0,NULL,'','',NULL,0,NULL,NULL,NULL),(56,'root.manageresources.aliyun({assertsId:5})','äº‘èµ„æº','/cloud',2,0,NULL,'','',NULL,0,NULL,NULL,NULL),(57,'root.manageresources.supplier({assertsId:6})','ä¾›åº”å•†èµ„æº','/supplier',2,0,NULL,'','',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_rights`
--

DROP TABLE IF EXISTS `menu_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_rights` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) NOT NULL,
  `right_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_rights`
--

LOCK TABLES `menu_rights` WRITE;
/*!40000 ALTER TABLE `menu_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_roles`
--

DROP TABLE IF EXISTS `menu_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_roles`
--

LOCK TABLES `menu_roles` WRITE;
/*!40000 ALTER TABLE `menu_roles` DISABLE KEYS */;
INSERT INTO `menu_roles` VALUES (170,2,13),(171,52,13),(172,53,13),(173,54,13),(174,55,13),(175,56,13),(176,57,13),(177,46,13),(179,51,13),(240,2,8),(241,52,8),(242,53,8),(243,54,8),(244,55,8),(245,56,8),(246,57,8),(247,3,8),(248,33,8),(249,34,8),(250,45,8),(251,46,8),(253,51,8),(289,2,9),(290,52,9),(291,53,9),(292,54,9),(293,55,9),(294,56,9),(295,57,9),(296,46,9),(298,51,9),(299,52,14),(300,46,14),(301,51,14);
/*!40000 ALTER TABLE `menu_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_adapter`
--

DROP TABLE IF EXISTS `network_adapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_adapter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_adapter`
--

LOCK TABLES `network_adapter` WRITE;
/*!40000 ALTER TABLE `network_adapter` DISABLE KEYS */;
INSERT INTO `network_adapter` VALUES (1,'10Mbps',0,'2016-06-03 17:07:31','admin','admin','2016-06-03 17:07:42'),(2,'100Mbps',0,'2016-06-03 17:07:53','admin','admin','2016-06-03 17:08:00'),(3,'10/100Mbps',0,'2016-06-03 17:08:22','admin','admin','2016-06-03 17:08:32'),(4,'1000Mbps',0,'2016-06-03 17:08:45','admin','admin','2016-06-03 17:08:52');
/*!40000 ALTER TABLE `network_adapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_bandwidth`
--

DROP TABLE IF EXISTS `network_bandwidth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_bandwidth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `max_bandwidth` double DEFAULT NULL,
  `min_bandwidth` double DEFAULT NULL,
  `min_cost` double DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `isp_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `rack_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_bandwidth`
--

LOCK TABLES `network_bandwidth` WRITE;
/*!40000 ALTER TABLE `network_bandwidth` DISABLE KEYS */;
INSERT INTO `network_bandwidth` VALUES (12,'ä¸­å›½é“é€š',0,0,0,0,'',3,4,16,22,1,'2016-11-23 07:10:28','','','2016-11-24 10:48:43'),(14,'é•¿åŸå¸¦å®½',15,10,1000,10,'',1,6,15,21,1,'2016-11-24 10:02:03','','','2016-11-24 10:02:03');
/*!40000 ALTER TABLE `network_bandwidth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_bandwidth_state`
--

DROP TABLE IF EXISTS `network_bandwidth_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_bandwidth_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_bandwidth_state`
--

LOCK TABLES `network_bandwidth_state` WRITE;
/*!40000 ALTER TABLE `network_bandwidth_state` DISABLE KEYS */;
INSERT INTO `network_bandwidth_state` VALUES (3,'æ•…éšœ',0,'2016-06-02 15:14:30','admin','admin','2016-06-02 15:14:40'),(4,'ç»´ä¿®',0,'2016-06-02 15:14:51','admin','admin','2016-06-02 15:14:58'),(6,'æµ‹è¯•ä¸­',0,'2016-11-18 14:28:33','','','2016-11-18 14:28:33'),(9,'ä½¿ç”¨ä¸­',0,'2016-11-24 10:03:05','','','2016-11-24 10:03:05'),(10,'æš‚åœ',0,'2016-11-24 10:47:58','','','2016-11-24 10:47:58');
/*!40000 ALTER TABLE `network_bandwidth_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkip`
--

DROP TABLE IF EXISTS `networkip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkip` (
  `networkipid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(255) DEFAULT NULL,
  `netmask` varchar(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `vlan` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `app_id` bigint(20) NOT NULL,
  `host_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`networkipid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkip`
--

LOCK TABLES `networkip` WRITE;
/*!40000 ALTER TABLE `networkip` DISABLE KEYS */;
INSERT INTO `networkip` VALUES (4,'10.2.2.2','50.2.2.2','Cç±»',0,'qwqw',35,1,15,1,'2016-11-25 18:36:34','','','2016-11-24 10:26:28');
/*!40000 ALTER TABLE `networkip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkiprange`
--

DROP TABLE IF EXISTS `networkiprange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkiprange` (
  `networkiprangeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(255) DEFAULT NULL,
  `netmask` varchar(11) DEFAULT NULL,
  `startip` varchar(11) DEFAULT NULL,
  `endip` varchar(11) DEFAULT NULL,
  `vlan` varchar(256) DEFAULT NULL,
  `appid` bigint(20) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`networkiprangeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkiprange`
--

LOCK TABLES `networkiprange` WRITE;
/*!40000 ALTER TABLE `networkiprange` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkiprange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'åŒ—äº¬å¸‚'),(2,'å¤©æ´¥å¸‚'),(3,'ä¸Šæµ·å¸‚'),(4,'é‡åº†å¸‚'),(5,'æ²³åŒ—çœ'),(6,'å±±è¥¿çœ'),(7,'å°æ¹¾çœ'),(8,'è¾½å®çœ'),(9,'å‰æ—çœ'),(10,'é»‘é¾™æ±Ÿçœ'),(11,'æ±Ÿè‹çœ'),(12,'æµ™æ±Ÿçœ'),(13,'å®‰å¾½çœ'),(14,'ç¦å»ºçœ'),(15,'æ±Ÿè¥¿çœ'),(16,'å±±ä¸œçœ'),(17,'æ²³å—çœ'),(18,'æ¹–åŒ—çœ'),(19,'æ¹–å—çœ'),(20,'å¹¿ä¸œçœ'),(21,'ç”˜è‚ƒçœ'),(22,'å››å·çœ'),(23,'è´µå·çœ'),(24,'æµ·å—çœ'),(25,'äº‘å—çœ'),(26,'é’æµ·çœ'),(27,'é™•è¥¿çœ'),(28,'å¹¿è¥¿å£®æ—è‡ªæ²»åŒº'),(29,'è¥¿è—è‡ªæ²»åŒº'),(30,'å®å¤å›æ—è‡ªæ²»åŒº'),(31,'æ–°ç–†ç»´å¾å°”è‡ªæ²»åŒº'),(32,'å†…è’™å¤è‡ªæ²»åŒº'),(33,'æ¾³é—¨ç‰¹åˆ«è¡Œæ”¿åŒº'),(34,'é¦™æ¸¯ç‰¹åˆ«è¡Œæ”¿åŒº');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rack`
--

DROP TABLE IF EXISTS `rack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rack` (
  `rackid` bigint(20) NOT NULL AUTO_INCREMENT,
  `rack_name` varchar(255) DEFAULT NULL,
  `standard_num` bigint(20) DEFAULT NULL,
  `top_not_available_num` bigint(20) DEFAULT NULL,
  `bottom_not_available_num` bigint(20) DEFAULT NULL,
  `avaliable_num` bigint(20) DEFAULT NULL,
  `tary_num` bigint(20) DEFAULT NULL,
  `rack_netflow` double DEFAULT NULL,
  `is_ups` int(11) DEFAULT NULL,
  `is_ab` int(11) DEFAULT NULL,
  `power` bigint(20) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`rackid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack`
--

LOCK TABLES `rack` WRITE;
/*!40000 ALTER TABLE `rack` DISABLE KEYS */;
INSERT INTO `rack` VALUES (21,'æ¼•æ²³æ³¾æœºæŸœ001',10,10,15,-15,0,0,1,1,0,'',2,16,1,'2016-11-22 17:21:09','','','2016-11-24 10:41:41'),(22,'è™¹æ¡¥æœºåœºæœºæŸœ',10,0,10,0,0,0,1,1,0,'',3,15,1,'2016-11-22 04:40:47','','','2016-11-24 10:42:00'),(23,'ä¸ƒå®æœºæŸœ',0,0,0,0,0,0,1,1,0,'',3,16,1,'2016-11-22 06:08:31','','','2016-11-24 10:42:25'),(24,'é‡‘æ²™æ±Ÿè·¯æœºæŸœ',5,10,5,-10,0,0,1,1,0,'',3,15,1,'2016-11-22 23:58:59','','','2016-11-24 10:42:55');
/*!40000 ALTER TABLE `rack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rack_state`
--

DROP TABLE IF EXISTS `rack_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rack_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack_state`
--

LOCK TABLES `rack_state` WRITE;
/*!40000 ALTER TABLE `rack_state` DISABLE KEYS */;
INSERT INTO `rack_state` VALUES (2,'æ•…éšœ',0,'2016-06-02 04:52:40','admin','admin','2016-11-18 14:12:50'),(3,'ç»´ä¿®',0,'2016-06-01 15:53:08','admin','admin','2016-06-01 15:53:17'),(6,'æš‚åœ',0,'2016-11-24 10:43:16','','','2016-11-24 10:43:16'),(7,'',0,'2016-11-24 11:48:27','','','2016-11-24 11:48:27');
/*!40000 ALTER TABLE `rack_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `right`
--

DROP TABLE IF EXISTS `right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `right` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `right_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `right`
--

LOCK TABLES `right` WRITE;
/*!40000 ALTER TABLE `right` DISABLE KEYS */;
/*!40000 ALTER TABLE `right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `right_roles`
--

DROP TABLE IF EXISTS `right_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `right_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `right_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `right_roles`
--

LOCK TABLES `right_roles` WRITE;
/*!40000 ALTER TABLE `right_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `right_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (8,'è¶…çº§ç®¡ç†å‘˜',0,'2016-07-15 19:38:34','','','2016-11-23 18:03:50'),(9,'æ™®é€šç®¡ç†å‘˜',0,'2016-07-12 09:39:10','','','2016-11-24 09:43:12'),(11,'ç½‘ç»œç®¡ç†å‘˜',0,'2016-10-23 14:25:13','','','2016-10-23 14:25:13'),(12,'æœºæˆ¿ç®¡ç†å‘˜',0,'2016-10-23 21:56:28','','','2016-10-24 21:57:11'),(13,'æœºæŸœç®¡ç†å‘˜',0,'2016-11-15 23:55:13','','','2016-11-23 16:10:48'),(14,'æ•°æ®ä¸­å¿ƒç®¡ç†å‘˜',0,'2016-11-24 15:27:05','','','2016-11-24 15:27:05');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `roomid` bigint(20) NOT NULL AUTO_INCREMENT,
  `roomname` varchar(255) DEFAULT NULL,
  `floor` varchar(256) DEFAULT NULL,
  `roomno` varchar(256) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `business_contact` varchar(256) DEFAULT NULL,
  `technical_contact` varchar(256) DEFAULT NULL,
  `receiving_contact` varchar(256) DEFAULT NULL,
  `maintenance_contact` varchar(256) DEFAULT NULL,
  `datacenter_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (15,'ä¸Šæµ·å®å±±æœºæˆ¿','4','C502','ä¸Šæµ·å®å±±æœºæˆ¿','éŸ©','éŸ©','éŸ©','éŸ©',134,2,1,'2016-11-20 14:15:27','','','2016-11-24 10:00:03'),(16,'ä¸Šæµ·é•¿å®æœºæˆ¿','4','6082','éŸ©','éŸ©','éŸ©','éŸ©','éŸ©',134,1,1,'2016-11-18 10:19:23','','','2016-11-18 10:19:23'),(17,'ä¸Šæµ·å˜‰å®šæœºæˆ¿','1','B2001','','éŸ©','éŸ©','éŸ©','éŸ©',124,1,1,'2016-11-18 10:20:02','','','2016-11-18 10:20:02'),(19,'443434','2','','','','','','',133,2,0,'2016-11-21 18:29:28','','','2016-11-21 18:29:28'),(20,'43523423','3','','','','','','',138,1,0,'2016-11-22 09:55:17','','','2016-11-22 09:55:17'),(21,'l','1','','','','','','',132,1,0,'2016-11-22 21:22:51','','','2016-11-22 21:22:51');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_state`
--

DROP TABLE IF EXISTS `room_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_state`
--

LOCK TABLES `room_state` WRITE;
/*!40000 ALTER TABLE `room_state` DISABLE KEYS */;
INSERT INTO `room_state` VALUES (1,'ä½¿ç”¨ä¸­',0,'2016-06-01 03:16:06','admin','admin','2016-11-18 13:34:51'),(2,'æµ‹è¯•ä¸­',0,'2016-05-31 14:16:08','admin','admin','2016-05-31 14:16:48'),(4,'ä¸‹çº¿',0,'2016-05-31 14:16:11','admin','admin','2016-05-31 14:16:59'),(27,'æš‚åœ',1,'2016-11-24 10:13:23','','','2016-11-24 10:13:23');
/*!40000 ALTER TABLE `room_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `serverid` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `modle` varchar(256) NOT NULL DEFAULT '',
  `isHpervisor` bigint(20) NOT NULL DEFAULT '0',
  `isServer` bigint(20) NOT NULL DEFAULT '0',
  `comment` varchar(512) DEFAULT NULL,
  `rack_u_number` bigint(20) DEFAULT NULL,
  `manufacturer_id` bigint(20) NOT NULL,
  `app_id` bigint(20) NOT NULL,
  `rack_id` bigint(20) NOT NULL,
  `host_id` bigint(20) NOT NULL,
  `adapter_id` bigint(20) NOT NULL,
  `harddisk_id` bigint(20) NOT NULL,
  `memory_id` bigint(20) NOT NULL,
  `cpu_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`serverid`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (212,'S3DH8G0P','',1,1,'',1,2,35,23,2,4,2,5,1,3,1,1,'2016-11-23 18:46:07','','','2016-11-24 11:16:57'),(213,'AP5GHODQ5K','',1,1,'',1,1,36,22,2,1,1,2,2,4,3,1,'2016-11-25 04:31:30','','','2016-11-24 11:17:41'),(214,'SF3KH8G08','',1,1,'',1,2,37,23,2,2,1,2,4,4,1,1,'2016-11-25 00:16:54','','','2016-11-24 11:17:19');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_state`
--

DROP TABLE IF EXISTS `server_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_state`
--

LOCK TABLES `server_state` WRITE;
/*!40000 ALTER TABLE `server_state` DISABLE KEYS */;
INSERT INTO `server_state` VALUES (1,'ä½¿ç”¨ä¸­',0,'2016-06-04 05:50:11','admin','admin','2016-11-18 15:13:02'),(2,'åº“å­˜',0,'2016-06-03 16:50:41','admin','admin','2016-06-03 16:50:49'),(3,'æ•…éšœä¸­',0,'2016-06-03 16:51:01','admin','admin','2016-06-03 16:51:08'),(4,'ç©ºé—²',0,'2016-06-03 16:51:21','admin','admin','2016-06-03 16:51:29'),(5,'æµ‹è¯•ä¸­',0,'2016-06-03 16:51:39','admin','admin','2016-06-03 16:51:49'),(6,'æ¬è¿ä¸­',0,'2016-06-03 16:52:04','admin','admin','2016-06-03 16:52:12'),(7,'å·²è¿‡ä¿',0,'2016-06-03 16:52:26','admin','admin','2016-06-03 16:52:33'),(8,'é¢„å ',0,'2016-06-03 16:53:01','admin','admin','2016-06-03 16:53:09'),(9,'æµ‹è¯•',0,'2016-09-05 19:07:18','','','2016-09-05 19:07:18'),(10,'æ•…éšœ',0,'2016-09-14 06:48:23','','','2016-09-14 06:48:23'),(11,'22',0,'2016-11-18 15:09:42','','','2016-11-18 15:09:42'),(12,'wan',0,'2016-11-23 13:38:45','','','2016-11-23 13:38:45'),(13,'ssssss',0,'2016-11-23 13:38:51','','','2016-11-23 13:38:51'),(14,'CCCCCCC',0,'2016-11-24 11:18:03','','','2016-11-24 11:18:03'),(15,'ffff',0,'2016-11-24 15:02:59','','','2016-11-24 15:02:59');
/*!40000 ALTER TABLE `server_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `session_key` char(64) NOT NULL,
  `session_data` blob,
  `session_expiry` int(11) unsigned NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('004001f888e426d1445e93c81cdd7ff2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('0064f8ae0a317217b95e61583a8d99c0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('00ef2bf8d50ad406840288724e19790f','ÿÿ‚\0\0\0ÿ‚\0\0',1479972163),('00f4ec49030cb8909c492053e2564666','ÿÿ‚\0\0\0ÿ‚\0\0',1479971128),('01171b21f39ee4a5c1939ede9f33e707','ÿÿ‚\0\0\0ÿ‚\0\0',1479971890),('014b5a98d845a2dba2af1ec3737e16a6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971847),('016c24d21c8c602966358b53d6984175','ÿÿ‚\0\0\0ÿ‚\0\0',1479971444),('0174dfdfd60bf840a651ea367e45e5e7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972220),('017b147f29f498fa433a3810ec7d8392','ÿÿ‚\0\0\0ÿ‚\0\0',1479970350),('0184ca35d315537906a384595564ee63','ÿÿ‚\0\0\0ÿ‚\0\0',1479970016),('02064fca6f7e8578f948ea327e11fe6d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971139),('020bb0a3f1c56e11ac88269ca0529088','ÿÿ‚\0\0\0ÿ‚\0\0',1479971501),('02128f7324377a425c8d30f3b34996e0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970908),('021adb9251850f19f80f45f1f2f11c8d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('02225bedd676ef250b64c1364719d144','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('025c03eec5348ab50eb9daae0766cf40','ÿÿ‚\0\0\0ÿ‚\0\0',1479970582),('0261351111e389a2edcfbc014a1f024e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971576),('026a628fe82bffd283e1e4ab09bc15ef','ÿÿ‚\0\0\0ÿ‚\0\0',1479970761),('02c7b3148c1e0da32bd73837f75663d8','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('02c8f9fa51c9f71c352006562abed1b2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968038),('0310222ec47d23686f1d3c30198fcbe9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972204),('0347fba4d9908dee9c2cc2d789937582','ÿÿ‚\0\0\0ÿ‚\0\0',1479972152),('03792e29a00902042c3e97d79df46bfd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('03ac5c58adb73f86465a77f574639b7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972425),('03cf1f0e49c3f65ad4ec4bc65f315db2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('03d3d38bfc84dd0324fa2b10962d5d6b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('03eed8f7928efc0a2cee5591d15ff707','ÿÿ‚\0\0\0ÿ‚\0\0',1479968350),('03ff82279eb102cdb339a76be4de3bf5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('03ffd11a595034e1155d6e59d17d2cf5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('04051b90b95bc8d9d653eaf4504639ee','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('042f61bd06fc7a1f315b9c7852bf7cb4','ÿÿ‚\0\0\0ÿ‚\0\0',1479968350),('0434aff380515f6b1ed5246244d8719f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970023),('0449eeedd3a4f03b08498090c6053fbe','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('046ac272abc569b2527256964531ce0a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('048862f1c394c6e8860f6b53ede2e8f8','ÿÿ‚\0\0\0ÿ‚\0\0',1479971982),('0493a1981484500f38c8c033179ae1f1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970513),('049a4f5fc5db28cb872834ee8bcf75f8','ÿÿ‚\0\0\0ÿ‚\0\0',1479971129),('049b7445d28cb8f5034c361e57111fef','ÿÿ‚\0\0\0ÿ‚\0\0',1479972402),('049d6126a8d8e667300f2125b0a0e374','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('050cd820b421dcabe7c9db9de89eea9e','ÿÿ‚\0\0\0ÿ‚\0\0',1479969812),('053afbd33a96c09bc1dd02e30b2f682b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971960),('054aa4b83c0526b498848342faf08116','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('054daf7e25359ce72c25eb937643b6dd','ÿÿ‚\0\0\0ÿ‚\0\0',1479971573),('0560890edb2fdd7c691c50d55016b2be','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('05cbae2b7884084d1ca25f23b5b7ca58','ÿÿ‚\0\0\0ÿ‚\0\0',1479970513),('068ea62bba0c2b5bff410753d0996fdc','ÿÿ‚\0\0\0ÿ‚\0\0',1479972353),('06a8fe3a9c1870c1dd782f1c11172757','ÿÿ‚\0\0\0ÿ‚\0\0',1479970040),('06b0ecefead3c7ba8197be36cb25eef3','ÿÿ‚\0\0\0ÿ‚\0\0',1479971288),('06c903e579ceda0d9beb7c13696165d5','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('06cc3197e9633d7aeaa5a2001eb707dc','ÿÿ‚\0\0\0ÿ‚\0\0',1479967978),('06d91f1b0f203d6f1bd50ec1aadef8a7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970727),('070d9ccfbd73ba42632c2c468c97b716','ÿÿ‚\0\0\0ÿ‚\0\0',1479970899),('071df79823c4484aa413103f94cb4ea0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('073bfe760c4fdfb495a552fcb1f9632a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('0745c336808c75f06448f2c72298a60a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972345),('076f160383c80526341a7500333dc2a5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970856),('0775f6a13ef95e4a97e3538b6ea8f458','ÿÿ‚\0\0\0ÿ‚\0\0',1479972065),('07e5aa0deec9da8f41aec0545093c07d','ÿÿ‚\0\0\0ÿ‚\0\0',1479968613),('07eda2aefbd6fa160f24fe931bf7e957','ÿÿ‚\0\0\0ÿ‚\0\0',1479971984),('080995a6c42c42e03d822a54a5525ee3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('08472e7075487dbe4b910bc77d587818','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('08505217c00c58a4294d0a101765bec2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('08818579b4612930ce1aaa44ea8c6167','ÿÿ‚\0\0\0ÿ‚\0\0',1479970569),('08828f44d06c1838892cedcd4856cbbe','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('08b62e8dd6c7f8aa94ebf3903eed7186','ÿÿ‚\0\0\0ÿ‚\0\0',1479971986),('08e3161d54759658c02b5db6f5a40ffc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('090533fc77554411040ffdfa16f02e37','ÿÿ‚\0\0\0ÿ‚\0\0',1479969908),('092cf8ce816fb01f366d12073477861a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('09507c3a6ba52c71fd3a3cdad78151d4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('095751b9f489ad404f10c92fd023fe08','ÿÿ‚\0\0\0ÿ‚\0\0',1479971114),('0973c2a07b6ebbc3a3a10c278e4f1e7d','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('098064190ba16173bcd0a8fcddb1d95d','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('099e73e4b29635948ec0963745fedd0c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971694),('09cce011cac62bfa9861da86f35e07d1','ÿÿ‚\0\0\0ÿ‚\0\0',1479967784),('09dfe1bbb592bee1c551881df6f3c2be','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('0a0a28c5e63d06ff899bd4f1c6a44eb5','ÿÿ‚\0\0\0ÿ‚\0\0',1479969951),('0a122b8c56e3402065f9c3690a0cd789','ÿÿ‚\0\0\0ÿ‚\0\0',1479972158),('0a6a079b91faf7a9d2e11a63e130518e','ÿÿ‚\0\0\0ÿ‚\0\0',1479968052),('0a6c9398a7f234b9470f58db75309c5b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971982),('0a8453a58c63865303b4ebe715aa70c1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970954),('0a9370576071e21ab424234221299c93','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('0a99d34a5462b6b7d4f69c7218d09d45','ÿÿ‚\0\0\0ÿ‚\0\0',1479968654),('0ad8648399a10f7e828135a7ce933404','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('0aecd22694f041a36818035f09d836fa','ÿÿ‚\0\0\0ÿ‚\0\0',1479971960),('0b0574c7789aecfcbab869edbd82eedd','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('0b13558462e4f9cf1aec9c54206deb5e','ÿÿ‚\0\0\0ÿ‚\0\0',1479972055),('0b34db70e65800e46eee20b8fb598be8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970534),('0b4614b4682c9ac42f38ee8371eeb0e6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970962),('0b639d2150432842037bb6b65733b64f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970956),('0b6a632e6546825357cb80b8db4d06d1','ÿÿ‚\0\0\0ÿ‚\0\0',1479972094),('0b7153c4fd6661e9c2b2244c9f98cf9b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972148),('0b8f040a299b003044af42a23f6a0c24','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('0b99866a3528b4ba3119da6d537fa22b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('0ba5fcd9ca1d61a8c64a684599565f58','ÿÿ‚\0\0\0ÿ‚\0\0',1479971136),('0bacca6a2cff83a55f902ecb388eeeb9','ÿÿ‚\0\0\0ÿ‚\0\0',1479968366),('0c0b7dd1b7f680edb120bc1966c495ff','ÿÿ‚\0\0\0ÿ‚\0\0',1479971960),('0c134c6ba7fe7babe11de19c7ebecc27','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('0c6bd4940d50db5a5bfbe5b5683fe834','ÿÿ‚\0\0\0ÿ‚\0\0',1479972376),('0c6d18ddec6c58c0c28e1731824b4ccd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('0ca5e46a0e5d2bc677b83440996965bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479971982),('0cadc4f346a6fb466843a3b46ef97087','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('0caf58af1a0de15abbe59984b8a31f4a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972345),('0cc9166c56081f0f7ef31ede03cc9d92','ÿÿ‚\0\0\0ÿ‚\0\0',1479969902),('0cf78599ce18c46fdbc1d31af90ad951','ÿÿ‚\0\0\0ÿ‚\0\0',1479969938),('0d0457b89c243519522cf7279d4806e8','ÿÿ‚\0\0\0ÿ‚\0\0',1479969284),('0d59153fc5c08d657b75f0c75c0e2970','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('0d9ea0d48537f9446d13605d58685fb3','ÿÿ‚\0\0\0ÿ‚\0\0',1479971661),('0dbcd05de95f913451935fc6d74e8c68','ÿÿ‚\0\0\0ÿ‚\0\0',1479972109),('0dd5ad6cf4187e80501a10fc02003888','ÿÿ‚\0\0\0ÿ‚\0\0',1479970550),('0de4d3d2bb938a0b1eb0498c3dc46981','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('0dfdc1dc1e6b5feccd5f5323d131608c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('0e096cce1734886198aefbb70e0070c0','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('0e1710891c6d8356ad6651c689f12b92','ÿÿ‚\0\0\0ÿ‚\0\0',1479969264),('0e5a7c7b9d73c0c0889aad2d26752417','ÿÿ‚\0\0\0ÿ‚\0\0',1479969812),('0e8546ee69c3af6773bb97615b7819e8','ÿÿ‚\0\0\0ÿ‚\0\0',1479968253),('0e8c32dd5e417683ed01349b02a1a58f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970036),('0e8d0f5a421c318d03dd586ab2979785','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('0eac7e16ca89a68f950f57f88b8fa51c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('0ead28fb511edc7fc232706f696a9c15','ÿÿ‚\0\0\0ÿ‚\0\0',1479968684),('0eb7b82b03f6700dfce31e2f5a1463f6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970048),('0ef33d038b0d1619dd3a088e8639e804','ÿÿ‚\0\0\0ÿ‚\0\0',1479971982),('0ef7693cdb8b76f2c3726212a2674eae','ÿÿ‚\0\0\0ÿ‚\0\0',1479967783),('0f071fce0d508783bf345f52328b91a1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970005),('0f4208fefcf0718c132fdab5869640c4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970010),('0f6775ebf0ec94f9e6471b05a9cf7823','ÿÿ‚\0\0\0ÿ‚\0\0',1479970534),('0f99a992c88bf7080c7179c434a16150','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('0feacb7f224f3e2914e05e9563062444','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('10104b7f28d011924158b3a3820eb4bf','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('1057178842ca944521819762839316b3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('1061e3937bb51e628b777dcdc2dcb277','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('107a74242a53bf1b0123c924cdcd763f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971001),('10c4abde9977e666298f36d01ba4390c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('10fc512e44831d753d86436533958304','ÿÿ‚\0\0\0ÿ‚\0\0',1479972208),('111cfb5b4d6c4476485aca800f854f7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('116bad81110d6f5791c349ea91caec66','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('11803f1b59d1705aa862f94d10937b4e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('119ab3b958358370b7a96907dc40975f','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('11c4ab2ada883a28b0e710f3316fd8d7','ÿÿ‚\0\0\0ÿ‚\0\0',1479968784),('11cfb3191d4589f692d5014c03e075a8','ÿÿ‚\0\0\0ÿ‚\0\0',1479969953),('11de21899e88ae798f31d247e4e965ae','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('11f2df8620852d148e2b75fa3f5a4e08','ÿÿ‚\0\0\0ÿ‚\0\0',1479972352),('12295d6d90e83e1aa8819a3b733bc441','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('125e2b3b05e2fddde9735e813d0f3716','ÿÿ‚\0\0\0ÿ‚\0\0',1479971446),('125f67d64e9919776c66fd33b6326607','ÿÿ‚\0\0\0ÿ‚\0\0',1479972104),('12a87ef9bc24fbc56452c39ebeca6216','ÿÿ‚\0\0\0ÿ‚\0\0',1479971124),('12f4c6935aab059cf372ee0816c9de94','ÿÿ‚\0\0\0ÿ‚\0\0',1479972243),('12f803f8322dd09c96898ecee4c6e5bd','ÿÿ‚\0\0\0ÿ‚\0\0',1479969362),('134bbec13bb499455feaba1b61ea66e7','ÿÿ‚\0\0\0ÿ‚\0\0',1479971848),('1351034dba22f14bded5f035755795d1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('135db4929831f85c95bef21201f8f91b','ÿÿ‚\0\0\0ÿ‚\0\0',1479967866),('13a1db95eec9aff8c228f0986ec0bd91','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('13a26e8de3fc976e77397fd2d9cc1ad7','ÿÿ‚\0\0\0ÿ‚\0\0',1479971168),('13a8952295d9f42c7d1e811d3106f964','ÿÿ‚\0\0\0ÿ‚\0\0',1479971981),('13b746d99d2c449f5712620bd96cff82','ÿÿ‚\0\0\0ÿ‚\0\0',1479971841),('14048fc2661e7ef451ce3598515f54aa','ÿÿ‚\0\0\0ÿ‚\0\0',1479972294),('14192d705aecf7cccd352bd27f626fba','ÿÿ‚\0\0\0ÿ‚\0\0',1479969908),('141d90b866da60b1f2131e76ef9c7754','ÿÿ‚\0\0\0ÿ‚\0\0',1479970534),('1433b9148bec06ffba2d4a1d558f8d21','ÿÿ‚\0\0\0ÿ‚\0\0',1479970962),('14914825b9edc800297dd8394be15a90','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('14cb179c23d4d912269756b116e223f8','ÿÿ‚\0\0\0ÿ‚\0\0',1479971262),('15029529a90f35a2da97dce96d5c0570','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('150559ebae4b0b2e71879fdc625f6c59','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('15100b7ee0e383a1c042e55dd796001a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('151cbaac0cf86aa52588b304158bea8a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('15394ab3c7bf961077aad5a88a37b9d9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970941),('15422e6b5c6ee2da46055aeb16eee605','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('155c1bd185829827ba9bdea3cfecf4d4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971069),('155c2e267190a4eb63e6c6079b5d7e5a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972402),('158a61e5e6d015f44c2b2c8c35693d86','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('159d22d3ac6d3e52246829f384f997e1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('15c227efdfff4b8b0173f7b4083df0cd','ÿÿ‚\0\0\0ÿ‚\0\0',1479971843),('162cb02efba03fe1e1c03d70687fd684','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('164b65dc87c5b5229c57a314eba43481','ÿÿ‚\0\0\0ÿ‚\0\0',1479971948),('165cf64757e8fbe6200c288e1e80baba','ÿÿ‚\0\0\0ÿ‚\0\0',1479967798),('1665007699c428b1341671a82299b302','ÿÿ‚\0\0\0ÿ‚\0\0',1479972111),('169130668b139dfa16bcbb95df2a0236','ÿÿ‚\0\0\0ÿ‚\0\0',1479972063),('1697920b65fc16f0bffe7474f81ef1b3','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('16a85453da12d422b30984187a74eb70','ÿÿ‚\0\0\0ÿ‚\0\0',1479971001),('17086dca6b6f344694c258c4c585e2ad','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('174a1ef8782baac7c890ad61af644912','ÿÿ‚\0\0\0ÿ‚\0\0',1479968613),('1764ed37f03b4765dcbe9ea5a8c9bdfe','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('176b5c4ea1f35b08fbc4819b361d23a8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970859),('176e14afddff7be9901514327c91ce65','ÿÿ‚\0\0\0ÿ‚\0\0',1479970350),('177b79211f7f05d479fea1516f433880','ÿÿ‚\0\0\0ÿ‚\0\0',1479972152),('179cadafa5756bc86c194d64b211b3b3','ÿÿ‚\0\0\0ÿ‚\0\0',1479971990),('17b94e0f0634b1fe89ddc82efcf1ddb7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('17dc6c425759e7cdd2dedce2d813b355','ÿÿ‚\0\0\0ÿ‚\0\0',1479972088),('1815a1ddf17859d54cec53fe450ea811','ÿÿ‚\0\0\0ÿ‚\0\0',1479970464),('183a521a7a8b4403ae7bd20707eef557','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('1874a724969fd99c64a5ad6923b35ff2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971445),('1886cc8fc42a1e590a86e7b39ff6c7aa','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('1887b0a95fbcc936a0cab5b34a5a606f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('18a5d9ab62b57c884992014cf0ddb754','ÿÿ‚\0\0\0ÿ‚\0\0',1479969276),('18aba3cc901228ac07e7b89919ba3474','ÿÿ‚\0\0\0ÿ‚\0\0',1479971574),('18bba456e0d068c9864c34590240edc0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970049),('18c3d0e9c7dc1a6259a1820dba1449ec','ÿÿ‚\0\0\0ÿ‚\0\0',1479969027),('18de5da4e17ff5421f09011c6ae5531c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970568),('19852f1ebcae3e7e1a33e5a82fbd518f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('19cc3088286c560427685aed1668a50e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971104),('19d577adeabd588cafa67dd974ee736a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('19d6cdf52e3932682c62a2364407623f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970761),('19eddf86ca571b90f87f70afa5683634','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('19eea5fb747468d036b4fdabbd0536fc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970006),('1a03761244177ec508ff4395697a9d13','ÿÿ‚\0\0\0ÿ‚\0\0',1479971128),('1a6c482c71b511c389c68a206de0cc33','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('1a7b3d9db44dffe4b6b96a2d4930c605','ÿÿ‚\0\0\0ÿ‚\0\0',1479971448),('1a8ef66e6259eef81baae22c1267dc09','ÿÿ‚\0\0\0ÿ‚\0\0',1479970731),('1a950919c30bab4042de9e8c115767fe','ÿÿ‚\0\0\0ÿ‚\0\0',1479971104),('1a98c7660f0e0f171514c370015dc53b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972051),('1ad2fb9db3a5f49ae7d614d1ea32fb69','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('1adae741285203e99512ca9a0cf7ff1e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970005),('1adb971b89f371fdefade03508b7f008','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('1ae5023d762ad5d9281a658b299478c1','ÿÿ‚\0\0\0ÿ‚\0\0',1479968784),('1aeac40f52000d7048aa6429d3618699','ÿÿ‚\0\0\0ÿ‚\0\0',1479971982),('1b30df339f297b3be9dba807028f2b90','ÿÿ‚\0\0\0ÿ‚\0\0',1479971962),('1bacceb43b724f2f2881debe71078b84','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('1bc5edce7681c189f0983a11c660faba','ÿÿ‚\0\0\0ÿ‚\0\0',1479971960),('1c20fb3dbcc01e161ab7fa5e296bef0e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971445),('1c9f1f192e920e729568b75790a9fe22','ÿÿ‚\0\0\0ÿ‚\0\0',1479972376),('1cb158e997ca990f76793fe72a483fe0','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('1cba4f54e3881746212a13a0bbe03e10','ÿÿ‚\0\0\0ÿ‚\0\0',1479970958),('1ce6a6353aba363afac252f5968f4326','ÿÿ‚\0\0\0ÿ‚\0\0',1479970962),('1d218a7e9f7e209e8aeba50df6967232','ÿÿ‚\0\0\0ÿ‚\0\0',1479970333),('1d484565f777336f5f5bb1cd40b0eb5b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969028),('1d6980636d243d052c930acc29879af3','ÿÿ‚\0\0\0ÿ‚\0\0',1479969352),('1d94692554202d4954869852959b4bd4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971878),('1da477a2cf9162dbec06137657d60c7f','ÿÿ‚\0\0\0ÿ‚\0\0',1479969001),('1db0ba19c55e331c597b735f0d369fd7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('1db5b3458dd6feabd84d5ee76d5e36a0','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('1dd2bd7eaaa527c72c1318e42e50890c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972151),('1ddcaecbd3f22ec4b10f3e48951e8a90','ÿÿ‚\0\0\0ÿ‚\0\0',1479971449),('1de92566e9965eb134d858ce16402781','ÿÿ‚\0\0\0ÿ‚\0\0',1479972096),('1e122ced610b048013dcf914813f6279','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('1e2bcd66e93f5b1a217a4cedba00a249','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('1e6871321e213631602d703694751487','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('1e6927f67eff4a761975c21a7831150c','ÿÿ‚\0\0\0ÿ‚\0\0',1479967840),('1e8751fb826590b8794b9a5d7410b01f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968612),('1e8e613eafe0ded081c2663ee28fcbb5','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('1ea81da684974843b23c9b4b99f185b2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972204),('1ee30120e5de51676b4f64973dbfa8e2','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('1ee5359f623cf17d78f6cb10685977f0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('1ef25ee9ab434f22c035e7395321fe05','ÿÿ‚\0\0\0ÿ‚\0\0',1479969013),('1f04e35cf9fd1b8256b3c5ed6f2a94ef','ÿÿ‚\0\0\0ÿ‚\0\0',1479971132),('1f068ca1e7e129ea06e291ac5be2bd91','ÿÿ‚\0\0\0ÿ‚\0\0',1479972236),('1f12002e685079928a7ec9b0f8de0975','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('1f25832e0d1dbf58802dd21eb297f1c1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971132),('1f48cd07751a4d6ffdc59c1f94383f3c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970916),('1f806bb249c18ca42827f209fec431c9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971960),('1f80cc5a89c7ffdab6c04c3e5ed596f4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971890),('1f86dfcfb6cdc6ebbee5e6503ff79562','ÿÿ‚\0\0\0ÿ‚\0\0',1479971986),('1fe383cf51bf6b311bb0434786e6ad46','ÿÿ‚\0\0\0ÿ‚\0\0',1479971840),('1fe7cbcc3e69d55d922623788b964dfd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('1ff4dfbfd45bab5a400adcca92613a7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('2008ad5c44061841941cf1b5c77faec9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('200fe68a1e6a7312de5b52fecec29027','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('20297911bd5d77534e30057936fef6a1','ÿÿ‚\0\0\0ÿ‚\0\0',1479969799),('202f8b13a24d710995f9ba8deb125744','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('204764d78b08f82346fd43202d9778a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972204),('204aed561a4f42b16157dc84bd778ff3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('20607226d5f6d55ca576dfa2ffdd1ff2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('2073897c494157b10adcf505f4ea5f02','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('2077323570c396a5db16d6028404d666','ÿÿ‚\0\0\0ÿ‚\0\0',1479968613),('20b48b64c31d4fe2e6c9907924bf96b4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971984),('20df7a162954b782c26ea0716db257a8','ÿÿ‚\0\0\0ÿ‚\0\0',1479969346),('210eddc28c60e3a47bd880af7145b697','ÿÿ‚\0\0\0ÿ‚\0\0',1479972377),('2132fd07ae1d68a7449bf09f7309c9e9','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('214089f1f14754aedc56a7f718841433','ÿÿ‚\0\0\0ÿ‚\0\0',1479969908),('21814e92012752b70d134ba34f022bc0','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('218b4a78c3669209141051d5f91c47d2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970513),('21ad9f803590ee7709f227692ad38621','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('21dc15eaa8e3aecd111077929f623cf6','ÿÿ‚\0\0\0ÿ‚\0\0',1479968463),('21f0e0069d17e2d75f47961b6bc55893','ÿÿ‚\0\0\0ÿ‚\0\0',1479968945),('21fdb6b0110d38f5324a5a9d2c1a68b5','ÿÿ‚\0\0\0ÿ‚\0\0',1479969920),('2208d941431f082a4246b4be14083a69','ÿÿ‚\0\0\0ÿ‚\0\0',1479968654),('221765f7e440291cd60e8a47ed7608ed','ÿÿ‚\0\0\0ÿ‚\0\0',1479972094),('22228134ec8c697a5c67a443e81a47f9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('226c0463e6b5da59f9af8e48ee81a95c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972204),('227883ffb170c4bbec4081ee324162e2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971948),('227f6adbd73335d9bb3ad4374079bd10','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('228aa02f16ce3ef31b2b68171763589a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971170),('22c0856daf58323301d273a602d84f1c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969951),('22edfacb3dd43f4660bc7eda53e8519c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969908),('22fef4111e0c79a3d1f65dc2aacd74d1','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('233ea9550d256dcc88f671166b2a101e','ÿÿ‚\0\0\0ÿ‚\0\0',1479968899),('234b087596de6c4422589c13c5ac7496','ÿÿ‚\0\0\0ÿ‚\0\0',1479969924),('235087d5c6819b866244a13d1772e5a4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('236fe2980d3d47cc19d276086844f6c7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970010),('23943dbd1eaf65f3a58ed63bdc4e1588','ÿÿ‚\0\0\0ÿ‚\0\0',1479971803),('23f654a69086a7f71f436ac969110db7','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('241f5362fc6281bfd85c4fd3f5ccca60','ÿÿ‚\0\0\0ÿ‚\0\0',1479971447),('243808e60e85b5601531b77f16bac2b9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971803),('24676f15cb604522353c7c5709b882e7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972208),('2480c8eba518d7d1c32feb9ec2f69006','ÿÿ‚\0\0\0ÿ‚\0\0',1479970472),('2486c7bdbeed1d6c80116a742b0e1ee3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('24a943bdbba3fd03b6b2ed58021dd9ad','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('24a9df3ecf44773c00b05dcf4d62bea4','ÿÿ‚\0\0\0ÿ‚\0\0',1479972208),('24e332e822d55d0b89854d28b03bdd30','ÿÿ‚\0\0\0ÿ‚\0\0',1479970970),('24f50faf7d4383ab498652b4de16267a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('24f5af86a3b784d2f6c6bc540c14d89a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968146),('24fc3fce56c6a30a1fcdcc95512a9fec','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('2507748323c459626603e0dac8472ad4','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('252749f6b333a381ca29cf1caab97f60','ÿÿ‚\0\0\0ÿ‚\0\0',1479968784),('2539dbc2abbb3bf0fe742c3675af7e5e','ÿÿ‚\0\0\0ÿ‚\0\0',1479969800),('2556ff0a002b08ec26b9580eb2320fa4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971111),('255794fc64306057f270ed9469d72c27','ÿÿ‚\0\0\0ÿ‚\0\0',1479970011),('257c4dd6e24c048dec89dba6de5de653','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('25babe141a6e482fc7a995db4fbb6ad8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('25bfe14f454c1e23fcaa003b684dcf79','ÿÿ‚\0\0\0ÿ‚\0\0',1479970888),('25c38a2edd1a8d8d20dce09ec477b82e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('26385d596fc378581c1ec656133052ca','ÿÿ‚\0\0\0ÿ‚\0\0',1479969949),('265ab1eb59fabf4584fc3c2cf4a3bb0c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971576),('26812fd941aaaf0657fda5c334a936ea','ÿÿ‚\0\0\0ÿ‚\0\0',1479968613),('26d7bd0db7195d87408a51052485efd3','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('26e817aabd650866d46810b94b9bd739','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('26ebffa1d294ffb19ddadd4005b19ccd','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('27015b21e032f2f5b06f81879646c850','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('271615d5aef272b77a3637d748f43363','ÿÿ‚\0\0\0ÿ‚\0\0',1479971692),('274b743bc6b59d6527c239e0437c9c78','ÿÿ‚\0\0\0ÿ‚\0\0',1479969908),('2764ec5af422d0d231af34ef4fb27673','ÿÿ‚\0\0\0ÿ‚\0\0',1479970954),('2798df5c6004f61c5adb423b00b157b7','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('27a7c405b76fd0e7949aa2a7e058b600','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('27c0d5d8e5548a00a40b90d37e682e35','ÿÿ‚\0\0\0ÿ‚\0\0',1479968612),('27f663c3dc73305af7f47fdde59477d8','ÿÿ‚\0\0\0ÿ‚\0\0',1479967866),('27fedb261177a3e7159738742b6d03db','ÿÿ‚\0\0\0ÿ‚\0\0',1479972243),('2809f0c3f88ecce4a6fab3805f8aface','ÿÿ‚\0\0\0ÿ‚\0\0',1479972066),('28250a60b337712a4b061f06c7f910ff','ÿÿ‚\0\0\0ÿ‚\0\0',1479970366),('283958ae310526ccbf6762cba631d501','ÿÿ‚\0\0\0ÿ‚\0\0',1479967854),('28b7dfa17866684ba7304a336baa70e7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('28c897bce77153762063054c549b8828','ÿÿ‚\0\0\0ÿ‚\0\0',1479971447),('28d5227b7210185866ef58d9c68a8d63','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('2927fad1f2974f66325d73fc881efcfa','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('298aac53da1e7fe511cb00f00bdff2ac','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('2a3c8dadb01f74b1ff956c47454fa0dc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970395),('2ab53f0fd90abe1b8a285f4074395f89','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('2ac8a3854ead574129734a97189bca7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971984),('2ace28ac74ced1fde79519b34414ad57','ÿÿ‚\0\0\0ÿ‚\0\0',1479968794),('2aded8f5c51279ff93f59408660f9d49','ÿÿ‚\0\0\0ÿ‚\0\0',1479970954),('2b24da8038772d2989e39c1b7f9a84c7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972141),('2b332258cf11c2f43132a53c0ec02c11','ÿÿ‚\0\0\0ÿ‚\0\0',1479972156),('2b3f56486966ebec0ba9aa21da8d57c6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('2b4c80fe48b1fa89bfea938155e0b697','ÿÿ‚\0\0\0ÿ‚\0\0',1479969325),('2bb29ca1b0bdcddc20a22a70b143637a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('2bc19d5d529adf7f72ccef145199923c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970040),('2bd5bd6a2ead1762bb6b03ec85c95acc','ÿÿ‚\0\0\0ÿ‚\0\0',1479971838),('2bd5fb37abc560cac83fe7c7cf910cff','ÿÿ‚\0\0\0ÿ‚\0\0',1479971132),('2bddb683fb1afb6a220db838a4c1faae','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('2be591b4bd1e6131c12f72bb90296b5b','ÿÿ‚\0\0\0ÿ‚\0\0',1479968784),('2bfa1f2b14acf382ce836d2e57da26b3','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('2c187915b1fe65a51c4d979ed0f4aa68','ÿÿ‚\0\0\0ÿ‚\0\0',1479967781),('2c208bf51b9c51bd17933a9887fc1698','ÿÿ‚\0\0\0ÿ‚\0\0',1479970010),('2c35dde0ff79cc8fce3cf8b42982124b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970954),('2c91314dc8797f8f3471858c55a9b3d5','ÿÿ‚\0\0\0ÿ‚\0\0',1479971101),('2c94b829d6928de2f0439439dcceff7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('2ce3f6fa1ee8519f1ded5b6b2171a56d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971789),('2ce761d57b72e937053c870f4dcdf268','ÿÿ‚\0\0\0ÿ‚\0\0',1479970412),('2d076d05db99ffdb48aaf2cbe06eef78','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('2d1478df9965156959c37637a53098e1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971946),('2d2d893aed27594adf04b6a4dabe3b35','ÿÿ‚\0\0\0ÿ‚\0\0',1479967840),('2d412b2dc1fa7301715677a2da796770','ÿÿ‚\0\0\0ÿ‚\0\0',1479971803),('2e3b51e826d052ac48824e50f568a069','ÿÿ‚\0\0\0ÿ‚\0\0',1479972353),('2e4ad7f4470270d29f5ee7381fe3c2a2','ÿÿ‚\0\0\0ÿ‚\0\0',1479967846),('2e4f8649a9e44ddceb5e544f79d9a0d6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971960),('2e62cfe731844014e5b535435aeb295f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970334),('2e7d30e7d43f6ce6e05a0791d809b0bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('2e7f77e480860b98ec4245cd13f62a11','ÿÿ‚\0\0\0ÿ‚\0\0',1479970022),('2eac47c76c90d24c128c6791a5604034','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('2ebea46f0d054d011cf17f12aaed2b3e','ÿÿ‚\0\0\0ÿ‚\0\0',1479969015),('2eeebeb799a025465512ecb188d0b880','ÿÿ‚\0\0\0ÿ‚\0\0',1479970963),('2efeb41e85ac67062ae9a757666ddd69','ÿÿ‚\0\0\0ÿ‚\0\0',1479971803),('2f124c33772c52b63f86e8cde212eb8c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('2f309a6dc5a175dd2c9d2ddb6bda2b28','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('2f521f34dba50fd875c91c494b27e0a5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970335),('2f9207d81289868d3c4b8552b6a71de6','ÿÿ‚\0\0\0ÿ‚\0\0',1479969350),('2f9649d33908b0f39a33ca7b90f91063','ÿÿ‚\0\0\0ÿ‚\0\0',1479967783),('3005bd3acc9f25dcbbf1cc50917f8356','ÿÿ‚\0\0\0ÿ‚\0\0',1479970532),('300cbd27cd42973d80cf278f4383a975','ÿÿ‚\0\0\0ÿ‚\0\0',1479971201),('301f728d154c2e0d63538840c3b9b3a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971010),('302c53d289b76bfc18e0771b8759d03c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969924),('303d24e0e54b002ad6867fd8362e4a36','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('3062dfbcf15ca2282be8722d3f4e2662','ÿÿ‚\0\0\0ÿ‚\0\0',1479970048),('3088aac1059e68d42fbc64873f03a6f7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972065),('30907bb68258f33082a376ea9093a4fe','ÿÿ‚\0\0\0ÿ‚\0\0',1479970763),('30f2d7e9c48bae5af5ff2b6142ca6d05','ÿÿ‚\0\0\0ÿ‚\0\0',1479967840),('310d4aa8631d55f17295d58a883931ba','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('31106d624cf29210caee46a06de88f17','ÿÿ‚\0\0\0ÿ‚\0\0',1479969013),('315e355bc712cf3e6f1a5abbace86799','ÿÿ‚\0\0\0ÿ‚\0\0',1479970340),('31cc03bc498f5a82a0862c89d5b56a20','ÿÿ‚\0\0\0ÿ‚\0\0',1479972105),('32071175d0acdbb4c4f1a1f8658643b5','ÿÿ‚\0\0\0ÿ‚\0\0',1479972065),('320720e963e996bca45414c390fd9302','ÿÿ‚\0\0\0ÿ‚\0\0',1479971990),('3218448f1154c9b49694f91501773bba','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('3250dc046bd86f88f2081085928655a2','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('325d31b677c65b9667d910ea262b4408','ÿÿ‚\0\0\0ÿ‚\0\0',1479967781),('3280ba65d06ad3a4bd4e0bc259c059b8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970055),('32e3f0213eceee0070ce4b08fee89c03','ÿÿ‚\0\0\0ÿ‚\0\0',1479971842),('32eaf372516cb6ced1b55c771889951c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971988),('332c00861e529083c4f49791ddae0cad','ÿÿ‚\0\0\0ÿ‚\0\0',1479968945),('332dce60343a7219b59e016b5e9db0ad','ÿÿ‚\0\0\0ÿ‚\0\0',1479971664),('33462ff54b9f7d1158a10153631c91fa','ÿÿ‚\0\0\0ÿ‚\0\0',1479970016),('338d8b28a5f8767c1feffa59883b06fa','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('33ab4dc46430243514d88e63511ebc0a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('33b36103f11b0d9db07de9e7d19e201d','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('33b846048d4833ca504d0e7763e642c2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968657),('3414c41969aa9c944ea6c24a873df486','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('34529cea83d398ee1b3e6e0725b879b1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971113),('345e1b8a32f85c481758a54e1b6543d9','ÿÿ‚\0\0\0ÿ‚\0\0',1479969001),('3461d5fc6c248a414cbb92acd046058c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972066),('3479e39e3ca409939e154aa067683b68','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('34c55c84efec87343618d268a0917f02','ÿÿ‚\0\0\0ÿ‚\0\0',1479970200),('34db6c6a07916dce1b6b95baabff90c5','ÿÿ‚\0\0\0ÿ‚\0\0',1479972111),('34e596b6b44f47a269b11b6819e388ba','ÿÿ‚\0\0\0ÿ‚\0\0',1479970855),('353a7e3643d3ad36b2b6ed8bf8230fd7','ÿÿ‚\0\0\0ÿ‚\0\0',1479969802),('35426fa0801a27c8f18e89efda7f58df','ÿÿ‚\0\0\0ÿ‚\0\0',1479972346),('35458060bede2cb4cf7546e132bb4fc6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('354780c00c78e78e6b80a3b467d53ea6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('3577e36dc8f9d786387f32ba86811671','ÿÿ‚\0\0\0ÿ‚\0\0',1479968654),('359c6b8e622aca2f55b1df828f3dc11c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969347),('35b9ebc7030b0ec353a2ec9597b7253c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('35cdfaf7c4d0ad44c3e45ebc53819c40','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('35f2f715035d6005ab4d4c40296fd325','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('361226bc54f5a39fbb6aa1d80572e45c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('366b9dac25ea743848198603d42e912b','ÿÿ‚\0\0\0ÿ‚\0\0',1479968945),('3693f0fcfc2e9995292c3960693cb409','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('369d1d336cb737275f21166ad7f1553f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970367),('36c24a1c58520a9d150910e71752ed39','ÿÿ‚\0\0\0ÿ‚\0\0',1479971010),('36ccd0b05b6a07b7542ae67e79f733af','ÿÿ‚\0\0\0ÿ‚\0\0',1479971446),('36e5ae39066b123f23534cb8f78578e5','ÿÿ‚\0\0\0ÿ‚\0\0',1479971576),('371b47ccb24f74ce814e4c20023cf925','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('37229415a0b95fae17edc024ad4e91e9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971803),('37a908341ec76ca1d0ea60fa628c5003','ÿÿ‚\0\0\0ÿ‚\0\0',1479968945),('380737afc2b43ba7f5e3c994c369d723','ÿÿ‚\0\0\0ÿ‚\0\0',1479971979),('38098be6ab1797bfcc0344091311e8ee','ÿÿ‚\0\0\0ÿ‚\0\0',1479971338),('3841dcedd871e238ca62b69cc7014c43','ÿÿ‚\0\0\0ÿ‚\0\0',1479972219),('384c097dd4bea64fc1491a38879a6cb2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970340),('38662e38dbb999b30f1e2e575b738283','ÿÿ‚\0\0\0ÿ‚\0\0',1479972109),('386a36670d42ce372cb2ab2dafe8cf1a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971001),('388b00b0590d33a92aadb73e947c95d3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('389973bbb450c59aaa7df85e6ae370f5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970989),('38aab8d039261900a31d7bdadd4ab3b2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971448),('38d43ff9895bde17b43f2d2c00c3684f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971960),('3909a0449ee015151823bd4173a73a45','ÿÿ‚\0\0\0ÿ‚\0\0',1479972377),('391ff1ad1c1ac313cd17926757236a95','ÿÿ‚\0\0\0ÿ‚\0\0',1479967840),('39205f7b6be3442b10d97ab196baf33e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971431),('3947af973527267ad5600bee69e9726a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('396ef77a5ae9f7faf95150543fc1e890','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('397b550c23532294dada69ef83653f09','ÿÿ‚\0\0\0ÿ‚\0\0',1479970370),('39a2a6a1313aa640d4f03a9f269d8242','ÿÿ‚\0\0\0ÿ‚\0\0',1479971111),('39a5dac6174590c4e7458a288f72d520','ÿÿ‚\0\0\0ÿ‚\0\0',1479969936),('39b91277904e89b69147d0fa89458d80','ÿÿ‚\0\0\0ÿ‚\0\0',1479968965),('3a2cafeb67b8735b125466b1ef1eb2ad','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('3a689eb2aee2a27f59cdeefac0f44b5a','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('3aa0a4592136491df6ab0230c2ead77e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971201),('3afac220b3a7f318f6c3f82dd23dddc3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970956),('3b3249ea18c2d8e0ade7bc94b8e47858','ÿÿ‚\0\0\0ÿ‚\0\0',1479969276),('3b3cdfe457f340fae1537a4a16fc233e','ÿÿ‚\0\0\0ÿ‚\0\0',1479972235),('3b83f245636eb038e96ccd5766912528','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('3b9fcb2edc58d63b99e434c1735d0a12','ÿÿ‚\0\0\0ÿ‚\0\0',1479972105),('3baa09203a0964cc6ee366c0589422f6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970011),('3bc990727ed6f0fa9b00f2e1186d1eee','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('3bffa46fe7e830765b68f49478f7ce50','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('3c29c36776e8fb0429e05e7ca410e4b3','ÿÿ‚\0\0\0ÿ‚\0\0',1479968612),('3ce031f4842d64c2d61d45de4322fa96','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('3d146396dbf7745966bda2d257c64707','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('3d93402742235aab6a9f136839bc53b0','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('3d9cd8c9452e16714858e02f03066c9a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969325),('3e15e0e32e72dd6a0d5429625facdacb','ÿÿ‚\0\0\0ÿ‚\0\0',1479969903),('3e3d6f5c3f11b934ec5cd73e1b866e23','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('3e8d2e8800803a92c8fa7305c588188e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('3ec8771d77067dc2a96bc8534b53430d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('3ecff8b5bb73e347ceed61b7d98ce5d6','ÿÿ‚\0\0\0ÿ‚\0\0',1479968612),('3ef91fb414a60180d59c0815c2b789c9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971788),('3f22a17d10d9d216f9ca75c830e0b5e4','ÿÿ‚\0\0\0ÿ‚\0\0',1479969264),('3f2e8e667a7423e6b6d4adf423c86cd2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('3f4627ff578dea39f459fdd0ecc1a8cc','ÿÿ‚\0\0\0ÿ‚\0\0',1479968078),('3f4747f3b59639a9e64af808f69498a8','ÿÿ‚\0\0\0ÿ‚\0\0',1479969325),('3f599d7a9d0cb74158d12608a6b4a995','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('3fabacc800173f08872188a8565c85f4','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('3feb1f6d99edb2ab9a1019dc3309944b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('4050d7645f686b4ad91f056ecc8b7ee4','ÿÿ‚\0\0\0ÿ‚\0\0',1479972085),('405232973a46f3f7576b868d3f230764','ÿÿ‚\0\0\0ÿ‚\0\0',1479971131),('4061e345b4733daef31d11e57e6cc67d','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('40b899c47160ee2ce583b949efe22421','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('40e4be5818198638e8823507d3622154','ÿÿ‚\0\0\0ÿ‚\0\0',1479968401),('4167f1d918f0048ac6afda653b4f3066','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('4171b2b87f762510e5f0357494f427a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972093),('4185c36fecc73d81ac20afd6eb72a2c8','ÿÿ‚\0\0\0ÿ‚\0\0',1479972247),('419c8b29f4c6eb19084fe432191f1290','ÿÿ‚\0\0\0ÿ‚\0\0',1479970338),('41c3cdd6b0edca406f48be7e9437be4f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968038),('424531920d5eeee916fec50f07b46104','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('4277013cf5aedbc3019a091c21dc7950','ÿÿ‚\0\0\0ÿ‚\0\0',1479968494),('4280020b69aa3965cb030443781ead4b','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('42a61a07f4e691fe72c3db2f293c193d','ÿÿ‚\0\0\0ÿ‚\0\0',1479972141),('4305c36ecea128bc45be07c48fe676ec','ÿÿ‚\0\0\0ÿ‚\0\0',1479968899),('43063be782e40d487d302e94d7b2e194','ÿÿ‚\0\0\0ÿ‚\0\0',1479970052),('432421c0f67edf6f4a27f529cb6fc86a','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('433e46d8c6e15dd454cedb8a2ea57f78','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('434d46625aaedf7ca9b14951ca6d70bd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('434e4237a2278a4bb9e5258ab26770cf','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('4370b53e5f2aaf97ee02ce2d0e10dacf','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('43cea8be910403168a3ce85bee7aa757','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('43dcbcbe384c406c01e4b62a60b19f52','ÿÿ‚\0\0\0ÿ‚\0\0',1479968431),('43f66c4c899b94670273125d50fa7fc0','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('44111da1460e064665dc3f924339cba9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970534),('4458d4f0226e15a101d1916ab15d8c05','ÿÿ‚\0\0\0ÿ‚\0\0',1479969325),('4482f555c19564d08aeaeb669643b5b1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('448b3ea22c31d1a15d4d08f9c8ddf8ac','ÿÿ‚\0\0\0ÿ‚\0\0',1479970006),('44e23d4fb54473304247c7e4ded8bba1','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('44ff639befcd7aa9707dfc8aeb986fb0','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('4503c804483dde67ac13ba076b6f3422','ÿÿ‚\0\0\0ÿ‚\0\0',1479970513),('451f6bd60b355fb308b088e988784bc5','ÿÿ‚\0\0\0ÿ‚\0\0',1479971445),('4532cda486f764cc78f134400ae5ec00','ÿÿ‚\0\0\0ÿ‚\0\0',1479972088),('454b91a9c6be890f72e9547134252346','ÿÿ‚\0\0\0ÿ‚\0\0',1479971788),('456eb2bc31717bd74b670d91f483a388','ÿÿ‚\0\0\0ÿ‚\0\0',1479970582),('45766dc097d5db32a06bcb601b467b21','ÿÿ‚\0\0\0ÿ‚\0\0',1479968786),('459a58a80a214e3c74654a6952b00216','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('46443652735e45d4cbbcd151923ea043','ÿÿ‚\0\0\0ÿ‚\0\0',1479971846),('46467f4852cec70b62334e6069cfdc72','ÿÿ‚\0\0\0ÿ‚\0\0',1479972092),('46571a720af706c28955e7a0cca4876d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970845),('468138fabd77c814f3a02d8fb3af6853','ÿÿ‚\0\0\0ÿ‚\0\0',1479969951),('468d0b675aae857a96eca29581c94f87','ÿÿ‚\0\0\0ÿ‚\0\0',1479968945),('46f31a6473188c31e4de50d932650d58','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('472a7595cd379410da1a714ef2c35df9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('4732fa8ec42a51fcba735d307f5d1049','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('47456e789134a6eebe6d4a48ec44aa57','ÿÿ‚\0\0\0ÿ‚\0\0',1479971986),('47486c9036b0e83b9c0ff17d5bf532bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('4761204af67bda53b018b0a2a499dc9e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971138),('4763385e0fc1733c071f61c8665e851b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('477609a1cdc9076a392962f2c21787bf','ÿÿ‚\0\0\0ÿ‚\0\0',1479971971),('481d9d56b0e28276568421bcad2a72d1','ÿÿ‚\0\0\0ÿ‚\0\0',1479969340),('4864e4106b21e4d27a1c4a8b630effb1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970048),('489878c3edceeb10f18e8af10c062d64','ÿÿ‚\0\0\0ÿ‚\0\0',1479968078),('48cb67389006b7c869b5288048a76dbd','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('48dbfe32c888bded77b7bc7efbcfb5c3','ÿÿ‚\0\0\0ÿ‚\0\0',1479972163),('48e6cceb8432c392cc60871c3660c8b0','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('48fdecd9e9db43775407b1fe47bf0dbf','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('492ffcca79aa625364a2bf2d7b686d3b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971972),('49521eb0a2c5fcc264e8b098d54cf430','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('498900d5b58b3abf934ee3a28bc33129','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('49ce0ea4440b2057158e90a9852086ea','ÿÿ‚\0\0\0ÿ‚\0\0',1479967866),('49d92a58b4586916c28408a9f8c67b25','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('4a28eb02e07b9179f2cfece1886c6e81','ÿÿ‚\0\0\0ÿ‚\0\0',1479971659),('4a4203e9d1118ebf9cb8b39cf121a7d1','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('4a4c8bfd0416e52f597a1f7f2fc42a5b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969337),('4a65c1fc217edc4d1222f8bc5fcc1363','ÿÿ‚\0\0\0ÿ‚\0\0',1479971984),('4a8e1156c69eeff5b6ad062457a2d370','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('4aa1b5c5463d251db66a0565d48ac340','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('4ae070e901e8380c067409cac2eb2312','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('4b5ba7aa6f8c15d33773dc3dc06540b4','ÿÿ‚\0\0\0ÿ‚\0\0',1479972065),('4c181a3ca9eac2f71ec042718147e398','ÿÿ‚\0\0\0ÿ‚\0\0',1479971838),('4c193b1488ea1fc66887491cc89d6a54','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('4c25149a7ec1690655326b2feb59ed47','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('4c6e381b5ab02cd88ac58fa67bb7061a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971258),('4c877db2f53577e221f35d914faad56a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('4ca27bfaf636541984e64572fa001f12','ÿÿ‚\0\0\0ÿ‚\0\0',1479970953),('4cb6c16e76cc858579bd2a7f15644aa8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('4cc79f794ffd9446f199e30fc5c6a254','ÿÿ‚\0\0\0ÿ‚\0\0',1479969951),('4d03302b09e9d09937a78cc74f57853f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970048),('4d09f8384ea0220a2ac925d75c20d4b4','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('4d1882c80c4379f3cb5a0617d9687f73','ÿÿ‚\0\0\0ÿ‚\0\0',1479967802),('4d31a2b43cb6e2ad5e48f1a26d1984a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('4d40d1f4a8553d697cc94279a545cf96','ÿÿ‚\0\0\0ÿ‚\0\0',1479970532),('4d7dbf4b02774e8d14a70aea0e1210c5','ÿÿ‚\0\0\0ÿ‚\0\0',1479972209),('4de5c9b6b50f5878f057ae696082dae7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970055),('4df5b22c4ad0a2cba0a08cac7ea15443','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('4e27e723b084c13e8d90b2d937691b7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('4e364f4ecd1b42c6400565875b1a51ac','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('4e6a12ef18345417354d98180beed8a4','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('4eb815d3d40be129cee8b622f6ca422e','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('4f41281f77e0845758d6fe415934edcb','ÿÿ‚\0\0\0ÿ‚\0\0',1479968146),('4f4a08af330d2e4de5661005c7c3d616','ÿÿ‚\0\0\0ÿ‚\0\0',1479970917),('4f645490cd1096b3f9c53024e2fddfe7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970532),('4f7141ad137ac5d15b01e7cf628eb4ab','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('4fa1f03bf38e868f4edda53b679e9c03','ÿÿ‚\0\0\0ÿ‚\0\0',1479969451),('503b5c98d605c8b1680195aa362225b7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('50544258bf3f09af265a8cc88781cd12','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('507d156453fe69a4c48d610765cccc9c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('50b41a4059d5bf125db538d94e6dd5ef','ÿÿ‚\0\0\0ÿ‚\0\0',1479970963),('50cac47aa9b8015da47949ba099c6a78','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('50f6841fcf77d40cb61a62d6e879be7c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('510df3d9e6517cd2893c99a3f9f60f53','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('51523f0df0d7860314896ffe7f84acda','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('5195bd95db945cae457b256a8be9b282','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('5198be54fe559185f3da06d7aa5fa2b6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970962),('5199535af2b0e5a14d594e3e7088eb43','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('51a92c011cfcd7c762282c334f1713f8','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('51d9b69ab1e7a973eb4b51e7b308474f','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('51e36e3826451e53dc5fca85052594bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479968431),('520a51442a3466886cf30d8460c5b38f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968612),('520bea50e42b9c6d153066f074fb1ed4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971879),('5252ffb0efaaf2198c5d552e61d6de23','ÿÿ‚\0\0\0ÿ‚\0\0',1479969903),('525d6ae3d56e23a8155d628722fb6b19','ÿÿ‚\0\0\0ÿ‚\0\0',1479970954),('527073be26fc5f1444962cebe1a1bb18','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('52ca884cb726f32612edb08e4f136d53','ÿÿ‚\0\0\0ÿ‚\0\0',1479968871),('52ec42fa143bcf40a4eae5df5fbb461d','ÿÿ‚\0\0\0ÿ‚\0\0',1479972096),('531f5299a51e81da221ca348ffcb8968','ÿÿ‚\0\0\0ÿ‚\0\0',1479972109),('532e9f1c2317f297e7e780bd4930dbd8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970045),('5354275b0e57dc12c9af5956385e57cb','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('537874ecb84fb4b6bb005335104a2082','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('53dcdf49fa0d1e6ed856ec1e696db117','ÿÿ‚\0\0\0ÿ‚\0\0',1479967786),('53fa0ddf53fa18d7d325cdaadc450acb','ÿÿ‚\0\0\0ÿ‚\0\0',1479972158),('54096fbf94f50f2b3f8acefcc1bcae92','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('543a4e174e12629c8ff0b8de774e37b1','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('543ca7610ae7e588152bfecbca60fc6c','ÿÿ‚\0\0\0ÿ‚\0\0',1479967781),('5467cd44652ad057247d136f242eb1ab','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('5494b04a1f03d3c8c6d529bb5cd3f2dd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('54969dc49aec0d24bd31272891b245bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479971446),('54971c8d5cfaa167421eb43dbc5cfaeb','ÿÿ‚\0\0\0ÿ‚\0\0',1479972220),('54a7dfb15d80925f3b46eeb5fd672f8a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('551bb81fcfdfbba9f185a91d06d7aff6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971446),('555d4744d60dd7b78e3b0fd99f954393','ÿÿ‚\0\0\0ÿ‚\0\0',1479968431),('556a051393523073d947fcd6a4a7cc4e','ÿÿ‚\0\0\0ÿ‚\0\0',1479968146),('5572271be5493ed778fa3430d0dba99d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('55761c7cb48e8ff2d59cf11a9dee877a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969922),('5587e31fefb59777bc1a70c71581bf01','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('5596e2284432e22afd4105fbdd8a1b05','ÿÿ‚\0\0\0ÿ‚\0\0',1479969346),('55a464bf10e9bc42550c550eb069f0b6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971971),('55a9abd80e6856cd1c78b4f087212507','ÿÿ‚\0\0\0ÿ‚\0\0',1479972104),('55c4c26bfb7c282fe315af60d79d5a33','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('55c6c1e2013158708e9f3deb298c3d64','ÿÿ‚\0\0\0ÿ‚\0\0',1479970350),('55da49dfd8c4895d56304a6e025268e1','ÿÿ‚\0\0\0ÿ‚\0\0',1479968038),('55db1ac0c1b85decc3b18090380603c4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970522),('56446a84c0e7522be50b68c888f3b074','ÿÿ‚\0\0\0ÿ‚\0\0',1479972208),('567a62203b8902567eaee2e57285605e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('56831cfc9c8ae5f563883e184d494948','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('56a7eaad014e360874e457cb76bc13df','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('56b2e242d8325d1c4d4e8213b80e76cd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('56b59c515fb81818ff7a2561ef44bb6e','ÿÿ‚\0\0\0ÿ‚\0\0',1479968350),('56ba9f56ec4ef4a62a994ec3f1954b7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('56c775968f555f767c1a0021568e7e3b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('56f516d3866fa25267e5ea43b28b5d5c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972353),('5719629161bc203fd3b63b9d3f5292bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('5746165994fb64ea8de079c18e6c8205','ÿÿ‚\0\0\0ÿ‚\0\0',1479971848),('5748af824bc90471b09f10fdc71be53b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('5758a523b66e0913725b47adc99627e3','ÿÿ‚\0\0\0ÿ‚\0\0',1479969265),('578eb89b867f039a50b2f25752a5a2cb','ÿÿ‚\0\0\0ÿ‚\0\0',1479971258),('579de65e1d60729ca0bb94de3ff1bf46','ÿÿ‚\0\0\0ÿ‚\0\0',1479972063),('57a81ec466bafce45c28b949db9db482','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('58015460764654cba858de7891ff2b63','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('5846071637f3483d7d0731f579686077','ÿÿ‚\0\0\0ÿ‚\0\0',1479971069),('587469fc95cdbff1212912f4094d688c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970862),('58bf366f2f9653960f546e897632f80b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('5907fbdc2cb2396b24c4b7bca6bab82e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('5909e1c8953054f4a02a8eb65dc40f83','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('59450bedbfb4ab715d6a78708e56c047','ÿÿ‚\0\0\0ÿ‚\0\0',1479969338),('598d77bb9959da111a00c6ac12e606f2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971979),('599a08a79c0ecfec14ef89a9384c7a20','ÿÿ‚\0\0\0ÿ‚\0\0',1479970019),('59f571e6ac8fd6a36093b177d5e9f02f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971986),('5a5267808e7bfb21c09f9fea342b0237','ÿÿ‚\0\0\0ÿ‚\0\0',1479970942),('5a8a141e3a05f64572f920f978d224eb','ÿÿ‚\0\0\0ÿ‚\0\0',1479970036),('5a92bfa31b4f0b4368ccc0c236e0a130','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('5aaf0f693dd62b27c880c9652f4a4b5d','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('5ab67b96232e51352495f639563ba3c6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971113),('5ab8c8ea117c4fc6eed861f33a3f242f','ÿÿ‚\0\0\0ÿ‚\0\0',1479967781),('5ad38f6b8d9dfa8638efabe85d228677','ÿÿ‚\0\0\0ÿ‚\0\0',1479972056),('5b4cc3768eabbdb6b224dbe044322a9f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('5b7133e60d478dc80b0870668c8a695a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969337),('5c31cf9bc2fa5e3be525be19cbf68923','ÿÿ‚\0\0\0ÿ‚\0\0',1479969267),('5c61c9ae65fca9566a28e907402e22af','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('5c7a85092204e38ac2b05cd6751260e1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('5cac5828bcfda189f9384ae22ed5111f','ÿÿ‚\0\0\0ÿ‚\0\0',1479972104),('5cad3dae65090c919feadd57d34fdff6','ÿÿ‚\0\0\0ÿ‚\0\0',1479972162),('5cde016cc139a24da2e0f4404a1ec2a0','ÿÿ‚\0\0\0ÿ‚\0\0',1479967843),('5d493c77d93927eb65c472a2df0ab2ef','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('5d5ac0707e2e85177497d588b171eefc','ÿÿ‚\0\0\0ÿ‚\0\0',1479972084),('5dc4c844f90f508b140965250de8a2ec','ÿÿ‚\0\0\0ÿ‚\0\0',1479971946),('5de0ea661d9c54bdbcc8d235d686376f','ÿÿ‚\0\0\0ÿ‚\0\0',1479972352),('5df70d3eb34c49bcbd06aacfed5d38c5','ÿÿ‚\0\0\0ÿ‚\0\0',1479968887),('5e8c77fc094ee56c31baa824212eb758','ÿÿ‚\0\0\0ÿ‚\0\0',1479968387),('5e9c0fd01d81ec034f4c5e377543d6d1','ÿÿ‚\0\0\0ÿ‚\0\0',1479969265),('5ecc92f8aa89f7ecb5ff915022ca4a53','ÿÿ‚\0\0\0ÿ‚\0\0',1479972208),('5ed8980ff5fb3643c7759c43ed61dfbf','ÿÿ‚\0\0\0ÿ‚\0\0',1479970049),('5f06e3890d7b3ca5dcb11c3bebea4fdb','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('5f2e69213d30a29dc6b133ce52e255b1','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('5f5f7fb14aae30b83f9d6680b1d7dcc9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971128),('5facd28e37b0c578ba58e94da7d30521','ÿÿ‚\0\0\0ÿ‚\0\0',1479971979),('5fd965a471d44ec27d3e3af984dfccc7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('5feee7ca5c0bf695dee27cb8dcc51275','ÿÿ‚\0\0\0ÿ‚\0\0',1479969350),('5ff5c570677a7d8ca70116c67eecb0ba','ÿÿ‚\0\0\0ÿ‚\0\0',1479970979),('6024dbfdf5cc49a469ca2839017d4083','ÿÿ‚\0\0\0ÿ‚\0\0',1479969352),('603c5c0216d6416a03e762bb74ba8b30','ÿÿ‚\0\0\0ÿ‚\0\0',1479967840),('6041f510f48d4a83e31b4bca74586b93','ÿÿ‚\0\0\0ÿ‚\0\0',1479969001),('6077b7a17c7691a4b60a9a6bcca2d9b1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('6090108321d675ca264eb4ce5b7e5000','ÿÿ‚\0\0\0ÿ‚\0\0',1479967809),('6097f6b7d891fea187d0a8cf4fc75643','ÿÿ‚\0\0\0ÿ‚\0\0',1479971446),('60a4930cbc4cd39b51eaaeae644f6be0','ÿÿ‚\0\0\0ÿ‚\0\0',1479968078),('610babf7e397a0912c23e034b93e750d','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('610bffeca2c04ad4cdacea4bd7bb977f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968677),('6127a9c5e5b10e891e361f705b26b784','ÿÿ‚\0\0\0ÿ‚\0\0',1479968654),('614c5be40898c473bcf73c911863a095','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('6179468ba4812ebdbc44e11499ef7f76','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('61af3bcf94d6d1bd1768c6b404283a1c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972067),('61b698fb3fba81913715609b424679a1','ÿÿ‚\0\0\0ÿ‚\0\0',1479968367),('61dc130cfc7681223582a95fc3091a2c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971848),('61f2cc57c4b8f5dd3163888aae647480','ÿÿ‚\0\0\0ÿ‚\0\0',1479971979),('62283154c7f1de50efd077be0e1bc681','ÿÿ‚\0\0\0ÿ‚\0\0',1479972065),('62327f656968cd39ffc802dc558bb2a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('623551b92b9405f7c1604a6da8325637','ÿÿ‚\0\0\0ÿ‚\0\0',1479971694),('623a3ccef5ec8f9dfadc389144ba193b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971043),('625d5d5150c4e7aec721ccd0709f03a2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972093),('6286074396b4a0158dd51405ab8535cb','ÿÿ‚\0\0\0ÿ‚\0\0',1479969020),('62a0edb082ee19d74871102c844875b2','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('62c71bb16aab094519e703a01676b3da','ÿÿ‚\0\0\0ÿ‚\0\0',1479970055),('630d92b5583b49648941c1b49f87c9ba','ÿÿ‚\0\0\0ÿ‚\0\0',1479970947),('63142860e2e38502031c1df3c37aa2d0','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('634ce0500c015feeea0ea7e3a133b3e8','ÿÿ‚\0\0\0ÿ‚\0\0',1479971986),('639702dcf95591c4049d6740b288b4f9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('63e125d8b347a955a6476b67bcf38055','ÿÿ‚\0\0\0ÿ‚\0\0',1479967800),('641fda152b9e3e906d9c28c84cd3099b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969938),('6480b1adf010c9070f4ac82c2ddf44b7','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('649077db696d23d933d4fc3c51127743','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('64921c6e9b394de65ab2a7bbcebff1cb','ÿÿ‚\0\0\0ÿ‚\0\0',1479972111),('6495891b5e8a18a8b5b7f64bab483b70','ÿÿ‚\0\0\0ÿ‚\0\0',1479972248),('64a0f61b2e0b59b7c97e79c93dcd6a77','ÿÿ‚\0\0\0ÿ‚\0\0',1479968794),('64d46ed1512b83d43f4565729497106f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('64ee64d120d49b142bcc0b9057316d54','ÿÿ‚\0\0\0ÿ‚\0\0',1479971069),('65174f0ccfc1bb5d45b51f097b1c526d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971338),('65195e6c886e393a59fc5d651d7e2797','ÿÿ‚\0\0\0ÿ‚\0\0',1479968654),('656819ee86a6b35ba66b750f4c7b020a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('657993a743269da86bf6028561ab001c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('65b34c11b3ba4eed1f7b6e051ace5dd8','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('65ec268cf033788402bce375971187c0','ÿÿ‚\0\0\0ÿ‚\0\0',1479972086),('662ffe273ff9fcab95761ec9b574cab1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971788),('663537cbc07ad8a5c4883badafdeddc9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970942),('665ab492dfc5b452740604c129e8cd24','ÿÿ‚\0\0\0ÿ‚\0\0',1479972206),('6682dbba5bf7a346bafe4cece9345bc0','ÿÿ‚\0\0\0ÿ‚\0\0',1479967800),('66901eb19dabbc7d31f1d9b54605d78b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971879),('66fd12c701b49d9e76c70a8818665a10','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('671d1d44f97f5aa6e9adcc3627e4972f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('6754212e3a94e4d1a6ffd5833298d862','ÿÿ‚\0\0\0ÿ‚\0\0',1479972128),('6775ab69e4f1f37886a6ef151684f308','ÿÿ‚\0\0\0ÿ‚\0\0',1479970350),('67a11b7643de511ab598c2508885106f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('67ad3af65835693d9c0356175176625c','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('67d243fb3f0e0881bfe1c01fa2343392','ÿÿ‚\0\0\0ÿ‚\0\0',1479970963),('67e913d20a6e5140af2d2a97bdd1b393','ÿÿ‚\0\0\0ÿ‚\0\0',1479971984),('67fcf8a3ddde5f9661ef59528efbeaa7','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('67ff50e7c0d994fa28429b546113d4e1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('683ca3fc735bfe0d546466b8ae6e30bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970534),('68b388df0eddbc7045a7b7898b6c7a8d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('68c511a3b2f84c784ac211f0c8eb1efc','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('68fa37e32f6fd31c4879c61381c9a235','ÿÿ‚\0\0\0ÿ‚\0\0',1479970920),('68fb7d88a210f428a247122ed4fbbed9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972209),('691233ffb7df5e4a35165e72637f0e5a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970350),('693ef7f6a91b7facb3b6dcdfe6bb462d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970464),('693f05d10ed6ba62bd0cdc388c27d7e3','ÿÿ‚\0\0\0ÿ‚\0\0',1479968786),('6940fea8c177dee5b44f4837f21604bd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('6954e4171b4816cfdee935a51fc72a4c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('697dcd1e4b97572bd40b9c6d2ff6a46d','ÿÿ‚\0\0\0ÿ‚\0\0',1479969920),('6998a15d24b04ab4d5b9cdf410f01f8c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972158),('699b8a37c11887339476398c52d4068c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972055),('69b840ffd92ca60e6c380c9cccfb6681','ÿÿ‚\0\0\0ÿ‚\0\0',1479971808),('69d565118ccbce1cc6c3d59c38ce8144','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('69db8b368f72441ee1e2040cb9c6df70','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('69edfd01ae461b2995e2b94ef4d76543','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('6a0cc4e2ee781fc1ac279a87b94cca13','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('6a487ba6f2a1b6020a562d733aa0fbfa','ÿÿ‚\0\0\0ÿ‚\0\0',1479971788),('6a68d2d868e5555444a960df9225c063','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('6a6eb815d3c420e103098b425b940120','ÿÿ‚\0\0\0ÿ‚\0\0',1479972402),('6a90859b2c0b5e09427648976ad82b80','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('6ad3782a9c43d13fed3a910f07dcd689','ÿÿ‚\0\0\0ÿ‚\0\0',1479971001),('6adb147df382e648fea3dfe42b65b682','ÿÿ‚\0\0\0ÿ‚\0\0',1479971010),('6af49665d9192352319724a7770233a0','ÿÿ‚\0\0\0ÿ‚\0\0',1479968871),('6af7736184503ffa49750d3a27f556c5','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('6b158cbed6569b0f27cb215d21e4a823','ÿÿ‚\0\0\0ÿ‚\0\0',1479972352),('6b31dae9573ad4f6c0f2d8b825a72cde','ÿÿ‚\0\0\0ÿ‚\0\0',1479967784),('6b4de912166027ff55ac9ba0264f9881','ÿÿ‚\0\0\0ÿ‚\0\0',1479970979),('6b7ebb4ab2152457f10ef6732e83826b','ÿÿ‚\0\0\0ÿ‚\0\0',1479967786),('6b8d6742ae170c42db9118dc363edc02','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('6ba6efeb7547945bc746b1ee272065f7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970763),('6baa2348d878296c1afd77816145ac7e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971977),('6bef636d324b27ef7d9a76a0ab05836c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('6bff5d9b534c05c817080e61f0598027','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('6c54ab6411e7e133a38e2a8bee78d12a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('6c929d4208e16480b1b899c8b577acf2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('6caaace2d76bf969248ece8be54bcebf','ÿÿ‚\0\0\0ÿ‚\0\0',1479970340),('6caf7c9f26d2530dc4b5961193d3db08','ÿÿ‚\0\0\0ÿ‚\0\0',1479972209),('6ce561231fb404cb3f6b5b38971065dc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970860),('6d43b756c66dc33dc06df8057ee5a077','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('6d7443963122353ea363d1bff959705b','ÿÿ‚\0\0\0ÿ‚\0\0',1479968280),('6d92a3e6f1b3bb65ac612882ee56b243','ÿÿ‚\0\0\0ÿ‚\0\0',1479967843),('6dc802cb7d31c1a22377e7692b930586','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('6de119b0923905ad0c849d49f7893637','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('6e87fce6a1f96630028d6e362216095c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971890),('6ec8c859b411812f228fcd12b27c9c35','ÿÿ‚\0\0\0ÿ‚\0\0',1479971120),('6ef6fe4fc990a8298f869b656a01c5f6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971449),('6f4ba1629ccbceeca3e02c57e2edb3c5','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('6f85387e17d429e14f3b5b062712047a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970367),('6fbe7c9a366a65dabe6516d4cbde4427','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('6ff04d11126ee7e48fc9327a4bad47a1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971136),('6ffd838e3ad9e216d1fd6b3caf38c562','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('7041988fabd1ea5018e2dc7b04fe80f8','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('706de1933f45571900442c7ec1df29a5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('70990fb8cfcfa3334f65adc52381ac41','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('70a5e14ddcc32a8ce6c01445c8dd2a5f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('70bf54060a77cef7b84da60d7113c74c','ÿÿ‚\0\0\0ÿ‚\0\0',1479967846),('70f5681a8407e33a531a10c8c2e6ed59','ÿÿ‚\0\0\0ÿ‚\0\0',1479970941),('70f5e92150391a32588a75790fe9935f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('71125a1038ac3c95c0f296c390601596','ÿÿ‚\0\0\0ÿ‚\0\0',1479971449),('71462f085593bb0b6a09c1275f7829b3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970949),('716bbd4ddb29b8949bae9f6a6a19e15a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('717463f661d7fa61c0c22c299ddd61c4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971803),('71978b68b772ca85c690a125f2b8a27e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971338),('71a64b57a5bee0e846f7ffbce43c77b1','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('71f386a481e0bab7806ddbb2ce0db2ec','ÿÿ‚\0\0\0ÿ‚\0\0',1479971788),('721a009bb4f6fe677e19ab02ccac94b9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972051),('723f8d998e0f444c92b393e0333cf4c6','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('7251489f25f80075fb9176ef029530e9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970962),('725f9e13066f86b5f6842598cf57b71b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971010),('7265849d19a8612dfbe2bb7ab2c897ae','ÿÿ‚\0\0\0ÿ‚\0\0',1479971879),('72764f66d0d03674f91158a802182d11','ÿÿ‚\0\0\0ÿ‚\0\0',1479971692),('727e5d99abaa54cde8501b37c672b479','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('72d704295f4ca6e0a0a94c7ef18b1cbf','ÿÿ‚\0\0\0ÿ‚\0\0',1479972145),('72fec78ec65485c9ef99659c6cd104f8','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('730e71431977bb6e3cfe0480deaf911f','ÿÿ‚\0\0\0ÿ‚\0\0',1479969925),('73287ff55f4f9a4fc4c86a42b933a44a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972161),('732c6a84d95c3df1f4f839ef5bc97b8e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970726),('73576355f25dbf977164d3ab8cf0d22f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970534),('736da90df60f1821f0ea7b8b1b22c0bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('7386edcce5e5a8bb77f8ecffe773adf1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971879),('739b480f90c381f2bd2eb711404e1a66','ÿÿ‚\0\0\0ÿ‚\0\0',1479971450),('739dce4f768c36a653a35ba9125e8646','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('73e2d4a2d213e36ec4ac4525a35f0b6a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('742576b3325121432430d3b6d104a139','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('7472cc604d7ecd252b19a7a53425a72b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972152),('74732e20662dd23b80df69400b67d6f9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972109),('748591526d9b1c8b1ec70329687ecab8','ÿÿ‚\0\0\0ÿ‚\0\0',1479971946),('748ac3e7bafaf19a5a17652a2493d688','ÿÿ‚\0\0\0ÿ‚\0\0',1479971788),('74a1a99aac3eb49ac2115ad704192ebd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('74af23ac53f5c5d044118cd6a637599c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('74c56d87e10b72f9f55cd350cfc9212b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972235),('750a90b2175d7ad9586d9ee4cf9863b9','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('751079085e185ffa975b4d11db33b896','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('75290d09b0b6e2773ced708ee3616b42','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('75a98204f42984bfe9879869ba9d09a1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('75e4572afbb9907a670d2d7e8179297c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969347),('75ea54b3f28843a94378afee2dacc1c9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('7612ce0ffaea1fef5f6bdf908f23355a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968657),('7658e400f44048c5772453fbb2189eb0','ÿÿ‚\0\0\0ÿ‚\0\0',1479968366),('7668a7662f212d9558c49b6e92b8cb9f','ÿÿ‚\0\0\0ÿ‚\0\0',1479969276),('767bfcbaafa668f995a3f399eced02a4','ÿÿ‚\0\0\0ÿ‚\0\0',1479969284),('767e35fee1fa6738ff23c26bdeb36dc9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970845),('768121510a007e62de95634b47c1f844','ÿÿ‚\0\0\0ÿ‚\0\0',1479972204),('76a1010c8f528bd23bd1efa47758eba7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('771c678ee761f8c266c2685ffe05ee8e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971789),('772b875a64ceb410188ddbb1f136f986','ÿÿ‚\0\0\0ÿ‚\0\0',1479970366),('7787ad9ef1bbb972546c8a584fe7ea3d','ÿÿ‚\0\0\0ÿ‚\0\0',1479967822),('77a3e3b96957c9915f0f4e9cd08e0645','ÿÿ‚\0\0\0ÿ‚\0\0',1479970855),('77aa3b97d3b38f99a409fe3efef805a2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968948),('77edbabab111f427845dc59882edae19','ÿÿ‚\0\0\0ÿ‚\0\0',1479970023),('7812ce225982b983d95d2e9801992874','ÿÿ‚\0\0\0ÿ‚\0\0',1479971691),('7835a2ce2905efc6d4ebaa551eb0fc22','ÿÿ‚\0\0\0ÿ‚\0\0',1479970366),('787219537f4027231923afd53ee73fa8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('787980420438323bbae7bfb5fba412a5','ÿÿ‚\0\0\0ÿ‚\0\0',1479967798),('78afbaed610b14f4951845b8931fc214','ÿÿ‚\0\0\0ÿ‚\0\0',1479968785),('78d877423d36db889c6fcef94726ec23','ÿÿ‚\0\0\0ÿ‚\0\0',1479970761),('78f149056a4280bac51bbba734aa7d8f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('791848962879e7d5f63692b23fb2d72c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970006),('792e58890e9aa57bec87e8a6ee959d6a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('7957ceb332802d1f87d5ef5866d14cf7','ÿÿ‚\0\0\0ÿ‚\0\0',1479967800),('79641c4c75d350b029cc1b6503fcc5ca','ÿÿ‚\0\0\0ÿ‚\0\0',1479970010),('7974f2656fc7dcedda3d59eabc675b0d','ÿÿ‚\0\0\0ÿ‚\0\0',1479967798),('79fa4771d7e9bac97cc3d127de5964be','ÿÿ‚\0\0\0ÿ‚\0\0',1479972219),('7a741baa49d99e70e492b59713a0a041','ÿÿ‚\0\0\0ÿ‚\0\0',1479968958),('7a7a167001e82daf617ee168e1aaa498','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('7aa110c4745c2826a5c7b74634180b70','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('7ab2c75c819c8e3190c4794b5ed99fd0','ÿÿ‚\0\0\0ÿ‚\0\0',1479971574),('7ad9a2fedb4b3445cc7654b851872107','ÿÿ‚\0\0\0ÿ‚\0\0',1479969341),('7b3445608c4d81cbf189f05193f31088','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('7b4c4b76fb95d40e5dba42fcdf02a6dc','ÿÿ‚\0\0\0ÿ‚\0\0',1479971661),('7b94aceaf2f565971f535a9a2a883964','ÿÿ‚\0\0\0ÿ‚\0\0',1479970556),('7bb539fa07ce8a5317ae43a249743e11','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('7bbdffbf5df9e009253395702b1f2780','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('7bd47d4da12a57bfd9db336552f7945a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('7c09e4cc91e8ffcd1e66705f8f63f370','ÿÿ‚\0\0\0ÿ‚\0\0',1479970942),('7c53184f2eb54894bcd7fa6968835641','ÿÿ‚\0\0\0ÿ‚\0\0',1479971502),('7c6a41c62b1591fb0649403a9e02bb21','ÿÿ‚\0\0\0ÿ‚\0\0',1479972054),('7c7060185bfd4f8e7400d92d23f62358','ÿÿ‚\0\0\0ÿ‚\0\0',1479972222),('7c74e5e39686d2e5cf3e663bc036c96e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971975),('7cba61b120191c90155cecd657551dfd','ÿÿ‚\0\0\0ÿ‚\0\0',1479971573),('7cce7df045e2973b246865bad8b8b371','ÿÿ‚\0\0\0ÿ‚\0\0',1479969939),('7cf0730e7e1a383c8d9a3eebf00826fb','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('7cf8db443e25eeb12528a702bb33bdb1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('7d3e85201d33337433bf883bd217d264','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('7d7e263730bac9601e2bd48c7927aaba','ÿÿ‚\0\0\0ÿ‚\0\0',1479971988),('7d880c995d61d3d5e7e980db9b43e2aa','ÿÿ‚\0\0\0ÿ‚\0\0',1479970962),('7d9c18d8906891cb8c71b9bf699c1486','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('7dcd7b466dae9ff168559457a14f191b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('7e5a57b81a3ba0272f9af5170b3e4431','ÿÿ‚\0\0\0ÿ‚\0\0',1479970994),('7e6954585f284bcfe0b59da73aa59e2a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968786),('7e9cd9839377c438aea8b49d5b32bfe2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('7eba458376257b6750b637d240823a39','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('7ec53608db5f482b4b15cdb64784d221','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('7f13c930618c6244796fd962e7735184','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('7f14e98f9e03f0c062c88115ee78de96','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('7f316e489d381a89a5c91241de7426c2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970012),('7f587424584da7d61a35ff51f763b69f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970513),('801206f0433d7d8f626dc5b633b46374','ÿÿ‚\0\0\0ÿ‚\0\0',1479972203),('803dc96e220af118a012ea8ff7c52720','ÿÿ‚\0\0\0ÿ‚\0\0',1479972402),('805f4640317e11632f289bb24b085fb4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971442),('808843c28db36d355b0bf1d227501cce','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('808ff70af07becae992a080be3318208','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('80a53de7c3be98ebf078b78a7198a1fe','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('80a5c1f96b48e5a859ecf52eca7ae981','ÿÿ‚\0\0\0ÿ‚\0\0',1479972424),('80d48825e2e96dd2fa06b28cf498d65c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969013),('80f5c810982e424577a284c6bc180ecd','ÿÿ‚\0\0\0ÿ‚\0\0',1479971848),('810e790c572f2ec1c0615961a1184a61','ÿÿ‚\0\0\0ÿ‚\0\0',1479967985),('8112d1d7eab72c0d5fa895215637f45d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('81241ad27fb554b71e80a0d080dce646','ÿÿ‚\0\0\0ÿ‚\0\0',1479971883),('815c37b3779079ddb20222c7c1782ba9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971167),('81641e5a97d2bf30772d207de2d966d3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970049),('81ace1f4d68ca6d5ffeac9a6c7cc7887','ÿÿ‚\0\0\0ÿ‚\0\0',1479969902),('81d1e3f17a0d610b1700c856400d6f37','ÿÿ‚\0\0\0ÿ‚\0\0',1479972206),('81f822b4d033014425900d4416af3a99','ÿÿ‚\0\0\0ÿ‚\0\0',1479971986),('8228db42d7468f3a832338ef5624b16d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('825afe874a9c0be4ed6f9dbc60720418','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('8261768f59fc5ccf9cd8bd8e1d4b7254','ÿÿ‚\0\0\0ÿ‚\0\0',1479969915),('827b00c52e75c99aa849a35e1b7778b4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971890),('8286002e55f95817f56ff2b1b51078d5','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('82895da498c8ddd60b909031d49ec27e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('829207004e715521a061bd8fe4d060b9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('82db87f9fce360abfc29bff635b79e47','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('83578619ad9096a10136b7a5d5413ce8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('83590296455578be560f530cac58f5eb','ÿÿ‚\0\0\0ÿ‚\0\0',1479970989),('8365b85589fe6b7a357849c64cfe204a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968146),('8375a7679cf2e33500c411f18c8d57cb','ÿÿ‚\0\0\0ÿ‚\0\0',1479967803),('837c0b453e877e71cbf8a0fe0ecf1a04','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('839ca826261df74dd0a4a865f52e3b3f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('83a336710745bc5ac3a48567919e26e7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972156),('83c8649740e7c109dae3a96613c78cfc','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('83cc4e36fbb3ce31c0760f10b2caa291','ÿÿ‚\0\0\0ÿ‚\0\0',1479970049),('83ed55e0027c290734f58a013e6388da','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('83f27dad0c738d66b1f90f56f56ec7ec','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('83fc16bf3b9590580c1503c63517e52c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('842fd81132c79ce3060f4034454b82ec','ÿÿ‚\0\0\0ÿ‚\0\0',1479971982),('8438462c2b5b380a9173c20bd822de83','ÿÿ‚\0\0\0ÿ‚\0\0',1479967984),('843c846fc28b1ab9826dcac1f0ac45cb','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('845c4eb246439ab8a39b23920844f21d','ÿÿ‚\0\0\0ÿ‚\0\0',1479969013),('846307a3c7f30c005a169973453a263a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('848e70448e78b7ed0220ccbdaaebf1f3','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('849c604c74f889d47f252a337f7cee5b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970917),('84dcf3a9e7af6e136ca71f6a5865d0c9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('8510244367891504e6145a1a9e505557','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('851858e7c6e17497f9971fb025c55870','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('851990a91690a600a3e05ba986e7db32','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('8528a83b10ff2090cfa9bde0c6974e81','ÿÿ‚\0\0\0ÿ‚\0\0',1479969812),('8538e2423785c074cda672605d219016','ÿÿ‚\0\0\0ÿ‚\0\0',1479970380),('855791514abc88d1174dd852f870dc15','ÿÿ‚\0\0\0ÿ‚\0\0',1479972084),('855ea31337310e245d6060c9340ae46a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('85a032e9d57ca967edda602caac3b642','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('85c42c7435801fb8c521ec7ad77f5b2e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971132),('85e7538703189219072596924e8b4fd5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970963),('85fb64e72303fbd4cf11e808659a42f6','ÿÿ‚\0\0\0ÿ‚\0\0',1479968366),('86188075010fcf59f271bc6c2996bea0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('862bbb75027e6efa14ca1039aa282599','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('868dced6b5454c430b08d59ffaf547bf','ÿÿ‚\0\0\0ÿ‚\0\0',1479968677),('8695095f169976707fc6643c5a459a7b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('86c1c6e516cc2ee3bdc10e407faca196','ÿÿ‚\0\0\0ÿ‚\0\0',1479969338),('86f379c2a34b72283f086c002eba73a0','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('8710ccccb88009b4c3a3581a52f65f31','ÿÿ‚\0\0\0ÿ‚\0\0',1479969903),('875260fb15c972b0fa78df57a885adf3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('875f5a9cdf3c36cd85039a4cc75b89f9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('876053404e5ae411c63777277b24998a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972235),('8765380e0d6de920e472ed60aad6b243','ÿÿ‚\0\0\0ÿ‚\0\0',1479970963),('8797c295f00770fab78adc583c24bbd3','ÿÿ‚\0\0\0ÿ‚\0\0',1479972083),('87a23de82a84fb038de081143886f792','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('87bb7e32e529652cd3fbcbcd8204b8fc','ÿÿ‚\0\0\0ÿ‚\0\0',1479971879),('87f2eccaf4952b80138b36a52d0594c2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('8805df4a8c5f738925dd463d1b5b4d5e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('881e19c4570e24cdc1c1056e23311050','ÿÿ‚\0\0\0ÿ‚\0\0',1479972093),('8875a8c9389bc52ff58d855a494e3f4d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970350),('888ae82748469cf0d9bec6cadee42995','ÿÿ‚\0\0\0ÿ‚\0\0',1479969013),('888bd765c3e22d65d727e27618c4222c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972235),('88946dac8381a8537077c06778697791','ÿÿ‚\0\0\0ÿ‚\0\0',1479971979),('88d7751ef3600fcffb05bd90645001b4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970979),('89077b6cb13f8e38c79e09e9d7a49e58','ÿÿ‚\0\0\0ÿ‚\0\0',1479969001),('892f873f11d2c1606afdd64e40e97b33','ÿÿ‚\0\0\0ÿ‚\0\0',1479972141),('89377df1e32a326c5eb7e93457918d0e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('8941716c7a7430a10e9d3c11a40cbe7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970582),('898db6aa723c5dafa93159b3fc7a32e3','ÿÿ‚\0\0\0ÿ‚\0\0',1479972084),('89a2f6e7b154fcf38ef1c16cb8538863','ÿÿ‚\0\0\0ÿ‚\0\0',1479969015),('89e81342d024a3572222488fa0f0250f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('8a1af55c51392c23ca04b27f6c86e67a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('8a3b5372c76969ae34675496a50b34a5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('8a52a8db8685d06d4dfa4dfe782eb6a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970055),('8a9014909c50207d90d9f0ea77a26a82','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('8a939f27978555178bfc50f9e69ba99a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('8b1924848f2a3936980e028c282d50ea','ÿÿ‚\0\0\0ÿ‚\0\0',1479972109),('8b22c51f5262de607ac81ab53482033e','ÿÿ‚\0\0\0ÿ‚\0\0',1479972063),('8b70939467973319f69b9597995bda96','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('8b7abf3f1170b7016299a72917738d92','ÿÿ‚\0\0\0ÿ‚\0\0',1479970534),('8ba6db63dea772bddc9e346c12fe1fc9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('8bec2a9acaa02670c734809014ff027c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971979),('8bf8c34f661286113cf687429026cc71','ÿÿ‚\0\0\0ÿ‚\0\0',1479971694),('8c3608eb7c81b422a3233b931a582e3b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972247),('8c529773d00878f0709490686a31d407','ÿÿ‚\0\0\0ÿ‚\0\0',1479970989),('8c6366e14c60a46b474b53405215208a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('8c793b59616638125d8131061437305b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971114),('8c7bc7ee0d0b16806ca935bcd949d02d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('8c7bf6062a7bcc514febe1da16adf6aa','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('8c94b046a14ec39268060c50e6b0ce77','ÿÿ‚\0\0\0ÿ‚\0\0',1479972086),('8c9e485c16a36a34750f2b407ae922e0','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('8cc82c7491dd405c91d5210f8ef05fca','ÿÿ‚\0\0\0ÿ‚\0\0',1479970055),('8ce2aeb567730f1b19d1b32894118b01','ÿÿ‚\0\0\0ÿ‚\0\0',1479969451),('8d424d616f376f144508829cfa1ce01c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970954),('8d5ad2b266490f656f14cb1ff0bfef5c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969325),('8d62300e647a931d5e4b13c84eeead71','ÿÿ‚\0\0\0ÿ‚\0\0',1479969264),('8d6397f8df521aeb06789d97cf7f6940','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('8d6c9ba3877ecc9722670bcb9a13fc87','ÿÿ‚\0\0\0ÿ‚\0\0',1479967793),('8d74dbbc6cb66c62d45658fa22c32de6','ÿÿ‚\0\0\0ÿ‚\0\0',1479969799),('8d8d98c0224209c2e3bf315263da3632','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('8da5ffe10fae7113c2dcf4605b3c5c54','ÿÿ‚\0\0\0ÿ‚\0\0',1479972235),('8deddd9cfcaefb2c7668520a0bd206a7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972054),('8e154971c9574a46e0758e9e761e0406','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('8e1a18d0e75f97796a00241011da72fa','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('8e2c115bd78b53378047c466686cb1ee','ÿÿ‚\0\0\0ÿ‚\0\0',1479972109),('8e6ae2ea1b02dcd2988d19cb9904673c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970472),('8e758d9d50212f373bc5f8cec18595d4','ÿÿ‚\0\0\0ÿ‚\0\0',1479969924),('8e83bb791d2f00ee6dac347625124c41','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('8e917d0f41543c3eafd8ae9cb6ae2527','ÿÿ‚\0\0\0ÿ‚\0\0',1479972220),('8eb92faa3bf414f987a282025caadb45','ÿÿ‚\0\0\0ÿ‚\0\0',1479972105),('8ed21535c948f90208401ce49d97c1dc','ÿÿ‚\0\0\0ÿ‚\0\0',1479972402),('8ed22716a7ca038b482b426649fa2250','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('8eda5a0c73483e5af31ad7098a86a5ba','ÿÿ‚\0\0\0ÿ‚\0\0',1479971121),('8f20b04a667c149801bcdda6c4500cc6','ÿÿ‚\0\0\0ÿ‚\0\0',1479968038),('8f3274d622288e41cbc88c492e664d1b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972111),('8f59ebe64f899347354179027c353b5d','ÿÿ‚\0\0\0ÿ‚\0\0',1479968053),('8f5ddd48a0870668ca6008d2f8c5d753','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('8f615027c3a20dafe901b6e7cd969539','ÿÿ‚\0\0\0ÿ‚\0\0',1479972065),('8f6aceff6d0fea5cab8f725dd3cb3e86','ÿÿ‚\0\0\0ÿ‚\0\0',1479968657),('8f85f77b7448efc8577c9fe1d26ac8b5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('8fa0b7cdf1eb8791d8e2e770a97a991d','ÿÿ‚\0\0\0ÿ‚\0\0',1479968654),('8fd5a9f34cafab85f24b36f6572022ab','ÿÿ‚\0\0\0ÿ‚\0\0',1479970335),('8fe6e8c4415d4dcce6937d091f55e665','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('901dae3fe82db176f3c06a4f3baff268','ÿÿ‚\0\0\0ÿ‚\0\0',1479970726),('90488fc31bd066fffaba463b6f3aa8df','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('904caef5183625918eb28b67034f6e60','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('905e4bd19ab6e48f901aba0cca35560c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972402),('90dc45857d1da73869ebd326951d6f97','ÿÿ‚\0\0\0ÿ‚\0\0',1479970979),('91173da99bf61a1b09981e9c572f56ca','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('91ab70cb75aeaaaf059aefda5dd59419','ÿÿ‚\0\0\0ÿ‚\0\0',1479969953),('91b6d7e4b365f27415970af24b264039','ÿÿ‚\0\0\0ÿ‚\0\0',1479969907),('91c74d0f7935adc02e4cab8a5953f742','ÿÿ‚\0\0\0ÿ‚\0\0',1479972092),('91de09ebe731261d51a55f4915cf104e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970395),('91f77cfd1d0799682f704bbf5e2de51c','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('91fc1c8850ab7e08e3355dce6a73fa2d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971448),('922b83730b923590abc60820a850f00b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969924),('92547a002ba9651c39f3c91e0a8a141c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('9261b30fa0666dd45a5299b3fdd1d6a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972433),('926a7ce15a677a5177b9f3d13c07f604','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('926cf7b7e924e3a66f35b183e0c60549','ÿÿ‚\0\0\0ÿ‚\0\0',1479968431),('927eca79d2e8c12fdff2889607c6cfaf','ÿÿ‚\0\0\0ÿ‚\0\0',1479970963),('92863322cf825bdcebc565940cbb75d7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970917),('92889a96ea3fbbe1a8c83969088210cb','ÿÿ‚\0\0\0ÿ‚\0\0',1479972247),('928a1c4010b26d3c19616b5ab216dab1','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('92e32ab46e9519cd2a81c78f6bbad1e1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('92e4c8167914130df7e31ec3fcff77bd','ÿÿ‚\0\0\0ÿ‚\0\0',1479972067),('92eed437b3a2bcc73590ba787953dbf1','ÿÿ‚\0\0\0ÿ‚\0\0',1479972220),('9352ab19bdcf871de1d68a4988a14e92','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('9359d99d073af89073b4574067508b3c','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('93977e64d5fe13209436d236c55cdebc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('93c4700222fad437b5d0216cd4e9325e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971000),('93cfaaea7069cda316242470b4be50ab','ÿÿ‚\0\0\0ÿ‚\0\0',1479970763),('93f056df5e8ae9a0751c9a7fb8109228','ÿÿ‚\0\0\0ÿ‚\0\0',1479967809),('9436f266f5b17597724bd1774df5c7a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479967798),('9466ae98837b933264079623a859e2b0','ÿÿ‚\0\0\0ÿ‚\0\0',1479972352),('94a98564316a109094e31ea20dadd82b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970727),('94b415cf78b3d59036814f1f59949e84','ÿÿ‚\0\0\0ÿ‚\0\0',1479968612),('94bc99a32439c3d3cd430a5279dc7ae1','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('9513e1518495b651dee0eae7a6c3c183','ÿÿ‚\0\0\0ÿ‚\0\0',1479970370),('9531cc014d851fadb0ed3b0e6ebf8d01','ÿÿ‚\0\0\0ÿ‚\0\0',1479969362),('95490e3f960882380c557aedf53335f3','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('95a322c5f13846db38e77f38c6526dbe','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('96167d04eb8a751d21c5933b52ce072a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('9731ad590d8a363fb0c62cda03193cec','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('9740d16ff76d69229ff357830ea7234d','ÿÿ‚\0\0\0ÿ‚\0\0',1479972065),('975b3d196cbc9084e34b049c6695bdc0','ÿÿ‚\0\0\0ÿ‚\0\0',1479971659),('975d2919e9b31429fbe429c267ca92b8','ÿÿ‚\0\0\0ÿ‚\0\0',1479969922),('975f2ebfb5a47bcb3ff466232ae0c9c3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('976a26cfe01e044235b70864d3f97dfd','ÿÿ‚\0\0\0ÿ‚\0\0',1479971971),('976b4a176cbeb7f4e0e9f82fc8cc49bd','ÿÿ‚\0\0\0ÿ‚\0\0',1479971443),('97ed95812a1aef59621a508e401b8ff5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('983db0bb81c49a84dd344e192591a05d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('9872ad737dd29b0c5574b9807bb1b114','ÿÿ‚\0\0\0ÿ‚\0\0',1479970051),('98b9467ecb012a142fbe19a2d62faace','ÿÿ‚\0\0\0ÿ‚\0\0',1479970947),('98caa380a358b8a33a522a611c6c753b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971972),('98cc6434a985b42da0c2cd5568970113','ÿÿ‚\0\0\0ÿ‚\0\0',1479970761),('98d760bed1f6ca0da7b0750b8005381e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('9948e166b36bd55c63a0abcfb707a4a4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970476),('994cfffe240b4da8f9b9d1e8f601a6ed','ÿÿ‚\0\0\0ÿ‚\0\0',1479967781),('9957fb66af372b7cac8b185d26cbb2f2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('999162913d545abd71c70fce7012154a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('9996fbf4d406db6d3d1c23078e822a5b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969001),('999763240acecb5cdeaf2ff1003c7cf6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('99cd52eb849779c38b61652d4f58a4e2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('99d96da815553948962ee8eac5fb172f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('9a1c335c6758f0ff46f5f59fc76aa147','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('9a2ab8afafeca07d97cc5e9a57271150','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('9a661dfe0913b9f5a4727fc2ee4f2757','ÿÿ‚\0\0\0ÿ‚\0\0',1479971204),('9a76e7f9b2ff760cde458edba447ae65','ÿÿ‚\0\0\0ÿ‚\0\0',1479971043),('9aa0b936e11a6c8aa7b51d180e89cb9e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('9ab02bbf93c0c0a91f0600cf7e12afee','ÿÿ‚\0\0\0ÿ‚\0\0',1479970887),('9ac8850557521188219d92d6ad07c980','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('9ad5ae74175f39b2de90090c396b14d6','ÿÿ‚\0\0\0ÿ‚\0\0',1479968948),('9b1bf8b00d1568532e28148b7ced5602','ÿÿ‚\0\0\0ÿ‚\0\0',1479970942),('9b2ce5f7c32b03ee1b8bd4f627750f83','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('9b31a34e1fae820098167b7dbac5108c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('9b396120e87873d0c5335f8a5037a8c9','ÿÿ‚\0\0\0ÿ‚\0\0',1479968367),('9b8346b04f1b4e1de56c3d5a638b2d23','ÿÿ‚\0\0\0ÿ‚\0\0',1479968965),('9ba114167729f3c5c90bdd3f531d986f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970968),('9baf94bab6a80ce6ef5b11bfcae2d0d9','ÿÿ‚\0\0\0ÿ‚\0\0',1479969341),('9bb88b773665a05a52ad3de0ba1c64e8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970395),('9bb91ea80db5878c3bd74d81fda3b091','ÿÿ‚\0\0\0ÿ‚\0\0',1479971167),('9be829de0f484e5b0361ad6a27121653','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('9bf37d8cf8e48a8d955266b62655136e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970862),('9c0102fcbfd38ffa2d06804df363a719','ÿÿ‚\0\0\0ÿ‚\0\0',1479972163),('9c19b4b85863ec5bbae11f3a0e1ebf15','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('9c2556e84298849112bcc88f8f6dc811','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('9c2d144ea7dbba903872e37d2636f3f8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('9c4d66ea863e9e86e388d31fa828ff4c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971984),('9c505ad2376fe44d47c8a4ed83cf17db','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('9c8661bbf5e14d3d186ccc1f24f58b07','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('9ca028958772f544b53fd90f4d602aef','ÿÿ‚\0\0\0ÿ‚\0\0',1479971111),('9cb14c6d2ce067994679ede6b11a7f31','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('9cc32df32b7041632358c49597c3a46f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968654),('9d10922f91789c02f5f0edfd3057ea36','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('9d1f44030128c40d0157256655177cbd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('9d46367bd3adc8dd717216e2b7a1267a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('9d5309db1668085270d9615e0fcb39ee','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('9d5fa8db76c0375ab77016b41c4657ac','ÿÿ‚\0\0\0ÿ‚\0\0',1479970055),('9d70fa57d9080b0a10637ed4fcf18b8d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('9d905c0d43ab647201d20df71258931c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('9dbfc07eeb00f7f4ca645ff289bd529b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('9de64279d060f716f54ab699837e7387','ÿÿ‚\0\0\0ÿ‚\0\0',1479971990),('9e72083e6aa1016120336c6eabdbabd4','ÿÿ‚\0\0\0ÿ‚\0\0',1479972089),('9e7e4e6396919315d9fe8bb15487aa93','ÿÿ‚\0\0\0ÿ‚\0\0',1479970569),('9e7f6d2759e981aa36c3a813738f3cda','ÿÿ‚\0\0\0ÿ‚\0\0',1479970534),('9ea60b4c5cb0d0703b303e3f1f1158a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972363),('9ebf9814fadb335d80eeb3ca4738bc51','ÿÿ‚\0\0\0ÿ‚\0\0',1479972093),('9ef17fab149f0cb27a0260c2af838893','ÿÿ‚\0\0\0ÿ‚\0\0',1479971576),('9f7ca566617794d39e759ebc9aa99535','ÿÿ‚\0\0\0ÿ‚\0\0',1479972353),('9f822e004a284a8a58b2e0561f7f64e3','ÿÿ‚\0\0\0ÿ‚\0\0',1479968367),('9f9e999c6571c5fe5292d098e4ab99bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479968494),('9fa170db12b2afee25714d6bd0787ebb','ÿÿ‚\0\0\0ÿ‚\0\0',1479971167),('9fe825f4723edcd21fccffe53684f047','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('a010ecea13f7a1a74e8b29bb0db72e68','ÿÿ‚\0\0\0ÿ‚\0\0',1479971573),('a0c224df103117d2c31aacde7c46bfff','ÿÿ‚\0\0\0ÿ‚\0\0',1479969908),('a0e8e48f0bf4d513cf7806da27a48a7e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971573),('a119c91d00b55f2f5a11e2588f590291','ÿÿ‚\0\0\0ÿ‚\0\0',1479968947),('a16624b6e64ffd6fd6d33885a2280a17','ÿÿ‚\0\0\0ÿ‚\0\0',1479971593),('a17a25b7297e24e9544b4de8cc817651','ÿÿ‚\0\0\0ÿ‚\0\0',1479969908),('a1c68bdde37c3d0ad62d3745a6f77906','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('a213864ce219e648daf171988f0d1423','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('a224880faf39031d00a4d6579b5310ce','ÿÿ‚\0\0\0ÿ‚\0\0',1479971986),('a227679415c592e6e1c0fcd6c54a8bf0','ÿÿ‚\0\0\0ÿ‚\0\0',1479967840),('a22997f44f02bdd8bac1130b19697ece','ÿÿ‚\0\0\0ÿ‚\0\0',1479968947),('a232d299b6188164a61358490d382e04','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('a2496f20a489017681cf07158691fd8c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970007),('a27ee91da9b514717a5ed68b06277273','ÿÿ‚\0\0\0ÿ‚\0\0',1479968945),('a28bd973bbd1307b907a66085e63fab5','ÿÿ‚\0\0\0ÿ‚\0\0',1479967781),('a2a275a23a28b3f074472e16082e41b5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970731),('a2c0472141207d2bf308ac909f16b52b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('a2d789667528928fe0c78df3c8f58884','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('a2ecca61dd5aae87b95fd0a209233d05','ÿÿ‚\0\0\0ÿ‚\0\0',1479972109),('a30a63cd5e2fdd2224111f5a03e22dd3','ÿÿ‚\0\0\0ÿ‚\0\0',1479971170),('a315c3a2f87ba9a068a709f8235dc78d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('a3333db77effe4437c23233f43cf2aab','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('a35ee2771a5f1890d8c89efc7a2a338f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968038),('a36403df575fd4486e433773017fe746','ÿÿ‚\0\0\0ÿ‚\0\0',1479968253),('a389694d91da111fc963a5c8fb48425f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968654),('a3ae95d4abc5405c9eb2290ff0e96375','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('a3de7d22bf952ea75de1013ef94d0bdd','ÿÿ‚\0\0\0ÿ‚\0\0',1479969265),('a3e2591238d13a4a6342305d6a361bd6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971838),('a40177a602abd95057160922fbf9ddf5','ÿÿ‚\0\0\0ÿ‚\0\0',1479971114),('a4175367175138e89951eb4db77253ad','ÿÿ‚\0\0\0ÿ‚\0\0',1479972247),('a41af6c4d143be023eeea395be4ad780','ÿÿ‚\0\0\0ÿ‚\0\0',1479969903),('a47d3d9b57f68bb841c825eaf8fa3a6c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968945),('a4ad1d989596405e43763aaaf8bff602','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('a4e162a58253c6526ef42902b49298af','ÿÿ‚\0\0\0ÿ‚\0\0',1479972068),('a4e830a7b8ac99ff93586def5be46a73','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('a506b53d35bf9004f3542f31f93f8ac7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('a54e9aab45170ef634de687d6ce24770','ÿÿ‚\0\0\0ÿ‚\0\0',1479972055),('a56b1e16cf545f04831ceab0ef933bf8','ÿÿ‚\0\0\0ÿ‚\0\0',1479968350),('a5918a50f2980518ea296652a587058e','ÿÿ‚\0\0\0ÿ‚\0\0',1479972145),('a5933b595f3ab4885a8bde48e52a878f','ÿÿ‚\0\0\0ÿ‚\0\0',1479972104),('a5af21cb789c390a7676287eb92cef15','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('a5e756c8307981509efa4fcf8ddd6d00','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('a61abece533dc7db59520a7242f2508e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('a61ef6600edd7f3526d25960bd46e1ed','ÿÿ‚\0\0\0ÿ‚\0\0',1479969925),('a6794932363cb119e347f0c2ffed173e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971848),('a67f0998c79cae71e2ed734e46c79175','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('a6f130ae3b53fda96050d97a1df01fc0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970522),('a715f370139d674c40896cd98e0fc5d5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970942),('a71eb0873ab9af8d59e5d91c0189b2f3','ÿÿ‚\0\0\0ÿ‚\0\0',1479971338),('a72df2171b3e70b48baf71ca722fde9f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970996),('a7423d2f023ddaf1a54623df9fd3ed82','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('a742c3ff179548ad6342ac97ba2b668e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('a762550607259d6461fd9afd4fa50437','ÿÿ‚\0\0\0ÿ‚\0\0',1479972129),('a769fcd7c3fcafac04aceb22c8c42f9b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970887),('a786458824c6b7e95842acea040f59db','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('a7a5d51e5fa0cd342fe710e21dfe1265','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('a7a6bfa9146e89bf339c6935880d83db','ÿÿ‚\0\0\0ÿ‚\0\0',1479970916),('a7a9c6ffb6da34aaf640830805a3c788','ÿÿ‚\0\0\0ÿ‚\0\0',1479968038),('a7d40809c51606872b47d30430bf084b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970887),('a7e906ac824f009d5a72e1a79d2c0711','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('a8270c1296bf6dd825b23f60b44f3e08','ÿÿ‚\0\0\0ÿ‚\0\0',1479970340),('a82ff9a16e4a1720e9ee69c4a9f8b59f','ÿÿ‚\0\0\0ÿ‚\0\0',1479969801),('a86aaee1fbcfdb63c8c317748592b602','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('a87ae721625dfb3e392bfeb2be812a8f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('a8a09030c0a8e13af2c9189e8f307312','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('a8c49da9ceed2fa9714d56782ee38954','ÿÿ‚\0\0\0ÿ‚\0\0',1479969362),('a8d21afec3b0b6039c6f32681e8c699c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971114),('a8e2c423266b98a633b86036b12dba7e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970041),('a927ce95b1689483a2a9a9b23ec8e212','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('a94f6c0df6b4db18f0360579e29588b9','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('a9682d3d717a74d85c4e49873dfe2f14','ÿÿ‚\0\0\0ÿ‚\0\0',1479971170),('a9743b628185eca4e682699f8d3cc967','ÿÿ‚\0\0\0ÿ‚\0\0',1479967786),('a9f9fea818b1b49d88d9ffe9d1952f07','ÿÿ‚\0\0\0ÿ‚\0\0',1479970569),('aa5d7e51c9d47d55f4193acbd50028f0','ÿÿ‚\0\0\0ÿ‚\0\0',1479969264),('aa87056ef961b4c41e5fd4d97bcc26c3','ÿÿ‚\0\0\0ÿ‚\0\0',1479967985),('aa992a328c6afbfd4f7d1bda081774d0','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('aaf3c43cb5eea443c3738949b71b612f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('ab0895852e56aea973d034354d019a02','ÿÿ‚\0\0\0ÿ‚\0\0',1479972152),('ab251abfb59958ebf70b46df5336e0de','ÿÿ‚\0\0\0ÿ‚\0\0',1479969284),('ab27b80ade709d16a333717f2c3968ac','ÿÿ‚\0\0\0ÿ‚\0\0',1479972247),('ab2937ed8ecda1bcb15d04f69594723b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970947),('ab3816ce8818155d3041a5e095f0e690','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('ab6367f9053d8b19adfc68586dedc6bd','ÿÿ‚\0\0\0ÿ‚\0\0',1479969013),('abb09817ecb1ada753036a627df82393','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('abd36f279c235c4920e53718493e13f2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('abef60323636f6bb0e51bf169c63113e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971843),('abf8a3ec4b156bdba15853262e6c7f54','ÿÿ‚\0\0\0ÿ‚\0\0',1479971167),('abf93cb425aca1edcbcbbf758df8d9ba','ÿÿ‚\0\0\0ÿ‚\0\0',1479971043),('ac3e18e8d3b9f52de79de0486ffeb7e2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971982),('ac48222452b6f42328906656a18b3087','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('ac4c2cec5f8f04d539e61aaae43b2b63','ÿÿ‚\0\0\0ÿ‚\0\0',1479972425),('ac4fc5c0b2f9091f0e4d41b17df1530b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('ac88292329ed01ccb053d43e1ec14246','ÿÿ‚\0\0\0ÿ‚\0\0',1479969338),('ac945ac38e860cde8dc7ca02d85e1db7','ÿÿ‚\0\0\0ÿ‚\0\0',1479968350),('ad3d103fbe6918491377c3cffb595b70','ÿÿ‚\0\0\0ÿ‚\0\0',1479972161),('ad62d6ef86aa0c09b294063421b730f0','ÿÿ‚\0\0\0ÿ‚\0\0',1479971443),('ad87f2a2f76ca3a955c934c9be8866d0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('adc1dad333d8757c6d17bb96d1936441','ÿÿ‚\0\0\0ÿ‚\0\0',1479971139),('add1e835e3cbf2aba95324a4f36d9430','ÿÿ‚\0\0\0ÿ‚\0\0',1479969451),('ade07f69bd80a69e84d9ff5739bb4740','ÿÿ‚\0\0\0ÿ‚\0\0',1479972083),('ae1cb121232a6b0e051aca3a4e860732','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('ae2f540f7624c597a84041e1cf4824ff','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('ae5362f72e3829d3bfaa4ebc3e5f5f63','ÿÿ‚\0\0\0ÿ‚\0\0',1479968044),('ae64c7aaabe442a4846773b93b95aa5a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('ae664b483a73b2600bb783df30990899','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('ae94bb29fd293c112eb4f2ef2d96efcd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('aef3bf687ecb8e327ae5d53d16bbbfa5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('af07094679547752be87694478f2290a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('af7f6c1963f7aa05e31d8f3317b99dd9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('af9c67f03c5fb30158e6947d487dfc21','ÿÿ‚\0\0\0ÿ‚\0\0',1479971960),('afef00dd5748204cfc1721bf4936b6bb','ÿÿ‚\0\0\0ÿ‚\0\0',1479967867),('b0062c79690e9c67100cef877a8e4500','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('b00ad7844b67dd41e04e1b145b447bcd','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('b087e9d0ed040492c61f81c23b52b0b3','ÿÿ‚\0\0\0ÿ‚\0\0',1479972352),('b09da664763db6d1924f85c8841e9c64','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('b0a4f0b8b3eb9e8f3508179509ff2438','ÿÿ‚\0\0\0ÿ‚\0\0',1479972056),('b0d6c447ec24988475f14e866cc6284d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971846),('b10a4ba069c947f0ba1d6f216cefce04','ÿÿ‚\0\0\0ÿ‚\0\0',1479971121),('b11a34c6af10d6212bc0ba658b85c3d6','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('b12ad52deb60f70c9f1744491e577c90','ÿÿ‚\0\0\0ÿ‚\0\0',1479971789),('b1405ad7830a015c589a4ca9de5a1e1a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972156),('b143283628a37b93b1f99075beecc8ec','ÿÿ‚\0\0\0ÿ‚\0\0',1479971114),('b14b85983e212eb5f959f71dc128bd88','ÿÿ‚\0\0\0ÿ‚\0\0',1479969949),('b14f48ef9812bd307af50489faf27154','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('b157b6544711f35ff041d9d961d3c767','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('b16a2081905ee0d5f396096a99149495','ÿÿ‚\0\0\0ÿ‚\0\0',1479971120),('b1715597c51c783dd057607602df5c95','ÿÿ‚\0\0\0ÿ‚\0\0',1479971259),('b1b97f48a1b534cb71d5b5135c83b861','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('b1cff8cf8c8935aa415028bbc9cf337a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968044),('b215ce6fa88bc44347de9aad78263563','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('b224c6a5fec6b8b5f4d68fda730832f2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968387),('b2273bed5c3d5cee0d48a7f44f5be799','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('b27314283c22ffc0a869c6a4b5e33bc3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970947),('b28dd5a12aeecc7c3c250c98ef87f689','ÿÿ‚\0\0\0ÿ‚\0\0',1479969338),('b2be7e2854055441334c135c0e7e2937','ÿÿ‚\0\0\0ÿ‚\0\0',1479972093),('b2cac50178b1c4fd7d0ea6f1c4f0471a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970970),('b2cf2225e5f42ed46615765e083fd0e1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970968),('b2dc506fcd11fa04befa14a4f80c5b09','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('b2ec09c69aeb51e892ed8e7216ee636b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970041),('b2ee8377065434014cca818046f559e4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('b351641fa07e9e331bdbb0f97b9f350d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('b3627421477eae34909ebcf26c3eccbd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('b39ab37aac9c43c775fc11abdf0235c6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971883),('b3ad8f945743efaa9d41aed54321efa0','ÿÿ‚\0\0\0ÿ‚\0\0',1479968670),('b3b002db981a620a09cb599d603967be','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('b3b4acb641f71fcbb9cb68a5c66e8e72','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('b3c43b1298d31925661ea7ccc40ac8ff','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('b3f0dbb00981b9e0163d3c7897867a3c','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('b432bec3b9a85f130034f41b3906a42c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('b4406fbc18e200d8dc54b5ad6d301095','ÿÿ‚\0\0\0ÿ‚\0\0',1479969015),('b4492943605c79d244f337d15a64d3f9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971977),('b499434112285431936c69e4f5422fd4','ÿÿ‚\0\0\0ÿ‚\0\0',1479972135),('b499c013574a31eb07ab559342c9184d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('b49c2e382ada111b9e37c65bb926564c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970763),('b49eb86077b0e8e6165a1bfedc8d6c4c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968350),('b4e8a6fed4fa3572ce64108283ddc198','ÿÿ‚\0\0\0ÿ‚\0\0',1479970917),('b56e86a95ab0f9435ea4b620ba8d1cdc','ÿÿ‚\0\0\0ÿ‚\0\0',1479971848),('b58f45551069a2ed2cd133484ae9a7fa','ÿÿ‚\0\0\0ÿ‚\0\0',1479970011),('b5b9631a114a48f00e95a4ad844ac6b9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971069),('b5c31e7035c77d9236f40a4f58b665eb','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('b5d462d847e0857dc3bd07b494eac582','ÿÿ‚\0\0\0ÿ‚\0\0',1479967783),('b5dcc8eb7b0a271ce4df1bf237f74398','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('b5df83ee529f3fcae9eff1ca65e7642f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970350),('b6273ecbea26970111d9402653cf72ee','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('b646a9b7aace4c6f21a72392b64da920','ÿÿ‚\0\0\0ÿ‚\0\0',1479972104),('b65228a90a4bfceff01ca4036b808295','ÿÿ‚\0\0\0ÿ‚\0\0',1479972235),('b655436d33bdcdc2b7fa8c2e9389c966','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('b67599d0c24510fc43125943509df625','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('b68bb2c7e14fca120258753486e8f5bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('b68e96af2c46ea25b61cff75f13f541a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971114),('b6be24496d216101a0e4f4ef285b003a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970989),('b6bef97a683e68c4ea8adb593bf3526a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('b6d5b0eb693ee5c742ed410f9d4a36b1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('b6e4c291bcac4b2dd8f60517e2227d5d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('b7027a0087c3a2b84c4fbc3d2655d58f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('b71dbe908b7666a23336df48e431b179','ÿÿ‚\0\0\0ÿ‚\0\0',1479968044),('b7298d76336eaa02c2dde474c0274322','ÿÿ‚\0\0\0ÿ‚\0\0',1479972247),('b7800d51b08a087ba07da6a08a1c8bb1','ÿÿ‚\0\0\0ÿ‚\0\0',1479972129),('b788cc9fc0d12370fb7dfc1c541e2ef9','ÿÿ‚\0\0\0ÿ‚\0\0',1479969907),('b78eafbf612323bccdf0f862a4867fc0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970334),('b7a6f241d0044bac36487319df543d1f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971287),('b82fe58daa9a75eb0608ea18e786c762','ÿÿ‚\0\0\0ÿ‚\0\0',1479970989),('b855b1d8bc5e3088d7e56cd479187205','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('b85b0edbd4d1374fe39d81bf47fc0669','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('b86ab9ac47b07093fa88723378e99fdf','ÿÿ‚\0\0\0ÿ‚\0\0',1479971975),('b87e3824b13de2f4d8610e30a73a610f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971691),('b8b6fcd4920951befc4a14517ccb50a9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972066),('b8cbcf3bc6d3fca3538f47edff98022e','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('b8dba1704c8f1897bd22533096baa354','ÿÿ‚\0\0\0ÿ‚\0\0',1479971982),('b8e26a572707cead80b98eb9183737d3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('b8f1be767d8842d2cca38677eb7b9506','ÿÿ‚\0\0\0ÿ‚\0\0',1479970412),('b9110500a4303107eb816aa65b019d2d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971879),('b928a9e931b7edab59b312078e71b1d8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('b92ed5669c18fb6ab18945b98c9fe78d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970956),('b9342c34fa30ad32d42f7d3f1ca7a4f2','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('b937c34c0350b76c68634d2caa6e8e3b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('b952aaffc8c1df75e0ef2cd5d39fc331','ÿÿ‚\0\0\0ÿ‚\0\0',1479968242),('b96ba2b3f28a730fa2dd298708e8ebe0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('b9835f5ef817003706fe27bff4ae7f96','ÿÿ‚\0\0\0ÿ‚\0\0',1479971130),('b98579f9241668a0964ae4f48e9c4b33','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('b9a3af7019cd7f82eb91978e78e5cacb','ÿÿ‚\0\0\0ÿ‚\0\0',1479968280),('b9d5b36126086902ddb234b45ba70e3e','ÿÿ‚\0\0\0ÿ‚\0\0',1479972162),('ba1c131244a7782fc52bc24e92cbc434','ÿÿ‚\0\0\0ÿ‚\0\0',1479971449),('ba2f566d14363c50c875fba4473d3036','ÿÿ‚\0\0\0ÿ‚\0\0',1479972151),('ba8115a64373e57c2ad249d25542e3b1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('ba925d806c525886fe75f255376d72e3','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('baaa99e079fcd0f8a59e7d8847740ebb','ÿÿ‚\0\0\0ÿ‚\0\0',1479970052),('bad2437b81d87f7e000248d7248bb95a','ÿÿ‚\0\0\0ÿ‚\0\0',1479967822),('bb3051659ba3d007be6f545bd863dacb','ÿÿ‚\0\0\0ÿ‚\0\0',1479971204),('bb3e8e63f105c65ac7fc2d724f0dfc67','ÿÿ‚\0\0\0ÿ‚\0\0',1479972063),('bb6c2dd59a2cabcac6ff49136955bf5e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970380),('bb72fc0db6ccee80fb494c08063f8250','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('bbc54485b5682bc7828306af33231a14','ÿÿ‚\0\0\0ÿ‚\0\0',1479969950),('bbd5f98fa9f159ce6e5f91fa2a5abdb3','ÿÿ‚\0\0\0ÿ‚\0\0',1479972055),('bbd61c7489c864e348d12f5a9d648ef2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972363),('bc139884516efa54810a7ea1505ce708','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('bc4969864cde99526d9451201691f471','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('bc598da4c572dd855739f1bad5b608a5','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('bc6bdf83aa097ce19e75c28583426ef7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970968),('bc774c7a9c580aa475bfde6a10140467','ÿÿ‚\0\0\0ÿ‚\0\0',1479970970),('bc84da0f3315bc7ddefe4c58e66afe56','ÿÿ‚\0\0\0ÿ‚\0\0',1479972294),('bc9bf858655ec5577ebd86a966b2aebd','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('bcb636533f3d413ae33ceee90296ab57','ÿÿ‚\0\0\0ÿ‚\0\0',1479968401),('bcfe71617597abe177e96c5b475b292c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('bd869032a6c2ada60bf707d567037848','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('be07f223ab05d400b3d34d8807d3ff04','ÿÿ‚\0\0\0ÿ‚\0\0',1479967984),('be110da275fc94145bc0ccb000ae626c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('be28ae37debc743bcd208e0a2cc00de4','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('be3cc1f5de569cee441440010a0a0a89','ÿÿ‚\0\0\0ÿ‚\0\0',1479971442),('be64d727b040c185f31268b82d55ca7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968784),('be8235c1a48b778ce3dd3133c6096d11','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('bea515914fd80dbfb871c1280fa183fc','ÿÿ‚\0\0\0ÿ‚\0\0',1479972141),('bea59e1cedc4b345c22fd3e5686c1b1c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('bec064a4fb440bfa8269f6d7589db460','ÿÿ‚\0\0\0ÿ‚\0\0',1479969325),('bece2b052f84f7799196e796d89d2fe6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('bedcb7963aed9922aeaad4777cb4b52f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('bf3dbf6cc5bae9015914b5372d9bb222','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('bf5d530fa8c55dc75b620e7250849ea4','ÿÿ‚\0\0\0ÿ‚\0\0',1479967843),('bf8716d540db959814a7ffbfba375769','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('bfb08fe5dc4c891fc930d122be3d0d7f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970917),('c0124d8c3222375513ace14c6b93293b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972220),('c02d321f67b9bcfe431c175d6497e769','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('c02dd59475503d9865102c7864c28c84','ÿÿ‚\0\0\0ÿ‚\0\0',1479972346),('c03327c3f3a568c69979c5878235a488','ÿÿ‚\0\0\0ÿ‚\0\0',1479971111),('c071b9bf58abcfa2d91a917c5419d70d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970045),('c08e1c3d14fa37ef4dd41961484a8cbd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('c0b2f4734d90c7d810c65bc41ca5db1a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('c0bd6db63450b637a78098ad0f4ae776','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('c0e83d99342a9692260e8c05f6263d6d','ÿÿ‚\0\0\0ÿ‚\0\0',1479972095),('c10e1b5311a1755fb0508a5a0f5f1dde','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('c13c62377e2f99cbd683b0ea86141fbd','ÿÿ‚\0\0\0ÿ‚\0\0',1479972108),('c147680e1be771d2c7e45798670ec946','ÿÿ‚\0\0\0ÿ‚\0\0',1479971774),('c169e056ba8f63abe36c2b842dc88a83','ÿÿ‚\0\0\0ÿ‚\0\0',1479971691),('c17105fa57a1d5c00fa41a67eea76de7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('c1a3a87af12448f6eb7cc3297ae6ee76','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('c1a913297042cdfea892e46593133174','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('c1b11301482436f28cb4fce55b88fce6','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('c1eedea5ad38665364c13cac8d15a92b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972203),('c2068f8b6f445e87489425e7373e274d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('c2180a1bd024ce25d4197bf2ba24d3a2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968146),('c239729394c4504935a2b04d749461e2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('c24ae45d8855af2c520333957580a9f8','ÿÿ‚\0\0\0ÿ‚\0\0',1479971963),('c2caa61dcdbec65fe844e91829b8387c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970970),('c2d452b2b400b48a84e04e2d5af9c55d','ÿÿ‚\0\0\0ÿ‚\0\0',1479968350),('c34d21694a0214f4ff617e3dc02ce8ab','ÿÿ‚\0\0\0ÿ‚\0\0',1479972159),('c373408964bbdb2e3feae39f18edb4b6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('c39aff3083a03aa89bf9b8adfce40b43','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('c3ccb3cca548110d2b165d702a110c38','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('c431dacb35daaedcf40262ebb50b61ae','ÿÿ‚\0\0\0ÿ‚\0\0',1479970989),('c43504c25589c376059745d0ee7a5ce4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971848),('c439386c5ba8db6bc0281aa181ac0d9d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('c4b285693fc5062037884b07f375ee55','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('c57f6bb669f37389825d81134761088f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971981),('c5d6f670641b823e2dfb32c29dd82636','ÿÿ‚\0\0\0ÿ‚\0\0',1479970979),('c5e2ccef3b9b0fa107fc1cc752e525a4','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('c5f6925644cb379bbbdfef6fcd7c15d2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971971),('c5fb2cc088c62d22440ac9eaa5cb7438','ÿÿ‚\0\0\0ÿ‚\0\0',1479971838),('c607b342ea57431ec26e628d034f1758','ÿÿ‚\0\0\0ÿ‚\0\0',1479971842),('c60b7af9ea3625a3042bced0dbb5f6ff','ÿÿ‚\0\0\0ÿ‚\0\0',1479968040),('c68bbcf6883c243340c2143c7545da84','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('c69d7530dfdae5f8bfa021afb588ac1d','ÿÿ‚\0\0\0ÿ‚\0\0',1479972096),('c6b06bbc7176d5d3d15cd4b9bcac762f','ÿÿ‚\0\0\0ÿ‚\0\0',1479972052),('c7041a56b5d53c58240f6c3e9081d2a8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('c7246456ff627b8e7223e7230a184666','ÿÿ‚\0\0\0ÿ‚\0\0',1479971808),('c72813a17b5aa936ac6ad332094d3fa6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971010),('c73ce8e36ccbfccffc2607eb6e70ba5d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('c74cb53d10b676913b069199290029e8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('c7724eb233dc91f2716f432af5eaf86e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970412),('c78358508170a3d83e150d361143b10b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971982),('c7ca71437bd6dafcdd3c77efa1a6eb3c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968495),('c7ee1c7b869848b0507e09a68a5c2206','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('c826c0ba3222a3486dd870744e7aed49','ÿÿ‚\0\0\0ÿ‚\0\0',1479972111),('c8308af4eaa58821bce0eae5b453f878','ÿÿ‚\0\0\0ÿ‚\0\0',1479967802),('c87bc31087321038f1e1d873848e209c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969907),('c8892847494f1ed0b6fb4c0a72f57dad','ÿÿ‚\0\0\0ÿ‚\0\0',1479970012),('c891387ebbf5ca72d0467db763fc7bb1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('c8b3c28e92bb6b906ba24a29b19f658d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970340),('c8bea42ca700b4cc4eac83e5aed120d9','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('c8c71cf4cafda51ec0355566286992e3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970970),('c8cb060e5aca265eacce3ca2315c7d7b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('c8d0e26d7ceba1ab8713c2385c712573','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('c8d70ebbc33543b67926e00259db1bc6','ÿÿ‚\0\0\0ÿ‚\0\0',1479972208),('c916fe56577931f1f242fca42e09b2ee','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('c95506a3ad9344a3443119c56828d265','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('c97f94dbcc52fa395c7b772459dc1711','ÿÿ‚\0\0\0ÿ‚\0\0',1479970395),('c9a223dcaf04894daa01b2fb0e52aa0e','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('c9a237c82ddad75e5455b68a1512a28c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('c9eed40efc618d9bbfe75fd9a3726b0d','ÿÿ‚\0\0\0ÿ‚\0\0',1479967978),('ca314f6740836240b820f21fe5b2bbc2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('ca3243bdcb82735b382cde693f8a08c2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972352),('ca346bb4be3563e912560c067f4fa79d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('ca52a8dd8c46e92a3ba49de9f5fb775d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971445),('cadd6f9dc16c5b792f8ca0b6f29210b4','ÿÿ‚\0\0\0ÿ‚\0\0',1479968146),('cae70eeb706e7e4dacb1ea8273fdbbe7','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('cb0b754735bc0ec87e0bc93463845016','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('cb3656b58b2326332d086df45e89bbb2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('cb44b9fed97e055c90f4f81d4fdb9ad8','ÿÿ‚\0\0\0ÿ‚\0\0',1479971433),('cb49f9b448e48f2feebfb8bdacc85069','ÿÿ‚\0\0\0ÿ‚\0\0',1479969914),('cb840ddfcf104acbd86b0bcd5e9dcb02','ÿÿ‚\0\0\0ÿ‚\0\0',1479971979),('cb98aa5a1e2a6d35ad40187c1d2124f2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971448),('cbcf84ca66e46fb422f4870ca7ac591c','ÿÿ‚\0\0\0ÿ‚\0\0',1479972094),('cbd680bb9fdaa83283b0bd3225359050','ÿÿ‚\0\0\0ÿ‚\0\0',1479970380),('cbdb1afbd1bb48cacffeddc199031c32','ÿÿ‚\0\0\0ÿ‚\0\0',1479969799),('cbe55de3fc4a9bc7bc1ab0085553a50f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('cc024f9b31916b1899ad6e9be32747d6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970370),('cc47bb89817f2d2004f49542f103ea3f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970512),('cc53310601a91b9790d456909c3acccd','ÿÿ‚\0\0\0ÿ‚\0\0',1479971445),('cc92623a20783504d2ba5e84bfa8ca60','ÿÿ‚\0\0\0ÿ‚\0\0',1479972128),('cc9e453155ec31f06b370a57e5f9ae86','ÿÿ‚\0\0\0ÿ‚\0\0',1479968077),('ccc2cfd4f29d193ea5afdb569843cf33','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('ccdc45679c78759405cb127dc16d82ae','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('cd1b7770e8dfce09a70f989440df2b3f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('cd4025a22c3e3416a2f0fc2b176f765a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970343),('cd42dfa2b7767a8e24f290d5588ac2b7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('cd4af190b09e8135dc43e751276f8e9d','ÿÿ‚\0\0\0ÿ‚\0\0',1479968366),('cd5c70072c2549a31c592a7762ef3ba2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970366),('cd9d86a1b04c0e63e81d06110766ee57','ÿÿ‚\0\0\0ÿ‚\0\0',1479971788),('cdb34e8ad7c08781fe90753f9ec078e2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971123),('cdcaa3a724e46d026220cccfb5a40a26','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('cdd16bdf3f831075553aeb803ff4b31e','ÿÿ‚\0\0\0ÿ‚\0\0',1479969001),('cde7eb65a987f3ab2b9faba134390f84','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('ce1f0fb7f926a70b455bb66431e46848','ÿÿ‚\0\0\0ÿ‚\0\0',1479972067),('ce22fbbf98169775a13b7a33a8e8487f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970569),('ce3eb68ff9c6a98bc8a5893bda174d71','ÿÿ‚\0\0\0ÿ‚\0\0',1479967783),('ce56b584baa543180f96db01bb0ce7fa','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('ce6a2ef2da0cc5e80c3008a1a8fd5fa6','ÿÿ‚\0\0\0ÿ‚\0\0',1479967785),('ce87034f8e8957061dc1078e7a9ee589','ÿÿ‚\0\0\0ÿ‚\0\0',1479968494),('cee36c1baa1feecc8ad69353b472339d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970006),('cee746f0abce1cef9b814d851951f492','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('cefa2dcf6c0bb9df87ba5b222984353c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('cf5a21d5b92ebeed6cbc6c1364ac5d03','ÿÿ‚\0\0\0ÿ‚\0\0',1479971986),('cf7ff44c01aa6dc0287a3299918513af','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('cf8c485c5a0c93786615cd2ad2444f7b','ÿÿ‚\0\0\0ÿ‚\0\0',1479968280),('cfc02a571c6ea72a4489ac28127b718b','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('cfd31c1490663d075a11cb06cd4f0a12','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('cfdf465bf8b1b9bd6bb3f8079002f85e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971001),('cff80279566bc2fa91cd219abef5f844','ÿÿ‚\0\0\0ÿ‚\0\0',1479969325),('d080373b235e86c2703fea7253d11c93','ÿÿ‚\0\0\0ÿ‚\0\0',1479972161),('d08488add5ad257867049b98f53343f0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970958),('d0898f770d9babe27d58d30ded98d49a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969936),('d09177dea4aabb90adeba7e3c0a1a76f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968887),('d0ad68b6f406193c4490f5f0c2002b6a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('d0b2a7d6f121204a15ba21ec6c8c10ac','ÿÿ‚\0\0\0ÿ‚\0\0',1479970370),('d0cef5df75bb40755811393702b3c44e','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('d0da57013a3cac4bf6237356c332666f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970049),('d1150a1de51e90fb2e451ac424c72a71','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('d155a445298e295178be0839c36074e1','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('d199570e5132114971daa1ec1cafbcf1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970551),('d1abd7b60cf2543705c0b8d8d7a78348','ÿÿ‚\0\0\0ÿ‚\0\0',1479970864),('d1b948e6e6ec5cf32c39ea3f2ca9c89e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('d1f37467f9d3ae4afc9172b8bd01574f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970550),('d1f5d870d0b0f3043ed324c2f998e592','ÿÿ‚\0\0\0ÿ‚\0\0',1479971945),('d20e404ebca25f32f64bc4ed19c2aa01','ÿÿ‚\0\0\0ÿ‚\0\0',1479969812),('d21f478aec3cf1b68169acc474745732','ÿÿ‚\0\0\0ÿ‚\0\0',1479972209),('d22b2fc2d4ec4e2ed8611152033a27aa','ÿÿ‚\0\0\0ÿ‚\0\0',1479972204),('d23d2dd6afeef21fdcd06520f1e9c37b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972354),('d242e0c74b6294e2e5c45b6a83cc7fa8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('d263b24d8ab2e04aebd1248a2f99df43','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('d29712246a423557e2293647844cdbe1','ÿÿ‚\0\0\0ÿ‚\0\0',1479968785),('d2b5c731d6212b5c76bf0a51b5f75448','ÿÿ‚\0\0\0ÿ‚\0\0',1479968146),('d2cce57561be774b28ecfacf6bbf4915','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('d2d0058f0aa2d6b893b3d6d24312dcff','ÿÿ‚\0\0\0ÿ‚\0\0',1479970513),('d2f5b8862c6e08e9f85696f555fe8d87','ÿÿ‚\0\0\0ÿ‚\0\0',1479971120),('d3150e84cc546b0287e963f30cda2d6e','ÿÿ‚\0\0\0ÿ‚\0\0',1479968463),('d35a8f57067a227d26b5a9d6bdda9d62','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('d38cb2fa2e456684583a48274efdb909','ÿÿ‚\0\0\0ÿ‚\0\0',1479970917),('d3adbbeb9b86bb3ea3c88d4d47fd32c5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('d3c471cad1816e8ccdce3d7f048f1876','ÿÿ‚\0\0\0ÿ‚\0\0',1479972163),('d460c88ecb35a89ac45f3ea5fbb7d4f5','ÿÿ‚\0\0\0ÿ‚\0\0',1479972056),('d46493e96cfb6c979f56cde7f9ea6ef6','ÿÿ‚\0\0\0ÿ‚\0\0',1479968945),('d48b6ca25676cb91f82ac5e5e17aab28','ÿÿ‚\0\0\0ÿ‚\0\0',1479970979),('d4c222e3e3ef2b42c873768d66e89d74','ÿÿ‚\0\0\0ÿ‚\0\0',1479968146),('d4ca139392f290a98c3a2268ba0d8a84','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('d4cea30c6f7580fa630d0f1c2a68dae4','ÿÿ‚\0\0\0ÿ‚\0\0',1479969013),('d4e0becd57be7ce1cadbe287f89e4c4b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('d51da7f4a5dbea31c8b638599f876844','ÿÿ‚\0\0\0ÿ‚\0\0',1479967846),('d523a7a228dfbddc42315d8c5db633f1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971573),('d537ff2df0b8224ffe7ee02422f0475c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968613),('d5586cabc8ee6f007ae7d0582a48364d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('d558e9b0704214ff65524bfc6e112416','ÿÿ‚\0\0\0ÿ‚\0\0',1479972247),('d55a307c2268aa341507d4248976da08','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('d5809e231344c293c9907415b1165a1c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970335),('d59e87813c2eb3b48cbafdfd06cacf42','ÿÿ‚\0\0\0ÿ‚\0\0',1479970949),('d5be5d58e0b8dec4cea128d18b574258','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('d5bf39abd5eb8c9840724a1526483058','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('d5c03a24814bc9807bfd23b3a6739c69','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('d5d3da9c9c2a58fed95fa99f5eb952eb','ÿÿ‚\0\0\0ÿ‚\0\0',1479971691),('d5d837a67322e24c916cc9bc3cd2d79a','ÿÿ‚\0\0\0ÿ‚\0\0',1479971141),('d5f0b553f25bd4d3f9beb5d8a07b891e','ÿÿ‚\0\0\0ÿ‚\0\0',1479969451),('d6570803d97b288fb4115bb4b631266a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969325),('d66eaeb92a021861339a44b2a6228c67','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('d6d05443ce2673d0e48165dd9eb56551','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('d74947bb4a18fb511f1d5555f688c846','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('d74edbce5a4fd870392eb703b252b0ad','ÿÿ‚\0\0\0ÿ‚\0\0',1479971664),('d76f665bb6cee11844b2d3bd869a1f1a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969907),('d777b11b08a50e03125e0b63931b4bec','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('d796d863c572ad818e37e1859ffc4a09','ÿÿ‚\0\0\0ÿ‚\0\0',1479967840),('d7a0ed602754d3a00d0ac632696a47c9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('d7ae66af0a5bd9e11a14b48ea2cb9eaf','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('d7b9f32d51cb2c51a6d87c66363eb7d8','ÿÿ‚\0\0\0ÿ‚\0\0',1479970970),('d7fce8387912aaff95f7f832ac3b7987','ÿÿ‚\0\0\0ÿ‚\0\0',1479971445),('d8033e5451c0db034535bf733a879bdc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970568),('d806a9827a65a60ac52ed173def9719f','ÿÿ‚\0\0\0ÿ‚\0\0',1479969949),('d844a452ea2d6974f1bec3fab7646dc1','ÿÿ‚\0\0\0ÿ‚\0\0',1479972222),('d8535718e91e6eeb19dbbecbc6a7b0be','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('d86b454975699fb68a4257f476ec2d5e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971838),('d891d53c48e034c43263e5cfb56ca8e7','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('d894a9d15df3980fccfe9076e8dc8205','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('d89aca9ae688ed9edb1f7c1f2adfa53f','ÿÿ‚\0\0\0ÿ‚\0\0',1479968613),('d8a53a7a0c52456d14e69695bba36994','ÿÿ‚\0\0\0ÿ‚\0\0',1479971288),('d8ad088c9e47bbf2b322f844a9d24bf4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('d8d0a20400a3d3696f6b50ed4f251f3c','ÿÿ‚\0\0\0ÿ‚\0\0',1479968040),('d8efaddd4ae302f646329de20ec36b4c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970380),('d9264c268129cb8daa2983d1fc904ad3','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('d96eb72f33789d142ab827ed5fb224a7','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('d9aaca800c539f1f42b057d3543e938b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('d9ee95d4ef4f627f465049d05c324a05','ÿÿ‚\0\0\0ÿ‚\0\0',1479969903),('da11f1371a3aba964fba9f578299ddf2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972162),('da1f1b4e9f945e0fa19fe1cc7042e1bf','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('da341782ded48cf3f14bb54cb1a135a8','ÿÿ‚\0\0\0ÿ‚\0\0',1479972111),('da56cac7925354afccace3f6b733c80f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('da59748422ded4797ff94396c9f15137','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('daaeb72c0e88b8f53f98abf248a03aff','ÿÿ‚\0\0\0ÿ‚\0\0',1479969802),('daca65052b4a687cb1b18e54c62c6a15','ÿÿ‚\0\0\0ÿ‚\0\0',1479969338),('dad9c704ffc5b7a8dbfdcf16c33869f0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970934),('db094b54ba81d37e16db8537e8182609','ÿÿ‚\0\0\0ÿ‚\0\0',1479971946),('db0cf9490e804c0f0c3eba22ef9deb9e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971659),('db144db7e296b586d33849669f86be2c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970333),('db2d07894790242039c5103b0f2336ed','ÿÿ‚\0\0\0ÿ‚\0\0',1479971790),('db3c13718fd8747debb82fe5eddcf43d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970181),('db53d1bed7dcacdad55f0118743ab75e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('dba14f257952a282f50851f90a28dfad','ÿÿ‚\0\0\0ÿ‚\0\0',1479972065),('dba641cbedd938148a3e74e814bc6ddc','ÿÿ‚\0\0\0ÿ‚\0\0',1479967854),('dbaf7afbef4a8da45b8febc7d7731911','ÿÿ‚\0\0\0ÿ‚\0\0',1479971101),('dc31c32fa8818ee3bf57d025abf17508','ÿÿ‚\0\0\0ÿ‚\0\0',1479968242),('dc50e7b4f6e9af68d4994aae313d46fc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970955),('dc5365798b498bfd44718bd34cc05c8d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('dc555e6bf3811b1c5e87eb5d05dba575','ÿÿ‚\0\0\0ÿ‚\0\0',1479971565),('dc7ae9e924c3832d2d19d1182ae3a4de','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('dcb7ef9b38c40b6980dcb186a76a3be5','ÿÿ‚\0\0\0ÿ‚\0\0',1479971084),('dcdd885900d71349c8927e21fbdfaaed','ÿÿ‚\0\0\0ÿ‚\0\0',1479972377),('dd0724a01fa93ed681977fccf117e349','ÿÿ‚\0\0\0ÿ‚\0\0',1479969925),('dd6d2b8b1a161e1f88f2757a7d0ec00b','ÿÿ‚\0\0\0ÿ‚\0\0',1479968387),('dd73cad0c56e2daada35a9ecc268de9b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971837),('dd741557118fc01a2128f098f4b33ac0','ÿÿ‚\0\0\0ÿ‚\0\0',1479971946),('dd9e9eead64c74d4046ffdb527e27fa2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970333),('dd9ed42ec95cf27c57c2dc229d8b1263','ÿÿ‚\0\0\0ÿ‚\0\0',1479970051),('dda3f7a4afc996f46a89034326c0f356','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('ddabb724275dc18b33670c95c44e4b98','ÿÿ‚\0\0\0ÿ‚\0\0',1479967786),('ddc8a3f89eaff2ce5c705e02a120ce11','ÿÿ‚\0\0\0ÿ‚\0\0',1479969920),('ddf8fa8e789d1d9839c42f5385a083cc','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('de32b63609fc303d188e74730180acab','ÿÿ‚\0\0\0ÿ‚\0\0',1479968717),('de411c089fcb39f97a4938845b8c0e3a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970007),('de670ad92fae8f88a134116985e0baf5','ÿÿ‚\0\0\0ÿ‚\0\0',1479971126),('de7799d4509acc6e86bb2c3bd185e44c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970334),('de823f5d3f296e2ee7157e92c660dac5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970006),('dea3d7ae9028a8061e4e61db974d6662','ÿÿ‚\0\0\0ÿ‚\0\0',1479969362),('deb1f534a083f32f80e5c2b0fceae9b0','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('decd28b4cfeca85e050a8ba82d39c6b5','ÿÿ‚\0\0\0ÿ‚\0\0',1479970972),('def37b8c46acccaa2bba8d6cdc64db8e','ÿÿ‚\0\0\0ÿ‚\0\0',1479972222),('df0827185737849fb762ab9c4aa06da4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970040),('df0fafd146b056778d9abcdd17ddede6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('df4792adf48487933dff225e1ce02c75','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('df8bc2a2d8d72d10ef71db39ec519b5e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('df8bc46e8081177232d8b6303e5cc9a3','ÿÿ‚\0\0\0ÿ‚\0\0',1479969284),('dfa5c9c33389d27f5d83e02d9b7c3d6d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971431),('dfc4d8607a8cc9177414da2381a7f7fe','ÿÿ‚\0\0\0ÿ‚\0\0',1479968350),('dfd5ecc874765bcf8c9fb07f64837aaf','ÿÿ‚\0\0\0ÿ‚\0\0',1479969267),('dfec95de7e0d851966b9843f87eee0e9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('dff388e7e0067b59d187f578362eef77','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('dff8cf461cefc587979da900f26261c1','ÿÿ‚\0\0\0ÿ‚\0\0',1479971838),('e00632de6b3c6a5266505f4a3b7fa6f1','ÿÿ‚\0\0\0ÿ‚\0\0',1479968612),('e0215512821d0b0f1f8604445a4723b3','ÿÿ‚\0\0\0ÿ‚\0\0',1479969267),('e03678701d1b2c2c95352a5ddc8c1188','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('e0407b3d84144a5e05eedf31ce416453','ÿÿ‚\0\0\0ÿ‚\0\0',1479968044),('e05f78b3ba70859cec2ee862cedaa5d0','ÿÿ‚\0\0\0ÿ‚\0\0',1479972220),('e06476c15c2b4f89816d6a13c762ca9e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970995),('e0a56e4736dfafc2787e256fe9546e60','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('e0a64ded43381a320ed9ea10e3efc011','ÿÿ‚\0\0\0ÿ‚\0\0',1479969953),('e0eb8f7773b9d9f7a1e697567d445b40','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('e0f23893c8085892d13e08fda7b71789','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('e11c6f5f14d86cc69f02d86b829ba44e','ÿÿ‚\0\0\0ÿ‚\0\0',1479969276),('e125d50ccae8b65d4a34af4d073e303b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972162),('e12affcd7bc5178784380fad2df50f13','ÿÿ‚\0\0\0ÿ‚\0\0',1479972353),('e13198f8ad7c0f1a748475afe435f30b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971984),('e15fea13bb3f6de4aa0bfb59c836e01b','ÿÿ‚\0\0\0ÿ‚\0\0',1479968787),('e16d1b66dd3f108d400db6687f8b621d','ÿÿ‚\0\0\0ÿ‚\0\0',1479971977),('e17f60e7cf9fdb1b0851ff2e928c04ad','ÿÿ‚\0\0\0ÿ‚\0\0',1479970040),('e196f03a744f6b84e0f773daf121441f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('e1adddd173754c5e74664fde7223e025','ÿÿ‚\0\0\0ÿ‚\0\0',1479970513),('e1d60cc38c930c208ae59e33f1579932','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('e1eeff26ca65d1660eb51fd4d25940ef','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('e229d249c3b1bf01985fcaa404a074a5','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('e23f93f1aad7d4190d1f46e37e6fc145','ÿÿ‚\0\0\0ÿ‚\0\0',1479970347),('e2b27ba761a162ce0267620f04e0b997','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('e2e220dcc02f77e2bdc3c6bac22bb7a4','ÿÿ‚\0\0\0ÿ‚\0\0',1479971848),('e3654e13caf88e1d193a70caa510f323','ÿÿ‚\0\0\0ÿ‚\0\0',1479971259),('e37731062719d87709f8b68b19d7051f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971879),('e3c441755b67104b7d46bb06def6b6e9','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('e447f4d9bf5ebccdb6e132b13f08fce7','ÿÿ‚\0\0\0ÿ‚\0\0',1479971946),('e44ace4194e6e6e748e1b44499ff57f1','ÿÿ‚\0\0\0ÿ‚\0\0',1479972135),('e478f2936daa5f4c0a5a24037559b5b1','ÿÿ‚\0\0\0ÿ‚\0\0',1479970367),('e4bb0cfd8b741ec46fac153e290c1936','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('e4bf737795dee4017c814af4d64daf36','ÿÿ‚\0\0\0ÿ‚\0\0',1479970551),('e4cd2d792cbc5fee42420c66c4a95939','ÿÿ‚\0\0\0ÿ‚\0\0',1479971789),('e4d6e39e81a6aba77f51c67fdf5963dc','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('e4fe21167eb3e80dfefc5393ff8003dd','ÿÿ‚\0\0\0ÿ‚\0\0',1479972096),('e508bd99b35cff4b1ac7ecaf4f33a7d9','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('e557f00f8bf6298f8f6aced40c2cc0f2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971126),('e58c8625677de6673a886abaad1173af','ÿÿ‚\0\0\0ÿ‚\0\0',1479971125),('e5922aead4b4f1a4ee9a92f39b28d992','ÿÿ‚\0\0\0ÿ‚\0\0',1479967846),('e5ab185539fb89afe0808607c95964db','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('e5af5786e59d803d389cdceb1627decd','ÿÿ‚\0\0\0ÿ‚\0\0',1479970999),('e5bec259e7ca0f352d701a5b024719cb','ÿÿ‚\0\0\0ÿ‚\0\0',1479971262),('e5d6d0eece115d6a00bacb8ecdda785c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('e62f0c70eb6da6e6177fcb7c6b44ff5b','ÿÿ‚\0\0\0ÿ‚\0\0',1479972052),('e65efa68033a82d3202790a7b7fb2df2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971169),('e66c66b8d75345b4f5ebcc32685a9c9b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969922),('e68200ca5115545ed9bcef655148d603','ÿÿ‚\0\0\0ÿ‚\0\0',1479970340),('e6c249d4bf178a5d8ce583e465e4c280','ÿÿ‚\0\0\0ÿ‚\0\0',1479967843),('e72f42e2873c166441e9d57f21a5a67b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('e734cf80fa6e7ff5e1f99cd78b97fa48','ÿÿ‚\0\0\0ÿ‚\0\0',1479968612),('e73c000ec494719b9910f079a9d3d1c9','ÿÿ‚\0\0\0ÿ‚\0\0',1479967793),('e7aada206a889a7a4ce29f00c149217d','ÿÿ‚\0\0\0ÿ‚\0\0',1479969953),('e7b2bbb8e1e415bdc32cb45f2b6ef1e2','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('e7ba3f589c56b94717f891f4b8924df0','ÿÿ‚\0\0\0ÿ‚\0\0',1479967801),('e813d39d54fe1d68267a1a1bb74f3593','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('e8150332ac0b22a447e78eb5c263a3c1','ÿÿ‚\0\0\0ÿ‚\0\0',1479968039),('e83bd0ccd2f614b2205e67bb3ff9721b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970366),('e8416360743716295a1a63722516f1a0','ÿÿ‚\0\0\0ÿ‚\0\0',1479971593),('e85047e0874023dddce0f75f2b91cc7e','ÿÿ‚\0\0\0ÿ‚\0\0',1479969914),('e855fda461a1b930721ab80f15a9f5bc','ÿÿ‚\0\0\0ÿ‚\0\0',1479971123),('e86196f7689f7073b4a4fc675e0ae0e9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971120),('e8a341383e633aa0a8de442948615bb8','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('e8c07d4c803bbb9f3f9b73deffc9df19','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('e8d0ba12de314f7b8c43f25a27149f65','ÿÿ‚\0\0\0ÿ‚\0\0',1479969923),('e8e10f052032e6633ba9327c8b9a1cee','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('e90fce8676eed56d7d40a7b80c78f613','ÿÿ‚\0\0\0ÿ‚\0\0',1479972062),('e92beec701850f3be0fdcdc29d21073c','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('e933e6155cf15207666ead7499c9cb64','ÿÿ‚\0\0\0ÿ‚\0\0',1479971789),('e94606f2128972a13406587fb62ad9c0','ÿÿ‚\0\0\0ÿ‚\0\0',1479968671),('e94d1b4eeee19665e646874b769038e7','ÿÿ‚\0\0\0ÿ‚\0\0',1479971804),('e9507a40514ced01a23e9f2256a092c2','ÿÿ‚\0\0\0ÿ‚\0\0',1479971986),('e96942b8dadf919caf6b14342affec4a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972425),('e98f4528fec1f9ab79f4b4004e016984','ÿÿ‚\0\0\0ÿ‚\0\0',1479970856),('e9aac82c8decc9ad4e924538c0691fe5','ÿÿ‚\0\0\0ÿ‚\0\0',1479972066),('e9c8c0e9912cbe8acf145b86b84c56bd','ÿÿ‚\0\0\0ÿ‚\0\0',1479971661),('e9e50ac2ba8a55f8f29bc731b3dea912','ÿÿ‚\0\0\0ÿ‚\0\0',1479971774),('ea0c96fc573d3e1887d324b50b2c5c57','ÿÿ‚\0\0\0ÿ‚\0\0',1479972354),('ea4befdf28e2c1c9e84eb489c1b32af0','ÿÿ‚\0\0\0ÿ‚\0\0',1479971788),('ea5c2460fd103ee852cf643ce6a92659','ÿÿ‚\0\0\0ÿ‚\0\0',1479971010),('ea6d5ef001e818a6317e766473514cf9','ÿÿ‚\0\0\0ÿ‚\0\0',1479967785),('ea894ec6a7ff832dc514081e58c06e29','ÿÿ‚\0\0\0ÿ‚\0\0',1479969806),('ead4c96c6cf660be28a33e7644614d94','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('eb1a1448af0662ce775910b448f3b6c9','ÿÿ‚\0\0\0ÿ‚\0\0',1479971043),('eb248e0d2cea3c6e3382e18fb860d9ed','ÿÿ‚\0\0\0ÿ‚\0\0',1479970342),('eb3f33af2af2dda040939317330342cf','ÿÿ‚\0\0\0ÿ‚\0\0',1479971010),('eb5041a4d83ee53caf5fc9453354d768','ÿÿ‚\0\0\0ÿ‚\0\0',1479970996),('eb6a2257c687272559b1a279e56862ab','ÿÿ‚\0\0\0ÿ‚\0\0',1479968351),('ebfcee1223c55964d9ef2db3a0243ea6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971662),('ec1d90312c91220aeebc8554b5a54050','ÿÿ‚\0\0\0ÿ‚\0\0',1479969264),('ec2301814e659a72bac8ec9a17676d9a','ÿÿ‚\0\0\0ÿ‚\0\0',1479972095),('ec5da0b2bfa98e48fab92125e4e75abc','ÿÿ‚\0\0\0ÿ‚\0\0',1479972148),('ecb742d9effc391044f56930bd831a86','ÿÿ‚\0\0\0ÿ‚\0\0',1479970011),('ecc83ebbefb881c2aef316648687c027','ÿÿ‚\0\0\0ÿ‚\0\0',1479971885),('ecdb4a7edc64044c7d1b1f91fd9aa5f5','ÿÿ‚\0\0\0ÿ‚\0\0',1479971287),('ece6eb9b9f6f874d1e982bf548dfd526','ÿÿ‚\0\0\0ÿ‚\0\0',1479970340),('ed34b0e458fced44954884bccd5d73f2','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('ed6513b4d9d3b5de50dbff23437ed887','ÿÿ‚\0\0\0ÿ‚\0\0',1479970049),('ed7abb82dbb59aba95ee9c48fded2114','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('ed7ef954a381e694cdd0b8d8285d297f','ÿÿ‚\0\0\0ÿ‚\0\0',1479971010),('edb3d7f3f29e0da20b27c67335751525','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('ee1243eb425a3113094cd1f79a43b58a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970569),('ee1841be68e247824ad4375e6c9d5af7','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('ee1893816aca04225b9a751a8d6a1da0','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('ee1f667dab226b39dd78fde827966500','ÿÿ‚\0\0\0ÿ‚\0\0',1479969015),('ee7f9903f2e5826ba0580786257bbb82','ÿÿ‚\0\0\0ÿ‚\0\0',1479969903),('ee9bc191a1423d8ba4941673caef515c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970345),('eec03afc459ebbca521cc4d36e7a26de','ÿÿ‚\0\0\0ÿ‚\0\0',1479971593),('eec66af52623309e66e941c5d3aed9f2','ÿÿ‚\0\0\0ÿ‚\0\0',1479972378),('ef0dffe7b2b48062079655bb7b5e76a4','ÿÿ‚\0\0\0ÿ‚\0\0',1479972364),('ef16fd1132bb0c55101088807b88ece7','ÿÿ‚\0\0\0ÿ‚\0\0',1479972055),('efc4673f86ea39304072da1dd8e5f267','ÿÿ‚\0\0\0ÿ‚\0\0',1479969920),('f03166a21ff47b0757bc0b2b17be317d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('f03c6cf3975fd49236987c60fc3717d8','ÿÿ‚\0\0\0ÿ‚\0\0',1479969906),('f03e0220088f232e4f5db70f97f7f101','ÿÿ‚\0\0\0ÿ‚\0\0',1479970042),('f04b85702dca78d1cb82787837804057','ÿÿ‚\0\0\0ÿ‚\0\0',1479970346),('f064d25c12f3aea08bbafcba4bace722','ÿÿ‚\0\0\0ÿ‚\0\0',1479970341),('f08161458a86d4de808d0f2ca7e67231','ÿÿ‚\0\0\0ÿ‚\0\0',1479972247),('f0b7b3b1cd419dbf24196441d6852847','ÿÿ‚\0\0\0ÿ‚\0\0',1479968684),('f0d1767751c694ee5931b1e8f6a67799','ÿÿ‚\0\0\0ÿ‚\0\0',1479971978),('f0f20019d3932a9b5f72157893e6bc5f','ÿÿ‚\0\0\0ÿ‚\0\0',1479972092),('f14cecbe99c0a4dd0165c77b8dadad71','ÿÿ‚\0\0\0ÿ‚\0\0',1479968038),('f18e20851f884cbb75ddf853d417744b','ÿÿ‚\0\0\0ÿ‚\0\0',1479970475),('f1a1652089bfcb9953504655ac5088ee','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('f1baf9da8e8833c984cbfd1900515140','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('f1d60e4b1bbd209d11498a74f6ea045a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970022),('f1d680a7b07dce7fcce79ae20516c519','ÿÿ‚\0\0\0ÿ‚\0\0',1479970011),('f22c21b62dac5bfb691134154a9ed699','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('f238e16567caf7f8064bcf485371c23c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('f2463dfcb90d4d9f65356685bd4930c6','ÿÿ‚\0\0\0ÿ‚\0\0',1479972236),('f2483d9fe04b321084c4f96f48688af8','ÿÿ‚\0\0\0ÿ‚\0\0',1479967841),('f24f3452c342f8303c7a53d41a0ecdae','ÿÿ‚\0\0\0ÿ‚\0\0',1479971593),('f26e6e2135f3af4c6743425134fe979d','ÿÿ‚\0\0\0ÿ‚\0\0',1479970569),('f27f1cb2816308a4725b4af808a6b34c','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('f2c6bbf62e79028d7588b4a2b0faf142','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('f30401da8ee1bbb6a5e26642be211ba8','ÿÿ‚\0\0\0ÿ‚\0\0',1479968280),('f31842c0ed7ce470ef17b42fcc6df07c','ÿÿ‚\0\0\0ÿ‚\0\0',1479971990),('f32209d9ee3156662703e272de37b9ad','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('f383419d74038bb424dd7383a07f3c1b','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('f3d0b4bcd4cfb030ddcf92ac0dd6f085','ÿÿ‚\0\0\0ÿ‚\0\0',1479970012),('f3e1ce7a00617cfd03c8770bc3bbce38','ÿÿ‚\0\0\0ÿ‚\0\0',1479970909),('f3e96d96b23d499b282c332f1b3fe895','ÿÿ‚\0\0\0ÿ‚\0\0',1479967802),('f4adb2d4d408ced6cdc23c56907c07b9','ÿÿ‚\0\0\0ÿ‚\0\0',1479968366),('f4f485d000b0e8ffeca029b247cd095e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970348),('f504176f8ce34304c011159e8e88b456','ÿÿ‚\0\0\0ÿ‚\0\0',1479967840),('f523f53b889f66210452b06f1e9c6a12','ÿÿ‚\0\0\0ÿ‚\0\0',1479971848),('f53d90f3c0c5c026d6e6f8bfb684ecfa','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('f542e067a97e1ab2ee741e4e0fad29a8','ÿÿ‚\0\0\0ÿ‚\0\0',1479969267),('f57d1325e282a69135c57eabf7e08016','ÿÿ‚\0\0\0ÿ‚\0\0',1479968957),('f5a838a418023317ca581b4678b5f399','ÿÿ‚\0\0\0ÿ‚\0\0',1479968040),('f5ba67edf0f2a00cc101de714808c9e9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970011),('f5c23d2d1914ab7f0c06403a51cf45f0','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('f5cc26734e80f8a39b6cae735d2a8cee','ÿÿ‚\0\0\0ÿ‚\0\0',1479970971),('f5db35da13fd5d214ee222449e41cfa6','ÿÿ‚\0\0\0ÿ‚\0\0',1479970050),('f61f98fcfec83194c015cae0395fead4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('f62f1c7769e2047176b3201638b9ac9a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('f6b2dd41e986865992bf2f5c2464e8fa','ÿÿ‚\0\0\0ÿ‚\0\0',1479970349),('f6bc76cfb0b1dd236849f7db2267b3c2','ÿÿ‚\0\0\0ÿ‚\0\0',1479969340),('f6e4c9470894a501533ec1134def3f16','ÿÿ‚\0\0\0ÿ‚\0\0',1479969913),('f740a4efedc63c29ab38aea5cf6e74b6','ÿÿ‚\0\0\0ÿ‚\0\0',1479971988),('f76bdee410ffc69f8caa7c0d9365d260','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('f77dd43ceb43241f0f4a6d9c21263b74','ÿÿ‚\0\0\0ÿ‚\0\0',1479971789),('f79ac10f26292749058fb4d0ad0f83a2','ÿÿ‚\0\0\0ÿ‚\0\0',1479968657),('f7d567e8ee08b6e56020ea3ecbe0f7ab','ÿÿ‚\0\0\0ÿ‚\0\0',1479972112),('f7db10d9bc8f9eef873c9b0bba948e30','ÿÿ‚\0\0\0ÿ‚\0\0',1479972089),('f80c2d115d2f88e738aa02f5b74c9122','ÿÿ‚\0\0\0ÿ‚\0\0',1479970465),('f854c74711d2eed3d794dddeadb01f65','ÿÿ‚\0\0\0ÿ‚\0\0',1479971450),('f85dc680749ae7930d0012e0c3478ee0','ÿÿ‚\0\0\0ÿ‚\0\0',1479968242),('f890fdbbe17f7fe32675585bbb246a49','ÿÿ‚\0\0\0ÿ‚\0\0',1479969801),('f90062cb3c44aa02a1c60fc3a823de98','ÿÿ‚\0\0\0ÿ‚\0\0',1479970973),('f90350b393e72bfd8486a0f7795e95c4','ÿÿ‚\0\0\0ÿ‚\0\0',1479970582),('f953dc01cd48dda020b2a36f8ce45992','ÿÿ‚\0\0\0ÿ‚\0\0',1479972065),('f994693864c5e1b6424cb140c93fd1ff','ÿÿ‚\0\0\0ÿ‚\0\0',1479971131),('f994879978b5b837a7ef8544a93751bb','ÿÿ‚\0\0\0ÿ‚\0\0',1479970531),('f9a67c20fefea699b117a8a7581d2ca9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970182),('f9adc4748a1583b81cfb826536dcb836','ÿÿ‚\0\0\0ÿ‚\0\0',1479970899),('f9b179a4d7a50c59d813a9af61670527','ÿÿ‚\0\0\0ÿ‚\0\0',1479971139),('f9bfdbccd1a72a3594eefd7fde5b1d71','ÿÿ‚\0\0\0ÿ‚\0\0',1479970967),('f9d25bab2a58405472573f25f65f69aa','ÿÿ‚\0\0\0ÿ‚\0\0',1479969338),('f9f6729395033890d8fbcb448633ff52','ÿÿ‚\0\0\0ÿ‚\0\0',1479971433),('fa0a3a766bc7f586bef31bde15554d16','ÿÿ‚\0\0\0ÿ‚\0\0',1479970344),('fa1b3fb8c3b32f0e1b3a81cef235a62d','ÿÿ‚\0\0\0ÿ‚\0\0',1479967782),('fa355718ebc656011e4ee043fee2794d','ÿÿ‚\0\0\0ÿ‚\0\0',1479969914),('fa3cc103779c9a0cc3aa51bde83f9790','ÿÿ‚\0\0\0ÿ‚\0\0',1479972165),('fa58325e415432a29da8de181e09db0e','ÿÿ‚\0\0\0ÿ‚\0\0',1479971985),('fa93c00a22a8aea930cda1a2c631d193','ÿÿ‚\0\0\0ÿ‚\0\0',1479970012),('fad179ea3030de31e6ef451a78928274','ÿÿ‚\0\0\0ÿ‚\0\0',1479971980),('fae2bbf5e64850bf721a8c657a163bec','ÿÿ‚\0\0\0ÿ‚\0\0',1479972064),('faf521ee5727d3487cfd6cb8e394976b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969001),('fafa7c35478da89537f65fc8986de73a','ÿÿ‚\0\0\0ÿ‚\0\0',1479968038),('fb060ab09b5a70c3c40d3fa36467d09a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970049),('fb37034323288f616e9fb164f5b87217','ÿÿ‚\0\0\0ÿ‚\0\0',1479971838),('fb39a88e3b8604435f5a6819dd5325b4','ÿÿ‚\0\0\0ÿ‚\0\0',1479968784),('fb3e652530c40c8a8b9eb8a30b7c5d88','ÿÿ‚\0\0\0ÿ‚\0\0',1479970056),('fb6020690d15929654cf052e503eb61f','ÿÿ‚\0\0\0ÿ‚\0\0',1479970533),('fb911355c2732c77bd07172ac7cff954','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('fba3b71aa4bc53f2ec2e5cc1513cab83','ÿÿ‚\0\0\0ÿ‚\0\0',1479970337),('fba4041c2080f7e22606cbc0be75132e','ÿÿ‚\0\0\0ÿ‚\0\0',1479972248),('fbb7ef547958397964c9c872b5e53f69','ÿÿ‚\0\0\0ÿ‚\0\0',1479971946),('fbbc4a5895354983ec319d6356af8357','ÿÿ‚\0\0\0ÿ‚\0\0',1479968716),('fbcbf150aa067604ef99f5881e0df8ca','ÿÿ‚\0\0\0ÿ‚\0\0',1479970956),('fbde42c8b1f9c78f961584ee991c0959','ÿÿ‚\0\0\0ÿ‚\0\0',1479969020),('fbe94f87b1253513b8822981e67205ba','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('fc76307cd14826a7fa4f09f099282399','ÿÿ‚\0\0\0ÿ‚\0\0',1479969001),('fcb577f2b54940e0cac5140d83a9afe0','ÿÿ‚\0\0\0ÿ‚\0\0',1479969012),('fcbd30dc81a25ea5022ddc59722138de','ÿÿ‚\0\0\0ÿ‚\0\0',1479970942),('fce65818ffd7405261c8220d96f953cb','ÿÿ‚\0\0\0ÿ‚\0\0',1479972352),('fd01b4643baee374bdb69863f903234f','ÿÿ‚\0\0\0ÿ‚\0\0',1479972054),('fd085d7ff2879a71e4886ea867d5f4b3','ÿÿ‚\0\0\0ÿ‚\0\0',1479971128),('fd15baa4f5fe9e0fc492315556f3c0ae','ÿÿ‚\0\0\0ÿ‚\0\0',1479969909),('fd4823cae99b79d365079f4058064a1a','ÿÿ‚\0\0\0ÿ‚\0\0',1479969000),('fd4ca53ebad68df7e0b8211d71bb3e8b','ÿÿ‚\0\0\0ÿ‚\0\0',1479969914),('fdc9eab19491415e9e3f0220d7d66dea','ÿÿ‚\0\0\0ÿ‚\0\0',1479971574),('fdcb7aefe7f5a7190998a0385c19027a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970464),('fdfd01629aa616db6efd11137f437a83','ÿÿ‚\0\0\0ÿ‚\0\0',1479968242),('fe64c6e66d538997f411541e829487b9','ÿÿ‚\0\0\0ÿ‚\0\0',1479970920),('fe7180df38f83e1d6b243c36775ad5e6','ÿÿ‚\0\0\0ÿ‚\0\0',1479969937),('fea354ac486e4da3d69415dfd53cda49','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('fea59cadfca39ce42ed9d16b45ed0f19','ÿÿ‚\0\0\0ÿ‚\0\0',1479968147),('fed4af87562269f0ebf715c2f25440f3','ÿÿ‚\0\0\0ÿ‚\0\0',1479969326),('ff1043e8f272735cafd07976cdf93142','ÿÿ‚\0\0\0ÿ‚\0\0',1479972084),('ff22ea8b4ac5ea80402a0d574878940d','ÿÿ‚\0\0\0ÿ‚\0\0',1479969001),('ff57163b11b53f3c84a74aafc999fc34','ÿÿ‚\0\0\0ÿ‚\0\0',1479968387),('ff6599c71513577175b87fb9ea1b1b7a','ÿÿ‚\0\0\0ÿ‚\0\0',1479970412),('ff705113d50b6b6ef77f3479ae39d78e','ÿÿ‚\0\0\0ÿ‚\0\0',1479970006),('ff72a1b825b58b4a661b4f366ea7f9b6','ÿÿ‚\0\0\0ÿ‚\0\0',1479967839),('ffb9501d5b96689ad77f4b77c1a47d98','ÿÿ‚\0\0\0ÿ‚\0\0',1479971778),('ffe11b1708d5706f40abc5310d4dd104','ÿÿ‚\0\0\0ÿ‚\0\0',1479972055),('fff942876437b2f342d0b9e5ccdbff83','ÿÿ‚\0\0\0ÿ‚\0\0',1479970532);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `software` (
  `softwareid` bigint(20) NOT NULL AUTO_INCREMENT,
  `software` varchar(255) DEFAULT NULL,
  `version` varchar(512) DEFAULT NULL,
  `appid` bigint(20) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`softwareid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `software`
--

LOCK TABLES `software` WRITE;
/*!40000 ALTER TABLE `software` DISABLE KEYS */;
/*!40000 ALTER TABLE `software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier` varchar(255) DEFAULT NULL,
  `business_contact` varchar(32) DEFAULT NULL,
  `business_tel_phone` varchar(32) DEFAULT NULL,
  `business_mobile_phone` varchar(32) DEFAULT NULL,
  `business_email` varchar(32) DEFAULT NULL,
  `technology_contact` varchar(32) DEFAULT NULL,
  `technology_telphone` varchar(32) DEFAULT NULL,
  `technology_mobile_phone` varchar(32) DEFAULT NULL,
  `technology_email` varchar(32) DEFAULT NULL,
  `office_address` varchar(32) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (2,'DELL','æ','021-6095 0835','021-60950835','3243@','èµµ','021-60950835','456564565','2323@','ä¸Šæµ·','oneoaas',0,'0000-00-00 00:00:00','','','2016-11-11 13:29:09'),(3,'HUAWEI','å­™','021-6095 0835','021-60950835','5454@','æ¨','021-60950835','234234234','2323@','ä¸Šæµ·','oneoaas',1,'0000-00-00 00:00:00',NULL,NULL,'0000-00-00 00:00:00'),(4,'DELLæœåŠ¡å™¨','','','13478900987','','','13578908765','13578908765','','','',0,'2016-09-20 07:38:11','','','2016-11-14 14:30:09'),(6,'','','','','','','','','','','',0,'2016-11-10 15:51:50','','','2016-11-10 15:51:50'),(7,'11','11','15655565656','15655656565','1212@qq.com','d','13555656554','13555656554','45454@qq.com','151515','111',0,'2016-11-18 15:36:09','','','2016-11-18 15:36:09'),(8,'5','','','15601888860','','','13699886555','13699886555','','','',0,'2016-11-18 15:37:58','','','2016-11-18 15:37:58'),(9,'sfgsfs','fdfdsf','','13545267412','','dsdsfdc','13545267412','13545267412','dfgeeefdfd','ddggeerfwefg4tef','',0,'2016-11-18 15:38:05','','','2016-11-18 15:38:05'),(10,'555','','','15624888465','','','15632232222','15632232222','','','',0,'2016-11-18 15:41:22','','','2016-11-18 15:41:22'),(11,'cisco','ä½™','0728-2780015','13545267412','yangyang.yu@oneoaas.com','åˆ˜å½¬','13545267412','13545267412','0728-2785456','å¤©åœ°è½¯ä»¶å›­','',1,'2016-11-24 10:21:32','','','2016-11-24 10:21:32');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_email`
--

DROP TABLE IF EXISTS `system_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_email` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `port` varchar(10) NOT NULL DEFAULT '',
  `server` varchar(20) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_email`
--

LOCK TABLES `system_email` WRITE;
/*!40000 ALTER TABLE `system_email` DISABLE KEYS */;
INSERT INTO `system_email` VALUES (1,'oneoaas.com','60904796','8080','10.0.0.1','2016-11-10 09:56:05','','','2016-11-10 09:56:05'),(2,'baidu.com','yu123456','9898','10.0.2.22','2016-11-23 17:13:54','','','2016-11-23 17:13:54'),(3,'tengxu.com','60904796','8080','10.0.2.23','2016-11-23 17:17:14','','','2016-11-23 17:17:14'),(4,'','','','','2016-11-24 09:43:22','','','2016-11-24 09:43:22'),(5,'åŒæ–¹éƒ½æ”¶åˆ°','sdsds ','0','éƒ½æ˜¯æˆ‘çš„','2016-11-24 09:48:44','','','2016-11-24 09:48:44'),(6,'åŒæ–¹éƒ½æ”¶åˆ°ä¼Ÿä¼Ÿ','sdsds','0','éƒ½æ˜¯æˆ‘çš„æˆ‘é—®é—®','2016-11-24 09:49:04','','','2016-11-24 09:49:04'),(7,'ä¼Ÿä¼Ÿ','wwwwww','11111','å»ç©ç©æ— æ— æ— æ— æ— æ— æ— æ— æ— ','2016-11-24 09:50:57','','','2016-11-24 09:50:57');
/*!40000 ALTER TABLE `system_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_licence`
--

DROP TABLE IF EXISTS `system_licence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_licence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` bigint(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `expires` bigint(20) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_licence`
--

LOCK TABLES `system_licence` WRITE;
/*!40000 ALTER TABLE `system_licence` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_licence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `module_name` varchar(20) NOT NULL DEFAULT '',
  `module_display_name` varchar(20) NOT NULL DEFAULT '',
  `entity_name` varchar(20) NOT NULL DEFAULT '',
  `entity_display_name` varchar(20) NOT NULL DEFAULT '',
  `instance_id` varchar(20) NOT NULL DEFAULT '',
  `instance_display_name` varchar(20) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT '',
  `cause` varchar(100) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_panel`
--

DROP TABLE IF EXISTS `system_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_panel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `json_id` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `json_id` (`json_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_panel`
--

LOCK TABLES `system_panel` WRITE;
/*!40000 ALTER TABLE `system_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topo_line`
--

DROP TABLE IF EXISTS `topo_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topo_line` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from` bigint(20) NOT NULL DEFAULT '0',
  `to` bigint(20) NOT NULL DEFAULT '0',
  `length` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `topo_view_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topo_line`
--

LOCK TABLES `topo_line` WRITE;
/*!40000 ALTER TABLE `topo_line` DISABLE KEYS */;
INSERT INTO `topo_line` VALUES (29,56,55,0,'','',17,0,'2016-11-10 10:05:00','','','2016-11-10 10:05:00',NULL),(30,56,57,0,'å•Šå•Šå•Š','',17,0,'2016-11-10 10:07:08','','','2016-11-10 10:07:08',NULL),(31,0,56,0,'è™šæ‹Ÿç½‘ç«™','',17,0,'2016-11-10 18:45:20','','','2016-11-10 18:45:20',NULL),(32,58,56,0,'æ™®é™€åŒº','',17,0,'2016-11-10 18:46:27','','','2016-11-10 18:46:27',NULL),(33,59,55,0,'å®å±±ä¸­å¿ƒ','',17,0,'2016-11-16 03:22:30','','','2016-11-15 14:24:26',NULL),(34,57,58,0,'æœºæˆ¿','',17,0,'2016-11-18 15:26:18','','','2016-11-18 15:26:18',NULL),(35,0,65,0,'å¾æ±‡--é•¿å®','',18,0,'2016-11-18 15:27:50','','','2016-11-18 15:27:50',NULL),(36,66,65,0,'å¾æ±‡---é•¿å®','',18,0,'2016-11-18 15:28:15','','','2016-11-18 15:28:15',NULL),(37,62,61,0,'ä¸»è¦çº¿è·¯','',22,0,'2016-11-18 15:29:03','','','2016-11-18 15:29:03',NULL),(38,62,64,0,'æ¬¡è¦çº¿è·¯','',22,0,'2016-11-18 15:29:22','','','2016-11-18 15:29:22',NULL),(39,62,63,0,'å¸¦å®½ï¼š2G','',22,0,'2016-11-18 15:29:53','','','2016-11-18 15:29:53',NULL),(40,67,68,0,'è™šæ‹Ÿçº¿è·¯','',19,0,'2016-11-18 15:31:43','','','2016-11-18 15:31:43',NULL);
/*!40000 ALTER TABLE `topo_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topo_node`
--

DROP TABLE IF EXISTS `topo_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topo_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `shape` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `x` bigint(20) DEFAULT NULL,
  `y` bigint(20) DEFAULT NULL,
  `topo_view_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `display_name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topo_node`
--

LOCK TABLES `topo_node` WRITE;
/*!40000 ALTER TABLE `topo_node` DISABLE KEYS */;
INSERT INTO `topo_node` VALUES (55,'ä¸Šæµ·å®å±±æ•°æ®ä¸­å¿ƒ','assets/img/cmdb/datacenter.png','image','ä¸Šæµ·',-738,-893,17,0,'2016-11-12 01:04:04','','','2016-11-15 14:23:57',NULL,NULL,NULL,NULL),(56,'å®å±±ä¸­å¿ƒæœºæˆ¿','assets/img/cmdb/room.png','image','',-657,-650,17,0,'2016-11-11 12:04:32','','','2016-11-14 16:10:24',NULL,NULL,NULL,NULL),(57,'ä¸Šæµ·æ¼•æ²³æ³¾æœºæˆ¿','assets/img/cmdb/room.png','image','',-406,-502,17,0,'2016-11-11 12:05:27','','','2016-11-15 14:21:07',NULL,NULL,NULL,NULL),(58,'ä¸Šæµ·','assets/img/cmdb/vmware.png','image','æ™®é™€åŒº',-356,-796,17,0,'2016-11-12 09:45:00','','','2016-11-15 14:22:35',NULL,NULL,NULL,NULL),(59,'å®å±±æœºæŸœ101','assets/img/cmdb/rack.png','image','192.168.121.100',-918,-485,17,0,'2016-11-16 03:21:59','','','2016-11-15 14:22:06',NULL,NULL,NULL,NULL),(60,'43434','assets/img/cmdb/datacenter.png','image','',-24,-318,20,0,'2016-11-16 03:24:51','','','2016-11-15 14:24:56',NULL,NULL,NULL,NULL),(61,'ä¸Šæµ·å®å±±æ•°æ®ä¸­å¿ƒ','assets/img/cmdb/datacenter.png','image','',-149,-1058,22,0,'2016-11-18 00:16:57','','','2016-11-18 15:29:24',NULL,NULL,NULL,NULL),(62,'ä¸Šæµ·æ¼•æ²³æ³¾æœºæˆ¿','assets/img/cmdb/room.png','image','',-263,-817,22,0,'2016-11-18 13:17:06','','','2016-11-18 15:29:06',NULL,NULL,NULL,NULL),(63,'å®å±±æœºæŸœ101','assets/img/cmdb/rack.png','image','',161,-945,22,0,'2016-11-18 13:17:17','','','2016-11-18 15:29:56',NULL,NULL,NULL,NULL),(64,'22','assets/img/cmdb/server.png','image','',20,-686,22,0,'2016-11-17 11:17:46','','','2016-11-18 15:30:03',NULL,NULL,NULL,NULL),(65,'ä¸Šæµ·é•¿å®æœºæˆ¿','assets/img/cmdb/room.png','image','',97,-981,18,0,'2016-11-19 17:26:56','','','2016-11-18 15:27:54',NULL,NULL,NULL,NULL),(66,'ä¸Šæµ·å¾æ±‡æ•°æ®ä¸­å¿ƒ','assets/img/cmdb/datacenter.png','image','å…¬å¸ä¸»è¥',-21,-1174,18,0,'2016-11-19 04:27:28','','','2016-11-18 15:27:58',NULL,NULL,NULL,NULL),(67,'ä¸Šæµ·è™¹å£æ•°æ®ä¸­å¿ƒ','assets/img/cmdb/datacenter.png','image','æˆéƒ½äº¤æ¥ä¸­å¿ƒ',-469,-983,19,0,'2016-11-20 06:30:48','','','2016-11-18 15:31:48',NULL,NULL,NULL,NULL),(68,'oneops','assets/img/cmdb/vmware.png','image','äº‘ä¸Šä¸»æœº',-600,-717,19,0,'2016-11-20 06:31:15','','','2016-11-18 15:31:45',NULL,NULL,NULL,NULL),(69,'ä¸Šæµ·å®å±±æ•°æ®ä¸­å¿ƒ','assets/img/cmdb/datacenter.png','image','test',0,-303,24,0,'2016-11-24 15:22:32','','','2016-11-24 15:22:32',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `topo_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topo_view`
--

DROP TABLE IF EXISTS `topo_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topo_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topo_view`
--

LOCK TABLES `topo_view` WRITE;
/*!40000 ALTER TABLE `topo_view` DISABLE KEYS */;
INSERT INTO `topo_view` VALUES (17,'ä¸Šæµ·æ•°æ®ä¸­å¿ƒ',0,'2016-11-10 10:03:14','','','2016-11-10 10:03:14'),(18,'åŒ—äº¬æ•°æ®ä¸­å¿ƒ',0,'2016-11-10 18:47:28','','','2016-11-10 18:47:28'),(19,'æˆéƒ½æ•°æ®ä¸­å¿ƒ',0,'2016-11-15 13:48:01','','','2016-11-15 13:48:01'),(20,'å¤§è¿æ•°æ®ä¸­å¿ƒ',0,'2016-11-15 13:48:19','','','2016-11-15 13:48:19'),(21,'ä¸Šæµ·æ•°æ®ä¸­å¿ƒ',0,'2016-11-15 15:36:16','','','2016-11-15 15:36:16'),(22,'å››å·æ•°æ®ä¸­å¿ƒ',0,'2016-11-15 15:43:22','','','2016-11-15 15:43:22'),(23,'test',0,'2016-11-23 17:31:51','','','2016-11-23 17:31:51'),(24,'test',0,'2016-11-24 15:22:21','','','2016-11-24 15:22:21');
/*!40000 ALTER TABLE `topo_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `login_name` varchar(45) DEFAULT NULL,
  `email` varchar(128) NOT NULL DEFAULT '',
  `contact_phone` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `salt` varchar(32) NOT NULL DEFAULT '',
  `registertime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact_phone` (`contact_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'oneoaas','admin','test@qq.com','18601706743','23d68a0f00ed8614d4e836f20ce018dd','xwQQoxl6n7`!@.[#','2016-07-10 15:41:31','2016-07-10 15:41:31',8),(9,'ä½™æ´‹æ´‹','yuyangyang','571014594@qq.com','18516074685','f4b4b6b0cecf4f4e25d4ca108f102586','!Y5;mt@de;j;p0(0','2016-11-24 02:43:55','2016-11-23 16:50:55',9),(13,'xwt','WWW','wentao.xie@oneoaas.com','15601888860','16a081117aaf7a1b1c1794e05ea614d7','5%.GX|KoW(ZmAg:B','2016-11-24 18:08:08','2016-11-23 16:48:52',9);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (4,9,9),(6,0,12),(8,13,9),(9,0,0);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virt`
--

DROP TABLE IF EXISTS `virt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virt` (
  `virtid` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `virttypeid` int(11) NOT NULL DEFAULT '0',
  `cpu` varchar(256) NOT NULL DEFAULT '',
  `memory` varchar(256) NOT NULL DEFAULT '',
  `harddisk` varchar(256) NOT NULL DEFAULT '',
  `networkcard` varchar(256) NOT NULL DEFAULT '',
  `ishypervisor` varchar(256) NOT NULL DEFAULT '',
  `hostname` varchar(256) NOT NULL DEFAULT '',
  `appid` varchar(256) NOT NULL DEFAULT '',
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`virtid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virt`
--

LOCK TABLES `virt` WRITE;
/*!40000 ALTER TABLE `virt` DISABLE KEYS */;
/*!40000 ALTER TABLE `virt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virttype`
--

DROP TABLE IF EXISTS `virttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virttype` (
  `virttypeid` int(11) NOT NULL AUTO_INCREMENT,
  `virttype` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`virttypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virttype`
--

LOCK TABLES `virttype` WRITE;
/*!40000 ALTER TABLE `virttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `virttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm_aliyun`
--

DROP TABLE IF EXISTS `vm_aliyun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vm_aliyun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(50) NOT NULL DEFAULT '',
  `instance_id` varchar(50) NOT NULL DEFAULT '',
  `c_p_u` int(11) NOT NULL DEFAULT '0',
  `memory` int(11) NOT NULL DEFAULT '0',
  `creation_time` datetime NOT NULL,
  `ip_address` varchar(20) NOT NULL DEFAULT '',
  `expired_time` datetime NOT NULL,
  `host_name` varchar(20) NOT NULL DEFAULT '',
  `image_id` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(20) NOT NULL DEFAULT '',
  `zone_id` varchar(20) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_aliyun`
--

LOCK TABLES `vm_aliyun` WRITE;
/*!40000 ALTER TABLE `vm_aliyun` DISABLE KEYS */;
INSERT INTO `vm_aliyun` VALUES (3,'haoxi','111',1111,111,'2016-11-24 15:01:28','192.168.1.1','2016-11-24 15:01:28','11','111','111','111',1,'2016-11-11 07:02:25','','','2016-11-24 15:01:28');
/*!40000 ALTER TABLE `vm_aliyun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm_aws`
--

DROP TABLE IF EXISTS `vm_aws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vm_aws` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `architecture` varchar(20) NOT NULL DEFAULT '',
  `hypervisor` varchar(20) NOT NULL DEFAULT '',
  `image_id` varchar(20) NOT NULL DEFAULT '',
  `instance_id` varchar(20) NOT NULL DEFAULT '',
  `instance_lifecycle` varchar(20) NOT NULL DEFAULT '',
  `instance_type` varchar(20) NOT NULL DEFAULT '',
  `kernel_id` varchar(20) NOT NULL DEFAULT '',
  `launch_time` varchar(20) NOT NULL DEFAULT '',
  `platform` varchar(20) NOT NULL DEFAULT '',
  `private_dns_name` varchar(20) NOT NULL DEFAULT '',
  `private_ip_address` varchar(20) NOT NULL DEFAULT '',
  `public_dns_name` varchar(20) NOT NULL DEFAULT '',
  `public_ip_address` varchar(20) NOT NULL DEFAULT '',
  `virtualization_type` varchar(20) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_aws`
--

LOCK TABLES `vm_aws` WRITE;
/*!40000 ALTER TABLE `vm_aws` DISABLE KEYS */;
INSERT INTO `vm_aws` VALUES (1,'121','','2','21','21','12','','2016-10-18 11:38:14.','12','12','','12','21.2.2.2','21',1,'2016-10-18 11:38:14','','','2016-10-18 11:38:14'),(2,'232','','323','23','32','32','','2016-11-02 17:39:08.','32','32','','32','23.3.3.3','3',1,'2016-11-02 17:39:08','','','2016-11-02 17:39:08'),(4,'2','','2','2','2','2','','2016-11-03 19:10:35.','2','2','','2','2.2.2.2','2',0,'2016-11-03 19:10:35','','','2016-11-03 19:10:35'),(5,'w','','w','w','w','w','','2016-11-08 10:25:35.','w','w','','w','2.2.2.2','w',0,'2016-11-08 10:25:35','','','2016-11-08 10:25:35'),(6,'','','','','','','','2016-11-10 11:49:10.','','','','','','',0,'2016-11-10 11:49:10','','','2016-11-10 11:49:10');
/*!40000 ALTER TABLE `vm_aws` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm_vmware`
--

DROP TABLE IF EXISTS `vm_vmware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vm_vmware` (
  `vcenter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `template` tinyint(1) NOT NULL DEFAULT '0',
  `vm_path_name` varchar(50) NOT NULL DEFAULT '',
  `memory_size` int(11) NOT NULL DEFAULT '0',
  `cpu_reservation` int(11) NOT NULL DEFAULT '0',
  `memory_reservation` int(11) NOT NULL DEFAULT '0',
  `num_cpu` int(11) NOT NULL DEFAULT '0',
  `num_ethernet_cards` int(11) NOT NULL DEFAULT '0',
  `num_virtual_disks` int(11) NOT NULL DEFAULT '0',
  `uuid` varchar(30) NOT NULL DEFAULT '',
  `instance_uuid` varchar(30) NOT NULL DEFAULT '',
  `guest_id` varchar(30) NOT NULL DEFAULT '',
  `guest_fullname` varchar(30) NOT NULL DEFAULT '',
  `annotation` varchar(30) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`vcenter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2816 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_vmware`
--

LOCK TABLES `vm_vmware` WRITE;
/*!40000 ALTER TABLE `vm_vmware` DISABLE KEYS */;
INSERT INTO `vm_vmware` VALUES (2808,'alipay',0,'http://www.baidu.com',25,0,0,10,10,10,'','','','window 10','',0,'2016-11-24 13:07:53','','','2016-11-24 13:07:53'),(2809,'oneoaas.com',1,'www.oneoaas.com',10,0,0,10,20,10,'','','','ios','',1,'2016-11-25 15:08:57','','','2016-11-24 15:04:29'),(2810,'tengxun',0,'www.tengxun.com',25,0,0,10,10,10,'','','','linux','',1,'2016-11-24 14:11:07','','','2016-11-24 14:11:07'),(2811,'baidu',0,'www.baidu.com',125,0,0,10,20,30,'','','','window 98','',1,'2016-11-24 14:14:38','','','2016-11-24 14:14:38'),(2812,'bilibili',0,'www.bilibili.com',25,0,0,10,20,30,'','','','ubuntu','',1,'2016-11-24 14:18:00','','','2016-11-24 14:18:00'),(2813,'aqiyi',1,'www.iqiyi.com',25,0,0,10,10,10,'','','','ios 2','',1,'2016-11-24 14:20:31','','','2016-11-24 14:20:31'),(2814,'tudou',0,'www.tudou.com',30,0,0,20,10,10,'','','','ios','',1,'2016-11-24 14:21:35','','','2016-11-24 14:21:35'),(2815,'qixiu',1,'www.qixiu.com',100,0,0,20,30,25,'','','','window 8','',1,'2016-11-24 14:54:24','','','2016-11-24 14:54:24');
/*!40000 ALTER TABLE `vm_vmware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zabbix_host`
--

DROP TABLE IF EXISTS `zabbix_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zabbix_host` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `host_name` varchar(256) DEFAULT NULL,
  `host_id` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zabbix_host`
--

LOCK TABLES `zabbix_host` WRITE;
/*!40000 ALTER TABLE `zabbix_host` DISABLE KEYS */;
INSERT INTO `zabbix_host` VALUES (1,'Template OS Linux','10001',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(2,'Template App Zabbix Server','10047',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(3,'Template App Zabbix Proxy','10048',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(4,'Template App Zabbix Agent','10050',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(5,'Template SNMP Interfaces','10060',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(6,'Template SNMP Generic','10065',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(7,'Template SNMP Device','10066',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(8,'Template SNMP OS Windows','10067',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(9,'Template SNMP Disks','10068',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(10,'Template SNMP OS Linux','10069',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(11,'Template SNMP Processors','10070',1,'2016-10-14 15:00:08','','','2016-10-14 15:00:08'),(12,'Template IPMI Intel SR1530','10071',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(13,'Template IPMI Intel SR1630','10072',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(14,'Template App MySQL','10073',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(15,'Template OS OpenBSD','10074',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(16,'Template OS FreeBSD','10075',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(17,'Template OS AIX','10076',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(18,'Template OS HP-UX','10077',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(19,'Template OS Solaris','10078',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(20,'Template OS Mac OS X','10079',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(21,'Template OS Windows','10081',1,'2016-10-14 15:00:09','','','2016-10-14 15:00:09'),(22,'Template JMX Generic','10082',1,'2016-10-14 15:00:10','','','2016-10-14 15:00:10'),(23,'Template JMX Tomcat','10083',1,'2016-10-14 15:00:10','','','2016-10-14 15:00:10'),(24,'Zabbix server','10084',1,'2016-10-14 15:00:10','','','2016-10-14 15:00:10'),(25,'Template Virt VMware','10088',1,'2016-10-14 15:00:10','','','2016-10-14 15:00:10'),(26,'Template Virt VMware Guest','10089',1,'2016-10-14 15:00:10','','','2016-10-14 15:00:10'),(27,'Template Virt VMware Hypervisor','10091',1,'2016-10-14 15:00:10','','','2016-10-14 15:00:10'),(28,'Template App FTP Service','10093',1,'2016-10-14 15:00:10','','','2016-10-14 15:00:10'),(29,'Template App HTTP Service','10094',1,'2016-10-14 15:00:10','','','2016-10-14 15:00:10'),(30,'Template App HTTPS Service','10095',1,'2016-10-14 15:00:11','','','2016-10-14 15:00:11'),(31,'Template App IMAP Service','10096',1,'2016-10-14 15:00:11','','','2016-10-14 15:00:11'),(32,'Template App LDAP Service','10097',1,'2016-10-14 15:00:11','','','2016-10-14 15:00:11'),(33,'Template App NNTP Service','10098',1,'2016-10-14 15:00:11','','','2016-10-14 15:00:11'),(34,'Template App NTP Service','10099',1,'2016-10-14 15:00:11','','','2016-10-14 15:00:11'),(35,'Template App POP Service','10100',1,'2016-10-14 15:00:12','','','2016-10-14 15:00:12'),(36,'Template App SMTP Service','10101',1,'2016-10-14 15:00:12','','','2016-10-14 15:00:12'),(37,'Template App SSH Service','10102',1,'2016-10-14 15:00:12','','','2016-10-14 15:00:12'),(38,'Template App Telnet Service','10103',1,'2016-10-14 15:00:12','','','2016-10-14 15:00:12'),(39,'Template ICMP Ping','10104',1,'2016-10-14 15:00:12','','','2016-10-14 15:00:12'),(40,'10.0.2.120-win2K8','10105',1,'2016-10-14 15:00:12','','','2016-10-14 15:00:12'),(41,'10.0.1.123','10107',1,'2016-10-14 15:00:12','','','2016-10-14 15:00:12'),(42,'10.0.1.127','10109',1,'2016-10-14 15:00:13','','','2016-10-14 15:00:13'),(43,'Template APP JMX Monitoring For Tomcat','10112',1,'2016-10-14 15:00:13','','','2016-10-14 15:00:13'),(44,'Template APP JMX Monitoring For Tomcat-bak','10183',1,'2016-10-14 15:00:13','','','2016-10-14 15:00:13'),(45,'Template APP JMX Monitoring For Tomcat-bak-old','10186',1,'2016-10-14 15:00:13','','','2016-10-14 15:00:13'),(46,'Template JMX Tomcat with Macros Beta2','10187',1,'2016-10-14 15:00:13','','','2016-10-14 15:00:13'),(47,'Template MySQL Slave','10199',1,'2016-10-14 15:00:13','','','2016-10-14 15:00:13'),(48,'Template MySQL Master','10200',1,'2016-10-14 15:00:13','','','2016-10-14 15:00:13'),(49,'Template MySQL InnoDB','10201',1,'2016-10-14 15:00:13','','','2016-10-14 15:00:13'),(50,'Template MySQL DB','10202',1,'2016-10-14 15:00:14','','','2016-10-14 15:00:14'),(51,'test','10203',1,'2016-10-14 15:00:14','','','2016-10-14 15:00:14'),(52,'10.0.1.111','10267',1,'2016-10-14 15:00:14','','','2016-10-14 15:00:14'),(53,'4c4c4544-004d-5010-8056-b2c04f4b5931','10270',1,'2016-10-14 15:00:14','','','2016-10-14 15:00:14'),(54,'Template_Oracle','10300',1,'2016-10-14 15:00:14','','','2016-10-14 15:00:14'),(55,'VMware Hardware Health','10316',1,'2016-10-14 15:00:14','','','2016-10-14 15:00:14'),(56,'dev-gitlab','10423',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(57,'vmware','10427',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(58,'Template_Cisco_IP_SLA_Discovery','10437',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(59,'127.0.0.1','10440',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(60,'10.0.2.166','10441',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(61,'Template JMX Tomcat7','10442',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(62,'10.0.2.12','10443',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(63,'Template JMX Weblogic12','10444',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(64,'Template JMX Jboss7','10445',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(65,'Template App Microsoft SQL Server','10446',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(66,'10.0.2.37','10447',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(67,'master','10448',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(68,'Template App MS SQL Default Installation LLD','10449',1,'2016-10-14 15:00:15','','','2016-10-14 15:00:15'),(69,'Hyper_V_Template','10450',1,'2016-10-14 15:00:16','','','2016-10-14 15:00:16'),(70,'Exchange 2010','10499',1,'2016-10-14 15:00:16','','','2016-10-14 15:00:16'),(71,'564d4c5b-d156-1219-6329-213dc8fbf00c','10501',1,'2016-10-14 15:00:16','','','2016-10-14 15:00:16'),(72,'42266c37-ba11-7cf0-ccae-c4b9cabf2637','10502',1,'2016-10-14 15:00:16','','','2016-10-14 15:00:16'),(73,'420cebb0-5276-d247-c7e0-3863c296160a','10503',1,'2016-10-14 15:00:16','','','2016-10-14 15:00:16'),(74,'420cdcd6-9c5c-4bd1-d51c-a161759b9b96','10504',1,'2016-10-14 15:00:16','','','2016-10-14 15:00:16'),(75,'420c34b9-519a-a08b-76b4-d1de29c56b96','10505',1,'2016-10-14 15:00:16','','','2016-10-14 15:00:16'),(76,'420c52e0-4eaa-bec3-8ed7-22e924550074','10506',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(77,'420c0be9-0242-9f58-d8e6-2cd0f90c2fb8','10507',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(78,'420c281a-a4a2-eccb-6c22-e03aaa7159da','10508',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(79,'420cd465-45ca-9ce9-3624-cf5f0e53f512','10509',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(80,'421dbb85-5ae6-ae47-2f06-37e1f8e6103b','10510',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(81,'564d60e7-0948-2d0e-63dd-5b43a4580a18','10511',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(82,'564df55b-e717-d3e4-93f4-954e7994b9a2','10512',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(83,'421dce52-037b-3bad-ef76-6376acf5dd9f','10513',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(84,'421de24a-a7ef-a531-3fd6-415cf2237109','10514',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(85,'421d12f3-9959-3d18-d067-30c682722d8e','10515',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(86,'421d31b8-f313-ea2d-e505-ccd18945fafe','10516',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(87,'421d57de-2ebe-c49f-e0f5-2b8d3a70b97b','10517',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(88,'421d8dde-c541-2bd3-1e2e-1dfb0650a1b4','10518',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(89,'564d7b64-78c0-bd9a-1ec0-6df2aae6c4c5','10519',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(90,'564d60a4-f4d6-e38a-2f70-c47549751b8a','10521',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(91,'564d0663-9161-413f-e811-81c0f15094ee','10522',1,'2016-10-14 15:00:17','','','2016-10-14 15:00:17'),(92,'421df8bd-f644-7e6d-96a9-326d351a8d68','10523',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(93,'421d5687-c999-7a4a-4292-dce3cc3d6ecd','10524',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(94,'564df88d-2800-9fdd-b914-0b5e31577d2f','10525',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(95,'564d472e-656a-07d5-5c70-c59fe28cb597','10526',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(96,'564d6ad6-4b05-c9b7-0ab9-8be7482b103c','10528',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(97,'564d61b8-b037-bac8-44f2-77bcf02e1633','10529',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(98,'564d4727-2080-acb2-e940-db350e7e8947','10530',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(99,'564d5298-c2b3-ee2b-2715-d8ba6b775845','10531',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(100,'564d4ace-c11e-0e36-863e-5a97cc86fa14','10532',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(101,'564d3159-dce9-c11b-756b-ff3974b0540b','10533',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(102,'4217a11c-ac86-9c43-68b6-f049e857520e','10534',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(103,'564d174c-c4d0-feff-7bb2-bfa7c255fad5','10535',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(104,'564d7529-a672-0beb-e2e0-994c57d2d25a','10536',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(105,'564d7659-9fd9-c2da-f0f2-a92988f5a8db','10537',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(106,'Template Windows 2008 R2 Domain Controller','10538',1,'2016-10-14 15:00:18','','','2016-10-14 15:00:18'),(107,'Template Windows 2008 R2 Domain Controller Performance Monitor','10539',1,'2016-10-14 15:00:19','','','2016-10-14 15:00:19'),(108,'Template_Microsoft_DNS_Server','10540',1,'2016-10-14 15:00:19','','','2016-10-14 15:00:19'),(109,'10.0.2.162','10541',1,'2016-10-14 15:00:19','','','2016-10-14 15:00:19'),(110,'10.0.2.40','10544',1,'2016-10-14 15:00:19','','','2016-10-14 15:00:19'),(111,'Template Windows HyperV VM Guest','10549',1,'2016-10-14 15:00:19','','','2016-10-14 15:00:19'),(112,'Template Windows HyperV Host','10550',1,'2016-10-14 15:00:19','','','2016-10-14 15:00:19'),(113,'centos-1_WIN-QV8D3OKUO2D','10553',1,'2016-10-14 15:00:19','','','2016-10-14 15:00:19'),(114,'Template App IIS WP','10554',1,'2016-10-14 15:00:19','','','2016-10-14 15:00:19'),(115,'Template_Informix','10555',1,'2016-10-14 15:00:19','','','2016-10-14 15:00:19'),(116,'Template OS Linux','10001',1,'2016-10-14 18:36:44','','','2016-10-14 18:36:44'),(117,'Template OS Linux','10001',1,'2016-10-26 00:33:17','','','2016-10-26 00:33:17');
/*!40000 ALTER TABLE `zabbix_host` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-24  2:19:06
