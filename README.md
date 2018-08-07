#CMDB

##容器化支持
```
docker run -d --hostname=oneoaas --name cmdb --privileged=true -t -i -d -p 127.0.0.1:9898:9898 oneoaas:cmdb /bin/bash
```

##自动化部署
```
mkdir /etc/ansible
touch /etc/ansible/hosts

Poll SCM：定时检查源码变更（根据SCM软件的版本号），如果有更新就checkout最新code下来，然后执行构建动作。我的配置如下：
*/5 * * * *  （每5分钟检查一次源码变化）
Build periodically：周期进行项目构建（它不care源码是否发生变化），我的配置如下：
0 2 * * *  （每天2:00 必须build一次源码）
```

##系统版本
```
oneoaas-cmdb-1.2.3
```

#安装环境
```
Golang version >= 1.5
beego  version =  1.5
GOPATH=/usr/local/gopath
使用go1.5的vendor功能进行包管理
系统安装 go get oneoaas.com/cmdb && ./cmdb

前后端分离部署,开启html5mode
server {
    listen       9797;
    server_name  localhost;

    #charset koi8-r;
    access_log  /var/log/nginx/log/cmdb_frontend.access.log  main;

    location / {
        root   /opt/oneoaas-cmdb-1-2-3/client/static;
        index  /dest/template/index.html;
    }

    error_page 404 /dest/template/index.html;
}

```

#数据库环境变更
``
10.0.2.47 mysql> grant all on *.* to root@'%' identified by 'oneoaas@2A';
cmdb_v15
``

#依赖库
```
web库 go get -u github.com/astaxie/beego
token库 go get -u github.com/dgrijalva/jwt-go
数据库 go get -u github.com/go-sql-driver/mysql
任务 go get -u github.com/robfig/cron
定时任务 go get -u github.com/jasonlvhit/gocron
测试框架 go get -u github.com/smartystreets/goconvey
阿里云 go get -u github.com/denverdino/aliyungo
亚马逊 go get -u github.com/aws/aws-sdk-go
vcenter go get -u github.com/vmware/govmomi
zabbix go get -u github.com/rday/zabbix
Excel go get -u  github.com/tealeg/xlsx
```

#系统结构说明
```
onecmdb 项目名称
├─conf  配置文件
├─controllers 业务处理控制器
│  ├─api 数据API
│  └─web web视图处理
├─db   数据库版本脚本控制
├─lib  自定义库
├─models 模型
├─routers 路由
├─simple  示例代码
├─static  静态资源文件
├─tests
├─util
├─vendor
└─views  视图模板

```

#数据库模型映射规范
```
- 表字段如果由多个单词构成，则用下划线分隔,模型中使用驼峰方式编写属性
- 如果不允许为空：null
- 如果需要自定义列名：column(supplierid)
- 主键名称为ID：column(Id)

- 统表加上前缀
- 多对多关系,中间表会自动创建
- `orm:"rel(m2m)"` 表示多对多关系
- `orm:"reverse(many)"` 逆向看关系

null
数据库表默认为 NOT NULL，设置 null 代表 ALLOW NULL
Name string `orm:"null"`

```


#系统设计
```
//beego.EnableXSRF = true
//beego.XSRFExpire = 3600  //过期时间，默认60秒
//beego.XSRFK1qEY="579d9ec9d0c3d687aaa91289ac2854e4"
//开启session
//beego.SessionName=""
//beego.SessionGCMaxLifetime=3600
//beego.EnableHttpTLS
//beego.SessionAutoSetCookie
//beego.SessionDomain=""
//beego.SessionCookieLifeTime

```

#代码编写规范
```
1.Controller文件以Rest结尾
2.模型文件的首字母为大小
```

#自动发布
```
git log --pretty=oneline 查看提交简略记录
git reset --hard HEAD^ 回退到上一个版本(Head表示当前版本),上一个版本就是HEAD^^，当然往上100个版本写100个^比较容易数不过来，所以写成HEAD~100

```

