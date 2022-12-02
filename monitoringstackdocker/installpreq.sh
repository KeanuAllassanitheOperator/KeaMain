#!/bin/bash
git clone https://github.com/stefanprodan/dockprom
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
wget https://raw.githubusercontent.com/grafana/loki/v2.7.0/cmd/loki/loki-local-config.yaml -O /root/loki-config.yaml
wget https://raw.githubusercontent.com/grafana/loki/v2.7.0/cmd/loki/loki-local-config.yaml -O /root/promtail-config.yaml
