#!/bin/sh

CONTROLLER=controller
OS_ADMIN_PW=123123

function configure_database_schema {
	su -s /bin/sh -c "keystone-manage db_sync" keystone
}

function configure_key_repositories {
	keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
	keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
}

function configure_keystone {
	keystone-manage bootstrap --bootstrap-password $OS_ADMIN_PW \
  --bootstrap-admin-url http://$CONTROLLER:35357/v3/ \
  --bootstrap-internal-url http://$CONTROLLER:5000/v3/ \
  --bootstrap-public-url http://$CONTROLLER:5000/v3/ \
  --bootstrap-region-id RegionOne
}

#configure_database_schema
#configure_key_repositories
configure_keystone
