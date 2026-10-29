# file-service-manifests

file-service의 쿠버네티스 배포 설정

- apps/file-service/base - Deployment, Service(ClusterIP), ConfigMap, Secret(예시 값), 공통 label
- apps/file-service/overlays/local - Ingress(nginx, file.local), HPA, replicas, 이미지 태그
- platform/local - MetalLB IP 풀, Namespace dev, RBAC
- examples - 비교용 단독 Pod

적용: kubectl apply -k apps/file-service/overlays/local
