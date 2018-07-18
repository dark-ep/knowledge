#!/bin/bash

echo -e "\n"

$HIVE_HOME/bin/schematool -dbType mysql -initSchema

echo -e "\n"