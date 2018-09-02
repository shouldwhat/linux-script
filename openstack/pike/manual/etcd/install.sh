#!/bin/sh

function install_packages {
        yum install etcd -y
}

function enable_service {
        systemctl enable etcd
        systemctl start etcd
}

install_packages
enable_service