#同步Vcenter
``
1.地址：https://10.0.2.8/
2.用户名/密码：administrator@oneoaas.com/Oneoaas#123
             cmdb@oneoaas.com/cmDB@123
3.测试同步数据时密码不能带有#

``

#自动部署
```
nginx 反向代理配置
server {
    listen       80;
    server_name  .a.com;

    charset utf-8;
    access_log  /home/a.com.access.log;

    location /(css|js|fonts|img)/ {
        access_log off;
        expires 1d;

        root "/path/to/app_a/static";
        try_files $uri @backend;
    }

    location / {
        try_files /_not_exists_ @backend;
    }

    location @backend {
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header Host            $http_host;

        proxy_pass http://127.0.0.1:8080;
    }
}

server {
    listen       80;
    server_name  .b.com;

    charset utf-8;
    access_log  /home/b.com.access.log  main;

    location /(css|js|fonts|img)/ {
        access_log off;
        expires 1d;

        root "/path/to/app_b/static";
        try_files $uri @backend;
    }

    location / {
        try_files /_not_exists_ @backend;
    }

    location @backend {
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header Host            $http_host;

        proxy_pass http://127.0.0.1:8081;
    }
}


环境
Centos:6.5 root@120.24.160.47
Mysql:5.1.73
Set password:/usr/bin/mysqladmin -u root password 'new-password'

创建数据库
CREATE DATABASE if not exists oneoaas_cmdb_5  CHARSET utf8 COLLATE utf8_general_ci;

1、导出數據库為dbname的表结构（其中用戶名為root,密码為dbpasswd,生成的脚本名為db.sql）
mysqldump -uroot -pdbpasswd -d dbname >db.sql;

2、导出數據库為dbname某张表(test)结构
mysqldump -uroot -pdbpasswd -d oneoaas_cmdb menu>menu.sql;

3、导出数据库为dbname所有表结构及表数据（不加-d）
mysqldump -uroot -p --default-character-set=utf8 oneoaas_cmdb_4 >oneoaas_cmdb_v2.alpha.5.sql

4、导出數據库為dbname某张表(test)结构及表數據（不加-d）
--extended-insert=false 多行insert
--extended-insert=true  单行insert
time mysqldump -uroot -p123456 --default-character-set=utf8 --extended-insert=false  oneoaas_cmdb menu>menu.sql

5、授权用户访问
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'oneoaas'@'%' IDENTIFIED BY 'oneoaas@2A' WITH GRANT OPTION;
FLUSH PRIVILEGES;

6.显示创建表的sql
show create table ip_subnet;
```

#couchbase
``
UPDATE default USE KEYS "firewall"
SET description= "防火墙产商" RETURNING default.description;

UPDATE default USE KEYS "firewall"
SET description= "防火墙产商" RETURNING default.*;

移除指定key=name 返回（RETURNING）所有,default表示bucket,firewall表示当前key
UPDATE default USE KEYS "firewall" UNSET name RETURNING default.*

移除数组所有元素对象,default表示bucket,firewall表示当前key
UPDATE default t USE KEYS "firewall" UNSET c FOR c IN cidata WHEN c.id="3" END RETURNING t

删除数组中的某一元素对象，default表示bucket,firewall表示当前key
UPDATE default USE KEYS "firewall" SET data = ARRAY c FOR c IN data WHEN c.test2 !="bb1" END

UPDATE default USE KEYS "firewall"
SET cidata = ARRAY c FOR c IN cidata WHEN c.id IS MISSING END

``

#问题
``
1.操作功能没有向导
2.可视化与查询如何关联
3.可视化需要新功能
4.自定义需要放到资源变更中
5.合同是否需要放到资源变更中?
6.是否可以从服务器列表中查询所属合同?
7.服务器添加是否可以增加自定义字段?
8.服务器序列号可以不填写?
9.自定义添加属性失败?
10.界面展示比较单一,多一些图形展示?
11.资源删除需要二次提醒?
12.删除需要保留历史记录。

