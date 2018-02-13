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

chkconfig network on
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

# install openstack repositories
yum install -y https://rdoproject.org/repos/rdo-release.rpm

# install openstack ocata
yum install -y centos-release-openstack-ocata
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
