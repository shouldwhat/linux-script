# kubernetes up & running (쿠버네티스 시작하기)

* **정리**

  ```
  *. kubectl 커맨드는 기본적으로 default namespace와 상호작용한다. (--namepsace)
  
  *. kubernetes는 자신 내부에 있는 모든 것을 result 자원으로 표현하고, 이것을 쿠버네티스 객체(object)로 표현한다.
  
  *. 구성 요소 : kubernetes-server(마스터 노드), kube-proxy(워커 노드)
  
  *. https://your-k8s.com/api/v1/namespaces/default/pods/my-pod
  
  *. kubectl 명령어는 위와 같은 http 요청을 작성해 kubernetes 객체로 접근한다.
  
  *. # kubectl get <자원 이름> <객체 이름> <-o wide, -o json -o yaml>
  
  *. # kubectl get pods my-pod -o jsonpath --template={.status.podIP} : 포드의 특정 속성 파싱
  
  *. # kubectl describe <자원 이름> <객체 이름>
     # kubectl describe pods kuard
  
  *. # kubectl apply -f obj.yaml : obj.yaml에 정의한 객체 생성 및 실행
     # kubectl delete -f obj.yaml : 객체 삭제
     # kubectl delete <자원 이름> <객체 이름> : 객체 삭제
     # kubectl edit <자원 이름> <객체 이름> : 수정 & 적용
     
  *. label(라벨), annotation(어노테이션) 은 객체용 태그로 사용한다.
  
  *. # kubectl label pods bar color=red <--overwrite> : bar 포드에 color=red라는 라벨을 추가
     # kubectl label pods bar -color : bar 포드에 color 라벨 삭제
  
  *. # kubectl logs <포드 이름> <-f> : 컨테이너의 콘솔 로그 출력
  
  *. # kubectl port-forward kuard 8080:8080 : 호스트의 8080포트를 컨테이너의 8080 포트로 포워딩
  
  *. # kubectl exec -it <포드 이름> -- bash : 컨테이너 내부에서 대화형으로 bash 실행
     # kubectl exec kuard date : kuard 포드 내에서 date 커맨드 실행
  
  *. # kubectl cp <포드 이름>:/root/container/* /root/host/ : 컨테이너에서 호스트로 파일 복사
  
  *. POD(포드) : 
     1. kubernetes 클러스터에서 배포 가능한 가장 작은 아티팩트
     2. 포드에 있는 모든 컨테이너는 동일한 머신에 있음을 뜻함.
     3. 포드는 Deployment와 ReplicaSet 객체로 만들어짐.
     4. 포드 매니테프스틑 YAML이나 JSON으로 작성할 수 있음.
  
  *. # kubectl run kuard --image=gcr.io/kuar-demo/kuard-amd64:1 : 포드 생성
     # kubectl delete deployments/kuard : 포드 삭제
  
  *. # kubectl get pods : 포드 상태 확인
     
  *. 포드 매니페스트 : 
     1. metadata 섹션 : 포드를 설명
     2. spec 섹션 : 볼륨을 설명
     3. 
     
  *. 상태 검사 : 
     1. 컨테이너로 실행한 앱 프로세스의 상태 검사(process health check)를 자동으로 실행한다.
     2. 활성 프로브(liveness probe) : 앱에 설정된 로직(uri 호출)을 실행함. (kuard-pod-health.yaml)
     3. 준비 프로브(readiness probe) : 준비 검사를 통과하지 못한 컨테이너는 서비스 로드밸런서에서 제외
     
  *. 자원 관리 : 
     1. 최소 자원 할당 (kuard-pod-resreq.yaml)
     2. 자원 사용 제한 (kuard-reslim.yaml)
     
  *. 볼륨 사용 : 
     1. 포드로 볼륨 사용 (kuard-pod-vol.yaml)
    
  *. 라벨 : 
     1. 클러스터에서 객체를 식별하고 선택적으로 그룹화하는 데 사용.
     2. 포드, 레플리카세트 같은 쿠버네티스 객체에 첨부할 수 있음
     3. 키와 값의 쌍으로 표현
     4. # kubectl run alpack-prod --image=gcr.io/muar-demo/kuard-amd64:1 --replicas=2 --labels="ver=1,app=alpaca,env=prod"
     5. # kubectl get deployments --show-labels
     6. # kubectl get pods --selector="app=alpaca" : 라벨 셀렉터 사용
     
  *. 라벨 셀렉터 : 
     1. # kubectl ... --selector="key in (값1, 값2)" : 키가 값1, 값2 인 오브젝트를 필터
     2. # kubectl ... --selector="key=값3" : 키가 값3인 오브젝트를 필터
     3. # kubectl ... --selector="key!=값4" : 키가 값4가 아닌 오브젝트를 필터
     4. # kubectl ... --selector="key" : 키가 설정된 오브젝트를 필터
     4. # kubectl ... --selector="!key" : 키가 설정되지 않은ㄱ 오브젝트를 필터
     
  *. 어노테이션 : 
     1. 쿠버네티스 객체에 추가적인 메타데이터를 저장하는 장소를 제공.
     2. 특별한 스케줄링 정책을 스케줄러에 전달 가능.
     3. 라벨에 적합하지 않은 속성, 릴리즈, 또는 이미지 정보 저장.
     
  *. 
  ```

