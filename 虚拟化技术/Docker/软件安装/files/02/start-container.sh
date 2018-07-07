#!/bin/bash

# start gitlab container
sudo docker rm -f gitlab &> /dev/null
echo "start gitlab container..."
docker-compose -f /home/docker/gitlab/script/dc-gitlab.yml up -d
