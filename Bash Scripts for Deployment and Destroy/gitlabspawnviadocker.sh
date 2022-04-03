#!/bin/bash
docker-compose -f keagitlab.yaml up -d 
docker restart gitlab-ce
echo "Gitlab running as container on Port 8083"
