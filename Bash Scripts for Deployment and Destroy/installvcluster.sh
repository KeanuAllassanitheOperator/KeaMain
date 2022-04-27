#!/bin/bash
curl -s -L "https://github.com/loft-sh/vcluster/releases/latest" | sed -nE 's!.*"([^"]*vcluster-linux-amd64)".*!https://github.com\1!p' | xargs -n 1 curl -L -o vcluster && chmod +x vcluster;
sudo mv vcluster /usr/local/bin;
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
vcluster create vclustertest -n default --expose --distro k3s 

