#!/bin/sh


NETWORK_NAME=nginx-net
NETWORK_NAME2=nginx-net-2
IMAGE_NAME=nginx
SERVICE_NAME=my-nginx


# Swarm으로 구성할 Master 노드는 firewalld stop 되어야함.

# 입력 파라미터 예시
MASTER_IP=192.168.120.51
SWM_TOKEN=SWMTKN-1-54zarc1ockin7vvtf8ts2pbrpixqewpwadc4wnwszcgx194wxq-0nvaghvjjyidj1as8axkcfgky

#############################################################
###################### Master (=Node Manager, Task Scheduler, Swarm Cluster Manager)
#############################################################

#
# enable ports
# *. 2376/tcp,
# *. 2377/tcp : Cluster Management
# *. 7946/tcp,udp : Nodes communication
# *. 4789/tcp,udp : Overlay network traffic 
#

# Join 시 overlay network(name:ingreses) 가 Master 노드에 생성
docker swarm init

# node ls : 등록된 worker 노드 확인
docker node ls
docker node ls --filter role=manager
docker node ls --filter role=worker

# overlay network(name:$NETWORK_NAME) 생성
# -d = --driver
docker network create -d overlay $NETWORK_NAME

# service 생성
# 각 배포된 컨테이너는 overlay network ip(10.x.x.x)가 할당되고, docker_gwbrdige(172.x.x.x)의 아이피와 맵핑됨
docker service create --name $SERVICE_NAME --publish target=80,published=80 --replicas=5 --network $NETWORK_NAME $IMAGE_NAME

# 각 배포된 컨테이너는 overlay network ip(10.x.x.x)가 할당되고, docker 호스트의 80포트와 맵핑됨.
docker service create --name $SERVICE_NAME --mode=global --publish mode=host,target=80,published=80 --network $NETWORK_NAME $IMAGE_NAME

# service ls : 등록된 service 확인
docker service ls

# service update : 배포된 service 정보 업데이트 (업데이트 시, 서비스 재배포됨)
# --network-add : 네트워크 추가.
# --network-rm : 기존 맵핑된 네트워크 제거.
docker service update --network-add nginx-net-2 --network-rm nginx-net $SERVIC_NAME

# service rm : 배포된 service 제거
docker service rm $SERVICE_NAME

#############################################################
#################### Workers
#############################################################

# join 시 overlay network(name:ingress) 가 Worker 노드에 생성
docker swarm join --token docker swarm join --token $SWM_TOKEN $MASTER_IP


