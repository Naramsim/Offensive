#!/bin/bash
docker stop jenkins1531in
docker rm jenkins1531in
docker rmi jenkins1531
docker build -t jenkins1531 .
docker run --net=host --name jenkins1531in -v C:/Users/Ale/Documents/R/Offensive/Docker/Jenkins1.531/shared:/tmp/tomcat7/shared -i -t jenkins1531
