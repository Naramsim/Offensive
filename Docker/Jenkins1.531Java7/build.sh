#!/bin/bash
docker stop jenkins1531java7in
docker rm jenkins1531java7in
docker rmi jenkins1531java7
docker build -t jenkins1531java7 .
docker run -p 8080:8080 --name jenkins1531java7in -v C:/Users/Ale/Documents/R/Offensive/Docker/Jenkins1.531Java7/shared:/tmp/tomcat7/shared -i -t jenkins1531java7
