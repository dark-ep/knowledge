#!/bin/bash

# the default node number is 3
N=${1:-3}

# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net bigdata-net \
                -p 50070:50070 \
                -p 9000:9000 \
                -p 8088:8088 \
                --name hadoop-master \
                --hostname hadoop-master \
                -v /etc/localtime:/etc/localtime \
                local/hadoop:2.7.6 &> /dev/null

# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net bigdata-net \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                -v /etc/localtime:/etc/localtime \
	                local/hadoop:2.7.6 &> /dev/null
	i=$(( $i + 1 ))
done

# get into hadoop master container
sudo docker exec -it hadoop-master bash
