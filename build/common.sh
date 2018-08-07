#!/bin/bash

#使bash在遇到简单的命令失败(而不是控制结构)时退出
#set -o errexit
#当在交互式shell中使用未设置变量时，将显示一条错误消息并退出shell脚本
set -o nounset
#告诉 bash 返回从右到左第一个以非0状态退出的管道命令的返回值，如果所有命令都成功执行时才返回0
set -o pipefail

CMDB_ROOT=$(cd $(dirname "${BASH_SOURCE}")/.. && pwd -P)
echo "CMDB_ROOT is $CMDB_ROOT"

# Sets:                    (e.g. for '1.2.3-alpha.4.56+abcdef12345678')
#   VERSION_MAJOR          (e.g. '1') 主版本
#   VERSION_MINOR          (e.g. '2') 次版本
#   VERSION_PATCH          (e.g. '3') 补丁版本
#   VERSION_PRERELEASE     (e.g. 'alpha')
#   VERSION_PRERELEASE_REV (e.g. '4')
#   VERSION_BUILD_INFO     (e.g. '.56+abcdef12345678')
#   VERSION_COMMITS        (e.g. '56')

#定义程序名称
APP_NAME=oneoaas-cmdb

#定义大版本号
VERSION_MAJOR=2

#定义次版本号
VERSION_MINOR=4

#定义小版本号
VERSION_PATCH=`date '+%Y%m%d-%H'`

#定义发布平台版本
LINUX_OS_VERSION=linux-2.6.32-504.el6.x86_64
MAC_OS_VERSION=darwin-16.1.0
WIN_OS_VERSION=win-10.0.14393

#定义发布包名称
RELEASE_LINUX_PACKAGE="${APP_NAME}.${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}.${LINUX_OS_VERSION}.tar.gz"
RELEASE_MAC_PACKAGE="${APP_NAME}.${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}.${MAC_OS_VERSION}.tar.gz"
RELEASE_WIN_PACKAGE="${APP_NAME}.${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}.${WIN_OS_VERSION}.tar.gz"

#本地目录
readonly LOCAL_OUTPUT_ROOT="${CMDB_ROOT}"

#根目录
readonly APP_ROOT="${CMDB_ROOT}"

#已发布目录
readonly RELEASE_DIR="${LOCAL_OUTPUT_ROOT}/release-tars"

#程序归档目录
readonly ARCHIVE_DIR="/opt"

#部署目录
readonly DEPLOY_DIR="/opt/oneoaas-cmdb/server_${VERSION_MAJOR}_${VERSION_MINOR}_${VERSION_PATCH}_release"


echo "APP_ROOT is $APP_ROOT"

#编译函数
function cmdb::build::run_build_command(){
    echo "go to build oneoaas_cmdb binary..."
    #安装go 依赖库文件
    #echo "install go dep lib"
    #go get github.com/google/go-querystring/query
    #go get github.com/StackExchange/wmi
    #go get github.com/pborman/uuid
    #go get github.com/shirou/w32
    #go get github.com/go-ole/go-ole/oleutil
    #go get github.com/go-ole/go-ole
    #构建cmdbserver 模块

    #构建二进制程序
    echo "go to build linux/amd64 oneoaas_cmdb binary..."
    gox -osarch="linux/amd64"
    #echo "go to build windows/amd64 oneoaas_cmdb binary..."
    #gox -osarch="windows/amd64"
    #echo "go to build darwin/amd64 oneoaas_cmdb binary..."
    #gox -osarch="darwin/amd64"
    #echo "build oneoaas_cmdb binary finish..."

    #构建二进制agent
    cd $APP_ROOT/cmdbserver/agent
    echo "go to build linux/amd64 oneoaas-agent binary..."
    gox -osarch="linux/amd64"
    #echo "go to build windows/amd64 oneoaas-agent binary..."
    #gox -osarch="windows/amd64"
    #echo "go to build darwin/amd64 oneoaas-agent binary..."
    #gox -osarch="darwin/amd64"
    #echo "build oneoaas-agent binary finish..."

    cd $APP_ROOT
}

