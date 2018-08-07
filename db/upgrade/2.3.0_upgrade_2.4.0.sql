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