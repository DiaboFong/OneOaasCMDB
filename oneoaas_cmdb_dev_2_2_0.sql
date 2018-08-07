-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 10.0.2.47    Database: oneoaas_cmdb_dev_2_2_0
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
  `access_key_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `access_key_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `access_key_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_key`
--

LOCK TABLES `access_key` WRITE;
/*!40000 ALTER TABLE `access_key` DISABLE KEYS */;
INSERT INTO `access_key` VALUES (1,1,'e2c4cd593eb7af176cf26ce3db8eefac','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDkzNTIxNTk2LCJpYXQiOjE0OTA5Mjk1OTYsInR5cGUiOiJzZWxmIiwidXNlcm5hbWUiOiJhZG1pbiJ9.9Vp_O0Nerlgo4gq3q0PW7gj2ziFW2H1uG_e3pUWaSX8',1,0,1493521596,'2017-03-31 11:06:37','system auto generate','frontend','self');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreement_state`
--

LOCK TABLES `agreement_state` WRITE;
/*!40000 ALTER TABLE `agreement_state` DISABLE KEYS */;
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
  `app_code` varchar(255) DEFAULT NULL,
  `app_own` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_level`
--

LOCK TABLES `app_level` WRITE;
/*!40000 ALTER TABLE `app_level` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asserts`
--

LOCK TABLES `asserts` WRITE;
/*!40000 ALTER TABLE `asserts` DISABLE KEYS */;
INSERT INTO `asserts` VALUES (1,'datacenter','数据中心资源',0,0,0,0,'2017-03-29 10:03:03',NULL,NULL,'2017-03-29 10:03:03','icon-dc'),(2,'ipam','IPAM资源',0,0,0,0,'2017-03-29 10:03:03',NULL,NULL,'2017-03-29 10:03:03','icon-ip'),(3,'business','业务资源',0,0,0,0,'2017-03-29 10:03:03',NULL,NULL,'2017-03-29 10:03:03','icon-bs-rs'),(4,'virtualization','虚拟化资源',0,0,0,0,'2017-03-29 10:03:03',NULL,NULL,'2017-03-29 10:03:03','icon-vcenter'),(5,'cloud','云资源',0,0,0,0,'2017-03-29 10:03:03',NULL,NULL,'2017-03-29 10:03:03','icon-cloud'),(6,'supplier','供应商资源',0,0,0,0,'2017-03-29 10:03:03',NULL,NULL,'2017-03-29 10:03:03','icon-supplier');
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
  `number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asserts_instance`
--

