#!/bin/bash

# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
docker-compose -f /home/docker/hadoop/script/dc-hadoop-standalone.yml up -d

# get into hadoop master container
sudo docker exec -it hadoop-master bash
