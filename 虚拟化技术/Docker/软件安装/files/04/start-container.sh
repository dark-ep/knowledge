#!/bin/bash

# start mongo container
sudo docker rm -f mongo &> /dev/null
echo "start mongo container..."
sudo docker run -d \
                 -p 27017:27017 \
                 --name mongo \
                 --restart unless-stopped \
                 --hostname mongo \
                 -v /home/docker/mongo/data:/data/db \
                 -v /etc/localtime:/etc/localtime \
                 mongo \
                 --auth &> /dev/null
