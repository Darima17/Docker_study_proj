## Part I

- Взять официальный докер образ с nginx и выкачать его при помощи docker pull
- Проверить наличие докер образа через docker images
<div align="center">

![](images/1.1.png)
<br>
<i>команда docker pull nginx</i>
<i>команда docker docker images</i>

</div>

- Запустить докер образ через docker run -d [image_id|repository]
- Проверить, что образ запустился через docker ps

<div align="center">

![](images/1.2.png)
<br>
<i>команда docker run -d и docker ps</i>

</div>

- Посмотреть информацию о контейнере через docker inspect [container_id|container_name]

<div align="center">

![](images/1.3.png)
![](images/1.3-4.png)
<br>
<i>команда docker inspect[container_id|container_name]</i>

</div>

- По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера
- Остановить докер образ через docker stop [container_id|container_name]
- Проверить, что образ остановился через docker ps
<div align="center">

![](images/1.5.png)
<br>
<i>команда docker ps -s</i>
<i>команда docker stop  [container_id|container_name] и docker ps</i>
</div>

- Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run
do<div align="center">

![](images/1.6.png)
<br>
<i>команда docker run -dp 80:80 -p 443:443  id и docker ps</i>

</div>

- Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx

<div align="center">

![](images/1.7.png)
<br>
<i>вывод localhost:80 в браузере</i>

</div>

- Перезапустить докер контейнер через docker restart [container_id|container_name]

<div align="center">

![](images/1.8.png)
<br>
<i>команда docker restart id и docker ps</i>

</div>

- Проверить любым способом, что контейнер запустился

<div align="center">

![](images/1.9.png)
<br>
<i>повторынй вывод localhost:80 в браузере для проверки запуска контейнера</i>

</div>

## Part II

- Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду exec

<div align="center">

![](images/2.1.png)
<br>
<i>команда docker exec id cat /etc/nginx/nginx.conf</i>

</div>

- Создать на локальной машине файл nginx.conf
- Настроить в нем по пути /status отдачу страницы статуса сервера nginx

<div align="center">

![](images/2.2.png)
<br>
<i>файл nginx.conf</i>

</div>

- Скопировать созданный файл nginx.conf внутрь докер образа через команду docker cp
- Перезапустить nginx внутри докер образа через команду exec

<div align="center">

![](images/2.3.png)
<br>
<i>команда docker cp nginx.conf id:/etc/nginx/ и docker exec id nginx -s reload</i>

</div>

- Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

<div align="center">

![](images/2.4.png)
<br>
<i>вывод localhost:status в браузере</i>

</div>

- Экспортировать контейнер в файл container.tar через команду export
- Остановить контейнер
<div align="center">

![](images/2.5.png)
<br>
<i>команда docker export id > container.tar</i>
<i>команда docker stop id</i>
</div>

- Удалить образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры

<div align="center">

![](images/2.6.png)
<br>
<i>команда docker images -a и docker rmi  id -f</i>

</div>

- Удалить остановленный контейнер

<div align="center">

![](images/2.7.png)
<br>
<i>команда docker rm id</i>

</div>

- Импортировать контейнер обратно через команду import
- Запустить импортированный контейнер
<div align="center">

![](images/2.8.png)
<br>
<i>команда docker import -c 'cmd ["nginx", "-g", "daemon off;"]' -c 'ENTRYPOINT ["/docker-entrypoint.sh"]' container.tar nginx_imp </i>
<i>запуск контейнера командой docker run -dp 80:80 -p 443:443 id</i>

</div>

- Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx 

<div align="center">

![](images/2.9.png)
<br>
<i>вывод localhost:status в браузере и через терминал</i>
</div>

## PART 3

- Написать мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!
- Написать свой nginx.conf , который будет проксировать все запросы с 81 порта на 127.0.0.1:8080
<div align="center">

![](images/3.1.png)
<br>
<i>мини сервер на C и FastCgi</i>
</div>
<div align="center">

![](images/3.2.png)
<br>
</div>
- Запустить написанный мини сервер через spawn-fcgi на порту 8080
<div align="center">

![](images/3.3.png)
<br>
</div>
- Проверить, что в браузере по localhost:81 отдается написанная вами страничка

<div align="center">

![](images/3.4.png)
<br>
<i>вывод localhost:81 в браузере</i>

</div>

## PART 4

- Написать свой докер образ

<div align="center">

![](images/4.1.png)
<br>
</div>

- Собрать написанный докер образ через docker build при этом указав имя и тег

<div align="center">

![](images/4.2.png)
<br>

</div>

- Проверить через docker images, что все собралось корректно

<div align="center">

![](images/4.3.png)
<br>
</div>

- Проверить, что по localhost:80 доступна страничка написанного мини сервера
- Проверить, что теперь по localhost:80/status отдается страничка со статусом nginx

<div align="center">

![](images/4.4.png)
<br>
</div>

## PART 5

- установить dockle запустив скрипт setD.sh

<div align="center">

![](images/5.1.png)
<br>

- Просканировать образ из предыдущего задания через dockle [image_id|repository]

<div align="center">

![](images/5.2.png)
<br>
<i>команда dockle [image_id|repository]</i>

</div>

- Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений

<div align="center">

![](images/5.3.png)
<br>
<i>команда dockle [image_id|repository] без ошибок и предупреждений</i>

</div>

## PART 6

- Написать файл docker-compose.yml
<div align="center">

![](images/6.1.png)
<br>
<i>docker-compose.yml</i>

</div>

- Проверить, что в браузере по localhost:80 отдается написанная вами страничка, как и ранее
<div align="center">

![](images/6.2.png)
<br>
<i>curl localhost:80</i>

</div>
- Остановить все запущенные контейнеры
<div align="center">

![](images/6.3.png)
<br>
