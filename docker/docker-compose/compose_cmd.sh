
# 현재 경로의 docker-compose.yml 로 오케스트레이션 구성
docker-compose up -d

# 현재 docker-compose로 실행 중인 컨테이너 종료
# --volumes : 볼륨도 함께 삭제
docker-compose down --volumes

# 현재 docker-compose로 로드 된 오케스트레이션 스크립트 출력
docker-compose config
