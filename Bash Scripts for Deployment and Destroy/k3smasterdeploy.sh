#!/bin/bash
curl -sfL https://get.k3s.io | sh -
cat /etc/rancher/k3s/k3s.yaml > /root/kubeconfig
sleep 15
Readiness=$(k3s kubectl get nodes | grep "Ready" | cut -f4 -d" ")
if [ $Readiness == "Ready"]; then
   echo "K3sMaster Ready"
else
   echo "K3sMaster not ready"
fi
