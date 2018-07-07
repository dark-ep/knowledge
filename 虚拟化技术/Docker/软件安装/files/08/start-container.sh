#!/bin/bash

# the default node number is 3
N=${1:-3}

# start spark master container
sudo docker rm -f spark-master &> /dev/null
echo "start spark-master container..."
sudo docker run -itd \
                --net bigdata-net \
                -p 50070:50070 \
                -p 9000:9000 \
                -p 8088:8088 \
                -p 7077:7077 \
                -p 8080:8080 \
                -p 4040:4040 \
                --name spark-master \
                --hostname spark-master \
                -v /etc/localtime:/etc/localtime \
                local/spark:2.3.1 &> /dev/null

# start spark slave container
i=1
while [ $i -lt $N ]
do
        sudo docker rm -f spark-slave$i &> /dev/null
        echo "start spark-slave$i container..."
        sudo docker run -itd \
                        --net bigdata-net \
                        --name spark-slave$i \
                        --hostname spark-slave$i \
                        -v /etc/localtime:/etc/localtime \
                        local/spark:2.3.1 &> /dev/null
        i=$(( $i + 1 ))
done

# get into spark master container
sudo docker exec -it spark-master bash

