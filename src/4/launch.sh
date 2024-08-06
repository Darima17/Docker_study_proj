#!/bin/bash

docker build . -t server:v2 
#Name and optionally a tag in the name:tag format
docker images

docker run --name server2 -p 80:81 -d server:v2
docker exec server2 bash run.sh
sleep 2

echo ""
curl localhost:80
echo ""
curl localhost:80/status
echo ""