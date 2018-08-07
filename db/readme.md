#数据库设计
##资源增加UUID
```
- 通用唯一识别码（英语：Universally Unique Identifier，简称UUID）是一种软件建构的标准，亦为开放软件基金会组织在分布式计算环境领域的一部分。
- UUID的目的，是让分布式系统中的所有元素，都能有唯一的辨识信息，而不需要通过中央控制端来做辨识信息的指定。如此一来，每个人都可以创建不与其它人冲突的UUID。
- 在这样的情况下，就不需考虑数据库创建时的名称重复问题。目前最广泛应用的UUID，是微软公司的全局唯一标识符（GUID），而其他重要的应用，
- 则有Linux ext2/ext3文件系统、LUKS加密分区、GNOME、KDE、Mac OS X等等。另外我们也可以在e2fsprogs包中的UUID库找到实现。

```

##规范
```
- 增加表字段时，需要编写ALERT ADD 语句，同时需要在对应的model层添加对象属性
- 删除表字段时，需要编写ALERT MODIFY 语句，同时需要在对应的model层删除对象属性

字段操作example:

//增加一个字段，默认为空
alter table user add COLUMN new1 VARCHAR(20) DEFAULT NULL;

//增加一个字段，默认不能为空
alter table user add COLUMN new2 VARCHAR(20) NOT NULL; 　

//删除server uuid 字段 alter table user DROP COLUMN new2;
alter table `server` drop COLUMN server_uuid;

//修改一个字段的类型
alter table user MODIFY new1 VARCHAR(10);

//修改一个字段的名称，此时一定要重新指定该字段的类型　
alter table user CHANGE new1 new4 int;　　　　　　　　　　　　　
　
```

##创建视图
```
CREATE [OR REPLACE] [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}] VIEW view_name [(column_list)] AS select_statement [WITH [CASCADED | LOCAL] CHECK OPTION]
MERGE 将视图的定义语句直接替换成sql语句，再执行
TEMPTABLE 视图的执行结果存入内存中，对视图的操作既是对内存操作

-- server 视图
CREATE VIEW view_server AS
  SELECT serverid,isServer
  FROM server;

-- user 视图
CREATE VIEW view_user AS
SELECT t1.userid,t1.login_name,t1.role_id,t2.name
FROM user t1 left join role t2 on t1.role_id = t2.id;

-- 删除视图
drop view view_user;

```