#!/bin/bash

wget -O /data/db/shark.agz https://data.goettingen-research-online.de/api/access/datafile/:persistentId?persistentId=doi:10.25625/PHV2VX/TRSQDS

mongorestore --gzip --archive=/data/db/shark.agz

echo "Restored smartshark small DB"

rm /data/db/shark.agz
