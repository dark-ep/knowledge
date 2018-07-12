#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
sudo docker build -t local/hadoop:2.7.6 .

echo ""
