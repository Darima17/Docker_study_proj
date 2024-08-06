FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY fastcgi_server.c /fastcgi_server.c
COPY run.sh /run.sh

RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev
