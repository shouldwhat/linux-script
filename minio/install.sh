#!/bin/sh

# 
# This Script work CentOS 7
#
# https://docs.min.io/
#


ROOT_DIR=$1
AUTH_ID={$2:=shouldwhat}
AUTH_PW={$3:=shouldwhat}

# Step.1) Install docker
#../install/install_docker.sh

# Step.2) Create Group & User
groupadd minio
useradd minio -g minio

# Step.3) Start minio service
docker run -d -p 9000:9000 \
        -v $ROOT_DIR:/data \
        -e MINIO_USERNAME=minio \
        -e MINIO_GROUPNAME=minio \
        -e MINIO_ACCESS_KEY=$AUTH_ID \
        -e MINIO_SECRET_KEY=$AUTH_PW \
        --name minio \
        --restart=always \
        minio/minio server /data
