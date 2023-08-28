#!/bin/bash
output=/tmp/output-checkmkmem.txt
echo -n "0 \"Docker Container Memory Usage\" " > $output
container=$(docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"  | grep -v NAME | cut -d" " -f1)
anzahl=0

for c in $container
do
     mem=$(docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" | grep $c | rev | cut -d" " -f3 | rev | sed 's/MiB//g' | cut -d"." -f1)
     #echo $mem
     memmb=$(($mem * 1024 * 1024 / 1000 / 1000 ))
     echo $memmb
     if [[ $anzahl -gt 0 ]]; then echo -n "|" >> $output; fi
     echo -n "$c=$mem" >> $output
     anzahl=1
     #echo $c=$cpu
     #echo $c
done
echo " Container Memory Usage in MB" >> $output
echo "" >> $output
cat $output

