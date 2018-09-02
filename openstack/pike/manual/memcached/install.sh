#!/bin/sh

function install_packages {
        yum install memcached python-memcached -y
}

function enable_service {
        systemctl enable memcached.service
        systemctl start memcached.service
}

install_packages
enable_service
