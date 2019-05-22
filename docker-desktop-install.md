```

https://matthewpalmer.net/kubernetes-app-developer/articles/how-to-run-local-kubernetes-docker-for-mac.html

kubectl config use-context docker-for-desktop
kubectl get pod
kubectl get services
kubectl get nodes
kubectl version


https://rominirani.com/tutorial-getting-started-with-kubernetes-with-docker-on-mac-7f58467203fd

$ kubectl cluster-info
Kubernetes master is running at https://localhost:6443
KubeDNS is running at https://localhost:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

$ kubectl get nodes
NAME                 STATUS   ROLES    AGE   VERSION
docker-for-desktop   Ready    master   4d    v1.10.11
lasalles-MacBook-Pro:lassalekube lasalle$ 

https://github.com/kubernetes/dashboard

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml

$ kubectl get pods --namespace=kube-system
NAME                                         READY   STATUS    RESTARTS   AGE
etcd-docker-for-desktop                      1/1     Running   0          4d
kube-apiserver-docker-for-desktop            1/1     Running   0          4d
kube-controller-manager-docker-for-desktop   1/1     Running   0          4d
kube-dns-86f4d74b45-6q6mm                    3/3     Running   0          4d
kube-proxy-vhcth                             1/1     Running   0          4d
kube-scheduler-docker-for-desktop            1/1     Running   0          4d
kubernetes-dashboard-669f9bbd46-vjqwv        1/1     Running   0          1m

$ kubectl proxy
Starting to serve on 127.0.0.1:8001

# https://rominirani.com/tutorial-getting-started-with-kubernetes-with-docker-on-mac-7f58467203fd

http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

OR 

kubectl port-forward kubernetes-dashboard-7798c48646-ctrtl 8443:8443 — namespace=kube-system

# enable skip login

# https://github.com/kubernetes/dashboard/wiki/Access-control

--enable-skip-login

Using Skip option will make Dashboard use privileges of Service Account used by Dashboard. Skip button is disabled by default since 1.10.1. Use --enable-skip-login dashboard flag to display it.

or create an admin user

# https://github.com/kubernetes/dashboard/wiki/Creating-sample-user

# https://gist.github.com/chukaofili/9e94d966e73566eba5abdca7ccb067e6#file-k8s-dashboard-admin-user-yaml

# https://iamchuka.com/install-kubernetes-dashboard-part-iii/

k8s-dashboard-admin-user.yaml

apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kube-system

$ kubectl apply -f k8s-dashboard-admin-user.yaml
serviceaccount/admin-user created
clusterrolebinding.rbac.authorization.k8s.io/admin-user created



$ kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
Name:         admin-user-token-plrnm
Namespace:    kube-system
Labels:       <none>
Annotations:  kubernetes.io/service-account.name: admin-user
              kubernetes.io/service-account.uid: 62460dc1-7c2f-11e9-8d32-025000000001

Type:  kubernetes.io/service-account-token

Data
====
namespace:  11 bytes
token:      xxxxxxxxx
ca.crt:     1025 bytes

http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/overview?namespace=default

$ docker images
REPOSITORY                                      TAG                 IMAGE ID            CREATED             SIZE
istio/pilot                                     1.1.6               734a2b07623f        11 days ago         283MB
nginx                                           latest              53f3fd8007f7        13 days ago         109MB
k8s.gcr.io/kubernetes-dashboard-amd64           v1.10.1             f9aed6605b81        5 months ago        122MB
k8s.gcr.io/kube-proxy-amd64                     v1.10.11            7387003276ac        5 months ago        98.3MB
k8s.gcr.io/kube-apiserver-amd64                 v1.10.11            e851a7aeb6e8        5 months ago        228MB
k8s.gcr.io/kube-controller-manager-amd64        v1.10.11            978cfa2028bf        5 months ago        151MB
k8s.gcr.io/kube-scheduler-amd64                 v1.10.11            d2c751d562c6        5 months ago        51.2MB
consul                                          1.3.0               2d7f56f4c166        7 months ago        104MB
docker/kube-compose-controller                  v0.4.12             02a45592fbea        8 months ago        27.8MB
docker/kube-compose-api-server                  v0.4.12             0f92c77fa676        8 months ago        41.2MB
quay.io/coreos/etcd                             latest              61ad63875109        11 months ago       39.5MB
openzipkin/zipkin                               2.7                 b6cbea98c022        12 months ago       176MB
k8s.gcr.io/etcd-amd64                           3.1.12              52920ad46f5b        14 months ago       193MB
k8s.gcr.io/k8s-dns-dnsmasq-nanny-amd64          1.14.8              c2ce1ffb51ed        16 months ago       41MB
k8s.gcr.io/k8s-dns-sidecar-amd64                1.14.8              6f7f2dc7fab5        16 months ago       42.2MB
k8s.gcr.io/k8s-dns-kube-dns-amd64               1.14.8              80cc5ea4b547        16 months ago       50.5MB
k8s.gcr.io/pause-amd64                          3.1                 da86e6ba6ca1        17 months ago       742kB
gcr.io/google_containers/kube-apiserver-amd64   v1.7.3              a1cc3a3d8d0d        21 months ago       186MB
gliderlabs/registrator                          latest              3b59190c6c80        3 years ago         23.8MB


https://iamchuka.com/tag/k8s-do-series/
$65 Kubernetes Cluster on DigitalOcean - Production Grade Kubernetes Cluster on DigitalOcean

-------------

Istio installation


kubectl apply -f install/kubernetes/istio-demo-auth.yaml

$ kubectl get pods -n istio-system
NAME                                      READY   STATUS      RESTARTS   AGE
grafana-68d7777d7d-gx8j9                  1/1     Running     0          3m
istio-citadel-75bcdc84b4-p7szc            1/1     Running     0          3m
istio-cleanup-secrets-1.1.6-r5d57         0/1     Completed   0          3m
istio-egressgateway-67597dd7bd-vm9ng      1/1     Running     0          3m
istio-galley-779ffd84db-fm2fm             1/1     Running     0          3m
istio-grafana-post-install-1.1.6-qfwls    0/1     Completed   0          3m
istio-ingressgateway-79487cf87c-khdln     1/1     Running     0          3m
istio-pilot-55bc5bb774-ftbwl              2/2     Running     0          3m
istio-policy-6ccb7b7d47-f8fcm             2/2     Running     5          3m
istio-security-post-install-1.1.6-m4fr2   0/1     Completed   0          3m
istio-sidecar-injector-768f6fb8b7-vmqgk   1/1     Running     0          3m
istio-telemetry-59dd7b6db7-bltnv          2/2     Running     5          3m
istio-tracing-79c7955c98-p9ttn            1/1     Running     0          3m
kiali-678b47867b-tg8bx                    1/1     Running     0          3m
prometheus-7484dc55b4-25mkk               1/1     Running     0          3m



Bookinfo install

kubectl label namespace default istio-injection=enabled

kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml

$ kubectl get services

NAME          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
details       ClusterIP   10.96.72.226     <none>        9080/TCP   34s
kubernetes    ClusterIP   10.96.0.1        <none>        443/TCP    4d
productpage   ClusterIP   10.108.195.13    <none>        9080/TCP   28s
ratings       ClusterIP   10.105.162.209   <none>        9080/TCP   33s
reviews       ClusterIP   10.109.66.255    <none>        9080/TCP   32s

```
### Bookinfo install

