#!/bin/bash
docker stop spring401in
docker rm spring401in
docker rmi spring401
docker build -t spring401 .
docker run --net=host --name spring401in -v c:/Users/Ale/Documents/R/Offensive/Docker/Spring4.0.1/shared:/tmp/tomcat7/shared -i -t spring401
