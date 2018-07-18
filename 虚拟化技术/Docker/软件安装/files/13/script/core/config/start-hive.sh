#!/bin/bash

echo -e "\n"

nohup $HIVE_HOME/bin/hive --service metastore > /root/hive/log/metastore.log 2>&1 &

echo -e "\n"

nohup $HIVE_HOME/bin/hive --service hiveserver2 > /root/hive/log/hiveserver2.log 2>&1 &

echo -e "\n"