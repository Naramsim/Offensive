```sh

# List images
docker images

# List containers
docker ps -a

# Build
docker build -t tomcat601 .

# Run
docker run -p 127.0.0.1:8080:8080 --name tomcat601in -i -t tomcat601

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
docker run --rm -i -t -p 9990-9999:9990-9999 -v C:/Users/Ale/Documents/R/Offensive/Docker/Metasploit/.msf4:/root/.msf4 -v C:/Users/Ale/Documents/R/Offensive/Docker/Metasploit/msf:/tmp/data --name msf phocean/msf

# Re-attach to metasploit
docker restart msf
docker attach msf
```