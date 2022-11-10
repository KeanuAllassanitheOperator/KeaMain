#!/bin/bash
# Script um in Linux durch zwei Listen zu iterieren
emails=()
ips=()
# Arrays befüllen
for e in $(cat plaintextusers.txt | cut -d" " -f1);
do 
 emails+=( $e )
 #echo $e
done

for i in $(cat plaintextusers.txt | cut -d" " -f2);
do
 ips+=( $i )
 #echo $i
done
# Checken ob der Append geklappt hat
for e in "${emails[@]}"
do 
 echo "Email in array Email: $e"
 sleep 0.5
done

for i in "${ips[@]}"
do
 echo "IP in Array IP: $i"
 sleep 0.5
done

# Die zwei Listen zusammenfügen und durchiterieren
for ((i=0;i<${#emails[@]};i++))
do 
    IP=${ips[$i]}
    Email=${emails[$i]}  
    echo "$Email + $IP";
    sleep 0.5
done
