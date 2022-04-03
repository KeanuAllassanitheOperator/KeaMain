#!/bin/bash
docker-compose -f keagitlab.yaml up -d 
docker restart gitlab-ce
IPMaster=$(hostname -I | cut -d' ' -f1)
echo "Gitlab running as container on Port 8083 on $IPMaster"
