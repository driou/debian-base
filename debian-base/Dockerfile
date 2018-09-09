# Dockerfile for driou/debian-base on docker hub 
# Debian 9 (stretch) with tools.
FROM debian:9
MAINTAINER Adrien Bourroux  <a.bourroux@gmail.com>

# Copying APT sources.list
COPY sources.list /etc/apt/sources.list

# General Tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	build-essential dnsutils apt-utils curl wget vim git htop nmap tcpdump iotop strace ipcalc zsh 

# Install Zsh 
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 
COPY zshrc /root/.zshrc
RUN chsh -s /bin/zsh

RUN apt-get clean                                                 && \
    rm -rf /var/lib/apt/lists/*  /tmp/*                           
