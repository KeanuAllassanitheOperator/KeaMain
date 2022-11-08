#!/bin/bash
cont=rne_db_1
user=root
db=gitea
pw=gitea
sqlfile=giteadb_`date +%d-%m-%Y"_"%H_%M_%S`.sql
docker exec -i $cont /usr/bin/mysqldump -u $user -p$pw -d $db > $sqlfile
