# kubernetes 기본 커맨드 살펴보기

```
# kubectl get <오브젝트타입>
  (오브젝트타입 : node, pod, replicaset, deployment, service, ingress, volume, configmap, secret, namespace, ...)
  
# kubectl get <오브젝트타입> --show-labels

# kubectl describe <오브젝트타입> <오브젝트명>

# kubectl exec -it <POD 이름> <커멘드> : POD 내부에서 커맨드 실행

# kubectl logs <POD 이름>

# kubectl apply -f <설정파일>
# kubectl delete -f <설정파일>

// kubectl 컨텍스트 설정
# kubectl config get-contexts
# kubectl config set-contexts $NEW_CONTEXT_NAME --user=kubernetes-admin --cluster=$CLUSTER_NAME --namespace=$NAMESPACE
# kubectl config use-context $NEW_CONTEXT_NAME

```