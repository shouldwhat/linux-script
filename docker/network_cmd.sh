#!/bin/sh

# --driver : 'bridge', 'host', 'overlay'

# user-defined bridge network 생성(driver = bridge)
# 디폴트로 brdige이며 '--driver brdige' 생략 가능
# brdige 네트워크 방식을 사용하는 'alpine-net 네트워크 생성'
docker network create --driver bridge alpine-net
docker network rm alpine-net

# docker network 목록 조회
docker network ls

# --network : 사용할 네트워크 지정 (디폴트:bridge -> 생략가능)
docker run -dit --name alpine1 --network alpine-net alpine ash

# 실행된 컨테이너(alpine1)에 'bridge' 네트워크 연결시키기 (기존 네트워크 인터페이스와 함께 사용)
docker network connect bridge alpine1
