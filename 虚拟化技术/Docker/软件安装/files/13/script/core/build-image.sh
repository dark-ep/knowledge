#!/bin/bash

echo ""

echo -e "\nbuild docker hive image\n"
sudo docker build -t local/hive:2.3.3 .

echo ""
