# Remove Image
docker image rm -f ubuntu-srv-image
# Remove container
docker rm -f ubuntu-srv
# Build Container
docker build -t ubuntu-srv-image .
# Docker Run Command. Volume mounts are here as well for redundancy
docker run -d -t -p 8080:80 -v /Users/$(whoami)/Library/CloudStorage/OneDrive-Enterprise365/myapplication:/var/www/html/ --name ubuntu-srv ubuntu-srv-image 
# Start NGNIX after Container is build (after runtime)
docker exec -it ubuntu-srv service nginx start
# Connect to container session
docker exec -it ubuntu-srv /bin/bash
