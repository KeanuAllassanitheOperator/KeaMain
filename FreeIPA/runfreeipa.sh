#!/bin/bash
docker run --name freeipa-server -ti -h ipa.kea.com -p 5353:53 -p 5354:53/udp -p 80:80 -p 443:443 -p 389:389 -p 636:636 -p 88:88 -p 464:464 -p 88:88/udp -p 464:464/udp -p 123:123/udp --read-only --sysctl net.ipv6.conf.all.disable_ipv6=0 -v /var/lib/ipa-data:/data:Z freeipa-rocky8:latest
