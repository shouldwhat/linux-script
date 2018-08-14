#!/bin/sh

SOURCES=$1

REMOTE_SERVER_IP=$2
REMOTE_SERVER_DEPLOYE_DIR_PATH=$3

SCP_EXEC_COMMAND="scp -r $SOURCES root@$REMOTE_SERVER_IP:$REMOTE_SERVER_DEPLOYE_DIR_PATH/"

echo -e
echo -e
echo "============================================================================================================================"
echo "*. sources :" $SOURCES
echo "*. remote server :" $REMOTE_SERVER_IP
echo "*. remote dir :" $REMOTE_SERVER_DEPLOYE_DIR_PATH
echo "*. exec command :" $SCP_EXEC_COMMAND
echo "============================================================================================================================"
echo -e

$SCP_EXEC_COMMAND

