#!/bin/bash

echo ""

echo -e "\nbuild docker rockermq namesrv image\n"
sudo docker build -t local/rocketmq-namesrv:4.2.0 .

echo ""
