#!/bin/bash
#https://www.vcluster.com/
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
vcluster delete vclustertest -n default
