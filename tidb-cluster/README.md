# Deploy TiDB cluster using StatefulSet and Deployment

kubeadm-dind is required

1. Prepare images

```
docker build -t localhost:5000/pingcap/pd pd
docker pull pingcap/tikv
docker pull pingcap/tidb
docker tag pingcap/tikv localhost:5000/pingcap/tikv
docker tag pingcap/tidb localhost:5000/pingcap/tidb

docker push localhost:5000/pingcap/pd
docker push localhost:5000/pingcap/tikv
docker push localhost:5000/pingcap/tidb
```

2. Start TiDB cluster

```
# create PD cluster
kubectl apply -f pd-statefulset.yaml
# after all PDs are running, create TiKV cluster
kubectl apply -f tikv-statefulset.yaml
# after all TiKVs are running, create TiDB cluster
kubectl apply -f tidb-statefulset.yaml
```
