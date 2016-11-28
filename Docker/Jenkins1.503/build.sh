#!/bin/bash
docker stop jenkins1503in
docker rm jenkins1503in
docker rmi jenkins1503
docker build -t jenkins1503 .
docker run --net=host --name jenkins1503in -v C:/Users/Ale/Documents/R/Offensive/Docker/Jenkins1.503/shared:/tmp/tomcat7/shared -i -t jenkins1503
