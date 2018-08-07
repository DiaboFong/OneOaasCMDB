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
  `agreement_name` varchar(100) NOT NULL DEFAULT '',
  `agreement_no` varchar(100) NOT NULL DEFAULT '',
  `agreement_price` bigint(20) DEFAULT NULL,
  `agreement_sign_date` datetime DEFAULT NULL,
  `agreement_start_date` datetime DEFAULT NULL,
  `agreement_stop_date` datetime DEFAULT NULL,
  `agreement_signer` varchar(100) DEFAULT NULL,
  `agreement_path` varchar(100) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`agreementid`),
  UNIQUE KEY `agreement_name` (`agreement_name`),
  UNIQUE KEY `agreement_no` (`agreement_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreement`
--

LOCK TABLES `agreement` WRITE;
/*!40000 ALTER TABLE `agreement` DISABLE KEYS */;
INSERT INTO `agreement` VALUES (1,'OneOaas','36',23244,NULL,NULL,NULL,'韩','DEMO','test',2,2),(2,'testaa','111',223,'2016-06-28 23:44:15','2016-06-28 23:44:17','2016-06-28 23:44:18','11','','test',2,1),(3,'aaa','ddd',0,'2016-06-28 23:46:34','2016-06-28 23:46:38','2016-06-28 23:46:36','ddd','','tet',2,1),(4,'teste','a',0,'2016-06-28 23:47:18','2016-06-28 23:47:24','2016-06-28 23:47:27','233','','test',2,1),(5,'test','abe',0,'2016-06-28 23:58:34','2016-06-28 23:58:36','2016-06-28 23:58:39','test','','test',2,1),(6,'testUpload','test',0,'2016-07-07 01:36:42','2016-07-07 01:36:44','2016-07-07 01:36:48','test','','test',2,1),(8,'testaa4','1111',11,'2016-07-07 01:40:15','2016-07-07 01:40:17','2016-07-07 01:40:19','111','www/员工入职报到流程.doc','test',2,1),(9,'testpdf','12121212',1212,'2016-07-07 01:47:06','2016-07-07 01:47:07','2016-07-07 01:47:10','testa','www/Effective Go - The Go Programming Language.pdf','test',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreement_state`
--

LOCK TABLES `agreement_state` WRITE;
/*!40000 ALTER TABLE `agreement_state` DISABLE KEYS */;
INSERT INTO `agreement_state` VALUES (1,'已签订',0,'2016-05-30 15:50:12','han','han','2016-05-30 15:50:24'),(2,'取消',0,'2016-05-30 15:50:52','han','han','2016-05-30 15:50:59');
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
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
INSERT INTO `app` VALUES (35,'测试',0,'admin','admin','admin','test',3),(36,'开发',0,'admin','admin','admin','test',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_level`
--

LOCK TABLES `app_level` WRITE;
/*!40000 ALTER TABLE `app_level` DISABLE KEYS */;
INSERT INTO `app_level` VALUES (1,0,'2016-06-02 10:32:33','admin','admin','2016-06-02 10:32:46','一级业务'),(2,0,'2016-06-02 10:33:29','admin','admin','2016-06-02 10:33:38','二级业务'),(3,0,'2016-06-02 10:35:25','admin','admin','2016-06-02 10:35:32','三级业务'),(4,0,'2016-06-02 10:35:49','admin','admin','2016-06-02 10:35:57','四级业务'),(5,0,'2016-06-02 10:36:38','admin','admin','2016-06-02 10:36:49','五级业务');
/*!40000 ALTER TABLE `app_level` ENABLE KEYS */;
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
  PRIMARY KEY (`dcid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter`
--

LOCK TABLES `datacenter` WRITE;
/*!40000 ALTER TABLE `datacenter` DISABLE KEYS */;
INSERT INTO `datacenter` VALUES (24,'上海数据中心','上海','市辖区','黄浦区','上海市普陀区','35.65','上海',1,1,3),(29,'北京数据中心','北京','市辖区','朝阳区','北京市朝阳区','116.46,39.92','北京',3,1,2),(30,'testaaa','安徽','安庆市','太湖县','test','120.55,30.55','test',1,1,2),(31,'dc110','安徽','安庆市','太湖县','test','11.55','test',1,1,2),(32,'testawew','安徽','安庆市','太湖县','test','22.44','test',1,1,2);
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
INSERT INTO `datacenter_region` VALUES (1,'华东',0,'2016-05-30 15:39:55','han','han','2016-05-30 15:39:18'),(2,'华西',0,'2016-05-30 15:47:22','han','han','2016-05-30 15:47:30'),(3,'华北',0,'2016-05-30 15:47:48','han','han','2016-05-30 15:47:56'),(4,'华南',0,'2016-05-30 15:48:12','han','han','2016-05-30 15:48:14'),(5,'华中',0,'2016-05-30 15:48:40','han','han','2016-05-30 15:48:48'),(6,'海外',0,'2016-05-30 15:49:10','han','han','2016-05-30 15:49:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter_state`
--

LOCK TABLES `datacenter_state` WRITE;
/*!40000 ALTER TABLE `datacenter_state` DISABLE KEYS */;
INSERT INTO `datacenter_state` VALUES (1,'使用中',0,'2016-05-30 15:50:12','han','han','2016-06-21 13:07:27'),(2,'下线',0,'2016-05-30 15:50:52','han','han','2016-06-21 13:21:33'),(3,'故障',0,'2016-05-30 15:51:35','han','han','2016-06-21 13:01:24');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspoddomain`
--

LOCK TABLES `dnspoddomain` WRITE;
/*!40000 ALTER TABLE `dnspoddomain` DISABLE KEYS */;
INSERT INTO `dnspoddomain` VALUES (1,'enable','2016-06-10 11:55:10','dnserror','2',0,0,'baidu.com','2','2','2','',0,'2','2016-06-09 06:30:10',2,1,1);
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
INSERT INTO `dnspoddomain_grade` VALUES (1,'旧免费套餐 (旧套餐)',0,'2016-06-06 13:50:48','admin','admin','2016-06-06 13:50:56'),(2,'个人豪华套餐 (旧套餐)',0,'2016-06-06 13:51:11','admin','admin','2016-06-06 13:51:19'),(3,'企业Ⅰ (旧套餐)',0,'2016-06-06 13:51:56','admin','admin','2016-06-06 13:52:08'),(4,'企业Ⅱ (旧套餐)',0,'2016-06-06 13:52:31','admin','admin','2016-06-06 13:52:39'),(5,'企业Ⅲ (旧套餐)',0,'2016-06-06 13:53:02','admin','admin','2016-06-06 13:53:09'),(6,'免费套餐',0,'2016-06-06 13:53:24','admin','admin','2016-06-06 13:53:32'),(7,'个人专业版',0,'2016-06-06 13:53:45','admin','admin','2016-06-06 13:53:53'),(8,'企业创业版',0,'2016-06-06 13:54:11','admin','admin','2016-06-06 13:54:18'),(9,'企业标准版',0,'2016-06-06 13:54:30','admin','admin','2016-06-06 13:54:38'),(10,'企业旗舰版',0,'2016-06-06 13:54:59','admin','admin','2016-06-06 13:55:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnspoddomain_state`
--

LOCK TABLES `dnspoddomain_state` WRITE;
/*!40000 ALTER TABLE `dnspoddomain_state` DISABLE KEYS */;
INSERT INTO `dnspoddomain_state` VALUES (1,'正常',0,'2016-06-06 13:55:41','admin','admin','2016-06-06 13:56:00'),(2,'已暂停解析',0,'2016-06-06 13:56:17','admin','admin','2016-06-06 13:56:29'),(3,'已被封禁',0,'2016-06-06 13:56:58','admin','admin','2016-06-06 13:57:08'),(4,'已被锁定',0,'2016-06-06 13:57:24','admin','admin','2016-06-06 13:57:32');
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
INSERT INTO `docmanage` VALUES (1,'正大监控项目合同',0,'11','/app','完整','正大');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware`
--

LOCK TABLES `hardware` WRITE;
/*!40000 ALTER TABLE `hardware` DISABLE KEYS */;
INSERT INTO `hardware` VALUES (1,0,'AB5732 SRX3600','瞻博（Juniper）SRX100H2 ',NULL,'',22,6,2,'10.0.1.110'),(2,0,'AB5732 SRX3287','华三（H3C）S1016',NULL,'',22,5,2,'10.0.1.117');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware_state`
--

LOCK TABLES `hardware_state` WRITE;
/*!40000 ALTER TABLE `hardware_state` DISABLE KEYS */;
INSERT INTO `hardware_state` VALUES (1,'未知',0,'2016-06-02 15:16:08','admin','admin','2016-06-02 15:16:20'),(2,'监控',0,'2016-06-02 15:16:30','admin','admin','2016-06-02 15:16:39'),(3,'故障',0,'2016-06-02 15:16:49','admin','admin','2016-06-02 15:16:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware_type`
--

LOCK TABLES `hardware_type` WRITE;
/*!40000 ALTER TABLE `hardware_type` DISABLE KEYS */;
INSERT INTO `hardware_type` VALUES (1,'CPU',0,'2016-06-23 14:47:57','admin','admin','2016-06-23 14:48:19'),(2,'内存',0,'2016-06-23 14:48:05','admin','admin','2016-06-23 14:48:21'),(3,'硬盘',0,'2016-06-23 14:48:09','admin','admin','2016-06-23 14:48:24'),(4,'光驱',0,'2016-06-23 14:48:11','admin','admin','2016-06-23 14:48:26'),(5,'交换机',0,'2016-06-23 14:48:14','admin','admin','2016-06-23 14:48:28'),(6,'防火墙',0,'2016-06-23 14:48:16','admin','admin','2016-06-23 14:48:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,'Linux主机',0,'2016-06-03 17:01:46','admin','admin','2016-06-03 17:01:55'),(2,'Windows主机',0,'2016-06-03 17:02:17','admin','admin','2016-06-03 17:02:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internet_service_provider`
--

LOCK TABLES `internet_service_provider` WRITE;
/*!40000 ALTER TABLE `internet_service_provider` DISABLE KEYS */;
INSERT INTO `internet_service_provider` VALUES (1,'中国电信',0,'2016-06-02 15:11:54','admin','admin','2016-06-02 15:12:01'),(2,'中国移动通信',0,'2016-06-02 15:12:16','admin','admin','2016-06-02 15:12:26'),(3,'中国联通',0,'2016-06-02 15:12:38','admin','admin','2016-06-02 15:12:46'),(4,'北京电信通',0,'2016-06-02 15:12:59','admin','admin','2016-06-02 15:13:07');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'戴尔','dell@','123233',NULL),(2,'惠普','huipu@','453454',NULL),(16,'思科','sike@','233322','');
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
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'dashbord','仪表盘','',0,0,NULL,'admin','','2016-07-10 15:39:30',0),(2,'resource_query','资源查询','',0,0,NULL,'admin','','2016-07-10 15:38:34',0),(3,'resource_change','资源变更','',0,0,NULL,'admin','','2016-07-10 15:38:34',0),(4,'system_manage','系统管理','',0,0,NULL,'admin','','2016-07-10 15:39:10',0),(5,'selectdatacenter','查询数据中心','/selectdatacenter',2,0,NULL,'admin','','2016-07-10 15:39:30',0),(6,'selectroom','查询机房','/selectroom',2,0,NULL,'admin','','2016-07-10 15:39:30',0),(7,'selectrack','查询机柜','/selectrack',2,0,NULL,'admin','','2016-07-10 15:39:30',0),(8,'selectbandwidth','查询带宽','/selectbandwidth',2,0,NULL,'admin','','2016-07-10 15:39:30',0),(9,'selecthardware','查询硬件','/selecthardware',2,0,NULL,'admin','','2016-07-10 15:39:30',0),(10,'selectserver','查询服务器','/selectserver',2,0,NULL,'admin','','2016-07-10 15:39:30',0),(11,'selectip','查询IP','/selectip',2,0,NULL,'admin','','2016-07-10 15:39:30',0),(12,'selectdomain','查询域名','/selectdomain',2,0,NULL,'admin','','2016-07-10 15:38:34',0),(13,'selectsupplier','查询供应商','/selectsupplier',2,0,NULL,'admin','','2016-07-10 15:38:34',0),(14,'selectagreement','查询合同','/selectagreement',2,0,NULL,'admin','','2016-07-10 15:38:34',0),(15,'selectapp','查询业务模块','/selectapp',2,0,NULL,'admin','','2016-07-10 15:38:34',0),(16,'selectstatistical','查询统计分析','/selectstatistical',2,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0),(17,'selectresources','查询资源导入','/selectresources',2,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0),(18,'selectchange','查询变更管理','/selectchange',2,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0),(19,'managedatacenter','管理数据中心','/managedatacenter',3,0,NULL,'admin','','2016-07-10 15:39:30',0),(20,'manageroom','管理机房','/manageroom',3,0,NULL,'admin','','2016-07-10 15:39:30',0),(21,'managerack','管理机柜','/managerack',3,0,NULL,'admin','','2016-07-10 15:39:30',0),(22,'managebandwidth','管理带宽','/managebandwidth',3,0,NULL,'admin','','2016-07-10 15:39:30',0),(23,'managehardware','管理硬件','/managehardware',3,0,NULL,'admin','','2016-07-10 15:39:30',0),(24,'manageserver','管理服务器','/manageserver',3,0,NULL,'admin','','2016-07-10 15:39:30',0),(25,'manageip','管理IP','/manageip',3,0,NULL,'admin','','2016-07-10 15:39:30',0),(26,'managedomain','管理域名','/managedomain',3,0,NULL,'admin','','2016-07-10 15:38:34',0),(27,'managesupplier','管理供应商','/managesupplier',3,0,NULL,'admin','','2016-07-10 15:38:34',0),(28,'manageagreement','管理合同','/manageagreement',3,0,NULL,'admin','','2016-07-10 15:38:34',0),(29,'manageapp','管理业务模块','/manageapp',3,0,NULL,'admin','','2016-07-10 15:38:34',0),(30,'managestatistical','管理统计分析','/managestatistical',3,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0),(31,'manageresources','管理资源导入','/manageresources',3,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0),(32,'managechange','管理变更管理','/managechange',3,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0),(33,'systemuser','用户管理','/systemuser',4,0,NULL,'admin','','2016-07-10 15:39:10',0),(34,'systemconfig','系统配置','/systemconfig',4,0,NULL,'admin','','2016-07-10 15:39:10',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_roles`
--

LOCK TABLES `menu_roles` WRITE;
/*!40000 ALTER TABLE `menu_roles` DISABLE KEYS */;
INSERT INTO `menu_roles` VALUES (1,1,8),(2,5,8),(3,6,8),(4,7,8),(5,8,8),(6,9,8),(7,10,8),(8,11,8),(9,12,8),(10,13,8),(11,14,8),(12,15,8),(13,2,8),(14,19,8),(15,20,8),(16,21,8),(17,22,8),(18,23,8),(19,24,8),(20,25,8),(21,26,8),(22,27,8),(23,28,8),(24,29,8),(25,3,8),(26,33,8),(27,34,8),(28,4,8),(29,1,9),(30,4,9),(31,5,9),(32,6,9),(33,7,9),(34,8,9),(35,9,9),(36,10,9),(37,11,9),(38,19,9),(39,20,9),(40,21,9),(41,22,9),(42,23,9),(43,24,9),(44,25,9),(45,33,9),(46,34,9);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_bandwidth`
--

LOCK TABLES `network_bandwidth` WRITE;
/*!40000 ALTER TABLE `network_bandwidth` DISABLE KEYS */;
INSERT INTO `network_bandwidth` VALUES (1,'长城宽带',10,1,500,100,'',1,1,27,22);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_bandwidth_state`
--

LOCK TABLES `network_bandwidth_state` WRITE;
/*!40000 ALTER TABLE `network_bandwidth_state` DISABLE KEYS */;
INSERT INTO `network_bandwidth_state` VALUES (1,'使用中',0,'2016-06-02 15:13:45','admin','admin','2016-06-02 15:13:53'),(2,'下线',0,'2016-06-02 15:14:08','admin','admin','2016-06-02 15:14:18'),(3,'故障',0,'2016-06-02 15:14:30','admin','admin','2016-06-02 15:14:40'),(4,'维修',0,'2016-06-02 15:14:51','admin','admin','2016-06-02 15:14:58');
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
  PRIMARY KEY (`networkipid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkip`
--

LOCK TABLES `networkip` WRITE;
/*!40000 ALTER TABLE `networkip` DISABLE KEYS */;
INSERT INTO `networkip` VALUES (9,'22.22.22.22','22.22.22.22','A类',4,'',35,1,27);
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
  PRIMARY KEY (`rackid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack`
--

LOCK TABLES `rack` WRITE;
/*!40000 ALTER TABLE `rack` DISABLE KEYS */;
INSERT INTO `rack` VALUES (22,'普陀-核心应用-0987',6,2,1,3,3,10,0,0,4,'                                            ',1,27);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack_state`
--

LOCK TABLES `rack_state` WRITE;
/*!40000 ALTER TABLE `rack_state` DISABLE KEYS */;
INSERT INTO `rack_state` VALUES (1,'使用中',0,'2016-06-01 15:51:40','admin','admin','2016-06-01 15:51:49'),(2,'故障',0,'2016-06-01 15:52:40','admin','admin','2016-06-01 15:52:50'),(3,'维修',0,'2016-06-01 15:53:08','admin','admin','2016-06-01 15:53:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (8,'超级管理员',0,'2016-07-10 15:38:34','','','2016-07-10 15:38:34'),(9,'普通管理员',0,'2016-07-10 15:39:10','','','2016-07-10 15:39:10');
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
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (27,'漕河泾机房','1','308','','韩顺平','李艳恢','李兴华','无闻',24,1),(28,'酒仙桥机房','1','507','','孙洪山','姜钰','张博','王鑫',29,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_state`
--

LOCK TABLES `room_state` WRITE;
/*!40000 ALTER TABLE `room_state` DISABLE KEYS */;
INSERT INTO `room_state` VALUES (1,'使用中',0,'2016-05-31 14:16:06','admin','admin','2016-05-31 14:16:51'),(2,'测试中',0,'2016-05-31 14:16:08','admin','admin','2016-05-31 14:16:48'),(4,'下线',0,'2016-05-31 14:16:11','admin','admin','2016-05-31 14:16:59');
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
  PRIMARY KEY (`serverid`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,'ER34D-3DDFC-434FD-43433','PowerEdge R730',0,0,'                                                        ',5,1,35,22,1,2,2,4,1,2,1),(2,'WWF23-FG232-DE343-34534','Xeon E5-2603 v3',0,0,'                                                        ',3,1,35,22,1,1,1,1,3,2,1),(12,'Template OS Linux','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(13,'Template App Zabbix Server','',0,0,'',0,1,35,22,1,1,1,1,1,2,1),(14,'Template App Zabbix Proxy',' ',0,0,'',0,1,35,22,1,1,1,1,2,2,1),(15,'Template App Zabbix Agent','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(16,'Template SNMP Interfaces','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(17,'Template SNMP Generic','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(18,'Template SNMP Device','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(19,'Template SNMP OS Windows','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(20,'Template SNMP Disks','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(21,'Template SNMP OS Linux','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(22,'Template SNMP Processors','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(23,'Template IPMI Intel SR1530','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(24,'Template IPMI Intel SR1630','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(25,'Template App MySQL','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(26,'Template OS OpenBSD','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(27,'Template OS FreeBSD','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(28,'Template OS AIX','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(29,'Template OS HP-UX','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(30,'Template OS Solaris','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(31,'Template OS Mac OS X','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(32,'Template OS Windows bak','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(33,'Template JMX Generic','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(34,'Template JMX Tomcat','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(35,'Zabbix server','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(36,'Template Virt VMware','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(37,'Template Virt VMware Guest','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(38,'Template Virt VMware Hypervisor','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(39,'Template App FTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(40,'Template App HTTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(41,'Template App HTTPS Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(42,'Template App IMAP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(43,'Template App LDAP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(44,'Template App NNTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(45,'Template App NTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(46,'Template App POP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(47,'Template App SMTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(48,'Template App SSH Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(49,'Template App Telnet Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(50,'Template ICMP Ping','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(51,'Zabbix server app','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(52,'webapp-001','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(53,'WEB-2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(54,'WEB-1','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(55,'WEB-3','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(56,'WEB-4','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(57,'WEB-5','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(58,'WEB-6','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(59,'WEB-7','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(60,'WEB-8','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(61,'WEB-9','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(62,'WEB-10','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(63,'WEB-11','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(64,'WEB-12','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(65,'WEB-13','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(66,'WEB-14','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(67,'WEB-15','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(68,'WEB-16','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(69,'WEB-17','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(70,'WEB-18','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(71,'Zabbix server app1111','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(72,'Template OS Windows','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(73,'Template_MicrosoftSQLServer_Named_Instance','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(74,'Template_MicrosoftSQLServer_Default_Instance_SQLServer2008R2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(75,'Template_MicrosoftSQLServer_Default_Instance','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(76,'sqlserver','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(77,'Template Virt XenServer Hypervisor','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(78,'Template Virt XenServer Guest','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(79,'Template Virt XenServer','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(80,'Template App MS SQL Default Installation bak','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(81,'sqlserver-lld','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(82,'Template App MS SQL Default Installation LLD','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(83,'Nginx_Node01','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(84,'OneOaaS-Zabbix-ReDev-10.0.1.141','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(85,'OneOaas-CMDB-10.0.1.118','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(86,'OneOaas-Monitor-10.0.1.117','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(87,'OneOaas-gitlab-10.0.1.119','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(88,'Ubuntu14.04','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(89,'centos','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(90,'centos 6.6','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(91,'centos test   248','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(92,'centos1','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(93,'centos2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(94,'centos3','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(95,'centos4','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(96,'centos5','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(97,'centos6.6(B)','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(98,'cloudstack-10.0.1.125','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(99,'cmdbuild-10.0.1.127','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(100,'composer 154','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(101,'connection 185','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(102,'ftp-10.0.1.123','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(103,'jekins-10.0.1.124','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(104,'mysql-10.0.1.134','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(105,'mysql-10.0.1.135','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(106,'mysql-10.0.1.137','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(107,'onecmdb-10.0.1.126','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(108,'oneoaas-cmdb-dev-1-10.0.1.130','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(109,'oneoaas-cmdb-dev-2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(110,'oneoaas-cmdb-dev-3','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(111,'repo-10.0.1.122','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(112,'rpmbuild-10.0.1.115','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(113,'rpmtest-10.0.1.116','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(114,'server 2008 200','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(115,'server sql 2008','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(116,'vcsa-linux-33','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(117,'wiki-10.0.1.124','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(118,'win08-vcenter-10.0.1.120','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(119,'win7 temp','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(120,'zabbix-node1-10.0.1.128','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(121,'zabbix-node2-10.0.1.129','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(122,'zabbix2.2-10.0.1.112','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(123,'zabbix2.4-10.0.1.23','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(124,'zabbix3.0-10.0.1.114','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(125,'import-1','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(126,'import-2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(127,'import-3','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(128,'import-4','',0,0,'',0,1,1,1,1,1,1,1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_state`
--

LOCK TABLES `server_state` WRITE;
/*!40000 ALTER TABLE `server_state` DISABLE KEYS */;
INSERT INTO `server_state` VALUES (1,'使用中',0,'2016-06-03 16:50:11','admin','admin','2016-06-03 16:50:21'),(2,'库存',0,'2016-06-03 16:50:41','admin','admin','2016-06-03 16:50:49'),(3,'故障中',0,'2016-06-03 16:51:01','admin','admin','2016-06-03 16:51:08'),(4,'空闲',0,'2016-06-03 16:51:21','admin','admin','2016-06-03 16:51:29'),(5,'测试中',0,'2016-06-03 16:51:39','admin','admin','2016-06-03 16:51:49'),(6,'搬迁中',0,'2016-06-03 16:52:04','admin','admin','2016-06-03 16:52:12'),(7,'已过保',0,'2016-06-03 16:52:26','admin','admin','2016-06-03 16:52:33'),(8,'预占',0,'2016-06-03 16:53:01','admin','admin','2016-06-03 16:53:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (2,'DELL','李','021-6095 0835','021-60950835','3243@','赵','021-60950835','456564565','2323@','上海','oneoaas'),(3,'HUAWEI','孙','021-6095 0835','021-60950835','5454@','杨','021-60950835','234234234','2323@','上海','oneoaas');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,0,'test','test','test','test','test','test','test','test','test','2016-07-11 16:16:30','test','','2016-07-11 16:16:30'),(2,0,'oneoaas','datacenter','数据中心','','','','','添加','','2016-07-11 18:55:24','oneoaas','','2016-07-11 18:55:24'),(3,0,'oneoaas','datacenter','数据中心','','','','','添加','','2016-07-11 18:55:52','oneoaas','','2016-07-11 18:55:52');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
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
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact_phone` (`contact_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'oneoaas','admin','test@qq.com','18601706743','23d68a0f00ed8614d4e836f20ce018dd','xwQQoxl6n7`!@.[#','2016-07-10 15:41:31','2016-07-10 15:41:31',8),(15,'赵六','testop','11@qq.com','18712108091','9aec6e467fc36ee52cf99c08e553f460','V7Xwa>!1HA22\\[pg','2016-07-11 14:32:03','2016-07-11 14:32:03',9),(17,'liubin','heidsoft@qq.com','heidsoft@qq.com','18601706744','18c50c7990519beb4809ddc0bf503763','V7Xwa>!1HA22\\[pg','2016-07-14 09:48:32','2016-07-14 09:48:32',9),(18,'jake','heidsoft1@qq.com','heidsoft1@qq.com','18721706092','c9c48fe32e73949a5e89adfece2306e5','[eo7y#b$UXnC.#56','2016-07-14 09:55:20','2016-07-14 09:55:20',9),(19,'jake2','heidsoft2@qq.com','heidsoft2@qq.com','18721796092','8d4015d7113ce6bc5efbfeb33d825977','LGEwk*9%\';F*JW( ','2016-07-14 10:33:01','2016-07-14 10:33:01',9),(20,'aaa','heidsoft4@qq.com','heidsoft4@qq.com','1870298344','6eedf59f2f24c5563b9577a82c0e7cb5','DoSw3Z97h(kY%sK.','2016-07-14 10:34:24','2016-07-14 10:34:24',9),(21,'jake','heidsoft5@qq.com','heidsoft5@qq.com','18721870932','82c0ba30595b0c0cf2af783446c5d0c1','$evs)\\/%yA_W7\\nR','2016-07-14 10:38:29','2016-07-14 10:38:29',9);
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

-- Dump completed on 2016-07-15 16:42:48
