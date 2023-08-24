#!/bin/bash
# Open Source DB Management Tool für Entwickler unterstützt in der Open Source Edition sich mit verschienen DB-Servern zu verbinden. 
# CLick House, Db2 IBM, Derby Server, Firebird, H2 Embedded, Trino, PSQL, Oracle, Mysql, MariaDB, Oracle, MSSQL, SQLite, Db2 
# Redis, NoSQL, AWS und Neo4j, Graphql kosten Geld EE Image
docker run --name cloudbeaver-ce -d --restart unless-stopped -p 8080:8978 -v /var/cloudbeaver/workspace:/opt/cloudbeaver/workspace dbeaver/cloudbeaver:latest
