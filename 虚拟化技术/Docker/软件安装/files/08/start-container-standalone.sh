#!/bin/bash

# start spark master container
docker-compose -f /home/docker/spark/script/dc-spark-standalone.yml rm --force --stop
echo "start spark-master container..."
docker-compose -f /home/docker/spark/script/dc-spark-standalone.yml up -d

# get into spark master container
sudo docker exec -it spark-master bash
