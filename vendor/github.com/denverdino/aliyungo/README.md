# AliyunGo: Go SDK for Aliyun Services

This is an unofficial Go SDK for Aliyun Services


## Package Structure

*  ecs: [Elastic Compute Service](https://help.aliyun.com/document_detail/ecs/open-api/summary.html)
*  oss: [Open Storage Service](https://help.aliyun.com/document_detail/oss/api-reference/abstract.html)
*  slb: [Server Load Balancer](https://help.aliyun.com/document_detail/slb/api-reference/brief-introduction.html)
*  dns: [DNS](https://help.aliyun.com/document_detail/dns/api-reference/summary.html)
*  sls: [SLS](https://help.aliyun.com/document_detail/sls/api/overview.html)
*  ram: [RAM](https://help.aliyun.com/document_detail/ram/ram-api-reference/intro/intro.html)
*  common: Common libary of Aliyun Go SDK
*  util: Utility helpers



## Quick Start

```go
package main

import (
	"fmt"

	"github.com/denverdino/aliyungo/ecs"
)

const ACCESS_KEY_ID = "<YOUR_ID>"
const ACCESS_KEY_SECRET = "<****>"

func main() {
	client := ecs.NewClient(ACCESS_KEY_ID, ACCESS_KEY_SECRET)
	fmt.Print(client.DescribeRegions())
}

```

## Documentation

  *  ECS: [https://godoc.org/github.com/denverdino/aliyungo/ecs](https://godoc.org/github.com/denverdino/aliyungo/ecs) [![GoDoc](https://godoc.org/github.com/denverdino/aliyungo/ecs?status.svg)](https://godoc.org/github.com/denverdino/aliyungo/ecs)
  *  OSS: [https://godoc.org/github.com/denverdino/aliyungo/oss](https://godoc.org/github.com/denverdino/aliyungo/oss) [![GoDoc](https://godoc.org/github.com/denverdino/aliyungo/oss?status.svg)](https://godoc.org/github.com/denverdino/aliyungo/oss)
  *  SLB: [https://godoc.org/github.com/denverdino/aliyungo/slb](https://godoc.org/github.com/denverdino/aliyungo/slb) [![GoDoc](https://godoc.org/github.com/denverdino/aliyungo/slb?status.svg)](https://godoc.org/github.com/denverdino/aliyungo/slb)
  *  DNS: [https://godoc.org/github.com/denverdino/aliyungo/dns](https://godoc.org/github.com/denverdino/aliyungo/dns) [![GoDoc](https://godoc.org/github.com/denverdino/aliyungo/dns?status.svg)](https://godoc.org/github.com/denverdino/aliyungo/dns)


## Build and Install

go get:

```sh
go get github.com/denverdino/aliyungo
```


## Test ECS

Modify "ecs/config_test.go" 

```sh
	TestAccessKeyId     = "MY_ACCESS_KEY_ID"
	TestAccessKeySecret = "MY_ACCESS_KEY_ID"
	TestInstanceId      = "MY_INSTANCE_ID"
	TestIAmRich         = false
```

*  TestAccessKeyId: the Access Key Id
*  TestAccessKeySecret: the Access Key Secret.
*  TestInstanceId: the existing instance id for testing. It will be stopped and restarted during testing.
*  TestIAmRich(Optional): If it is set to true, it will perform tests to create virtual machines and disks under your account. And you will pay the bill. :-)

Under "ecs" and run

```sh
go test
```

## Test OSS

Modify "oss/config_test.go" 

```sh
	TestAccessKeyId     = "MY_ACCESS_KEY_ID"
	TestAccessKeySecret = "MY_ACCESS_KEY_ID"
	TestRegion          = oss.Beijing
	TestBucket          = "denverdino"
```

*  TestAccessKeyId: the Access Key Id
*  TestAccessKeySecret: the Access Key Secret.
*  TestRegion: the region of OSS for testing
*  TestBucket: the bucket name for testing


Under "oss" and run

```sh
go test
```

## Contributors

  * Li Yi (denverdino@gmail.com)
  * tgic (farmer1992@gmail.com)
  * Yu Zhou (oscarrr110@gmail.com)
  * Yufei Zhang
  * linuxlikerqq
  * Changhai Yan (changhai.ych@alibaba-inc.com)
  * Jizhong Jiang (jiangjizhong@gmail.com)

## License
This project is licensed under the Apache License, Version 2.0. See [LICENSE](https://github.com/denverdino/aliyungo/blob/master/LICENSE.txt) for the full license text.


## Related projects

  * Aliyun ECS driver for Docker Machine: [Pull request](https://github.com/docker/machine/pull/1182)

  * Aliyun OSS driver for Docker Registry V2: [Pull request](https://github.com/docker/distribution/pull/514)


## References

The GO API design of OSS refer the implementation from [https://github.com/AdRoll/goamz](https://github.com/AdRoll)
