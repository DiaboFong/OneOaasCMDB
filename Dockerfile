FROM golang:latest
MAINTAINER Liu Bin <bin.liu@oneoaas.com>

ENV CMDB_HOME /opt/oneoaas-cmdb
ENV GOROOT /usr/local/go
ENV GOPATH /usr/local/gopath
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

RUN mkdir -p $GOPATH/src/oneoaas.com/cmdb $GOPATH/bin $GOPATH/pkg
EXPOSE 9898
ADD . /$GOPATH/src/oneoaas.com/cmdb

WORKDIR $GOPATH/src/oneoaas.com/cmdb

RUN go build oneoaas-cmdb.go

RUN mkdir -p $CMDB_HOME
RUN cp -rf conf  swagger  static  views start.sh  stop.sh  oneoaas-cmdb "${CMDB_HOME}"

#拷贝初始化数据 sql 脚本
RUN cp -rf db/V2.2.0_data.sql   "${CMDB_HOME}"

#拷贝数据库定义 sql 脚本
RUN cp -rf db/V2.2.0_schema.sql "${CMDB_HOME}"

#拷贝数据从2.1.0升级到2.2.0脚本
RUN cp -rf db/upgrade           "${CMDB_HOME}"
RUN rm -rf *

WORKDIR $CMDB_HOME
