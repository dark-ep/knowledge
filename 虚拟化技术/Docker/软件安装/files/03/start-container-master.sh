#!/bin/bash

# start redis-master container
sudo docker rm -f redis-master &> /dev/null
echo "start redis-master container..."
sudo docker run -d \
                 -p 6379:6379 \
                 --name redis-master \
                 --restart unless-stopped \
                 --hostname redis-master \
                 --net redis-net \
                 -v /home/docker/redis/data/master/:/data \
                 -v /home/docker/redis/etc/master.conf:/etc/redis/redis.conf \
                 -v /etc/localtime:/etc/localtime \
                 redis \
                 redis-server /etc/redis/redis.conf &> /dev/null
