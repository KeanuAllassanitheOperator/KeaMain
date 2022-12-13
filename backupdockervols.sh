#!/bin/bash
volpath=/var/lib/docker/volumes
cppath=/root/volbackups
cp -r $volpath $cppath
tar cvfz dockervols.tar.gz $cppath
