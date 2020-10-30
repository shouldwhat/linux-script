#!/bin/sh


#
# https://github.com/shouldwhat/linux-script/tree/master/docker/vscode-web
#

rm -rf /usr/local/bin/codeweb

echo '#!/bin/sh

# input args
INPUT_SERVICE_PORT=$2
INPUT_DIRECTORY_PATH=$1


# set run args
SERVICE_IP=`hostname -I | awk "{ print $1 }"`
SERVICE_PORT=${INPUT_SERVICE_PORT:=8080}
WORK_DIRECTORY=${INPUT_DIRECTORY_PATH:=$PWD}

if [ $INPUT_DIRECTORY_PATH = "stop" ]
then
   docker stop code-server
   docker container prune
   exit 0
fi


# check input args
echo -e
echo -e ">>> port     : $SERVICE_PORT"
echo -e ">>> directory: $WORK_DIRECTORY"
echo -e ">>> ip : $SERVICE_IP"


# run
docker run -itd --name code-server -p $SERVICE_PORT:8080 \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$WORK_DIRECTORY:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  codercom/code-server:latest \
  --auth none
 '> /usr/local/bin/codeweb

chmod 755 /usr/local/bin/codeweb
