package controllers

import m "oneoaas.com/cmdb/models"

func (this *DnspodtokenController) AddDnspodtoken() {
	var dnspodtoken m.Dnspodtoken
	dnspodtoken.Id, _ = this.GetInt64("id", 0)
	dnspodtoken.Token = this.GetString("token")
	//fmt.Println(dnspodtoken.Id)
	//fmt.Println(len(dnspodtoken.Token))
	//if dnspodtoken.Id == 0 || len(dnspodtoken.Token) != 31 {
	//	this.ResponseErrorJSON(400, "参数非法")
	//}
	id, err := m.AddDnspodtoken(dnspodtoken)
	if err != nil {
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = id
	}
	this.ServeJSON()
}

func (c *DnspodtokenController) GetDnspodtoken() {

	err := m.GetDnspodtoken()
	if err != nil {
		c.Data["json"] = err.Error()
	} else {
		c.Data["json"] = "ok"
	}
	c.ServeJSON()
}

func (this *DnspodtokenController) DelDnspodtoken() {
	Appid, _ := this.GetInt64("Appid", 0)
	//fmt.Println(Appid)
	err := m.DelApp(Appid)
	if err != nil {
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = err
	}
	this.ServeJSON()
}

func (this *DnspodtokenController) PutDnspodtoken() {
	var dnspodtoken m.Dnspodtoken
	dnspodtoken.Id, _ = this.GetInt64("id", 0)
	dnspodtoken.Token = this.GetString("token")
	id, err := m.AddDnspodtoken(dnspodtoken)
	if err == nil {
		this.Data["json"] = id
	} else {
		this.Data["json"] = err.Error()
	}
	this.ServeJSON()
}

//
func (this *DnspodtokenController) Fnish() {

}
