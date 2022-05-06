#!/bin/bash
sudo git clone -b release https://github.com/netbox-community/netbox-docker.git
cd netbox-docker
cat docker-compose.override.yml <<EOF
version: '3.4'
services:
  netbox:

   ports:

     - 8000:8080

EOF

docker-compose pull
docker-compose up -d 
