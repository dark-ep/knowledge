#!/bin/bash

echo ""

echo -e "\nbuild docker spark image\n"
sudo docker build -t local/spark:2.3.1 .

echo ""
