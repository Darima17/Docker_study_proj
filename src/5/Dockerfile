FROM nginx

WORKDIR /home/
COPY nginx.conf /etc/nginx/nginx.conf
COPY fastcgi_server.c /home/fastcgi_server.c
COPY run.sh /home/run.sh

RUN apt update && apt install -y gcc spawn-fcgi libfcgi-dev ; \
    rm -rf /var/lib/apt/lists/*; \
    useradd nginx; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home/; \
    touch /var/run/nginx.pid && chown -R nginx:nginx /var/run/nginx.pid; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /usr/bin/chfn; \
    chmod g-s /usr/bin/expiry; \
    chmod u-s /usr/bin/passwd; \
    chmod g-s /sbin/unix_chkpwd; \
    chmod g-s /usr/bin/chage; \
    chmod g-s /usr/bin/wall; \
    chmod u-s /bin/umount; \
    chmod u-s /bin/mount; \
    chmod u-s /usr/bin/newgrp; \
    chmod u-s /bin/su; \
    chmod u-s /usr/bin/chsh;

USER nginx


HEALTHCHECK CMD curl http://localhost:81/ || exit 1

ENTRYPOINT ["bash", "/home/run.sh"]