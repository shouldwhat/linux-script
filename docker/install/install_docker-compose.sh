#
# Ref. https://docs.docker.com/compose/install/#install-compose
# This script work on CentOS 7
#

sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
