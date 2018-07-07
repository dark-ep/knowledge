#!/bin/bash

# start redis-slave1 container
sudo docker rm -f redis-slave1 &> /dev/null
echo "start redis-slave1 container..."
sudo docker run -d \
                 -p 6380:6379 \
                 --name redis-slave1 \
                 --restart unless-stopped \
                 --hostname redis-slave1 \
                 --net redis-net \
                 -v /home/docker/redis/data/slave1/:/data \
                 -v /home/docker/redis/etc/slave.conf:/etc/redis/redis.conf \
                 -v /etc/localtime:/etc/localtime \
                 redis \
                 redis-server /etc/redis/redis.conf &> /dev/null
