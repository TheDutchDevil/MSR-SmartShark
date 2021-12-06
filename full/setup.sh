#!/bin/bash

wget --continue --progress=do:giga --tries=0 -O /tmp/shark.agz http://141.5.100.155/smartshark_2_1.agz

mongorestore --gzip --archive=/tmp/shark.agz

echo "Restored smartshark DB"

rm /tmp/shark.agz