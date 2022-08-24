docker image rm -f ubuntu-srv-image

docker rm -f ubuntu-srv

docker build -t ubuntu-srv-image .

docker run -d -t -p 8080:80 -v /Users/$(whoami)/Library/CloudStorage/OneDrive-Enterprise365/myapplication:/var/www/html/ --name ubuntu-srv ubuntu-srv-image 
docker exec -it ubuntu-srv /bin/bash