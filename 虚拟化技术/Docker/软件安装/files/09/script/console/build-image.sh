#!/bin/bash

echo ""

echo -e "\nbuild docker rockermq console image\n"
sudo docker build -t local/rocketmq-console:1.0.0 .

echo ""
