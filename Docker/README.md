```sh

# List images
docker images

# List containers
docker ps -a

# Build
docker build -t tomcat6 .

# Run
docker run -p 127.0.0.1:8080:8080 --name tomcat6in -i -t tomcat6

# Restart (not useful)
docker restart tomcat6in

# Stop containers
docker stop $(docker ps -a -q)

# rm containers
docker rm $(docker ps -a -q)

# Remove images
docker rmi [image]

```