#!/bin/bash
docker stop tomcat6039in
docker rm tomcat6039in
docker rmi tomcat6039
docker build -t tomcat6039 .
docker run -p 8080:8080 --name tomcat6039in -v C:/Users/Ale/Documents/R/Offensive/Docker/Tomcat6.0.39/shared:/tmp/tomcat6/shared -i -t tomcat6039
