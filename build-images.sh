#!/bin/bash

#MODULE=$1

TIME=`date "+%Y%m%d%H%M"`

GIT_REVISION=`git log -1 --pretty=format:"%h"`

#IMAGE_NAME=hub.mooc.com:8080/micro-service/${MODULE}:${TIME}_${GIT_REVI SION}
IMAGE_NAME="test-jenkins:${TIME}_${GIT_REVISION}"

docker build -t "${IMAGE_NAME}" .
#cd -

#docker push ${IMAGE_NAME}
echo "${IMAGE_NAME}" > IMAGE_NAME