```

$ kubectl get pods
NAME                              READY   STATUS    RESTARTS   AGE
details-v1-757ddf9f94-zzprq       2/2     Running   0          6m
example-pod                       1/1     Running   1          1h
productpage-v1-54bc69c656-5hphf   2/2     Running   0          6m
ratings-v1-5697db448b-hggxg       2/2     Running   0          6m
reviews-v1-5dffc9bfdf-n9pnq       2/2     Running   0          6m
reviews-v2-74687c6dc7-wwscw       2/2     Running   0          6m
reviews-v3-5dbcf4b9bf-qhrqk       2/2     Running   0          6m

$ kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') -c ratings -- curl productpage:9080/productpage | grep -o "<title>.*</title>"
<title>Simple Bookstore App</title>


$ kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
gateway.networking.istio.io/bookinfo-gateway created
virtualservice.networking.istio.io/bookinfo created


$ kubectl get svc istio-ingressgateway -n istio-system
NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                                                                                                                                      AGE
istio-ingressgateway   LoadBalancer   10.100.253.119   localhost     15020:30190/TCP,80:31380/TCP,443:31390/TCP,31400:31400/TCP,15029:31924/TCP,15030:31316/TCP,15031:30533/TCP,15032:31618/TCP,15443:30147/TCP   12m


http://localhost/productpage

$ kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml
destinationrule.networking.istio.io/productpage created
destinationrule.networking.istio.io/reviews created
destinationrule.networking.istio.io/ratings created
destinationrule.networking.istio.io/details created

$ kubectl apply -f samples/bookinfo/networking/virtual-service-all-v1.yaml
virtualservice.networking.istio.io/productpage created
virtualservice.networking.istio.io/reviews created
virtualservice.networking.istio.io/ratings created
virtualservice.networking.istio.io/details created

```
