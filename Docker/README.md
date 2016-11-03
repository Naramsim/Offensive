```sh

# List images
docker images

# List containers
docker ps -a

# Build
docker build -t tomcat601 .

# Run
docker run -p 8080:8080 --name tomcat601in -i -t tomcat601
docker run -p 8080:8080 --name tomcat6039in -v C:/Users/Ale/Documents/R/Offensive/Docker/Tomcat6.0.39/shared:/tmp/tomcat6/shared -i -t tomcat6039
# Restart (not useful)
docker restart tomcat601in

# Stop containers
docker stop $(docker ps -a -q)

# rm containers
docker rm $(docker ps -a -q)

# Remove images
docker rmi [image]

# Connect to container
docker exec -it tomcat601in bash

# Create metasploit image 
docker run -i -t --net=host -v C:/Users/Ale/Documents/R/Offensive/Docker/Metasploit/.msf4:/root/.msf4 -v C:/Users/Ale/Documents/R/Offensive/Docker/Metasploit/msf:/tmp/data --name msf phocean/msf

# Re-attach to metasploit
docker restart msf
docker attach msf
```