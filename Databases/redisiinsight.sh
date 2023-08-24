#!bin/bash
https://redis.com/redis-enterprise/redis-insight/
docker run -d -link ghostfolio-redis-1 --name redis-stack -p 6380:6379 -p 8001:8001 redis/redis-stack:latest
