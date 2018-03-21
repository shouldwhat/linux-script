
PROVIDER=libvirt

# [Step.1] Download Vagrantfile At 'Vagrant Cloud' : https://app.vagrantup.com
vagrant init centos/7

# [Step.2] Install
vagrant up --provider=$PROVIDER
