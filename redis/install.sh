#
# http://download.redis.io
#

REDIS=redis-4.0.9
REDIS_TAR=$REDIS.tar.gz
DOWNLOAD_URL=http://download.redis.io/releases/$REDIS_TAR

# [Step.0] Pre-Required
yum install -y tcl pidof

# [Step.1] Download Redis
wget $DOWNLOAD_URL

# [Step.2] Build & Install
tar -xvf $REDIS_TAR
cd $REDIS

make distclean
make
make test

# [Step.3] Configure
cd utils

exec install_server.sh

# [Step.4] Enable systemctl
chkconfig --add redis_6379
systemctl status redis_6379

echo -e
echo -e
echo "conf file : /etc/redis/redis_6379.conf"
echo -e
echo -e
