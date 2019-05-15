## Certificate is by default in istio installation. Then enable mtls.

kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml

* [Debugging Istio: How to Fix a Broken Service Mesh (Cloud Next '19)](https://www.youtube.com/watch?v=FbYBO7Pi2d8)

```
  506  wget https://github.com/wercker/stern/releases/download/1.10.0/stern_linux_amd64
  507  mkdir ~/workspaces19/bin
  508  mv stern_linux_amd64 ~/workspaces19/bin/stern
  512  export PATH=$PATH:/home/apigeefellow/workspaces19/bin
  513  stern
  514  chmod 777 /home/apigeefellow/workspaces19/bin/stern
  515  stern
  516  kubectl get services
  517  kubectl get pods
  518  stern productpage -c istio-proxy -e ".*/source.*"
  519  kubectl get service
  520  kubectl get pod
  521  stern details -c istio-proxy -e ".*/source.*"
  522  kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') -c ratings -- curl productpage:9080/productpage | grep -o "<title>.*</title>"
  523  stern productpage -c istio-proxy -e ".*/source.*"
  524  stern details -c istio-proxy -e ".*/source.*"
  525  stern -n istio-system pilot -c discovery
  526  stern -n istio-system pilot -c discovery | grep ProxyStatus
  527  stern -n istio-system pilot -c discovery
  528  kubectl get deploy -l istio=citadel -n istio-system
  529  kubectl exec $(kubectl get pod -l app=productpage -o jsonpath={.items..metadata.name}) -c istio-proxy -- cat /etc/certs/cert-chain.pem
  530  kubectl exec $(kubectl get pod -l app=productpage -o jsonpath={.items..metadata.name}) -c istio-proxy -- cat /etc/certs/cert-chain.pem | openssl x509 -text -noout | grep validity -A 2
  531  kubectl exec $(kubectl get pod -l app=productpage -o jsonpath={.items..metadata.name}) -c istio-proxy -- cat /etc/certs/cert-chain.pem | openssl x509 -text -noout
  532  kubectl exec $(kubectl get pod -l app=productpage -o jsonpath={.items..metadata.name}) -c istio-proxy -- cat /etc/certs/cert-chain.pem | openssl x509 -text -noout | grep Validity
  533  kubectl exec $(kubectl get pod -l app=productpage -o jsonpath={.items..metadata.name}) -c istio-proxy -- cat /etc/certs/cert-chain.pem | openssl x509 -text -noout | grep Validity -A 2
  534  kubectl get pod
  535  kubectl exec $(kubectl get pod -l app=ratings -o jsonpath={.items..metadata.name}) -c istio-proxy -- cat /etc/certs/cert-chain.pem | openssl x509 -text -noout | grep Validity -A 2
  536  kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml
  537  pwd
  538  cd istio/
  539  ls -al
  540  cd istio-1.1.6
  541  kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml
  542  kubectl get policy
  543  kubectl get policies
```
