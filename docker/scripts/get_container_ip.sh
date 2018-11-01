
CONTAINER_ID_OR_NAME=$1

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_ID_OR_NAME
