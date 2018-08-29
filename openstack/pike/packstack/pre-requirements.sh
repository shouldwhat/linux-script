#!/bin/bash

# firewalld stop & disable
systemctl stop firewalld
systemctl disable firewalld
echo -e
sleep 1

# NetworkManager stop & disable
# NetworkManager service off
systemctl stop NetworkManager
systemctl disable NetworkManager
echo -e
sleep 1

# network start & enable
# network service on
systemctl enable network
systemctl start network
echo -e
sleep 1

# ntp start & enable
systemctl enable ntpd
systemctl start ntpd
echo -e
sleep 1

# selinux setting 'enforcing -> disable'
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
sleep 1

# install openstack pike packages
yum install -y centos-release-openstack-pike
sleep 1

# update 
yum update -y
sleep 1

# install openstack packstack
yum install -y openstack-packstack

echo -e
echo -e
echo -e ">>> next step is your turn."
echo -e ">>> input below command."
echo -e 
echo -e ">>> # packstack --gen-answer-file=/root/answer.txt"
echo -e
echo -e ">>> you should to update follow configuration values at 'answer.txt' file."
echo -e ">>> CONFIG_COMPUTE_HOSTS=COMPUTE_HOST_IP"
echo -e ">>> CONFIG_NEUTRON_OVS_BRIDGE_MAPPINGS=extnet:br-ex"
echo -e ">>> CONFIG_NEUTRON_OVS_BRIDGE_IFACES=br-ex:eth0"
echo -e ">>> CONFIG_PROVISION_DEMO=n"
echo -e
echo -e ">>> # packstack --answer-file=/root/answers.txt"
echo -e
