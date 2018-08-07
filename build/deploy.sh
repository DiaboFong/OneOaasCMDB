#!/bin/bash
#自动部署脚本处理

#set -o errexit  #当一个命令执行失败时，shell会立即退出
set -o nounset  #当shell要扩展一个还未设置过值的变量时，shell必须输出信息到stderr，然后立即退出。但是交互式shell不应该退出。
set -o pipefail #表示在管道连接的命令序列中，只要有任何一个命令返回非0值，则整个管道返回非0值，即使最后一个命令返回0


CMDB_ROOT=$(dirname "${BASH_SOURCE}")/..

echo $CMDB_ROOT

source "$CMDB_ROOT/build/common.sh"

cd $CMDB_ROOT

cmdb::deploy