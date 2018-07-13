#!/bin/bash

# start hadoop master container
docker-compose -f /home/docker/hadoop/script/dc-hadoop-standalone.yml rm --force --stop
echo "start hadoop-master container..."
docker-compose -f /home/docker/hadoop/script/dc-hadoop-standalone.yml up -d

# get into hadoop master container
sudo docker exec -it hadoop-master bash
