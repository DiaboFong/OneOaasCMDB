#!/bin/bash
#变更数据库操作

echo -n "请输入数据库变更操作命令:"
read cmd
case $cmd in
	migrate)
		echo "您输入的参数是$cmd"
		bee migrate -conn="root:oneoaas@2A@tcp(10.0.2.47:3306)/oneoaas_cmdb_3"
	;;

	rollback)
		echo "您输入的参数是$cmd"
		bee migrate rollback -conn="root:oneoaas@2A@tcp(10.0.2.47:3306)/oneoaas_cmdb_3"
	;;

	reset)
		echo "您输入的参数是$cmd"
		bee migrate reset -conn="root:oneoaas@2A@tcp(10.0.2.47:3306)/oneoaas_cmdb_3"
	;;

	refresh)
        echo "您输入的参数是$cmd"
        #刷新重新执行所有migration
        bee migrate refresh -conn="root:oneoaas@2A@tcp(10.0.2.47:3306)/oneoaas_cmdb_3"
    ;;

	*)
		echo "您应该输入参数为(migrate|rollback|reset|refresh)其中的一种"
	;;

esac