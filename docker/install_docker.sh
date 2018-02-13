#!/bin/sh

# https://docs.docker.com/install/linux/docker-ce/centos/#install-docker-ce-1
REPO_URL=https://download.docker.com/linux/centos/docker-ce.repo

# set up
yum install -y yum-utils device-mapper-persistent-data lvm2
sleep 1

yum-config-manager --add-repo $REPO_URL
sleep 1

# install
yum install docker-ce
