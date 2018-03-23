#/bin/sh

HAPROXY=haproxy-1.7.10
TAR_NAME=$HAPROXY.tar.gz
DOWNLOAD_URL=http://www.haproxy.org/download/1.7/src/$TAR_NAME

#
# [Step.1] Dependency libraries
#
#yum install -y wget gcc pcre-static pcre-devel

#
# [Step.2] Download haproxy
#
#wget $DOWNLOAD_URL

#
# [Step.3] Build & Install
#
tar -xvf $TAR_NAME
cd $HAPROXY

make TARGET=linux2628
make install

#
# [Step.4] Config
#
cd contrib/systemd
make
chmod 755 haproxy.service
cp -f haproxy.service /lib/systemd/system/

mkdir -p /etc/haproxy
mkdir -p /run/haproxy
mkdir -p /var/lib/haproxy
touch /var/lib/haproxy/stats

useradd -r haproxy

#
# [Step.5] Enable service
#
systemctl daemon-reload
systemctl enable haproxy
systemctl start haproxy
systemctl status haproxy

