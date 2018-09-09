# Dockerfile for Debian 9 (stretch) with Ansible .

# pull base image
FROM driou/debian-base

MAINTAINER Adrien Bourroux  <a.bourroux@gmail.com>

# DNS 
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	bind9 && \ 
    apt-get clean                                                 && \
    rm -rf /var/lib/apt/lists/*                          

EXPOSE 53/udp    
EXPOSE 53    
EXPOSE 953

ADD start /start
RUN chmod 755 /start

CMD ["/start"]
