#!/bin/bash

# start elasticsearch,kibana,logstash,filebeat container
docker-compose -f /home/docker/elk/script/dc-elk.yml rm --force --stop
echo "start elasticsearch,kibana,logstash,filebeat container..."
docker-compose -f /home/docker/elk/script/dc-elk.yml up -d
