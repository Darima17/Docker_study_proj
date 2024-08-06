#!/bin/bash

docker stop server3
docker rm server3
docker rmi -f server:v3