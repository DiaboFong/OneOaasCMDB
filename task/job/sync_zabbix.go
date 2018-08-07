package job

import (
	"github.com/astaxie/beego"
	"github.com/jasonlvhit/gocron"
	z "oneoaas.com/cmdb/zabbix"
)

func SyncRemoteToLocal() {
	sync := z.FetchHostByZabbix()
	if sync {
		beego.Info("从zabbix同步host到本地,成功")
	} else {
		beego.Info("从zabbix同步host到本地,失败")
	}

}

func SyncLocalToRemote() {
	z.FetchHostByZabbix()
}

func SyncZabbix() {
	s := gocron.NewScheduler()
	iTimeInterval, err := beego.AppConfig.Int64("ZbxSyncTimeInterval")
	if err != nil{
		panic(err)
	}
	if iTimeInterval <= 0 {
		iTimeInterval = int64(60)
	}
	s.Every(uint64(iTimeInterval)).Seconds().Do(SyncRemoteToLocal)
	<-s.Start()
}
