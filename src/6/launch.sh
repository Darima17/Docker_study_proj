#!/bin/bash

docker-compose build
docker-compose up -d
docker images

sleep 3

echo ""
curl localhost:80
echo ""
curl localhost:80/status
echo ""