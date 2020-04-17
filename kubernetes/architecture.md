# kubernetes architecture 살펴보기

* 컴포넌트 구성
  * 마스터 노드
    * API Server : k8s의 모든 기능을 REST API로 제공하고, 그에 대한 명령을 처리한다.
    * Scheduler : 노드가 배정되지 않은 새로 생성된 Pod을 감지하고 구동될 노드를 선택한다.
    * Etcd : 모든 클러스터의 데이터 베이스 역할로 설정 값이나 상태를 저장하고 관리한다.
    * Kube Controller Manager : 각 컨트롤러를 생성하고 각 노드에 배포하며 관리하는 역할을한다.
      * Replica controller
      * Service controller
      * Volume Controller
      * Node controller
    * Cloud-controller-manager


  * 워커 노드
    * Kubelet : 각 노드에서 실행되는 에이전트로 마스터 노드의 API Server와 통신을 하면서, 명령을 받아서 처리한다.
    * kube-proxy : 네트워크 트래픽을 규칙에 따라 적절한 컨테이너로 라우팅, 로드밸런싱, 포워딩한다.
    * Container Runtime : 컨테이너 런타임 엔진. 몇가지 런타임 엔진을 지원한다.
      * docker
      * containerd
      * cri-o
      * ...


* 참고
  * https://bcho.tistory.com/m/1258?category=731548


