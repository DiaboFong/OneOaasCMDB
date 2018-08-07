-- author: bin.liu@oneoaas.com
-- description: 初始化数据库,以及数据库升级迁移

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `access_key`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Records of access_key
-- ----------------------------
INSERT INTO `access_key` VALUES ('200', '1', '1e8ec566be6363bd88e71ceab1cb30e5', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDkwMjM2NTc5LCJpYXQiOjE0ODc2NDQ1NzksInR5cGUiOiJzZWxmIiwidXNlcm5hbWUiOiJhZG1pbiJ9.5r86VHJaCqd9-PmnShQCBsyh76mQZk912hNNFpAJB6M', '1', '0', '1490236579', '2017-02-21 10:36:19', 'system auto generate', 'frontend', 'self');

DROP TABLE IF EXISTS `agreement`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `agreement_state`;
CREATE TABLE `agreement_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `app_level`;
CREATE TABLE `app_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `asserts`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `asserts` VALUES ('1', 'datacenter', '数据中心资源', '0', '0', '0', '0', '0000-00-00 00:00:00', null, null, '0000-00-00 00:00:00', 'icon-dc');
INSERT INTO `asserts` VALUES ('2', 'ipam', 'IPAM资源', '0', '0', '0', '0', '0000-00-00 00:00:00', null, null, '0000-00-00 00:00:00', 'icon-ip');
INSERT INTO `asserts` VALUES ('3', 'business', '业务资源', '0', '0', '0', '0', '0000-00-00 00:00:00', null, null, '0000-00-00 00:00:00', 'icon-bs-rs');
INSERT INTO `asserts` VALUES ('4', 'virtualization', '虚拟化资源', '0', '0', '0', '0', '0000-00-00 00:00:00', null, null, '0000-00-00 00:00:00', 'icon-vcenter');
INSERT INTO `asserts` VALUES ('5', 'cloud', '云资源', '0', '0', '0', '0', '0000-00-00 00:00:00', null, null, '0000-00-00 00:00:00', 'icon-cloud');
INSERT INTO `asserts` VALUES ('6', 'supplier', '供应商资源', '0', '0', '0', '0', '0000-00-00 00:00:00', null, null, '0000-00-00 00:00:00', 'icon-supplier');

DROP TABLE IF EXISTS `asserts_instance`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `asserts_instance` VALUES ('1', 'datacenter', '数据中心', '1', '0', '1', '1', '1', '2017-02-27 18:03:03', '', 'admin', '2017-02-27 18:03:03', 'icon-index-dc', '8');
INSERT INTO `asserts_instance` VALUES ('2', 'room', '机房', '1', '0', '1', '1', '1', '2017-02-27 18:03:03', '', 'admin', '2017-02-27 18:03:03', 'icon-index-room', '6');
INSERT INTO `asserts_instance` VALUES ('3', 'rack', '机柜', '1', '0', '1', '1', '0', '2017-02-27 18:03:03', '', 'admin', '2017-02-27 18:03:03', 'icon-index-rack', '23');
INSERT INTO `asserts_instance` VALUES ('4', 'bandwidth', '带宽', '1', '0', '1', '1', '0', '2017-02-27 18:03:03', '', 'admin', '2017-02-27 18:03:03', 'icon-index-bandwidth', '3');
INSERT INTO `asserts_instance` VALUES ('5', 'hardware', '硬件', '1', '0', '1', '1', '0', '2017-02-27 18:03:03', '', 'admin', '2017-02-27 18:03:03', 'icon-index-hardware', '2');
INSERT INTO `asserts_instance` VALUES ('6', 'server', '服务器', '1', '0', '1', '1', '0', '2017-02-27 18:03:03', '', 'admin', '2017-02-27 18:03:03', 'icon-index-server', '3');
INSERT INTO `asserts_instance` VALUES ('7', 'ip', 'IP', '1', '0', '1', '2', '0', '2017-02-20 18:20:44', '', 'admin', '2017-02-20 18:20:44', 'icon-index-ip', '5');
INSERT INTO `asserts_instance` VALUES ('8', 'domain', '域名', '1', '0', '1', '2', '0', '2017-02-27 18:03:04', '', 'admin', '2017-02-27 18:03:04', 'icon-index-domain', '4');
INSERT INTO `asserts_instance` VALUES ('9', 'app', '业务模块', '1', '0', '1', '3', '0', '2017-02-27 18:03:04', '', 'admin', '2017-02-27 18:03:04', 'icon-index-app', '5');
INSERT INTO `asserts_instance` VALUES ('10', 'vcenter', 'Vcenter', '1', '0', '1', '4', '0', '2017-02-27 18:03:04', '', 'admin', '2017-02-27 18:03:04', 'icon-index-vcenter', '8');
INSERT INTO `asserts_instance` VALUES ('11', 'aliyun', '阿里云', '1', '0', '1', '5', '0', '2017-02-27 18:03:04', '', 'admin', '2017-02-27 18:03:04', 'icon-index-aliyun', '5');
INSERT INTO `asserts_instance` VALUES ('12', 'aws', 'AWS', '1', '0', '1', '5', '0', '2017-02-27 18:03:04', '', 'admin', '2017-02-27 18:03:04', 'icon-index-aws', '2');
INSERT INTO `asserts_instance` VALUES ('13', 'supplier', '供应商', '1', '0', '1', '6', '0', '2017-02-27 18:03:04', '', 'admin', '2017-02-27 18:03:04', 'icon-index-supplier', '5');
INSERT INTO `asserts_instance` VALUES ('14', 'agreement', '合同', '1', '0', '1', '100', '0', '2017-02-27 18:03:04', '', 'admin', '2017-02-27 18:03:04', 'icon-supplier', '1');

DROP TABLE IF EXISTS `cpu`;
CREATE TABLE `cpu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `datacenter`;
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
  `supplier_id` bigint(20) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `datacenter_region`;
CREATE TABLE `datacenter_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `datacenter_state`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dcprofile`;
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

DROP TABLE IF EXISTS `device_performance_report`;
CREATE TABLE `device_performance_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device` varchar(128) NOT NULL DEFAULT '',
  `cpu` bigint(20) NOT NULL DEFAULT '0',
  `memory` bigint(20) NOT NULL DEFAULT '0',
  `disk_usage` double NOT NULL DEFAULT '0',
  `nic_usage` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dnspoddomain`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dnspoddomain_grade`;
CREATE TABLE `dnspoddomain_grade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dnspoddomain_state`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `dnspodrecord`;
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

DROP TABLE IF EXISTS `dnspodtoken`;
CREATE TABLE `dnspodtoken` (
  `id` bigint(20) NOT NULL,
  `Token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `docmanage`;
CREATE TABLE `docmanage` (
  `docmanageid` bigint(20) NOT NULL AUTO_INCREMENT,
  `docmanagename` varchar(255) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `docmanageno` varchar(256) DEFAULT NULL,
  `docpath` varchar(256) DEFAULT NULL,
  `doctype` varchar(256) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`docmanageid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `harddisk`;
CREATE TABLE `harddisk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hardware`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hardware_state`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hardware_type`;
CREATE TABLE `hardware_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `internet_service_provider`;
CREATE TABLE `internet_service_provider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ip_address`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- @description ip 子网数据库
-- @name ip_subnet
DROP TABLE IF EXISTS `ip_subnet`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ip_vlan`;
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

DROP TABLE IF EXISTS `ip_vlan_domain`;
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

DROP TABLE IF EXISTS `manufacturer`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `memory`;
CREATE TABLE `memory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `menu`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `menu` VALUES ('2', 'root.resource', '资源管理', '', '0', '1', null, 'admin', '', '2017-01-05 16:10:19', '0', '1', 'fa fa-exchange', '');
INSERT INTO `menu` VALUES ('3', 'root.system', '系统管理', '', '0', '1', null, 'admin', '', '2017-01-05 16:10:20', '0', '1', 'fa fa-hand-o-right', '');
INSERT INTO `menu` VALUES ('4', 'root.report', '资源报表', '', '0', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '1', null, null);
INSERT INTO `menu` VALUES ('33', 'root.systemuser', '用户管理', '/systemuser', '3', '1', null, 'admin', '', '2017-01-05 16:10:20', '0', '2', '', '');
INSERT INTO `menu` VALUES ('34', 'root.systemconfig', '系统配置', '/systemconfig', '3', '1', null, 'admin', '', '2017-01-05 16:10:20', '0', '2', '', '');
INSERT INTO `menu` VALUES ('35', 'root.system.users', '用户列表', '/users', '33', '1', null, '', '', null, '0', '3', null, null);
INSERT INTO `menu` VALUES ('36', 'root.system.roles', '菜单权限', '/roles', '33', '1', null, '', '', null, '0', '3', null, null);
INSERT INTO `menu` VALUES ('37', 'root.system.menus', '菜单管理', '/menus', '34', '0', null, '', '', null, '3', '3', null, null);
INSERT INTO `menu` VALUES ('38', 'root.system.logs', '日志管理', '/logs', '34', '1', null, '', '', null, '3', '3', null, null);
INSERT INTO `menu` VALUES ('39', 'root.system.email', '邮件设置', '/email', '34', '0', null, '', '', null, '3', '3', null, null);
INSERT INTO `menu` VALUES ('45', 'root.system_api', 'API访问', '/system_api', '3', '1', '2016-07-20 08:37:15', 'oneoaas', '', '2017-01-05 16:10:20', '0', '2', '0', '');
INSERT INTO `menu` VALUES ('46', 'root.visualization', '资源可视化', '/resource_view', '0', '0', null, 'admin', '', '2016-11-24 15:31:26', '0', '1', 'fa fa-eye', '');
INSERT INTO `menu` VALUES ('47', 'root.resource_quick', '分类查询', '/resource_quick', '1', '1', null, 'admin', '', '2016-10-25 23:59:00', '0', '2', '', '');
INSERT INTO `menu` VALUES ('48', 'root.system.apikey', 'KEY列表', '/apikey', '45', '1', null, '', '', null, '3', '3', null, null);
INSERT INTO `menu` VALUES ('50', 'root.visualization.tree', '资源树', '/resource_tree', '46', '1', '2016-09-17 22:24:40', 'oneoaas', '', '2016-10-25 23:59:07', '0', '2', 'fa fa-tachometer', '');
INSERT INTO `menu` VALUES ('51', 'root.visualization.topo', '拓扑图', '/resource_topo', '46', '1', '2016-09-19 00:25:29', 'oneoaas', '', '2016-11-24 15:31:26', '0', '2', 'fa fa-tachometer', '');
INSERT INTO `menu` VALUES ('52', 'root.manageresources.datacenter({assertsId:1})', '数据中心资源', '/datacenter', '2', '1', null, '', '', '2017-01-05 16:10:19', '0', '0', '', '');
INSERT INTO `menu` VALUES ('53', 'root.manageresources.bandwidth({assertsId:2})', 'IPAM资源', '/ipam', '2', '1', null, '', '', '2017-01-05 16:10:19', '0', '0', '', '');
INSERT INTO `menu` VALUES ('54', 'root.manageresources.app({assertsId:3})', '业务资源', '/business', '2', '1', null, '', '', '2017-01-05 16:10:19', '0', '0', '', '');
INSERT INTO `menu` VALUES ('55', 'root.manageresources.vcenter({assertsId:4})', '虚拟化资源', '/virtualization', '2', '1', null, '', '', '2017-01-05 16:10:19', '0', '0', '', '');
INSERT INTO `menu` VALUES ('56', 'root.manageresources.aliyun({assertsId:5})', '云资源', '/cloud', '2', '1', null, '', '', '2017-01-05 16:10:19', '0', '0', '', '');
INSERT INTO `menu` VALUES ('57', 'root.manageresources.supplier({assertsId:6})', '供应商资源', '/supplier', '2', '1', null, '', '', '2017-01-05 16:10:20', '0', '0', '', '');
INSERT INTO `menu` VALUES ('60', 'root.report.device', '设备性能报表', '/device', '4', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '2', null, null);
INSERT INTO `menu` VALUES ('61', 'root.report.finance', '财务报表', '/finance', '4', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '2', null, null);
INSERT INTO `menu` VALUES ('62', 'root.report.use', '资源报表', '/use', '4', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '2', null, null);
INSERT INTO `menu` VALUES ('63', 'root.report.devicedetail', '设备性能报表详情', '/devicedetail', '60', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '3', null, null);
INSERT INTO `menu` VALUES ('64', 'root.report.financedetail', '财务报表详情', '/financedetail', '61', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '3', null, null);
INSERT INTO `menu` VALUES ('65', 'root.report.usedetail', '资源报表详情', '/usedetail', '62', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '3', null, null);
INSERT INTO `menu` VALUES ('66', 'root.visualization.rtop', '资源拓扑图', '/rtop', '51', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '3', null, null);
INSERT INTO `menu` VALUES ('67', 'root.visualization.btop', '业务拓扑图', '/btop', '51', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '3', null, null);
INSERT INTO `menu` VALUES ('68', 'root.visualization.rtree', '资源树', '/rtree', '50', '1', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '3', null, null);
INSERT INTO `menu` VALUES ('69', 'root.system.modeling', '资产建模', '/modeling', '34', '0', '2016-12-15 19:10:56', 'admin', 'admin', '2016-12-15 19:10:56', '0', '3', null, null);

UPDATE `menu` SET enable = 0 WHERE display_name = '设备性能报表'
UPDATE `menu` SET enable = 0 WHERE display_name = '设备性能报表详情'
UPDATE `menu` SET enable = 0 WHERE display_name = '财务报表'
UPDATE `menu` SET enable = 0 WHERE display_name = '财务报表详情'

DROP TABLE IF EXISTS `menu_rights`;
CREATE TABLE `menu_rights` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) NOT NULL,
  `right_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `menu_roles`;
CREATE TABLE `menu_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `menu_roles` VALUES ('367', '2', '8');
INSERT INTO `menu_roles` VALUES ('368', '52', '8');
INSERT INTO `menu_roles` VALUES ('369', '53', '8');
INSERT INTO `menu_roles` VALUES ('370', '54', '8');
INSERT INTO `menu_roles` VALUES ('371', '55', '8');
INSERT INTO `menu_roles` VALUES ('372', '56', '8');
INSERT INTO `menu_roles` VALUES ('373', '57', '8');
INSERT INTO `menu_roles` VALUES ('374', '3', '8');
INSERT INTO `menu_roles` VALUES ('375', '33', '8');
INSERT INTO `menu_roles` VALUES ('376', '34', '8');
INSERT INTO `menu_roles` VALUES ('377', '45', '8');
INSERT INTO `menu_roles` VALUES ('378', '46', '8');
INSERT INTO `menu_roles` VALUES ('379', '51', '8');
INSERT INTO `menu_roles` VALUES ('615', '2', '11');
INSERT INTO `menu_roles` VALUES ('616', '52', '11');
INSERT INTO `menu_roles` VALUES ('617', '53', '11');
INSERT INTO `menu_roles` VALUES ('618', '54', '11');
INSERT INTO `menu_roles` VALUES ('619', '55', '11');
INSERT INTO `menu_roles` VALUES ('620', '51', '11');
INSERT INTO `menu_roles` VALUES ('687', '2', '12');
INSERT INTO `menu_roles` VALUES ('688', '53', '12');
INSERT INTO `menu_roles` VALUES ('689', '2', '13');
INSERT INTO `menu_roles` VALUES ('690', '52', '13');
INSERT INTO `menu_roles` VALUES ('691', '53', '13');
INSERT INTO `menu_roles` VALUES ('692', '54', '13');
INSERT INTO `menu_roles` VALUES ('693', '55', '13');
INSERT INTO `menu_roles` VALUES ('694', '56', '13');
INSERT INTO `menu_roles` VALUES ('695', '57', '13');
INSERT INTO `menu_roles` VALUES ('696', '46', '13');
INSERT INTO `menu_roles` VALUES ('697', '51', '13');
INSERT INTO `menu_roles` VALUES ('823', '2', '9');
INSERT INTO `menu_roles` VALUES ('824', '52', '9');
INSERT INTO `menu_roles` VALUES ('825', '53', '9');
INSERT INTO `menu_roles` VALUES ('826', '54', '9');
INSERT INTO `menu_roles` VALUES ('827', '55', '9');
INSERT INTO `menu_roles` VALUES ('828', '56', '9');
INSERT INTO `menu_roles` VALUES ('829', '57', '9');
INSERT INTO `menu_roles` VALUES ('847', '69', '8');
INSERT INTO `menu_roles` VALUES ('880', '35', '8');
INSERT INTO `menu_roles` VALUES ('881', '36', '8');
INSERT INTO `menu_roles` VALUES ('882', '37', '8');
INSERT INTO `menu_roles` VALUES ('883', '38', '8');
INSERT INTO `menu_roles` VALUES ('884', '39', '8');
INSERT INTO `menu_roles` VALUES ('885', '48', '8');
INSERT INTO `menu_roles` VALUES ('886', '4', '8');
INSERT INTO `menu_roles` VALUES ('887', '60', '8');
INSERT INTO `menu_roles` VALUES ('888', '61', '8');
INSERT INTO `menu_roles` VALUES ('889', '62', '8');
INSERT INTO `menu_roles` VALUES ('890', '63', '8');
INSERT INTO `menu_roles` VALUES ('891', '64', '8');
INSERT INTO `menu_roles` VALUES ('892', '65', '8');
INSERT INTO `menu_roles` VALUES ('893', '66', '8');
INSERT INTO `menu_roles` VALUES ('894', '67', '8');
INSERT INTO `menu_roles` VALUES ('895', '68', '8');
INSERT INTO `menu_roles` VALUES ('896', '69', '8');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id_migration` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'surrogate key',
  `name` varchar(255) DEFAULT NULL COMMENT 'migration name, unique',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date migrated or rolled back',
  `statements` longtext COMMENT 'SQL statements for this migration',
  `rollback_statements` longtext COMMENT 'SQL statment for rolling back migration',
  `status` enum('update','rollback') DEFAULT NULL COMMENT 'update indicates it is a normal migration while rollback means this migration is rolled back',
  PRIMARY KEY (`id_migration`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `network_adapter`;
CREATE TABLE `network_adapter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `network_bandwidth`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `network_bandwidth_state`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `networkip`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `networkiprange`;
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

DROP TABLE IF EXISTS `rack`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rack_state`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `resource_report`;
CREATE TABLE `resource_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `number` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `right`;
CREATE TABLE `right` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `right_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `right_roles`;
CREATE TABLE `right_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `right_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `role` VALUES ('8', '超级管理员', '1', '2016-07-16 21:38:34', '', '', '2016-11-25 10:24:52');
INSERT INTO `role` VALUES ('9', '普通管理员', '1', '2016-07-28 15:39:10', '', '', '2017-01-12 10:59:26');
INSERT INTO `role` VALUES ('11', '网络管理员', '1', '2016-10-30 02:25:13', '', '', '2016-11-25 15:20:12');
INSERT INTO `role` VALUES ('12', '机房管理员', '1', '2016-10-26 14:56:28', '', '', '2016-11-25 16:43:59');
INSERT INTO `role` VALUES ('13', '机柜管理员', '1', '2016-11-18 03:55:13', '', '', '2016-11-25 16:54:53');

DROP TABLE IF EXISTS `room`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `room_state`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `server`;
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
  PRIMARY KEY (`serverid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `server_state`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `session_key` char(64) NOT NULL,
  `session_data` blob,
  `session_expiry` int(11) unsigned NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `software`;
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

DROP TABLE IF EXISTS `supplier`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `system_api_call`;
CREATE TABLE `system_api_call` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `api_name` varchar(100) NOT NULL DEFAULT '',
  `api_call_type` varchar(20) NOT NULL DEFAULT '',
  `api_create_date` date DEFAULT NULL,
  `api_create_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `system_color`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `system_color` VALUES ('1', '#FFC85F', '橙色', '0', '2016-12-20 16:09:49', 'admin', 'admin', '2016-12-20 16:09:49', 'state');
INSERT INTO `system_color` VALUES ('2', '#FF8B51', '红橙色', '0', '2016-12-20 16:09:49', 'admin', 'admin', '2016-12-20 16:09:49', 'state');
INSERT INTO `system_color` VALUES ('3', '#6BC86F', '淡绿色', '0', '2016-12-20 16:09:49', 'admin', 'admin', '2016-12-20 16:09:49', 'state');
INSERT INTO `system_color` VALUES ('4', '#0DB550', '深绿色', '0', '2016-12-20 16:09:49', 'admin', 'admin', '2016-12-20 16:09:49', 'state');
INSERT INTO `system_color` VALUES ('5', '#7EA2AB', '灰色', '0', '2016-12-20 16:09:49', 'admin', 'admin', '2016-12-20 16:09:49', 'state');
INSERT INTO `system_color` VALUES ('6', '#317F9E', '深蓝色', '0', '2016-12-20 16:09:49', 'admin', 'admin', '2016-12-20 16:09:49', 'state');

DROP TABLE IF EXISTS `system_email`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `system_licence`;
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

DROP TABLE IF EXISTS `system_log`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `system_panel`;
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

DROP TABLE IF EXISTS `topo_line`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `topo_node`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `topo_view`;
CREATE TABLE `topo_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `createby` varchar(100) DEFAULT NULL,
  `updateby` varchar(100) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'bin.liu@oneoaas.com', '18601706743', '58dd266e6558d1e66b0d50d9b65a5ff9', 'QQoxl6n7`!@.[#V7', '8', '2017-02-27 15:39:48', '2017-04-22 15:36:51', null, '127.0.0.1');

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `user_roles` VALUES ('4', '9', '9');
INSERT INTO `user_roles` VALUES ('6', '0', '12');
INSERT INTO `user_roles` VALUES ('8', '13', '9');
INSERT INTO `user_roles` VALUES ('9', '0', '0');
INSERT INTO `user_roles` VALUES ('10', '0', '14');
INSERT INTO `user_roles` VALUES ('11', '0', '14');
INSERT INTO `user_roles` VALUES ('14', '18', '14');
INSERT INTO `user_roles` VALUES ('15', '0', '13');
INSERT INTO `user_roles` VALUES ('16', '0', '13');
INSERT INTO `user_roles` VALUES ('17', '0', '13');
INSERT INTO `user_roles` VALUES ('19', '0', '13');
INSERT INTO `user_roles` VALUES ('21', '0', '11');
INSERT INTO `user_roles` VALUES ('23', '0', '12');
INSERT INTO `user_roles` VALUES ('24', '0', '9');
INSERT INTO `user_roles` VALUES ('25', '0', '9');
INSERT INTO `user_roles` VALUES ('26', '0', '12');
INSERT INTO `user_roles` VALUES ('27', '0', '12');
INSERT INTO `user_roles` VALUES ('28', '0', '9');
INSERT INTO `user_roles` VALUES ('29', '0', '0');
INSERT INTO `user_roles` VALUES ('30', '0', '0');
INSERT INTO `user_roles` VALUES ('31', '0', '9');
INSERT INTO `user_roles` VALUES ('32', '0', '0');
INSERT INTO `user_roles` VALUES ('33', '0', '0');
INSERT INTO `user_roles` VALUES ('34', '0', '9');
INSERT INTO `user_roles` VALUES ('35', '0', '9');
INSERT INTO `user_roles` VALUES ('36', '0', '9');
INSERT INTO `user_roles` VALUES ('37', '0', '9');
INSERT INTO `user_roles` VALUES ('38', '0', '9');
INSERT INTO `user_roles` VALUES ('39', '0', '9');
INSERT INTO `user_roles` VALUES ('40', '0', '9');
INSERT INTO `user_roles` VALUES ('41', '0', '9');
INSERT INTO `user_roles` VALUES ('42', '0', '9');
INSERT INTO `user_roles` VALUES ('43', '0', '9');
INSERT INTO `user_roles` VALUES ('44', '0', '9');
INSERT INTO `user_roles` VALUES ('45', '0', '9');
INSERT INTO `user_roles` VALUES ('46', '0', '9');
INSERT INTO `user_roles` VALUES ('47', '0', '9');
INSERT INTO `user_roles` VALUES ('48', '0', '9');
INSERT INTO `user_roles` VALUES ('49', '0', '9');
INSERT INTO `user_roles` VALUES ('50', '0', '9');
INSERT INTO `user_roles` VALUES ('51', '0', '9');
INSERT INTO `user_roles` VALUES ('52', '0', '9');
INSERT INTO `user_roles` VALUES ('53', '0', '9');
INSERT INTO `user_roles` VALUES ('54', '0', '9');
INSERT INTO `user_roles` VALUES ('55', '0', '9');
INSERT INTO `user_roles` VALUES ('56', '0', '9');
INSERT INTO `user_roles` VALUES ('57', '0', '9');
INSERT INTO `user_roles` VALUES ('59', '0', '9');
INSERT INTO `user_roles` VALUES ('60', '0', '9');
INSERT INTO `user_roles` VALUES ('61', '0', '9');
INSERT INTO `user_roles` VALUES ('62', '0', '9');
INSERT INTO `user_roles` VALUES ('63', '0', '9');
INSERT INTO `user_roles` VALUES ('64', '0', '9');
INSERT INTO `user_roles` VALUES ('65', '0', '9');
INSERT INTO `user_roles` VALUES ('66', '0', '9');
INSERT INTO `user_roles` VALUES ('67', '0', '9');
INSERT INTO `user_roles` VALUES ('68', '0', '9');
INSERT INTO `user_roles` VALUES ('74', '0', '0');
INSERT INTO `user_roles` VALUES ('75', '0', '0');
INSERT INTO `user_roles` VALUES ('76', '0', '0');
INSERT INTO `user_roles` VALUES ('77', '0', '0');
INSERT INTO `user_roles` VALUES ('78', '0', '0');
INSERT INTO `user_roles` VALUES ('79', '0', '0');
INSERT INTO `user_roles` VALUES ('80', '0', '0');
INSERT INTO `user_roles` VALUES ('81', '0', '0');
INSERT INTO `user_roles` VALUES ('82', '46', '16');
INSERT INTO `user_roles` VALUES ('83', '0', '16');
INSERT INTO `user_roles` VALUES ('84', '0', '16');
INSERT INTO `user_roles` VALUES ('85', '0', '16');
INSERT INTO `user_roles` VALUES ('86', '49', '16');
INSERT INTO `user_roles` VALUES ('87', '0', '9');
INSERT INTO `user_roles` VALUES ('88', '0', '9');
INSERT INTO `user_roles` VALUES ('89', '50', '9');
INSERT INTO `user_roles` VALUES ('90', '0', '8');
INSERT INTO `user_roles` VALUES ('91', '0', '8');
INSERT INTO `user_roles` VALUES ('92', '0', '9');
INSERT INTO `user_roles` VALUES ('93', '0', '8');
INSERT INTO `user_roles` VALUES ('94', '0', '8');
INSERT INTO `user_roles` VALUES ('95', '0', '8');
INSERT INTO `user_roles` VALUES ('96', '0', '8');
INSERT INTO `user_roles` VALUES ('97', '0', '8');
INSERT INTO `user_roles` VALUES ('98', '0', '8');
INSERT INTO `user_roles` VALUES ('99', '21', '8');
INSERT INTO `user_roles` VALUES ('101', '0', '8');
INSERT INTO `user_roles` VALUES ('102', '0', '9');
INSERT INTO `user_roles` VALUES ('103', '0', '8');
INSERT INTO `user_roles` VALUES ('104', '0', '8');
INSERT INTO `user_roles` VALUES ('106', '0', '8');
INSERT INTO `user_roles` VALUES ('107', '0', '8');
INSERT INTO `user_roles` VALUES ('108', '0', '8');
INSERT INTO `user_roles` VALUES ('112', '0', '9');
INSERT INTO `user_roles` VALUES ('117', '0', '11');
INSERT INTO `user_roles` VALUES ('118', '0', '9');
INSERT INTO `user_roles` VALUES ('119', '0', '11');
INSERT INTO `user_roles` VALUES ('120', '0', '8');
INSERT INTO `user_roles` VALUES ('121', '0', '8');
INSERT INTO `user_roles` VALUES ('123', '0', '9');
INSERT INTO `user_roles` VALUES ('124', '30', '9');

DROP TABLE IF EXISTS `virt`;
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

DROP TABLE IF EXISTS `virttype`;
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

DROP TABLE IF EXISTS `vm_aliyun`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `vm_aws`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `vm_vmware`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zabbix_host`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;