#!/bin/sh

IMAGE_NAME=friendlyhello
CONTAINER_ID=37390bad58b9
CONTAINER_NAME=alpine4
REPO_NAME=get-started
TAG_NAME=part2
CMD=pwd

COMPOSE_FILE_NAME=docker-compose.yml
STACK_NAME=getstartedlab

# image rm
docker rmi $CONTAINER_ID

# -p : 도커 호스트의 4000 포트를 컨테이너의 80 포트로 포워딩 설정
docker run -p 4000:80 $IMAGE_NAME

# -d : 백그라운드 모드 실행
docker run -d -p 4000:80 $IMAGE_NAME
docker run -dit --name $CONTAINER_NAME $IMAGE_NAME $CMD

# exec : container 내부에서 커멘드($CMD) 실행
docker exec $IMAGE_NAME $CMD

# -i : interactive, -t : 콘솔에서 input, output 확인가능
# --name '컨테이너이름' '사용할 BASE 이미지' '실행할 COMMAND'
# (default:--network brdige 생략됨)
docker run -dit --name alpine1 alpine ash

# CTRL p + CTRL q : background 상태로 exit
# CTRL D : container 종료

# attach : 실행 중인 container 콘솔에 접속
docker container attach $CONTAINER_NAME

# 현재 컨테이너의 bash log
docker logs $CONTAINER_ID

# 현재 이미지 상태를 스냅샷 복제
docker commit $CONTAINER_ID new_image_name

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

# 현재 image를 save.tgz 파일로 저장
docker save busybox > ./git/save.tgz

# 사용하지 않는 리소스 정리
docker network prune
docker volume prune

# 현재 컨테이너 상의 /root/logs.txt 파일을 호스트의 . 경로에 복사
docker cp ${CONTAINER_ID}:/root/logs.txt .

# 저장된 도커 image를 docker 로 로드한다
docker load < ./git/save.tgz

# -t : 빌드 후 생성할 이미지 파일명
# . : 참조할 디렉토리 위치 -> Dockerfile 필요
docker build -t friendlyhello .

# login : docker hub 로그인
docker login

# tag : 현재 이미지 tagging
docker tag $IMAGE_NAME $REPO_NAME:$TAG_NAME
docker push $REPO_NAME:$TAG_NAME

# docker stack 배포
# stack : A stack is a group of interrelated services that share dependencies. and can be orchestrated and scaled together.
# this command means 'single service stack' running on a 'single host'.
# docker stack = service 그룹
docker stack deploy -c $COMPOSE_FILE_NAME $STACK_NAME
docker-compose -f $COMPOSE_FILE_NAME

# 배포된 docker stack 목록
docker service ls
docker stack ls

# 배포된 container 목록
docker service ps $STACK_NAME
docker container ls

# 배포된 docker stack 삭제
docker stack rm $STACK_NAME

# 배포된 container의 리소스 사용량 모니터링
docker stats $CONTAINER_NAME1 $CONTAINER_NAME2

# docker swarm 모드 활성화 & 현재 노드를 매니져로 지정
docker swarm init

# then, 다른 머신을 swarm의 worker 노드로 추가
docker swarm join

docker swarm leave --force

