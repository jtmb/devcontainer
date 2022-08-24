FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

# Install Vault
# RUN \
# 	apt update && apt install -y wget unzip \ 
# 	&& apt install gpg -y \
# 	&& wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null \
# 	&& gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint \
# 	&& echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
# 	&& apt install vault -y
	
# Install NGNIX and PHP
RUN \
	 apt update -y \
  	 && apt-get install -y --no-install-recommends \
       	nginx \
        php-fpm

# Start Service
RUN \
	 service nginx start /
	&& service restart ngnix

EXPOSE 8080:80
	
CMD ["/bin/bash"]

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>


