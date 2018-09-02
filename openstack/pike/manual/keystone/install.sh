#!/bin/sh

DB_USER=root
DB_USER_PW=123123
DB_KEYSTONE_PW=123123

function install_database_schema {
	
	SQL_EXECUTE_COMMAND="mysql --user=$DB_USER --password=$DB_USER_PW"

	echo "CREATE DATABASE IF NOT EXISTS keystone;" | $SQL_EXECUTE_COMMAND
	echo "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY '$DB_KEYSTONE_PW';" | $SQL_EXECUTE_COMMAND
	echo "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY '$DB_KEYSTONE_PW'" | $SQL_EXECUTE_COMMAND
}

function install_packages {
        yum install openstack-keystone httpd mod_wsgi -y
}



install_database_schema
install_packages

