#!/bin/bash

wget --continue --progress=do:giga --tries=0 -O /data/db/shark.agz http://141.5.100.155/smartshark_2_1.agz

mongorestore --gzip --archive=/data/db/shark.agz

echo "Restored smartshark DB"

rm /data/db/shark.agz