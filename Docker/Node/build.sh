#!/bin/bash
docker stop nodein
docker rm nodein
docker build -t node .
docker run --net=host --name nodein -v C:/Users/Ale/Documents/R/Offensive/Docker/Node/shared:/tmp/shared -i -t node