LOCK TABLES `asserts_instance` WRITE;
/*!40000 ALTER TABLE `asserts_instance` DISABLE KEYS */;
INSERT INTO `asserts_instance` VALUES (1,'datacenter','数据中心',1,0,1,1,1,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-dc',0),(2,'room','机房',1,0,1,1,1,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-room',0),(3,'rack','机柜',1,0,1,1,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-rack',0),(4,'bandwidth','带宽',1,0,1,1,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-bandwidth',0),(5,'hardware','硬件',1,0,1,1,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-hardware',0),(6,'server','服务器',1,0,1,1,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-server',1),(7,'ip','IP',1,0,1,2,0,'2017-02-20 18:20:44','','admin','2017-02-20 18:20:44','icon-index-ip',5),(8,'domain','域名',1,0,1,2,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-domain',0),(9,'app','业务模块',1,0,1,3,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-app',0),(10,'vcenter','Vcenter',1,0,1,4,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-vcenter',39),(11,'aliyun','阿里云',1,0,1,5,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-aliyun',0),(12,'aws','AWS',1,0,1,5,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-aws',0),(13,'supplier','供应商',1,0,1,6,0,'2017-04-07 18:16:29','','admin','2017-04-07 18:16:29','icon-index-supplier',0),(14,'agreement','合同',1,0,1,100,0,'2017-04-07 18:16:30','','admin','2017-04-07 18:16:30','icon-supplier',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
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
  `server_id` bigint(20) DEFAULT NULL,
  `cpu` int(11) DEFAULT NULL,
  `vendor_id` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `stepping` int(11) DEFAULT NULL,
  `physical_id` varchar(255) DEFAULT NULL,
  `core_id` varchar(255) DEFAULT NULL,
  `cores` int(11) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `mhz` double DEFAULT NULL,
  `cache_size` int(11) DEFAULT NULL,
  `flags` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

LOCK TABLES `cpu` WRITE;
/*!40000 ALTER TABLE `cpu` DISABLE KEYS */;
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
  `dcname` varchar(255) NOT NULL DEFAULT '',
  `dcprovince` varchar(255) DEFAULT NULL,
  `dccity` varchar(255) DEFAULT NULL,
  `dccounty` varchar(255) DEFAULT NULL,
  `dcaddress` varchar(255) DEFAULT NULL,
  `dcgeo` varchar(255) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `region_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter`
--

LOCK TABLES `datacenter` WRITE;
/*!40000 ALTER TABLE `datacenter` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter_region`
--

LOCK TABLES `datacenter_region` WRITE;
/*!40000 ALTER TABLE `datacenter_region` DISABLE KEYS */;
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
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter_state`
--

LOCK TABLES `datacenter_state` WRITE;
/*!40000 ALTER TABLE `datacenter_state` DISABLE KEYS */;
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
-- Table structure for table `device_performance_report`
--

DROP TABLE IF EXISTS `device_performance_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_performance_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device` varchar(128) NOT NULL DEFAULT '',
  `cpu` bigint(20) NOT NULL DEFAULT '0',
  `memory` bigint(20) NOT NULL DEFAULT '0',
  `disk_usage` double NOT NULL DEFAULT '0',
  `nic_usage` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_performance_report`
--

LOCK TABLES `device_performance_report` WRITE;
/*!40000 ALTER TABLE `device_performance_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_performance_report` ENABLE KEYS */;
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
  `grade_id` bigint(20) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspoddomain_grade`
--

LOCK TABLES `dnspoddomain_grade` WRITE;
/*!40000 ALTER TABLE `dnspoddomain_grade` DISABLE KEYS */;
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
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspoddomain_state`
--

LOCK TABLES `dnspoddomain_state` WRITE;
/*!40000 ALTER TABLE `dnspoddomain_state` DISABLE KEYS */;
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
  `server_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harddisk`
--

LOCK TABLES `harddisk` WRITE;
/*!40000 ALTER TABLE `harddisk` DISABLE KEYS */;
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
  `rack_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `manage_ip` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
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
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware_state`
--

LOCK TABLES `hardware_state` WRITE;
/*!40000 ALTER TABLE `hardware_state` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware_type`
--

LOCK TABLES `hardware_type` WRITE;
/*!40000 ALTER TABLE `hardware_type` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,'esxi5.5',0,'2017-04-01 12:33:41','','','2017-04-01 12:33:41');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internet_service_provider`
--

LOCK TABLES `internet_service_provider` WRITE;
/*!40000 ALTER TABLE `internet_service_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `internet_service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_address`
--

DROP TABLE IF EXISTS `ip_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(20) DEFAULT NULL,
  `is_gateway` int(1) DEFAULT NULL,
  `dns_name` varchar(128) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `owner` varchar(128) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `allow_modify` int(11) DEFAULT NULL,
  `device_type` varchar(128) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `ip_subnet` bigint(20) DEFAULT NULL,
  `host_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `hostname_prefix` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1271 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_address`
--

LOCK TABLES `ip_address` WRITE;
/*!40000 ALTER TABLE `ip_address` DISABLE KEYS */;
INSERT INTO `ip_address` VALUES (1,'10.2.2.1',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:36','','','2017-03-31 18:39:36','',NULL),(2,'10.2.2.2',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:36','','','2017-03-31 18:39:36','',NULL),(3,'10.2.2.3',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:36','','','2017-03-31 18:39:36','',NULL),(4,'10.2.2.4',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:36','','','2017-03-31 18:39:36','',NULL),(5,'10.2.2.5',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:36','','','2017-03-31 18:39:36','',NULL),(6,'10.2.2.6',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:36','','','2017-03-31 18:39:36','',NULL),(7,'10.2.2.7',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:36','','','2017-03-31 18:39:36','',NULL),(8,'10.2.2.8',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(9,'10.2.2.9',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(10,'10.2.2.10',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(11,'10.2.2.11',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(12,'10.2.2.12',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(13,'10.2.2.13',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(14,'10.2.2.14',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(15,'10.2.2.15',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(16,'10.2.2.16',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(17,'10.2.2.17',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(18,'10.2.2.18',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(19,'10.2.2.19',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(20,'10.2.2.20',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(21,'10.2.2.21',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(22,'10.2.2.22',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(23,'10.2.2.23',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(24,'10.2.2.24',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(25,'10.2.2.25',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(26,'10.2.2.26',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(27,'10.2.2.27',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(28,'10.2.2.28',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(29,'10.2.2.29',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(30,'10.2.2.30',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(31,'10.2.2.31',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(32,'10.2.2.32',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(33,'10.2.2.33',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(34,'10.2.2.34',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(35,'10.2.2.35',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(36,'10.2.2.36',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(37,'10.2.2.37',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(38,'10.2.2.38',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(39,'10.2.2.39',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:37','','','2017-03-31 18:39:37','',NULL),(40,'10.2.2.40',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(41,'10.2.2.41',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(42,'10.2.2.42',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(43,'10.2.2.43',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(44,'10.2.2.44',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(45,'10.2.2.45',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(46,'10.2.2.46',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(47,'10.2.2.47',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(48,'10.2.2.48',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(49,'10.2.2.49',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(50,'10.2.2.50',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(51,'10.2.2.51',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(52,'10.2.2.52',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(53,'10.2.2.53',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(54,'10.2.2.54',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(55,'10.2.2.55',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(56,'10.2.2.56',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(57,'10.2.2.57',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(58,'10.2.2.58',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(59,'10.2.2.59',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(60,'10.2.2.60',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(61,'10.2.2.61',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(62,'10.2.2.62',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:38','','','2017-03-31 18:39:38','',NULL),(63,'10.2.2.63',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(64,'10.2.2.64',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(65,'10.2.2.65',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(66,'10.2.2.66',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(67,'10.2.2.67',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(68,'10.2.2.68',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(69,'10.2.2.69',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(70,'10.2.2.70',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(71,'10.2.2.71',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(72,'10.2.2.72',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(73,'10.2.2.73',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(74,'10.2.2.74',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(75,'10.2.2.75',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(76,'10.2.2.76',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(77,'10.2.2.77',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(78,'10.2.2.78',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(79,'10.2.2.79',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(80,'10.2.2.80',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(81,'10.2.2.81',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(82,'10.2.2.82',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(83,'10.2.2.83',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(84,'10.2.2.84',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(85,'10.2.2.85',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(86,'10.2.2.86',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(87,'10.2.2.87',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:39','','','2017-03-31 18:39:39','',NULL),(88,'10.2.2.88',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(89,'10.2.2.89',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(90,'10.2.2.90',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(91,'10.2.2.91',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(92,'10.2.2.92',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(93,'10.2.2.93',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(94,'10.2.2.94',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(95,'10.2.2.95',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(96,'10.2.2.96',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(97,'10.2.2.97',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(98,'10.2.2.98',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(99,'10.2.2.99',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(100,'10.2.2.100',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(101,'10.2.2.101',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(102,'10.2.2.102',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(103,'10.2.2.103',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(104,'10.2.2.104',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(105,'10.2.2.105',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(106,'10.2.2.106',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:40','','','2017-03-31 18:39:40','',NULL),(107,'10.2.2.107',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(108,'10.2.2.108',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(109,'10.2.2.109',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(110,'10.2.2.110',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(111,'10.2.2.111',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(112,'10.2.2.112',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(113,'10.2.2.113',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(114,'10.2.2.114',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(115,'10.2.2.115',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(116,'10.2.2.116',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(117,'10.2.2.117',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(118,'10.2.2.118',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(119,'10.2.2.119',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(120,'10.2.2.120',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(121,'10.2.2.121',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(122,'10.2.2.122',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(123,'10.2.2.123',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(124,'10.2.2.124',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(125,'10.2.2.125',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(126,'10.2.2.126',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(127,'10.2.2.127',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(128,'10.2.2.128',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(129,'10.2.2.129',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(130,'10.2.2.130',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(131,'10.2.2.131',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(132,'10.2.2.132',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(133,'10.2.2.133',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:41','','','2017-03-31 18:39:41','',NULL),(134,'10.2.2.134',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(135,'10.2.2.135',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(136,'10.2.2.136',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(137,'10.2.2.137',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(138,'10.2.2.138',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(139,'10.2.2.139',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(140,'10.2.2.140',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(141,'10.2.2.141',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(142,'10.2.2.142',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(143,'10.2.2.143',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(144,'10.2.2.144',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(145,'10.2.2.145',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(146,'10.2.2.146',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(147,'10.2.2.147',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(148,'10.2.2.148',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(149,'10.2.2.149',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(150,'10.2.2.150',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(151,'10.2.2.151',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(152,'10.2.2.152',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(153,'10.2.2.153',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(154,'10.2.2.154',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(155,'10.2.2.155',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(156,'10.2.2.156',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(157,'10.2.2.157',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(158,'10.2.2.158',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:42','','','2017-03-31 18:39:42','',NULL),(159,'10.2.2.159',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(160,'10.2.2.160',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(161,'10.2.2.161',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(162,'10.2.2.162',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(163,'10.2.2.163',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(164,'10.2.2.164',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(165,'10.2.2.165',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(166,'10.2.2.166',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(167,'10.2.2.167',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(168,'10.2.2.168',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(169,'10.2.2.169',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(170,'10.2.2.170',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(171,'10.2.2.171',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(172,'10.2.2.172',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(173,'10.2.2.173',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(174,'10.2.2.174',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(175,'10.2.2.175',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(176,'10.2.2.176',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(177,'10.2.2.177',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:43','','','2017-03-31 18:39:43','',NULL),(178,'10.2.2.178',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(179,'10.2.2.179',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(180,'10.2.2.180',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(181,'10.2.2.181',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(182,'10.2.2.182',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(183,'10.2.2.183',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(184,'10.2.2.184',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(185,'10.2.2.185',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(186,'10.2.2.186',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(187,'10.2.2.187',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(188,'10.2.2.188',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(189,'10.2.2.189',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(190,'10.2.2.190',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(191,'10.2.2.191',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(192,'10.2.2.192',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(193,'10.2.2.193',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(194,'10.2.2.194',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(195,'10.2.2.195',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(196,'10.2.2.196',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(197,'10.2.2.197',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(198,'10.2.2.198',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(199,'10.2.2.199',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(200,'10.2.2.200',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(201,'10.2.2.201',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(202,'10.2.2.202',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(203,'10.2.2.203',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(204,'10.2.2.204',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(205,'10.2.2.205',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:44','','','2017-03-31 18:39:44','',NULL),(206,'10.2.2.206',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(207,'10.2.2.207',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(208,'10.2.2.208',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(209,'10.2.2.209',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(210,'10.2.2.210',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(211,'10.2.2.211',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(212,'10.2.2.212',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(213,'10.2.2.213',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(214,'10.2.2.214',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(215,'10.2.2.215',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(216,'10.2.2.216',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(217,'10.2.2.217',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(218,'10.2.2.218',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(219,'10.2.2.219',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(220,'10.2.2.220',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(221,'10.2.2.221',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(222,'10.2.2.222',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(223,'10.2.2.223',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(224,'10.2.2.224',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(225,'10.2.2.225',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(226,'10.2.2.226',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(227,'10.2.2.227',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(228,'10.2.2.228',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:45','','','2017-03-31 18:39:45','',NULL),(229,'10.2.2.229',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(230,'10.2.2.230',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(231,'10.2.2.231',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(232,'10.2.2.232',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(233,'10.2.2.233',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(234,'10.2.2.234',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(235,'10.2.2.235',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(236,'10.2.2.236',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(237,'10.2.2.237',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(238,'10.2.2.238',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(239,'10.2.2.239',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(240,'10.2.2.240',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(241,'10.2.2.241',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(242,'10.2.2.242',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(243,'10.2.2.243',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(244,'10.2.2.244',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(245,'10.2.2.245',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(246,'10.2.2.246',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(247,'10.2.2.247',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(248,'10.2.2.248',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(249,'10.2.2.249',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(250,'10.2.2.250',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(251,'10.2.2.251',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:46','','','2017-03-31 18:39:46','',NULL),(252,'10.2.2.252',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:47','','','2017-03-31 18:39:47','',NULL),(253,'10.2.2.253',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:47','','','2017-03-31 18:39:47','',NULL),(254,'10.2.2.254',0,'',0,'','','',0,'','',NULL,1,NULL,NULL,1,'2017-03-31 18:39:47','','','2017-03-31 18:39:47','',NULL),(255,'10.2.3.1',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(256,'10.2.3.2',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(257,'10.2.3.3',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(258,'10.2.3.4',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(259,'10.2.3.5',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(260,'10.2.3.6',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(261,'10.2.3.7',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(262,'10.2.3.8',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(263,'10.2.3.9',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(264,'10.2.3.10',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(265,'10.2.3.11',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(266,'10.2.3.12',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(267,'10.2.3.13',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(268,'10.2.3.14',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01','',NULL),(269,'10.2.3.15',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(270,'10.2.3.16',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(271,'10.2.3.17',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(272,'10.2.3.18',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(273,'10.2.3.19',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(274,'10.2.3.20',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(275,'10.2.3.21',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(276,'10.2.3.22',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(277,'10.2.3.23',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(278,'10.2.3.24',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(279,'10.2.3.25',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(280,'10.2.3.26',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(281,'10.2.3.27',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(282,'10.2.3.28',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(283,'10.2.3.29',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(284,'10.2.3.30',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(285,'10.2.3.31',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(286,'10.2.3.32',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(287,'10.2.3.33',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:02','','','2017-03-31 18:40:02','',NULL),(288,'10.2.3.34',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(289,'10.2.3.35',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(290,'10.2.3.36',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(291,'10.2.3.37',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(292,'10.2.3.38',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(293,'10.2.3.39',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(294,'10.2.3.40',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(295,'10.2.3.41',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(296,'10.2.3.42',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(297,'10.2.3.43',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(298,'10.2.3.44',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(299,'10.2.3.45',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(300,'10.2.3.46',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(301,'10.2.3.47',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(302,'10.2.3.48',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(303,'10.2.3.49',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(304,'10.2.3.50',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(305,'10.2.3.51',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(306,'10.2.3.52',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(307,'10.2.3.53',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(308,'10.2.3.54',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(309,'10.2.3.55',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(310,'10.2.3.56',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(311,'10.2.3.57',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(312,'10.2.3.58',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:03','','','2017-03-31 18:40:03','',NULL),(313,'10.2.3.59',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(314,'10.2.3.60',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(315,'10.2.3.61',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(316,'10.2.3.62',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(317,'10.2.3.63',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(318,'10.2.3.64',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(319,'10.2.3.65',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(320,'10.2.3.66',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(321,'10.2.3.67',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(322,'10.2.3.68',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(323,'10.2.3.69',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(324,'10.2.3.70',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(325,'10.2.3.71',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(326,'10.2.3.72',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(327,'10.2.3.73',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(328,'10.2.3.74',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(329,'10.2.3.75',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(330,'10.2.3.76',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(331,'10.2.3.77',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(332,'10.2.3.78',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(333,'10.2.3.79',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(334,'10.2.3.80',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(335,'10.2.3.81',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:04','','','2017-03-31 18:40:04','',NULL),(336,'10.2.3.82',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(337,'10.2.3.83',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(338,'10.2.3.84',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(339,'10.2.3.85',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(340,'10.2.3.86',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(341,'10.2.3.87',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(342,'10.2.3.88',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(343,'10.2.3.89',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(344,'10.2.3.90',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(345,'10.2.3.91',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(346,'10.2.3.92',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(347,'10.2.3.93',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(348,'10.2.3.94',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:05','','','2017-03-31 18:40:05','',NULL),(349,'10.2.3.95',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(350,'10.2.3.96',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(351,'10.2.3.97',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(352,'10.2.3.98',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(353,'10.2.3.99',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(354,'10.2.3.100',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(355,'10.2.3.101',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(356,'10.2.3.102',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(357,'10.2.3.103',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(358,'10.2.3.104',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(359,'10.2.3.105',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(360,'10.2.3.106',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(361,'10.2.3.107',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(362,'10.2.3.108',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:06','','','2017-03-31 18:40:06','',NULL),(363,'10.2.3.109',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(364,'10.2.3.110',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(365,'10.2.3.111',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(366,'10.2.3.112',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(367,'10.2.3.113',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(368,'10.2.3.114',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(369,'10.2.3.115',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(370,'10.2.3.116',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(371,'10.2.3.117',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(372,'10.2.3.118',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(373,'10.2.3.119',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(374,'10.2.3.120',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(375,'10.2.3.121',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(376,'10.2.3.122',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:07','','','2017-03-31 18:40:07','',NULL),(377,'10.2.3.123',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:08','','','2017-03-31 18:40:08','',NULL),(378,'10.2.3.124',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:08','','','2017-03-31 18:40:08','',NULL),(379,'10.2.3.125',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:08','','','2017-03-31 18:40:08','',NULL),(380,'10.2.3.126',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:08','','','2017-03-31 18:40:08','',NULL),(381,'10.2.3.127',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:08','','','2017-03-31 18:40:08','',NULL),(382,'10.2.3.128',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:08','','','2017-03-31 18:40:08','',NULL),(383,'10.2.3.129',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:08','','','2017-03-31 18:40:08','',NULL),(384,'10.2.3.130',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:08','','','2017-03-31 18:40:08','',NULL),(385,'10.2.3.131',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:08','','','2017-03-31 18:40:08','',NULL),(386,'10.2.3.132',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(387,'10.2.3.133',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(388,'10.2.3.134',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(389,'10.2.3.135',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(390,'10.2.3.136',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(391,'10.2.3.137',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(392,'10.2.3.138',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(393,'10.2.3.139',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(394,'10.2.3.140',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(395,'10.2.3.141',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(396,'10.2.3.142',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(397,'10.2.3.143',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(398,'10.2.3.144',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(399,'10.2.3.145',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(400,'10.2.3.146',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(401,'10.2.3.147',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(402,'10.2.3.148',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(403,'10.2.3.149',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:09','','','2017-03-31 18:40:09','',NULL),(404,'10.2.3.150',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(405,'10.2.3.151',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(406,'10.2.3.152',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(407,'10.2.3.153',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(408,'10.2.3.154',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(409,'10.2.3.155',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(410,'10.2.3.156',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(411,'10.2.3.157',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(412,'10.2.3.158',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(413,'10.2.3.159',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(414,'10.2.3.160',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(415,'10.2.3.161',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:10','','','2017-03-31 18:40:10','',NULL),(416,'10.2.3.162',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:11','','','2017-03-31 18:40:11','',NULL),(417,'10.2.3.163',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:11','','','2017-03-31 18:40:11','',NULL),(418,'10.2.3.164',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:11','','','2017-03-31 18:40:11','',NULL),(419,'10.2.3.165',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:11','','','2017-03-31 18:40:11','',NULL),(420,'10.2.3.166',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:11','','','2017-03-31 18:40:11','',NULL),(421,'10.2.3.167',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:11','','','2017-03-31 18:40:11','',NULL),(422,'10.2.3.168',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(423,'10.2.3.169',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(424,'10.2.3.170',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(425,'10.2.3.171',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(426,'10.2.3.172',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(427,'10.2.3.173',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(428,'10.2.3.174',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(429,'10.2.3.175',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(430,'10.2.3.176',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(431,'10.2.3.177',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(432,'10.2.3.178',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:12','','','2017-03-31 18:40:12','',NULL),(433,'10.2.3.179',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(434,'10.2.3.180',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(435,'10.2.3.181',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(436,'10.2.3.182',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(437,'10.2.3.183',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(438,'10.2.3.184',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(439,'10.2.3.185',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(440,'10.2.3.186',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(441,'10.2.3.187',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(442,'10.2.3.188',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(443,'10.2.3.189',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(444,'10.2.3.190',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(445,'10.2.3.191',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(446,'10.2.3.192',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(447,'10.2.3.193',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:13','','','2017-03-31 18:40:13','',NULL),(448,'10.2.3.194',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(449,'10.2.3.195',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(450,'10.2.3.196',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(451,'10.2.3.197',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(452,'10.2.3.198',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(453,'10.2.3.199',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(454,'10.2.3.200',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(455,'10.2.3.201',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(456,'10.2.3.202',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(457,'10.2.3.203',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(458,'10.2.3.204',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(459,'10.2.3.205',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(460,'10.2.3.206',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(461,'10.2.3.207',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(462,'10.2.3.208',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(463,'10.2.3.209',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(464,'10.2.3.210',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(465,'10.2.3.211',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(466,'10.2.3.212',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(467,'10.2.3.213',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(468,'10.2.3.214',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(469,'10.2.3.215',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(470,'10.2.3.216',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(471,'10.2.3.217',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(472,'10.2.3.218',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(473,'10.2.3.219',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(474,'10.2.3.220',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(475,'10.2.3.221',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:14','','','2017-03-31 18:40:14','',NULL),(476,'10.2.3.222',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(477,'10.2.3.223',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(478,'10.2.3.224',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(479,'10.2.3.225',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(480,'10.2.3.226',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(481,'10.2.3.227',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(482,'10.2.3.228',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(483,'10.2.3.229',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(484,'10.2.3.230',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(485,'10.2.3.231',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(486,'10.2.3.232',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(487,'10.2.3.233',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(488,'10.2.3.234',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(489,'10.2.3.235',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(490,'10.2.3.236',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(491,'10.2.3.237',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(492,'10.2.3.238',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(493,'10.2.3.239',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(494,'10.2.3.240',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(495,'10.2.3.241',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(496,'10.2.3.242',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:15','','','2017-03-31 18:40:15','',NULL),(497,'10.2.3.243',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(498,'10.2.3.244',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(499,'10.2.3.245',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(500,'10.2.3.246',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(501,'10.2.3.247',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(502,'10.2.3.248',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(503,'10.2.3.249',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(504,'10.2.3.250',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(505,'10.2.3.251',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(506,'10.2.3.252',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(507,'10.2.3.253',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(508,'10.2.3.254',0,'',0,'','','',0,'','',NULL,2,NULL,NULL,1,'2017-03-31 18:40:16','','','2017-03-31 18:40:16','',NULL),(509,'111.111.111.1',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(510,'111.111.111.2',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(511,'111.111.111.3',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(512,'111.111.111.4',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(513,'111.111.111.5',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(514,'111.111.111.6',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(515,'111.111.111.7',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(516,'111.111.111.8',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(517,'111.111.111.9',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(518,'111.111.111.10',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(519,'111.111.111.11',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(520,'111.111.111.12',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(521,'111.111.111.13',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(522,'111.111.111.14',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(523,'111.111.111.15',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15','',NULL),(524,'111.111.111.16',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(525,'111.111.111.17',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(526,'111.111.111.18',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(527,'111.111.111.19',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(528,'111.111.111.20',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(529,'111.111.111.21',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(530,'111.111.111.22',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(531,'111.111.111.23',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(532,'111.111.111.24',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(533,'111.111.111.25',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(534,'111.111.111.26',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(535,'111.111.111.27',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(536,'111.111.111.28',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(537,'111.111.111.29',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(538,'111.111.111.30',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(539,'111.111.111.31',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(540,'111.111.111.32',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(541,'111.111.111.33',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:16','','','2017-04-01 13:26:16','',NULL),(542,'111.111.111.34',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(543,'111.111.111.35',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(544,'111.111.111.36',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(545,'111.111.111.37',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(546,'111.111.111.38',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(547,'111.111.111.39',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(548,'111.111.111.40',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(549,'111.111.111.41',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(550,'111.111.111.42',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(551,'111.111.111.43',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(552,'111.111.111.44',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(553,'111.111.111.45',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(554,'111.111.111.46',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(555,'111.111.111.47',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(556,'111.111.111.48',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(557,'111.111.111.49',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(558,'111.111.111.50',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(559,'111.111.111.51',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(560,'111.111.111.52',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(561,'111.111.111.53',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(562,'111.111.111.54',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(563,'111.111.111.55',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:17','','','2017-04-01 13:26:17','',NULL),(564,'111.111.111.56',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(565,'111.111.111.57',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(566,'111.111.111.58',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(567,'111.111.111.59',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(568,'111.111.111.60',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(569,'111.111.111.61',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(570,'111.111.111.62',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(571,'111.111.111.63',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(572,'111.111.111.64',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(573,'111.111.111.65',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(574,'111.111.111.66',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(575,'111.111.111.67',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(576,'111.111.111.68',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(577,'111.111.111.69',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:18','','','2017-04-01 13:26:18','',NULL),(578,'111.111.111.70',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(579,'111.111.111.71',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(580,'111.111.111.72',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(581,'111.111.111.73',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(582,'111.111.111.74',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(583,'111.111.111.75',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(584,'111.111.111.76',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(585,'111.111.111.77',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(586,'111.111.111.78',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(587,'111.111.111.79',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(588,'111.111.111.80',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(589,'111.111.111.81',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(590,'111.111.111.82',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(591,'111.111.111.83',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(592,'111.111.111.84',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(593,'111.111.111.85',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(594,'111.111.111.86',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(595,'111.111.111.87',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(596,'111.111.111.88',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(597,'111.111.111.89',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(598,'111.111.111.90',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(599,'111.111.111.91',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(600,'111.111.111.92',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(601,'111.111.111.93',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:19','','','2017-04-01 13:26:19','',NULL),(602,'111.111.111.94',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(603,'111.111.111.95',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(604,'111.111.111.96',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(605,'111.111.111.97',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(606,'111.111.111.98',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(607,'111.111.111.99',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(608,'111.111.111.100',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(609,'111.111.111.101',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(610,'111.111.111.102',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(611,'111.111.111.103',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(612,'111.111.111.104',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(613,'111.111.111.105',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(614,'111.111.111.106',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(615,'111.111.111.107',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(616,'111.111.111.108',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(617,'111.111.111.109',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(618,'111.111.111.110',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(619,'111.111.111.111',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(620,'111.111.111.112',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(621,'111.111.111.113',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:20','','','2017-04-01 13:26:20','',NULL),(622,'111.111.111.114',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(623,'111.111.111.115',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(624,'111.111.111.116',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(625,'111.111.111.117',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(626,'111.111.111.118',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(627,'111.111.111.119',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(628,'111.111.111.120',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(629,'111.111.111.121',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(630,'111.111.111.122',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(631,'111.111.111.123',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(632,'111.111.111.124',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(633,'111.111.111.125',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(634,'111.111.111.126',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(635,'111.111.111.127',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(636,'111.111.111.128',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(637,'111.111.111.129',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(638,'111.111.111.130',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(639,'111.111.111.131',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(640,'111.111.111.132',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(641,'111.111.111.133',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:21','','','2017-04-01 13:26:21','',NULL),(642,'111.111.111.134',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(643,'111.111.111.135',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(644,'111.111.111.136',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(645,'111.111.111.137',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(646,'111.111.111.138',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(647,'111.111.111.139',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(648,'111.111.111.140',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(649,'111.111.111.141',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(650,'111.111.111.142',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(651,'111.111.111.143',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(652,'111.111.111.144',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(653,'111.111.111.145',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(654,'111.111.111.146',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(655,'111.111.111.147',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(656,'111.111.111.148',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(657,'111.111.111.149',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(658,'111.111.111.150',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(659,'111.111.111.151',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(660,'111.111.111.152',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(661,'111.111.111.153',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(662,'111.111.111.154',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:22','','','2017-04-01 13:26:22','',NULL),(663,'111.111.111.155',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(664,'111.111.111.156',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(665,'111.111.111.157',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(666,'111.111.111.158',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(667,'111.111.111.159',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(668,'111.111.111.160',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(669,'111.111.111.161',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(670,'111.111.111.162',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(671,'111.111.111.163',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(672,'111.111.111.164',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(673,'111.111.111.165',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(674,'111.111.111.166',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(675,'111.111.111.167',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(676,'111.111.111.168',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(677,'111.111.111.169',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(678,'111.111.111.170',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(679,'111.111.111.171',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(680,'111.111.111.172',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(681,'111.111.111.173',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(682,'111.111.111.174',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(683,'111.111.111.175',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(684,'111.111.111.176',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:23','','','2017-04-01 13:26:23','',NULL),(685,'111.111.111.177',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(686,'111.111.111.178',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(687,'111.111.111.179',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(688,'111.111.111.180',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(689,'111.111.111.181',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(690,'111.111.111.182',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(691,'111.111.111.183',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(692,'111.111.111.184',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(693,'111.111.111.185',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(694,'111.111.111.186',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(695,'111.111.111.187',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(696,'111.111.111.188',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(697,'111.111.111.189',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(698,'111.111.111.190',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(699,'111.111.111.191',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(700,'111.111.111.192',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(701,'111.111.111.193',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(702,'111.111.111.194',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(703,'111.111.111.195',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(704,'111.111.111.196',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:24','','','2017-04-01 13:26:24','',NULL),(705,'111.111.111.197',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(706,'111.111.111.198',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(707,'111.111.111.199',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(708,'111.111.111.200',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(709,'111.111.111.201',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(710,'111.111.111.202',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(711,'111.111.111.203',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(712,'111.111.111.204',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(713,'111.111.111.205',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(714,'111.111.111.206',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(715,'111.111.111.207',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(716,'111.111.111.208',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(717,'111.111.111.209',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(718,'111.111.111.210',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(719,'111.111.111.211',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(720,'111.111.111.212',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:25','','','2017-04-01 13:26:25','',NULL),(721,'111.111.111.213',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(722,'111.111.111.214',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(723,'111.111.111.215',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(724,'111.111.111.216',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(725,'111.111.111.217',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(726,'111.111.111.218',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(727,'111.111.111.219',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(728,'111.111.111.220',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(729,'111.111.111.221',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(730,'111.111.111.222',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(731,'111.111.111.223',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(732,'111.111.111.224',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(733,'111.111.111.225',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(734,'111.111.111.226',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(735,'111.111.111.227',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(736,'111.111.111.228',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(737,'111.111.111.229',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(738,'111.111.111.230',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(739,'111.111.111.231',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(740,'111.111.111.232',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(741,'111.111.111.233',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:26','','','2017-04-01 13:26:26','',NULL),(742,'111.111.111.234',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(743,'111.111.111.235',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(744,'111.111.111.236',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(745,'111.111.111.237',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(746,'111.111.111.238',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(747,'111.111.111.239',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(748,'111.111.111.240',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(749,'111.111.111.241',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(750,'111.111.111.242',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(751,'111.111.111.243',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(752,'111.111.111.244',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(753,'111.111.111.245',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(754,'111.111.111.246',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(755,'111.111.111.247',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(756,'111.111.111.248',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(757,'111.111.111.249',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(758,'111.111.111.250',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(759,'111.111.111.251',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(760,'111.111.111.252',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(761,'111.111.111.253',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(762,'111.111.111.254',0,'',0,'','','',0,'','',NULL,3,NULL,NULL,1,'2017-04-01 13:26:27','','','2017-04-01 13:26:27','',NULL),(763,'111.111.111.1',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:23','','','2017-04-01 13:38:23','',NULL),(764,'111.111.111.2',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:23','','','2017-04-01 13:38:23','',NULL),(765,'111.111.111.3',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(766,'111.111.111.4',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(767,'111.111.111.5',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(768,'111.111.111.6',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(769,'111.111.111.7',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(770,'111.111.111.8',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(771,'111.111.111.9',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(772,'111.111.111.10',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(773,'111.111.111.11',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(774,'111.111.111.12',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(775,'111.111.111.13',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(776,'111.111.111.14',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(777,'111.111.111.15',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(778,'111.111.111.16',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:24','','','2017-04-01 13:38:24','',NULL),(779,'111.111.111.17',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(780,'111.111.111.18',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(781,'111.111.111.19',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(782,'111.111.111.20',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(783,'111.111.111.21',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(784,'111.111.111.22',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(785,'111.111.111.23',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(786,'111.111.111.24',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(787,'111.111.111.25',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(788,'111.111.111.26',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(789,'111.111.111.27',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(790,'111.111.111.28',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(791,'111.111.111.29',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(792,'111.111.111.30',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(793,'111.111.111.31',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(794,'111.111.111.32',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(795,'111.111.111.33',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(796,'111.111.111.34',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(797,'111.111.111.35',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(798,'111.111.111.36',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(799,'111.111.111.37',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(800,'111.111.111.38',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(801,'111.111.111.39',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(802,'111.111.111.40',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:25','','','2017-04-01 13:38:25','',NULL),(803,'111.111.111.41',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(804,'111.111.111.42',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(805,'111.111.111.43',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(806,'111.111.111.44',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(807,'111.111.111.45',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(808,'111.111.111.46',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(809,'111.111.111.47',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(810,'111.111.111.48',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(811,'111.111.111.49',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(812,'111.111.111.50',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(813,'111.111.111.51',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(814,'111.111.111.52',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:26','','','2017-04-01 13:38:26','',NULL),(815,'111.111.111.53',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(816,'111.111.111.54',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(817,'111.111.111.55',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(818,'111.111.111.56',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(819,'111.111.111.57',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(820,'111.111.111.58',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(821,'111.111.111.59',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(822,'111.111.111.60',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(823,'111.111.111.61',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(824,'111.111.111.62',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(825,'111.111.111.63',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(826,'111.111.111.64',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(827,'111.111.111.65',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(828,'111.111.111.66',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(829,'111.111.111.67',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(830,'111.111.111.68',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(831,'111.111.111.69',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(832,'111.111.111.70',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:27','','','2017-04-01 13:38:27','',NULL),(833,'111.111.111.71',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(834,'111.111.111.72',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(835,'111.111.111.73',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(836,'111.111.111.74',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(837,'111.111.111.75',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(838,'111.111.111.76',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(839,'111.111.111.77',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(840,'111.111.111.78',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(841,'111.111.111.79',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(842,'111.111.111.80',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(843,'111.111.111.81',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(844,'111.111.111.82',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(845,'111.111.111.83',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(846,'111.111.111.84',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(847,'111.111.111.85',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(848,'111.111.111.86',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:28','','','2017-04-01 13:38:28','',NULL),(849,'111.111.111.87',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(850,'111.111.111.88',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(851,'111.111.111.89',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(852,'111.111.111.90',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(853,'111.111.111.91',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(854,'111.111.111.92',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(855,'111.111.111.93',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(856,'111.111.111.94',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(857,'111.111.111.95',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(858,'111.111.111.96',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(859,'111.111.111.97',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(860,'111.111.111.98',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(861,'111.111.111.99',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(862,'111.111.111.100',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(863,'111.111.111.101',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(864,'111.111.111.102',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(865,'111.111.111.103',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(866,'111.111.111.104',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(867,'111.111.111.105',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(868,'111.111.111.106',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(869,'111.111.111.107',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(870,'111.111.111.108',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(871,'111.111.111.109',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(872,'111.111.111.110',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:29','','','2017-04-01 13:38:29','',NULL),(873,'111.111.111.111',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(874,'111.111.111.112',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(875,'111.111.111.113',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(876,'111.111.111.114',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(877,'111.111.111.115',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(878,'111.111.111.116',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(879,'111.111.111.117',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(880,'111.111.111.118',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(881,'111.111.111.119',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(882,'111.111.111.120',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(883,'111.111.111.121',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(884,'111.111.111.122',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(885,'111.111.111.123',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(886,'111.111.111.124',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(887,'111.111.111.125',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(888,'111.111.111.126',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(889,'111.111.111.127',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(890,'111.111.111.128',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(891,'111.111.111.129',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(892,'111.111.111.130',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(893,'111.111.111.131',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:30','','','2017-04-01 13:38:30','',NULL),(894,'111.111.111.132',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(895,'111.111.111.133',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(896,'111.111.111.134',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(897,'111.111.111.135',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(898,'111.111.111.136',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(899,'111.111.111.137',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(900,'111.111.111.138',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(901,'111.111.111.139',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(902,'111.111.111.140',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(903,'111.111.111.141',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(904,'111.111.111.142',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(905,'111.111.111.143',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(906,'111.111.111.144',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(907,'111.111.111.145',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(908,'111.111.111.146',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(909,'111.111.111.147',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(910,'111.111.111.148',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(911,'111.111.111.149',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(912,'111.111.111.150',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(913,'111.111.111.151',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(914,'111.111.111.152',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(915,'111.111.111.153',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(916,'111.111.111.154',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(917,'111.111.111.155',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(918,'111.111.111.156',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(919,'111.111.111.157',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:31','','','2017-04-01 13:38:31','',NULL),(920,'111.111.111.158',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(921,'111.111.111.159',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(922,'111.111.111.160',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(923,'111.111.111.161',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(924,'111.111.111.162',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(925,'111.111.111.163',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(926,'111.111.111.164',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(927,'111.111.111.165',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(928,'111.111.111.166',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(929,'111.111.111.167',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(930,'111.111.111.168',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(931,'111.111.111.169',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(932,'111.111.111.170',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(933,'111.111.111.171',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(934,'111.111.111.172',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(935,'111.111.111.173',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(936,'111.111.111.174',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(937,'111.111.111.175',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(938,'111.111.111.176',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(939,'111.111.111.177',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(940,'111.111.111.178',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(941,'111.111.111.179',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(942,'111.111.111.180',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(943,'111.111.111.181',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(944,'111.111.111.182',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(945,'111.111.111.183',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(946,'111.111.111.184',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(947,'111.111.111.185',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(948,'111.111.111.186',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:32','','','2017-04-01 13:38:32','',NULL),(949,'111.111.111.187',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(950,'111.111.111.188',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(951,'111.111.111.189',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(952,'111.111.111.190',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(953,'111.111.111.191',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(954,'111.111.111.192',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(955,'111.111.111.193',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(956,'111.111.111.194',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(957,'111.111.111.195',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(958,'111.111.111.196',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(959,'111.111.111.197',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(960,'111.111.111.198',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(961,'111.111.111.199',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(962,'111.111.111.200',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(963,'111.111.111.201',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(964,'111.111.111.202',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(965,'111.111.111.203',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(966,'111.111.111.204',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(967,'111.111.111.205',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(968,'111.111.111.206',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(969,'111.111.111.207',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(970,'111.111.111.208',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(971,'111.111.111.209',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(972,'111.111.111.210',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:33','','','2017-04-01 13:38:33','',NULL),(973,'111.111.111.211',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(974,'111.111.111.212',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(975,'111.111.111.213',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(976,'111.111.111.214',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(977,'111.111.111.215',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(978,'111.111.111.216',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(979,'111.111.111.217',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(980,'111.111.111.218',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(981,'111.111.111.219',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(982,'111.111.111.220',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(983,'111.111.111.221',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(984,'111.111.111.222',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(985,'111.111.111.223',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(986,'111.111.111.224',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(987,'111.111.111.225',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(988,'111.111.111.226',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(989,'111.111.111.227',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(990,'111.111.111.228',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(991,'111.111.111.229',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(992,'111.111.111.230',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(993,'111.111.111.231',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(994,'111.111.111.232',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(995,'111.111.111.233',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(996,'111.111.111.234',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(997,'111.111.111.235',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:34','','','2017-04-01 13:38:34','',NULL),(998,'111.111.111.236',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(999,'111.111.111.237',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1000,'111.111.111.238',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1001,'111.111.111.239',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1002,'111.111.111.240',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1003,'111.111.111.241',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1004,'111.111.111.242',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1005,'111.111.111.243',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1006,'111.111.111.244',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1007,'111.111.111.245',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1008,'111.111.111.246',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1009,'111.111.111.247',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1010,'111.111.111.248',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1011,'111.111.111.249',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1012,'111.111.111.250',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1013,'111.111.111.251',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1014,'111.111.111.252',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1015,'111.111.111.253',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1016,'111.111.111.254',0,'',0,'','','',0,'','',NULL,4,NULL,NULL,1,'2017-04-01 13:38:35','','','2017-04-01 13:38:35','',NULL),(1017,'121.111.111.1',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1018,'121.111.111.2',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1019,'121.111.111.3',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1020,'121.111.111.4',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1021,'121.111.111.5',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1022,'121.111.111.6',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1023,'121.111.111.7',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1024,'121.111.111.8',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1025,'121.111.111.9',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1026,'121.111.111.10',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1027,'121.111.111.11',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1028,'121.111.111.12',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1029,'121.111.111.13',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1030,'121.111.111.14',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1031,'121.111.111.15',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1032,'121.111.111.16',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1033,'121.111.111.17',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1034,'121.111.111.18',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1035,'121.111.111.19',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1036,'121.111.111.20',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1037,'121.111.111.21',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1038,'121.111.111.22',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1039,'121.111.111.23',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1040,'121.111.111.24',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24','',NULL),(1041,'121.111.111.25',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1042,'121.111.111.26',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1043,'121.111.111.27',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1044,'121.111.111.28',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1045,'121.111.111.29',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1046,'121.111.111.30',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1047,'121.111.111.31',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1048,'121.111.111.32',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1049,'121.111.111.33',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1050,'121.111.111.34',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1051,'121.111.111.35',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1052,'121.111.111.36',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1053,'121.111.111.37',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1054,'121.111.111.38',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1055,'121.111.111.39',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1056,'121.111.111.40',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1057,'121.111.111.41',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1058,'121.111.111.42',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1059,'121.111.111.43',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1060,'121.111.111.44',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1061,'121.111.111.45',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1062,'121.111.111.46',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1063,'121.111.111.47',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1064,'121.111.111.48',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1065,'121.111.111.49',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1066,'121.111.111.50',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1067,'121.111.111.51',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1068,'121.111.111.52',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:25','','','2017-04-01 13:57:25','',NULL),(1069,'121.111.111.53',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1070,'121.111.111.54',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1071,'121.111.111.55',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1072,'121.111.111.56',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1073,'121.111.111.57',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1074,'121.111.111.58',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1075,'121.111.111.59',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1076,'121.111.111.60',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1077,'121.111.111.61',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1078,'121.111.111.62',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1079,'121.111.111.63',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1080,'121.111.111.64',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1081,'121.111.111.65',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1082,'121.111.111.66',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1083,'121.111.111.67',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1084,'121.111.111.68',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1085,'121.111.111.69',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1086,'121.111.111.70',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1087,'121.111.111.71',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1088,'121.111.111.72',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1089,'121.111.111.73',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1090,'121.111.111.74',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:26','','','2017-04-01 13:57:26','',NULL),(1091,'121.111.111.75',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1092,'121.111.111.76',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1093,'121.111.111.77',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1094,'121.111.111.78',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1095,'121.111.111.79',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1096,'121.111.111.80',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1097,'121.111.111.81',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1098,'121.111.111.82',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1099,'121.111.111.83',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1100,'121.111.111.84',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1101,'121.111.111.85',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1102,'121.111.111.86',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1103,'121.111.111.87',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1104,'121.111.111.88',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1105,'121.111.111.89',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1106,'121.111.111.90',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1107,'121.111.111.91',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1108,'121.111.111.92',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1109,'121.111.111.93',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1110,'121.111.111.94',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1111,'121.111.111.95',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1112,'121.111.111.96',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1113,'121.111.111.97',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1114,'121.111.111.98',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1115,'121.111.111.99',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1116,'121.111.111.100',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1117,'121.111.111.101',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1118,'121.111.111.102',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1119,'121.111.111.103',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1120,'121.111.111.104',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1121,'121.111.111.105',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1122,'121.111.111.106',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1123,'121.111.111.107',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1124,'121.111.111.108',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1125,'121.111.111.109',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1126,'121.111.111.110',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:27','','','2017-04-01 13:57:27','',NULL),(1127,'121.111.111.111',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1128,'121.111.111.112',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1129,'121.111.111.113',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1130,'121.111.111.114',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1131,'121.111.111.115',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1132,'121.111.111.116',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1133,'121.111.111.117',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1134,'121.111.111.118',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1135,'121.111.111.119',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1136,'121.111.111.120',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1137,'121.111.111.121',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1138,'121.111.111.122',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1139,'121.111.111.123',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1140,'121.111.111.124',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1141,'121.111.111.125',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1142,'121.111.111.126',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1143,'121.111.111.127',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1144,'121.111.111.128',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1145,'121.111.111.129',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1146,'121.111.111.130',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1147,'121.111.111.131',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1148,'121.111.111.132',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1149,'121.111.111.133',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1150,'121.111.111.134',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:28','','','2017-04-01 13:57:28','',NULL),(1151,'121.111.111.135',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1152,'121.111.111.136',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1153,'121.111.111.137',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1154,'121.111.111.138',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1155,'121.111.111.139',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1156,'121.111.111.140',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1157,'121.111.111.141',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1158,'121.111.111.142',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1159,'121.111.111.143',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1160,'121.111.111.144',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1161,'121.111.111.145',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1162,'121.111.111.146',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1163,'121.111.111.147',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1164,'121.111.111.148',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1165,'121.111.111.149',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1166,'121.111.111.150',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1167,'121.111.111.151',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1168,'121.111.111.152',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1169,'121.111.111.153',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1170,'121.111.111.154',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1171,'121.111.111.155',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1172,'121.111.111.156',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1173,'121.111.111.157',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1174,'121.111.111.158',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1175,'121.111.111.159',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1176,'121.111.111.160',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1177,'121.111.111.161',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1178,'121.111.111.162',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:29','','','2017-04-01 13:57:29','',NULL),(1179,'121.111.111.163',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1180,'121.111.111.164',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1181,'121.111.111.165',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1182,'121.111.111.166',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1183,'121.111.111.167',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1184,'121.111.111.168',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1185,'121.111.111.169',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1186,'121.111.111.170',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1187,'121.111.111.171',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1188,'121.111.111.172',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1189,'121.111.111.173',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1190,'121.111.111.174',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1191,'121.111.111.175',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1192,'121.111.111.176',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1193,'121.111.111.177',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1194,'121.111.111.178',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1195,'121.111.111.179',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1196,'121.111.111.180',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1197,'121.111.111.181',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1198,'121.111.111.182',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1199,'121.111.111.183',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1200,'121.111.111.184',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1201,'121.111.111.185',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1202,'121.111.111.186',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1203,'121.111.111.187',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1204,'121.111.111.188',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:30','','','2017-04-01 13:57:30','',NULL),(1205,'121.111.111.189',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1206,'121.111.111.190',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1207,'121.111.111.191',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1208,'121.111.111.192',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1209,'121.111.111.193',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1210,'121.111.111.194',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1211,'121.111.111.195',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1212,'121.111.111.196',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1213,'121.111.111.197',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1214,'121.111.111.198',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1215,'121.111.111.199',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1216,'121.111.111.200',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1217,'121.111.111.201',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1218,'121.111.111.202',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1219,'121.111.111.203',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:31','','','2017-04-01 13:57:31','',NULL),(1220,'121.111.111.204',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1221,'121.111.111.205',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1222,'121.111.111.206',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1223,'121.111.111.207',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1224,'121.111.111.208',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1225,'121.111.111.209',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1226,'121.111.111.210',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1227,'121.111.111.211',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1228,'121.111.111.212',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1229,'121.111.111.213',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1230,'121.111.111.214',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1231,'121.111.111.215',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1232,'121.111.111.216',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1233,'121.111.111.217',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1234,'121.111.111.218',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1235,'121.111.111.219',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1236,'121.111.111.220',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1237,'121.111.111.221',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1238,'121.111.111.222',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1239,'121.111.111.223',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1240,'121.111.111.224',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1241,'121.111.111.225',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1242,'121.111.111.226',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1243,'121.111.111.227',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1244,'121.111.111.228',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1245,'121.111.111.229',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1246,'121.111.111.230',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1247,'121.111.111.231',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1248,'121.111.111.232',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1249,'121.111.111.233',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1250,'121.111.111.234',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1251,'121.111.111.235',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1252,'121.111.111.236',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1253,'121.111.111.237',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1254,'121.111.111.238',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1255,'121.111.111.239',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1256,'121.111.111.240',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:32','','','2017-04-01 13:57:32','',NULL),(1257,'121.111.111.241',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1258,'121.111.111.242',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1259,'121.111.111.243',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1260,'121.111.111.244',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1261,'121.111.111.245',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1262,'121.111.111.246',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1263,'121.111.111.247',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1264,'121.111.111.248',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1265,'121.111.111.249',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1266,'121.111.111.250',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1267,'121.111.111.251',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1268,'121.111.111.252',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1269,'121.111.111.253',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL),(1270,'121.111.111.254',0,'',0,'','','',0,'','',NULL,5,NULL,NULL,1,'2017-04-01 13:57:33','','','2017-04-01 13:57:33','',NULL);
/*!40000 ALTER TABLE `ip_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_subnet`
--

DROP TABLE IF EXISTS `ip_subnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_subnet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subnet_address` varchar(255) DEFAULT NULL,
  `subnet_description` varchar(512) DEFAULT NULL,
  `mask` varchar(3) DEFAULT NULL,
  `vlan` varchar(50) DEFAULT NULL,
  `allow_allocation` int(11) DEFAULT NULL,
  `check_ip_state` int(11) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_subnet`
--

LOCK TABLES `ip_subnet` WRITE;
/*!40000 ALTER TABLE `ip_subnet` DISABLE KEYS */;
INSERT INTO `ip_subnet` VALUES (1,'10.2.2.222/24','','32','',1,0,1,'2017-03-31 18:39:36','','','2017-03-31 18:39:36'),(2,'10.2.3.45/24','','32','',1,0,1,'2017-03-31 18:40:01','','','2017-03-31 18:40:01'),(3,'111.111.111.111/24','','32','',1,0,1,'2017-04-01 13:26:15','','','2017-04-01 13:26:15'),(4,'111.111.111.111/24','','32','',1,0,1,'2017-04-01 13:38:23','','','2017-04-01 13:38:23'),(5,'121.111.111.111/24','','32','',1,0,1,'2017-04-01 13:57:24','','','2017-04-01 13:57:24');
/*!40000 ALTER TABLE `ip_subnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_vlan`
--

DROP TABLE IF EXISTS `ip_vlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_vlan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` bigint(20) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `ip_vlan_domain_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_vlan`
--

LOCK TABLES `ip_vlan` WRITE;
/*!40000 ALTER TABLE `ip_vlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_vlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_vlan_domain`
--

DROP TABLE IF EXISTS `ip_vlan_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_vlan_domain` (
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
-- Dumping data for table `ip_vlan_domain`
--

LOCK TABLES `ip_vlan_domain` WRITE;
/*!40000 ALTER TABLE `ip_vlan_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_vlan_domain` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'dell','','','',0,'2017-04-01 12:33:59','','','2017-04-01 12:33:59');
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
  `server_id` bigint(20) DEFAULT NULL,
  `total` bigint(20) unsigned NOT NULL DEFAULT '0',
  `available` bigint(20) unsigned NOT NULL DEFAULT '0',
  `used` bigint(20) unsigned NOT NULL DEFAULT '0',
  `used_percent` double NOT NULL DEFAULT '0',
  `free` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memory`
--

LOCK TABLES `memory` WRITE;
/*!40000 ALTER TABLE `memory` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,'root.resource','资源管理','',0,1,NULL,'admin','','2017-01-05 16:10:19',0,1,'fa fa-exchange',''),(3,'root.system','系统管理','',0,1,NULL,'admin','','2017-01-05 16:10:20',0,1,'fa fa-hand-o-right',''),(4,'root.report','资源报表','',0,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,1,NULL,NULL),(33,'root.systemuser','用户管理','/systemuser',3,1,NULL,'admin','','2017-01-05 16:10:20',0,2,'',''),(34,'root.systemconfig','系统配置','/systemconfig',3,1,NULL,'admin','','2017-01-05 16:10:20',0,2,'',''),(35,'root.system.users','用户列表','/users',33,1,NULL,'','',NULL,0,3,NULL,NULL),(36,'root.system.roles','菜单权限','/roles',33,1,NULL,'','',NULL,0,3,NULL,NULL),(37,'root.system.menus','菜单管理','/menus',34,0,NULL,'','',NULL,3,3,NULL,NULL),(38,'root.system.cloud','云账号','/cloud',34,1,'2017-03-23 16:19:53','','','2017-03-23 16:20:08',3,3,NULL,NULL),(39,'root.system.logs','日志管理','/logs',34,1,NULL,'','',NULL,3,3,NULL,NULL),(40,'root.system.email','邮件设置','/email',34,0,NULL,'','',NULL,3,3,NULL,NULL),(45,'root.system_api','API访问','/system_api',3,1,'2016-07-20 08:37:15','oneoaas','','2017-01-05 16:10:20',0,2,'0',''),(46,'root.visualization','资源可视化','/resource_view',0,0,NULL,'admin','','2016-11-24 15:31:26',0,1,'fa fa-eye',''),(47,'root.resource_quick','分类查询','/resource_quick',1,1,NULL,'admin','','2016-10-25 23:59:00',0,2,'',''),(48,'root.system.apikey','KEY列表','/apikey',45,1,NULL,'','',NULL,3,3,NULL,NULL),(50,'root.visualization.tree','资源树','/resource_tree',46,1,'2016-09-17 22:24:40','oneoaas','','2016-10-25 23:59:07',0,2,'fa fa-tachometer',''),(51,'root.visualization.topo','拓扑图','/resource_topo',46,1,'2016-09-19 00:25:29','oneoaas','','2016-11-24 15:31:26',0,2,'fa fa-tachometer',''),(52,'root.manageresources.datacenter({assertsId:1})','数据中心资源','/datacenter',2,1,NULL,'','','2017-01-05 16:10:19',0,0,'',''),(53,'root.manageresources.bandwidth({assertsId:2})','IPAM资源','/ipam',2,1,NULL,'','','2017-01-05 16:10:19',0,0,'',''),(54,'root.manageresources.app({assertsId:3})','业务资源','/business',2,1,NULL,'','','2017-01-05 16:10:19',0,0,'',''),(55,'root.manageresources.vcenter({assertsId:4})','虚拟化资源','/virtualization',2,1,NULL,'','','2017-01-05 16:10:19',0,0,'',''),(56,'root.manageresources.aliyun({assertsId:5})','云资源','/cloud',2,1,NULL,'','','2017-01-05 16:10:19',0,0,'',''),(57,'root.manageresources.supplier({assertsId:6})','供应商资源','/supplier',2,1,NULL,'','','2017-01-05 16:10:20',0,0,'',''),(60,'root.report.device','设备性能报表','/device',4,0,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,2,NULL,NULL),(61,'root.report.finance','财务报表','/finance',4,0,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,2,NULL,NULL),(62,'root.report.use','资源报表','/use',4,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,2,NULL,NULL),(63,'root.report.devicedetail','设备性能报表详情','/devicedetail',60,0,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL),(64,'root.report.financedetail','财务报表详情','/financedetail',61,0,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL),(65,'root.report.usedetail','资源报表详情','/usedetail',62,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL),(66,'root.visualization.rtop','资源拓扑图','/rtop',51,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL),(67,'root.visualization.btop','业务拓扑图','/btop',51,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL),(68,'root.visualization.rtree','资源树','/rtree',50,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL),(69,'root.system.modeling','资产建模','/modeling',34,0,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=897 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_roles`
--

LOCK TABLES `menu_roles` WRITE;
/*!40000 ALTER TABLE `menu_roles` DISABLE KEYS */;
INSERT INTO `menu_roles` VALUES (367,2,8),(368,52,8),(369,53,8),(370,54,8),(371,55,8),(372,56,8),(373,57,8),(374,3,8),(375,33,8),(376,34,8),(377,45,8),(378,46,8),(379,51,8),(615,2,11),(616,52,11),(617,53,11),(618,54,11),(619,55,11),(620,51,11),(687,2,12),(688,53,12),(689,2,13),(690,52,13),(691,53,13),(692,54,13),(693,55,13),(694,56,13),(695,57,13),(696,46,13),(697,51,13),(823,2,9),(824,52,9),(825,53,9),(826,54,9),(827,55,9),(828,56,9),(829,57,9),(847,69,8),(880,35,8),(881,36,8),(882,37,8),(883,38,8),(884,39,8),(885,48,8),(886,4,8),(887,60,8),(888,61,8),(889,62,8),(890,63,8),(891,64,8),(892,65,8),(893,66,8),(894,67,8),(895,68,8),(896,69,8);
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
  `server_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_adapter`
--

LOCK TABLES `network_adapter` WRITE;
/*!40000 ALTER TABLE `network_adapter` DISABLE KEYS */;
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
  `room_id` bigint(20) DEFAULT NULL,
  `rack_id` bigint(20) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_bandwidth`
--

LOCK TABLES `network_bandwidth` WRITE;
/*!40000 ALTER TABLE `network_bandwidth` DISABLE KEYS */;
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
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_bandwidth_state`
--

LOCK TABLES `network_bandwidth_state` WRITE;
/*!40000 ALTER TABLE `network_bandwidth_state` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
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
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack_state`
--

LOCK TABLES `rack_state` WRITE;
/*!40000 ALTER TABLE `rack_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `rack_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_platform_account`
--

DROP TABLE IF EXISTS `resource_platform_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_platform_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cloud_name` varchar(255) NOT NULL DEFAULT '',
  `cloud_platform` varchar(32) NOT NULL DEFAULT '',
  `cloud_state` varchar(32) NOT NULL DEFAULT '',
  `cloud_host_num` bigint(20) NOT NULL DEFAULT '0',
  `sync_state` varchar(32) NOT NULL DEFAULT '',
  `account_ip` varchar(32) NOT NULL DEFAULT '',
  `account_id` varchar(32) NOT NULL DEFAULT '',
  `account_secret` varchar(32) NOT NULL DEFAULT '',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_platform_account`
--

LOCK TABLES `resource_platform_account` WRITE;
/*!40000 ALTER TABLE `resource_platform_account` DISABLE KEYS */;
INSERT INTO `resource_platform_account` VALUES (1,'test','VCenter','正常',39,'同步完成','10.0.2.8','cmdb@oneoaas.com','cmDB@123','2017-07-19 11:07:45','2017-04-07 17:16:08','test',1),(2,'2','VCenter','异常',0,'异常','10.0.2.9','han','123','2017-04-09 11:16:58','2017-04-07 17:25:38','',1),(3,'aliyun','阿里云','正常',1,'同步完成','','麦子张子','maizizhangzi101','2017-05-10 12:37:05','2017-04-07 18:07:33','1',1);
/*!40000 ALTER TABLE `resource_platform_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_report`
--

DROP TABLE IF EXISTS `resource_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `number` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_report`
--

LOCK TABLES `resource_report` WRITE;
/*!40000 ALTER TABLE `resource_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_report` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (8,'超级管理员',1,'2016-07-16 21:38:34','','','2016-11-25 10:24:52'),(9,'普通管理员',1,'2016-07-28 15:39:10','','','2017-01-12 10:59:26'),(11,'网络管理员',1,'2016-10-30 02:25:13','','','2016-11-25 15:20:12'),(12,'机房管理员',1,'2016-10-26 14:56:28','','','2016-11-25 16:43:59'),(13,'机柜管理员',1,'2016-11-18 03:55:13','','','2016-11-25 16:54:53');
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
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_state`
--

LOCK TABLES `room_state` WRITE;
/*!40000 ALTER TABLE `room_state` DISABLE KEYS */;
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
  `sn` varchar(255) NOT NULL DEFAULT '',
  `modle` varchar(255) NOT NULL DEFAULT '',
  `isHpervisor` bigint(20) NOT NULL DEFAULT '0',
  `isServer` bigint(20) NOT NULL DEFAULT '0',
  `ipaddress` varchar(512) NOT NULL DEFAULT '',
  `hostname` varchar(512) NOT NULL DEFAULT '',
  `comment` varchar(512) DEFAULT NULL,
  `rack_u_number` bigint(20) DEFAULT NULL,
  `manufacturer_id` bigint(20) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `rack_id` bigint(20) DEFAULT NULL,
  `host_id` bigint(20) NOT NULL,
  `adapter_id` bigint(20) DEFAULT NULL,
  `harddisk_id` bigint(20) DEFAULT NULL,
  `memory_id` bigint(20) DEFAULT NULL,
  `cpu_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `server_uuid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`serverid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,'','r730',0,0,'10.0.0.1','idc1','',-1,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,1,'2017-04-02 00:34:22','','','2017-04-01 12:34:57','fed6278d-4ed5-401a-83d4-34d5caad2d3f');
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
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_state`
--

LOCK TABLES `server_state` WRITE;
/*!40000 ALTER TABLE `server_state` DISABLE KEYS */;
INSERT INTO `server_state` VALUES (1,'up',0,'2017-04-01 12:33:21','','','2017-04-01 12:33:21','#6BC86F');
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
INSERT INTO `session` VALUES ('17632b89fdae00021b4b468bcacf05f0','����\0\0\0��\0\0',1491559600),('2744f59e1178eae70365e2f4c7a0c6c6','����\0\0\0��\0\0',1491559609),('444211467c3ae1bac0d7cdfa2c3b123b','����\0\0\0��\0\0',1491559652),('5897bc1e05eddcc331e585eff8dabf8b','����\0\0\0��\0\0',1491559653),('7540c6a318de710712c5e098f52e3536','����\0\0\0��\0\0',1491559653),('9116a552194838855ef5b9e957866132','����\0\0\0��\0\0',1491559652),('9440abf8f68151a22619dbbbdedbe50e','����\0\0\0��\0\0',1491559653),('9e16223ffd9dfa30471a6a9d016b451d','����\0\0\0��\0\0',1491559601),('ac25efb22d6ed67735d1085e52760dad','����\0\0\0��\0\0',1491559601),('ac318e107b84de26092e4a5a56e98dc7','����\0\0\0��\0\0',1491559600),('e3076659a546babc04d4564a9aafb36e','����\0\0\0��\0\0',1491559601),('eae96126883539c7ecceb239cc5fc29d','����\0\0\0��\0\0',1491559600);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_api_call`
--

DROP TABLE IF EXISTS `system_api_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_api_call` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `api_name` varchar(100) NOT NULL DEFAULT '',
  `api_call_type` varchar(20) NOT NULL DEFAULT '',
  `api_create_date` date DEFAULT NULL,
  `api_create_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2346 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_api_call`
--

LOCK TABLES `system_api_call` WRITE;
/*!40000 ALTER TABLE `system_api_call` DISABLE KEYS */;
INSERT INTO `system_api_call` VALUES (1,0,'','/api/dashboard/count','self','2017-03-31','11:6'),(2,0,'','/api/menus','self','2017-03-31','11:6'),(3,0,'','/api/apicall','self','2017-03-31','11:6'),(4,0,'','/api/datacenter','self','2017-03-31','11:6'),(5,0,'','/api/change','self','2017-03-31','11:6'),(6,0,'','/api/dashboard/countByMonth','self','2017-03-31','11:6'),(7,0,'','/api/dashboard/uposition','self','2017-03-31','11:6'),(8,0,'','/api/dashboard/device','self','2017-03-31','11:6'),(9,0,'','/api/assets','self','2017-03-31','11:6'),(10,0,'','/api/user','self','2017-03-31','11:6'),(11,0,'','/api/menus/v2','self','2017-03-31','11:6'),(12,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:6'),(13,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:7'),(14,0,'','/api/SyncVcenter','self','2017-03-31','11:7'),(15,0,'','/api/menus/v2','','2017-03-31','11:15'),(16,0,'','/api/ResourcePlatformAccount','','2017-03-31','11:15'),(17,0,'','/api/menus','','2017-03-31','11:15'),(18,0,'','/api/change','self','2017-03-31','11:15'),(19,0,'','/api/datacenter','self','2017-03-31','11:15'),(20,0,'','/api/dashboard/countByMonth','self','2017-03-31','11:15'),(21,0,'','/api/dashboard/count','self','2017-03-31','11:15'),(22,0,'','/api/apicall','self','2017-03-31','11:15'),(23,0,'','/api/dashboard/device','self','2017-03-31','11:15'),(24,0,'','/api/dashboard/uposition','self','2017-03-31','11:15'),(25,0,'','/api/assets','self','2017-03-31','11:15'),(26,0,'','/api/user','self','2017-03-31','11:15'),(27,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:16'),(28,0,'','/api/SyncVcenter','self','2017-03-31','11:17'),(29,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:17'),(30,0,'','/api/assets','self','2017-03-31','11:19'),(31,0,'','/api/menus/v2','self','2017-03-31','11:19'),(32,0,'','/api/datacenter','self','2017-03-31','11:19'),(33,0,'','/api/user','self','2017-03-31','11:19'),(34,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:19'),(35,0,'','/api/menus','self','2017-03-31','11:40'),(36,0,'','/api/dashboard/count','self','2017-03-31','11:40'),(37,0,'','/api/datacenter','self','2017-03-31','11:40'),(38,0,'','/api/change','self','2017-03-31','11:40'),(39,0,'','/api/dashboard/countByMonth','self','2017-03-31','11:40'),(40,0,'','/api/apicall','self','2017-03-31','11:40'),(41,0,'','/api/dashboard/device','self','2017-03-31','11:40'),(42,0,'','/api/dashboard/uposition','self','2017-03-31','11:40'),(43,0,'','/api/menus/v2','self','2017-03-31','11:40'),(44,0,'','/api/user','self','2017-03-31','11:40'),(45,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:40'),(46,0,'','/api/SyncVcenter','self','2017-03-31','11:40'),(47,0,'','/api/menus/v2','self','2017-03-31','11:44'),(48,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:44'),(49,0,'','/api/menus','self','2017-03-31','11:44'),(50,0,'','/api/SyncVcenter','self','2017-03-31','11:45'),(51,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:45'),(52,0,'','/api/dashboard/count','self','2017-03-31','11:48'),(53,0,'','/api/datacenter','self','2017-03-31','11:48'),(54,0,'','/api/menus','self','2017-03-31','11:48'),(55,0,'','/api/apicall','self','2017-03-31','11:48'),(56,0,'','/api/change','self','2017-03-31','11:48'),(57,0,'','/api/dashboard/countByMonth','self','2017-03-31','11:48'),(58,0,'','/api/dashboard/device','self','2017-03-31','11:48'),(59,0,'','/api/dashboard/uposition','self','2017-03-31','11:48'),(60,0,'','/api/menus/v2','self','2017-03-31','11:48'),(61,0,'','/api/user','self','2017-03-31','11:48'),(62,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:48'),(63,0,'','/api/SyncVcenter','self','2017-03-31','11:48'),(64,0,'','/api/apicall','self','2017-03-31','11:50'),(65,0,'','/api/datacenter','self','2017-03-31','11:50'),(66,0,'','/api/menus','self','2017-03-31','11:50'),(67,0,'','/api/dashboard/count','self','2017-03-31','11:50'),(68,0,'','/api/change','self','2017-03-31','11:50'),(69,0,'','/api/dashboard/countByMonth','self','2017-03-31','11:50'),(70,0,'','/api/dashboard/uposition','self','2017-03-31','11:50'),(71,0,'','/api/dashboard/device','self','2017-03-31','11:50'),(72,0,'','/api/user','self','2017-03-31','11:50'),(73,0,'','/api/menus/v2','self','2017-03-31','11:50'),(74,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:50'),(75,0,'','/api/SyncVcenter','self','2017-03-31','11:50'),(76,0,'','/api/SyncVcenter','self','2017-03-31','11:51'),(77,0,'','/api/ResourcePlatformAccount','self','2017-03-31','11:51'),(78,0,'','/api/change','self','2017-03-31','13:20'),(79,0,'','/api/datacenter','self','2017-03-31','13:20'),(80,0,'','/api/apicall','self','2017-03-31','13:20'),(81,0,'','/api/dashboard/countByMonth','self','2017-03-31','13:20'),(82,0,'','/api/dashboard/count','self','2017-03-31','13:20'),(83,0,'','/api/menus','self','2017-03-31','13:20'),(84,0,'','/api/dashboard/uposition','self','2017-03-31','13:20'),(85,0,'','/api/dashboard/device','self','2017-03-31','13:20'),(86,0,'','/api/assets','self','2017-03-31','13:20'),(87,0,'','/api/menus/v2','self','2017-03-31','13:20'),(88,0,'','/api/user','self','2017-03-31','13:20'),(89,0,'','/api/ResourcePlatformAccount','self','2017-03-31','13:20'),(90,0,'','/api/ResourcePlatformAccount','self','2017-03-31','13:21'),(91,0,'','/api/SyncVcenter','self','2017-03-31','13:21'),(92,0,'','/api/apicall','self','2017-03-31','13:32'),(93,0,'','/api/datacenter','self','2017-03-31','13:32'),(94,0,'','/api/menus','self','2017-03-31','13:32'),(95,0,'','/api/change','self','2017-03-31','13:32'),(96,0,'','/api/dashboard/count','self','2017-03-31','13:32'),(97,0,'','/api/dashboard/countByMonth','self','2017-03-31','13:32'),(98,0,'','/api/dashboard/device','self','2017-03-31','13:32'),(99,0,'','/api/dashboard/uposition','self','2017-03-31','13:32'),(100,0,'','/api/menus/v2','self','2017-03-31','13:32'),(101,0,'','/api/user','self','2017-03-31','13:32'),(102,0,'','/api/ResourcePlatformAccount','self','2017-03-31','13:32'),(103,0,'','/api/SyncVcenter','self','2017-03-31','13:33'),(104,0,'','/api/ResourcePlatformAccount','self','2017-03-31','13:33'),(105,0,'','/api/datacenter','self','2017-03-31','13:34'),(106,0,'','/api/dashboard/countByMonth','self','2017-03-31','13:34'),(107,0,'','/api/dashboard/count','self','2017-03-31','13:34'),(108,0,'','/api/change','self','2017-03-31','13:34'),(109,0,'','/api/apicall','self','2017-03-31','13:34'),(110,0,'','/api/menus','self','2017-03-31','13:34'),(111,0,'','/api/dashboard/uposition','self','2017-03-31','13:34'),(112,0,'','/api/dashboard/device','self','2017-03-31','13:34'),(113,0,'','/api/user','self','2017-03-31','13:34'),(114,0,'','/api/menus/v2','self','2017-03-31','13:34'),(115,0,'','/api/ResourcePlatformAccount','self','2017-03-31','13:34'),(116,0,'','/api/SyncVcenter','self','2017-03-31','13:34'),(117,0,'','/api/ResourcePlatformAccount','self','2017-03-31','13:48'),(118,0,'','/api/menus/v2','self','2017-03-31','13:48'),(119,0,'','/api/menus','self','2017-03-31','13:48'),(120,0,'','/api/SyncVcenter','self','2017-03-31','13:48'),(121,0,'','/api/menus','self','2017-03-31','14:1'),(122,0,'','/api/menus/v2','self','2017-03-31','14:1'),(123,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:1'),(124,0,'','/api/SyncVcenter','self','2017-03-31','14:1'),(125,0,'','/api/menus/v2','self','2017-03-31','14:3'),(126,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:3'),(127,0,'','/api/menus','self','2017-03-31','14:3'),(128,0,'','/api/SyncVcenter','self','2017-03-31','14:3'),(129,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:11'),(130,0,'','/api/menus','self','2017-03-31','14:11'),(131,0,'','/api/menus/v2','self','2017-03-31','14:11'),(132,0,'','/api/SyncVcenter','self','2017-03-31','14:11'),(133,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:12'),(134,0,'','/api/menus','self','2017-03-31','14:12'),(135,0,'','/api/menus/v2','self','2017-03-31','14:12'),(136,0,'','/api/SyncVcenter','self','2017-03-31','14:12'),(137,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:13'),(138,0,'','/api/menus/v2','self','2017-03-31','14:13'),(139,0,'','/api/menus','self','2017-03-31','14:13'),(140,0,'','/api/SyncVcenter','self','2017-03-31','14:13'),(141,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:14'),(142,0,'','/api/SyncVcenter','self','2017-03-31','14:14'),(143,0,'','/api/menus/v2','self','2017-03-31','14:15'),(144,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:15'),(145,0,'','/api/menus','self','2017-03-31','14:15'),(146,0,'','/api/SyncVcenter','self','2017-03-31','14:15'),(147,0,'','/api/menus','','2017-03-31','14:18'),(148,0,'','/api/menus/v2','','2017-03-31','14:18'),(149,0,'','/api/ResourcePlatformAccount','','2017-03-31','14:18'),(150,0,'','/api/change','self','2017-03-31','14:18'),(151,0,'','/api/dashboard/countByMonth','self','2017-03-31','14:18'),(152,0,'','/api/datacenter','self','2017-03-31','14:18'),(153,0,'','/api/apicall','self','2017-03-31','14:18'),(154,0,'','/api/dashboard/uposition','self','2017-03-31','14:18'),(155,0,'','/api/dashboard/count','self','2017-03-31','14:18'),(156,0,'','/api/dashboard/device','self','2017-03-31','14:18'),(157,0,'','/api/assets','self','2017-03-31','14:18'),(158,0,'','/api/user','self','2017-03-31','14:18'),(159,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:19'),(160,0,'','/api/SyncVcenter','self','2017-03-31','14:19'),(161,0,'','/api/SyncVcenter','self','2017-03-31','14:28'),(162,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:28'),(163,0,'','/api/SyncVcenter','self','2017-03-31','14:29'),(164,0,'','/api/ResourcePlatformAccount','self','2017-03-31','14:29'),(165,0,'','/api/assets','self','2017-03-31','14:59'),(166,0,'','/api/menus/v2','self','2017-03-31','14:59'),(167,0,'','/api/subnet','self','2017-03-31','14:59'),(168,0,'','/api/change','self','2017-03-31','15:15'),(169,0,'','/api/menus','self','2017-03-31','15:15'),(170,0,'','/api/dashboard/count','self','2017-03-31','15:15'),(171,0,'','/api/apicall','self','2017-03-31','15:15'),(172,0,'','/api/datacenter','self','2017-03-31','15:15'),(173,0,'','/api/dashboard/countByMonth','self','2017-03-31','15:15'),(174,0,'','/api/dashboard/uposition','self','2017-03-31','15:15'),(175,0,'','/api/dashboard/device','self','2017-03-31','15:15'),(176,0,'','/api/user','self','2017-03-31','15:15'),(177,0,'','/api/menus/v2','self','2017-03-31','15:15'),(178,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:15'),(179,0,'','/api/SyncVcenter','self','2017-03-31','15:15'),(180,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:18'),(181,0,'','/api/menus','self','2017-03-31','15:18'),(182,0,'','/api/menus/v2','self','2017-03-31','15:18'),(183,0,'','/api/SyncVcenter','self','2017-03-31','15:18'),(184,0,'','/api/SyncVcenter','self','2017-03-31','15:19'),(185,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:19'),(186,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:20'),(187,0,'','/api/menus','self','2017-03-31','15:20'),(188,0,'','/api/menus/v2','self','2017-03-31','15:20'),(189,0,'','/api/SyncVcenter','self','2017-03-31','15:20'),(190,0,'','/api/menus','self','2017-03-31','15:22'),(191,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:22'),(192,0,'','/api/menus/v2','self','2017-03-31','15:22'),(193,0,'','/api/SyncVcenter','self','2017-03-31','15:22'),(194,0,'','/api/menus','','2017-03-31','15:24'),(195,0,'','/api/ResourcePlatformAccount','','2017-03-31','15:24'),(196,0,'','/api/menus/v2','','2017-03-31','15:24'),(197,0,'','/api/change','self','2017-03-31','15:24'),(198,0,'','/api/datacenter','self','2017-03-31','15:24'),(199,0,'','/api/dashboard/count','self','2017-03-31','15:24'),(200,0,'','/api/dashboard/countByMonth','self','2017-03-31','15:24'),(201,0,'','/api/apicall','self','2017-03-31','15:24'),(202,0,'','/api/dashboard/uposition','self','2017-03-31','15:24'),(203,0,'','/api/dashboard/device','self','2017-03-31','15:24'),(204,0,'','/api/assets','self','2017-03-31','15:24'),(205,0,'','/api/user','self','2017-03-31','15:24'),(206,0,'','/api/SyncVcenter','self','2017-03-31','15:24'),(207,0,'','/api/menus','','2017-03-31','15:34'),(208,0,'','/api/ResourcePlatformAccount','','2017-03-31','15:34'),(209,0,'','/api/menus/v2','','2017-03-31','15:34'),(210,0,'','/api/change','self','2017-03-31','15:34'),(211,0,'','/api/dashboard/count','self','2017-03-31','15:34'),(212,0,'','/api/dashboard/countByMonth','self','2017-03-31','15:34'),(213,0,'','/api/apicall','self','2017-03-31','15:34'),(214,0,'','/api/datacenter','self','2017-03-31','15:34'),(215,0,'','/api/dashboard/uposition','self','2017-03-31','15:34'),(216,0,'','/api/dashboard/device','self','2017-03-31','15:34'),(217,0,'','/api/assets','self','2017-03-31','15:34'),(218,0,'','/api/user','self','2017-03-31','15:34'),(219,0,'','/api/SyncVcenter','self','2017-03-31','15:34'),(220,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:35'),(221,0,'','/api/SyncVcenter','self','2017-03-31','15:35'),(222,0,'','/api/SyncVcenter','self','2017-03-31','15:37'),(223,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:37'),(224,0,'','/api/datacenter','self','2017-03-31','15:40'),(225,0,'','/api/dashboard/count','self','2017-03-31','15:40'),(226,0,'','/api/menus','self','2017-03-31','15:40'),(227,0,'','/api/apicall','self','2017-03-31','15:40'),(228,0,'','/api/dashboard/countByMonth','self','2017-03-31','15:40'),(229,0,'','/api/change','self','2017-03-31','15:40'),(230,0,'','/api/dashboard/uposition','self','2017-03-31','15:40'),(231,0,'','/api/dashboard/device','self','2017-03-31','15:40'),(232,0,'','/api/menus/v2','self','2017-03-31','15:40'),(233,0,'','/api/user','self','2017-03-31','15:40'),(234,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:40'),(235,0,'','/api/SyncVcenter','self','2017-03-31','15:40'),(236,0,'','/api/menus','self','2017-03-31','15:46'),(237,0,'','/api/apicall','self','2017-03-31','15:46'),(238,0,'','/api/dashboard/countByMonth','self','2017-03-31','15:46'),(239,0,'','/api/datacenter','self','2017-03-31','15:46'),(240,0,'','/api/dashboard/count','self','2017-03-31','15:46'),(241,0,'','/api/change','self','2017-03-31','15:46'),(242,0,'','/api/dashboard/uposition','self','2017-03-31','15:46'),(243,0,'','/api/dashboard/device','self','2017-03-31','15:46'),(244,0,'','/api/user','self','2017-03-31','15:46'),(245,0,'','/api/menus/v2','self','2017-03-31','15:46'),(246,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:46'),(247,0,'','/api/SyncVcenter','self','2017-03-31','15:46'),(248,0,'','/api/SyncVcenter','self','2017-03-31','15:47'),(249,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:47'),(250,0,'','/api/dashboard/count','self','2017-03-31','15:52'),(251,0,'','/api/change','self','2017-03-31','15:52'),(252,0,'','/api/datacenter','self','2017-03-31','15:52'),(253,0,'','/api/menus','self','2017-03-31','15:52'),(254,0,'','/api/dashboard/countByMonth','self','2017-03-31','15:52'),(255,0,'','/api/apicall','self','2017-03-31','15:52'),(256,0,'','/api/dashboard/uposition','self','2017-03-31','15:52'),(257,0,'','/api/dashboard/device','self','2017-03-31','15:52'),(258,0,'','/api/assets','self','2017-03-31','15:52'),(259,0,'','/api/user','self','2017-03-31','15:52'),(260,0,'','/api/menus/v2','self','2017-03-31','15:52'),(261,0,'','/api/ResourcePlatformAccount','self','2017-03-31','15:52'),(262,0,'','/api/SyncVcenter','self','2017-03-31','15:52'),(263,0,'','/api/menus/v2','self','2017-03-31','16:0'),(264,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:0'),(265,0,'','/api/menus','self','2017-03-31','16:0'),(266,0,'','/api/menus','self','2017-03-31','16:4'),(267,0,'','/api/apicall','self','2017-03-31','16:4'),(268,0,'','/api/dashboard/count','self','2017-03-31','16:4'),(269,0,'','/api/datacenter','self','2017-03-31','16:4'),(270,0,'','/api/dashboard/countByMonth','self','2017-03-31','16:4'),(271,0,'','/api/change','self','2017-03-31','16:4'),(272,0,'','/api/dashboard/uposition','self','2017-03-31','16:4'),(273,0,'','/api/dashboard/device','self','2017-03-31','16:4'),(274,0,'','/api/assets','self','2017-03-31','16:4'),(275,0,'','/api/menus/v2','self','2017-03-31','16:4'),(276,0,'','/api/user','self','2017-03-31','16:4'),(277,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:4'),(278,0,'','/api/SyncVcenter','self','2017-03-31','16:4'),(279,0,'','/api/menus','self','2017-03-31','16:35'),(280,0,'','/api/datacenter','self','2017-03-31','16:35'),(281,0,'','/api/change','self','2017-03-31','16:35'),(282,0,'','/api/apicall','self','2017-03-31','16:35'),(283,0,'','/api/dashboard/countByMonth','self','2017-03-31','16:35'),(284,0,'','/api/dashboard/count','self','2017-03-31','16:35'),(285,0,'','/api/dashboard/uposition','self','2017-03-31','16:35'),(286,0,'','/api/dashboard/device','self','2017-03-31','16:35'),(287,0,'','/api/assets','self','2017-03-31','16:35'),(288,0,'','/api/user','self','2017-03-31','16:35'),(289,0,'','/api/menus/v2','self','2017-03-31','16:35'),(290,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:36'),(291,0,'','/api/menus','self','2017-03-31','16:43'),(292,0,'','/api/menus/v2','self','2017-03-31','16:43'),(293,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:43'),(294,0,'','/api/SyncVcenter','self','2017-03-31','16:43'),(295,0,'','/api/menus','self','2017-03-31','16:44'),(296,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:44'),(297,0,'','/api/menus/v2','self','2017-03-31','16:44'),(298,0,'','/api/menus/v2','self','2017-03-31','16:46'),(299,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:46'),(300,0,'','/api/menus','self','2017-03-31','16:46'),(301,0,'','/api/SyncVcenter','self','2017-03-31','16:46'),(302,0,'','/api/menus','self','2017-03-31','16:48'),(303,0,'','/api/menus/v2','self','2017-03-31','16:48'),(304,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:48'),(305,0,'','/api/SyncVcenter','self','2017-03-31','16:48'),(306,0,'','/api/apicall','self','2017-03-31','16:49'),(307,0,'','/api/menus','self','2017-03-31','16:49'),(308,0,'','/api/dashboard/countByMonth','self','2017-03-31','16:49'),(309,0,'','/api/datacenter','self','2017-03-31','16:49'),(310,0,'','/api/dashboard/count','self','2017-03-31','16:49'),(311,0,'','/api/change','self','2017-03-31','16:49'),(312,0,'','/api/dashboard/device','self','2017-03-31','16:49'),(313,0,'','/api/dashboard/uposition','self','2017-03-31','16:49'),(314,0,'','/api/menus/v2','self','2017-03-31','16:49'),(315,0,'','/api/user','self','2017-03-31','16:49'),(316,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:49'),(317,0,'','/api/SyncVcenter','self','2017-03-31','16:49'),(318,0,'','/api/dashboard/count','self','2017-03-31','16:52'),(319,0,'','/api/menus','self','2017-03-31','16:52'),(320,0,'','/api/datacenter','self','2017-03-31','16:52'),(321,0,'','/api/apicall','self','2017-03-31','16:52'),(322,0,'','/api/change','self','2017-03-31','16:52'),(323,0,'','/api/dashboard/countByMonth','self','2017-03-31','16:52'),(324,0,'','/api/dashboard/uposition','self','2017-03-31','16:52'),(325,0,'','/api/dashboard/device','self','2017-03-31','16:52'),(326,0,'','/api/user','self','2017-03-31','16:52'),(327,0,'','/api/menus/v2','self','2017-03-31','16:52'),(328,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:52'),(329,0,'','/api/SyncVcenter','self','2017-03-31','16:52'),(330,0,'','/api/datacenter','self','2017-03-31','16:53'),(331,0,'','/api/dashboard/countByMonth','self','2017-03-31','16:53'),(332,0,'','/api/dashboard/count','self','2017-03-31','16:53'),(333,0,'','/api/apicall','self','2017-03-31','16:53'),(334,0,'','/api/menus','self','2017-03-31','16:53'),(335,0,'','/api/dashboard/uposition','self','2017-03-31','16:53'),(336,0,'','/api/dashboard/device','self','2017-03-31','16:53'),(337,0,'','/api/user','self','2017-03-31','16:53'),(338,0,'','/api/menus/v2','self','2017-03-31','16:53'),(339,0,'','/api/ResourcePlatformAccount','self','2017-03-31','16:53'),(340,0,'','/api/SyncVcenter','self','2017-03-31','16:53'),(341,0,'','/api/change','self','2017-03-31','16:53'),(342,0,'','/api/menus','','2017-03-31','16:58'),(343,0,'','/api/ResourcePlatformAccount','','2017-03-31','16:58'),(344,0,'','/api/menus/v2','','2017-03-31','16:58'),(345,0,'','/api/apicall','self','2017-03-31','16:58'),(346,0,'','/api/datacenter','self','2017-03-31','16:58'),(347,0,'','/api/change','self','2017-03-31','16:58'),(348,0,'','/api/dashboard/countByMonth','self','2017-03-31','16:58'),(349,0,'','/api/dashboard/count','self','2017-03-31','16:58'),(350,0,'','/api/dashboard/device','self','2017-03-31','16:58'),(351,0,'','/api/dashboard/uposition','self','2017-03-31','16:58'),(352,0,'','/api/user','self','2017-03-31','16:58'),(353,0,'','/api/SyncVcenter','self','2017-03-31','16:58'),(354,0,'','/api/SyncVcenter','self','2017-03-31','17:0'),(355,0,'','/api/ResourcePlatformAccount','self','2017-03-31','17:0'),(356,0,'','/api/menus/v2','','2017-03-31','17:15'),(357,0,'','/api/ResourcePlatformAccount','','2017-03-31','17:15'),(358,0,'','/api/menus','','2017-03-31','17:15'),(359,0,'','/api/apicall','self','2017-03-31','17:15'),(360,0,'','/api/change','self','2017-03-31','17:15'),(361,0,'','/api/datacenter','self','2017-03-31','17:15'),(362,0,'','/api/dashboard/count','self','2017-03-31','17:15'),(363,0,'','/api/dashboard/countByMonth','self','2017-03-31','17:15'),(364,0,'','/api/dashboard/uposition','self','2017-03-31','17:15'),(365,0,'','/api/dashboard/device','self','2017-03-31','17:15'),(366,0,'','/api/user','self','2017-03-31','17:15'),(367,0,'','/api/SyncVcenter','self','2017-03-31','17:15'),(368,0,'','/api/change','self','2017-03-31','17:34'),(369,0,'','/api/datacenter','self','2017-03-31','17:34'),(370,0,'','/api/menus','self','2017-03-31','17:34'),(371,0,'','/api/apicall','self','2017-03-31','17:34'),(372,0,'','/api/dashboard/count','self','2017-03-31','17:34'),(373,0,'','/api/dashboard/countByMonth','self','2017-03-31','17:34'),(374,0,'','/api/dashboard/device','self','2017-03-31','17:34'),(375,0,'','/api/dashboard/uposition','self','2017-03-31','17:34'),(376,0,'','/api/menus/v2','self','2017-03-31','17:34'),(377,0,'','/api/user','self','2017-03-31','17:34'),(378,0,'','/api/ResourcePlatformAccount','self','2017-03-31','17:34'),(379,0,'','/api/SyncVcenter','self','2017-03-31','17:34'),(380,0,'','/api/SyncVcenter','self','2017-03-31','17:35'),(381,0,'','/api/ResourcePlatformAccount','self','2017-03-31','17:35'),(382,0,'','/api/dashboard/countByMonth','self','2017-03-31','17:57'),(383,0,'','/api/apicall','self','2017-03-31','17:57'),(384,0,'','/api/change','self','2017-03-31','17:57'),(385,0,'','/api/menus','self','2017-03-31','17:57'),(386,0,'','/api/datacenter','self','2017-03-31','17:57'),(387,0,'','/api/dashboard/count','self','2017-03-31','17:57'),(388,0,'','/api/dashboard/uposition','self','2017-03-31','17:57'),(389,0,'','/api/dashboard/device','self','2017-03-31','17:57'),(390,0,'','/api/user','self','2017-03-31','17:57'),(391,0,'','/api/menus/v2','self','2017-03-31','17:57'),(392,0,'','/api/ResourcePlatformAccount','self','2017-03-31','17:58'),(393,0,'','/api/SyncVcenter','self','2017-03-31','17:58'),(394,0,'','/api/menus/v2','','2017-03-31','17:59'),(395,0,'','/api/menus','','2017-03-31','17:59'),(396,0,'','/api/ResourcePlatformAccount','','2017-03-31','17:59'),(397,0,'','/api/apicall','self','2017-03-31','17:59'),(398,0,'','/api/dashboard/countByMonth','self','2017-03-31','17:59'),(399,0,'','/api/change','self','2017-03-31','17:59'),(400,0,'','/api/datacenter','self','2017-03-31','17:59'),(401,0,'','/api/dashboard/count','self','2017-03-31','17:59'),(402,0,'','/api/dashboard/uposition','self','2017-03-31','17:59'),(403,0,'','/api/dashboard/device','self','2017-03-31','17:59'),(404,0,'','/api/assets','self','2017-03-31','17:59'),(405,0,'','/api/user','self','2017-03-31','17:59'),(406,0,'','/api/SyncVcenter','self','2017-03-31','17:59'),(407,0,'','/api/ResourcePlatformAccount','','2017-03-31','18:1'),(408,0,'','/api/menus','','2017-03-31','18:1'),(409,0,'','/api/menus/v2','','2017-03-31','18:1'),(410,0,'','/api/change','self','2017-03-31','18:1'),(411,0,'','/api/dashboard/count','self','2017-03-31','18:1'),(412,0,'','/api/dashboard/countByMonth','self','2017-03-31','18:1'),(413,0,'','/api/datacenter','self','2017-03-31','18:1'),(414,0,'','/api/apicall','self','2017-03-31','18:1'),(415,0,'','/api/dashboard/uposition','self','2017-03-31','18:1'),(416,0,'','/api/dashboard/device','self','2017-03-31','18:1'),(417,0,'','/api/assets','self','2017-03-31','18:1'),(418,0,'','/api/user','self','2017-03-31','18:1'),(419,0,'','/api/SyncVcenter','self','2017-03-31','18:2'),(420,0,'','/api/ResourcePlatformAccount','self','2017-03-31','18:2'),(421,0,'','/api/apicall','self','2017-03-31','18:4'),(422,0,'','/api/menus','self','2017-03-31','18:4'),(423,0,'','/api/dashboard/countByMonth','self','2017-03-31','18:4'),(424,0,'','/api/datacenter','self','2017-03-31','18:4'),(425,0,'','/api/change','self','2017-03-31','18:4'),(426,0,'','/api/dashboard/count','self','2017-03-31','18:4'),(427,0,'','/api/dashboard/uposition','self','2017-03-31','18:4'),(428,0,'','/api/dashboard/device','self','2017-03-31','18:4'),(429,0,'','/api/user','self','2017-03-31','18:4'),(430,0,'','/api/menus/v2','self','2017-03-31','18:4'),(431,0,'','/api/ResourcePlatformAccount','self','2017-03-31','18:4'),(432,0,'','/api/SyncVcenter','self','2017-03-31','18:4'),(433,0,'','/api/SyncVcenter','self','2017-03-31','18:6'),(434,0,'','/api/ResourcePlatformAccount','self','2017-03-31','18:6'),(435,0,'','/api/menus/v2','self','2017-03-31','18:6'),(436,0,'','/api/menus','self','2017-03-31','18:6'),(437,0,'','/api/ResourcePlatformAccount','self','2017-03-31','18:7'),(438,0,'','/api/SyncVcenter','self','2017-03-31','18:7'),(439,0,'','/api/menus/v2','self','2017-03-31','18:11'),(440,0,'','/api/ResourcePlatformAccount','self','2017-03-31','18:11'),(441,0,'','/api/menus','self','2017-03-31','18:11'),(442,0,'','/api/SyncVcenter','self','2017-03-31','18:11'),(443,0,'','/api/assets','self','2017-03-31','18:13'),(444,0,'','/api/menus/v2','self','2017-03-31','18:14'),(445,0,'','/api/subnet','self','2017-03-31','18:14'),(446,0,'','/api/subnet','self','2017-03-31','18:33'),(447,0,'','/api/app','self','2017-03-31','18:33'),(448,0,'','/api/app/level','self','2017-03-31','18:33'),(449,0,'','/api/app','self','2017-03-31','18:39'),(450,0,'','/api/menus','self','2017-03-31','18:39'),(451,0,'','/api/assets','self','2017-03-31','18:39'),(452,0,'','/api/app/level','self','2017-03-31','18:39'),(453,0,'','/api/menus/v2','self','2017-03-31','18:39'),(454,0,'','/api/subnet','self','2017-03-31','18:39'),(455,0,'','/api/subnet','self','2017-03-31','18:40'),(456,0,'','/api/ip','self','2017-03-31','18:40'),(457,0,'','/api/ip/monitor','self','2017-03-31','18:40'),(458,0,'','/api/ip/monitor','self','2017-03-31','18:41'),(459,0,'','/api/ip/monitor','self','2017-03-31','18:42'),(460,0,'','/api/ip/monitor','self','2017-03-31','18:43'),(461,0,'','/api/ip','self','2017-03-31','18:43'),(462,0,'','/api/ip/monitor','self','2017-03-31','18:44'),(463,0,'','/api/ip','self','2017-03-31','18:44'),(464,0,'','/api/ip/monitor','self','2017-03-31','18:45'),(465,0,'','/api/ip/monitor','self','2017-03-31','18:46'),(466,0,'','/api/ip/monitor','self','2017-03-31','18:47'),(467,0,'','/api/ip/monitor','self','2017-03-31','18:48'),(468,0,'','/api/ip/monitor','self','2017-03-31','18:49'),(469,0,'','/api/ip/monitor','self','2017-03-31','18:50'),(470,0,'','/api/ip/monitor','self','2017-03-31','18:51'),(471,0,'','/api/ip/monitor','self','2017-03-31','18:52'),(472,0,'','/api/ip/monitor','self','2017-03-31','18:53'),(473,0,'','/api/ip/monitor','self','2017-03-31','18:54'),(474,0,'','/api/ip/monitor','self','2017-03-31','18:55'),(475,0,'','/api/ip/monitor','self','2017-03-31','18:56'),(476,0,'','/api/ip/monitor','self','2017-03-31','18:57'),(477,0,'','/api/assets','self','2017-03-31','18:57'),(478,0,'','/api/menus/v2','self','2017-03-31','18:57'),(479,0,'','/api/room','self','2017-03-31','18:57'),(480,0,'','/api/ip/monitor','self','2017-03-31','18:58'),(481,0,'','/api/state/room','self','2017-03-31','18:58'),(482,0,'','/api/datacenter','self','2017-03-31','18:58'),(483,0,'','/api/datacenter','self','2017-03-31','18:58'),(484,0,'','/api/ip/monitor','self','2017-03-31','18:59'),(485,0,'','/api/ip/monitor','self','2017-03-31','19:0'),(486,0,'','/api/ip/monitor','self','2017-03-31','19:1'),(487,0,'','/api/ip/monitor','self','2017-03-31','19:2'),(488,0,'','/api/ip/monitor','self','2017-03-31','19:3'),(489,0,'','/api/assets','self','2017-03-31','19:3'),(490,0,'','/api/menus/v2','self','2017-03-31','19:3'),(491,0,'','/api/subnet','self','2017-03-31','19:3'),(492,0,'','/api/ip/monitor','self','2017-03-31','19:4'),(493,0,'','/api/ip/monitor','self','2017-03-31','19:5'),(494,0,'','/api/ip/monitor','self','2017-03-31','19:6'),(495,0,'','/api/ip/monitor','self','2017-03-31','19:7'),(496,0,'','/api/subnet','self','2017-03-31','19:7'),(497,0,'','/api/ip','self','2017-03-31','19:7'),(498,0,'','/api/ip','self','2017-03-31','19:8'),(499,0,'','/api/ip/monitor','self','2017-03-31','19:8'),(500,0,'','/api/ip/monitor','self','2017-03-31','19:9'),(501,0,'','/api/ip','self','2017-03-31','19:9'),(502,0,'','/api/assets','self','2017-03-31','19:9'),(503,0,'','/api/ip/monitor','self','2017-03-31','19:10'),(504,0,'','/api/menus/v2','self','2017-03-31','19:10'),(505,0,'','/api/subnet','self','2017-03-31','19:10'),(506,0,'','/api/ip','self','2017-03-31','19:10'),(507,0,'','/api/assets','self','2017-03-31','19:10'),(508,0,'','/api/ip/monitor','self','2017-03-31','19:11'),(509,0,'','/api/ip/monitor','self','2017-03-31','19:12'),(510,0,'','/api/ip/monitor','self','2017-03-31','19:13'),(511,0,'','/api/ip','self','2017-03-31','19:13'),(512,0,'','/api/subnet','self','2017-03-31','19:13'),(513,0,'','/api/ip/monitor','self','2017-03-31','19:14'),(514,0,'','/api/ip/monitor','self','2017-03-31','19:15'),(515,0,'','/api/ip/monitor','self','2017-03-31','19:16'),(516,0,'','/api/subnet','self','2017-03-31','19:16'),(517,0,'','/api/menus','self','2017-03-31','19:16'),(518,0,'','/api/ip','self','2017-03-31','19:16'),(519,0,'','/api/ip/monitor','self','2017-03-31','19:17'),(520,0,'','/api/ip/monitor','self','2017-03-31','19:18'),(521,0,'','/api/subnet','self','2017-03-31','19:18'),(522,0,'','/api/menus','self','2017-03-31','19:18'),(523,0,'','/api/ip','self','2017-03-31','19:18'),(524,0,'','/api/subnet','self','2017-03-31','19:19'),(525,0,'','/api/menus','self','2017-03-31','19:19'),(526,0,'','/api/ip','self','2017-03-31','19:19'),(527,0,'','/api/ip/monitor','self','2017-03-31','19:19'),(528,0,'','/api/ip/monitor','self','2017-03-31','19:20'),(529,0,'','/api/ip/monitor','self','2017-03-31','19:21'),(530,0,'','/api/subnet','self','2017-03-31','19:21'),(531,0,'','/api/menus','self','2017-03-31','19:21'),(532,0,'','/api/ip','self','2017-03-31','19:21'),(533,0,'','/api/ip/monitor','self','2017-03-31','19:22'),(534,0,'','/api/ip/monitor','self','2017-03-31','19:23'),(535,0,'','/api/menus','self','2017-03-31','19:24'),(536,0,'','/api/subnet','self','2017-03-31','19:24'),(537,0,'','/api/ip','self','2017-03-31','19:24'),(538,0,'','/api/ip/monitor','self','2017-03-31','19:24'),(539,0,'','/api/ip/monitor','self','2017-03-31','19:25'),(540,0,'','/api/ip','self','2017-03-31','19:25'),(541,0,'','/api/subnet','self','2017-03-31','19:25'),(542,0,'','/api/menus','self','2017-03-31','19:25'),(543,0,'','/api/ip/monitor','self','2017-03-31','19:26'),(544,0,'','/api/menus','self','2017-03-31','19:26'),(545,0,'','/api/subnet','self','2017-03-31','19:26'),(546,0,'','/api/ip','self','2017-03-31','19:26'),(547,0,'','/api/ip/monitor','self','2017-03-31','19:27'),(548,0,'','/api/ip/monitor','self','2017-03-31','19:28'),(549,0,'','/api/subnet','self','2017-03-31','19:28'),(550,0,'','/api/menus','self','2017-03-31','19:28'),(551,0,'','/api/ip','self','2017-03-31','19:28'),(552,0,'','/api/ip/monitor','self','2017-03-31','19:29'),(553,0,'','/api/subnet','self','2017-03-31','19:29'),(554,0,'','/api/menus','self','2017-03-31','19:29'),(555,0,'','/api/ip','self','2017-03-31','19:29'),(556,0,'','/api/ip/monitor','self','2017-03-31','19:30'),(557,0,'','/api/ip','self','2017-03-31','19:30'),(558,0,'','/api/ip/monitor','self','2017-03-31','19:31'),(559,0,'','/api/ip/monitor','self','2017-03-31','19:32'),(560,0,'','/api/ip/monitor','self','2017-03-31','19:33'),(561,0,'','/api/ip/monitor','self','2017-03-31','19:34'),(562,0,'','/api/ip/monitor','self','2017-03-31','19:35'),(563,0,'','/api/ip/monitor','self','2017-03-31','19:36'),(564,0,'','/api/ip/monitor','self','2017-03-31','19:37'),(565,0,'','/api/ip/monitor','self','2017-03-31','19:38'),(566,0,'','/api/ip/monitor','self','2017-03-31','19:39'),(567,0,'','/api/ip/monitor','self','2017-03-31','19:40'),(568,0,'','/api/ip/monitor','self','2017-03-31','19:41'),(569,0,'','/api/ip/monitor','self','2017-03-31','19:42'),(570,0,'','/api/ip/monitor','self','2017-03-31','19:43'),(571,0,'','/api/ip/monitor','self','2017-03-31','19:44'),(572,0,'','/api/subnet','self','2017-03-31','19:44'),(573,0,'','/api/menus','self','2017-03-31','19:44'),(574,0,'','/api/ip','self','2017-03-31','19:44'),(575,0,'','/api/menus','self','2017-03-31','19:45'),(576,0,'','/api/dashboard/countByMonth','self','2017-03-31','19:45'),(577,0,'','/api/apicall','self','2017-03-31','19:45'),(578,0,'','/api/dashboard/count','self','2017-03-31','19:45'),(579,0,'','/api/change','self','2017-03-31','19:45'),(580,0,'','/api/datacenter','self','2017-03-31','19:45'),(581,0,'','/api/dashboard/uposition','self','2017-03-31','19:45'),(582,0,'','/api/dashboard/device','self','2017-03-31','19:45'),(583,0,'','/api/assets','self','2017-03-31','19:45'),(584,0,'','/api/menus/v2','self','2017-03-31','19:45'),(585,0,'','/api/subnet','self','2017-03-31','19:45'),(586,0,'','/api/ip','self','2017-03-31','19:45'),(587,0,'','/api/ip/monitor','self','2017-03-31','19:45'),(588,0,'','/api/ip/monitor','self','2017-03-31','19:46'),(589,0,'','/api/ip/monitor','self','2017-03-31','19:47'),(590,0,'','/api/ip/monitor','self','2017-03-31','19:48'),(591,0,'','/api/dashboard/countByMonth','self','2017-04-01','9:38'),(592,0,'','/api/datacenter','self','2017-04-01','9:38'),(593,0,'','/api/dashboard/count','self','2017-04-01','9:38'),(594,0,'','/api/menus','self','2017-04-01','9:38'),(595,0,'','/api/change','self','2017-04-01','9:38'),(596,0,'','/api/apicall','self','2017-04-01','9:38'),(597,0,'','/api/dashboard/uposition','self','2017-04-01','9:38'),(598,0,'','/api/dashboard/device','self','2017-04-01','9:38'),(599,0,'','/api/user','self','2017-04-01','9:40'),(600,0,'','/api/menus/v2','self','2017-04-01','9:40'),(601,0,'','/api/ResourcePlatformAccount','self','2017-04-01','9:40'),(602,0,'','/api/SyncVcenter','self','2017-04-01','9:40'),(603,0,'','/api/dashboard/count','self','2017-04-01','9:57'),(604,0,'','/api/change','self','2017-04-01','9:57'),(605,0,'','/api/menus','self','2017-04-01','9:57'),(606,0,'','/api/datacenter','self','2017-04-01','9:57'),(607,0,'','/api/dashboard/countByMonth','self','2017-04-01','9:57'),(608,0,'','/api/apicall','self','2017-04-01','9:57'),(609,0,'','/api/dashboard/device','self','2017-04-01','9:57'),(610,0,'','/api/dashboard/uposition','self','2017-04-01','9:57'),(611,0,'','/api/assets','self','2017-04-01','9:57'),(612,0,'','/api/menus/v2','self','2017-04-01','9:58'),(613,0,'','/api/subnet','self','2017-04-01','9:58'),(614,0,'','/api/ip','self','2017-04-01','9:58'),(615,0,'','/api/ip/monitor','self','2017-04-01','9:58'),(616,0,'','/api/assets','self','2017-04-01','9:58'),(617,0,'','/api/ip/monitor','self','2017-04-01','9:59'),(618,0,'','/api/user','self','2017-04-01','9:59'),(619,0,'','/api/menus/v2','self','2017-04-01','9:59'),(620,0,'','/api/role','self','2017-04-01','9:59'),(621,0,'','/api/ResourcePlatformAccount','self','2017-04-01','9:59'),(622,0,'','/api/systemlog','self','2017-04-01','9:59'),(623,0,'','/api/accesskey','self','2017-04-01','9:59'),(624,0,'','/api/assets','self','2017-04-01','9:59'),(625,0,'','/api/subnet','self','2017-04-01','9:59'),(626,0,'','/api/dnspoddomain','self','2017-04-01','9:59'),(627,0,'','/api/state/dnspoddomain','self','2017-04-01','9:59'),(628,0,'','/api/dnspoddomain/grade','self','2017-04-01','9:59'),(629,0,'','/api/app/level','self','2017-04-01','9:59'),(630,0,'','/api/app','self','2017-04-01','9:59'),(631,0,'','/api/vcenter','self','2017-04-01','9:59'),(632,0,'','/api/aliyun','self','2017-04-01','9:59'),(633,0,'','/api/aws','self','2017-04-01','9:59'),(634,0,'','/api/supplier','self','2017-04-01','9:59'),(635,0,'','/api/ip','self','2017-04-01','9:59'),(636,0,'','/api/ip/monitor','self','2017-04-01','10:0'),(637,0,'','/api/ip/monitor','self','2017-04-01','10:1'),(638,0,'','/api/ip/monitor','self','2017-04-01','10:2'),(639,0,'','/api/ip/monitor','self','2017-04-01','10:3'),(640,0,'','/api/ip/monitor','self','2017-04-01','10:4'),(641,0,'','/api/subnet','self','2017-04-01','10:4'),(642,0,'','/api/menus','self','2017-04-01','10:4'),(643,0,'','/api/ip','self','2017-04-01','10:4'),(644,0,'','/api/ip/monitor','self','2017-04-01','10:5'),(645,0,'','/api/ip/monitor','self','2017-04-01','10:6'),(646,0,'','/api/menus','self','2017-04-01','10:6'),(647,0,'','/api/subnet','self','2017-04-01','10:6'),(648,0,'','/api/ip','self','2017-04-01','10:6'),(649,0,'','/api/assets','self','2017-04-01','10:6'),(650,0,'','/api/menus/v2','self','2017-04-01','10:6'),(651,0,'','/api/ip/monitor','self','2017-04-01','10:7'),(652,0,'','/api/ip/monitor','self','2017-04-01','10:8'),(653,0,'','/api/subnet','self','2017-04-01','10:8'),(654,0,'','/api/menus','self','2017-04-01','10:8'),(655,0,'','/api/ip','self','2017-04-01','10:8'),(656,0,'','/api/ip/monitor','self','2017-04-01','10:9'),(657,0,'','/api/menus','self','2017-04-01','10:9'),(658,0,'','/api/subnet','self','2017-04-01','10:9'),(659,0,'','/api/ip','self','2017-04-01','10:9'),(660,0,'','/api/assets','self','2017-04-01','10:9'),(661,0,'','/api/menus/v2','self','2017-04-01','10:9'),(662,0,'','/api/ip/monitor','self','2017-04-01','10:10'),(663,0,'','/api/ip/monitor','self','2017-04-01','10:11'),(664,0,'','/api/ip/monitor','self','2017-04-01','10:12'),(665,0,'','/api/ip/monitor','self','2017-04-01','10:13'),(666,0,'','/api/ip/monitor','self','2017-04-01','10:14'),(667,0,'','/api/ip/monitor','self','2017-04-01','10:15'),(668,0,'','/api/menus','self','2017-04-01','10:15'),(669,0,'','/api/subnet','self','2017-04-01','10:15'),(670,0,'','/api/ip','self','2017-04-01','10:15'),(671,0,'','/api/ip/monitor','self','2017-04-01','10:16'),(672,0,'','/api/ip/monitor','self','2017-04-01','10:17'),(673,0,'','/api/ip/monitor','self','2017-04-01','10:18'),(674,0,'','/api/menus','self','2017-04-01','10:18'),(675,0,'','/api/subnet','self','2017-04-01','10:18'),(676,0,'','/api/ip','self','2017-04-01','10:18'),(677,0,'','/api/ip/monitor','self','2017-04-01','10:19'),(678,0,'','/api/ip/monitor','self','2017-04-01','10:20'),(679,0,'','/api/server','self','2017-04-01','10:20'),(680,0,'','/api/state/server','self','2017-04-01','10:20'),(681,0,'','/api/server/manufacturer','self','2017-04-01','10:20'),(682,0,'','/api/app','self','2017-04-01','10:20'),(683,0,'','/api/rack','self','2017-04-01','10:20'),(684,0,'','/api/supplier','self','2017-04-01','10:20'),(685,0,'','/api/server/host','self','2017-04-01','10:20'),(686,0,'','/api/statecolor','self','2017-04-01','10:20'),(687,0,'','/api/assets','self','2017-04-01','10:20'),(688,0,'','/api/ip/monitor','self','2017-04-01','10:21'),(689,0,'','/api/ip/monitor','self','2017-04-01','10:22'),(690,0,'','/api/ip/monitor','self','2017-04-01','10:23'),(691,0,'','/api/menus','self','2017-04-01','10:23'),(692,0,'','/api/subnet','self','2017-04-01','10:23'),(693,0,'','/api/ip','self','2017-04-01','10:23'),(694,0,'','/api/ip/monitor','self','2017-04-01','10:24'),(695,0,'','/api/ip/monitor','self','2017-04-01','10:25'),(696,0,'','/api/ip/monitor','self','2017-04-01','10:26'),(697,0,'','/api/menus','self','2017-04-01','10:26'),(698,0,'','/api/subnet','self','2017-04-01','10:26'),(699,0,'','/api/ip','self','2017-04-01','10:26'),(700,0,'','/api/ip/monitor','self','2017-04-01','10:27'),(701,0,'','/api/ip/monitor','self','2017-04-01','10:28'),(702,0,'','/api/menus','self','2017-04-01','10:28'),(703,0,'','/api/subnet','self','2017-04-01','10:28'),(704,0,'','/api/ip','self','2017-04-01','10:28'),(705,0,'','/api/ip/monitor','self','2017-04-01','10:29'),(706,0,'','/api/ip/monitor','self','2017-04-01','10:30'),(707,0,'','/api/ip/monitor','self','2017-04-01','10:31'),(708,0,'','/api/ip/monitor','self','2017-04-01','10:32'),(709,0,'','/api/menus/v2','self','2017-04-01','10:32'),(710,0,'','/api/subnet','self','2017-04-01','10:32'),(711,0,'','/api/ip/monitor','self','2017-04-01','10:33'),(712,0,'','/api/menus','self','2017-04-01','10:33'),(713,0,'','/api/subnet','self','2017-04-01','10:33'),(714,0,'','/api/assets','self','2017-04-01','10:33'),(715,0,'','/api/menus/v2','self','2017-04-01','10:33'),(716,0,'','/api/ip/monitor','self','2017-04-01','10:34'),(717,0,'','/api/menus','self','2017-04-01','10:34'),(718,0,'','/api/ip','self','2017-04-01','10:34'),(719,0,'','/api/subnet','self','2017-04-01','10:34'),(720,0,'','/api/ip/monitor','self','2017-04-01','10:35'),(721,0,'','/api/assets','self','2017-04-01','10:35'),(722,0,'','/api/menus/v2','self','2017-04-01','10:35'),(723,0,'','/api/subnet','self','2017-04-01','10:35'),(724,0,'','/api/ip/monitor','self','2017-04-01','10:36'),(725,0,'','/api/ip/monitor','self','2017-04-01','10:37'),(726,0,'','/api/ip/monitor','self','2017-04-01','10:38'),(727,0,'','/api/ip/monitor','self','2017-04-01','10:39'),(728,0,'','/api/ip/monitor','self','2017-04-01','10:40'),(729,0,'','/api/ip/monitor','self','2017-04-01','10:41'),(730,0,'','/api/ip/monitor','self','2017-04-01','10:42'),(731,0,'','/api/ip/monitor','self','2017-04-01','10:43'),(732,0,'','/api/subnet','self','2017-04-01','10:58'),(733,0,'','/api/menus','self','2017-04-01','10:58'),(734,0,'','/api/subnet','self','2017-04-01','10:58'),(735,0,'','/api/assets','self','2017-04-01','10:58'),(736,0,'','/api/menus/v2','self','2017-04-01','10:58'),(737,0,'','/api/subnet','self','2017-04-01','10:58'),(738,0,'','/api/subnet','self','2017-04-01','10:58'),(739,0,'','/api/subnet','self','2017-04-01','10:58'),(740,0,'','/api/ip','self','2017-04-01','10:58'),(741,0,'','/api/ip/monitor','self','2017-04-01','10:58'),(742,0,'','/api/subnet','self','2017-04-01','10:58'),(743,0,'','/api/menus','self','2017-04-01','10:59'),(744,0,'','/api/subnet','self','2017-04-01','10:59'),(745,0,'','/api/ip','self','2017-04-01','10:59'),(746,0,'','/api/ip/monitor','self','2017-04-01','10:59'),(747,0,'','/api/ip/monitor','self','2017-04-01','11:0'),(748,0,'','/api/menus','self','2017-04-01','11:0'),(749,0,'','/api/subnet','self','2017-04-01','11:0'),(750,0,'','/api/ip','self','2017-04-01','11:0'),(751,0,'','/api/subnet','self','2017-04-01','11:1'),(752,0,'','/api/menus','self','2017-04-01','11:1'),(753,0,'','/api/ip','self','2017-04-01','11:1'),(754,0,'','/api/ip/monitor','self','2017-04-01','11:1'),(755,0,'','/api/ip/monitor','self','2017-04-01','11:2'),(756,0,'','/api/menus','self','2017-04-01','11:2'),(757,0,'','/api/subnet','self','2017-04-01','11:2'),(758,0,'','/api/ip','self','2017-04-01','11:2'),(759,0,'','/api/ip/monitor','self','2017-04-01','11:3'),(760,0,'','/api/ip','self','2017-04-01','11:3'),(761,0,'','/api/ip/monitor','self','2017-04-01','11:4'),(762,0,'','/api/ip','self','2017-04-01','11:4'),(763,0,'','/api/ip/monitor','self','2017-04-01','11:5'),(764,0,'','/api/assets','self','2017-04-01','11:5'),(765,0,'','/api/menus/v2','self','2017-04-01','11:5'),(766,0,'','/api/room','self','2017-04-01','11:5'),(767,0,'','/api/subnet','self','2017-04-01','11:5'),(768,0,'','/api/ip','self','2017-04-01','11:5'),(769,0,'','/api/ip/monitor','self','2017-04-01','11:6'),(770,0,'','/api/ip/monitor','self','2017-04-01','11:7'),(771,0,'','/api/ip/monitor','self','2017-04-01','11:8'),(772,0,'','/api/ip/monitor','self','2017-04-01','11:9'),(773,0,'','/api/dashboard/countByMonth','self','2017-04-01','11:9'),(774,0,'','/api/dashboard/count','self','2017-04-01','11:9'),(775,0,'','/api/datacenter','self','2017-04-01','11:9'),(776,0,'','/api/apicall','self','2017-04-01','11:9'),(777,0,'','/api/menus','self','2017-04-01','11:9'),(778,0,'','/api/change','self','2017-04-01','11:9'),(779,0,'','/api/dashboard/device','self','2017-04-01','11:9'),(780,0,'','/api/dashboard/uposition','self','2017-04-01','11:9'),(781,0,'','/api/assets','self','2017-04-01','11:9'),(782,0,'','/api/menus/v2','self','2017-04-01','11:9'),(783,0,'','/api/subnet','self','2017-04-01','11:9'),(784,0,'','/api/ip','self','2017-04-01','11:9'),(785,0,'','/api/assets','self','2017-04-01','11:10'),(786,0,'','/api/ip/monitor','self','2017-04-01','11:10'),(787,0,'','/api/menus/v2','self','2017-04-01','11:10'),(788,0,'','/api/subnet','self','2017-04-01','11:10'),(789,0,'','/api/ip','self','2017-04-01','11:10'),(790,0,'','/api/menus','self','2017-04-01','11:10'),(791,0,'','/api/ip/monitor','self','2017-04-01','11:11'),(792,0,'','/api/ip','self','2017-04-01','11:11'),(793,0,'','/api/ip/monitor','self','2017-04-01','11:12'),(794,0,'','/api/assets','self','2017-04-01','11:12'),(795,0,'','/api/menus/v2','self','2017-04-01','11:12'),(796,0,'','/api/dnspoddomain/grade','self','2017-04-01','11:12'),(797,0,'','/api/state/dnspoddomain','self','2017-04-01','11:12'),(798,0,'','/api/dnspoddomain','self','2017-04-01','11:12'),(799,0,'','/api/subnet','self','2017-04-01','11:12'),(800,0,'','/api/ip','self','2017-04-01','11:12'),(801,0,'','/api/ip/monitor','self','2017-04-01','11:13'),(802,0,'','/api/ip/monitor','self','2017-04-01','11:14'),(803,0,'','/api/ip/monitor','self','2017-04-01','11:15'),(804,0,'','/api/subnet','self','2017-04-01','11:15'),(805,0,'','/api/ip','self','2017-04-01','11:15'),(806,0,'','/api/ip/monitor','self','2017-04-01','11:16'),(807,0,'','/api/subnet','self','2017-04-01','11:16'),(808,0,'','/api/ip/monitor','self','2017-04-01','11:17'),(809,0,'','/api/ip/monitor','self','2017-04-01','11:18'),(810,0,'','/api/ip/monitor','self','2017-04-01','11:19'),(811,0,'','/api/ip/monitor','self','2017-04-01','11:20'),(812,0,'','/api/ip/monitor','self','2017-04-01','11:21'),(813,0,'','/api/ip/monitor','self','2017-04-01','11:22'),(814,0,'','/api/ip/monitor','self','2017-04-01','11:23'),(815,0,'','/api/menus','self','2017-04-01','11:23'),(816,0,'','/api/subnet','self','2017-04-01','11:23'),(817,0,'','/api/assets','self','2017-04-01','11:23'),(818,0,'','/api/menus/v2','self','2017-04-01','11:23'),(819,0,'','/api/subnet','self','2017-04-01','11:24'),(820,0,'','/api/menus','self','2017-04-01','11:24'),(821,0,'','/api/assets','self','2017-04-01','11:24'),(822,0,'','/api/menus/v2','self','2017-04-01','11:24'),(823,0,'','/api/menus','self','2017-04-01','11:28'),(824,0,'','/api/subnet','self','2017-04-01','11:28'),(825,0,'','/api/assets','self','2017-04-01','11:28'),(826,0,'','/api/menus/v2','self','2017-04-01','11:28'),(827,0,'','/api/subnet','self','2017-04-01','11:29'),(828,0,'','/api/menus','self','2017-04-01','11:29'),(829,0,'','/api/assets','self','2017-04-01','11:29'),(830,0,'','/api/menus/v2','self','2017-04-01','11:29'),(831,0,'','/api/subnet','self','2017-04-01','11:31'),(832,0,'','/api/menus','self','2017-04-01','11:31'),(833,0,'','/api/assets','self','2017-04-01','11:31'),(834,0,'','/api/menus/v2','self','2017-04-01','11:31'),(835,0,'','/api/datacenter','self','2017-04-01','12:23'),(836,0,'','/api/menus','self','2017-04-01','12:23'),(837,0,'','/api/dashboard/count','self','2017-04-01','12:23'),(838,0,'','/api/change','self','2017-04-01','12:23'),(839,0,'','/api/apicall','self','2017-04-01','12:23'),(840,0,'','/api/dashboard/countByMonth','self','2017-04-01','12:23'),(841,0,'','/api/dashboard/uposition','self','2017-04-01','12:23'),(842,0,'','/api/dashboard/device','self','2017-04-01','12:23'),(843,0,'','/api/assets','self','2017-04-01','12:23'),(844,0,'','/api/subnet','self','2017-04-01','12:24'),(845,0,'','/api/ip','self','2017-04-01','12:24'),(846,0,'','/api/ip/monitor','self','2017-04-01','12:24'),(847,0,'','/api/ip/monitor','self','2017-04-01','12:25'),(848,0,'','/api/ip/monitor','self','2017-04-01','12:26'),(849,0,'','/api/ip/monitor','self','2017-04-01','12:27'),(850,0,'','/api/ip/monitor','self','2017-04-01','12:28'),(851,0,'','/api/menus','self','2017-04-01','12:28'),(852,0,'','/api/datacenter','self','2017-04-01','12:28'),(853,0,'','/api/dashboard/count','self','2017-04-01','12:28'),(854,0,'','/api/dashboard/countByMonth','self','2017-04-01','12:28'),(855,0,'','/api/apicall','self','2017-04-01','12:28'),(856,0,'','/api/change','self','2017-04-01','12:28'),(857,0,'','/api/dashboard/device','self','2017-04-01','12:28'),(858,0,'','/api/dashboard/uposition','self','2017-04-01','12:28'),(859,0,'','/api/ip/monitor','self','2017-04-01','12:29'),(860,0,'','/api/assets','self','2017-04-01','12:29'),(861,0,'','/api/ip/monitor','self','2017-04-01','12:30'),(862,0,'','/api/menus/v2','self','2017-04-01','12:30'),(863,0,'','/api/datacenter','self','2017-04-01','12:30'),(864,0,'','/api/room','self','2017-04-01','12:30'),(865,0,'','/api/state/room','self','2017-04-01','12:30'),(866,0,'','/api/rack','self','2017-04-01','12:30'),(867,0,'','/api/networkbandwidth','self','2017-04-01','12:30'),(868,0,'','/api/hardware','self','2017-04-01','12:30'),(869,0,'','/api/ip/monitor','self','2017-04-01','12:31'),(870,0,'','/api/server','self','2017-04-01','12:31'),(871,0,'','/api/supplier','self','2017-04-01','12:31'),(872,0,'','/api/state/server','self','2017-04-01','12:31'),(873,0,'','/api/server/manufacturer','self','2017-04-01','12:31'),(874,0,'','/api/server/host','self','2017-04-01','12:31'),(875,0,'','/api/rack','self','2017-04-01','12:31'),(876,0,'','/api/app','self','2017-04-01','12:32'),(877,0,'','/api/server/manufacturer','self','2017-04-01','12:32'),(878,0,'','/api/supplier','self','2017-04-01','12:32'),(879,0,'','/api/state/server','self','2017-04-01','12:32'),(880,0,'','/api/server/host','self','2017-04-01','12:32'),(881,0,'','/api/rack','self','2017-04-01','12:32'),(882,0,'','/api/statecolor','self','2017-04-01','12:32'),(883,0,'','/api/ip/monitor','self','2017-04-01','12:32'),(884,0,'','/api/ip/monitor','self','2017-04-01','12:33'),(885,0,'','/api/state/server','self','2017-04-01','12:33'),(886,0,'','/api/server/host','self','2017-04-01','12:33'),(887,0,'','/api/server/manufacturer','self','2017-04-01','12:33'),(888,0,'','/api/ip/monitor','self','2017-04-01','12:34'),(889,0,'','/api/server','self','2017-04-01','12:34'),(890,0,'','/api/state/server','self','2017-04-01','12:34'),(891,0,'','/api/server/manufacturer','self','2017-04-01','12:34'),(892,0,'','/api/supplier','self','2017-04-01','12:34'),(893,0,'','/api/server/host','self','2017-04-01','12:34'),(894,0,'','/api/rack','self','2017-04-01','12:34'),(895,0,'','/api/app','self','2017-04-01','12:34'),(896,0,'','/api/networkadapter/query','self','2017-04-01','12:34'),(897,0,'','/api/cpu/query','self','2017-04-01','12:34'),(898,0,'','/api/memory/query','self','2017-04-01','12:34'),(899,0,'','/api/ip/monitor','self','2017-04-01','12:35'),(900,0,'','/api/hardware','self','2017-04-01','12:35'),(901,0,'','/api/server','self','2017-04-01','12:35'),(902,0,'','/api/state/server','self','2017-04-01','12:35'),(903,0,'','/api/server/manufacturer','self','2017-04-01','12:35'),(904,0,'','/api/supplier','self','2017-04-01','12:35'),(905,0,'','/api/server/host','self','2017-04-01','12:35'),(906,0,'','/api/rack','self','2017-04-01','12:35'),(907,0,'','/api/app','self','2017-04-01','12:35'),(908,0,'','/api/memory/query','self','2017-04-01','12:35'),(909,0,'','/api/networkadapter/query','self','2017-04-01','12:35'),(910,0,'','/api/cpu/query','self','2017-04-01','12:35'),(911,0,'','/api/ip/monitor','self','2017-04-01','12:36'),(912,0,'','/api/vcenter','self','2017-04-01','12:36'),(913,0,'','/api/menus/v2','self','2017-04-01','12:36'),(914,0,'','/api/user','self','2017-04-01','12:36'),(915,0,'','/api/ResourcePlatformAccount','self','2017-04-01','12:36'),(916,0,'','/api/ip/monitor','self','2017-04-01','12:37'),(917,0,'','/api/ResourcePlatformAccount','self','2017-04-01','12:37'),(918,0,'','/api/systemlog','self','2017-04-01','12:37'),(919,0,'','/api/assets','self','2017-04-01','12:37'),(920,0,'','/api/menus/v2','self','2017-04-01','12:37'),(921,0,'','/api/vcenter','self','2017-04-01','12:37'),(922,0,'','/api/ip/monitor','self','2017-04-01','12:38'),(923,0,'','/api/ip/monitor','self','2017-04-01','12:39'),(924,0,'','/api/aliyun','self','2017-04-01','12:39'),(925,0,'','/api/aws','self','2017-04-01','12:39'),(926,0,'','/api/ip/monitor','self','2017-04-01','12:40'),(927,0,'','/api/supplier','self','2017-04-01','12:40'),(928,0,'','/api/assets','self','2017-04-01','12:40'),(929,0,'','/api/ip/monitor','self','2017-04-01','12:41'),(930,0,'','/api/menus/v2','self','2017-04-01','12:41'),(931,0,'','/api/subnet','self','2017-04-01','12:41'),(932,0,'','/api/dnspoddomain','self','2017-04-01','12:41'),(933,0,'','/api/dnspoddomain/grade','self','2017-04-01','12:41'),(934,0,'','/api/state/dnspoddomain','self','2017-04-01','12:41'),(935,0,'','/api/ip/monitor','self','2017-04-01','12:42'),(936,0,'','/api/ip/monitor','self','2017-04-01','12:43'),(937,0,'','/api/assets','self','2017-04-01','12:43'),(938,0,'','/api/menus/v2','self','2017-04-01','12:43'),(939,0,'','/api/server','self','2017-04-01','12:43'),(940,0,'','/api/rack','self','2017-04-01','12:43'),(941,0,'','/api/supplier','self','2017-04-01','12:43'),(942,0,'','/api/state/server','self','2017-04-01','12:43'),(943,0,'','/api/app','self','2017-04-01','12:43'),(944,0,'','/api/server/manufacturer','self','2017-04-01','12:43'),(945,0,'','/api/server/host','self','2017-04-01','12:43'),(946,0,'','/api/statecolor','self','2017-04-01','12:43'),(947,0,'','/api/ip/monitor','self','2017-04-01','12:44'),(948,0,'','/api/ip/monitor','self','2017-04-01','12:45'),(949,0,'','/api/ip/monitor','self','2017-04-01','12:46'),(950,0,'','/api/ip/monitor','self','2017-04-01','12:47'),(951,0,'','/api/ip/monitor','self','2017-04-01','12:48'),(952,0,'','/api/ip/monitor','self','2017-04-01','12:49'),(953,0,'','/api/assets','self','2017-04-01','12:49'),(954,0,'','/api/menus/v2','self','2017-04-01','12:49'),(955,0,'','/api/subnet','self','2017-04-01','12:49'),(956,0,'','/api/ip/monitor','self','2017-04-01','12:50'),(957,0,'','/api/ip/monitor','self','2017-04-01','12:51'),(958,0,'','/api/ip/monitor','self','2017-04-01','12:52'),(959,0,'','/api/menus','self','2017-04-01','12:52'),(960,0,'','/api/subnet','self','2017-04-01','12:52'),(961,0,'','/api/assets','self','2017-04-01','12:52'),(962,0,'','/api/menus/v2','self','2017-04-01','12:52'),(963,0,'','/api/subnet','self','2017-04-01','12:53'),(964,0,'','/api/menus','self','2017-04-01','12:53'),(965,0,'','/api/assets','self','2017-04-01','12:53'),(966,0,'','/api/menus/v2','self','2017-04-01','12:53'),(967,0,'','/api/menus','self','2017-04-01','12:56'),(968,0,'','/api/menus/v2','self','2017-04-01','12:56'),(969,0,'','/api/user','self','2017-04-01','12:56'),(970,0,'','/api/accesskey','self','2017-04-01','12:56'),(971,0,'','/api/datacenter','self','2017-04-01','12:56'),(972,0,'','/api/change','self','2017-04-01','12:56'),(973,0,'','/api/dashboard/countByMonth','self','2017-04-01','12:56'),(974,0,'','/api/apicall','self','2017-04-01','12:56'),(975,0,'','/api/dashboard/count','self','2017-04-01','12:56'),(976,0,'','/api/dashboard/uposition','self','2017-04-01','12:56'),(977,0,'','/api/dashboard/device','self','2017-04-01','12:56'),(978,0,'','/api/assets','self','2017-04-01','12:57'),(979,0,'','/api/menus/v2','self','2017-04-01','12:57'),(980,0,'','/api/subnet','','2017-04-01','13:1'),(981,0,'','/api/menus','','2017-04-01','13:1'),(982,0,'','/api/datacenter','self','2017-04-01','13:1'),(983,0,'','/api/dashboard/countByMonth','self','2017-04-01','13:1'),(984,0,'','/api/apicall','self','2017-04-01','13:1'),(985,0,'','/api/dashboard/count','self','2017-04-01','13:1'),(986,0,'','/api/change','self','2017-04-01','13:1'),(987,0,'','/api/dashboard/device','self','2017-04-01','13:1'),(988,0,'','/api/dashboard/uposition','self','2017-04-01','13:1'),(989,0,'','/api/assets','self','2017-04-01','13:1'),(990,0,'','/api/menus/v2','self','2017-04-01','13:2'),(991,0,'','/api/subnet','self','2017-04-01','13:2'),(992,0,'','/api/dashboard/countByMonth','self','2017-04-01','13:11'),(993,0,'','/api/menus','self','2017-04-01','13:11'),(994,0,'','/api/dashboard/count','self','2017-04-01','13:11'),(995,0,'','/api/change','self','2017-04-01','13:11'),(996,0,'','/api/apicall','self','2017-04-01','13:11'),(997,0,'','/api/datacenter','self','2017-04-01','13:11'),(998,0,'','/api/dashboard/device','self','2017-04-01','13:11'),(999,0,'','/api/dashboard/uposition','self','2017-04-01','13:11'),(1000,0,'','/api/assets','self','2017-04-01','13:11'),(1001,0,'','/api/menus/v2','self','2017-04-01','13:11'),(1002,0,'','/api/subnet','self','2017-04-01','13:11'),(1003,0,'','/api/menus','self','2017-04-01','13:25'),(1004,0,'','/api/subnet','self','2017-04-01','13:25'),(1005,0,'','/api/subnet','self','2017-04-01','13:25'),(1006,0,'','/api/assets','self','2017-04-01','13:25'),(1007,0,'','/api/menus/v2','self','2017-04-01','13:26'),(1008,0,'','/api/subnet','self','2017-04-01','13:26'),(1009,0,'','/api/menus','self','2017-04-01','13:29'),(1010,0,'','/api/subnet','self','2017-04-01','13:29'),(1011,0,'','/api/assets','self','2017-04-01','13:29'),(1012,0,'','/api/menus/v2','self','2017-04-01','13:29'),(1013,0,'','/api/menus','self','2017-04-01','13:30'),(1014,0,'','/api/subnet','self','2017-04-01','13:30'),(1015,0,'','/api/assets','self','2017-04-01','13:30'),(1016,0,'','/api/menus/v2','self','2017-04-01','13:30'),(1017,0,'','/api/subnet','self','2017-04-01','13:32'),(1018,0,'','/api/assets','self','2017-04-01','13:32'),(1019,0,'','/api/subnet','self','2017-04-01','13:33'),(1020,0,'','/api/menus','self','2017-04-01','13:36'),(1021,0,'','/api/subnet','self','2017-04-01','13:36'),(1022,0,'','/api/assets','self','2017-04-01','13:36'),(1023,0,'','/api/menus/v2','self','2017-04-01','13:36'),(1024,0,'','/api/menus','self','2017-04-01','13:37'),(1025,0,'','/api/subnet','self','2017-04-01','13:37'),(1026,0,'','/api/assets','self','2017-04-01','13:37'),(1027,0,'','/api/menus/v2','self','2017-04-01','13:37'),(1028,0,'','/api/subnet','self','2017-04-01','13:38'),(1029,0,'','/api/menus','self','2017-04-01','13:38'),(1030,0,'','/api/assets','self','2017-04-01','13:38'),(1031,0,'','/api/menus/v2','self','2017-04-01','13:38'),(1032,0,'','/api/subnet','self','2017-04-01','13:43'),(1033,0,'','/api/menus','self','2017-04-01','13:43'),(1034,0,'','/api/assets','self','2017-04-01','13:43'),(1035,0,'','/api/menus/v2','self','2017-04-01','13:43'),(1036,0,'','/api/subnet','self','2017-04-01','13:48'),(1037,0,'','/api/assets','self','2017-04-01','13:48'),(1038,0,'','/api/subnet','self','2017-04-01','13:57'),(1039,0,'','/api/menus','self','2017-04-01','13:57'),(1040,0,'','/api/assets','self','2017-04-01','13:57'),(1041,0,'','/api/menus/v2','self','2017-04-01','13:57'),(1042,0,'','/api/assets','self','2017-04-01','14:8'),(1043,0,'','/api/menus/v2','self','2017-04-01','14:8'),(1044,0,'','/api/server','self','2017-04-01','14:8'),(1045,0,'','/api/subnet','self','2017-04-01','14:8'),(1046,0,'','/api/dnspoddomain/grade','self','2017-04-01','14:8'),(1047,0,'','/api/state/dnspoddomain','self','2017-04-01','14:8'),(1048,0,'','/api/dnspoddomain','self','2017-04-01','14:8'),(1049,0,'','/api/state/dnspoddomain','self','2017-04-01','14:10'),(1050,0,'','/api/statecolor','self','2017-04-01','14:10'),(1051,0,'','/api/subnet','self','2017-04-01','14:10'),(1052,0,'','/api/ip','self','2017-04-01','14:10'),(1053,0,'','/api/ip/monitor','self','2017-04-01','14:10'),(1054,0,'','/api/ip/monitor','self','2017-04-01','14:11'),(1055,0,'','/api/ip','self','2017-04-01','14:11'),(1056,0,'','/api/ip','self','2017-04-01','14:12'),(1057,0,'','/api/ip/monitor','self','2017-04-01','14:12'),(1058,0,'','/api/ip/monitor','self','2017-04-01','14:13'),(1059,0,'','/api/ip/monitor','self','2017-04-01','14:14'),(1060,0,'','/api/ip/monitor','self','2017-04-01','14:15'),(1061,0,'','/api/ip/monitor','self','2017-04-01','14:16'),(1062,0,'','/api/ip/monitor','self','2017-04-01','14:17'),(1063,0,'','/api/subnet','self','2017-04-01','14:17'),(1064,0,'','/api/menus','self','2017-04-01','14:17'),(1065,0,'','/api/ip','self','2017-04-01','14:17'),(1066,0,'','/api/ip/monitor','self','2017-04-01','14:18'),(1067,0,'','/api/ip/monitor','self','2017-04-01','14:19'),(1068,0,'','/api/subnet','self','2017-04-01','14:19'),(1069,0,'','/api/menus','self','2017-04-01','14:19'),(1070,0,'','/api/ip','self','2017-04-01','14:19'),(1071,0,'','/api/ip/monitor','self','2017-04-01','14:20'),(1072,0,'','/api/subnet','self','2017-04-01','14:20'),(1073,0,'','/api/menus','self','2017-04-01','14:20'),(1074,0,'','/api/ip','self','2017-04-01','14:20'),(1075,0,'','/api/ip/monitor','self','2017-04-01','14:21'),(1076,0,'','/api/subnet','self','2017-04-01','14:21'),(1077,0,'','/api/menus','self','2017-04-01','14:21'),(1078,0,'','/api/ip','self','2017-04-01','14:21'),(1079,0,'','/api/ip/monitor','self','2017-04-01','14:22'),(1080,0,'','/api/ip/monitor','self','2017-04-01','14:23'),(1081,0,'','/api/menus','self','2017-04-01','14:23'),(1082,0,'','/api/ip','self','2017-04-01','14:23'),(1083,0,'','/api/subnet','self','2017-04-01','14:23'),(1084,0,'','/api/ip/monitor','self','2017-04-01','14:24'),(1085,0,'','/api/subnet','self','2017-04-01','14:24'),(1086,0,'','/api/menus','self','2017-04-01','14:24'),(1087,0,'','/api/ip','self','2017-04-01','14:24'),(1088,0,'','/api/ip/monitor','self','2017-04-01','14:25'),(1089,0,'','/api/ip/monitor','self','2017-04-01','14:26'),(1090,0,'','/api/ip/monitor','self','2017-04-01','14:27'),(1091,0,'','/api/ip','self','2017-04-01','14:27'),(1092,0,'','/api/ip/monitor','self','2017-04-01','14:28'),(1093,0,'','/api/ip/monitor','self','2017-04-01','14:29'),(1094,0,'','/api/ip/monitor','self','2017-04-01','14:30'),(1095,0,'','/api/menus','self','2017-04-01','14:30'),(1096,0,'','/api/subnet','self','2017-04-01','14:30'),(1097,0,'','/api/ip','self','2017-04-01','14:30'),(1098,0,'','/api/ip/monitor','self','2017-04-01','14:31'),(1099,0,'','/api/menus','self','2017-04-01','14:31'),(1100,0,'','/api/subnet','self','2017-04-01','14:31'),(1101,0,'','/api/ip','self','2017-04-01','14:31'),(1102,0,'','/api/ip/monitor','self','2017-04-01','14:32'),(1103,0,'','/api/ip/monitor','self','2017-04-01','14:33'),(1104,0,'','/api/ip','self','2017-04-01','14:33'),(1105,0,'','/api/ip/monitor','self','2017-04-01','14:34'),(1106,0,'','/api/ip/monitor','self','2017-04-01','14:35'),(1107,0,'','/api/ip/monitor','self','2017-04-01','14:36'),(1108,0,'','/api/ip/monitor','self','2017-04-01','14:37'),(1109,0,'','/api/ip/monitor','self','2017-04-01','14:38'),(1110,0,'','/api/ip/monitor','self','2017-04-01','14:39'),(1111,0,'','/api/ip/monitor','self','2017-04-01','14:40'),(1112,0,'','/api/ip/monitor','self','2017-04-01','14:41'),(1113,0,'','/api/ip/monitor','self','2017-04-01','14:42'),(1114,0,'','/api/ip/monitor','self','2017-04-01','14:43'),(1115,0,'','/api/ip/monitor','self','2017-04-01','14:44'),(1116,0,'','/api/ip/monitor','self','2017-04-01','14:45'),(1117,0,'','/api/ip/monitor','self','2017-04-01','14:46'),(1118,0,'','/api/ip/monitor','self','2017-04-01','14:47'),(1119,0,'','/api/ip/monitor','self','2017-04-01','14:48'),(1120,0,'','/api/ip/monitor','self','2017-04-01','14:49'),(1121,0,'','/api/ip/monitor','self','2017-04-01','14:50'),(1122,0,'','/api/ip/monitor','self','2017-04-01','14:51'),(1123,0,'','/api/ip/monitor','self','2017-04-01','14:52'),(1124,0,'','/api/ip/monitor','self','2017-04-01','14:53'),(1125,0,'','/api/ip/monitor','self','2017-04-01','14:54'),(1126,0,'','/api/ip/monitor','self','2017-04-01','14:55'),(1127,0,'','/api/ip/monitor','self','2017-04-01','14:56'),(1128,0,'','/api/ip/monitor','self','2017-04-01','14:57'),(1129,0,'','/api/ip/monitor','self','2017-04-01','14:58'),(1130,0,'','/api/ip/monitor','self','2017-04-01','14:59'),(1131,0,'','/api/ip/monitor','self','2017-04-01','15:0'),(1132,0,'','/api/ip/monitor','self','2017-04-01','15:1'),(1133,0,'','/api/ip/monitor','self','2017-04-01','15:2'),(1134,0,'','/api/ip/monitor','self','2017-04-01','15:3'),(1135,0,'','/api/ip/monitor','self','2017-04-01','15:4'),(1136,0,'','/api/ip/monitor','self','2017-04-01','15:5'),(1137,0,'','/api/ip/monitor','self','2017-04-01','15:6'),(1138,0,'','/api/ip/monitor','self','2017-04-01','15:7'),(1139,0,'','/api/ip/monitor','self','2017-04-01','15:8'),(1140,0,'','/api/ip/monitor','self','2017-04-01','15:9'),(1141,0,'','/api/ip/monitor','self','2017-04-01','15:10'),(1142,0,'','/api/ip/monitor','self','2017-04-01','15:11'),(1143,0,'','/api/ip/monitor','self','2017-04-01','15:12'),(1144,0,'','/api/ip/monitor','self','2017-04-01','15:13'),(1145,0,'','/api/ip/monitor','self','2017-04-01','15:14'),(1146,0,'','/api/ip/monitor','self','2017-04-01','15:15'),(1147,0,'','/api/ip/monitor','self','2017-04-01','15:16'),(1148,0,'','/api/ip/monitor','self','2017-04-01','15:17'),(1149,0,'','/api/ip/monitor','self','2017-04-01','15:18'),(1150,0,'','/api/ip/monitor','self','2017-04-01','15:19'),(1151,0,'','/api/assets','self','2017-04-01','15:19'),(1152,0,'','/api/menus/v2','self','2017-04-01','15:19'),(1153,0,'','/api/subnet','self','2017-04-01','15:19'),(1154,0,'','/api/ip/monitor','self','2017-04-01','15:20'),(1155,0,'','/api/ip/monitor','self','2017-04-01','15:21'),(1156,0,'','/api/ip/monitor','self','2017-04-01','15:22'),(1157,0,'','/api/ip/monitor','self','2017-04-01','15:23'),(1158,0,'','/api/ip/monitor','self','2017-04-01','15:24'),(1159,0,'','/api/ip/monitor','self','2017-04-01','15:25'),(1160,0,'','/api/ip/monitor','self','2017-04-01','15:26'),(1161,0,'','/api/ip/monitor','self','2017-04-01','15:27'),(1162,0,'','/api/ip/monitor','self','2017-04-01','15:28'),(1163,0,'','/api/ip/monitor','self','2017-04-01','15:29'),(1164,0,'','/api/ip/monitor','self','2017-04-01','15:30'),(1165,0,'','/api/ip/monitor','self','2017-04-01','15:31'),(1166,0,'','/api/ip/monitor','self','2017-04-01','15:32'),(1167,0,'','/api/ip/monitor','self','2017-04-01','15:33'),(1168,0,'','/api/ip/monitor','self','2017-04-01','15:34'),(1169,0,'','/api/ip/monitor','self','2017-04-01','15:35'),(1170,0,'','/api/subnet','self','2017-04-01','15:35'),(1171,0,'','/api/ip','self','2017-04-01','15:35'),(1172,0,'','/api/ip/monitor','self','2017-04-01','15:36'),(1173,0,'','/api/ip/monitor','self','2017-04-01','15:37'),(1174,0,'','/api/ip/monitor','self','2017-04-01','15:38'),(1175,0,'','/api/ip/monitor','self','2017-04-01','15:39'),(1176,0,'','/api/assets','self','2017-04-01','15:39'),(1177,0,'','/api/menus/v2','self','2017-04-01','15:39'),(1178,0,'','/api/subnet','self','2017-04-01','15:39'),(1179,0,'','/api/menus','self','2017-04-01','15:39'),(1180,0,'','/api/subnet','self','2017-04-01','15:40'),(1181,0,'','/api/ip','self','2017-04-01','15:40'),(1182,0,'','/api/ip/monitor','self','2017-04-01','15:40'),(1183,0,'','/api/ip/monitor','self','2017-04-01','15:41'),(1184,0,'','/api/assets','self','2017-04-01','15:41'),(1185,0,'','/api/menus/v2','self','2017-04-01','15:41'),(1186,0,'','/api/subnet','self','2017-04-01','15:41'),(1187,0,'','/api/ip/monitor','self','2017-04-01','15:42'),(1188,0,'','/api/ip/monitor','self','2017-04-01','15:43'),(1189,0,'','/api/subnet','self','2017-04-01','15:43'),(1190,0,'','/api/ip','self','2017-04-01','15:43'),(1191,0,'','/api/menus','self','2017-04-01','15:44'),(1192,0,'','/api/subnet','self','2017-04-01','15:44'),(1193,0,'','/api/ip','self','2017-04-01','15:44'),(1194,0,'','/api/ip/monitor','self','2017-04-01','15:44'),(1195,0,'','/api/ip/monitor','self','2017-04-01','15:45'),(1196,0,'','/api/subnet','self','2017-04-01','15:46'),(1197,0,'','/api/ip','self','2017-04-01','15:46'),(1198,0,'','/api/assets','self','2017-04-01','15:46'),(1199,0,'','/api/ip/monitor','self','2017-04-01','15:46'),(1200,0,'','/api/ip/monitor','self','2017-04-01','15:47'),(1201,0,'','/api/assets','self','2017-04-01','15:47'),(1202,0,'','/api/menus/v2','self','2017-04-01','15:47'),(1203,0,'','/api/server','self','2017-04-01','15:47'),(1204,0,'','/api/ip/monitor','self','2017-04-01','15:48'),(1205,0,'','/api/ip/monitor','self','2017-04-01','15:49'),(1206,0,'','/api/ip/monitor','self','2017-04-01','15:50'),(1207,0,'','/api/menus/v2','self','2017-04-01','15:50'),(1208,0,'','/api/rack','self','2017-04-01','15:50'),(1209,0,'','/api/state/rack','self','2017-04-01','15:50'),(1210,0,'','/api/room','self','2017-04-01','15:50'),(1211,0,'','/api/room','self','2017-04-01','15:50'),(1212,0,'','/api/statecolor','self','2017-04-01','15:50'),(1213,0,'','/api/rack','self','2017-04-01','15:51'),(1214,0,'','/api/ip/monitor','self','2017-04-01','15:51'),(1215,0,'','/api/assets','self','2017-04-01','15:51'),(1216,0,'','/api/menus/v2','self','2017-04-01','15:51'),(1217,0,'','/api/subnet','self','2017-04-01','15:51'),(1218,0,'','/api/ip/monitor','self','2017-04-01','15:52'),(1219,0,'','/api/ip/monitor','self','2017-04-01','15:53'),(1220,0,'','/api/subnet','self','2017-04-01','15:53'),(1221,0,'','/api/ip','self','2017-04-01','15:53'),(1222,0,'','/api/ip/monitor','self','2017-04-01','15:54'),(1223,0,'','/api/ip','self','2017-04-01','15:54'),(1224,0,'','/api/ip/monitor','self','2017-04-01','15:55'),(1225,0,'','/api/menus','self','2017-04-01','15:55'),(1226,0,'','/api/assets','self','2017-04-01','15:55'),(1227,0,'','/api/ip/monitor','self','2017-04-01','15:56'),(1228,0,'','/api/ip/monitor','self','2017-04-01','15:57'),(1229,0,'','/api/ip/monitor','self','2017-04-01','15:58'),(1230,0,'','/api/ip/monitor','self','2017-04-01','15:59'),(1231,0,'','/api/ip/monitor','self','2017-04-01','16:0'),(1232,0,'','/api/ip/monitor','self','2017-04-01','16:1'),(1233,0,'','/api/ip/monitor','self','2017-04-01','16:2'),(1234,0,'','/api/menus/v2','self','2017-04-01','16:2'),(1235,0,'','/api/subnet','self','2017-04-01','16:2'),(1236,0,'','/api/ip','self','2017-04-01','16:2'),(1237,0,'','/api/assets','self','2017-04-01','16:2'),(1238,0,'','/api/ip/monitor','self','2017-04-01','16:3'),(1239,0,'','/api/ip/monitor','self','2017-04-01','16:4'),(1240,0,'','/api/ip/monitor','self','2017-04-01','16:5'),(1241,0,'','/api/ip/monitor','self','2017-04-01','16:6'),(1242,0,'','/api/ip/monitor','self','2017-04-01','16:7'),(1243,0,'','/api/ip/monitor','self','2017-04-01','16:8'),(1244,0,'','/api/ip/monitor','self','2017-04-01','16:9'),(1245,0,'','/api/ip/monitor','self','2017-04-01','16:10'),(1246,0,'','/api/ip/monitor','self','2017-04-01','16:11'),(1247,0,'','/api/ip/monitor','self','2017-04-01','16:12'),(1248,0,'','/api/ip/monitor','self','2017-04-01','16:13'),(1249,0,'','/api/assets','self','2017-04-01','16:13'),(1250,0,'','/api/menus/v2','self','2017-04-01','16:13'),(1251,0,'','/api/rack','self','2017-04-01','16:13'),(1252,0,'','/api/ip/monitor','self','2017-04-01','16:14'),(1253,0,'','/api/assets','self','2017-04-01','16:14'),(1254,0,'','/api/menus/v2','self','2017-04-01','16:14'),(1255,0,'','/api/subnet','self','2017-04-01','16:14'),(1256,0,'','/api/ip','self','2017-04-01','16:14'),(1257,0,'','/api/ip/monitor','self','2017-04-01','16:15'),(1258,0,'','/api/subnet','self','2017-04-01','16:15'),(1259,0,'','/api/menus','self','2017-04-01','16:15'),(1260,0,'','/api/ip','self','2017-04-01','16:15'),(1261,0,'','/api/ip/monitor','self','2017-04-01','16:16'),(1262,0,'','/api/ip/monitor','self','2017-04-01','16:17'),(1263,0,'','/api/ip/monitor','self','2017-04-01','16:18'),(1264,0,'','/api/ip/monitor','self','2017-04-01','16:19'),(1265,0,'','/api/menus','self','2017-04-01','16:19'),(1266,0,'','/api/subnet','self','2017-04-01','16:19'),(1267,0,'','/api/ip','self','2017-04-01','16:19'),(1268,0,'','/api/ip/monitor','self','2017-04-01','16:20'),(1269,0,'','/api/ip/monitor','self','2017-04-01','16:21'),(1270,0,'','/api/ip/monitor','self','2017-04-01','16:22'),(1271,0,'','/api/subnet','self','2017-04-01','16:22'),(1272,0,'','/api/menus','self','2017-04-01','16:22'),(1273,0,'','/api/ip','self','2017-04-01','16:22'),(1274,0,'','/api/ip/monitor','self','2017-04-01','16:23'),(1275,0,'','/api/ip/monitor','self','2017-04-01','16:24'),(1276,0,'','/api/ip/monitor','self','2017-04-01','16:25'),(1277,0,'','/api/ip/monitor','self','2017-04-01','16:26'),(1278,0,'','/api/ip/monitor','self','2017-04-01','16:27'),(1279,0,'','/api/ip/monitor','self','2017-04-01','16:28'),(1280,0,'','/api/ip/monitor','self','2017-04-01','16:29'),(1281,0,'','/api/ip/monitor','self','2017-04-01','16:30'),(1282,0,'','/api/ip/monitor','self','2017-04-01','16:31'),(1283,0,'','/api/ip/monitor','self','2017-04-01','16:32'),(1284,0,'','/api/ip/monitor','self','2017-04-01','16:33'),(1285,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1286,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1287,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1288,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1289,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1290,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1291,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1292,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1293,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1294,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1295,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1296,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1297,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1298,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1299,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1300,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1301,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1302,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1303,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1304,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1305,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1306,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1307,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1308,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1309,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1310,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1311,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1312,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1313,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1314,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1315,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1316,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1317,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1318,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1319,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1320,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1321,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1322,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1323,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1324,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1325,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1326,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1327,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1328,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1329,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1330,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1331,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1332,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1333,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1334,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1335,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1336,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1337,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1338,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1339,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1340,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1341,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1342,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1343,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1344,0,'','/api/ip/monitor','self','2017-04-01','16:34'),(1345,0,'','/api/ip/monitor','self','2017-04-01','16:35'),(1346,0,'','/api/ip/monitor','self','2017-04-01','16:36'),(1347,0,'','/api/ip/monitor','self','2017-04-01','16:37'),(1348,0,'','/api/ip/monitor','self','2017-04-01','16:38'),(1349,0,'','/api/ip/monitor','self','2017-04-01','16:39'),(1350,0,'','/api/ip/monitor','self','2017-04-01','16:40'),(1351,0,'','/api/ip/monitor','self','2017-04-01','16:41'),(1352,0,'','/api/ip/monitor','self','2017-04-01','16:42'),(1353,0,'','/api/ip/monitor','self','2017-04-01','16:43'),(1354,0,'','/api/ip/monitor','self','2017-04-01','16:44'),(1355,0,'','/api/ip/monitor','self','2017-04-01','16:45'),(1356,0,'','/api/ip/monitor','self','2017-04-01','16:46'),(1357,0,'','/api/ip/monitor','self','2017-04-01','16:47'),(1358,0,'','/api/ip/monitor','self','2017-04-01','16:48'),(1359,0,'','/api/ip/monitor','self','2017-04-01','16:49'),(1360,0,'','/api/ip/monitor','self','2017-04-01','16:50'),(1361,0,'','/api/ip/monitor','self','2017-04-01','16:51'),(1362,0,'','/api/ip/monitor','self','2017-04-01','16:52'),(1363,0,'','/api/ip/monitor','self','2017-04-01','16:53'),(1364,0,'','/api/ip/monitor','self','2017-04-01','16:54'),(1365,0,'','/api/ip/monitor','self','2017-04-01','16:55'),(1366,0,'','/api/ip/monitor','self','2017-04-01','16:56'),(1367,0,'','/api/ip/monitor','self','2017-04-01','16:57'),(1368,0,'','/api/ip/monitor','self','2017-04-01','16:58'),(1369,0,'','/api/ip/monitor','self','2017-04-01','16:59'),(1370,0,'','/api/ip/monitor','self','2017-04-01','17:0'),(1371,0,'','/api/ip/monitor','self','2017-04-01','17:1'),(1372,0,'','/api/ip/monitor','self','2017-04-01','17:2'),(1373,0,'','/api/ip/monitor','self','2017-04-01','17:3'),(1374,0,'','/api/ip/monitor','self','2017-04-01','17:4'),(1375,0,'','/api/ip/monitor','self','2017-04-01','17:5'),(1376,0,'','/api/ip/monitor','self','2017-04-01','17:6'),(1377,0,'','/api/ip/monitor','self','2017-04-01','17:7'),(1378,0,'','/api/ip/monitor','self','2017-04-01','17:8'),(1379,0,'','/api/ip/monitor','self','2017-04-01','17:9'),(1380,0,'','/api/ip/monitor','self','2017-04-01','17:10'),(1381,0,'','/api/ip/monitor','self','2017-04-01','17:11'),(1382,0,'','/api/ip/monitor','self','2017-04-01','17:12'),(1383,0,'','/api/SyncVcenter/','self','2017-04-01','17:12'),(1384,0,'','/api/ip/monitor','self','2017-04-01','17:13'),(1385,0,'','/api/ip/monitor','self','2017-04-01','17:14'),(1386,0,'','/api/ip/monitor','self','2017-04-01','17:15'),(1387,0,'','/api/ip/monitor','self','2017-04-01','17:16'),(1388,0,'','/api/SyncVcenter/','self','2017-04-01','17:16'),(1389,0,'','/api/ip/monitor','self','2017-04-01','17:17'),(1390,0,'','/api/SyncVcenter/','self','2017-04-01','17:17'),(1391,0,'','/api/ip/monitor','self','2017-04-01','17:18'),(1392,0,'','/api/ip/monitor','self','2017-04-01','17:19'),(1393,0,'','/api/ip/monitor','self','2017-04-01','17:20'),(1394,0,'','/api/ip/monitor','self','2017-04-01','17:21'),(1395,0,'','/api/ip/monitor','self','2017-04-01','17:22'),(1396,0,'','/api/assets','self','2017-04-01','17:22'),(1397,0,'','/api/menus/v2','self','2017-04-01','17:22'),(1398,0,'','/api/user','self','2017-04-01','17:22'),(1399,0,'','/api/ResourcePlatformAccount','self','2017-04-01','17:22'),(1400,0,'','/api/ip/monitor','self','2017-04-01','17:23'),(1401,0,'','/api/menus','self','2017-04-01','17:23'),(1402,0,'','/api/menus/v2','self','2017-04-01','17:23'),(1403,0,'','/api/ResourcePlatformAccount','self','2017-04-01','17:23'),(1404,0,'','/api/ip/monitor','self','2017-04-01','17:24'),(1405,0,'','/api/ip/monitor','self','2017-04-01','17:25'),(1406,0,'','/api/ip/monitor','self','2017-04-01','17:26'),(1407,0,'','/api/ip/monitor','self','2017-04-01','17:27'),(1408,0,'','/api/ResourcePlatformAccount/','self','2017-04-01','17:27'),(1409,0,'','/api/ip/monitor','self','2017-04-01','17:28'),(1410,0,'','/api/ip/monitor','self','2017-04-01','17:29'),(1411,0,'','/api/SyncVcenter/','self','2017-04-01','17:29'),(1412,0,'','/api/ip/monitor','self','2017-04-01','17:30'),(1413,0,'','/api/SyncVcenter','self','2017-04-01','17:30'),(1414,0,'','/api/ResourcePlatformAccount','self','2017-04-01','17:30'),(1415,0,'','/api/SyncVcenter/','self','2017-04-01','17:32'),(1416,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1417,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1418,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1419,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1420,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1421,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1422,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1423,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1424,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1425,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1426,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1427,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1428,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1429,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1430,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1431,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1432,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1433,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1434,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1435,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1436,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1437,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1438,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1439,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1440,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1441,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1442,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1443,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1444,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1445,0,'','/api/ip/monitor','self','2017-04-01','17:35'),(1446,0,'','/api/ip/monitor','self','2017-04-01','17:36'),(1447,0,'','/api/ip/monitor','self','2017-04-01','17:37'),(1448,0,'','/api/ip/monitor','self','2017-04-01','17:38'),(1449,0,'','/api/ip/monitor','self','2017-04-01','17:39'),(1450,0,'','/api/ip/monitor','self','2017-04-01','17:40'),(1451,0,'','/api/ip/monitor','self','2017-04-01','17:41'),(1452,0,'','/api/ip/monitor','self','2017-04-01','17:42'),(1453,0,'','/api/ip/monitor','self','2017-04-01','17:43'),(1454,0,'','/api/ip/monitor','self','2017-04-01','17:44'),(1455,0,'','/api/ip/monitor','self','2017-04-01','17:45'),(1456,0,'','/api/ip/monitor','self','2017-04-01','17:46'),(1457,0,'','/api/ip/monitor','self','2017-04-01','17:47'),(1458,0,'','/api/ip/monitor','self','2017-04-01','17:48'),(1459,0,'','/api/ip/monitor','self','2017-04-01','17:49'),(1460,0,'','/api/ip/monitor','self','2017-04-01','17:50'),(1461,0,'','/api/ip/monitor','self','2017-04-01','17:51'),(1462,0,'','/api/menus/v2','self','2017-04-01','17:51'),(1463,0,'','/api/subnet','self','2017-04-01','17:51'),(1464,0,'','/api/ip','self','2017-04-01','17:51'),(1465,0,'','/api/assets','self','2017-04-01','17:51'),(1466,0,'','/api/dnspoddomain','self','2017-04-01','17:51'),(1467,0,'','/api/state/dnspoddomain','self','2017-04-01','17:51'),(1468,0,'','/api/dnspoddomain/grade','self','2017-04-01','17:51'),(1469,0,'','/api/app','self','2017-04-01','17:51'),(1470,0,'','/api/app/level','self','2017-04-01','17:51'),(1471,0,'','/api/apicall','self','2017-04-01','17:51'),(1472,0,'','/api/dashboard/uposition','self','2017-04-01','17:51'),(1473,0,'','/api/dashboard/count','self','2017-04-01','17:51'),(1474,0,'','/api/change','self','2017-04-01','17:51'),(1475,0,'','/api/datacenter','self','2017-04-01','17:51'),(1476,0,'','/api/dashboard/countByMonth','self','2017-04-01','17:51'),(1477,0,'','/api/dashboard/device','self','2017-04-01','17:51'),(1478,0,'','/api/ip/monitor','self','2017-04-01','17:52'),(1479,0,'','/api/assets','self','2017-04-01','17:52'),(1480,0,'','/api/ip/monitor','self','2017-04-01','17:53'),(1481,0,'','/api/ip/monitor','self','2017-04-01','17:54'),(1482,0,'','/api/ip/monitor','self','2017-04-01','17:55'),(1483,0,'','/api/SyncVcenter/','self','2017-04-01','17:55'),(1484,0,'','/api/ResourcePlatformAccount','','2017-04-05','9:41'),(1485,0,'','/api/menus/v2','','2017-04-05','9:41'),(1486,0,'','/api/menus','','2017-04-05','9:41'),(1487,0,'','/api/datacenter','self','2017-04-05','9:41'),(1488,0,'','/api/dashboard/count','self','2017-04-05','9:41'),(1489,0,'','/api/dashboard/countByMonth','self','2017-04-05','9:41'),(1490,0,'','/api/apicall','self','2017-04-05','9:41'),(1491,0,'','/api/change','self','2017-04-05','9:41'),(1492,0,'','/api/dashboard/uposition','self','2017-04-05','9:41'),(1493,0,'','/api/dashboard/device','self','2017-04-05','9:41'),(1494,0,'','/api/assets','self','2017-04-05','9:41'),(1495,0,'','/api/assets','self','2017-04-05','9:54'),(1496,0,'','/api/menus/v2','self','2017-04-05','9:54'),(1497,0,'','/api/user','self','2017-04-05','9:54'),(1498,0,'','/api/ResourcePlatformAccount','self','2017-04-05','9:54'),(1499,0,'','/api/SyncVcenter','self','2017-04-05','9:54'),(1500,0,'','/api/ResourcePlatformAccount','self','2017-04-05','9:56'),(1501,0,'','/api/rack','self','2017-04-05','10:6'),(1502,0,'','/api/room','self','2017-04-05','10:6'),(1503,0,'','/api/state/rack','self','2017-04-05','10:6'),(1504,0,'','/api/statecolor','self','2017-04-05','10:6'),(1505,0,'','/api/user','self','2017-04-05','10:6'),(1506,0,'','/api/ResourcePlatformAccount','self','2017-04-05','10:6'),(1507,0,'','/api/ResourcePlatformAccount','','2017-04-05','10:18'),(1508,0,'','/api/menus/v2','','2017-04-05','10:18'),(1509,0,'','/api/dashboard/countByMonth','self','2017-04-05','10:18'),(1510,0,'','/api/apicall','self','2017-04-05','10:18'),(1511,0,'','/api/datacenter','self','2017-04-05','10:18'),(1512,0,'','/api/dashboard/count','self','2017-04-05','10:18'),(1513,0,'','/api/change','self','2017-04-05','10:18'),(1514,0,'','/api/dashboard/uposition','self','2017-04-05','10:18'),(1515,0,'','/api/dashboard/device','self','2017-04-05','10:18'),(1516,0,'','/api/user','self','2017-04-05','10:18'),(1517,0,'','/api/menus/v2','self','2017-04-05','10:21'),(1518,0,'','/api/menus','self','2017-04-05','10:21'),(1519,0,'','/api/ResourcePlatformAccount','self','2017-04-05','10:21'),(1520,0,'','/api/assets','self','2017-04-05','10:52'),(1521,0,'','/api/menus/v2','self','2017-04-05','10:52'),(1522,0,'','/api/room','self','2017-04-05','10:52'),(1523,0,'','/api/datacenter','self','2017-04-05','10:52'),(1524,0,'','/api/state/room','self','2017-04-05','10:52'),(1525,0,'','/api/rack','self','2017-04-05','10:52'),(1526,0,'','/api/state/rack','self','2017-04-05','10:52'),(1527,0,'','/api/statecolor','self','2017-04-05','10:52'),(1528,0,'','/api/aws','self','2017-04-05','10:52'),(1529,0,'','/api/supplier','self','2017-04-05','10:52'),(1530,0,'','/api/datacenter/region','self','2017-04-05','10:52'),(1531,0,'','/api/state/datacenter','self','2017-04-05','10:52'),(1532,0,'','/api/datacenter/region','self','2017-04-05','10:53'),(1533,0,'','/api/supplier','self','2017-04-05','10:53'),(1534,0,'','/api/state/datacenter','self','2017-04-05','10:53'),(1535,0,'','/api/statecolor','self','2017-04-05','10:53'),(1536,0,'','/api/room','self','2017-04-05','10:53'),(1537,0,'','/api/datacenter','self','2017-04-05','10:53'),(1538,0,'','/api/state/room','self','2017-04-05','10:53'),(1539,0,'','/api/rack','self','2017-04-05','10:53'),(1540,0,'','/api/state/rack','self','2017-04-05','10:53'),(1541,0,'','/api/networkbandwidth','self','2017-04-05','10:53'),(1542,0,'','/api/networkbandwidth/isp','self','2017-04-05','10:53'),(1543,0,'','/api/state/networkbandwidth','self','2017-04-05','10:53'),(1544,0,'','/api/hardware','self','2017-04-05','10:53'),(1545,0,'','/api/statecolor','self','2017-04-05','10:54'),(1546,0,'','/api/state/hardware','self','2017-04-05','10:54'),(1547,0,'','/api/rack','self','2017-04-05','10:54'),(1548,0,'','/api/hardware/type','self','2017-04-05','10:54'),(1549,0,'','/api/server','self','2017-04-05','10:54'),(1550,0,'','/api/state/server','self','2017-04-05','10:54'),(1551,0,'','/api/server/manufacturer','self','2017-04-05','10:54'),(1552,0,'','/api/app','self','2017-04-05','10:54'),(1553,0,'','/api/server/host','self','2017-04-05','10:54'),(1554,0,'','/api/supplier','self','2017-04-05','10:54'),(1555,0,'','/api/subnet','self','2017-04-05','10:54'),(1556,0,'','/api/ip','self','2017-04-05','10:54'),(1557,0,'','/api/ip/monitor','self','2017-04-05','10:54'),(1558,0,'','/api/assets','self','2017-04-05','10:54'),(1559,0,'','/api/menus/v2','self','2017-04-05','10:54'),(1560,0,'','/api/dnspoddomain','self','2017-04-05','10:54'),(1561,0,'','/api/state/dnspoddomain','self','2017-04-05','10:54'),(1562,0,'','/api/dnspoddomain/grade','self','2017-04-05','10:54'),(1563,0,'','/api/statecolor','self','2017-04-05','10:55'),(1564,0,'','/api/state/dnspoddomain','self','2017-04-05','10:55'),(1565,0,'','/api/ip/monitor','self','2017-04-05','10:55'),(1566,0,'','/api/app/level','self','2017-04-05','10:55'),(1567,0,'','/api/app','self','2017-04-05','10:55'),(1568,0,'','/api/vcenter','self','2017-04-05','10:55'),(1569,0,'','/api/aliyun','self','2017-04-05','10:55'),(1570,0,'','/api/ip/monitor','self','2017-04-05','10:56'),(1571,0,'','/api/ip/monitor','self','2017-04-05','10:57'),(1572,0,'','/api/app','self','2017-04-05','10:58'),(1573,0,'','/api/app/level','self','2017-04-05','10:58'),(1574,0,'','/api/vcenter','self','2017-04-05','10:58'),(1575,0,'','/api/aliyun','self','2017-04-05','10:58'),(1576,0,'','/api/aws','self','2017-04-05','10:58'),(1577,0,'','/api/aws','self','2017-04-05','10:59'),(1578,0,'','/api/assets','self','2017-04-05','10:59'),(1579,0,'','/api/menus/v2','self','2017-04-05','10:59'),(1580,0,'','/api/app/level','self','2017-04-05','10:59'),(1581,0,'','/api/app','self','2017-04-05','10:59'),(1582,0,'','/api/app','self','2017-04-05','10:59'),(1583,0,'','/api/vcenter','self','2017-04-05','10:59'),(1584,0,'','/api/aliyun','self','2017-04-05','10:59'),(1585,0,'','/api/assets','self','2017-04-05','11:8'),(1586,0,'','/api/user','self','2017-04-05','11:8'),(1587,0,'','/api/menus/v2','self','2017-04-05','11:8'),(1588,0,'','/api/role','self','2017-04-05','11:8'),(1589,0,'','/api/menus','self','2017-04-05','11:8'),(1590,0,'','/api/ResourcePlatformAccount','self','2017-04-05','11:8'),(1591,0,'','/api/systemlog','self','2017-04-05','11:9'),(1592,0,'','/api/accesskey','self','2017-04-05','11:9'),(1593,0,'','/api/user','self','2017-04-05','11:9'),(1594,0,'','/api/role','self','2017-04-05','11:9'),(1595,0,'','/api/assets','self','2017-04-05','11:14'),(1596,0,'','/api/menus/v2','self','2017-04-05','11:14'),(1597,0,'','/api/user','self','2017-04-05','11:14'),(1598,0,'','/api/ResourcePlatformAccount','self','2017-04-05','11:14'),(1599,0,'','/api/menus','','2017-04-05','12:51'),(1600,0,'','/api/ResourcePlatformAccount','','2017-04-05','12:51'),(1601,0,'','/api/menus/v2','','2017-04-05','12:51'),(1602,0,'','/api/datacenter','self','2017-04-05','12:51'),(1603,0,'','/api/dashboard/countByMonth','self','2017-04-05','12:51'),(1604,0,'','/api/apicall','self','2017-04-05','12:51'),(1605,0,'','/api/dashboard/count','self','2017-04-05','12:51'),(1606,0,'','/api/change','self','2017-04-05','12:51'),(1607,0,'','/api/dashboard/uposition','self','2017-04-05','12:51'),(1608,0,'','/api/dashboard/device','self','2017-04-05','12:51'),(1609,0,'','/api/assets','self','2017-04-05','12:51'),(1610,0,'','/api/menus','self','2017-04-05','13:2'),(1611,0,'','/api/assets','self','2017-04-05','13:2'),(1612,0,'','/api/menus/v2','self','2017-04-05','13:3'),(1613,0,'','/api/networkbandwidth','self','2017-04-05','13:3'),(1614,0,'','/api/rack','self','2017-04-05','13:3'),(1615,0,'','/api/room','self','2017-04-05','13:3'),(1616,0,'','/api/networkbandwidth/isp','self','2017-04-05','13:3'),(1617,0,'','/api/statecolor','self','2017-04-05','13:3'),(1618,0,'','/api/state/networkbandwidth','self','2017-04-05','13:3'),(1619,0,'','/api/networkbandwidth','self','2017-04-05','16:15'),(1620,0,'','/api/assets','self','2017-04-05','16:15'),(1621,0,'','/api/menus/v2','self','2017-04-05','16:15'),(1622,0,'','/api/user','self','2017-04-05','16:15'),(1623,0,'','/api/ResourcePlatformAccount','self','2017-04-05','16:15'),(1624,0,'','/api/menus','self','2017-04-05','16:16'),(1625,0,'','/api/ResourcePlatformAccount','self','2017-04-05','16:16'),(1626,0,'','/api/menus/v2','self','2017-04-05','16:16'),(1627,0,'','/api/SyncVcenter','self','2017-04-05','16:16'),(1628,0,'','/api/menus/v2','self','2017-04-05','16:19'),(1629,0,'','/api/ResourcePlatformAccount','self','2017-04-05','16:19'),(1630,0,'','/api/menus','','2017-04-05','16:25'),(1631,0,'','/api/menus/v2','','2017-04-05','16:25'),(1632,0,'','/api/ResourcePlatformAccount','','2017-04-05','16:25'),(1633,0,'','/api/dashboard/count','self','2017-04-05','16:25'),(1634,0,'','/api/datacenter','self','2017-04-05','16:25'),(1635,0,'','/api/change','self','2017-04-05','16:25'),(1636,0,'','/api/apicall','self','2017-04-05','16:25'),(1637,0,'','/api/dashboard/countByMonth','self','2017-04-05','16:25'),(1638,0,'','/api/dashboard/uposition','self','2017-04-05','16:25'),(1639,0,'','/api/dashboard/device','self','2017-04-05','16:25'),(1640,0,'','/api/user','self','2017-04-05','16:25'),(1641,0,'','/api/menus','self','2017-04-05','16:29'),(1642,0,'','/api/datacenter','self','2017-04-05','16:29'),(1643,0,'','/api/dashboard/countByMonth','self','2017-04-05','16:29'),(1644,0,'','/api/change','self','2017-04-05','16:29'),(1645,0,'','/api/dashboard/count','self','2017-04-05','16:29'),(1646,0,'','/api/apicall','self','2017-04-05','16:29'),(1647,0,'','/api/dashboard/device','self','2017-04-05','16:29'),(1648,0,'','/api/dashboard/uposition','self','2017-04-05','16:29'),(1649,0,'','/api/assets','self','2017-04-05','16:29'),(1650,0,'','/api/menus/v2','self','2017-04-05','16:29'),(1651,0,'','/api/user','self','2017-04-05','16:29'),(1652,0,'','/api/ResourcePlatformAccount','self','2017-04-05','16:29'),(1653,0,'','/api/ResourcePlatformAccount','self','2017-04-05','16:35'),(1654,0,'','/api/menus','self','2017-04-05','16:36'),(1655,0,'','/api/menus/v2','self','2017-04-05','16:36'),(1656,0,'','/api/SyncAliyun/','','2017-04-05','16:47'),(1657,0,'','/api/SyncAliyun','self','2017-04-05','16:48'),(1658,0,'','/api/SyncAliyun','self','2017-04-05','16:49'),(1659,0,'','/api/menus/v2','self','2017-04-05','16:51'),(1660,0,'','/api/ResourcePlatformAccount','self','2017-04-05','16:51'),(1661,0,'','/api/menus','self','2017-04-05','16:51'),(1662,0,'','/api/SyncAliyun','self','2017-04-05','16:51'),(1663,0,'','/api/SyncAliyun/','','2017-04-05','16:53'),(1664,0,'','/api/SyncAliyun/','self','2017-04-05','16:54'),(1665,0,'','/api/menus','self','2017-04-05','17:1'),(1666,0,'','/api/menus/v2','self','2017-04-05','17:1'),(1667,0,'','/api/ResourcePlatformAccount','self','2017-04-05','17:1'),(1668,0,'','/api/SyncAliyun','self','2017-04-05','17:1'),(1669,0,'','/api/menus','','2017-04-05','17:17'),(1670,0,'','/api/menus/v2','','2017-04-05','17:17'),(1671,0,'','/api/ResourcePlatformAccount','','2017-04-05','17:17'),(1672,0,'','/api/dashboard/count','self','2017-04-05','17:17'),(1673,0,'','/api/apicall','self','2017-04-05','17:17'),(1674,0,'','/api/datacenter','self','2017-04-05','17:17'),(1675,0,'','/api/dashboard/countByMonth','self','2017-04-05','17:17'),(1676,0,'','/api/dashboard/uposition','self','2017-04-05','17:17'),(1677,0,'','/api/change','self','2017-04-05','17:17'),(1678,0,'','/api/dashboard/device','self','2017-04-05','17:17'),(1679,0,'','/api/user','self','2017-04-05','17:17'),(1680,0,'','/api/SyncAliyun','self','2017-04-05','17:18'),(1681,0,'','/api/ResourcePlatformAccount','self','2017-04-05','17:18'),(1682,0,'','/api/menus/v2','self','2017-04-05','17:25'),(1683,0,'','/api/ResourcePlatformAccount','self','2017-04-05','17:25'),(1684,0,'','/api/menus','self','2017-04-05','17:25'),(1685,0,'','/api/SyncAliyun','self','2017-04-05','17:25'),(1686,0,'','/api/SyncAliyun','self','2017-04-05','17:26'),(1687,0,'','/api/ResourcePlatformAccount','self','2017-04-05','17:26'),(1688,0,'','/api/menus/v2','self','2017-04-05','17:35'),(1689,0,'','/api/menus','self','2017-04-05','17:35'),(1690,0,'','/api/SyncAliyun','self','2017-04-05','17:35'),(1691,0,'','/api/menus','self','2017-04-05','17:36'),(1692,0,'','/api/ResourcePlatformAccount','self','2017-04-05','17:36'),(1693,0,'','/api/menus/v2','self','2017-04-05','17:36'),(1694,0,'','/api/SyncAliyun','self','2017-04-05','17:36'),(1695,0,'','/api/ResourcePlatformAccount','self','2017-04-05','17:37'),(1696,0,'','/api/ResourcePlatformAccount','self','2017-04-05','17:54'),(1697,0,'','/api/menus','self','2017-04-05','17:56'),(1698,0,'','/api/ResourcePlatformAccount','self','2017-04-05','17:56'),(1699,0,'','/api/menus/v2','self','2017-04-05','17:56'),(1700,0,'','/api/ResourcePlatformAccount','self','2017-04-05','17:57'),(1701,0,'','/api/SyncVcenter','self','2017-04-05','17:57'),(1702,0,'','/api/assets','self','2017-04-05','18:15'),(1703,0,'','/api/menus/v2','self','2017-04-05','18:15'),(1704,0,'','/api/vcenter','self','2017-04-05','18:15'),(1705,0,'','/api/menus','self','2017-04-05','18:17'),(1706,0,'','/api/vcenter','self','2017-04-05','18:17'),(1707,0,'','/api/assets','self','2017-04-05','18:17'),(1708,0,'','/api/user','self','2017-04-05','18:17'),(1709,0,'','/api/menus/v2','self','2017-04-05','18:17'),(1710,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:17'),(1711,0,'','/api/SyncVcenter','self','2017-04-05','18:18'),(1712,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:18'),(1713,0,'','/api/menus/v2','self','2017-04-05','18:19'),(1714,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:19'),(1715,0,'','/api/menus','self','2017-04-05','18:19'),(1716,0,'','/api/SyncVcenter','self','2017-04-05','18:19'),(1717,0,'','/api/menus','self','2017-04-05','18:21'),(1718,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:21'),(1719,0,'','/api/menus/v2','self','2017-04-05','18:21'),(1720,0,'','/api/menus','self','2017-04-05','18:22'),(1721,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:22'),(1722,0,'','/api/menus/v2','self','2017-04-05','18:22'),(1723,0,'','/api/SyncVcenter','self','2017-04-05','18:22'),(1724,0,'','/api/menus','self','2017-04-05','18:23'),(1725,0,'','/api/assets','self','2017-04-05','18:23'),(1726,0,'','/api/menus/v2','self','2017-04-05','18:23'),(1727,0,'','/api/user','self','2017-04-05','18:23'),(1728,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:23'),(1729,0,'','/api/SyncVcenter','self','2017-04-05','18:23'),(1730,0,'','/api/menus/v2','self','2017-04-05','18:30'),(1731,0,'','/api/menus','self','2017-04-05','18:30'),(1732,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:30'),(1733,0,'','/api/SyncVcenter','self','2017-04-05','18:30'),(1734,0,'','/api/menus','self','2017-04-05','18:32'),(1735,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:32'),(1736,0,'','/api/menus/v2','self','2017-04-05','18:32'),(1737,0,'','/api/SyncVcenter','self','2017-04-05','18:32'),(1738,0,'','/api/menus','self','2017-04-05','18:33'),(1739,0,'','/api/menus/v2','self','2017-04-05','18:33'),(1740,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:33'),(1741,0,'','/api/SyncVcenter','self','2017-04-05','18:33'),(1742,0,'','/api/menus/v2','self','2017-04-05','18:34'),(1743,0,'','/api/menus','self','2017-04-05','18:34'),(1744,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:34'),(1745,0,'','/api/SyncVcenter','self','2017-04-05','18:34'),(1746,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:35'),(1747,0,'','/api/menus','self','2017-04-05','18:35'),(1748,0,'','/api/menus/v2','self','2017-04-05','18:35'),(1749,0,'','/api/SyncVcenter','self','2017-04-05','18:35'),(1750,0,'','/api/menus','self','2017-04-05','18:37'),(1751,0,'','/api/menus/v2','self','2017-04-05','18:37'),(1752,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:37'),(1753,0,'','/api/SyncVcenter','self','2017-04-05','18:37'),(1754,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:44'),(1755,0,'','/api/menus/v2','self','2017-04-05','18:44'),(1756,0,'','/api/menus','self','2017-04-05','18:44'),(1757,0,'','/api/SyncVcenter','self','2017-04-05','18:44'),(1758,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:45'),(1759,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:46'),(1760,0,'','/api/menus','self','2017-04-05','18:46'),(1761,0,'','/api/menus/v2','self','2017-04-05','18:46'),(1762,0,'','/api/SyncVcenter','self','2017-04-05','18:46'),(1763,0,'','/api/menus','self','2017-04-05','18:49'),(1764,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:49'),(1765,0,'','/api/menus/v2','self','2017-04-05','18:49'),(1766,0,'','/api/SyncVcenter','self','2017-04-05','18:49'),(1767,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:53'),(1768,0,'','/api/menus','self','2017-04-05','18:53'),(1769,0,'','/api/menus/v2','self','2017-04-05','18:53'),(1770,0,'','/api/SyncVcenter','self','2017-04-05','18:53'),(1771,0,'','/api/menus','self','2017-04-05','18:54'),(1772,0,'','/api/menus/v2','self','2017-04-05','18:54'),(1773,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:54'),(1774,0,'','/api/SyncVcenter','self','2017-04-05','18:54'),(1775,0,'','/api/menus/v2','self','2017-04-05','18:55'),(1776,0,'','/api/menus','self','2017-04-05','18:55'),(1777,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:55'),(1778,0,'','/api/SyncVcenter','self','2017-04-05','18:55'),(1779,0,'','/api/ResourcePlatformAccount','self','2017-04-05','18:57'),(1780,0,'','/api/menus','self','2017-04-05','18:57'),(1781,0,'','/api/SyncVcenter','self','2017-04-05','18:57'),(1782,0,'','/api/menus','self','2017-04-05','19:8'),(1783,0,'','/api/ResourcePlatformAccount','self','2017-04-05','19:8'),(1784,0,'','/api/menus/v2','self','2017-04-05','19:8'),(1785,0,'','/api/SyncVcenter','self','2017-04-05','19:8'),(1786,0,'','/api/menus','self','2017-04-05','19:9'),(1787,0,'','/api/menus/v2','self','2017-04-05','19:9'),(1788,0,'','/api/ResourcePlatformAccount','self','2017-04-05','19:9'),(1789,0,'','/api/menus','self','2017-04-06','9:35'),(1790,0,'','/api/menus/v2','self','2017-04-06','9:35'),(1791,0,'','/api/ResourcePlatformAccount','self','2017-04-06','9:35'),(1792,0,'','/api/SyncAliyun','self','2017-04-06','9:40'),(1793,0,'','/api/SyncVcenter','self','2017-04-06','9:56'),(1794,0,'','/api/menus/v2','self','2017-04-06','9:57'),(1795,0,'','/api/ResourcePlatformAccount','self','2017-04-06','9:57'),(1796,0,'','/api/SyncVcenter','self','2017-04-06','9:57'),(1797,0,'','/api/menus','self','2017-04-06','9:58'),(1798,0,'','/api/ResourcePlatformAccount','self','2017-04-06','9:58'),(1799,0,'','/api/SyncVcenter','self','2017-04-06','9:58'),(1800,0,'','/api/ResourcePlatformAccount','self','2017-04-06','10:5'),(1801,0,'','/api/menus/v2','self','2017-04-06','10:5'),(1802,0,'','/api/menus','self','2017-04-06','10:5'),(1803,0,'','/api/SyncVcenter','self','2017-04-06','10:5'),(1804,0,'','/api/ResourcePlatformAccount','self','2017-04-06','10:9'),(1805,0,'','/api/SyncVcenter','self','2017-04-06','10:9'),(1806,0,'','/api/menus','self','2017-04-06','10:10'),(1807,0,'','/api/dashboard/countByMonth','self','2017-04-06','10:10'),(1808,0,'','/api/datacenter','self','2017-04-06','10:10'),(1809,0,'','/api/apicall','self','2017-04-06','10:10'),(1810,0,'','/api/dashboard/count','self','2017-04-06','10:10'),(1811,0,'','/api/change','self','2017-04-06','10:10'),(1812,0,'','/api/dashboard/uposition','self','2017-04-06','10:10'),(1813,0,'','/api/dashboard/device','self','2017-04-06','10:10'),(1814,0,'','/api/assets','self','2017-04-06','10:10'),(1815,0,'','/api/assets','self','2017-04-06','10:17'),(1816,0,'','/api/menus','self','2017-04-06','10:17'),(1817,0,'','/api/menus/v2','self','2017-04-06','10:17'),(1818,0,'','/api/user','self','2017-04-06','10:17'),(1819,0,'','/api/ResourcePlatformAccount','self','2017-04-06','10:17'),(1820,0,'','/api/SyncAliyun','self','2017-04-06','10:17'),(1821,0,'','/api/menus','self','2017-04-06','10:24'),(1822,0,'','/api/menus/v2','self','2017-04-06','10:24'),(1823,0,'','/api/ResourcePlatformAccount','self','2017-04-06','10:24'),(1824,0,'','/api/SyncAliyun','self','2017-04-06','10:24'),(1825,0,'','/api/ResourcePlatformAccount','self','2017-04-06','10:25'),(1826,0,'','/api/menus','self','2017-04-06','10:38'),(1827,0,'','/api/menus/v2','self','2017-04-06','10:38'),(1828,0,'','/api/ResourcePlatformAccount','self','2017-04-06','10:38'),(1829,0,'','/api/SyncAliyun','self','2017-04-06','10:38'),(1830,0,'','/api/menus','self','2017-04-06','11:14'),(1831,0,'','/api/SyncAliyun','self','2017-04-06','11:14'),(1832,0,'','/api/SyncAliyun','self','2017-04-06','11:15'),(1833,0,'','/api/SyncVcenter/','','2017-04-06','11:30'),(1834,0,'','/api/SyncAliyun/','self','2017-04-06','11:31'),(1835,0,'','/api/SyncAliyun/','self','2017-04-06','11:34'),(1836,0,'','/api/SyncAliyun/','self','2017-04-06','11:36'),(1837,0,'','/api/SyncAliyun/','self','2017-04-06','11:41'),(1838,0,'','/api/SyncVcenter/','self','2017-04-06','11:41'),(1839,0,'','/api/menus','self','2017-04-06','13:16'),(1840,0,'','/api/menus/v2','self','2017-04-06','13:16'),(1841,0,'','/api/ResourcePlatformAccount','self','2017-04-06','13:16'),(1842,0,'','/api/SyncAliyun','self','2017-04-06','13:16'),(1843,0,'','/api/menus','self','2017-04-06','13:35'),(1844,0,'','/api/ResourcePlatformAccount','self','2017-04-06','13:35'),(1845,0,'','/api/menus/v2','self','2017-04-06','13:35'),(1846,0,'','/api/SyncAliyun','self','2017-04-06','13:35'),(1847,0,'','/api/SyncVcenter','self','2017-04-06','13:41'),(1848,0,'','/api/ResourcePlatformAccount','self','2017-04-06','13:41'),(1849,0,'','/api/ResourcePlatformAccount','self','2017-04-06','13:58'),(1850,0,'','/api/menus/v2','self','2017-04-06','13:58'),(1851,0,'','/api/menus','self','2017-04-06','13:58'),(1852,0,'','/api/SyncVcenter','self','2017-04-06','13:58'),(1853,0,'','/api/apicall','self','2017-04-06','13:59'),(1854,0,'','/api/dashboard/count','self','2017-04-06','13:59'),(1855,0,'','/api/menus','self','2017-04-06','13:59'),(1856,0,'','/api/datacenter','self','2017-04-06','13:59'),(1857,0,'','/api/change','self','2017-04-06','13:59'),(1858,0,'','/api/dashboard/countByMonth','self','2017-04-06','13:59'),(1859,0,'','/api/dashboard/uposition','self','2017-04-06','13:59'),(1860,0,'','/api/dashboard/device','self','2017-04-06','13:59'),(1861,0,'','/api/assets','self','2017-04-06','13:59'),(1862,0,'','/api/menus/v2','self','2017-04-06','13:59'),(1863,0,'','/api/user','self','2017-04-06','13:59'),(1864,0,'','/api/ResourcePlatformAccount','self','2017-04-06','13:59'),(1865,0,'','/api/SyncVcenter','self','2017-04-06','13:59'),(1866,0,'','/api/menus','','2017-04-06','14:14'),(1867,0,'','/api/menus/v2','','2017-04-06','14:14'),(1868,0,'','/api/apicall','self','2017-04-06','14:14'),(1869,0,'','/api/dashboard/count','self','2017-04-06','14:14'),(1870,0,'','/api/datacenter','self','2017-04-06','14:14'),(1871,0,'','/api/change','self','2017-04-06','14:14'),(1872,0,'','/api/dashboard/countByMonth','self','2017-04-06','14:14'),(1873,0,'','/api/dashboard/uposition','self','2017-04-06','14:14'),(1874,0,'','/api/dashboard/device','self','2017-04-06','14:14'),(1875,0,'','/api/user','self','2017-04-06','14:14'),(1876,0,'','/api/SyncVcenter','self','2017-04-06','14:16'),(1877,0,'','/api/ResourcePlatformAccount','self','2017-04-06','14:16'),(1878,0,'','/api/assets','self','2017-04-06','14:17'),(1879,0,'','/api/menus/v2','self','2017-04-06','14:17'),(1880,0,'','/api/user','self','2017-04-06','14:17'),(1881,0,'','/api/ResourcePlatformAccount','self','2017-04-06','14:17'),(1882,0,'','/api/SyncVcenter','self','2017-04-06','14:18'),(1883,0,'','/api/menus','self','2017-04-06','14:27'),(1884,0,'','/api/ResourcePlatformAccount','self','2017-04-06','14:27'),(1885,0,'','/api/menus/v2','self','2017-04-06','14:27'),(1886,0,'','/api/SyncVcenter','self','2017-04-06','14:27'),(1887,0,'','/api/datacenter','self','2017-04-06','14:27'),(1888,0,'','/api/change','self','2017-04-06','14:27'),(1889,0,'','/api/dashboard/countByMonth','self','2017-04-06','14:27'),(1890,0,'','/api/dashboard/count','self','2017-04-06','14:27'),(1891,0,'','/api/apicall','self','2017-04-06','14:27'),(1892,0,'','/api/dashboard/uposition','self','2017-04-06','14:27'),(1893,0,'','/api/dashboard/device','self','2017-04-06','14:27'),(1894,0,'','/api/user','self','2017-04-06','14:27'),(1895,0,'','/api/menus','self','2017-04-06','14:28'),(1896,0,'','/api/menus/v2','self','2017-04-06','14:28'),(1897,0,'','/api/SyncVcenter','self','2017-04-06','14:30'),(1898,0,'','/api/ResourcePlatformAccount','self','2017-04-06','14:30'),(1899,0,'','/api/ResourcePlatformAccount','self','2017-04-06','14:56'),(1900,0,'','/api/menus','self','2017-04-06','14:56'),(1901,0,'','/api/menus/v2','self','2017-04-06','14:56'),(1902,0,'','/api/SyncVcenter','self','2017-04-06','14:56'),(1903,0,'','/api/ResourcePlatformAccount','self','2017-04-06','14:57'),(1904,0,'','/api/menus/v2','self','2017-04-06','14:57'),(1905,0,'','/api/menus','self','2017-04-06','14:57'),(1906,0,'','/api/SyncVcenter','self','2017-04-06','14:58'),(1907,0,'','/api/ResourcePlatformAccount','self','2017-04-06','14:58'),(1908,0,'','/api/menus','self','2017-04-06','14:59'),(1909,0,'','/api/ResourcePlatformAccount','self','2017-04-06','14:59'),(1910,0,'','/api/SyncVcenter','self','2017-04-06','14:59'),(1911,0,'','/api/menus','self','2017-04-06','15:5'),(1912,0,'','/api/menus/v2','self','2017-04-06','15:5'),(1913,0,'','/api/ResourcePlatformAccount','self','2017-04-06','15:5'),(1914,0,'','/api/SyncVcenter','self','2017-04-06','15:5'),(1915,0,'','/api/SyncAliyun','self','2017-04-06','15:5'),(1916,0,'','/api/menus','self','2017-04-06','15:9'),(1917,0,'','/api/menus/v2','self','2017-04-06','15:9'),(1918,0,'','/api/ResourcePlatformAccount','self','2017-04-06','15:9'),(1919,0,'','/api/SyncVcenter','self','2017-04-06','15:9'),(1920,0,'','/api/ResourcePlatformAccount','self','2017-04-06','15:12'),(1921,0,'','/api/menus/v2','self','2017-04-06','15:12'),(1922,0,'','/api/menus','self','2017-04-06','15:12'),(1923,0,'','/api/SyncVcenter','self','2017-04-06','15:13'),(1924,0,'','/api/ResourcePlatformAccount','self','2017-04-06','15:13'),(1925,0,'','/api/menus','self','2017-04-06','15:28'),(1926,0,'','/api/ResourcePlatformAccount','self','2017-04-06','15:28'),(1927,0,'','/api/menus/v2','self','2017-04-06','15:28'),(1928,0,'','/api/SyncVcenter','self','2017-04-06','15:28'),(1929,0,'','/api/ResourcePlatformAccount','self','2017-04-06','15:41'),(1930,0,'','/api/menus','self','2017-04-06','15:41'),(1931,0,'','/api/SyncVcenter','self','2017-04-06','15:41'),(1932,0,'','/api/menus','self','2017-04-06','15:51'),(1933,0,'','/api/ResourcePlatformAccount','self','2017-04-06','15:51'),(1934,0,'','/api/SyncVcenter','self','2017-04-06','15:51'),(1935,0,'','/api/ResourcePlatformAccount','','2017-04-06','16:10'),(1936,0,'','/api/menus/v2','','2017-04-06','16:10'),(1937,0,'','/api/menus','','2017-04-06','16:10'),(1938,0,'','/api/change','self','2017-04-06','16:10'),(1939,0,'','/api/dashboard/countByMonth','self','2017-04-06','16:10'),(1940,0,'','/api/dashboard/count','self','2017-04-06','16:10'),(1941,0,'','/api/apicall','self','2017-04-06','16:10'),(1942,0,'','/api/datacenter','self','2017-04-06','16:10'),(1943,0,'','/api/dashboard/device','self','2017-04-06','16:10'),(1944,0,'','/api/dashboard/uposition','self','2017-04-06','16:10'),(1945,0,'','/api/user','self','2017-04-06','16:10'),(1946,0,'','/api/SyncVcenter','self','2017-04-06','16:10'),(1947,0,'','/api/SyncAliyun','self','2017-04-06','16:25'),(1948,0,'','/api/menus','self','2017-04-06','16:31'),(1949,0,'','/api/ResourcePlatformAccount','self','2017-04-06','16:31'),(1950,0,'','/api/menus/v2','self','2017-04-06','16:31'),(1951,0,'','/api/SyncAliyun','self','2017-04-06','16:31'),(1952,0,'','/api/menus','self','2017-04-06','17:6'),(1953,0,'','/api/datacenter','self','2017-04-06','17:6'),(1954,0,'','/api/change','self','2017-04-06','17:6'),(1955,0,'','/api/dashboard/count','self','2017-04-06','17:6'),(1956,0,'','/api/apicall','self','2017-04-06','17:6'),(1957,0,'','/api/dashboard/countByMonth','self','2017-04-06','17:6'),(1958,0,'','/api/dashboard/device','self','2017-04-06','17:6'),(1959,0,'','/api/dashboard/uposition','self','2017-04-06','17:6'),(1960,0,'','/api/menus/v2','self','2017-04-06','17:6'),(1961,0,'','/api/user','self','2017-04-06','17:6'),(1962,0,'','/api/ResourcePlatformAccount','self','2017-04-06','17:6'),(1963,0,'','/api/SyncVcenter','self','2017-04-06','17:7'),(1964,0,'','/api/ResourcePlatformAccount','self','2017-04-06','17:7'),(1965,0,'','/api/menus','self','2017-04-06','17:16'),(1966,0,'','/api/menus/v2','self','2017-04-06','17:16'),(1967,0,'','/api/ResourcePlatformAccount','self','2017-04-06','17:16'),(1968,0,'','/api/SyncVcenter','self','2017-04-06','17:16'),(1969,0,'','/api/SyncVcenter','self','2017-04-06','17:17'),(1970,0,'','/api/SyncAliyun','self','2017-04-06','17:51'),(1971,0,'','/api/ResourcePlatformAccount','self','2017-04-06','17:51'),(1972,0,'','/api/ResourcePlatformAccount','','2017-04-06','18:14'),(1973,0,'','/api/menus','','2017-04-06','18:14'),(1974,0,'','/api/dashboard/count','self','2017-04-06','18:14'),(1975,0,'','/api/dashboard/countByMonth','self','2017-04-06','18:14'),(1976,0,'','/api/change','self','2017-04-06','18:14'),(1977,0,'','/api/datacenter','self','2017-04-06','18:14'),(1978,0,'','/api/apicall','self','2017-04-06','18:14'),(1979,0,'','/api/dashboard/uposition','self','2017-04-06','18:14'),(1980,0,'','/api/dashboard/device','self','2017-04-06','18:14'),(1981,0,'','/api/user','self','2017-04-06','18:14'),(1982,0,'','/api/SyncVcenter','self','2017-04-06','18:14'),(1983,0,'','/api/menus','self','2017-04-06','18:15'),(1984,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:15'),(1985,0,'','/api/SyncVcenter','self','2017-04-06','18:15'),(1986,0,'','/api/menus','self','2017-04-06','18:16'),(1987,0,'','/api/menus/v2','self','2017-04-06','18:16'),(1988,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:16'),(1989,0,'','/api/SyncVcenter','self','2017-04-06','18:16'),(1990,0,'','/api/menus/v2','self','2017-04-06','18:18'),(1991,0,'','/api/menus','self','2017-04-06','18:18'),(1992,0,'','/api/menus','self','2017-04-06','18:26'),(1993,0,'','/api/menus/v2','self','2017-04-06','18:26'),(1994,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:26'),(1995,0,'','/api/SyncVcenter','self','2017-04-06','18:26'),(1996,0,'','/api/menus','self','2017-04-06','18:28'),(1997,0,'','/api/menus/v2','self','2017-04-06','18:28'),(1998,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:28'),(1999,0,'','/api/SyncVcenter','self','2017-04-06','18:28'),(2000,0,'','/api/SyncVcenter','self','2017-04-06','18:29'),(2001,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:29'),(2002,0,'','/api/menus/v2','self','2017-04-06','18:29'),(2003,0,'','/api/menus','self','2017-04-06','18:29'),(2004,0,'','/api/menus/v2','self','2017-04-06','18:36'),(2005,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:36'),(2006,0,'','/api/menus','self','2017-04-06','18:36'),(2007,0,'','/api/SyncVcenter','self','2017-04-06','18:36'),(2008,0,'','/api/menus','self','2017-04-06','18:38'),(2009,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:38'),(2010,0,'','/api/menus/v2','self','2017-04-06','18:38'),(2011,0,'','/api/SyncVcenter','self','2017-04-06','18:38'),(2012,0,'','/api/menus','self','2017-04-06','18:40'),(2013,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:40'),(2014,0,'','/api/menus/v2','self','2017-04-06','18:40'),(2015,0,'','/api/SyncVcenter','self','2017-04-06','18:40'),(2016,0,'','/api/menus','self','2017-04-06','18:42'),(2017,0,'','/api/menus/v2','self','2017-04-06','18:42'),(2018,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:42'),(2019,0,'','/api/SyncVcenter','self','2017-04-06','18:42'),(2020,0,'','/api/menus','self','2017-04-06','18:45'),(2021,0,'','/api/menus/v2','self','2017-04-06','18:45'),(2022,0,'','/api/SyncVcenter','self','2017-04-06','18:45'),(2023,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:47'),(2024,0,'','/api/menus/v2','self','2017-04-06','18:47'),(2025,0,'','/api/menus','self','2017-04-06','18:47'),(2026,0,'','/api/SyncVcenter','self','2017-04-06','18:47'),(2027,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:56'),(2028,0,'','/api/menus/v2','self','2017-04-06','18:56'),(2029,0,'','/api/menus','self','2017-04-06','18:56'),(2030,0,'','/api/SyncVcenter','self','2017-04-06','18:56'),(2031,0,'','/api/menus/v2','self','2017-04-06','18:58'),(2032,0,'','/api/menus','self','2017-04-06','18:58'),(2033,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:58'),(2034,0,'','/api/SyncVcenter','self','2017-04-06','18:58'),(2035,0,'','/api/ResourcePlatformAccount','self','2017-04-06','18:59'),(2036,0,'','/api/menus','self','2017-04-06','18:59'),(2037,0,'','/api/menus/v2','self','2017-04-06','18:59'),(2038,0,'','/api/SyncVcenter','self','2017-04-06','18:59'),(2039,0,'','/api/SyncVcenter','self','2017-04-06','19:9'),(2040,0,'','/api/menus','self','2017-04-06','19:20'),(2041,0,'','/api/ResourcePlatformAccount','self','2017-04-06','19:20'),(2042,0,'','/api/menus/v2','self','2017-04-06','19:20'),(2043,0,'','/api/SyncVcenter','self','2017-04-06','19:20'),(2044,0,'','/api/menus/v2','self','2017-04-06','19:24'),(2045,0,'','/api/ResourcePlatformAccount','self','2017-04-06','19:24'),(2046,0,'','/api/SyncVcenter','self','2017-04-06','19:24'),(2047,0,'','/api/menus/v2','self','2017-04-06','19:28'),(2048,0,'','/api/ResourcePlatformAccount','self','2017-04-06','19:28'),(2049,0,'','/api/SyncVcenter','self','2017-04-06','19:28'),(2050,0,'','/api/SyncVcenter','self','2017-04-06','19:39'),(2051,0,'','/api/ResourcePlatformAccount','self','2017-04-06','19:39'),(2052,0,'','/api/menus/v2','self','2017-04-07','9:38'),(2053,0,'','/api/ResourcePlatformAccount','self','2017-04-07','9:38'),(2054,0,'','/api/SyncVcenter','self','2017-04-07','10:11'),(2055,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:11'),(2056,0,'','/api/ResourcePlatformAccount','','2017-04-07','10:26'),(2057,0,'','/api/menus/v2','','2017-04-07','10:26'),(2058,0,'','/api/dashboard/countByMonth','self','2017-04-07','10:26'),(2059,0,'','/api/change','self','2017-04-07','10:26'),(2060,0,'','/api/apicall','self','2017-04-07','10:26'),(2061,0,'','/api/datacenter','self','2017-04-07','10:26'),(2062,0,'','/api/dashboard/count','self','2017-04-07','10:26'),(2063,0,'','/api/dashboard/uposition','self','2017-04-07','10:26'),(2064,0,'','/api/dashboard/device','self','2017-04-07','10:26'),(2065,0,'','/api/assets','self','2017-04-07','10:26'),(2066,0,'','/api/user','self','2017-04-07','10:26'),(2067,0,'','/api/SyncVcenter','self','2017-04-07','10:26'),(2068,0,'','/api/menus','self','2017-04-07','10:36'),(2069,0,'','/api/menus/v2','self','2017-04-07','10:36'),(2070,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:36'),(2071,0,'','/api/SyncVcenter','self','2017-04-07','10:37'),(2072,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:37'),(2073,0,'','/api/menus/v2','self','2017-04-07','10:40'),(2074,0,'','/api/menus','self','2017-04-07','10:40'),(2075,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:40'),(2076,0,'','/api/SyncVcenter','self','2017-04-07','10:40'),(2077,0,'','/api/menus','self','2017-04-07','10:43'),(2078,0,'','/api/menus/v2','self','2017-04-07','10:43'),(2079,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:43'),(2080,0,'','/api/SyncVcenter','self','2017-04-07','10:43'),(2081,0,'','/api/menus','self','2017-04-07','10:48'),(2082,0,'','/api/datacenter','self','2017-04-07','10:48'),(2083,0,'','/api/change','self','2017-04-07','10:48'),(2084,0,'','/api/dashboard/count','self','2017-04-07','10:48'),(2085,0,'','/api/apicall','self','2017-04-07','10:48'),(2086,0,'','/api/dashboard/countByMonth','self','2017-04-07','10:48'),(2087,0,'','/api/dashboard/uposition','self','2017-04-07','10:48'),(2088,0,'','/api/dashboard/device','self','2017-04-07','10:48'),(2089,0,'','/api/assets','self','2017-04-07','10:48'),(2090,0,'','/api/menus/v2','self','2017-04-07','10:48'),(2091,0,'','/api/user','self','2017-04-07','10:48'),(2092,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:48'),(2093,0,'','/api/menus/v2','self','2017-04-07','10:49'),(2094,0,'','/api/menus','self','2017-04-07','10:49'),(2095,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:49'),(2096,0,'','/api/SyncVcenter','self','2017-04-07','10:49'),(2097,0,'','/api/vcenter','self','2017-04-07','10:48'),(2098,0,'','/api/vcenter','self','2017-04-07','10:49'),(2099,0,'','/api/user','self','2017-04-07','10:49'),(2100,0,'','/api/assets','self','2017-04-07','10:49'),(2101,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:52'),(2102,0,'','/api/menus','self','2017-04-07','10:52'),(2103,0,'','/api/SyncVcenter','self','2017-04-07','10:52'),(2104,0,'','/api/menus','self','2017-04-07','10:55'),(2105,0,'','/api/menus/v2','self','2017-04-07','10:55'),(2106,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:55'),(2107,0,'','/api/SyncVcenter','self','2017-04-07','10:55'),(2108,0,'','/api/ResourcePlatformAccount','self','2017-04-07','10:56'),(2109,0,'','/api/SyncVcenter','self','2017-04-07','11:0'),(2110,0,'','/api/ResourcePlatformAccount','self','2017-04-07','11:0'),(2111,0,'','/api/SyncVcenter','self','2017-04-07','11:15'),(2112,0,'','/api/menus/v2','self','2017-04-07','11:16'),(2113,0,'','/api/menus','self','2017-04-07','11:16'),(2114,0,'','/api/SyncVcenter','self','2017-04-07','11:16'),(2115,0,'','/api/SyncVcenter','self','2017-04-07','11:44'),(2116,0,'','/api/ResourcePlatformAccount','self','2017-04-07','12:9'),(2117,0,'','/api/menus/v2','self','2017-04-07','12:9'),(2118,0,'','/api/menus','self','2017-04-07','12:9'),(2119,0,'','/api/SyncVcenter','self','2017-04-07','12:9'),(2120,0,'','/api/ResourcePlatformAccount','self','2017-04-07','12:10'),(2121,0,'','/api/menus','self','2017-04-07','12:10'),(2122,0,'','/api/menus/v2','self','2017-04-07','12:10'),(2123,0,'','/api/SyncVcenter','self','2017-04-07','12:10'),(2124,0,'','/api/ResourcePlatformAccount','self','2017-04-07','12:14'),(2125,0,'','/api/menus/v2','self','2017-04-07','12:14'),(2126,0,'','/api/menus','self','2017-04-07','12:14'),(2127,0,'','/api/ResourcePlatformAccount','self','2017-04-07','12:52'),(2128,0,'','/api/SyncVcenter','self','2017-04-07','12:52'),(2129,0,'','/api/menus','self','2017-04-07','13:27'),(2130,0,'','/api/menus/v2','self','2017-04-07','13:27'),(2131,0,'','/api/ResourcePlatformAccount','self','2017-04-07','13:27'),(2132,0,'','/api/SyncVcenter','self','2017-04-07','13:27'),(2133,0,'','/api/menus','self','2017-04-07','13:41'),(2134,0,'','/api/menus/v2','self','2017-04-07','13:41'),(2135,0,'','/api/menus','self','2017-04-07','13:49'),(2136,0,'','/api/menus/v2','self','2017-04-07','13:49'),(2137,0,'','/api/ResourcePlatformAccount','self','2017-04-07','13:49'),(2138,0,'','/api/menus/v2','self','2017-04-07','13:51'),(2139,0,'','/api/menus','self','2017-04-07','13:51'),(2140,0,'','/api/ResourcePlatformAccount','self','2017-04-07','13:51'),(2141,0,'','/api/menus','self','2017-04-07','13:56'),(2142,0,'','/api/ResourcePlatformAccount','self','2017-04-07','13:56'),(2143,0,'','/api/menus/v2','self','2017-04-07','13:56'),(2144,0,'','/api/menus','self','2017-04-07','14:0'),(2145,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:0'),(2146,0,'','/api/menus/v2','self','2017-04-07','14:0'),(2147,0,'','/api/menus/v2','self','2017-04-07','14:10'),(2148,0,'','/api/menus','self','2017-04-07','14:10'),(2149,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:10'),(2150,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:21'),(2151,0,'','/api/menus/v2','self','2017-04-07','14:21'),(2152,0,'','/api/menus/v2','self','2017-04-07','14:22'),(2153,0,'','/api/menus','self','2017-04-07','14:22'),(2154,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:22'),(2155,0,'','/api/menus/v2','self','2017-04-07','14:23'),(2156,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:23'),(2157,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:24'),(2158,0,'','/api/menus/v2','self','2017-04-07','14:24'),(2159,0,'','/api/menus','self','2017-04-07','14:25'),(2160,0,'','/api/menus/v2','self','2017-04-07','14:25'),(2161,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:25'),(2162,0,'','/api/menus','self','2017-04-07','14:29'),(2163,0,'','/api/menus/v2','self','2017-04-07','14:29'),(2164,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:31'),(2165,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:32'),(2166,0,'','/api/SyncVcenter','self','2017-04-07','14:33'),(2167,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:33'),(2168,0,'','/api/assets','self','2017-04-07','14:34'),(2169,0,'','/api/menus/v2','self','2017-04-07','14:34'),(2170,0,'','/api/vcenter','self','2017-04-07','14:34'),(2171,0,'','/api/assets','self','2017-04-07','14:35'),(2172,0,'','/api/menus/v2','self','2017-04-07','14:35'),(2173,0,'','/api/user','self','2017-04-07','14:35'),(2174,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:35'),(2175,0,'','/api/SyncVcenter','self','2017-04-07','14:36'),(2176,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:36'),(2177,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:43'),(2178,0,'','/api/menus/v2','self','2017-04-07','14:44'),(2179,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:44'),(2180,0,'','/api/menus','self','2017-04-07','14:44'),(2181,0,'','/api/SyncAliyun','self','2017-04-07','14:44'),(2182,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:45'),(2183,0,'','/api/menus','self','2017-04-07','14:45'),(2184,0,'','/api/menus/v2','self','2017-04-07','14:45'),(2185,0,'','/api/SyncAliyun','self','2017-04-07','14:45'),(2186,0,'','/api/menus','self','2017-04-07','14:46'),(2187,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:46'),(2188,0,'','/api/menus/v2','self','2017-04-07','14:46'),(2189,0,'','/api/SyncAliyun','self','2017-04-07','14:46'),(2190,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:52'),(2191,0,'','/api/menus/v2','self','2017-04-07','14:52'),(2192,0,'','/api/menus','self','2017-04-07','14:52'),(2193,0,'','/api/SyncAliyun','self','2017-04-07','14:52'),(2194,0,'','/api/SyncVcenter','self','2017-04-07','14:52'),(2195,0,'','/api/ResourcePlatformAccount','self','2017-04-07','14:53'),(2196,0,'','/api/menus/v2','self','2017-04-07','14:53'),(2197,0,'','/api/menus','self','2017-04-07','14:53'),(2198,0,'','/api/SyncAliyun','self','2017-04-07','14:53'),(2199,0,'','/api/menus','self','2017-04-07','14:58'),(2200,0,'','/api/menus/v2','self','2017-04-07','14:58'),(2201,0,'','/api/SyncAliyun','self','2017-04-07','14:58'),(2202,0,'','/api/menus','self','2017-04-07','15:0'),(2203,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:0'),(2204,0,'','/api/menus/v2','self','2017-04-07','15:0'),(2205,0,'','/api/SyncAliyun','self','2017-04-07','15:0'),(2206,0,'','/api/SyncVcenter','self','2017-04-07','15:0'),(2207,0,'','/api/menus/v2','self','2017-04-07','15:1'),(2208,0,'','/api/menus','self','2017-04-07','15:1'),(2209,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:1'),(2210,0,'','/api/SyncVcenter','self','2017-04-07','15:1'),(2211,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:6'),(2212,0,'','/api/menus','self','2017-04-07','15:6'),(2213,0,'','/api/menus/v2','self','2017-04-07','15:6'),(2214,0,'','/api/SyncVcenter','self','2017-04-07','15:6'),(2215,0,'','/api/menus/v2','self','2017-04-07','15:8'),(2216,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:8'),(2217,0,'','/api/menus','self','2017-04-07','15:8'),(2218,0,'','/api/SyncVcenter','self','2017-04-07','15:8'),(2219,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:11'),(2220,0,'','/api/menus/v2','self','2017-04-07','15:11'),(2221,0,'','/api/menus','self','2017-04-07','15:11'),(2222,0,'','/api/SyncAliyun','self','2017-04-07','15:11'),(2223,0,'','/api/menus/v2','self','2017-04-07','15:14'),(2224,0,'','/api/menus','self','2017-04-07','15:14'),(2225,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:14'),(2226,0,'','/api/SyncAliyun','self','2017-04-07','15:14'),(2227,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:21'),(2228,0,'','/api/menus','self','2017-04-07','15:21'),(2229,0,'','/api/menus/v2','self','2017-04-07','15:21'),(2230,0,'','/api/SyncAliyun','self','2017-04-07','15:21'),(2231,0,'','/api/SyncAliyun','self','2017-04-07','15:22'),(2232,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:23'),(2233,0,'','/api/menus','self','2017-04-07','15:29'),(2234,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:29'),(2235,0,'','/api/menus/v2','self','2017-04-07','15:29'),(2236,0,'','/api/SyncAliyun','self','2017-04-07','15:29'),(2237,0,'','/api/SyncAliyun','self','2017-04-07','15:34'),(2238,0,'','/api/menus','self','2017-04-07','15:37'),(2239,0,'','/api/menus/v2','self','2017-04-07','15:37'),(2240,0,'','/api/SyncAliyun','self','2017-04-07','15:37'),(2241,0,'','/api/menus/v2','self','2017-04-07','15:45'),(2242,0,'','/api/menus','self','2017-04-07','15:45'),(2243,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:45'),(2244,0,'','/api/SyncVcenter','self','2017-04-07','15:45'),(2245,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:54'),(2246,0,'','/api/menus/v2','self','2017-04-07','15:54'),(2247,0,'','/api/menus','self','2017-04-07','15:54'),(2248,0,'','/api/SyncVcenter','self','2017-04-07','15:54'),(2249,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:55'),(2250,0,'','/api/menus/v2','self','2017-04-07','15:55'),(2251,0,'','/api/SyncVcenter','self','2017-04-07','15:56'),(2252,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:56'),(2253,0,'','/api/menus','self','2017-04-07','15:56'),(2254,0,'','/api/menus/v2','self','2017-04-07','15:56'),(2255,0,'','/api/menus/v2','self','2017-04-07','15:59'),(2256,0,'','/api/ResourcePlatformAccount','self','2017-04-07','15:59'),(2257,0,'','/api/menus','self','2017-04-07','15:59'),(2258,0,'','/api/SyncVcenter','self','2017-04-07','15:59'),(2259,0,'','/api/menus','self','2017-04-07','16:3'),(2260,0,'','/api/menus/v2','self','2017-04-07','16:3'),(2261,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:3'),(2262,0,'','/api/SyncVcenter','self','2017-04-07','16:3'),(2263,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:5'),(2264,0,'','/api/menus','self','2017-04-07','16:5'),(2265,0,'','/api/menus/v2','self','2017-04-07','16:5'),(2266,0,'','/api/SyncVcenter','self','2017-04-07','16:5'),(2267,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:6'),(2268,0,'','/api/menus','self','2017-04-07','16:6'),(2269,0,'','/api/menus/v2','self','2017-04-07','16:6'),(2270,0,'','/api/SyncVcenter','self','2017-04-07','16:7'),(2271,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:7'),(2272,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:8'),(2273,0,'','/api/menus','self','2017-04-07','16:8'),(2274,0,'','/api/menus/v2','self','2017-04-07','16:8'),(2275,0,'','/api/SyncVcenter','self','2017-04-07','16:8'),(2276,0,'','/api/menus/v2','self','2017-04-07','16:11'),(2277,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:11'),(2278,0,'','/api/menus','self','2017-04-07','16:11'),(2279,0,'','/api/SyncVcenter','self','2017-04-07','16:11'),(2280,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:20'),(2281,0,'','/api/menus','self','2017-04-07','16:20'),(2282,0,'','/api/menus/v2','self','2017-04-07','16:20'),(2283,0,'','/api/SyncVcenter','self','2017-04-07','16:20'),(2284,0,'','/api/menus','self','2017-04-07','16:28'),(2285,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:28'),(2286,0,'','/api/menus/v2','self','2017-04-07','16:28'),(2287,0,'','/api/SyncVcenter','self','2017-04-07','16:28'),(2288,0,'','/api/menus','self','2017-04-07','16:41'),(2289,0,'','/api/menus/v2','self','2017-04-07','16:41'),(2290,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:41'),(2291,0,'','/api/SyncVcenter','self','2017-04-07','16:41'),(2292,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:42'),(2293,0,'','/api/menus','self','2017-04-07','16:42'),(2294,0,'','/api/menus/v2','self','2017-04-07','16:42'),(2295,0,'','/api/SyncVcenter','self','2017-04-07','16:42'),(2296,0,'','/api/menus/v2','self','2017-04-07','16:55'),(2297,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:55'),(2298,0,'','/api/menus','self','2017-04-07','16:55'),(2299,0,'','/api/SyncVcenter','self','2017-04-07','16:56'),(2300,0,'','/api/ResourcePlatformAccount','self','2017-04-07','16:56'),(2301,0,'','/api/menus','self','2017-04-07','17:0'),(2302,0,'','/api/menus/v2','self','2017-04-07','17:0'),(2303,0,'','/api/SyncVcenter','self','2017-04-07','17:3'),(2304,0,'','/api/ResourcePlatformAccount','self','2017-04-07','17:3'),(2305,0,'','/api/SyncVcenter','self','2017-04-07','17:11'),(2306,0,'','/api/ResourcePlatformAccount','self','2017-04-07','17:11'),(2307,0,'','/api/SyncAliyun','self','2017-04-07','17:23'),(2308,0,'','/api/menus','self','2017-04-07','17:24'),(2309,0,'','/api/ResourcePlatformAccount','self','2017-04-07','17:24'),(2310,0,'','/api/menus/v2','self','2017-04-07','17:24'),(2311,0,'','/api/SyncVcenter','self','2017-04-07','17:25'),(2312,0,'','/api/assets','self','2017-04-07','17:44'),(2313,0,'','/api/menus/v2','self','2017-04-07','17:44'),(2314,0,'','/api/vcenter','self','2017-04-07','17:44'),(2315,0,'','/api/assets','self','2017-04-07','17:45'),(2316,0,'','/api/user','self','2017-04-07','17:45'),(2317,0,'','/api/menus/v2','self','2017-04-07','17:45'),(2318,0,'','/api/ResourcePlatformAccount','self','2017-04-07','17:45'),(2319,0,'','/api/vcenter','self','2017-04-07','17:45'),(2320,0,'','/api/assets','self','2017-04-07','17:46'),(2321,0,'','/api/menus/v2','self','2017-04-07','17:47'),(2322,0,'','/api/user','self','2017-04-07','17:47'),(2323,0,'','/api/ResourcePlatformAccount','self','2017-04-07','17:47'),(2324,0,'','/api/ResourcePlatformAccount','self','2017-04-07','17:52'),(2325,0,'','/api/menus/v2','self','2017-04-07','17:52'),(2326,0,'','/api/menus','self','2017-04-07','17:52'),(2327,0,'','/api/SyncAliyun','self','2017-04-07','17:52'),(2328,0,'','/api/ResourcePlatformAccount','self','2017-04-07','17:53'),(2329,0,'','/api/menus','self','2017-04-07','17:53'),(2330,0,'','/api/menus/v2','self','2017-04-07','17:53'),(2331,0,'','/api/SyncAliyun','self','2017-04-07','17:53'),(2332,0,'','/api/SyncAliyun','self','2017-04-07','17:54'),(2333,0,'','/api/menus','self','2017-04-07','18:0'),(2334,0,'','/api/ResourcePlatformAccount','self','2017-04-07','18:0'),(2335,0,'','/api/menus/v2','self','2017-04-07','18:0'),(2336,0,'','/api/SyncAliyun','self','2017-04-07','18:1'),(2337,0,'','/api/menus','self','2017-04-07','18:2'),(2338,0,'','/api/menus/v2','self','2017-04-07','18:2'),(2339,0,'','/api/SyncAliyun','self','2017-04-07','18:2'),(2340,0,'','/api/ResourcePlatformAccount','self','2017-04-07','18:3'),(2341,0,'','/api/menus/v2','self','2017-04-07','18:5'),(2342,0,'','/api/ResourcePlatformAccount','self','2017-04-07','18:5'),(2343,0,'','/api/menus','self','2017-04-07','18:5'),(2344,0,'','/api/SyncAliyun','self','2017-04-07','18:5'),(2345,0,'','/api/SyncAliyun','self','2017-04-07','18:6');
/*!40000 ALTER TABLE `system_api_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_color`
--

DROP TABLE IF EXISTS `system_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_color` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_color`
--

LOCK TABLES `system_color` WRITE;
/*!40000 ALTER TABLE `system_color` DISABLE KEYS */;
INSERT INTO `system_color` VALUES (1,'#FFC85F','橙色',0,'2016-12-20 16:09:49','admin','admin','2016-12-20 16:09:49','state'),(2,'#FF8B51','红橙色',0,'2016-12-20 16:09:49','admin','admin','2016-12-20 16:09:49','state'),(3,'#6BC86F','淡绿色',0,'2016-12-20 16:09:49','admin','admin','2016-12-20 16:09:49','state'),(4,'#0DB550','深绿色',0,'2016-12-20 16:09:49','admin','admin','2016-12-20 16:09:49','state'),(5,'#7EA2AB','灰色',0,'2016-12-20 16:09:49','admin','admin','2016-12-20 16:09:49','state'),(6,'#317F9E','深蓝色',0,'2016-12-20 16:09:49','admin','admin','2016-12-20 16:09:49','state');
/*!40000 ALTER TABLE `system_color` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_email`
--

LOCK TABLES `system_email` WRITE;
/*!40000 ALTER TABLE `system_email` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,0,'admin','LoginController','登录','','','','','login','登录名或密码错误','2017-03-31 17:34:43','admin','','2017-03-31 17:34:43');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topo_line`
--

LOCK TABLES `topo_line` WRITE;
/*!40000 ALTER TABLE `topo_line` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topo_node`
--

LOCK TABLES `topo_node` WRITE;
/*!40000 ALTER TABLE `topo_node` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topo_view`
--

LOCK TABLES `topo_view` WRITE;
/*!40000 ALTER TABLE `topo_view` DISABLE KEYS */;
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
  `role_id` bigint(20) NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
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
INSERT INTO `user` VALUES (1,'admin','admin','bin.liu@oneoaas.com','18601706743','58dd266e6558d1e66b0d50d9b65a5ff9','QQoxl6n7`!@.[#V7',8,'2017-04-07 10:26:12','2017-05-09 15:36:51',NULL,'10.0.2.221');
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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (4,9,9),(6,0,12),(8,13,9),(9,0,0),(10,0,14),(11,0,14),(14,18,14),(15,0,13),(16,0,13),(17,0,13),(19,0,13),(21,0,11),(23,0,12),(24,0,9),(25,0,9),(26,0,12),(27,0,12),(28,0,9),(29,0,0),(30,0,0),(31,0,9),(32,0,0),(33,0,0),(34,0,9),(35,0,9),(36,0,9),(37,0,9),(38,0,9),(39,0,9),(40,0,9),(41,0,9),(42,0,9),(43,0,9),(44,0,9),(45,0,9),(46,0,9),(47,0,9),(48,0,9),(49,0,9),(50,0,9),(51,0,9),(52,0,9),(53,0,9),(54,0,9),(55,0,9),(56,0,9),(57,0,9),(59,0,9),(60,0,9),(61,0,9),(62,0,9),(63,0,9),(64,0,9),(65,0,9),(66,0,9),(67,0,9),(68,0,9),(74,0,0),(75,0,0),(76,0,0),(77,0,0),(78,0,0),(79,0,0),(80,0,0),(81,0,0),(82,46,16),(83,0,16),(84,0,16),(85,0,16),(86,49,16),(87,0,9),(88,0,9),(89,50,9),(90,0,8),(91,0,8),(92,0,9),(93,0,8),(94,0,8),(95,0,8),(96,0,8),(97,0,8),(98,0,8),(99,21,8),(101,0,8),(102,0,9),(103,0,8),(104,0,8),(106,0,8),(107,0,8),(108,0,8),(112,0,9),(117,0,11),(118,0,9),(119,0,11),(120,0,8),(121,0,8),(123,0,9),(124,30,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_aliyun`
--

LOCK TABLES `vm_aliyun` WRITE;
/*!40000 ALTER TABLE `vm_aliyun` DISABLE KEYS */;
INSERT INTO `vm_aliyun` VALUES (1,'','',0,0,'2017-04-06 11:08:01','','2017-04-06 11:07:55','','','','',NULL,'2017-04-06 11:07:41',NULL,NULL,'2017-04-06 11:07:46');
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
  `launchtime` datetime NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_aws`
--

LOCK TABLES `vm_aws` WRITE;
/*!40000 ALTER TABLE `vm_aws` DISABLE KEYS */;
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
  `vm_path_name` varchar(100) DEFAULT NULL,
  `memory_size` int(11) NOT NULL DEFAULT '0',
  `cpu_reservation` int(11) NOT NULL DEFAULT '0',
  `memory_reservation` int(11) NOT NULL DEFAULT '0',
  `num_cpu` int(11) NOT NULL DEFAULT '0',
  `num_ethernet_cards` int(11) NOT NULL DEFAULT '0',
  `num_virtual_disks` int(11) NOT NULL DEFAULT '0',
  `uuid` varchar(100) DEFAULT NULL,
  `instance_uuid` varchar(100) DEFAULT NULL,
  `guest_id` varchar(30) NOT NULL DEFAULT '',
  `guest_fullname` varchar(100) DEFAULT NULL,
  `annotation` varchar(60) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`vcenter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_vmware`
--

LOCK TABLES `vm_vmware` WRITE;
/*!40000 ALTER TABLE `vm_vmware` DISABLE KEYS */;
INSERT INTO `vm_vmware` VALUES (386,'centos6.6X64',1,'[datastore1] centos6.6X64/centos6.6X64.vmtx',2048,0,0,1,1,1,'421f215f-f6df-5ca4-5479-67dd1f3fd957','501f6290-7e8d-6d25-88ce-1fcfbe231cbd','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(387,'oneops',1,'[datastore1] oneops/oneops.vmtx',12288,0,0,8,1,1,'421fd632-5957-5eb2-8d4d-20c2396dc419','501f16b6-8497-11fd-6456-0b06c435d2e3','ubuntu64Guest','Ubuntu Linux (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(388,'centos7-oneoaas',1,'[datastore1] centos7-oneoaas/centos7-oneoaas.vmtx',4096,0,0,4,1,1,'421f9e69-921e-52bc-9f98-1ac6e3cc911c','501f09da-88ca-cb88-519b-4e108408c869','centos64Guest','CentOS 4/5/6/7 (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(389,'Device42-10.0.2.21',0,'[datastore1] Device42-64-11.1.0/Device42-64-11.1.0.vmx',4096,0,0,2,1,1,'421fcbc0-4433-b2d3-b497-7e05f628277e','501f8711-8abb-996c-f489-bf6253d087ea','ubuntu64Guest','Ubuntu Linux (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(390,'mysql5.7-centos7-10.0.2.47',0,'[datastore1] mysql5.7-centos7-10.0.2.47/mysql5.7-centos7-10.0.2.47.vmx',4096,0,0,4,1,1,'421f514f-e8c6-8060-4718-ded696f22614','501f0797-600b-2228-d2c2-3d75704bd026','centos64Guest','CentOS 4/5/6/7 (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(391,'CMDB-test-10.0.2.50',0,'[datastore1] Centos-test/Centos-test.vmx',3072,0,0,2,1,1,'421f16e4-65ff-1129-765b-6e31acbc490a','501fe4cb-f208-c224-19ac-52d396e24bfa','centos64Guest','CentOS 4/5/6/7 (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(392,'ElectricFlow-6.5.0.109559',1,'[datastore1] ElectricFlow-6.5.0.109559/ElectricFlow-6.5.0.109559.vmtx',4096,0,0,3,1,1,'421fca0e-86be-a2d4-4d16-9e7195c5f8dd','501fa608-6d7a-ee4e-f984-f499e4d7e90a','ubuntu64Guest','Ubuntu Linux (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(393,'ecloud-10.0.2.48',0,'[datastore1] ecloud-10.0.2.48/ecloud-10.0.2.48.vmx',4096,0,0,3,1,1,'421fe474-a383-a459-711d-8bcb50ce3ca9','501f90c8-109e-e1f0-5e67-7dfabc8f0f6a','ubuntu64Guest','Ubuntu Linux (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(394,'linux_study_10.0.2.101',0,'[datastore1] linux_study_10.0.2.101/linux_study_10.0.2.101.vmx',2048,0,0,1,1,1,'421f20c3-1790-5e6e-e4f8-172f21460549','501f62e8-d992-774d-6b7a-50c01bd4eb0c','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(395,'centos7-10.0.2.155',0,'[datastore1] centos7/centos7.vmx',2048,0,0,2,1,1,'421fe7aa-0ded-bbe8-0aad-c87df0656a38','501f05a0-7ef9-e29e-de75-552841686060','centos64Guest','CentOS 4/5/6/7 (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(396,'jenkins.dev.10.0.2.24',0,'[datastore1] jenkins.dev.10.0.2.24/jenkins.dev.10.0.2.24.vmx',6096,0,0,4,1,1,'421f43f2-1c8b-ff54-9034-ce54873ff4af','501f90c1-a142-2d69-2caf-9b73b42ef2e0','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(397,'tomcat-10.0.2.38',0,'[datastore1] tomcat-10.0.2.38/tomcat-10.0.2.38.vmx',8192,0,0,4,1,1,'421f6856-b80f-1823-9511-c5b49a9f6c61','501fb5a9-04cd-3e29-2386-3e63cfa10170','centos64Guest','CentOS 4/5/6/7 (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(398,'repo.dev-10.0.2.25',0,'[datastore1] repo-10.0.1.122/repo-10.0.1.122.vmx',2048,0,0,4,1,1,'420cdcd6-9c5c-4bd1-d51c-a161759b9b96','500c2665-9b2d-03a3-81fa-c4127c76c9d5','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:04','','','2017-04-07 17:16:07'),(399,'test_1',0,'[datastore1] test_1/test_1.vmx',8192,0,0,4,1,1,'421f8d5f-5618-596e-197b-e2ff9b12f1a2','501fe534-b350-c67c-a8c1-86d00b87d7f1','centos64Guest','CentOS 4/5/6/7 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(400,'test_2',0,'[datastore1] test_2/test_2.vmx',8192,0,0,4,1,1,'421f3e76-60a7-5cbf-0a50-88d43232a92e','501f3ceb-148a-7fe9-be7a-ebaee7ff10ee','centos64Guest','CentOS 4/5/6/7 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(401,'test_3',0,'[datastore1] test_3/test_3.vmx',8192,0,0,4,1,1,'421f3f11-91af-8213-ad52-061d180f4ee2','501fa56a-8278-a647-99c0-587a2e946966','centos64Guest','CentOS 4/5/6/7 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(402,'websphere-10.0.2.34',1,'[datastore1] websphere-10.0.2.34_1/websphere-10.0.2.34.vmtx',2048,0,0,2,1,1,'421f4387-76e5-8df9-fabb-4afb59ea66ea','501f6130-ea51-8809-7706-2b05e41edc9e','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(403,'centos7-test',0,'[datastore1] centos7-test/centos7-test.vmx',2048,0,0,2,1,1,'421f7f93-b036-db52-6a7d-4bf524628afc','501f793b-e023-bbd4-12b7-ed1f98be766e','centos64Guest','CentOS 4/5/6/7 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(404,'10.0.2.34',0,'[datastore1] 10.0.2.34/10.0.2.34.vmx',2048,0,0,2,1,1,'421f4698-c098-2dec-1050-4c0164f4a1ef','501f39d6-e9ea-7e6b-3798-1bc409f9738d','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(405,'prod-git-10.0.2.15',0,'[datastore1] ftp-10.0.1.123/ftp-10.0.1.123.vmx',2048,0,0,4,1,1,'420c34b9-519a-a08b-76b4-d1de29c56b96','500c12a8-226d-42b7-a2c1-564f1bc55de3','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(406,'blueking-10.0.2.61',0,'[datastore1] blueking-10.0.2.61/blueking-10.0.2.61.vmx',8192,0,0,4,1,1,'421fa7a7-9822-11c1-4e01-29325811bbf9','501f2d0e-7d74-2427-f717-d960e1e5f3f1','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(407,'blueking-10.0.2.62',0,'[datastore1] blueking-10.0.2.62/blueking-10.0.2.62.vmx',8192,0,0,4,1,1,'421f0b4a-425e-2df5-bdd4-8b449622e6cb','501f680a-0f73-222b-89c3-2f938b0f1298','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(408,'dev-oneoaas-cmdb-10.0.2.22',0,'[datastore1] onecmdb-10.0.1.126/onecmdb-10.0.1.126.vmx',4096,0,512,4,1,1,'420c281a-a4a2-eccb-6c22-e03aaa7159da','500c31a3-63e5-003d-9acb-659a63423d23','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:07'),(409,'jira.dev-10.0.2.27',0,'[datastore1] cmdbuild-10.0.1.127/cmdbuild-10.0.1.127.vmx',8092,0,0,6,1,1,'420cd465-45ca-9ce9-3624-cf5f0e53f512','500ce317-90fc-5a75-1fff-67a4ed27618b','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:08'),(410,'Oneoaas-master-10.0.2.11',0,'[datastore1] Oneoaas-master/Oneoaas-master.vmx',8192,0,0,4,1,1,'564d60e7-0948-2d0e-63dd-5b43a4580a18','529532db-9c8c-ff78-4a69-495a7b7fc212','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:08'),(411,'chuck-test-10.0.2.32',0,'[datastore1] zabbix-server-test161/zabbix-server-test161.vmx',8192,0,0,4,1,1,'564df55b-e717-d3e4-93f4-954e7994b9a2','525452c2-2f3f-ac8e-6042-121ad6505b6c','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:08'),(412,'weblogic-10.0.2.12',0,'[datastore1] weblogic-10.0.1.11/weblogic-10.0.1.11.vmx',3072,0,0,4,1,1,'421d8dde-c541-2bd3-1e2e-1dfb0650a1b4','501d0a5d-bb39-96fd-50db-32ccd63678dc','debian6_64Guest','Debian GNU/Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:08'),(413,'vpn-10.0.2.30',0,'[datastore1] vpn/vpn.vmx',1024,0,0,2,1,1,'564df88d-2800-9fdd-b914-0b5e31577d2f','52cb457d-2775-f3ab-75e2-5982dc6f1bea','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:08'),(414,'oracle-10.0.2.33',0,'[datastore1] oracle-10.0.2.31/oracle-10.0.2.31.vmx',4096,0,0,4,1,1,'564d7659-9fd9-c2da-f0f2-a92988f5a8db','529b33d7-aed6-d907-883b-076ab276790c','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:08'),(415,'vcenter-10.0.2.9',0,'[datastore1] vcenter-10.0.2.9/vcenter-10.0.2.9.vmx',8192,0,0,4,1,1,'564d4727-2080-acb2-e940-db350e7e8947','524b2e34-d08a-0332-17e7-184a4ea0ce53','vmkernel6Guest','VMware ESXi 6.x','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:08'),(416,'dev-zabbix2.2-10.0.2.36',0,'[datastore1] centos6/centos6.vmx',2048,0,0,2,1,1,'564d5298-c2b3-ee2b-2715-d8ba6b775845','52da1e67-a45c-c585-f17c-652d218bbc08','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:05','','','2017-04-07 17:16:08'),(417,'[demo]dev-ralph-10.0.2.39',0,'[datastore1] Ubuntu14.04/Ubuntu14.04.vmx',8192,0,0,4,1,1,'564d4ace-c11e-0e36-863e-5a97cc86fa14','52a92a25-ebc9-0099-0ad0-b42b8ed8a3d1','ubuntu64Guest','Ubuntu Linux (64-bit)','',1,'2017-04-10 04:56:06','','','2017-04-07 17:16:08'),(418,'dev-zabbix2.4-10.0.2.13',0,'[datastore1] zabbix2.4/zabbix2.4.vmx',4096,0,0,6,1,1,'564d3159-dce9-c11b-756b-ff3974b0540b','5200516c-3762-d23d-835f-a5682537df34','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:06','','','2017-04-07 17:16:08'),(419,'monitor.dev-10.0.2.14',0,'[datastore1] zabbix3.0/zabbix3.0.vmx',4096,0,0,2,1,1,'564d174c-c4d0-feff-7bb2-bfa7c255fad5','5292c024-cb67-1137-0ed2-3c937c72d511','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:06','','','2017-04-07 17:16:08'),(420,'Oracle11R2',1,'[datastore1] Oracle11R2/Oracle11R2.vmtx',4096,0,0,4,1,1,'421f8581-ff23-d70f-849e-8b8516b2fe44','501f5d05-1c6d-933d-c449-878617ca2b20','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:06','','','2017-04-07 17:16:08'),(421,'weblogic',1,'[datastore1] weblogic/weblogic.vmtx',3072,0,0,4,1,1,'421f4d82-0802-0abb-d1a7-097096a21458','501f5079-2af7-0223-ea76-55d54bd49b02','debian6_64Guest','Debian GNU/Linux 6 (64-bit)','',1,'2017-04-10 04:56:06','','','2017-04-07 17:16:08'),(422,'WebSphere',1,'[datastore1] WebSphere/WebSphere.vmtx',2048,0,0,2,1,1,'421f3c50-fbcd-f583-a968-6fef8845eb81','501f3391-5276-a265-9a0a-57b855da6aff','rhel6_64Guest','Red Hat Enterprise Linux 6 (64-bit)','',1,'2017-04-10 04:56:06','','','2017-04-07 17:16:08'),(423,'sqlserver2008-41',0,'[datastore1] sqlserver2008-123/sqlserver2008-123.vmx',2048,0,0,2,1,1,'421fa13b-5120-3045-5d8f-8252ef1607f8','501f3e21-b88c-c0e1-0bc5-f7a1f6f7502d','windows7Server64Guest','Microsoft Windows Server 2008 R2 (64-bit)','原装系统无任何插件，可做模板',1,'2017-04-10 04:56:06','','','2017-04-07 17:16:08'),(424,'vcsa-10.0..2.8',0,'[datastore1] vcsa-10.0..2.8/vcsa-10.0..2.8.vmx',8192,0,0,2,1,11,'564d7529-a672-0beb-e2e0-994c57d2d25a','52503293-b515-1730-223a-b03fe9ac3802','sles11_64Guest','SUSE Linux Enterprise 11 (64-bit)','VMware vCenter Server Appliance',1,'2017-04-08 17:03:33','','','2017-04-07 17:16:08');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zabbix_host`
--

LOCK TABLES `zabbix_host` WRITE;
/*!40000 ALTER TABLE `zabbix_host` DISABLE KEYS */;
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

-- Dump completed on 2017-04-07 18:16:21
