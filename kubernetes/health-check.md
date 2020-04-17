# health check 기능 살펴보기

* 체크 종류
  * Command probe : 쉘 명령 수행 후 결과값(성공=0)으로 상태를 체크한다.
  * HTTP probe : HTTP GET 요청 수행 후 응답코드(성공=200~300)를 판단하여 상태를 체크한다.
  * TCP probe : 지정한 포트에 TCP 연결 시도 후 연결 성공 여부를 판단하여 상태를 체크한다.

* 체크 방식
  * livenessProbe : 컨테이너의 상태를 주기적으로 체크해서, 응답이 없으면 컨테이너를 자동으로 재시작해준다. (컨테이너 상태 체크)
  * readinessProbe : 서비스의 기능 여부를 주기적으로 체크해서, 응답이 없으면 컨테이너를 서비스 목록에서 제외한다. (서비스 기능 체크)

* 참고
  * https://bcho.tistory.com/m/1264?category=731548