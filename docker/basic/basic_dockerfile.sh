#!/bin/sh
#
# https://docs.docker.com/engine/reference/builder/#usage
#

# FROM 
1. Dockerfile의 첫번재 명령. 
2. Base 이미지 지정.
3. FROM REPO:TAG
ex) FROM ubuntu
ex) FROM java:8u111-jdk

# LABEL
1. 메타 정보를 입력.

# ADD
1. 호스트의 파일을 컨테이너 내 디렉토리로 이동. (like as 'mv')
2. $ ADD '호스트 내 대상 파일' '컨테이너 내 디렉토리 경로'
ex) ADD . /app

# ENV
1. 컨테이너 내부 환경변수 셋팅.
2. $ ENV '환경변수 명' '값'
ex) ENV NAME world

# RUN
0. RUN 키워드는 선언한 수만큼의 이미지 레이어가 만들어진다.
1. 커멘드라인 명령어 실행
2. RUN '실행할 명령어'
ex) RUN yum update

# ENTRYPOINT
1. RUN 실행 이후 가장 마지막에 실행 되는 명령어


# CMD
1. 컨테이너가 실행될 때 실행할 명령어
2. CMD ["명령어 ..."]
ex) CMD ["python", "app.py"]

# EXPOSE
1. 컨테이너로 포워딩할 호스트의 네트워크 포트
2. EXPOSE '호스트 포트'
ex) EXPOSE 8080

