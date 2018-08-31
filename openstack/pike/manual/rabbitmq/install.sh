#!/bin/sh

RABBIT_USER=openstack
RABBIT_PASS=123123

function install_packages {
	yum install rabbitmq-server -y
}

function enable_service {
        systemctl enable rabbitmq-server.service
        systemctl start rabbitmq-server.service
}

function configure_service {
	echo "    user : $RABBIT_USER"
	echo "password : $RABBIT_PASS"
	rabbitmqctl add_user $RABBIT_USER $RABBIT_PASS
	rabbitmqctl set_permissions $RABBIT_USER ".*" ".*" ".*"
}

install_packages
enable_service
configure_service
