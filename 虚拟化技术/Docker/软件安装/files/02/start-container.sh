#!/bin/bash

# start gitlab container
sudo docker rm -f gitlab &> /dev/null
echo "start gitlab container..."
sudo docker run -d \
                 --network gitlab-net \
                 -p 3080:80 \
                 -p 3443:443 \
                 -p 3022:22 \
                 --name gitlab \
                 --restart unless-stopped \
                 --hostname gitlab \
                 -v /home/docker/gitlab/etc:/etc/gitlab \
                 -v /home/docker/gitlab/log:/var/log/gitlab \
                 -v /home/docker/gitlab/data:/var/opt/gitlab \
                 twang2218/gitlab-ce-zh &> /dev/null
