#!/bin/bash

gcc ./fastcgi_server.c -l fcgi -o ./fcgi_server
spawn-fcgi -p 8080 ./fcgi_server
nginx -g 'daemon off;'
nginx -s reload