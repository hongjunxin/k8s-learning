# 创建 StorageClass 和对应的 Provisioner
kubectl apply -f rbac.yaml
kubectl apply -f class.yaml
kubectl apply -f deployment.yaml