#打包函数
function cmdb::release::package_tarballs_linux() {
  echo "package name is $1"
  # Clean out any old releases
  rm -rf "${RELEASE_DIR}"
  mkdir -p "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/conf      "${RELEASE_DIR}/oneoaas-cmdb"
  rm -rf "${RELEASE_DIR}/oneoaas-cmdb/conf/test"
  cp -rf $APP_ROOT/swagger          "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/static           "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/views            "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/start.sh         "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/stop.sh          "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/cmdb_linux_amd64     "${RELEASE_DIR}/oneoaas-cmdb/oneoaas-cmdb"
  cp -rf $APP_ROOT/cmdbserver/agent/agent_linux_amd64     "${RELEASE_DIR}/oneoaas-cmdb/oneoaas-agent"

  #拷贝初始化数据 sql 脚本
  cp -rf $APP_ROOT/db/V2.4.0_data.sql    "${RELEASE_DIR}/oneoaas-cmdb"

  #拷贝数据库定义 sql 脚本
  cp -rf $APP_ROOT/db/V2.4.0_schema.sql  "${RELEASE_DIR}/oneoaas-cmdb"

  #拷贝数据从2.1.0升级到2.2.0脚本
  cp -rf $APP_ROOT/db/upgrade            "${RELEASE_DIR}/oneoaas-cmdb"


  echo "release dir is ${RELEASE_DIR}"
  cd "${RELEASE_DIR}"
  tar -cvf $1 ./oneoaas-cmdb
  mv $1 "${ARCHIVE_DIR}"
}

#打包mac环境安装包
function cmdb::release::package_tarballs_mac() {
    echo "package name is $1"
    # Clean out any old releases
    rm -rf "${RELEASE_DIR}"
    mkdir -p "${RELEASE_DIR}/oneoaas-cmdb"
    cp -rf $APP_ROOT/conf      "${RELEASE_DIR}/oneoaas-cmdb"
    rm -rf "${RELEASE_DIR}/oneoaas-cmdb/conf/test"
    cp -rf $APP_ROOT/swagger          "${RELEASE_DIR}/oneoaas-cmdb"
    cp -rf $APP_ROOT/static           "${RELEASE_DIR}/oneoaas-cmdb"
    cp -rf $APP_ROOT/views            "${RELEASE_DIR}/oneoaas-cmdb"
    cp -rf $APP_ROOT/start.sh         "${RELEASE_DIR}/oneoaas-cmdb"
    cp -rf $APP_ROOT/stop.sh          "${RELEASE_DIR}/oneoaas-cmdb"
    cp -rf $APP_ROOT/cmdb_darwin_amd64   "${RELEASE_DIR}/oneoaas-cmdb/oneoaas-cmdb"
    cp -rf $APP_ROOT/cmdbserver/agent/agent_darwin_amd64     "${RELEASE_DIR}/oneoaas-cmdb/oneoaas-agent"

    #拷贝初始化数据 sql 脚本
    cp -rf $APP_ROOT/db/V2.4.0_data.sql    "${RELEASE_DIR}/oneoaas-cmdb"

    #拷贝数据库定义 sql 脚本
    cp -rf $APP_ROOT/db/V2.4.0_schema.sql  "${RELEASE_DIR}/oneoaas-cmdb"

    cp -rf $APP_ROOT/db/upgrade            "${RELEASE_DIR}/oneoaas-cmdb"

    echo "release dir is ${RELEASE_DIR}"
    cd "${RELEASE_DIR}"
    tar -cvf $1 ./oneoaas-cmdb
    mv $1 "${ARCHIVE_DIR}"
}

