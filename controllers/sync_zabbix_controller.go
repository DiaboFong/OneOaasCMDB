package controllers

import (
	"github.com/astaxie/beego"
	z "oneoaas.com/cmdb/zabbix"
)

func (this *SyncZabbixController)SyncZabbixRemoteToLocal() {
	sync := z.FetchHostByZabbix()
	if sync {
		beego.Info("从zabbix同步host到本地,成功")
	} else {
		beego.Info("从zabbix同步host到本地,失败")
	}

}
