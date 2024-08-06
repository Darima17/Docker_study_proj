#!/bin/bash

docker stop first
docker stop second
docker rm first
docker rm second

docker rmi -f server4:v4