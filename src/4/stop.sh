#!/bin/bash

docker stop server2
docker rm server2
docker rmi -f server:v2