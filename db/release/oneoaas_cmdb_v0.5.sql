-- MySQL dump 10.13  Distrib 5.6.29, for osx10.8 (x86_64)
--
-- Host: localhost    Database: oneoaas_cmdb
-- ------------------------------------------------------
-- Server version	5.6.29

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
-- Table structure for table `agreement`
--

DROP TABLE IF EXISTS `agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agreement` (
  `agreementid` bigint(20) NOT NULL AUTO_INCREMENT,
  `greementno` varchar(255) DEFAULT NULL,
  `agreementprice` bigint(20) DEFAULT NULL,
  `agreementsigndate` datetime DEFAULT NULL,
  `agreementstartdate` datetime DEFAULT NULL,
  `agreementstopdate` datetime DEFAULT NULL,
  `supplierid` varchar(256) DEFAULT NULL,
  `agreementsigner` varchar(256) DEFAULT NULL,
  `agreementpath` varchar(256) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`agreementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreement`
--

LOCK TABLES `agreement` WRITE;
/*!40000 ALTER TABLE `agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app` (
  `appid` bigint(20) NOT NULL AUTO_INCREMENT,
  `appname` varchar(255) NOT NULL DEFAULT '',
  `appparentid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
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
  `dcstatus` bigint(20) DEFAULT NULL,
  `dcarea` varchar(256) DEFAULT NULL,
  `dcprovince` varchar(256) DEFAULT NULL,
  `dccity` varchar(256) DEFAULT NULL,
  `dccounty` varchar(256) DEFAULT NULL,
  `dcaddress` varchar(256) DEFAULT NULL,
  `dcgeo` varchar(256) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `region_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter`
--

LOCK TABLES `datacenter` WRITE;
/*!40000 ALTER TABLE `datacenter` DISABLE KEYS */;
INSERT INTO `datacenter` VALUES (1,'test',0,'ÂçéÂçó','ÂÆâÂæΩ','ÂÆâÂ∫ÜÂ∏Ç','Â§™ÊπñÂéø','test','test','test',1,1,1),(2,'test',0,'ÂçéÂçó','ÂÆâÂæΩ','ÂÆâÂ∫ÜÂ∏Ç','Â§™ÊπñÂéø','test','test','test',2,2,1),(3,'test',0,'ÂçéÂçó','ÂÆâÂæΩ','ÂÆâÂ∫ÜÂ∏Ç','Â§™ÊπñÂéø','test','test','test',3,3,1),(4,'testaa',0,'ÂçéÂçó','ÂÆâÂæΩ','ÂÆâÂ∫ÜÂ∏Ç','Â§™ÊπñÂéø','test','test','test',4,4,1),(5,'testccc',0,'ÂçéÂåó','ÂÆâÂæΩ','ÂÆâÂ∫ÜÂ∏Ç','Â§™ÊπñÂéø','test','test','test',5,5,1),(6,'beijing',0,'ÂçéÂçó','ÂÆâÂæΩ','ÂÆâÂ∫ÜÂ∏Ç','Â§™ÊπñÂéø','test','test','test',6,6,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter_region`
--

LOCK TABLES `datacenter_region` WRITE;
/*!40000 ALTER TABLE `datacenter_region` DISABLE KEYS */;
INSERT INTO `datacenter_region` VALUES (1,'Âçé‰∏ú',0,'2016-05-30 15:39:55','han','han','2016-05-30 15:39:18'),(2,'ÂçéË•ø',0,'2016-05-30 15:47:22','han','han','2016-05-30 15:47:30'),(3,'ÂçéÂåó',0,'2016-05-30 15:47:48','han','han','2016-05-30 15:47:56'),(4,'ÂçéÂçó',0,'2016-05-30 15:48:12','han','han','2016-05-30 15:48:14'),(5,'Âçé‰∏≠',0,'2016-05-30 15:48:40','han','han','2016-05-30 15:48:48'),(6,'Êµ∑Â§ñ',0,'2016-05-30 15:49:10','han','han','2016-05-30 15:49:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter_state`
--

LOCK TABLES `datacenter_state` WRITE;
/*!40000 ALTER TABLE `datacenter_state` DISABLE KEYS */;
INSERT INTO `datacenter_state` VALUES (1,'‰ΩøÁî®‰∏≠',0,'2016-05-30 15:50:12','han','han','2016-05-30 15:50:24'),(2,'‰∏ãÁ∫ø',0,'2016-05-30 15:50:52','han','han','2016-05-30 15:50:59'),(3,'ÊïÖÈöú',0,'2016-05-30 15:51:35','han','han','2016-05-30 15:51:43');
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
  `cname_speedup` varchar(256) DEFAULT NULL,
  `created_on` varchar(256) DEFAULT NULL,
  `ext_status` varchar(256) DEFAULT NULL,
  `grade` varchar(256) DEFAULT NULL,
  `grade_title` varchar(256) DEFAULT NULL,
  `group_id` varchar(256) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `is_mark` varchar(256) DEFAULT NULL,
  `is_vip` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `owner` varchar(256) DEFAULT NULL,
  `punycode` varchar(256) DEFAULT NULL,
  `records` varchar(256) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `searchengine_push` varchar(256) DEFAULT NULL,
  `status` varchar(256) DEFAULT NULL,
  `ttl` varchar(256) DEFAULT NULL,
  `updated_on` varchar(256) DEFAULT NULL,
  `token_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspoddomain`
--

LOCK TABLES `dnspoddomain` WRITE;
/*!40000 ALTER TABLE `dnspoddomain` DISABLE KEYS */;
/*!40000 ALTER TABLE `dnspoddomain` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docmanage`
--

LOCK TABLES `docmanage` WRITE;
/*!40000 ALTER TABLE `docmanage` DISABLE KEYS */;
/*!40000 ALTER TABLE `docmanage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardware`
--

DROP TABLE IF EXISTS `hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware` (
  `hardwareid` bigint(20) NOT NULL AUTO_INCREMENT,
  `hardwaretypeid` bigint(20) NOT NULL DEFAULT '0',
  `status` bigint(20) DEFAULT NULL,
  `isonline` bigint(20) DEFAULT NULL,
  `hardwaresn` varchar(256) DEFAULT NULL,
  `hardwarename` varchar(255) DEFAULT NULL,
  `managerip` varchar(255) DEFAULT NULL,
  `rackid` bigint(20) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`hardwareid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware`
--

LOCK TABLES `hardware` WRITE;
/*!40000 ALTER TABLE `hardware` DISABLE KEYS */;
/*!40000 ALTER TABLE `hardware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardwaretype`
--

DROP TABLE IF EXISTS `hardwaretype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardwaretype` (
  `hardwaretypeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `hardwaretypename` varchar(255) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`hardwaretypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardwaretype`
--

LOCK TABLES `hardwaretype` WRITE;
/*!40000 ALTER TABLE `hardwaretype` DISABLE KEYS */;
/*!40000 ALTER TABLE `hardwaretype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `manufacturerid` bigint(20) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(255) DEFAULT NULL,
  `email` varchar(11) DEFAULT NULL,
  `telphone` varchar(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`manufacturerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
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
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'dashbord','‰ª™Ë°®Áõò',NULL,0,0,NULL,'admin',NULL,'2016-04-28 16:22:30'),(2,'resource_query','ËµÑÊ∫êÊü•ËØ¢',NULL,0,0,NULL,'admin',NULL,'2016-04-28 16:23:02'),(3,'resource_change','ËµÑÊ∫êÂèòÊõ¥',NULL,0,0,NULL,'admin',NULL,'2016-04-28 16:23:48'),(4,'resource_manage','Á≥ªÁªüÁÆ°ÁêÜ',NULL,0,0,NULL,'admin',NULL,'2016-04-28 16:24:29'),(5,'selectdatacenter','Êü•ËØ¢Êï∞ÊçÆ‰∏≠ÂøÉ','/selectdatacenter',2,0,NULL,'admin',NULL,'2016-04-28 16:32:55'),(6,'selectroom','Êü•ËØ¢Êú∫Êàø','/selectroom',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(7,'selectrack','Êü•ËØ¢Êú∫Êüú','/selectrack',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(8,'selectbandwidth','Êü•ËØ¢Â∏¶ÂÆΩ','/selectbandwidth',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(9,'selecthardware','Êü•ËØ¢Á°¨‰ª∂','/selecthardware',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(10,'selectserver','Êü•ËØ¢ÊúçÂä°Âô®','/selectserver',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(11,'selectip','Êü•ËØ¢IP','/selectip',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(12,'selectdomain','Êü•ËØ¢ÂüüÂêç','/selectdomain',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(13,'selectsupplier','Êü•ËØ¢‰æõÂ∫îÂïÜ','/selectsupplier',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(14,'selectdoc','Êü•ËØ¢ÂêàÂêå','/selectdoc',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(15,'selectapp','Êü•ËØ¢‰∏öÂä°Ê®°Âùó','/selectapp',2,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(16,'selectstatistical','Êü•ËØ¢ÁªüËÆ°ÂàÜÊûê','/selectstatistical',2,1,NULL,'admin',NULL,'2016-04-28 16:33:54'),(17,'selectresources','Êü•ËØ¢ËµÑÊ∫êÂØºÂÖ•','/selectresources',2,1,NULL,'admin',NULL,'2016-04-28 16:33:54'),(18,'selectchange','Êü•ËØ¢ÂèòÊõ¥ÁÆ°ÁêÜ','/selectchange',2,1,NULL,'admin',NULL,'2016-04-28 16:33:54'),(19,'managedatacenter','ÁÆ°ÁêÜÊï∞ÊçÆ‰∏≠ÂøÉ','/managedatacenter',3,0,NULL,'admin',NULL,'2016-04-28 16:32:55'),(20,'manageroom','ÁÆ°ÁêÜÊú∫Êàø','/manageroom',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(21,'managerack','ÁÆ°ÁêÜÊú∫Êüú','/managerack',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(22,'managebandwidth','ÁÆ°ÁêÜÂ∏¶ÂÆΩ','/managebandwidth',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(23,'managehardware','ÁÆ°ÁêÜÁ°¨‰ª∂','/managehardware',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(24,'manageserver','ÁÆ°ÁêÜÊúçÂä°Âô®','/manageserver',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(25,'manageip','ÁÆ°ÁêÜIP','/manageip',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(26,'managedomain','ÁÆ°ÁêÜÂüüÂêç','/managedomain',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(27,'managesupplier','ÁÆ°ÁêÜ‰æõÂ∫îÂïÜ','/managesupplier',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(28,'managedoc','ÁÆ°ÁêÜÂêàÂêå','/managedoc',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(29,'manageapp','ÁÆ°ÁêÜ‰∏öÂä°Ê®°Âùó','/manageapp',3,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(30,'managestatistical','ÁÆ°ÁêÜÁªüËÆ°ÂàÜÊûê','/managestatistical',3,1,NULL,'admin',NULL,'2016-04-28 16:33:54'),(31,'manageresources','ÁÆ°ÁêÜËµÑÊ∫êÂØºÂÖ•','/manageresources',3,1,NULL,'admin',NULL,'2016-04-28 16:33:54'),(32,'managechange','ÁÆ°ÁêÜÂèòÊõ¥ÁÆ°ÁêÜ','/managechange',3,1,NULL,'admin',NULL,'2016-04-28 16:33:54'),(33,'manageuser','Áî®Êà∑ÁÆ°ÁêÜ','/manageuser',4,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(34,'configsystem','Á≥ªÁªüÈÖçÁΩÆ','/configsystem',4,0,NULL,'admin',NULL,'2016-04-28 16:33:54'),(35,'dashbord','‰ª™Ë°®Áõò',NULL,0,0,NULL,'admin',NULL,'2016-04-28 16:22:30');
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
-- Table structure for table `networkbandwidth`
--

DROP TABLE IF EXISTS `networkbandwidth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkbandwidth` (
  `networkbandwidthid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `linkstatus` bigint(20) DEFAULT NULL,
  `isptype` varchar(64) DEFAULT NULL,
  `bandwidth` double DEFAULT NULL,
  `lowbandwidth` double DEFAULT NULL,
  `lowcase` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `supplierid` bigint(20) DEFAULT NULL,
  `dcid` bigint(20) DEFAULT NULL,
  `roomno` bigint(20) DEFAULT NULL,
  `rackid` bigint(20) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`networkbandwidthid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkbandwidth`
--

LOCK TABLES `networkbandwidth` WRITE;
/*!40000 ALTER TABLE `networkbandwidth` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkbandwidth` ENABLE KEYS */;
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
  `type` int(11) DEFAULT NULL,
  `vlan` int(11) DEFAULT NULL,
  `appid` bigint(20) DEFAULT NULL,
  `hostid` bigint(20) DEFAULT NULL,
  `roomid` bigint(20) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`networkipid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkip`
--

LOCK TABLES `networkip` WRITE;
/*!40000 ALTER TABLE `networkip` DISABLE KEYS */;
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
-- Table structure for table `rack`
--

DROP TABLE IF EXISTS `rack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rack` (
  `rackid` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `rackname` varchar(255) DEFAULT NULL,
  `standarduno` bigint(20) DEFAULT NULL,
  `availabletopnotno` bigint(20) DEFAULT NULL,
  `avaliablebottomnotno` bigint(20) DEFAULT NULL,
  `avaliableuno` bigint(20) DEFAULT NULL,
  `taryno` bigint(20) DEFAULT NULL,
  `racknetflow` double DEFAULT NULL,
  `isups` int(11) DEFAULT NULL,
  `isab` int(11) DEFAULT NULL,
  `power` bigint(20) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`rackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack`
--

LOCK TABLES `rack` WRITE;
/*!40000 ALTER TABLE `rack` DISABLE KEYS */;
/*!40000 ALTER TABLE `rack` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
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
  `status` bigint(20) DEFAULT NULL,
  `floor` varchar(256) DEFAULT NULL,
  `roomno` varchar(256) DEFAULT NULL,
  `dcid` bigint(20) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `serverid` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` bigint(20) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(256) NOT NULL DEFAULT '',
  `supplierid` bigint(20) DEFAULT NULL,
  `modle` varchar(256) NOT NULL DEFAULT '',
  `cpu` varchar(256) NOT NULL DEFAULT '',
  `memory` varchar(256) NOT NULL DEFAULT '',
  `harddisk` varchar(256) NOT NULL DEFAULT '',
  `networkcard` varchar(256) NOT NULL DEFAULT '',
  `hostname` varchar(256) NOT NULL DEFAULT '',
  `rackuid` bigint(20) NOT NULL DEFAULT '0',
  `rackid` bigint(20) NOT NULL DEFAULT '0',
  `appid` bigint(20) NOT NULL DEFAULT '0',
  `ishypervisor` bigint(20) NOT NULL DEFAULT '0',
  `isServer` bigint(20) NOT NULL DEFAULT '0',
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`serverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
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
INSERT INTO `session` VALUES ('12653bc7fb8145859c099fa073dfaed9','ˇÅˇÇ\0\0\0ˇ√ˇÇ\0string\n\0userinfo*models.UserAccountˇÉUserAccountˇÑ\0\nUserid\0Name\0	LoginName\0Email\0ContactPhone\0Password\0Salt\0RegisterTimeˇÜ\0\nUpdateTimeˇÜ\0Roleˇé\0\0\0ˇÖTimeˇÜ\0\0\0ˇç[]*models.Roleˇé\0ˇà\0\01ˇáˇà\0Id\0Name\0Userˇä\0Rightˇí\0\0\0$ˇâ[]*models.UserAccountˇä\0ˇÑ\0\0ˇë[]*models.Rightˇí\0ˇå\0\05ˇãˇå\0Id\0	RightType\0Roleˇé\0Menuˇî\0\0\0ˇì[]*models.Menuˇî\0ˇê\0\0ˇïˇèˇê\0MenuId\0Name\0DisplayName\0Url\0ParentId\0Enable\0\nCreateTimeˇÜ\0CreateBy\0UpdateBy\0\nUpdateTimeˇÜ\0Rightˇí\0\0\0lˇÑioneoaasadmin 23d68a0f00ed8614d4e836f20ce018ddxwQQoxl6n7`!@.[#\0\0\0Œ›–f\0\0\0\0‡\0\0\0Œ›–f\0\0\0\0‡\0',1464601008),('1ac2b743aff38e58ec3edf5ac99f9e52','ˇÅˇÇ\0\0\0ˇ√ˇÇ\0string\n\0userinfo*models.UserAccountˇÉUserAccountˇÑ\0\nUserid\0Name\0	LoginName\0Email\0ContactPhone\0Password\0Salt\0RegisterTimeˇÜ\0\nUpdateTimeˇÜ\0Roleˇé\0\0\0ˇÖTimeˇÜ\0\0\0ˇç[]*models.Roleˇé\0ˇà\0\01ˇáˇà\0Id\0Name\0Userˇä\0Rightˇí\0\0\0$ˇâ[]*models.UserAccountˇä\0ˇÑ\0\0ˇë[]*models.Rightˇí\0ˇå\0\05ˇãˇå\0Id\0	RightType\0Roleˇé\0Menuˇî\0\0\0ˇì[]*models.Menuˇî\0ˇê\0\0ˇïˇèˇê\0MenuId\0Name\0DisplayName\0Url\0ParentId\0Enable\0\nCreateTimeˇÜ\0CreateBy\0UpdateBy\0\nUpdateTimeˇÜ\0Rightˇí\0\0\0lˇÑioneoaasadmin 23d68a0f00ed8614d4e836f20ce018ddxwQQoxl6n7`!@.[#\0\0\0Œ›–f\0\0\0\0‡\0\0\0Œ›–f\0\0\0\0‡\0',1464600901),('a3902a863c1f11f8a72b85ae13197c24','ˇÅˇÇ\0\0\0ˇ√ˇÇ\0string\n\0userinfo*models.UserAccountˇÉUserAccountˇÑ\0\nUserid\0Name\0	LoginName\0Email\0ContactPhone\0Password\0Salt\0RegisterTimeˇÜ\0\nUpdateTimeˇÜ\0Roleˇé\0\0\0ˇÖTimeˇÜ\0\0\0ˇç[]*models.Roleˇé\0ˇà\0\01ˇáˇà\0Id\0Name\0Userˇä\0Rightˇí\0\0\0$ˇâ[]*models.UserAccountˇä\0ˇÑ\0\0ˇë[]*models.Rightˇí\0ˇå\0\05ˇãˇå\0Id\0	RightType\0Roleˇé\0Menuˇî\0\0\0ˇì[]*models.Menuˇî\0ˇê\0\0ˇïˇèˇê\0MenuId\0Name\0DisplayName\0Url\0ParentId\0Enable\0\nCreateTimeˇÜ\0CreateBy\0UpdateBy\0\nUpdateTimeˇÜ\0Rightˇí\0\0\0lˇÑioneoaasadmin 23d68a0f00ed8614d4e836f20ce018ddxwQQoxl6n7`!@.[#\0\0\0Œ›–f\0\0\0\0‡\0\0\0Œ›–f\0\0\0\0‡\0',1464602039),('cb7c00244f24cfe97b17b0b9fde9d705','ˇÅˇÇ\0\0\0ˇ√ˇÇ\0string\n\0userinfo*models.UserAccountˇÉUserAccountˇÑ\0\nUserid\0Name\0	LoginName\0Email\0ContactPhone\0Password\0Salt\0RegisterTimeˇÜ\0\nUpdateTimeˇÜ\0Roleˇé\0\0\0ˇÖTimeˇÜ\0\0\0ˇç[]*models.Roleˇé\0ˇà\0\01ˇáˇà\0Id\0Name\0Userˇä\0Rightˇí\0\0\0$ˇâ[]*models.UserAccountˇä\0ˇÑ\0\0ˇë[]*models.Rightˇí\0ˇå\0\05ˇãˇå\0Id\0	RightType\0Roleˇé\0Menuˇî\0\0\0ˇì[]*models.Menuˇî\0ˇê\0\0ˇïˇèˇê\0MenuId\0Name\0DisplayName\0Url\0ParentId\0Enable\0\nCreateTimeˇÜ\0CreateBy\0UpdateBy\0\nUpdateTimeˇÜ\0Rightˇí\0\0\0lˇÑioneoaasadmin 23d68a0f00ed8614d4e836f20ce018ddxwQQoxl6n7`!@.[#\0\0\0Œ›–f\0\0\0\0‡\0\0\0Œ›–f\0\0\0\0‡\0',1464601513);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'IBM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `tokenid` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `token` varchar(60) DEFAULT NULL,
  `isdelete` int(11) DEFAULT NULL,
  `expiretime` datetime NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`tokenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
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
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact_phone` (`contact_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'oneoaas','admin','','','23d68a0f00ed8614d4e836f20ce018dd','xwQQoxl6n7`!@.[#','2016-05-30 14:10:46','2016-05-30 14:10:46');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-30 18:15:54
