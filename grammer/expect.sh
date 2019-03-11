#!/bin/sh

#
# https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_expect
#

yum install -y expect

set timeout 30  # expect 타임 아웃 설정

expect "hello"  # hello가 입력되길 기다린다.
send "world"    # hello가 입력되면 world를 출력한다.
