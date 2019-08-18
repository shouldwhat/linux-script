#!/bin/sh

docker run -d --name redmine-mysql \
	-v /opt/redmine/mysql:/var/lib/mysql \
	-e MYSQL_USER=redmine \
	-e MYSQL_PASSWORD=secret \
	-e MYSQL_DATABASE=redmine \
	-e MYSQL_RANDOM_ROOT_PASSWORD=1 \
	mysql:5.7 \
	--character-set-server=utf8 \
	--collation-server=utf8_bin
