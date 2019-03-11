#!/bin/sh
#
# This script operate for Ubuntu 18.04
# 
# https://redis.io/download
# http://download.redis.io/releases/
# https://github.com/antirez/redis
# https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_expect
# 

# Define Dynamic Variables
REDIS_VERSION=5.0.3
REDIS_HOME=/root/Downloads/redis
REDIS_SERVICE_PORT=6379


# Define Static Variables
REDIS=redis-$REDIS_VERSION
REDIS_DATA_PATH=$REDIS_HOME/data
REDIS_LOGS_PATH=$REDIS_HOME/logs
REDIS_SRC_PATH=$REDIS_HOME/src
REDIS_CONF_PATH=$REDIS_HOME/conf


# Dependencies Lib
apt install -y expect gcc make


# Preparing
mkdir -p $REDIS_CONF_PATH
mkdir -p $REDIS_DATA_PATH
mkdir -p $REDIS_LOGS_PATH
mkdir -p $REDIS_SRC_PATH


# Download & Build
wget -c "http://download.redis.io/releases/$REDIS.tar.gz" -O - | tar -xz -C $REDIS_SRC_PATH
cd $REDIS_SRC_PATH/$REDIS

make MALLOC=libc


# Configuration
CONFIGURATION_CMD=$(expect -c "
set timeout 1
spawn $REDIS_SRC_PATH/$REDIS/utils/install_server.sh
expect \"Please select the redis port for this instance:\"
send \"$REDIS_SERVICE_PORT\r\"
expect \"Please select the redis config file name\"
send \"$REDIS_CONF_PATH/$REDIS_SERVICE_PORT.conf\r\"
expect \"Please select the redis log file name\"
send \"$REDIS_LOGS_PATH/redis_$REDIS_SERVICE_PORT.log\r\"
expect \"Please select the data directory for this instance\"
send \"$REDIS_DATA_PATH/$REDIS_SERVICE_PORT/\r\"
expect \"Please select the redis executable path\"
send \"$REDIS_SRC_PATH/$REDIS/src/redis-server\r\"
expect \"Is this ok?\"
send \"\r\"
expect eof
")

echo "$CONFIGURATION_CMD"
