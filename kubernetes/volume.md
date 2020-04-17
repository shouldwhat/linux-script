# volume 자원 살펴보기

* 종류
  * Temp (임시)
    * emptyDir : Pod이 생성 될 때 생성되고, 삭제 될 때 같이 삭제된다.
  * Local (로컬)
    * hostPath : 노드의 로컬 디스크의 경로를 Pod에서 마운트해서 사용한다.
  * Network (네트워크)
    * NFS
    * iSCSI
    * AWS EBS
    * VsphereVolume
    * GlusterFS
    * ...
  * gitRepo : 지정된 git 리파지토리를 clone해서 디스크 볼륨을 생성하는 방식
  * PersistentVolume (PV) : 물리 디스크를 k8s에서 정의한 자원
  * PersistentVolumeClaim : Pod과 PV의 관계를 정의한 자원


* 참고
  * https://bcho.tistory.com/m/1258?category=731548