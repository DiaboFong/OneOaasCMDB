
--  增加服务器uuid
ALTER TABLE `server`
  ADD COLUMN `server_uuid` varchar(32) NOT NULL UNIQUE COMMENT '服务器唯一标识'
  AFTER `serverid`;

-- 修改cpu 对象表
ALTER TABLE `cpu` ADD COLUMN `server_id` bigint;

-- 修改内存对象表
ALTER TABLE `memory` ADD COLUMN `server_id` bigint;

-- 修改硬盘 对象表
ALTER TABLE `harddisk` ADD COLUMN `server_id` bigint;

-- 修改网卡 对象表
ALTER TABLE `network_adapter` ADD COLUMN `server_id` bigint ;

ALTER TABLE `server` DROP COLUMN adapter_id;

ALTER TABLE `server` DROP COLUMN harddisk_id;

ALTER TABLE `server` DROP COLUMN memory_id;

ALTER TABLE `server` DROP COLUMN cpu_id;

-- 修改cpu表，添加cpu属性字段
ALTER TABLE `cpu` ADD COLUMN `family` varchar(255);
ALTER TABLE `cpu` ADD COLUMN `model` varchar(255);
ALTER TABLE `cpu` ADD COLUMN `stepping` integer;
ALTER TABLE `cpu` ADD COLUMN `cores` integer;
ALTER TABLE `cpu` ADD COLUMN `model_name` varchar(255);
ALTER TABLE `cpu` ADD COLUMN `mhz` double precision;
ALTER TABLE `cpu` ADD COLUMN `cache_size` integer;
ALTER TABLE `cpu` ADD COLUMN `flags` varchar(255);
ALTER TABLE `cpu` ADD COLUMN `cpu` integer;
ALTER TABLE `cpu` ADD COLUMN `vendor_id` varchar(255);
ALTER TABLE `cpu` ADD COLUMN `physical_id` varchar(255);
ALTER TABLE `cpu` ADD COLUMN `core_id` varchar(255);

-- 修改vm_vmware表，修改字段大小
ALTER TABLE `vm_vmware`  MODIFY COLUMN `vm_path_name` varchar(100);
ALTER TABLE `vm_vmware`  MODIFY COLUMN `uuid` varchar(100);
ALTER TABLE `vm_vmware`  MODIFY COLUMN `instance_uuid` varchar(100);
ALTER TABLE `vm_vmware`  MODIFY COLUMN `guest_fullname` varchar(100);
ALTER TABLE `vm_vmware`  MODIFY COLUMN `annotation` varchar(60);

-- 修改vm_aliyun表，修改字段大小
ALTER TABLE `vm_aliyun`  MODIFY COLUMN `host_name` varchar(50);
ALTER TABLE `vm_aliyun`  MODIFY COLUMN `image_id` varchar(50);

-- 更新时间2017-4-11 04:21
-- 新增服务器端口表
CREATE TABLE IF NOT EXISTS `server_port` (
    `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `ip` varchar(64) NOT NULL DEFAULT '' ,
    `port` integer unsigned NOT NULL DEFAULT 0 ,
    `proccess` varchar(128) NOT NULL DEFAULT '' ,
    `server_id` bigint
) ENGINE=INNODB;

-- 服务器磁盘对象的,删除作废字段
alter table `memory` drop COLUMN name;
alter table `memory` drop COLUMN total;
alter table `memory` drop COLUMN available;
alter table `memory` drop COLUMN used;
alter table `memory` drop COLUMN used_percent;
alter table `memory` drop COLUMN free;

-- 服务器内存对象的,添加字段
ALTER TABLE `memory` ADD COLUMN `virtual_total` bigint unsigned NOT NULL  DEFAULT 0;
ALTER TABLE `memory` ADD COLUMN `virtual_available` bigint unsigned NOT NULL  DEFAULT 0;
ALTER TABLE `memory` ADD COLUMN `virtual_used` bigint unsigned NOT NULL  DEFAULT 0;
ALTER TABLE `memory` ADD COLUMN `virtual_used_percent` double precision NOT NULL  DEFAULT 0;
ALTER TABLE `memory` ADD COLUMN `virtual_free` bigint unsigned NOT NULL  DEFAULT 0;
ALTER TABLE `memory` ADD COLUMN `swap_total` bigint unsigned NOT NULL  DEFAULT 0;
ALTER TABLE `memory` ADD COLUMN `swap_used` bigint unsigned NOT NULL  DEFAULT 0;
ALTER TABLE `memory` ADD COLUMN `swap_used_percent` double precision NOT NULL  DEFAULT 0;
ALTER TABLE `memory` ADD COLUMN `swap_free` bigint unsigned NOT NULL  DEFAULT 0;

-- 服务器磁盘对象的,添加字段
ALTER TABLE `harddisk` ADD COLUMN `device` varchar(64) NOT NULL  DEFAULT '';
ALTER TABLE `harddisk` ADD COLUMN `mountpoint` varchar(64) NOT NULL  DEFAULT '';
ALTER TABLE `harddisk` ADD COLUMN `fstype` varchar(64) NOT NULL  DEFAULT '';
ALTER TABLE `harddisk` ADD COLUMN `opts` varchar(64) NOT NULL  DEFAULT '';

-- 删除服务器磁盘对象的name
alter table `harddisk` drop COLUMN name;

-- 网络接口对象，添加字段
ALTER TABLE `network_adapter` ADD COLUMN `mtu` bigint NOT NULL  DEFAULT 0;
ALTER TABLE `network_adapter` ADD COLUMN `hardwareaddr` varchar(64) NOT NULL  DEFAULT '';
ALTER TABLE `network_adapter` ADD COLUMN `flags` varchar(32) NOT NULL  DEFAULT '';
ALTER TABLE `network_adapter` ADD COLUMN `addrs` varchar(32) NOT NULL  DEFAULT '';