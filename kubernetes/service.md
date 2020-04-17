# Service 자원 살펴보기

* 정의
  * Pod 간의 로드밸런싱 역할을 수행하는 k8s 내의 자원이다.
  * Pod에 접근하기 위한 앤드포인트 생성(?)
  * 동일 Pod에 대한 로드밸런싱

* 타입
  * Cluster IP : 디폴트 설정. 쿠버네티스 클러스터 내부 IP를 할당하기 때문에, 클러스터 내부 Pod에서는 접근 가능하지만 외부에서는 접근이 불가능하다.
  * Load Balancer : 클라우드 벤더에서 제공하는 설정 방식. 외부 IP를 가지고 로드밸런서를 할당한다.
  * Node Port : 모든 k8s 워커 노드에서 동일하게 서비스할 포트를 할당한다.


* 참고
  * https://bcho.tistory.com/m/1262?category=731548
  * https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0