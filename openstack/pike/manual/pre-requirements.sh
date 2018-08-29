#!/bin/sh

HOSTNAME=controller
ROOT_USER_PASSWORD=input_your_password_here

OPENSTACK_HOSTS=(192.168.121.55 192.168.121.56)
OPENSTACK_HOSTS_NAMES=(controller compute)

# if empty string this variables, set to hostname of google ntp
NTP_HOSTNAME=


function set_hostname {
	if [ "$1" = "" ]
        then
		hostnamectl set-hostname $HOSTNAME
        else
		hostnamectl set-hostname $1
        fi
}
function set_ssh_passwordless {
	
	# INSTALL 'sshpass'
	yum install -y sshpass
	ssh-keygen
	
	# IP
	for os_host in "${OPENSTACK_HOST[@]}"
	do
		echo $os_host
		sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no root@$os_host
	done

	# HOSTNAME
	for os_hostname in "${OPENSTACK_HOSTS_NAMES[@]}"
	do
		echo $os_hostname
		sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no root@$os_hostname
	done
}
function set_selinux {
	sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
}
function set_ntp {
	
	# INSTALL 'chrony'
	yum install -y chrony
	if [ -e /etc/chrony.conf  ]
	then
		rm -rf /etc/chrony.conf
	fi
	touch /etc/chrony.conf

	# CONFIGURE
	if [ "$1" = "" ]
	then
		echo "server time.google.com iburst" >> /etc/chrony.conf
		echo "allow 0.0.0.0/0" >> /etc/chrony.conf
	else
		echo "server controller iburst" >> /etc/chrony.conf
	fi

	# ENABLE SERVICE
	systemctl enable chronyd.service
	systemctl restart chronyd.service

	# VERIFY
	chronyc sources
}

# setting ip

# setting hosts

# setting hostname
set_hostname $HOSTNAME

# setting passwordless-ssh-auth
set_ssh_passwordless $ROOT_USER_PASSWORD $OPENSTACK_HOST

# setting selinux
set_selinux

# setting ntp
set_ntp $NTP_HOSTNAME
