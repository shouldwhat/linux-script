#
# https://redis.io/topics/cluster-tutorial
# http://blog.leekyoungil.com/?p=206
#

DEPEDENCY_PACKAGES=(rubygem ruby-devel)

REDIS_CLUSTER_MANAGE_SCRIPT=/root/~~~~/redis-trib.rb
REDIS_CLUSTER_HOSTS=192.168.121.68:6379 192.168.121.69:6379 192.168.121.68:6389 192.168.121.69:6389
REDIS_CLUSTER_REPLICASE=1
REDIS_CLUSTER_CREATION_CMD=$REDIS_CLUSTER_MANAGE_SCRIPT create --replicas $REDIS_CLUSTER_REPLICASE $REDIS_CLUSTER_HOSTS


function install_dependencies {
	# yum installing...
	for package in "${DEPEDENCY_PACKAGES[@]}"
	do
		#echo $package
		yum install -y $package
	done
}

function install_rubygems {
	gem install rubygems-update
	update_rubygems
}

function install_redisgem {
	gem install redis -v 3.3.5
}

function create_redis_cluster {
	exec $REDIS_CLUSTER_CREATION_CMD
}


install_dependencies

install_rubygems

install_redisgem

create_redis_cluster
