# Copyright 2016 The OneOaaS Authors All rights reserved.
OUT_DIR = oneoaas-cmdb

release:
	build/release.sh
.PHONY: release

deploy:
	build/deploy.sh
.PHONY: deploy

clean:
	rm -rf $(OUT_DIR)
.PHONY: clean

image:
	docker build -t "oneoaas:cmdb" .
.PHONY: image



