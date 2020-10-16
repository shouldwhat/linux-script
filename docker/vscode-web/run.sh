#!/bin/sh

#
# https://github.com/cdr/code-server/blob/v3.6.0/doc/install.md#docker
#

SERVICE_PORT=8443

mkdir -p ~/.config
docker run -it --name code-server -p $SERVICE_PORT:8080 \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  codercom/code-server:latest \
  --auth none
