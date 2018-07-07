#!/bin/bash

# start mysql container
sudo docker rm -f mysql &> /dev/null
echo "start mysql container..."
sudo docker run -d \
                 -p 3306:3306 \
                 --name mysql \
                 --restart unless-stopped \
                 --hostname mysql \
                 -v /home/docker/mysql/etc/conf.d:/etc/mysql/conf.d \
                 -v /home/docker/mysql/data:/var/lib/mysql \
                 -v /etc/localtime:/etc/localtime \
                 -e MYSQL_ROOT_PASSWORD=1qaz2wsx \
                 mysql &> /dev/null