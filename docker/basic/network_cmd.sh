#!/bin/sh

CONTAINER_ID=a9j2mj2fjgj345


# --driver : 'bridge', 'host', 'overlay'
# *. bridge : docker 호스트의 eth0와 연결된 docker0 브릿지 네트워크와 연결됨
# *. host : docker 호스트 네트워크 그대로 사용(?)
# *. overlay : docker 호스튼 노드간 통신 가능한 가상 네트워크를 생성함 

# user-defined bridge network 생성(driver = bridge)
# 디폴트로 brdige이며 '--driver brdige' 생략 가능
# brdige 네트워크 방식을 사용하는 'alpine-net 네트워크 생성'
docker network create --driver bridge alpine-net
docker network create -d overlay alpine-net
docker network rm alpine-net

# docker network 목록 조회
docker network ls

# --network : 사용할 네트워크 지정 (디폴트:bridge -> 생략가능)
docker run -dit --name alpine1 --network alpine-net alpine ash

# 네트워크 타입을 '$CONTAINER_ID' 와 동일하게 지정함 (IP가 할당되지 않고, CONTAINER_ID의 아이피를 공유함?)
docker run -dit --name alpine2 --net=$CONTAINER_ID alpine ash

# 실행된 컨테이너(alpine1)에 'bridge' 네트워크 연결시키기 (기존 네트워크 인터페이스와 함께 사용)
docker network connect bridge alpine1
