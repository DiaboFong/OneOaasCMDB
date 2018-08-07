package client

import (
	"net"
	"net/http"
	"net/url"
	"time"
	"golang.org/x/net/http2"
	"oneoaas.com/cmdb/cmdbserver/agent/api"
)

var debug = false

type APIClient struct {
	Endpoint string
	Token    string
}

func APIClientEnableHTTPDebug() {
	debug = true
}

func (a APIClient) Create() *api.Client {
	httpTransport := &http.Transport{
		Proxy:              http.ProxyFromEnvironment,
		DisableKeepAlives:  false,
		DisableCompression: false,
		Dial: (&net.Dialer{
			Timeout:   30 * time.Second,
			KeepAlive: 30 * time.Second,
		}).Dial,
		TLSHandshakeTimeout: 30 * time.Second,
	}
	http2.ConfigureTransport(httpTransport)

	// Create the transport used when making the Cmdb Agent API calls
	transport := &api.AuthenticatedTransport{
		Token: a.Token,
		Transport: httpTransport,
	}

	// From the transport, create the a http client
	httpClient := transport.Client()
	httpClient.Timeout = 60 * time.Second

	//创建agent 客户端请求对象
	client := api.NewClient(httpClient)
	//设置自定义的uri
	client.BaseURL, _ = url.Parse(a.Endpoint)
	client.DebugHTTP = debug

	return client
}

func (a APIClient) UserAgent() string {
	return ""
}
