#!/bin/sh

docker run -d --name redmine -p 3000:3000 -v /opt/redmine/volume:/usr/src/redmine/files --link redmine-mysql:mysql redmine:4
