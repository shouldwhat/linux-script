#
# http://www.keepalived.org/
# http://www.keepalived.org/doc/
#

KEEPALIVED=keepalived-1.4.2
TAR_NAME=$KEEPALIVED.tar.gz
DOWNLOAD_URL=http://keepalived.org/software/$TAR_NAME

#
# [Step.1] Dependency libraries
#
#yum install -y gcc openssl-devel libnl3-devel ipset-devel iptables-devel libnfnetlink-devel net-snmp-devel glib2-devel json-c-devel

#
# [Step.2] Download Keepalived
#
wget $DOWNLOAD_URL

#
# [Step.3] Build & Install
#
tar -xvf $TAR_NAME
cd $KEEPALIVED

./configure
make
make install

echo -e
echo -e
echo "* Default config file path : /etc/keepalived"
echo "* Default config file name : keepalived.conf"
echo "* You should make 'keepalived.conf' file referece to 'keepalived.conf.sample'"
echo -e
