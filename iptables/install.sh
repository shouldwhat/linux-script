#/bin/sh

#
# This script works at 'CentOS 7 or higher' only.
#

echo -e
echo "[Step.1] Disable firewalld service"
echo -e
systemctl stop firewalld
systemctl mask firewalld


echo -e
echo "[Step.2] Install iptable service"
yum install iptables-service -y


echo -e
echo "[Step.3] Enable iptable service"
systemctl enable iptables


echo -e
echo "[Step.4] Start iptable service"
systemctl start iptables
