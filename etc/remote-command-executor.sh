#!/bin/sh

REMOTE_SERVER_IP=$1
EXEC_COMMAND=$2

REMOTE_EXEC_COMMAND="ssh $REMOTE_SERVER_IP $EXEC_COMMAND"

echo -e
echo "============================================================================================================================"
echo "-. remote server : " $REMOTE_SERVER_IP
echo "-. exec command : " $EXEC_COMMAND
echo "============================================================================================================================"

$REMOTE_EXEC_COMMAND

echo -e
