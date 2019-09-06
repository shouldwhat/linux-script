#!/bin/sh
#
# THIS SCRIPT IS SUCCESSFULY WORK AT UBUNTU 18.04
#
# https://k3s.io/
#

curl -sfL https://get.k3s.io | sh -
sudo chown ubuntu:ubuntu /etc/rancher/k3s/k3s.yaml

kubectl get all
