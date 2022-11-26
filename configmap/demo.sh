# 获取 cm demo yaml
export out="--dry-run=client -o yaml"
kubectl create cm info --from-literal=k=v $out

# 获取 secret demo yaml
kubectl create secret generic user --from-literal=name=root $out