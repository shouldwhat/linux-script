#
# Ref. https://docs.docker.com/storage/volumes/#differences-between--v-and---mount-behavior
#

# my-vol 볼륨 생성
docker volume create my-vol

# 현재 볼륨 목록 & 정보 조회
docker volume ls
docker volume inspect my-vol

# nginx 이미지로 컨테이너 실행 시 현재 구성된 my-vol 볼륨을 컨테이너의 /app 경로에 마운트
docker run -d --name devtest -v my-vol:/app nginx:latest
