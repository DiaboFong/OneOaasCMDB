#!/bin/bash
#自动发布脚本处理

#set -o errexit
set -o nounset
set -o pipefail


CMDB_ROOT=$(dirname "${BASH_SOURCE}")/..

echo $CMDB_ROOT

source "$CMDB_ROOT/build/common.sh"

#授权执行权限
chmod +x "$CMDB_ROOT/build/deploy.sh"

cd $CMDB_ROOT

cmdb::build::run_build_command

cmdb::release::package_tarballs_linux $RELEASE_LINUX_PACKAGE
#cmdb::release::package_tarballs_mac $RELEASE_MAC_PACKAGE
#cmdb::release::package_tarballs_win $RELEASE_WIN_PACKAGE
