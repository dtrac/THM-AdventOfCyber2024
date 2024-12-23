# Notes for Day22

## Theme **Kubernetes + DFIR**

## General

- DFIR - Digital Forensics and Incident Response

```bash
minikube start
kubectl get pods -n wareville
NAME                              READY   STATUS    RESTARTS         AGE
morality-checker                  1/1     Running   8  (9m16s ago)   20d
naughty-or-nice                   1/1     Running   1  (9m16s ago)    9d
naughty-picker-7cbd95dd66-gjm7r   1/1     Running   32 (9m16s ago)   20d
naughty-picker-7cbd95dd66-gshvp   1/1     Running   32 (9m16s ago)   20d
nice-picker-7cd98989c8-bfbqn      1/1     Running   32 (9m16s ago)   20d
nice-picker-7cd98989c8-ttc7t      1/1     Running   32 (9m16s ago)   20d

kubectl exec -n wareville naughty-or-nice -it -- /bin/bash
docker ps

docker exec CONTAINER NAME / ID ls -al /var/log
total 12
drwxr-xr-x    2 root     root          4096 Nov 12  2021 .
drwxr-xr-x    1 root     root          4096 Nov 12  2021 ..

cat docker-registry-logs.log | grep "HEAD" | cut -d ' ' -f 1
cat docker-registry-logs.log | grep "10.10.130.253"

kubectl get rolebindings -n wareville
kubectl describe rolebinding mayor-user-binding -n wareville
kubectl describe role mayor-user -n wareville

## Links

- [Intro to Kubernetes](https://tryhackme.com/r/room/introtok8s)
- [Kubernetes Hardening](https://tryhackme.com/module/kubernetes-hardening)
- [Kubernetes Runtime Security](https://tryhackme.com/r/room/k8sruntimesecurity)
- [Cloud Native Security and Usage Report](https://sysdig.com/2024-cloud-native-security-and-usage-report/)