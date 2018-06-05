#!/bin/sh

# [Step.1] Download Grafana Package
#wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.1.3-1.x86_64.rpm


# [Step.2] Install Grafana
#yum localinstall -y grafana-5.1.3-1.x86_64.rpm


# [Step.2] Enable Service
#systemctl enable grafana-server
#systemctl start grafana-server
#systemctl status grafana-server


# [Step.3] Enable Service-Port
#firewall-cmd --permanent --zone=public --add-port=3000/tcp
#firewall-cmd --reload


echo -e
echo "*************************************"
echo "grafana url : localhost:3000"
echo "      admin : admin"
echo "   password : admin"
echo "*************************************"
echo -e
