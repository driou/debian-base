# A basic debian configuration with sources
FROM debian
MAINTAINER Adrien Bourroux <a.bourroux@gmail.com>

# Adding APT Sources.list
RUN echo "deb http://ftp.fr.debian.org/debian/ jessie main contrib non-free" > /etc/apt/sources.list
RUN echo "deb-src http://ftp.fr.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://ftp.fr.debian.org/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.fr.debian.org/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list

# Updating Package List
RUN apt-get update

# Installing Tools
RUN apt-get install -y curl \
		wget \
		vim \
		git \
		htop \
		tcpdump \
		iotop \
		strace

