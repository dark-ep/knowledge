#!/bin/bash

# N is the node number of spark cluster
N=$1

if [ $N = 0 ]
then
	echo "Please specify the node number of spark cluster!"
	exit 1
fi

# change slaves file
i=1
rm config/slaves
while [ $i -lt $N ]
do
	echo "spark-slave$i" >> config/slaves
	((i++))
done

# update hdfs-site.xml 'dfs.replication'
sed -i "s|<value>\([0-9]\)</value>|<value>$N</value>|g" config/hdfs-site.xml

# start spark-master spark-slave container
sudo docker rm -f spark-master &> /dev/null
echo "start spark-master container..."
docker-compose -f /home/docker/spark/script/dc-spark-cluster.yml up -d

i=1
while [ $i -lt $N ]
do
	sudo docker rm -f spark-slave$i &> /dev/null
	echo "start spark-slave$i container..."
	sudo docker run -itd \
	                --net bigdata-net \
	                --name spark-slave$i \
	                --hostname spark-slave$i \
	                -v /etc/localtime:/etc/localtime:ro \
	                -v /home/docker/spark/config/hdfs-site.xml:/usr/local/hadoop/etc/hadoop/hdfs-site.xml \
	                -v /home/docker/spark/config/slaves:/usr/local/hadoop/etc/hadoop/slaves \
	                -v /home/docker/spark/config/slaves:/usr/local/spark/conf/slaves \
	                local/spark:2.3.1 &> /dev/null
	i=$(( $i + 1 ))
done

# get into spark master container
sudo docker exec -it spark-master bash
