#
# http://download.redis.io
#

REDIS=redis-4.0.11
REDIS_TAR=$REDIS.tar.gz
DOWNLOAD_URL=http://download.redis.io/releases/$REDIS_TAR
DEPEDENCY_PACKAGES=(tcl pidof wget gcc)

function install_dependencies {
	for package in "${DEPEDENCY_PACKAGES[@]}"
	do
		#echo $package
		yum install -y $package
	done
}

function download_redis {
	wget $DOWNLOAD_URL
}

function build_redis_source {
	tar -xvf $REDIS_TAR
	cd $REDIS

	make distclean
	make
	make test
}

function configure_redis {
	cd utils
	exec install_server.sh
}

function enable_redis_service {
	chkconfig --add redis_6379
	systemctl status redis_6379
}

function print_result {
	echo -e
	echo -e
	echo "conf file : /etc/redis/redis_6379.conf"
	echo -e
	echo -e
}

# [Step.1] Install Dependencies
install_dependencies

# [Step.2] Download
#download_redis

# [Step.3] Build
#build_redis_source

# [Step.4] Configure
#configure_redis

# [Step.5] Enable Service
#enable_redis_service

# [Step.6]
#print_result
