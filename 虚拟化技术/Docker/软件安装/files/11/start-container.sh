#!/bin/bash

# start rabbitmq container
sudo docker rm -f rabbitmq &> /dev/null
echo "start rabbitmq container..."
sudo docker run -d \
                 -p 5671:5671 \
                 -p 5672:5672 \
                 -p 4369:4369 \
                 -p 25672:25672 \
                 -p 15671:15671 \
                 -p 15672:15672 \
                 --name rabbitmq \
                 --restart unless-stopped \
                 --hostname rabbitmq \
                 -v /etc/localtime:/etc/localtime:ro \
                 -e RABBITMQ_DEFAULT_USER=admin \
                 -e RABBITMQ_DEFAULT_PASS=1qaz2wsx \
                 rabbitmq:management &> /dev/null
