#
# 각 compose 설정 파일의 webapp 서비스를 run 한다.
# -> 의도한대로 동작하지 않음. (why ?)
#

docker-compose -f docker-compose.yml -f docker-compose.admin.yml run webapp
