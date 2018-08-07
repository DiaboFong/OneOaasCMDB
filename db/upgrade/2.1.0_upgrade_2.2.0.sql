
--  增加服务器uuid
ALTER TABLE `oneoaas_cmdb`.`server`
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
