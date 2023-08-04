#!/bin/bash
sudo git clone -b release https://github.com/netbox-community/netbox-docker.git
cd netbox-docker
cat << EOF > docker-compose.override.yml
version: '3.4'
services:
 netbox:
   ports:
    - 8000:8080
EOF
sudo docker-compose pull
sudo docker-compose up -d

