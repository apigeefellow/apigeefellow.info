
# requirements istio, gcloud, kubectl

# if the cluster already exist

# gcloud container clusters get-credentials istio-tutorial --zone us-central1-f --project avian-compiler-238122

gcloud container clusters create istio-tutorial  --machine-type=n1-standard-2  --num-nodes=4  --zone us-central1-f 

sleep 60

kubectl get nodes --insecure-skip-tls-verify=true
kubectl get services --insecure-skip-tls-verify=true
kubectl get pods --insecure-skip-tls-verify=true
kubectl --insecure-skip-tls-verify=true get pod --all-namespaces

# https://istio.io/docs/setup/kubernetes/install/kubernetes/

kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user="$(gcloud config get-value core/account)"  --insecure-skip-tls-verify=true

# istio services installation

kubectl apply -f install/kubernetes/istio-demo-auth.yaml --insecure-skip-tls-verify=true

kubectl get pods -n istio-system --insecure-skip-tls-verify=true
kubectl get services -n istio-system --insecure-skip-tls-verify=true

# install bookinfo

# https://istio.io/docs/setup/kubernetes/additional-setup/sidecar-injection/#automatic-sidecar-injection

# https://cloud.google.com/istio/docs/istio-on-gke/installing

# not working due to - Unable to connect to the server: EOF

kubectl --insecure-skip-tls-verify=true label namespace default istio-injection=enabled

kubectl --insecure-skip-tls-verify=true api-versions | grep admissionregistration

kubectl --insecure-skip-tls-verify=true get namespace -L istio-injection

kubectl --insecure-skip-tls-verify=true get configmap istio -n istio-system -o yaml

kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml --insecure-skip-tls-verify=true

# validate

kubectl get pods --insecure-skip-tls-verify=true

kubectl get services --insecure-skip-tls-verify=true

kubectl --insecure-skip-tls-verify=true exec -it $(kubectl --insecure-skip-tls-verify=true get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') -c ratings -- curl productpage:9080/productpage | grep -o "<title>.*</title>"

kubectl --insecure-skip-tls-verify=true get svc istio-ingressgateway -n istio-system

kubectl --insecure-skip-tls-verify=true get destinationrules -o yaml

kubectl --insecure-skip-tls-verify=true get gateway -o yaml

kubectl --insecure-skip-tls-verify=true get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}'

kubectl --insecure-skip-tls-verify=true apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

kubectl --insecure-skip-tls-verify=true apply -f samples/bookinfo/networking/destination-rule-all.yaml

kubectl --insecure-skip-tls-verify=true apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml

kubectl --insecure-skip-tls-verify=true get virtualservice -o yaml

kubectl --insecure-skip-tls-verify=true get pod --all-namespaces

kubectl --insecure-skip-tls-verify=true  get svc

kubectl --insecure-skip-tls-verify=true  get service













