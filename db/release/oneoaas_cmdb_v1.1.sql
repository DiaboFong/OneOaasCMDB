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
-- Table structure for table `access_key`
--

DROP TABLE IF EXISTS `access_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `access_key_id` varchar(50) DEFAULT NULL,
  `access_key_secret` varchar(50) DEFAULT NULL,
  `is_disable` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `expire_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_key`
--

LOCK TABLES `access_key` WRITE;
/*!40000 ALTER TABLE `access_key` DISABLE KEYS */;
INSERT INTO `access_key` VALUES (3,4,'fd189b20d075116df34b486d8ef5a4bd','2f6df3df1b77499500fa8b4aaa5f282b1fd4d0c5',1,0,'2016-07-20 18:53:31','2016-07-20 18:53:31'),(4,4,'74c7e9d74065a29cd9c7b55b7788724f','48ad3eebed7ddf711fc4cded2362866486924076',1,0,'2016-07-20 18:53:46','2016-07-20 18:53:46'),(5,4,'24c900dafe1e643fbb416deb8574b8ba','81d23a293502fd3cac8e33d433c400ea70edc2d9',0,1,'2016-07-20 18:54:18','2016-07-20 18:54:18');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asserts`
--

LOCK TABLES `asserts` WRITE;
/*!40000 ALTER TABLE `asserts` DISABLE KEYS */;
INSERT INTO `asserts` VALUES (5,'firewall','防火墙',0,0,0),(6,'my_os','操作系统',0,0,0),(7,'test','bbb',0,0,0);
/*!40000 ALTER TABLE `asserts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenter`
--

LOCK TABLES `datacenter` WRITE;
/*!40000 ALTER TABLE `datacenter` DISABLE KEYS */;
INSERT INTO `datacenter` VALUES (33,'test','安徽','安庆市','太湖县','test','120.22','test',1,1,2),(34,'test2','安徽','安庆市','太湖县','test2','22.44','test',1,1,2),(35,'test3','安徽','安庆市','太湖县','test2','22.44','test',1,1,2),(36,'testaa','安徽','安庆市','太湖县','testaa','22.33','test',1,1,2);
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
  `level` bigint(5) DEFAULT NULL,
  `logo` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'dashbord','仪表盘','',0,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(2,'resource_query','资源查询','',0,0,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(3,'resource_change','资源变更','',0,0,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(4,'system_manage','系统管理','',0,0,NULL,'admin','','2016-07-10 15:39:10',0,NULL,NULL),(5,'selectdatacenter','查询数据中心','/selectdatacenter',2,1,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(6,'selectroom','查询机房','/selectroom',2,1,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(7,'selectrack','查询机柜','/selectrack',2,1,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(8,'selectbandwidth','查询带宽','/selectbandwidth',2,1,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(9,'selecthardware','查询硬件','/selecthardware',2,1,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(10,'selectserver','查询服务器','/selectserver',2,1,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(11,'selectip','查询IP','/selectip',2,1,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(12,'selectdomain','查询域名','/selectdomain',2,1,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(13,'selectsupplier','查询供应商','/selectsupplier',2,1,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(14,'selectagreement','查询合同','/selectagreement',2,1,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(15,'selectapp','查询业务模块','/selectapp',2,1,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(16,'selectstatistical','查询统计分析','/selectstatistical',2,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0,NULL,NULL),(17,'selectresources','查询资源导入','/selectresources',2,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0,NULL,NULL),(18,'selectchange','查询变更管理','/selectchange',2,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0,NULL,NULL),(19,'managedatacenter','管理数据中心','/managedatacenter',3,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(20,'manageroom','管理机房','/manageroom',3,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(21,'managerack','管理机柜','/managerack',3,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(22,'managebandwidth','管理带宽','/managebandwidth',3,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(23,'managehardware','管理硬件','/managehardware',3,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(24,'manageserver','管理服务器','/manageserver',3,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(25,'manageip','管理IP','/manageip',3,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(26,'managedomain','管理域名','/managedomain',3,0,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(27,'managesupplier','管理供应商','/managesupplier',3,0,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(28,'manageagreement','管理合同','/manageagreement',3,0,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(29,'manageapp','管理业务模块','/manageapp',3,0,NULL,'admin','','2016-07-10 15:38:34',0,NULL,NULL),(30,'managestatistical','管理统计分析','/managestatistical',3,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0,NULL,NULL),(31,'manageresources','管理资源导入','/manageresources',3,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0,NULL,NULL),(32,'managechange','管理变更管理','/managechange',3,1,NULL,'admin',NULL,'2016-04-28 16:33:54',0,NULL,NULL),(33,'systemuser','用户管理','/systemuser',4,0,NULL,'admin','','2016-07-10 15:39:10',0,NULL,NULL),(34,'systemconfig','系统配置','/systemconfig',4,0,NULL,'admin','','2016-07-10 15:39:10',0,NULL,NULL),(39,'manage_vcenter_vm','管理VCENTER资源','/manage_vcenter_vm',3,0,'2016-07-18 16:28:23','oneoaas','','2016-07-18 16:28:23',0,2,0),(40,'manage_aliyun_vm','管理阿里云虚拟机','/manage_aliyun_vm',3,0,'2016-07-18 16:29:18','oneoaas','','2016-07-18 16:29:18',0,2,0),(41,'manage_aws_vm','管理AWS虚拟机','/manage_aws_vm',3,0,'2016-07-18 16:29:38','oneoaas','','2016-07-18 16:29:38',0,2,0),(42,'select_vcenter_vm','查询VCENTER虚拟机','/select_vcenter_vm',2,1,'2016-07-18 16:34:55','oneoaas','','2016-07-18 16:34:55',0,2,0),(43,'select_aliyun_vm','查询阿里云虚拟机','/select_aliyun_vm',2,1,'2016-07-18 16:35:24','oneoaas','','2016-07-18 16:35:24',0,2,0),(44,'select_aws_vm','查询AWS虚拟机','/select_aws_vm',2,1,'2016-07-18 16:35:40','oneoaas','','2016-07-18 16:35:40',0,2,0),(45,'system_api','API访问','/system_api',4,0,'2016-07-19 18:37:15','oneoaas','','2016-07-19 18:37:15',0,2,0),(46,'resource_view','资源可视化','/resource_view',2,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL),(47,'resource_quick','资源查询','/resource_quick',2,0,NULL,'admin','','2016-07-10 15:39:30',0,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_roles`
--

LOCK TABLES `menu_roles` WRITE;
/*!40000 ALTER TABLE `menu_roles` DISABLE KEYS */;
INSERT INTO `menu_roles` VALUES (29,1,9),(30,4,9),(31,5,9),(32,6,9),(33,7,9),(34,8,9),(35,9,9),(36,10,9),(37,11,9),(38,19,9),(39,20,9),(40,21,9),(41,22,9),(42,23,9),(43,24,9),(44,25,9),(45,33,9),(46,34,9),(81,1,8),(82,2,8),(83,3,8),(84,4,8),(85,5,8),(86,6,8),(87,7,8),(88,8,8),(89,9,8),(90,10,8),(91,11,8),(92,12,8),(93,13,8),(94,14,8),(95,15,8),(96,19,8),(97,20,8),(98,21,8),(99,22,8),(100,23,8),(101,24,8),(102,25,8),(103,26,8),(104,27,8),(105,28,8),(106,29,8),(107,33,8),(108,34,8),(109,39,8),(110,40,8),(111,41,8),(112,42,8),(113,43,8),(114,44,8),(115,45,8);
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
INSERT INTO `role` VALUES (8,'超级管理员',0,'2016-07-10 15:38:34','','','2016-07-19 18:37:38'),(9,'普通管理员',0,'2016-07-10 15:39:10','','','2016-07-10 15:39:10');
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
INSERT INTO `server` VALUES (12,'Template OS Linux','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(15,'Template App Zabbix Agent','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(16,'Template SNMP Interfaces','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(17,'Template SNMP Generic','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(18,'Template SNMP Device','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(19,'Template SNMP OS Windows','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(20,'Template SNMP Disks','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(21,'Template SNMP OS Linux','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(22,'Template SNMP Processors','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(23,'Template IPMI Intel SR1530','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(24,'Template IPMI Intel SR1630','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(25,'Template App MySQL','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(26,'Template OS OpenBSD','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(27,'Template OS FreeBSD','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(28,'Template OS AIX','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(29,'Template OS HP-UX','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(30,'Template OS Solaris','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(31,'Template OS Mac OS X','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(32,'Template OS Windows bak','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(33,'Template JMX Generic','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(34,'Template JMX Tomcat','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(35,'Zabbix server','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(36,'Template Virt VMware','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(37,'Template Virt VMware Guest','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(38,'Template Virt VMware Hypervisor','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(39,'Template App FTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(40,'Template App HTTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(41,'Template App HTTPS Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(42,'Template App IMAP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(43,'Template App LDAP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(44,'Template App NNTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(45,'Template App NTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(46,'Template App POP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(47,'Template App SMTP Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(48,'Template App SSH Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(49,'Template App Telnet Service','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(50,'Template ICMP Ping','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(51,'Zabbix server app','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(52,'webapp-001','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(53,'WEB-2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(54,'WEB-1','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(55,'WEB-3','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(56,'WEB-4','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(57,'WEB-5','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(58,'WEB-6','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(59,'WEB-7','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(60,'WEB-8','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(61,'WEB-9','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(62,'WEB-10','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(63,'WEB-11','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(64,'WEB-12','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(65,'WEB-13','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(66,'WEB-14','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(67,'WEB-15','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(68,'WEB-16','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(69,'WEB-17','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(70,'WEB-18','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(71,'Zabbix server app1111','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(72,'Template OS Windows','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(73,'Template_MicrosoftSQLServer_Named_Instance','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(74,'Template_MicrosoftSQLServer_Default_Instance_SQLServer2008R2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(75,'Template_MicrosoftSQLServer_Default_Instance','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(76,'sqlserver','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(77,'Template Virt XenServer Hypervisor','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(78,'Template Virt XenServer Guest','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(79,'Template Virt XenServer','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(80,'Template App MS SQL Default Installation bak','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(81,'sqlserver-lld','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(82,'Template App MS SQL Default Installation LLD','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(83,'Nginx_Node01','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(84,'OneOaaS-Zabbix-ReDev-10.0.1.141','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(85,'OneOaas-CMDB-10.0.1.118','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(86,'OneOaas-Monitor-10.0.1.117','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(87,'OneOaas-gitlab-10.0.1.119','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(88,'Ubuntu14.04','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(89,'centos','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(90,'centos 6.6','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(91,'centos test   248','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(92,'centos1','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(93,'centos2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(94,'centos3','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(95,'centos4','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(96,'centos5','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(97,'centos6.6(B)','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(98,'cloudstack-10.0.1.125','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(99,'cmdbuild-10.0.1.127','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(100,'composer 154','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(101,'connection 185','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(102,'ftp-10.0.1.123','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(103,'jekins-10.0.1.124','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(104,'mysql-10.0.1.134','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(105,'mysql-10.0.1.135','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(106,'mysql-10.0.1.137','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(107,'onecmdb-10.0.1.126','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(108,'oneoaas-cmdb-dev-1-10.0.1.130','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(109,'oneoaas-cmdb-dev-2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(110,'oneoaas-cmdb-dev-3','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(111,'repo-10.0.1.122','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(112,'rpmbuild-10.0.1.115','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(113,'rpmtest-10.0.1.116','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(114,'server 2008 200','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(115,'server sql 2008','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(116,'vcsa-linux-33','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(117,'wiki-10.0.1.124','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(118,'win08-vcenter-10.0.1.120','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(119,'win7 temp','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(120,'zabbix-node1-10.0.1.128','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(121,'zabbix-node2-10.0.1.129','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(122,'zabbix2.2-10.0.1.112','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(123,'zabbix2.4-10.0.1.23','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(124,'zabbix3.0-10.0.1.114','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(125,'import-1','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(126,'import-2','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(127,'import-3','',0,0,'',0,1,1,1,1,1,1,1,1,1,1),(128,'import-4','',0,0,'',0,1,1,1,1,1,1,1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,0,'test','test','test','test','test','test','test','test','test','2016-07-11 16:16:30','test','','2016-07-11 16:16:30'),(2,0,'oneoaas','datacenter','数据中心','','','','','添加','','2016-07-11 18:55:24','oneoaas','','2016-07-11 18:55:24'),(3,0,'oneoaas','datacenter','数据中心','','','','','添加','','2016-07-11 18:55:52','oneoaas','','2016-07-11 18:55:52'),(4,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 15:41:28','oneoaas','','2016-07-18 15:41:28'),(5,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 15:42:14','oneoaas','','2016-07-18 15:42:14'),(6,0,'oneoaas','Menu','菜单','','','','','删除','','2016-07-18 15:42:38','oneoaas','','2016-07-18 15:42:38'),(7,0,'oneoaas','Menu','菜单','','','','','删除','','2016-07-18 15:42:42','oneoaas','','2016-07-18 15:42:42'),(8,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 15:43:37','oneoaas','','2016-07-18 15:43:37'),(9,0,'oneoaas','Menu','菜单','','','','','删除','','2016-07-18 15:44:04','oneoaas','','2016-07-18 15:44:04'),(10,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 15:55:10','oneoaas','','2016-07-18 15:55:10'),(11,0,'oneoaas','Menu','菜单','','','','','删除','','2016-07-18 16:27:29','oneoaas','','2016-07-18 16:27:29'),(12,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 16:28:23','oneoaas','','2016-07-18 16:28:23'),(13,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 16:29:18','oneoaas','','2016-07-18 16:29:18'),(14,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 16:29:38','oneoaas','','2016-07-18 16:29:38'),(15,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 16:34:55','oneoaas','','2016-07-18 16:34:55'),(16,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 16:35:24','oneoaas','','2016-07-18 16:35:24'),(17,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-18 16:35:40','oneoaas','','2016-07-18 16:35:40'),(18,0,'oneoaas','Role','角色','','','','','更新','','2016-07-18 16:44:31','oneoaas','','2016-07-18 16:44:31'),(19,0,'oneoaas','Menu','菜单','','','','','添加','','2016-07-19 18:37:15','oneoaas','','2016-07-19 18:37:15'),(20,0,'oneoaas','Role','角色','','','','','更新','','2016-07-19 18:37:38','oneoaas','','2016-07-19 18:37:38'),(21,0,'oneoaas','User','用户','','','','','删除','','2016-07-30 11:29:36','oneoaas','','2016-07-30 11:29:36'),(22,0,'oneoaas','User','用户','','','','','删除','','2016-07-30 11:29:39','oneoaas','','2016-07-30 11:29:39'),(23,0,'oneoaas','User','用户','','','','','删除','','2016-07-30 11:29:41','oneoaas','','2016-07-30 11:29:41'),(24,0,'oneoaas','User','用户','','','','','删除','','2016-07-30 11:29:44','oneoaas','','2016-07-30 11:29:44'),(25,0,'oneoaas','User','用户','','','','','删除','','2016-07-30 11:29:46','oneoaas','','2016-07-30 11:29:46'),(26,0,'oneoaas','User','用户','','','','','删除','','2016-07-30 11:29:49','oneoaas','','2016-07-30 11:29:49'),(27,0,'oneoaas','Datacenter','数据中心','','','','','删除','','2016-08-08 17:05:18','oneoaas','','2016-08-08 17:05:18'),(28,0,'oneoaas','Room','机房','','','','','删除','','2016-08-12 15:37:54','oneoaas','','2016-08-12 15:37:54'),(29,0,'oneoaas','Datacenter','数据中心','','','','','删除','','2016-08-12 15:43:50','oneoaas','','2016-08-12 15:43:50'),(30,0,'oneoaas','Datacenter','数据中心','','','','','添加','','2016-08-15 10:05:30','oneoaas','','2016-08-15 10:05:30'),(31,0,'oneoaas','Datacenter','数据中心','','','','','添加','','2016-08-15 10:05:31','oneoaas','','2016-08-15 10:05:31'),(32,0,'oneoaas','Datacenter','数据中心','','','','','添加','','2016-08-15 10:11:19','oneoaas','','2016-08-15 10:11:19'),(33,0,'oneoaas','Datacenter','数据中心','','','','','添加','','2016-08-15 10:11:35','oneoaas','','2016-08-15 10:11:35'),(34,0,'oneoaas','Datacenter','数据中心','','','','','添加','','2016-08-15 10:18:13','oneoaas','','2016-08-15 10:18:13'),(35,0,'oneoaas','Datacenter','数据中心','','','','','添加','','2016-08-15 10:29:23','oneoaas','','2016-08-15 10:29:23'),(36,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-15 16:36:40','oneoaas','','2016-08-15 16:36:40'),(37,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-15 16:36:53','oneoaas','','2016-08-15 16:36:53'),(38,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-15 16:43:04','oneoaas','','2016-08-15 16:43:04'),(39,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-15 16:52:49','oneoaas','','2016-08-15 16:52:49'),(40,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 16:18:03','oneoaas','','2016-08-17 16:18:03'),(41,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 16:19:24','oneoaas','','2016-08-17 16:19:24'),(42,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 16:46:45','oneoaas','','2016-08-17 16:46:45'),(43,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 17:24:56','oneoaas','','2016-08-17 17:24:56'),(44,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 17:25:15','oneoaas','','2016-08-17 17:25:15'),(45,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 17:47:10','oneoaas','','2016-08-17 17:47:10'),(46,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 17:49:51','oneoaas','','2016-08-17 17:49:51'),(47,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 17:50:21','oneoaas','','2016-08-17 17:50:21'),(48,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 17:51:34','oneoaas','','2016-08-17 17:51:34'),(49,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 17:52:36','oneoaas','','2016-08-17 17:52:36'),(50,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 17:53:50','oneoaas','','2016-08-17 17:53:50'),(51,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 17:53:52','oneoaas','','2016-08-17 17:53:52'),(52,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:01:47','oneoaas','','2016-08-17 18:01:47'),(53,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 18:02:08','oneoaas','','2016-08-17 18:02:08'),(54,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 18:03:11','oneoaas','','2016-08-17 18:03:11'),(55,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:09:38','oneoaas','','2016-08-17 18:09:38'),(56,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 18:09:56','oneoaas','','2016-08-17 18:09:56'),(57,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:32:44','oneoaas','','2016-08-17 18:32:44'),(58,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 18:33:05','oneoaas','','2016-08-17 18:33:05'),(59,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:33:06','oneoaas','','2016-08-17 18:33:06'),(60,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-17 18:33:26','oneoaas','','2016-08-17 18:33:26'),(61,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:33:27','oneoaas','','2016-08-17 18:33:27'),(62,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:33:32','oneoaas','','2016-08-17 18:33:32'),(63,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:34:25','oneoaas','','2016-08-17 18:34:25'),(64,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:34:43','oneoaas','','2016-08-17 18:34:43'),(65,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:35:01','oneoaas','','2016-08-17 18:35:01'),(66,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:59:23','oneoaas','','2016-08-17 18:59:23'),(67,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:59:26','oneoaas','','2016-08-17 18:59:26'),(68,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 18:59:30','oneoaas','','2016-08-17 18:59:30'),(69,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 19:01:41','oneoaas','','2016-08-17 19:01:41'),(70,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 19:01:42','oneoaas','','2016-08-17 19:01:42'),(71,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 19:01:53','oneoaas','','2016-08-17 19:01:53'),(72,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-17 19:02:00','oneoaas','','2016-08-17 19:02:00'),(73,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:10:36','oneoaas','','2016-08-18 10:10:36'),(74,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:10:48','oneoaas','','2016-08-18 10:10:48'),(75,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:16:35','oneoaas','','2016-08-18 10:16:35'),(76,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:16:37','oneoaas','','2016-08-18 10:16:37'),(77,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:16:38','oneoaas','','2016-08-18 10:16:38'),(78,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:16:43','oneoaas','','2016-08-18 10:16:43'),(79,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:16:49','oneoaas','','2016-08-18 10:16:49'),(80,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:16:51','oneoaas','','2016-08-18 10:16:51'),(81,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:18:49','oneoaas','','2016-08-18 10:18:49'),(82,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:18:50','oneoaas','','2016-08-18 10:18:50'),(83,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:18:53','oneoaas','','2016-08-18 10:18:53'),(84,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 10:19:04','oneoaas','','2016-08-18 10:19:04'),(85,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 15:45:15','oneoaas','','2016-08-18 15:45:15'),(86,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 15:47:49','oneoaas','','2016-08-18 15:47:49'),(87,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 15:47:50','oneoaas','','2016-08-18 15:47:50'),(88,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 15:49:44','oneoaas','','2016-08-18 15:49:44'),(89,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 15:55:09','oneoaas','','2016-08-18 15:55:09'),(90,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:15:58','oneoaas','','2016-08-18 16:15:58'),(91,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:15:59','oneoaas','','2016-08-18 16:15:59'),(92,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:16:00','oneoaas','','2016-08-18 16:16:00'),(93,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:16:00','oneoaas','','2016-08-18 16:16:00'),(94,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:16:41','oneoaas','','2016-08-18 16:16:41'),(95,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:16:47','oneoaas','','2016-08-18 16:16:47'),(96,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:16:53','oneoaas','','2016-08-18 16:16:53'),(97,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:03','oneoaas','','2016-08-18 16:17:03'),(98,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:03','oneoaas','','2016-08-18 16:17:03'),(99,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:04','oneoaas','','2016-08-18 16:17:04'),(100,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:04','oneoaas','','2016-08-18 16:17:04'),(101,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:04','oneoaas','','2016-08-18 16:17:04'),(102,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:04','oneoaas','','2016-08-18 16:17:04'),(103,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:05','oneoaas','','2016-08-18 16:17:05'),(104,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:05','oneoaas','','2016-08-18 16:17:05'),(105,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:05','oneoaas','','2016-08-18 16:17:05'),(106,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:05','oneoaas','','2016-08-18 16:17:05'),(107,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:06','oneoaas','','2016-08-18 16:17:06'),(108,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:06','oneoaas','','2016-08-18 16:17:06'),(109,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:07','oneoaas','','2016-08-18 16:17:07'),(110,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:07','oneoaas','','2016-08-18 16:17:07'),(111,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:08','oneoaas','','2016-08-18 16:17:08'),(112,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:09','oneoaas','','2016-08-18 16:17:09'),(113,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:09','oneoaas','','2016-08-18 16:17:09'),(114,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:10','oneoaas','','2016-08-18 16:17:10'),(115,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:11','oneoaas','','2016-08-18 16:17:11'),(116,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:12','oneoaas','','2016-08-18 16:17:12'),(117,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:17:13','oneoaas','','2016-08-18 16:17:13'),(118,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:18:14','oneoaas','','2016-08-18 16:18:14'),(119,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:18:15','oneoaas','','2016-08-18 16:18:15'),(120,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:18:15','oneoaas','','2016-08-18 16:18:15'),(121,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:21:05','oneoaas','','2016-08-18 16:21:05'),(122,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:38','oneoaas','','2016-08-18 16:22:38'),(123,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:38','oneoaas','','2016-08-18 16:22:38'),(124,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:39','oneoaas','','2016-08-18 16:22:39'),(125,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:39','oneoaas','','2016-08-18 16:22:39'),(126,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:40','oneoaas','','2016-08-18 16:22:40'),(127,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:41','oneoaas','','2016-08-18 16:22:41'),(128,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:43','oneoaas','','2016-08-18 16:22:43'),(129,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:44','oneoaas','','2016-08-18 16:22:44'),(130,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:45','oneoaas','','2016-08-18 16:22:45'),(131,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:46','oneoaas','','2016-08-18 16:22:46'),(132,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:22:46','oneoaas','','2016-08-18 16:22:46'),(133,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:23:08','oneoaas','','2016-08-18 16:23:08'),(134,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:23:09','oneoaas','','2016-08-18 16:23:09'),(135,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:23:09','oneoaas','','2016-08-18 16:23:09'),(136,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:23:10','oneoaas','','2016-08-18 16:23:10'),(137,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:23:11','oneoaas','','2016-08-18 16:23:11'),(138,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:23:11','oneoaas','','2016-08-18 16:23:11'),(139,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:24:09','oneoaas','','2016-08-18 16:24:09'),(140,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:24:10','oneoaas','','2016-08-18 16:24:10'),(141,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:24:10','oneoaas','','2016-08-18 16:24:10'),(142,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:24:11','oneoaas','','2016-08-18 16:24:11'),(143,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:24:11','oneoaas','','2016-08-18 16:24:11'),(144,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:24:19','oneoaas','','2016-08-18 16:24:19'),(145,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:25:52','oneoaas','','2016-08-18 16:25:52'),(146,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:25:53','oneoaas','','2016-08-18 16:25:53'),(147,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:25:59','oneoaas','','2016-08-18 16:25:59'),(148,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:31:36','oneoaas','','2016-08-18 16:31:36'),(149,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:31:38','oneoaas','','2016-08-18 16:31:38'),(150,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:31:40','oneoaas','','2016-08-18 16:31:40'),(151,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:31:46','oneoaas','','2016-08-18 16:31:46'),(152,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:52:15','oneoaas','','2016-08-18 16:52:15'),(153,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:52:16','oneoaas','','2016-08-18 16:52:16'),(154,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:52:33','oneoaas','','2016-08-18 16:52:33'),(155,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:52:34','oneoaas','','2016-08-18 16:52:34'),(156,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:52:35','oneoaas','','2016-08-18 16:52:35'),(157,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 16:53:07','oneoaas','','2016-08-18 16:53:07'),(158,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:53:08','oneoaas','','2016-08-18 16:53:08'),(159,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:53:28','oneoaas','','2016-08-18 16:53:28'),(160,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 16:53:29','oneoaas','','2016-08-18 16:53:29'),(161,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 16:53:55','oneoaas','','2016-08-18 16:53:55'),(162,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:05:56','oneoaas','','2016-08-18 17:05:56'),(163,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:05:57','oneoaas','','2016-08-18 17:05:57'),(164,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:05:57','oneoaas','','2016-08-18 17:05:57'),(165,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:05:58','oneoaas','','2016-08-18 17:05:58'),(166,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:05:59','oneoaas','','2016-08-18 17:05:59'),(167,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 17:06:40','oneoaas','','2016-08-18 17:06:40'),(168,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:06:40','oneoaas','','2016-08-18 17:06:40'),(169,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:08:44','oneoaas','','2016-08-18 17:08:44'),(170,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 17:09:04','oneoaas','','2016-08-18 17:09:04'),(171,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:17:50','oneoaas','','2016-08-18 17:17:50'),(172,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:17:51','oneoaas','','2016-08-18 17:17:51'),(173,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:01','oneoaas','','2016-08-18 17:18:01'),(174,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-18 17:18:08','oneoaas','','2016-08-18 17:18:08'),(175,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:12','oneoaas','','2016-08-18 17:18:12'),(176,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:12','oneoaas','','2016-08-18 17:18:12'),(177,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:15','oneoaas','','2016-08-18 17:18:15'),(178,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:16','oneoaas','','2016-08-18 17:18:16'),(179,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:20','oneoaas','','2016-08-18 17:18:20'),(180,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:21','oneoaas','','2016-08-18 17:18:21'),(181,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:22','oneoaas','','2016-08-18 17:18:22'),(182,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:22','oneoaas','','2016-08-18 17:18:22'),(183,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:24','oneoaas','','2016-08-18 17:18:24'),(184,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:29','oneoaas','','2016-08-18 17:18:29'),(185,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:29','oneoaas','','2016-08-18 17:18:29'),(186,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:30','oneoaas','','2016-08-18 17:18:30'),(187,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:18:46','oneoaas','','2016-08-18 17:18:46'),(188,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 17:19:08','oneoaas','','2016-08-18 17:19:08'),(189,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 17:19:10','oneoaas','','2016-08-18 17:19:10'),(190,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:19:39','oneoaas','','2016-08-18 17:19:39'),(191,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:19:40','oneoaas','','2016-08-18 17:19:40'),(192,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:19:41','oneoaas','','2016-08-18 17:19:41'),(193,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:19:45','oneoaas','','2016-08-18 17:19:45'),(194,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:19:46','oneoaas','','2016-08-18 17:19:46'),(195,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:19:48','oneoaas','','2016-08-18 17:19:48'),(196,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 17:21:50','oneoaas','','2016-08-18 17:21:50'),(197,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:22:10','oneoaas','','2016-08-18 17:22:10'),(198,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:33:07','oneoaas','','2016-08-18 17:33:07'),(199,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:33:08','oneoaas','','2016-08-18 17:33:08'),(200,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:33:09','oneoaas','','2016-08-18 17:33:09'),(201,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:33:10','oneoaas','','2016-08-18 17:33:10'),(202,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:33:19','oneoaas','','2016-08-18 17:33:19'),(203,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:33:20','oneoaas','','2016-08-18 17:33:20'),(204,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 17:33:49','oneoaas','','2016-08-18 17:33:49'),(205,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 17:34:00','oneoaas','','2016-08-18 17:34:00'),(206,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:34:33','oneoaas','','2016-08-18 17:34:33'),(207,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:34:42','oneoaas','','2016-08-18 17:34:42'),(208,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:07','oneoaas','','2016-08-18 17:59:07'),(209,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:08','oneoaas','','2016-08-18 17:59:08'),(210,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:09','oneoaas','','2016-08-18 17:59:09'),(211,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:18','oneoaas','','2016-08-18 17:59:18'),(212,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:19','oneoaas','','2016-08-18 17:59:19'),(213,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:23','oneoaas','','2016-08-18 17:59:23'),(214,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:23','oneoaas','','2016-08-18 17:59:23'),(215,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:30','oneoaas','','2016-08-18 17:59:30'),(216,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:31','oneoaas','','2016-08-18 17:59:31'),(217,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 17:59:37','oneoaas','','2016-08-18 17:59:37'),(218,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 17:59:57','oneoaas','','2016-08-18 17:59:57'),(219,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 17:59:57','oneoaas','','2016-08-18 17:59:57'),(220,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:00:01','oneoaas','','2016-08-18 18:00:01'),(221,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:00:02','oneoaas','','2016-08-18 18:00:02'),(222,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:00:03','oneoaas','','2016-08-18 18:00:03'),(223,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:00:03','oneoaas','','2016-08-18 18:00:03'),(224,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:00:04','oneoaas','','2016-08-18 18:00:04'),(225,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:05:50','oneoaas','','2016-08-18 18:05:50'),(226,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:05:57','oneoaas','','2016-08-18 18:05:57'),(227,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:06:00','oneoaas','','2016-08-18 18:06:00'),(228,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:06:01','oneoaas','','2016-08-18 18:06:01'),(229,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:06:01','oneoaas','','2016-08-18 18:06:01'),(230,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:06:02','oneoaas','','2016-08-18 18:06:02'),(231,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:06:02','oneoaas','','2016-08-18 18:06:02'),(232,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:06:05','oneoaas','','2016-08-18 18:06:05'),(233,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:06:16','oneoaas','','2016-08-18 18:06:16'),(234,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 18:06:35','oneoaas','','2016-08-18 18:06:35'),(235,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-18 18:08:23','oneoaas','','2016-08-18 18:08:23'),(236,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:08:32','oneoaas','','2016-08-18 18:08:32'),(237,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:08:40','oneoaas','','2016-08-18 18:08:40'),(238,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:08:46','oneoaas','','2016-08-18 18:08:46'),(239,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:09:05','oneoaas','','2016-08-18 18:09:05'),(240,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:09:07','oneoaas','','2016-08-18 18:09:07'),(241,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:09:09','oneoaas','','2016-08-18 18:09:09'),(242,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:09:09','oneoaas','','2016-08-18 18:09:09'),(243,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:09:12','oneoaas','','2016-08-18 18:09:12'),(244,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:09:13','oneoaas','','2016-08-18 18:09:13'),(245,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:23:07','oneoaas','','2016-08-18 18:23:07'),(246,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:23:09','oneoaas','','2016-08-18 18:23:09'),(247,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:23:09','oneoaas','','2016-08-18 18:23:09'),(248,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-18 18:23:28','oneoaas','','2016-08-18 18:23:28'),(249,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:06','oneoaas','','2016-08-19 10:18:06'),(250,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:08','oneoaas','','2016-08-19 10:18:08'),(251,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:08','oneoaas','','2016-08-19 10:18:08'),(252,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:09','oneoaas','','2016-08-19 10:18:09'),(253,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:10','oneoaas','','2016-08-19 10:18:10'),(254,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:12','oneoaas','','2016-08-19 10:18:12'),(255,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:29','oneoaas','','2016-08-19 10:18:29'),(256,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:49','oneoaas','','2016-08-19 10:18:49'),(257,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:49','oneoaas','','2016-08-19 10:18:49'),(258,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:50','oneoaas','','2016-08-19 10:18:50'),(259,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:56','oneoaas','','2016-08-19 10:18:56'),(260,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:57','oneoaas','','2016-08-19 10:18:57'),(261,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:18:57','oneoaas','','2016-08-19 10:18:57'),(262,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:19:31','oneoaas','','2016-08-19 10:19:31'),(263,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:19:32','oneoaas','','2016-08-19 10:19:32'),(264,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:19:35','oneoaas','','2016-08-19 10:19:35'),(265,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:19:36','oneoaas','','2016-08-19 10:19:36'),(266,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:19:36','oneoaas','','2016-08-19 10:19:36'),(267,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:21:38','oneoaas','','2016-08-19 10:21:38'),(268,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:21:41','oneoaas','','2016-08-19 10:21:41'),(269,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:21:41','oneoaas','','2016-08-19 10:21:41'),(270,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:38:01','oneoaas','','2016-08-19 10:38:01'),(271,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:47:24','oneoaas','','2016-08-19 10:47:24'),(272,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:50:03','oneoaas','','2016-08-19 10:50:03'),(273,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:50:57','oneoaas','','2016-08-19 10:50:57'),(274,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:52:07','oneoaas','','2016-08-19 10:52:07'),(275,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:52:52','oneoaas','','2016-08-19 10:52:52'),(276,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:53:46','oneoaas','','2016-08-19 10:53:46'),(277,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:54:46','oneoaas','','2016-08-19 10:54:46'),(278,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:55:19','oneoaas','','2016-08-19 10:55:19'),(279,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:55:35','oneoaas','','2016-08-19 10:55:35'),(280,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-19 10:55:57','oneoaas','','2016-08-19 10:55:57'),(281,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-19 10:56:13','oneoaas','','2016-08-19 10:56:13'),(282,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:29','oneoaas','','2016-08-19 10:56:29'),(283,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:30','oneoaas','','2016-08-19 10:56:30'),(284,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:41','oneoaas','','2016-08-19 10:56:41'),(285,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:53','oneoaas','','2016-08-19 10:56:53'),(286,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:54','oneoaas','','2016-08-19 10:56:54'),(287,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:55','oneoaas','','2016-08-19 10:56:55'),(288,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:55','oneoaas','','2016-08-19 10:56:55'),(289,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:56','oneoaas','','2016-08-19 10:56:56'),(290,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:58','oneoaas','','2016-08-19 10:56:58'),(291,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:59','oneoaas','','2016-08-19 10:56:59'),(292,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:56:59','oneoaas','','2016-08-19 10:56:59'),(293,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:57:01','oneoaas','','2016-08-19 10:57:01'),(294,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:57:05','oneoaas','','2016-08-19 10:57:05'),(295,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:57:06','oneoaas','','2016-08-19 10:57:06'),(296,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 10:57:28','oneoaas','','2016-08-19 10:57:28'),(297,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:17:04','oneoaas','','2016-08-19 11:17:04'),(298,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:18:01','oneoaas','','2016-08-19 11:18:01'),(299,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:19:14','oneoaas','','2016-08-19 11:19:14'),(300,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:20:07','oneoaas','','2016-08-19 11:20:07'),(301,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:22:31','oneoaas','','2016-08-19 11:22:31'),(302,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:25:04','oneoaas','','2016-08-19 11:25:04'),(303,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:25:56','oneoaas','','2016-08-19 11:25:56'),(304,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:26:26','oneoaas','','2016-08-19 11:26:26'),(305,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:26:49','oneoaas','','2016-08-19 11:26:49'),(306,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:27:57','oneoaas','','2016-08-19 11:27:57'),(307,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:33:58','oneoaas','','2016-08-19 11:33:58'),(308,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:35:30','oneoaas','','2016-08-19 11:35:30'),(309,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:36:47','oneoaas','','2016-08-19 11:36:47'),(310,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:43:05','oneoaas','','2016-08-19 11:43:05'),(311,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:48:09','oneoaas','','2016-08-19 11:48:09'),(312,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:49:46','oneoaas','','2016-08-19 11:49:46'),(313,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 11:51:01','oneoaas','','2016-08-19 11:51:01'),(314,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 12:13:41','oneoaas','','2016-08-19 12:13:41'),(315,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 12:15:54','oneoaas','','2016-08-19 12:15:54'),(316,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 12:18:47','oneoaas','','2016-08-19 12:18:47'),(317,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 12:19:31','oneoaas','','2016-08-19 12:19:31'),(318,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 12:20:43','oneoaas','','2016-08-19 12:20:43'),(319,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 12:21:28','oneoaas','','2016-08-19 12:21:28'),(320,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 12:23:44','oneoaas','','2016-08-19 12:23:44'),(321,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 12:25:15','oneoaas','','2016-08-19 12:25:15'),(322,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 12:48:27','oneoaas','','2016-08-19 12:48:27'),(323,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 12:48:36','oneoaas','','2016-08-19 12:48:36'),(324,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:41:57','oneoaas','','2016-08-19 13:41:57'),(325,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:43:54','oneoaas','','2016-08-19 13:43:54'),(326,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:43:54','oneoaas','','2016-08-19 13:43:54'),(327,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:44:35','oneoaas','','2016-08-19 13:44:35'),(328,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:44:35','oneoaas','','2016-08-19 13:44:35'),(329,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 13:45:02','oneoaas','','2016-08-19 13:45:02'),(330,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:45:11','oneoaas','','2016-08-19 13:45:11'),(331,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:45:11','oneoaas','','2016-08-19 13:45:11'),(332,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:45:35','oneoaas','','2016-08-19 13:45:35'),(333,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:45:35','oneoaas','','2016-08-19 13:45:35'),(334,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 13:45:52','oneoaas','','2016-08-19 13:45:52'),(335,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:46:50','oneoaas','','2016-08-19 13:46:50'),(336,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:46:50','oneoaas','','2016-08-19 13:46:50'),(337,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:47:25','oneoaas','','2016-08-19 13:47:25'),(338,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:47:25','oneoaas','','2016-08-19 13:47:25'),(339,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:48:49','oneoaas','','2016-08-19 13:48:49'),(340,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:48:49','oneoaas','','2016-08-19 13:48:49'),(341,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:49:23','oneoaas','','2016-08-19 13:49:23'),(342,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:49:23','oneoaas','','2016-08-19 13:49:23'),(343,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:56:51','oneoaas','','2016-08-19 13:56:51'),(344,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:56:51','oneoaas','','2016-08-19 13:56:51'),(345,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:58:10','oneoaas','','2016-08-19 13:58:10'),(346,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 13:58:10','oneoaas','','2016-08-19 13:58:10'),(347,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:06:54','oneoaas','','2016-08-19 15:06:54'),(348,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:06:55','oneoaas','','2016-08-19 15:06:55'),(349,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:07:04','oneoaas','','2016-08-19 15:07:04'),(350,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:07:19','oneoaas','','2016-08-19 15:07:19'),(351,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:07:20','oneoaas','','2016-08-19 15:07:20'),(352,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:07:20','oneoaas','','2016-08-19 15:07:20'),(353,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:08:02','oneoaas','','2016-08-19 15:08:02'),(354,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-19 15:08:27','oneoaas','','2016-08-19 15:08:27'),(355,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:11:51','oneoaas','','2016-08-19 15:11:51'),(356,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-19 15:12:11','oneoaas','','2016-08-19 15:12:11'),(357,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-19 15:12:32','oneoaas','','2016-08-19 15:12:32'),(358,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:12:50','oneoaas','','2016-08-19 15:12:50'),(359,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:13:15','oneoaas','','2016-08-19 15:13:15'),(360,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:13:25','oneoaas','','2016-08-19 15:13:25'),(361,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:13:25','oneoaas','','2016-08-19 15:13:25'),(362,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 15:13:36','oneoaas','','2016-08-19 15:13:36'),(363,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 15:13:47','oneoaas','','2016-08-19 15:13:47'),(364,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:13:53','oneoaas','','2016-08-19 15:13:53'),(365,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:13:53','oneoaas','','2016-08-19 15:13:53'),(366,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:14:00','oneoaas','','2016-08-19 15:14:00'),(367,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:14:00','oneoaas','','2016-08-19 15:14:00'),(368,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:57:38','oneoaas','','2016-08-19 15:57:38'),(369,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:57:38','oneoaas','','2016-08-19 15:57:38'),(370,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:57:48','oneoaas','','2016-08-19 15:57:48'),(371,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:57:48','oneoaas','','2016-08-19 15:57:48'),(372,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:58:01','oneoaas','','2016-08-19 15:58:01'),(373,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:58:01','oneoaas','','2016-08-19 15:58:01'),(374,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:58:46','oneoaas','','2016-08-19 15:58:46'),(375,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:58:52','oneoaas','','2016-08-19 15:58:52'),(376,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:58:58','oneoaas','','2016-08-19 15:58:58'),(377,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:58:58','oneoaas','','2016-08-19 15:58:58'),(378,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:58:59','oneoaas','','2016-08-19 15:58:59'),(379,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:59:00','oneoaas','','2016-08-19 15:59:00'),(380,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:59:00','oneoaas','','2016-08-19 15:59:00'),(381,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:59:05','oneoaas','','2016-08-19 15:59:05'),(382,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:59:06','oneoaas','','2016-08-19 15:59:06'),(383,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:59:07','oneoaas','','2016-08-19 15:59:07'),(384,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:59:08','oneoaas','','2016-08-19 15:59:08'),(385,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 15:59:09','oneoaas','','2016-08-19 15:59:09'),(386,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-19 15:59:36','oneoaas','','2016-08-19 15:59:36'),(387,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-19 16:03:34','oneoaas','','2016-08-19 16:03:34'),(388,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-19 16:03:43','oneoaas','','2016-08-19 16:03:43'),(389,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:03:52','oneoaas','','2016-08-19 16:03:52'),(390,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:03:56','oneoaas','','2016-08-19 16:03:56'),(391,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:03:56','oneoaas','','2016-08-19 16:03:56'),(392,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 16:04:06','oneoaas','','2016-08-19 16:04:06'),(393,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 16:04:26','oneoaas','','2016-08-19 16:04:26'),(394,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:04:37','oneoaas','','2016-08-19 16:04:37'),(395,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:04:37','oneoaas','','2016-08-19 16:04:37'),(396,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:04:54','oneoaas','','2016-08-19 16:04:54'),(397,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:04:54','oneoaas','','2016-08-19 16:04:54'),(398,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:06:21','oneoaas','','2016-08-19 16:06:21'),(399,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:06:21','oneoaas','','2016-08-19 16:06:21'),(400,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:10:02','oneoaas','','2016-08-19 16:10:02'),(401,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:10:02','oneoaas','','2016-08-19 16:10:02'),(402,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:20:03','oneoaas','','2016-08-19 16:20:03'),(403,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:20:03','oneoaas','','2016-08-19 16:20:03'),(404,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:20:10','oneoaas','','2016-08-19 16:20:10'),(405,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:20:10','oneoaas','','2016-08-19 16:20:10'),(406,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:20:27','oneoaas','','2016-08-19 16:20:27'),(407,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:20:27','oneoaas','','2016-08-19 16:20:27'),(408,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:29:58','oneoaas','','2016-08-19 16:29:58'),(409,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:29:58','oneoaas','','2016-08-19 16:29:58'),(410,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:30:04','oneoaas','','2016-08-19 16:30:04'),(411,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:30:04','oneoaas','','2016-08-19 16:30:04'),(412,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:30:55','oneoaas','','2016-08-19 16:30:55'),(413,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:30:55','oneoaas','','2016-08-19 16:30:55'),(414,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 16:31:02','oneoaas','','2016-08-19 16:31:02'),(415,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:31:53','oneoaas','','2016-08-19 16:31:53'),(416,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:31:53','oneoaas','','2016-08-19 16:31:53'),(417,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:35:32','oneoaas','','2016-08-19 16:35:32'),(418,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:35:32','oneoaas','','2016-08-19 16:35:32'),(419,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:41:41','oneoaas','','2016-08-19 16:41:41'),(420,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:41:41','oneoaas','','2016-08-19 16:41:41'),(421,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 16:41:48','oneoaas','','2016-08-19 16:41:48'),(422,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 16:41:57','oneoaas','','2016-08-19 16:41:57'),(423,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:42:05','oneoaas','','2016-08-19 16:42:05'),(424,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:42:05','oneoaas','','2016-08-19 16:42:05'),(425,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:49:49','oneoaas','','2016-08-19 16:49:49'),(426,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:49:49','oneoaas','','2016-08-19 16:49:49'),(427,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:49:58','oneoaas','','2016-08-19 16:49:58'),(428,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 16:49:58','oneoaas','','2016-08-19 16:49:58'),(429,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:05:01','oneoaas','','2016-08-19 17:05:01'),(430,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:05:01','oneoaas','','2016-08-19 17:05:01'),(431,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:05:29','oneoaas','','2016-08-19 17:05:29'),(432,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:05:29','oneoaas','','2016-08-19 17:05:29'),(433,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:13:34','oneoaas','','2016-08-19 17:13:34'),(434,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:13:34','oneoaas','','2016-08-19 17:13:34'),(435,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:13:41','oneoaas','','2016-08-19 17:13:41'),(436,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:13:41','oneoaas','','2016-08-19 17:13:41'),(437,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:15:08','oneoaas','','2016-08-19 17:15:08'),(438,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:15:08','oneoaas','','2016-08-19 17:15:08'),(439,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:15:16','oneoaas','','2016-08-19 17:15:16'),(440,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:15:16','oneoaas','','2016-08-19 17:15:16'),(441,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:15:20','oneoaas','','2016-08-19 17:15:20'),(442,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:15:20','oneoaas','','2016-08-19 17:15:20'),(443,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:15:29','oneoaas','','2016-08-19 17:15:29'),(444,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 17:15:29','oneoaas','','2016-08-19 17:15:29'),(445,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:29:36','oneoaas','','2016-08-19 18:29:36'),(446,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:29:36','oneoaas','','2016-08-19 18:29:36'),(447,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:32:16','oneoaas','','2016-08-19 18:32:16'),(448,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:32:16','oneoaas','','2016-08-19 18:32:16'),(449,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 18:32:25','oneoaas','','2016-08-19 18:32:25'),(450,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:34:11','oneoaas','','2016-08-19 18:34:11'),(451,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:34:11','oneoaas','','2016-08-19 18:34:11'),(452,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:35:35','oneoaas','','2016-08-19 18:35:35'),(453,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:35:35','oneoaas','','2016-08-19 18:35:35'),(454,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 18:35:54','oneoaas','','2016-08-19 18:35:54'),(455,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 18:36:59','oneoaas','','2016-08-19 18:36:59'),(456,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:40:38','oneoaas','','2016-08-19 18:40:38'),(457,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:40:38','oneoaas','','2016-08-19 18:40:38'),(458,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-19 18:40:45','oneoaas','','2016-08-19 18:40:45'),(459,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:42:04','oneoaas','','2016-08-19 18:42:04'),(460,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:42:04','oneoaas','','2016-08-19 18:42:04'),(461,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:42:11','oneoaas','','2016-08-19 18:42:11'),(462,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:42:11','oneoaas','','2016-08-19 18:42:11'),(463,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:45:33','oneoaas','','2016-08-19 18:45:33'),(464,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:45:33','oneoaas','','2016-08-19 18:45:33'),(465,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:48:43','oneoaas','','2016-08-19 18:48:43'),(466,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:48:43','oneoaas','','2016-08-19 18:48:43'),(467,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:49:03','oneoaas','','2016-08-19 18:49:03'),(468,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:49:03','oneoaas','','2016-08-19 18:49:03'),(469,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:51:12','oneoaas','','2016-08-19 18:51:12'),(470,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:51:12','oneoaas','','2016-08-19 18:51:12'),(471,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:51:19','oneoaas','','2016-08-19 18:51:19'),(472,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:51:21','oneoaas','','2016-08-19 18:51:21'),(473,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:51:22','oneoaas','','2016-08-19 18:51:22'),(474,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:51:23','oneoaas','','2016-08-19 18:51:23'),(475,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:51:23','oneoaas','','2016-08-19 18:51:23'),(476,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-19 18:51:23','oneoaas','','2016-08-19 18:51:23'),(477,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:49:36','oneoaas','','2016-08-21 19:49:36'),(478,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:49:36','oneoaas','','2016-08-21 19:49:36'),(479,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:19','oneoaas','','2016-08-21 19:51:19'),(480,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:22','oneoaas','','2016-08-21 19:51:22'),(481,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:22','oneoaas','','2016-08-21 19:51:22'),(482,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:24','oneoaas','','2016-08-21 19:51:24'),(483,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:25','oneoaas','','2016-08-21 19:51:25'),(484,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:26','oneoaas','','2016-08-21 19:51:26'),(485,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:27','oneoaas','','2016-08-21 19:51:27'),(486,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:27','oneoaas','','2016-08-21 19:51:27'),(487,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:28','oneoaas','','2016-08-21 19:51:28'),(488,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:30','oneoaas','','2016-08-21 19:51:30'),(489,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:31','oneoaas','','2016-08-21 19:51:31'),(490,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:32','oneoaas','','2016-08-21 19:51:32'),(491,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:33','oneoaas','','2016-08-21 19:51:33'),(492,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:33','oneoaas','','2016-08-21 19:51:33'),(493,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:33','oneoaas','','2016-08-21 19:51:33'),(494,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:33','oneoaas','','2016-08-21 19:51:33'),(495,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:40','oneoaas','','2016-08-21 19:51:40'),(496,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:43','oneoaas','','2016-08-21 19:51:43'),(497,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:47','oneoaas','','2016-08-21 19:51:47'),(498,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:50','oneoaas','','2016-08-21 19:51:50'),(499,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:51:57','oneoaas','','2016-08-21 19:51:57'),(500,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:52:29','oneoaas','','2016-08-21 19:52:29'),(501,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:52:29','oneoaas','','2016-08-21 19:52:29'),(502,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:52:40','oneoaas','','2016-08-21 19:52:40'),(503,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:52:48','oneoaas','','2016-08-21 19:52:48'),(504,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:52:57','oneoaas','','2016-08-21 19:52:57'),(505,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:53:03','oneoaas','','2016-08-21 19:53:03'),(506,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 19:53:06','oneoaas','','2016-08-21 19:53:06'),(507,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:03:21','oneoaas','','2016-08-21 20:03:21'),(508,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:03:21','oneoaas','','2016-08-21 20:03:21'),(509,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:03:27','oneoaas','','2016-08-21 20:03:27'),(510,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:03:30','oneoaas','','2016-08-21 20:03:30'),(511,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:03:36','oneoaas','','2016-08-21 20:03:36'),(512,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:03:40','oneoaas','','2016-08-21 20:03:40'),(513,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:03:59','oneoaas','','2016-08-21 20:03:59'),(514,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:04:02','oneoaas','','2016-08-21 20:04:02'),(515,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:04:04','oneoaas','','2016-08-21 20:04:04'),(516,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:04:04','oneoaas','','2016-08-21 20:04:04'),(517,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:04:04','oneoaas','','2016-08-21 20:04:04'),(518,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:08:10','oneoaas','','2016-08-21 20:08:10'),(519,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:17:16','oneoaas','','2016-08-21 20:17:16'),(520,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:17:16','oneoaas','','2016-08-21 20:17:16'),(521,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:17:20','oneoaas','','2016-08-21 20:17:20'),(522,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:17:21','oneoaas','','2016-08-21 20:17:21'),(523,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:17:27','oneoaas','','2016-08-21 20:17:27'),(524,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:17:28','oneoaas','','2016-08-21 20:17:28'),(525,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:17:29','oneoaas','','2016-08-21 20:17:29'),(526,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:17:30','oneoaas','','2016-08-21 20:17:30'),(527,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:17:31','oneoaas','','2016-08-21 20:17:31'),(528,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:19:05','oneoaas','','2016-08-21 20:19:05'),(529,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:19:06','oneoaas','','2016-08-21 20:19:06'),(530,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:19:11','oneoaas','','2016-08-21 20:19:11'),(531,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:19:11','oneoaas','','2016-08-21 20:19:11'),(532,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:19:13','oneoaas','','2016-08-21 20:19:13'),(533,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:32:44','oneoaas','','2016-08-21 20:32:44'),(534,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:32:44','oneoaas','','2016-08-21 20:32:44'),(535,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:32:53','oneoaas','','2016-08-21 20:32:53'),(536,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:34:50','oneoaas','','2016-08-21 20:34:50'),(537,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:34:54','oneoaas','','2016-08-21 20:34:54'),(538,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:36:49','oneoaas','','2016-08-21 20:36:49'),(539,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:36:50','oneoaas','','2016-08-21 20:36:50'),(540,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:37:01','oneoaas','','2016-08-21 20:37:01'),(541,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:37:02','oneoaas','','2016-08-21 20:37:02'),(542,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:49:01','oneoaas','','2016-08-21 20:49:01'),(543,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:50:53','oneoaas','','2016-08-21 20:50:53'),(544,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:38','oneoaas','','2016-08-21 20:51:38'),(545,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:39','oneoaas','','2016-08-21 20:51:39'),(546,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:39','oneoaas','','2016-08-21 20:51:39'),(547,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:42','oneoaas','','2016-08-21 20:51:42'),(548,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:42','oneoaas','','2016-08-21 20:51:42'),(549,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:43','oneoaas','','2016-08-21 20:51:43'),(550,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:44','oneoaas','','2016-08-21 20:51:44'),(551,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:48','oneoaas','','2016-08-21 20:51:48'),(552,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:49','oneoaas','','2016-08-21 20:51:49'),(553,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:50','oneoaas','','2016-08-21 20:51:50'),(554,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:51','oneoaas','','2016-08-21 20:51:51'),(555,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:52','oneoaas','','2016-08-21 20:51:52'),(556,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:52','oneoaas','','2016-08-21 20:51:52'),(557,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 20:51:53','oneoaas','','2016-08-21 20:51:53'),(558,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:02:28','oneoaas','','2016-08-21 21:02:28'),(559,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:02:29','oneoaas','','2016-08-21 21:02:29'),(560,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:02:30','oneoaas','','2016-08-21 21:02:30'),(561,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:03:59','oneoaas','','2016-08-21 21:03:59'),(562,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:04:01','oneoaas','','2016-08-21 21:04:01'),(563,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:04:01','oneoaas','','2016-08-21 21:04:01'),(564,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:01','oneoaas','','2016-08-21 21:07:01'),(565,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:02','oneoaas','','2016-08-21 21:07:02'),(566,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:03','oneoaas','','2016-08-21 21:07:03'),(567,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:03','oneoaas','','2016-08-21 21:07:03'),(568,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:04','oneoaas','','2016-08-21 21:07:04'),(569,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:08','oneoaas','','2016-08-21 21:07:08'),(570,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:08','oneoaas','','2016-08-21 21:07:08'),(571,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:08','oneoaas','','2016-08-21 21:07:08'),(572,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:09','oneoaas','','2016-08-21 21:07:09'),(573,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:09','oneoaas','','2016-08-21 21:07:09'),(574,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:31','oneoaas','','2016-08-21 21:07:31'),(575,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:31','oneoaas','','2016-08-21 21:07:31'),(576,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:35','oneoaas','','2016-08-21 21:07:35'),(577,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:36','oneoaas','','2016-08-21 21:07:36'),(578,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:38','oneoaas','','2016-08-21 21:07:38'),(579,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:39','oneoaas','','2016-08-21 21:07:39'),(580,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:41','oneoaas','','2016-08-21 21:07:41'),(581,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:07:42','oneoaas','','2016-08-21 21:07:42'),(582,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:10:48','oneoaas','','2016-08-21 21:10:48'),(583,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:10:49','oneoaas','','2016-08-21 21:10:49'),(584,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:11:03','oneoaas','','2016-08-21 21:11:03'),(585,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:11:07','oneoaas','','2016-08-21 21:11:07'),(586,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:11:35','oneoaas','','2016-08-21 21:11:35'),(587,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:12:36','oneoaas','','2016-08-21 21:12:36'),(588,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:12:37','oneoaas','','2016-08-21 21:12:37'),(589,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:12:39','oneoaas','','2016-08-21 21:12:39'),(590,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:12:44','oneoaas','','2016-08-21 21:12:44'),(591,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:12:47','oneoaas','','2016-08-21 21:12:47'),(592,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:12:48','oneoaas','','2016-08-21 21:12:48'),(593,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:12:48','oneoaas','','2016-08-21 21:12:48'),(594,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:05','oneoaas','','2016-08-21 21:13:05'),(595,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:08','oneoaas','','2016-08-21 21:13:08'),(596,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:08','oneoaas','','2016-08-21 21:13:08'),(597,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:10','oneoaas','','2016-08-21 21:13:10'),(598,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:13','oneoaas','','2016-08-21 21:13:13'),(599,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:14','oneoaas','','2016-08-21 21:13:14'),(600,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:15','oneoaas','','2016-08-21 21:13:15'),(601,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:16','oneoaas','','2016-08-21 21:13:16'),(602,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:18','oneoaas','','2016-08-21 21:13:18'),(603,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:19','oneoaas','','2016-08-21 21:13:19'),(604,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:20','oneoaas','','2016-08-21 21:13:20'),(605,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:20','oneoaas','','2016-08-21 21:13:20'),(606,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:21','oneoaas','','2016-08-21 21:13:21'),(607,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:13:24','oneoaas','','2016-08-21 21:13:24'),(608,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:21:09','oneoaas','','2016-08-21 21:21:09'),(609,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:22:00','oneoaas','','2016-08-21 21:22:00'),(610,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:22:05','oneoaas','','2016-08-21 21:22:05'),(611,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:22:17','oneoaas','','2016-08-21 21:22:17'),(612,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:22:17','oneoaas','','2016-08-21 21:22:17'),(613,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:29:52','oneoaas','','2016-08-21 21:29:52'),(614,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 21:29:52','oneoaas','','2016-08-21 21:29:52'),(615,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:09:12','oneoaas','','2016-08-21 22:09:12'),(616,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:09:12','oneoaas','','2016-08-21 22:09:12'),(617,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:15:57','oneoaas','','2016-08-21 22:15:57'),(618,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:15:57','oneoaas','','2016-08-21 22:15:57'),(619,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:16:21','oneoaas','','2016-08-21 22:16:21'),(620,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:16:21','oneoaas','','2016-08-21 22:16:21'),(621,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:38:57','oneoaas','','2016-08-21 22:38:57'),(622,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:38:57','oneoaas','','2016-08-21 22:38:57'),(623,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:38:58','oneoaas','','2016-08-21 22:38:58'),(624,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:38:58','oneoaas','','2016-08-21 22:38:58'),(625,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:38:59','oneoaas','','2016-08-21 22:38:59'),(626,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:38:59','oneoaas','','2016-08-21 22:38:59'),(627,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:00','oneoaas','','2016-08-21 22:39:00'),(628,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:00','oneoaas','','2016-08-21 22:39:00'),(629,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:03','oneoaas','','2016-08-21 22:39:03'),(630,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:03','oneoaas','','2016-08-21 22:39:03'),(631,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:03','oneoaas','','2016-08-21 22:39:03'),(632,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:03','oneoaas','','2016-08-21 22:39:03'),(633,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:03','oneoaas','','2016-08-21 22:39:03'),(634,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:03','oneoaas','','2016-08-21 22:39:03'),(635,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:04','oneoaas','','2016-08-21 22:39:04'),(636,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:04','oneoaas','','2016-08-21 22:39:04'),(637,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:05','oneoaas','','2016-08-21 22:39:05'),(638,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:05','oneoaas','','2016-08-21 22:39:05'),(639,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:07','oneoaas','','2016-08-21 22:39:07'),(640,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:07','oneoaas','','2016-08-21 22:39:07'),(641,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:07','oneoaas','','2016-08-21 22:39:07'),(642,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:39:07','oneoaas','','2016-08-21 22:39:07'),(643,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:41:42','oneoaas','','2016-08-21 22:41:42'),(644,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:41:42','oneoaas','','2016-08-21 22:41:42'),(645,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:41:44','oneoaas','','2016-08-21 22:41:44'),(646,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:41:44','oneoaas','','2016-08-21 22:41:44'),(647,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:41:45','oneoaas','','2016-08-21 22:41:45'),(648,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:41:45','oneoaas','','2016-08-21 22:41:45'),(649,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:41:47','oneoaas','','2016-08-21 22:41:47'),(650,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:41:47','oneoaas','','2016-08-21 22:41:47'),(651,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:20','oneoaas','','2016-08-21 22:42:20'),(652,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:20','oneoaas','','2016-08-21 22:42:20'),(653,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:43','oneoaas','','2016-08-21 22:42:43'),(654,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:43','oneoaas','','2016-08-21 22:42:43'),(655,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:45','oneoaas','','2016-08-21 22:42:45'),(656,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:45','oneoaas','','2016-08-21 22:42:45'),(657,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:46','oneoaas','','2016-08-21 22:42:46'),(658,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:46','oneoaas','','2016-08-21 22:42:46'),(659,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:50','oneoaas','','2016-08-21 22:42:50'),(660,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:42:50','oneoaas','','2016-08-21 22:42:50'),(661,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:12','oneoaas','','2016-08-21 22:46:12'),(662,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:12','oneoaas','','2016-08-21 22:46:12'),(663,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:13','oneoaas','','2016-08-21 22:46:13'),(664,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:13','oneoaas','','2016-08-21 22:46:13'),(665,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:13','oneoaas','','2016-08-21 22:46:13'),(666,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:13','oneoaas','','2016-08-21 22:46:13'),(667,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:15','oneoaas','','2016-08-21 22:46:15'),(668,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:15','oneoaas','','2016-08-21 22:46:15'),(669,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:16','oneoaas','','2016-08-21 22:46:16'),(670,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:18','oneoaas','','2016-08-21 22:46:18'),(671,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:30','oneoaas','','2016-08-21 22:46:30'),(672,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:30','oneoaas','','2016-08-21 22:46:30'),(673,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:31','oneoaas','','2016-08-21 22:46:31'),(674,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:31','oneoaas','','2016-08-21 22:46:31'),(675,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:32','oneoaas','','2016-08-21 22:46:32'),(676,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:32','oneoaas','','2016-08-21 22:46:32'),(677,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:33','oneoaas','','2016-08-21 22:46:33'),(678,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:33','oneoaas','','2016-08-21 22:46:33'),(679,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:34','oneoaas','','2016-08-21 22:46:34'),(680,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:36','oneoaas','','2016-08-21 22:46:36'),(681,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:36','oneoaas','','2016-08-21 22:46:36'),(682,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-21 22:46:37','oneoaas','','2016-08-21 22:46:37'),(683,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:28','oneoaas','','2016-08-22 12:17:28'),(684,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:31','oneoaas','','2016-08-22 12:17:31'),(685,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:32','oneoaas','','2016-08-22 12:17:32'),(686,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:33','oneoaas','','2016-08-22 12:17:33'),(687,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:33','oneoaas','','2016-08-22 12:17:33'),(688,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:36','oneoaas','','2016-08-22 12:17:36'),(689,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:36','oneoaas','','2016-08-22 12:17:36'),(690,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:37','oneoaas','','2016-08-22 12:17:37'),(691,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:42','oneoaas','','2016-08-22 12:17:42'),(692,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:43','oneoaas','','2016-08-22 12:17:43'),(693,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:44','oneoaas','','2016-08-22 12:17:44'),(694,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:45','oneoaas','','2016-08-22 12:17:45'),(695,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:58','oneoaas','','2016-08-22 12:17:58'),(696,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:58','oneoaas','','2016-08-22 12:17:58'),(697,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:59','oneoaas','','2016-08-22 12:17:59'),(698,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:17:59','oneoaas','','2016-08-22 12:17:59'),(699,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:00','oneoaas','','2016-08-22 12:18:00'),(700,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:00','oneoaas','','2016-08-22 12:18:00'),(701,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:01','oneoaas','','2016-08-22 12:18:01'),(702,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:01','oneoaas','','2016-08-22 12:18:01'),(703,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:01','oneoaas','','2016-08-22 12:18:01'),(704,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:01','oneoaas','','2016-08-22 12:18:01'),(705,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:02','oneoaas','','2016-08-22 12:18:02'),(706,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:02','oneoaas','','2016-08-22 12:18:02'),(707,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:02','oneoaas','','2016-08-22 12:18:02'),(708,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:02','oneoaas','','2016-08-22 12:18:02'),(709,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:03','oneoaas','','2016-08-22 12:18:03'),(710,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:03','oneoaas','','2016-08-22 12:18:03'),(711,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:04','oneoaas','','2016-08-22 12:18:04'),(712,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:04','oneoaas','','2016-08-22 12:18:04'),(713,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:05','oneoaas','','2016-08-22 12:18:05'),(714,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 12:18:05','oneoaas','','2016-08-22 12:18:05'),(715,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 14:45:36','oneoaas','','2016-08-22 14:45:36'),(716,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 14:45:38','oneoaas','','2016-08-22 14:45:38'),(717,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 14:45:38','oneoaas','','2016-08-22 14:45:38'),(718,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 14:45:40','oneoaas','','2016-08-22 14:45:40'),(719,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-22 14:45:55','oneoaas','','2016-08-22 14:45:55'),(720,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-23 09:35:09','oneoaas','','2016-08-23 09:35:09'),(721,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-23 09:35:10','oneoaas','','2016-08-23 09:35:10'),(722,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-23 09:35:11','oneoaas','','2016-08-23 09:35:11'),(723,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-23 09:35:12','oneoaas','','2016-08-23 09:35:12'),(724,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-23 09:35:13','oneoaas','','2016-08-23 09:35:13'),(725,0,'oneoaas','Ci','资产配置项','','','','','获取','','2016-08-23 10:37:03','oneoaas','','2016-08-23 10:37:03'),(726,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-23 14:41:34','oneoaas','','2016-08-23 14:41:34'),(727,0,'oneoaas','Ci','资产配置项','','','','','添加','','2016-08-23 14:47:01','oneoaas','','2016-08-23 14:47:01'),(728,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 15:29:18','oneoaas','','2016-08-23 15:29:18'),(729,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 15:32:48','oneoaas','','2016-08-23 15:32:48'),(730,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 16:30:09','oneoaas','','2016-08-23 16:30:09'),(731,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 16:30:10','oneoaas','','2016-08-23 16:30:10'),(732,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 16:30:11','oneoaas','','2016-08-23 16:30:11'),(733,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 16:30:16','oneoaas','','2016-08-23 16:30:16'),(734,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 16:34:55','oneoaas','','2016-08-23 16:34:55'),(735,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 16:34:56','oneoaas','','2016-08-23 16:34:56'),(736,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 16:35:58','oneoaas','','2016-08-23 16:35:58'),(737,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 16:36:00','oneoaas','','2016-08-23 16:36:00'),(738,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 17:33:28','oneoaas','','2016-08-23 17:33:28'),(739,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 17:33:39','oneoaas','','2016-08-23 17:33:39'),(740,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 17:35:38','oneoaas','','2016-08-23 17:35:38'),(741,0,'oneoaas','Assert','资产模块','','','','','添加','','2016-08-23 17:36:12','oneoaas','','2016-08-23 17:36:12');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'oneoaas','admin','test@qq.com','18601706743','23d68a0f00ed8614d4e836f20ce018dd','xwQQoxl6n7`!@.[#','2016-07-10 15:41:31','2016-07-10 15:41:31',8);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_aliyun`
--

LOCK TABLES `vm_aliyun` WRITE;
/*!40000 ALTER TABLE `vm_aliyun` DISABLE KEYS */;
INSERT INTO `vm_aliyun` VALUES (1,'oneoaas_monitor','i-231a5ibon',2,4096,'2016-07-20 17:38:43','','2016-07-20 17:38:43','iZ231a5ibonZ','centos6u5_64_40G_ali','','cn-hangzhou-c');
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
  PRIMARY KEY (`vcenter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_vmware`
--

LOCK TABLES `vm_vmware` WRITE;
/*!40000 ALTER TABLE `vm_vmware` DISABLE KEYS */;
/*!40000 ALTER TABLE `vm_vmware` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-24 10:49:08
