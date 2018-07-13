#!/bin/bash

# start gitlab container
docker-compose -f /home/docker/gitlab/script/dc-gitlab.yml rm --force --stop
echo "start gitlab container..."
docker-compose -f /home/docker/gitlab/script/dc-gitlab.yml up -d
