#!/bin/bash

set -e

PACKAGE_FILE=config/test-package.json
CONFIG_FILE=config/test-config.json

helm lint $(pwd)/../.
python -mjson.tool ../${PACKAGE_FILE}
python -mjson.tool ../${CONFIG_FILE}

helm upgrade --install \
--namespace test-homebridge --create-namespace \
test-homebridge \
--debug \
--set image.digest=oznu/homebridge:2021-12-19-debian-arm32v7 \
--set affinity.label=network \
--set affinity.value={mbit} \
--set replicaCount=1 \
--set ports.service.number=12345 \
--set config.configFile.enabled=false \
--set config.configFile.path=${CONFIG_FILE} \
--set config.packageFile.path=${PACKAGE_FILE} \
--set environment.packages="ffmpeg\,netcat" \
../.