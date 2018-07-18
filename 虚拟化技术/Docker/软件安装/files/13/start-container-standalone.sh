#!/bin/bash

# start hive master container
docker-compose -f /home/docker/hive/script/dc-hive-standalone.yml rm --force --stop
echo "start hive-master container..."
docker-compose -f /home/docker/hive/script/dc-hive-standalone.yml up -d

# get into hive master container
sudo docker exec -it hive-master bash
