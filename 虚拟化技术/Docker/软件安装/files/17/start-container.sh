#!/bin/bash
  
# start jenkins container
sudo docker rm -f jenkins &> /dev/null
echo "start jenkins container..."
sudo docker run -u root \
                -d \
                -p 38080:8080 \
                -p 50000:50000 \
                --name jenkins \
                --restart unless-stopped \
                --hostname jenkins \
                -e JENKINS_OPTS="--prefix=/jenkins" \
                -v /home/docker/jenkins/data:/var/jenkins_home \
                jenkins/jenkins &> /dev/null