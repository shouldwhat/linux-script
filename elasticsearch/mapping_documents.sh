ES_ENDPOINT=192.168.120.52:80
ES_CLUSTER_NAME=es

ES_REQUEST_URL=$ES_ENDPOINT/$ES_CLUSTER_NAME

# $REQUEST_URL/$INDEX/$TYPE/_mapping
curl -XPUT $ES_REQUEST_URL/basketball/record/_mapping?pretty --data-binary @mapping_basketball.json


