repo=registry.aliyuncs.com/google_containers
name=k8s.gcr.io/metrics-server/metrics-server:v0.6.1
src_name=metrics-server:v0.6.1
docker pull $repo/$src_name
docker tag $repo/$src_name $name
docker rmi $repo/$src_name

或者将 component.yaml 中
    image: k8s.gcr.io/metrics-server/metrics-server:v0.6.2 改为
    image: registry.aliyuncs.com/google_containers/metrics-server:v0.6.2 

component.yaml 中
    containers.args 追加参数 --kubelet-insecure-tls, 表示与 kubelet 的通讯过程不需要 TLS