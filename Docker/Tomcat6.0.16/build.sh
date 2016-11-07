#!/bin/bash
docker stop tomcat6013in
docker rm tomcat6013in
docker rmi tomcat6013
docker build -t tomcat6013 .
# -p parameter is useless
docker run --net=host --name tomcat6013in -i -t tomcat6013
