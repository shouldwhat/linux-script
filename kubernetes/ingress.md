# Ingress 자원 살펴보기

* 정의
  * HTTP(s) 기반의 L7 로드 밸런싱 기능을 수행하는 k8s 자원
  * URI 기반의 라우팅(?)

* 흐름 
```
        /users/*   -> Pod
        -> Service -> Pod
                   -> Pod
        /orgs/*    -> Pod
Ingress -> Service -> Pod
                   -> Pod
        /company/* -> Pod
        -> Service -> Pod
                   -> Pod
```
* 참고
  * https://bcho.tistory.com/m/1263?category=731548