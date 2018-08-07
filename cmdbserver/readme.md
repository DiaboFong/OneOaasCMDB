#cmdb分布式设计

##cmdbserver

``
protoc -I proto/ proto/service.proto --go_out=plugins=grpc:proto

``

##cmdbagent

##cache使用
```
这里的cache是说基于内存的，使用cache 做队列使用

采用redis 原则
1.Redis支持5种数据类型：字符串、Map、List、Set、Sorted Set。
2.不同应用采用不同的Redis实例
3.Redis不支持每个数据库设置不同的访问密码
4.Redis多个数据库之间并不完全隔离
5.List特别适合用于实现队列。提供的操作包括：
  从左侧（或右侧）放入一个元素，从右侧（或左侧）取出一个元素，读取某个范围的元素，删除某个范围的元素
6.Redis直接提供的命令都是原子操作，包括lpush、rpop、blpush、brpop等。
7.Redis支持事务。通过类似 begin…[cancel]…commit的语法，
    提供begin…commit之间的命令为原子操作的功能，
    之间命令对数据的改变对其他操作是不可见的。
    类似关系型数据库中的存储过程，同时提供了最高级别的事务隔离级别。
8.Redis支持Master－Slave数据复制

redis 操作常用命令
KEYS  * 获取默认数据库所有key
GET task_b19e695c-9f5d-4e2d-91c5-a74d21a34e96 获取当前task对应的消息


```