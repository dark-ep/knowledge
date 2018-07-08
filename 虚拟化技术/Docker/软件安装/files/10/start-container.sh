#!/bin/bash

# start kafka-zk,kafka1,kafka2,kafka3,kafka-manager container
sudo docker rm -f kafka-zk &> /dev/null
sudo docker rm -f kafka1 &> /dev/null
sudo docker rm -f kafka2 &> /dev/null
sudo docker rm -f kafka3 &> /dev/null
sudo docker rm -f kafka-manager &> /dev/null
echo "start kafka-zk,kafka1,kafka2,kafka3,kafka-manager container..."
docker-compose -f /home/docker/kafka/script/dc-kafka.yml up -d
