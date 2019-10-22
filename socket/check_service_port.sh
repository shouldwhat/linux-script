#!/bin/bash


# define arguments
DST_IP=$1
DST_PORT=$2


# exec check command
echo > /dev/tcp/$1/$2


# extract result
RESULT_CODE=$(echo $?)


# parse result
if [ $RESULT_CODE -eq 0  ]
then
	echo "success"
else
	echo "fail to service access"
fi

