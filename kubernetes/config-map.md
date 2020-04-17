# ConfigMap 자원 살펴보기

* 정의 
  * 환경 변수나 설정값들을 변수로서 만들어 관리할 수 있는 k8s 자원
  * 설정 정보 저장소 (Key/Value)
  * Pod이 생성될때 주입하여 사용
  
* 사용 방식
  * 정의한 configMap 자원의 설정값을 Pod의 환경 변수로 주입
  * 정의한 configMap 자원의 설정값을 Pod의 디스크 볼륨으로 마운트

* 참고
  * https://bcho.tistory.com/m/1267?category=731548