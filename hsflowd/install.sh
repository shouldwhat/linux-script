#
# https://github.com/sflow/host-sflow.git
#

# [Step.1] Install git
yum install -y git libnfnetlink-devel libpcap-devel libxml2-devel libvirt-devel dbus-devel openssl-devel dbus-devel

# [Step.2] Download 'hsflowd' source
git clone https://github.com/sflow/host-sflow.git

# [Step.3] Build & Install
cd host-sflow

# 'INSTALL.Linux' 참조
make FEATURES="HOST"
make install

#systemctl enable hsflowd
systemctl status hsflowd

echo -e
echo -e
echo "*. conf file : /etc/hsflowd.conf"
echo -e
