#!/bin/bash

# start zk1,zk2,zk3 container
docker-compose -f /home/docker/zk/script/dc-zk.yml rm --force --stop
echo "start zk1,zk2,zk3 container..."
docker-compose -f /home/docker/zk/script/dc-zk.yml up -d
