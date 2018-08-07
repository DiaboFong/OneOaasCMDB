#!/bin/bash
str="oneoaas-cmdb"
ps aux | grep "$str" | grep -v "grep " | sed "s/^[^ ]\+ \+//g" | sed "s/ .*//g" | xargs kill -9 2>/dev/null