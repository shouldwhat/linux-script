#/bin/sh

PASSWORD=123123
ADDRESS=192.168.0.1

# [Step.1] 디폴트 비대칭 키 쌍 생성
ssh-key-gen

# [Step.2] 1 line 명령으롤 처리하기 위해 sshpass 인스톨
yum install -y sshpass

# [Step.3] 생성한 공개키를 서버($ADDRESS)에 등록
sshpass -p $PASSWORD ssh-copy-id -o StrictHostKeyChecking=no root@$ADDRESS
