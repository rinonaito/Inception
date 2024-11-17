#!/bin/bash

COUNTRY="JP"
STATE="Tokyo"
LOCALITY="Shinjuku"
ORGANIZATION="42"
ORG_UNIT="Cluster"
COMMON="rnaito.42.fr"
EMAIL="rnaito@student.42tokyo.jp"

mkdir /etc/nginx/ssl
openssl genrsa -out /etc/nginx/ssl/server.key 2048
openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORG_UNIT/CN=$COMMON/emailAddress=$EMAIL"
openssl x509 -days 3650 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt

exec "$@"
