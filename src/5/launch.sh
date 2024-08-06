#!/bin/bash

export DOCKER_CONTENT_TRUST=1
docker build . -t server:v3
#Name and optionally a tag in the name:tag format
docker images

export DOCKER_CONTENT_TRUST=0
docker run --name server3 -p 80:81 -d server:v3
docker exec server3 bash run.sh
sleep 3

echo ""
curl localhost:80
echo ""
curl localhost:80/status
echo ""
dockle -ak NGINX_GPGKEY -ak NGINX_GPGKEY_PATH server:v3