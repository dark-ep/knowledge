#!/bin/bash

# start nginx container
sudo docker rm -f nginx &> /dev/null
echo "start nginx container..."
sudo docker run -d \
                 --network host \
                 --name nginx \
                 --restart unless-stopped \
                 --hostname nginx \
                 -v /home/docker/nginx/etc/nginx.conf:/etc/nginx/nginx.conf:ro \
                 -v /home/docker/nginx/etc/conf.d:/etc/nginx/conf.d \
                 -v /home/docker/nginx/log:/var/log/nginx \
                 -v /home/docker/nginx/content:/usr/share/nginx/html:ro \
                 nginx &> /dev/null
