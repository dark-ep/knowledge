#!/bin/bash

# start activemq container
sudo docker rm -f activemq &> /dev/null
echo "start activemq container..."
sudo docker run -d \
                 -p 61616:61616 \
                 -p 8161:8161 \
                 --name activemq \
                 --restart unless-stopped \
                 --hostname activemq \
                 -v /etc/localtime:/etc/localtime:ro \
                 rmohr/activemq:5.15.4 &> /dev/null
