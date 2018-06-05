#/bin/sh

#
# [Pre-Requirement] : Execute 'install_grafana.sh'
#
grafana-cli plugins install grafana-simple-json-datasource
systemctl restart grafana-server

echo -e
echo "*************************************"
echo "updated datasource type : SimpleJson"
echo "*************************************"
echo -e

