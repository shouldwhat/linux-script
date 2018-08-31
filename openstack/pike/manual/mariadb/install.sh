#!/bin/sh

function install_packages {
	yum install mariadb mariadb-server python2-PyMySQL -y
}

function enable_service {
	systemctl enable mariadb.service
	systemctl start mariadb.service
}

function configure_service {
	mysql_secure_installation
}

install_packages
enable_service
configure_service
