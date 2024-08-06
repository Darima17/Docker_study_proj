# Simple Docker

Introduction to docker. Developing a simple docker image for your own server.

## Tasks

Part 1. Ready-made docker
Take the official docker image from nginx and download it using docker pull.
Check for the docker image with docker images.
Run docker image with docker run -d [image_id|repository].
Check that the image is running with docker ps.
View container information with docker inspect [container_id|container_name].
Define and write in the report the container size, list of mapped ports, and container ip.
Stop docker image with docker stop [container_id|container_name].
Check that the image has stopped with docker ps.
Run docker with ports 80 and 443 in container, mapped to the same ports on the local machine, with run command.
Check that nginx start page is available in the browser at localhost:80.
Restart docker container with docker restart [container_id|container_name].
Check in any way that the container is running.

Part 2. Operations with container
Read the nginx.conf configuration file inside the docker container with the exec command.
Create a nginx.conf file on a local machine.
Configure it on the /status path to return the nginx server status page.
Copy the created nginx.conf file inside the docker image using the docker cp command.
Restart nginx inside the docker image with exec.
Check that localhost:80/status returns the nginx server status page.
Export the container to a container.tar file with the export command.
Stop the container.
Delete the image with docker rmi [image_id|repository] without removing the container first.
Delete stopped container.
Import the container back using the import command.
Run the imported container.
Check that localhost:80/status returns the nginx server status page.

Part 3. Mini web server
Write a mini server in C and FastCgi that will return a simple page saying Hello World!.

Part 4. Your own docker
Build your own docker image that:

builds mini server sources on FastCgi from Part 3.
runs it on port 8080.
copies inside the image written ./nginx/nginx.conf.
runs nginx.
Build the written docker image with docker build, specifying the name and tag.
Check with docker images that everything is built correctly.
Run the built docker image by mapping port 81 to 80 on the local machine and mapping the ./nginx folder inside the container to the address where the nginx configuration files are located.