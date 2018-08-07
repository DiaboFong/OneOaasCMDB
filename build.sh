#!/bin/bash

GOPATH=/root/.jenkins/workspace
GOSRC_DIR=/root/.jenkins/workspace/src
PROJECT_DIR=oneoaas.com
PROJECT_PACKAGE=cmdb

echo "step1 working current is :" `pwd`

if [ ! -d $GOSRC_DIR ]; then
  echo "$GOSRC_DIR not have ...."
  mkdir -p $GOSRC_DIR
else
  echo "$GOSRC_DIR is have ...."
  rm -rf $GOSRC_DIR
  mkdir -p $GOSRC_DIR
fi

echo "step2 going workspace dir "
cd $GOPATH

echo "step3 mv $PROJECT_DIR  to $GOSRC_DIR"
mv $PROJECT_DIR $GOSRC_DIR

echo "step4 working current is $GOSRC_DIR/$PROJECT_DIR/$PROJECT_PACKAGE "
cd $GOSRC_DIR/$PROJECT_DIR/$PROJECT_PACKAGE

echo "step5 start building ....."
make release
echo "step6 finish building ....."
make clean
echo "step7 clean cmdb dir  ....."