#https://hub.docker.com/_/influxdb
docker run -d --name influx-db -p 8086:8086 -v influxvol:/var/lib/influxdb2 influxdb:latest
