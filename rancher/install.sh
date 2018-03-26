#
# https://rancher.com/quick-start/
#

#
# [Step.1] Install
#
docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:stable
