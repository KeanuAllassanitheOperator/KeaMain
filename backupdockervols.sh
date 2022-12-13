#!/bin/bash
volpath=/var/lib/docker/volumes
cppath=/root/volbackups
cp -r $volpath $cppath`date +%d-%m-%Y"_"%H_%M_%S`
