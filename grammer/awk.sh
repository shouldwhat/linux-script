#/bin/sh

# ls -al 로 출력되는 파일 목록에서 1번 행만 출력한다.
ls -al | awk '{print $1}'
echo -e
ls -al | awk '$2 > 8'
echo -e

# NR 은 AI 형태의 숫자를 표현한다
ls -al | awk '{print NR, $1}'

# http-call.sh 파일에서 curl 을 포함하는 행을출력한다.
awk '/curl/{print $0}' http-call.sh

# 원하는 형태로 조합하여 출력한다.
date | awk '{print "Month :" $2"\n Year :" $6}'
