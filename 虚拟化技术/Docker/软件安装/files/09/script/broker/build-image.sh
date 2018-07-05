#!/bin/bash

echo ""

echo -e "\nbuild docker rockermq broker image\n"
sudo docker build -t local/rocketmq-broker:4.2.0 .

echo ""
