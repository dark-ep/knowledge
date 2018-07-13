#!/bin/bash

# start elasticsearch container
sudo docker rm -f es &> /dev/null
echo "start elasticsearch container..."
sudo docker run -d \
                 -p 9200:9200 \
                 -p 9300:9300 \
                 --name es \
                 --restart unless-stopped \
                 --hostname es \
                 -v /etc/localtime:/etc/localtime:ro \
                 -v /home/docker/es/data:/usr/share/elasticsearch/data \
                 elasticsearch \
                 -Etransport.host=0.0.0.0 \
                 &> /dev/null
