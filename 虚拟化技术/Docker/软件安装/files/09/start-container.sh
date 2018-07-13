#!/bin/bash

# start rocketmq-namesrv,rocketmq-broker,rocketmq-console container
docker-compose -f /home/docker/rocketmq/script/dc-rocketmq.yml rm --force --stop
echo "start rocketmq-namesrv,rocketmq-broker,rocketmq-console container..."
docker-compose -f /home/docker/rocketmq/script/dc-rocketmq.yml up -d
