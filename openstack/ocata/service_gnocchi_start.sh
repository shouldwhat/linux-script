#!/bin/sh

systemctl start openstack-gnocchi-api.service openstack-gnocchi-metricd.service openstack-gnocchi-statsd.service