#打包win环境安装包
function cmdb::release::package_tarballs_win() {
  echo "package name is $1"
  # Clean out any old releases
  rm -rf "${RELEASE_DIR}"
  mkdir -p "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/conf      "${RELEASE_DIR}/oneoaas-cmdb"
  rm -rf "${RELEASE_DIR}/oneoaas-cmdb/conf/test"
  cp -rf $APP_ROOT/swagger          "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/static           "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/views            "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/start.sh         "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/stop.sh          "${RELEASE_DIR}/oneoaas-cmdb"
  cp -rf $APP_ROOT/cmdb_windows_amd64.exe   "${RELEASE_DIR}/oneoaas-cmdb/oneoaas-cmdb.exe"
  cp -rf $APP_ROOT/cmdbserver/agent/agent_windows_amd64.exe     "${RELEASE_DIR}/oneoaas-cmdb/oneoaas-agent.exe"
  #拷贝初始化数据 sql 脚本
  cp -rf $APP_ROOT/db/V2.4.0_data.sql    "${RELEASE_DIR}/oneoaas-cmdb"

  #拷贝数据库定义 sql 脚本
  cp -rf $APP_ROOT/db/V2.4.0_schema.sql  "${RELEASE_DIR}/oneoaas-cmdb"

  #拷贝数据从2.1.0升级到2.2.0脚本
  cp -rf $APP_ROOT/db/upgrade            "${RELEASE_DIR}/oneoaas-cmdb"

  echo "release dir is ${RELEASE_DIR}"
  cd "${RELEASE_DIR}"
  tar -cvf $1 ./oneoaas-cmdb
  mv $1 "${ARCHIVE_DIR}"
}

#部署函数
function cmdb::deploy() {
  echo "create deploy dir"

  #循环测试是否ping通
  for i in {1..3}; do
    ansible all -m ping -s
    if [ $? -eq 0 ]; then
         echo "ping  host success ...."
    else
         echo "ping host fail ...."
    fi
  done

  #删除目录
  ansible all -m file -s -a "path=$DEPLOY_DIR state=absent"
  if [ $? -eq 0 ]; then
          echo "delete dir file success ...."
  else
          echo "delete dir file fail ...."
  fi

  #创建目录
  ansible all -m file -s -a "path=$DEPLOY_DIR owner=root group=root mode=0755 state=directory"
  if [ $? -eq 0 ]; then
        echo "make dir file success ...."
  else
        echo "make dir file fail ...."
  fi


  #拷贝文件
  ansible all -m copy -s -a "src=$ARCHIVE_DIR/$RELEASE_LINUX_PACKAGE dest=$DEPLOY_DIR/$RELEASE_LINUX_PACKAGE"

  if [ $? -eq 0 ]; then
       echo "copy file success ...."
  else
       echo "copy file fail ...."
  fi

  #解压发布包加入-C 表示不带路径
  ansible all -m shell -s -a "tar -xvf $DEPLOY_DIR/$RELEASE_LINUX_PACKAGE -C $DEPLOY_DIR"
  if [ $? -eq 0 ]; then
         echo "tar file success ...."
  else
         echo "tar file fail ...."
  fi

  for i in {1..2}; do
      ansible all -m ping -s
      if [ $? -eq 0 ]; then
           echo "ping  host success ...."
      else
           echo "ping host fail ...."
      fi
  done

  #关闭oneoaas-cmdb
  ansible all -m shell -a "bash $DEPLOY_DIR/oneoaas-cmdb/stop.sh"
  if [ $? -eq 0 ]; then
           echo "stop $APP_NAME success ...."
  else
           echo "stop $APP_NAME fail ...."
  fi

  for i in {1..2}; do
      ansible all -m ping -s
      if [ $? -eq 0 ]; then
           echo "ping  host success ...."
      else
           echo "ping host fail ...."
      fi
  done

  #启动oneoaas-cmdb
  ansible all -m shell -a "bash $DEPLOY_DIR/oneoaas-cmdb/start.sh"
  if [ $? -eq 0 ]; then
         echo "start $APP_NAME success ...."
  else
         echo "start $APP_NAME fail ...."
  fi


}