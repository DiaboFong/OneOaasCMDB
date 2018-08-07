数据中心API
===============

1.获取数据中心
---------------

1.1 请求URL
+++++++++++++++

.. code-block:: html
   :linenos:

   http://console.dev.oneoaas.com:8080/api/datacenter?limit=10&offset=0&format=total&sort=Dcid&order=asc


1.2 请求参数
+++++++++++++++

 #. limit:查询条数
 #. offset:开始查询记录数
 #. format:返回请求格式,如果值为total
 #. sort:排序字段
 #. order:排序方式desc,asc



1.3 响应结果
+++++++++++++++

.. code-block:: javascript

   {
     "rows": [
       {
         "Dcid": 33,
         "Dcname": "test",
         "Dcprovince": "天津",
         "Dccity": "市辖区",
         "Dccounty": "河东区",
         "Dcaddress": "test",
         "Dcgeo": "120.00",
         "Comment": "test",
         "Region": {
           "Id": 4,
           "RegionName": "华南",
           "Enable": false,
           "CreateTime": "2016-05-30T15:48:12+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-05-30T15:48:14+08:00",
           "Datacenter": null
         },
         "State": {
           "Id": 2,
           "State": "下线",
           "Enable": false,
           "CreateTime": "2016-05-30T15:50:52+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-06-21T13:21:33+08:00",
           "Datacenter": null
         },
         "Supplier": {
           "Id": 2,
           "Supplier": "DELL",
           "BusinessContact": "李",
           "BusinessTelPhone": "021-6095 0835",
           "BusinessMobilePhone": "021-60950835",
           "BusinessEmail": "3243@",
           "TechnologyContact": "赵",
           "TechnologyTelphone": "021-60950835",
           "TechnologyMobilePhone": "456564565",
           "TechnologyEmail": "2323@",
           "OfficeAddress": "上海",
           "Comment": "oneoaas",
           "Datacenter": null,
           "Agreement": null,
           "Server": null
         },
         "Room": null
       },
       {
         "Dcid": 34,
         "Dcname": "test2",
         "Dcprovince": "安徽",
         "Dccity": "安庆市",
         "Dccounty": "太湖县",
         "Dcaddress": "test2",
         "Dcgeo": "22.44",
         "Comment": "test",
         "Region": {
           "Id": 1,
           "RegionName": "华西",
           "Enable": false,
           "CreateTime": "2016-05-30T15:39:55+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-09-05T14:48:38+08:00",
           "Datacenter": null
         },
         "State": {
           "Id": 1,
           "State": "使用中",
           "Enable": false,
           "CreateTime": "2016-05-30T15:50:12+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-06-21T13:07:27+08:00",
           "Datacenter": null
         },
         "Supplier": {
           "Id": 2,
           "Supplier": "DELL",
           "BusinessContact": "李",
           "BusinessTelPhone": "021-6095 0835",
           "BusinessMobilePhone": "021-60950835",
           "BusinessEmail": "3243@",
           "TechnologyContact": "赵",
           "TechnologyTelphone": "021-60950835",
           "TechnologyMobilePhone": "456564565",
           "TechnologyEmail": "2323@",
           "OfficeAddress": "上海",
           "Comment": "oneoaas",
           "Datacenter": null,
           "Agreement": null,
           "Server": null
         },
         "Room": null
       },
       {
         "Dcid": 35,
         "Dcname": "test3",
         "Dcprovince": "安徽",
         "Dccity": "安庆市",
         "Dccounty": "太湖县",
         "Dcaddress": "test2",
         "Dcgeo": "22.44",
         "Comment": "test",
         "Region": {
           "Id": 1,
           "RegionName": "华西",
           "Enable": false,
           "CreateTime": "2016-05-30T15:39:55+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-09-05T14:48:38+08:00",
           "Datacenter": null
         },
         "State": {
           "Id": 1,
           "State": "使用中",
           "Enable": false,
           "CreateTime": "2016-05-30T15:50:12+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-06-21T13:07:27+08:00",
           "Datacenter": null
         },
         "Supplier": {
           "Id": 2,
           "Supplier": "DELL",
           "BusinessContact": "李",
           "BusinessTelPhone": "021-6095 0835",
           "BusinessMobilePhone": "021-60950835",
           "BusinessEmail": "3243@",
           "TechnologyContact": "赵",
           "TechnologyTelphone": "021-60950835",
           "TechnologyMobilePhone": "456564565",
           "TechnologyEmail": "2323@",
           "OfficeAddress": "上海",
           "Comment": "oneoaas",
           "Datacenter": null,
           "Agreement": null,
           "Server": null
         },
         "Room": null
       },
       {
         "Dcid": 37,
         "Dcname": "test4",
         "Dcprovince": "上海",
         "Dccity": "市辖区",
         "Dccounty": "黄浦区",
         "Dcaddress": "上海市普陀区天地软件园",
         "Dcgeo": "110.22",
         "Comment": "华为上海数据中心",
         "Region": {
           "Id": 4,
           "RegionName": "华南",
           "Enable": false,
           "CreateTime": "2016-05-30T15:48:12+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-05-30T15:48:14+08:00",
           "Datacenter": null
         },
         "State": {
           "Id": 1,
           "State": "使用中",
           "Enable": false,
           "CreateTime": "2016-05-30T15:50:12+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-06-21T13:07:27+08:00",
           "Datacenter": null
         },
         "Supplier": {
           "Id": 3,
           "Supplier": "HUAWEI",
           "BusinessContact": "孙",
           "BusinessTelPhone": "021-6095 0835",
           "BusinessMobilePhone": "021-60950835",
           "BusinessEmail": "5454@",
           "TechnologyContact": "杨",
           "TechnologyTelphone": "021-60950835",
           "TechnologyMobilePhone": "234234234",
           "TechnologyEmail": "2323@",
           "OfficeAddress": "上海",
           "Comment": "oneoaas",
           "Datacenter": null,
           "Agreement": null,
           "Server": null
         },
         "Room": null
       },
       {
         "Dcid": 38,
         "Dcname": "aaaa",
         "Dcprovince": "上海",
         "Dccity": "市辖区",
         "Dccounty": "黄浦区",
         "Dcaddress": "22",
         "Dcgeo": "22.22",
         "Comment": "test",
         "Region": {
           "Id": 1,
           "RegionName": "华西",
           "Enable": false,
           "CreateTime": "2016-05-30T15:39:55+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-09-05T14:48:38+08:00",
           "Datacenter": null
         },
         "State": {
           "Id": 1,
           "State": "使用中",
           "Enable": false,
           "CreateTime": "2016-05-30T15:50:12+08:00",
           "CreateBy": "han",
           "UpdateBy": "han",
           "UpdateTime": "2016-06-21T13:07:27+08:00",
           "Datacenter": null
         },
         "Supplier": {
           "Id": 2,
           "Supplier": "DELL",
           "BusinessContact": "李",
           "BusinessTelPhone": "021-6095 0835",
           "BusinessMobilePhone": "021-60950835",
           "BusinessEmail": "3243@",
           "TechnologyContact": "赵",
           "TechnologyTelphone": "021-60950835",
           "TechnologyMobilePhone": "456564565",
           "TechnologyEmail": "2323@",
           "OfficeAddress": "上海",
           "Comment": "oneoaas",
           "Datacenter": null,
           "Agreement": null,
           "Server": null
         },
         "Room": null
       }
     ],
     "total": 5
   }

1.3.1 响应结果说明
^^^^^^^^^^^^^^^^^^^^
#. rows:表示返回的具体结果集合
#. total:表示返回具体记录数


2.添加数据中心
---------------

2.1 请求URL
+++++++++++++++

2.2 请求参数
+++++++++++++++

2.3 响应结果
+++++++++++++++


3.更新数据中心
---------------

3.1 请求URL
+++++++++++++++

3.2 请求参数
+++++++++++++++

3.3 响应结果
+++++++++++++++


4.删除数据中心
---------------

4.1 请求URL
+++++++++++++++

4.2 请求参数
+++++++++++++++

4.3 响应结果
+++++++++++++++