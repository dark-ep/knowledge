#!/bin/bash

# N is the node number of hadoop cluster
N=$1

if [ $N = 0 ]
then
	echo "Please specify the node number of hadoop cluster!"
	exit 1
fi

# change slaves file
i=1
rm -rf config/slaves
while [ $i -lt $N ]
do
	echo "hadoop-slave$i" >> config/slaves
	((i++))
done

# update hdfs-site.xml 'dfs.replication'
sed -i "s|<value>\([0-9]\)</value>|<value>$N</value>|g" config/hdfs-site.xml

# start hadoop-master hadoop-slave container
docker-compose -f /home/docker/hadoop/script/dc-hadoop-cluster.yml rm --force --stop
echo "start hadoop-master container..."
docker-compose -f /home/docker/hadoop/script/dc-hadoop-cluster.yml up -d

i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net bigdata-net \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                -v /etc/localtime:/etc/localtime:ro \
	                -v /home/docker/hadoop/config/hdfs-site.xml:/usr/local/hadoop/etc/hadoop/hdfs-site.xml \
	                -v /home/docker/hadoop/config/slaves:/usr/local/hadoop/etc/hadoop/slaves \
	                local/hadoop:2.7.6 &> /dev/null
	i=$(( $i + 1 ))
done

# get into hadoop master container
sudo docker exec -it hadoop-master bash
