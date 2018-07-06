#!/bin/bash

# start zk1,zk2,zk3 container
sudo docker rm -f zk1 &> /dev/null
sudo docker rm -f zk2 &> /dev/null
sudo docker rm -f zk3 &> /dev/null
echo "start zk1,zk2,zk3 container..."
docker-compose -f /home/docker/zk/script/dc-zk.yml up -d
