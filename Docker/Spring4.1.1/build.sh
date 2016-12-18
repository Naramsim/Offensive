#!/bin/bash
docker stop spring411in
docker rm spring411in
docker build -t spring411 .
docker run --net=host --name spring411in -v C:/Users/Ale/Documents/R/Offensive/Docker/Spring4.1.1/shared:/tmp/tomcat7/shared -i -t spring411
