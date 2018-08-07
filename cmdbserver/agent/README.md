#cmdb agent研发
1.agent 第一步，运维通过手动指定ip，端口
2.agent 第二步，以系统进程方式运行

#设置环境变量
```
使用gopsutil遇到一个bug(https://github.com/shirou/gopsutil/issues/339)
go build systools.go //error
go build -ldflags=-s systools.go //ok
go build -ldflags 参数及 gdb 调试
有时发布时我们想隐藏所有代码实现相关的信息，使用 go build -ldflags 参数可以实现相关要求。


export ONEOAAS_CMDB_ENDPOINT="http://127.0.0.1:9898/api/"
export ONEOAAS_CMDB_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDkzNTIxNTk2LCJpYXQiOjE0OTA5Mjk1OTYsInR5cGUiOiJzZWxmIiwidXNlcm5hbWUiOiJhZG1pbiJ9.9Vp_O0Nerlgo4gq3q0PW7gj2ziFW2H1uG_e3pUWaSX8"

#命令执行方式example
./cmdb-agent meta-data push cpu ed982476-c6b2-4911-9ca0-f00fb71c

```

