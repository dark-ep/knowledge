#!/bin/bash

# start rocketmq-namesrv,rocketmq-broker,rocketmq-console container
sudo docker rm -f rocketmq-namesrv &> /dev/null
sudo docker rm -f rocketmq-broker-a &> /dev/null
sudo docker rm -f rocketmq-broker-a-s &> /dev/null
sudo docker rm -f rocketmq-broker-b &> /dev/null
sudo docker rm -f rocketmq-broker-b-s &> /dev/null
sudo docker rm -f rocketmq-console &> /dev/null
echo "start rocketmq-namesrv,rocketmq-broker,rocketmq-console container..."
docker-compose -f /home/docker/rocketmq/script/dc-rocketmq.yml up -d
