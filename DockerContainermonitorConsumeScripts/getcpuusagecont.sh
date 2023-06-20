#!/bin/bash
output=/tmp/output-checkmkcpu.txt
echo -n "0 \"Docker Container CPU Usage\" " > $output
container=$(docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"  | grep -v NAME | cut -d" " -f1)
anzahl=0

for c in $container
do
    # Nur den Prozentwert
     cpu=$(docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" | grep $c | grep -oP "(\d+(\.\d+)?(?=%))")
     if [[ $anzahl -gt 0 ]]; then echo -n "|" >> $output; fi
     echo -n "$c=$cpu" >> $output
     anzahl=1
     #echo $c=$cpu
     #echo $c
done
echo " Container CPU Usage in %" >> $output
echo "" >> $output
cat $output
