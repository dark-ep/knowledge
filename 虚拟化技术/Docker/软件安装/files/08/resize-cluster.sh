#!/bin/bash

# N is the node number of spark cluster
N=$1

if [ $# = 0 ]
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

echo ""

echo -e "\nbuild docker spark image\n"

# rebuild local/spark image
sudo docker build -t local/spark:2.3.1 .

echo ""
