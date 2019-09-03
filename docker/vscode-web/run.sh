#!/bin/sh

#
# https://github.com/cdr/code-server
#

SERVICE_PORT=8443

docker run -it -p $SERVICE_PORT:8443 -v "${PWD}:/home/coder/project" codercom/code-server --allow-http --no-auth


