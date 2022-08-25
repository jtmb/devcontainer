# Important for automated installs : DEBIAN_FRONTEND=noninteractive : stops installers from asking for prompts outside the standard yes ex: timezones -_-
FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
VOLUME /Users/$(whoami)/Library/CloudStorage/OneDrive-Enterprise365/myapplication:/var/www/html/
EXPOSE 8080:80

# Install NGNIX and PHP
RUN \
	 apt update -y \
  	 && apt-get install -y --no-install-recommends \
       	nginx \
        php-fpm \
		git

# This is not even working, need to look into it more. For now - NGNIX starts via docker exec command in runner.sh
COPY /scripts/commands.sh /scripts/commands.sh
RUN ["chmod", "+x", "/scripts/commands.sh"]
CMD /bin/bash -c bash service nginx start && ./scripts/commands.sh

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>