新需求
A 1.全局资源搜索
A 2.单个资源搜索
A 3.表单属性必要和非必要,自定义字段
B 4.增加对资源操作的提示与帮助
A 5.资源树形展示结构
A 6.历史记录显示,(物理删除/逻辑删除)


业务分层-可视化
物理分层-可视化

``

#能力
``
ONEOAAS-CMDB宏观能力：
能使混乱的没有组织的IT资产，成为有组织的IT资产
能解决哪些机柜有足够的空间可以架设新的服务器
能解决服务器/操作系统是否仍然在支持
能解决资产的相互依赖关系以及服务支持的关系
能解决大幅数据录入问题，减少不必要的工作，提升生产力
能开放功能强大的REST API，具备生态连接能力
微观能力：

``

#重构规范
``
1.如果基于对象查询方法以Query开头命名
2.如果基于Sql查询方法以Get开头命名
3.第二版本api命名空间(/api/v2),服务器命名以V2结尾

``


#Rest API 规范
``
https://beego.me/docs/advantage/docs.md

// @Title Get Product list
// @Description Get Product list by some info
// @Success 200 {object} models.ZDTProduct.ProductList
// @Param   category_id     query   int false       "category id"
// @Param   brand_id    query   int false       "brand id"
// @Param   query   query   string  false       "query of search"
// @Param   segment query   string  false       "segment"
// @Param   sort    query   string  false       "sort option"
// @Param   dir     query   string  false       "direction asc or desc"
// @Param   offset  query   int     false       "offset"
// @Param   limit   query   int     false       "count limit"
// @Param   price           query   float       false       "price"
// @Param   special_price   query   bool        false       "whether this is special price"
// @Param   size            query   string      false       "size filter"
// @Param   color           query   string      false       "color filter"
// @Param   format          query   bool        false       "choose return format"
// @Failure 400 no enough input
// @Failure 500 get products common error
// @router /products [get]


``

#SQL版本重构
```
//创建变更

bee generate migration menu

//执行变更
bee migrate -conn="root:oneoaas@2A@tcp(10.0.2.47:3306)/oneoaas_cmdb_3"

//回滚最后一次migration,会执行
bee migrate rollback -conn="root:oneoaas@2A@tcp(10.0.2.47:3306)/oneoaas_cmdb_3"

//重置所有migration 会执行所有的up与down
bee migrate reset -conn="root:oneoaas@2A@tcp(10.0.2.47:3306)/oneoaas_cmdb_3"

//刷新重新执行所有migration
bee migrate refresh -conn="root:oneoaas@2A@tcp(10.0.2.47:3306)/oneoaas_cmdb_3"

//生成model
bee generate model resourceReport -fields="id:int,name:string,number:int"
bee generate model DevicePerformanceReport -fields="id:int,device:string,cpu:int64,memory:int64,diskUsage:float64,nicUsage:float64"

慢查询有什么用：
它能记录下所有执行超过long_query_time时间的SQL语句, 帮你找到执行慢的SQL, 方便我们对这些SQL进行优化.
#开启慢日志
slow_query_log=on
slow_query_log_file=/data/f/mysql_slow_cw.log
long_query_time=2
log-queries-not-using-indexes
//查看索引使用情况
show status like 'Handler_read%';

//分析sql
ANALYZE TABLE
CHECK TABLE
CHECKSUM TABLE

查询mysql的操作信息
show status -- 显示全部mysql操作信息
show status like "com_insert%"; -- 获得mysql的插入次数;
show status like "com_delete%"; -- 获得mysql的删除次数;
show status like "com_select%"; -- 获得mysql的查询次数;
show status like "uptime"; -- 获得mysql服务器运行时间
show status like 'connections'; -- 获得mysql连接次数
```


#测试
```
//测试package
go test -v testing
go test -v github.com/bradfitz/http2
//测试多个包
go test -v testing encoding/json
//运行所有测试
go test ./...
```

