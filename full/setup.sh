#!/bin/bash

wget -O /tmp/shark.agz https://data.goettingen-research-online.de/api/access/datafile/:persistentId?persistentId=doi:10.25625/7OZ1SP/CUOQ6K

mongorestore --gzip --archive=/tmp/shark.agz

echo "Restored smartshark DB"

rm /tmp/shark.agz