#!/bin/bash
cont=gitea_db_1
user=root
db=gitea
pw=gitea
sqlfile=giteadb_08-11-2022_17_06_30.sql
cat $sqlfile | docker exec -i $cont /usr/bin/mysql -u $user -p$pw $db
