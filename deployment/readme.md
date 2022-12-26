IngressController 的安装

kubectl apply -f common/ns-and-sa.yaml
kubectl apply -f rbac
kubectl apply -f common
kubectl apply -f common/crds

最后安装 IngressController 这个 deployment
kubectl apply -f ing-controller-dep.yaml


curl --resolve ngx.test:80:${IngressController pod ip} http://ngx.test:80
也可以通过 NodePort 或 LB 的形式为 IngressController pod 创建一个对外的 service