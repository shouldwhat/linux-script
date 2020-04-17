# Deployment 자원 살펴보기

* 정의
  * k8s 환경에서 Pod의 배포 역할을 수행하는 k8s 자원
  * 내부적으로 replicaset 배포 방식을 사용 (?)
  * 롤링 업데이트 방식으로 Pod을 배포한다.

* 배포 방식
 
(1)
```
Service -> Pod (v1)
        -> Pod (v1)
        -> Pod (v1)
```

(2)
```
Service -> Pod (v1)
        -> Pod (v1)
        -> Pod (v1 - Down)
```

(3)
```
Service -> Pod (v1)
        -> Pod (v1)
        -> Pod (v2 - Up)
```

(4)
```
Service -> Pod (v1)
        -> Pod (v1 - Down)
        -> Pod (v2)
```

(5)
```
Service -> Pod (v1)
        -> Pod (v2 - Up)
        -> Pod (v2)
```

(6)
```
Service -> Pod (v1 - Down)
        -> Pod (v2)
        -> Pod (v2)
```

(7)
```
Service -> Pod (v2 - Up)
        -> Pod (v2)
        -> Pod (v2)
```

(8)
```
Service -> Pod (v2)
        -> Pod (v2)
        -> Pod (v2)
```

* 참고
  * https://bcho.tistory.com/m/1266?category=731548
