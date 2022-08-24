FROM ubuntu:latest

# Install Vault
RUN \
	apt update && apt install -y wget unzip \
	&& wget https://releases.hashicorp.com/vault/1.6.2/vault_1.6.2_linux_amd64.zip \
	&& unzip vault_1.6.2_linux_amd64.zip	

# Install NGNIX
RUN \
	apt install nginx -y && \ 
	service nginx start

# Install Dev and debug Tools
RUN \	
	apt install systemctl -y && \
	apt install ifconfig -y


EXPOSE 8080:80
	
CMD ["/bin/bash"]

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>


