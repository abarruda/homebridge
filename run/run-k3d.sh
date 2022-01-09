#!/bin/bash

# WARNING: homebridge cannot run on Mac (https://github.com/oznu/docker-homebridge#compatibility)
# so this script is of limited use.  See ./run-test-rpi.sh instead.

set -e

helm lint $(pwd)/../.

# docker pull oznu/homebridge:2021-12-19-debian-arm32v7

k3d cluster create --config k3d.yaml --k3s-server-arg '--no-deploy=traefik' || true
# k3d image import oznu/homebridge:2021-12-19-debian-arm32v7 -c homebridge-cluster

helm upgrade --install \
--namespace homebridge --create-namespace \
homebridge \
--debug \
--set image.digest=oznu/homebridge:debian-arm32v7 \
--set replicaCount=1 \
--set ports.ui.number=80 \
--set ports.service.number=18083 \
../.

#k3d cluster delete homebridge-cluster