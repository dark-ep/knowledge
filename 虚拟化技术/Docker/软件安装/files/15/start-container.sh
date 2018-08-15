#!/bin/bash

# start zipkin-server container
sudo docker rm -f zipkin-server &> /dev/null
echo "start zipkin-server container..."
sudo docker run -d \
                 -p 9411:9411 \
                 --name zipkin-server \
                 --restart unless-stopped \
                 --hostname zipkin-server \
                 openzipkin/zipkin &> /dev/null
