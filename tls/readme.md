创建证书

生成一个 X509 格式的证书，有效期 365 天，私钥是 RSA2048 位，摘要算法是 SHA256，签发的网站是 “k8s.test”。

openssl req -x509 -days 365 -out k8s.test.crt -keyout k8s.test.key \
  -newkey rsa:2048 -nodes -sha256 \
    -subj '/CN=k8s.test' -extensions EXT -config <( \
       printf "[dn]\nCN=k8s.test\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:k8s.test\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")


生成 secret yaml，kubectl create secret 类型指定为 tls，而不是 generic

export out="--dry-run=client -o yaml"
kubectl create secret tls dash-tls -n learn --cert=k8s.test.crt --key=k8s.test.key $out > cert.yml
