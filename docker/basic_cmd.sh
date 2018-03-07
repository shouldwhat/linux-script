#!/bin/sh

IMAGE_NAME=friendlyhello
CONTAINER_ID=37390bad58b9
CONTAINER_NAME=alpine4
REPO_NAME=get-started
TAG_NAME=part2
CMD=pwd

COMPOSE_FILE_NAME=docker-compose.yml
STACK_NAME=getstartedlab

# -p : Dockerfile 내에 EXPOST한 80포트를 4000포트로 리매핑하여 실행
docker run -p 4000:80 $IMAGE_NAME

# -d : 백그라운드 모드 실행
docker run -d -p 4000:80 $IMAGE_NAME
docker run -dit --name $CONTAINER_NAME $IMAGE_NAME $CMD

# -i : interactive, -t : 콘솔에서 input, output 확인가능
# --name '컨테이너이름' '사용할 BASE 이미지' '실행할 COMMAND'
# (default:--network brdige 생략됨)
docker run -dit --name alpine1 alpine ash

# CTRL p + CTRL q

# attach : 실행 중인 container 콘솔에 접속
docker container attach $CONTAINER_NAME

# exec : 컨테이너 내에서 /bin/bash 를 실행하고, 호스트와 상호작용
# -i : interactive
# -t : tty
docker exec -it $CONTAINER_NAME /bin/bash

# stop : 실행 중인 컨테이너 중지
docker stop $CONTAINER_ID
docker container stop $IMAGE_NAME
docker container stop alpine1 alpine2
docker container ls

# container rm : 컨테이너 삭제
docker container rm alpine1 alpine2

# -t : 빌드 후 생성할 이미지 파일명
# . : 참조할 디렉토리 위치
docker build -t friendlyhello .

# login : docker hub 로그인
docker login

# tag : 현재 이미지 tagging
docker tag $IMAGE_NAME $REPO_NAME:$TAG_NAME
docker push $REPO_NAME:$TAG_NAME

# docker stack 배포
# stack : A stack is a group of interrelated services that share dependencies. and can be orchestrated and scaled together.
# this command means 'single service stack' running on a 'single host'.
docker stack deploy -c $COMPOSE_FILE_NAME $STACK_NAME

# 배포된 docker stack 목록
docker service ls
docker stack ls

# 배포된 container 목록
docker service ps $STACK_NAME
docker container ls

# 배포된 docker stack 삭제
docker stack rm $STACK_NAME

# docker swarm 모드 활성화 & 현재 노드를 매니져로 지정
docker swarm init

# then, 다른 머신을 swarm의 worker 노드로 추가
docker swarm join

docker swarm leave --force

