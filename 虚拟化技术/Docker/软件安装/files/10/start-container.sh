#!/bin/bash

# start kafka-zk,kafka1,kafka2,kafka3,kafka-manager container
docker-compose -f /home/docker/kafka/script/dc-kafka.yml rm --force --stop
echo "start kafka-zk,kafka1,kafka2,kafka3,kafka-manager container..."
docker-compose -f /home/docker/kafka/script/dc-kafka.yml up -d
