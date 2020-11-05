#!/bin/sh
#
# https://github.com/sktelecom-oslab/taco-scripts/blob/master/040-deploy-openstack.sh
#

EXIP=$(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $7}')
EXGW=$(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $3}')
EXNIC=$(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $5}')

echo $EXIP
echo $EXGW
echo $EXNIC