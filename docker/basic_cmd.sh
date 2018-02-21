#!/bin/sh

IMAGE_NAME=friendlyhello
CONTAINER_ID=37390bad58b9
REPO_NAME=get-started
TAG_NAME=part2

COMPOSE_FILE_NAME=docker-compose.yml
STACK_NAME=getstartedlab

# -p : Dockerfile 내에 EXPOST한 80포트를 4000포트로 리매핑하여 실행
docker run -p 4000:80 $IMAGE_NAME

# -d : 백그라운드 모드 실행
docker run -d -p 4000:80 $IMAGE_NAME

# stop : 실행 중인 컨테이너 중지
docker stop $CONTAINER_ID

# -t : 빌드 후 생성할 이미지 파일명
# . : 참조할 디렉토리 위치
docker build -t friendlyhello .

# login : docker hub 로그인
docker login

# tag : 현재 이미지 tagging
docker tag $IMAGE_NAME $REPO_NAME:$TAG_NAME
docker push $REPO_NAME:$TAG_NAME

# docker stack 배포
docker stack deploy -c $COMPOSE_FILE_NAME $STACK_NAME

# 배포된 docker stack 목록
docker service ls
docker stack ls

# 배포된 container 목록
docker service ps $STACK_NAME
docker container ls

# 배포된 docker stack 삭제
docker stack rm $STACK_NAME

# docker swarm 로그인&로그아웃
docker swarm init
docker swarm leave --force
