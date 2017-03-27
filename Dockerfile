FROM debian:8
MAINTAINER Adrien Bourroux <a.bourroux@gmail.com>

## Commande
## docker run --rm --hostname dockerlocal -ti base /bin/zsh

# Copying APT sources.list
COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
# General Tools
       build-essential curl wget vim git htop nmap tcpdump iotop strace ipcalc zsh \
# Required for Ansible
       libffi-dev libssl-dev python-pip python-dev \

# Install Oh-My-Zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Install SSH Client + SSHPass
RUN apt-get update \ 
    && apt-get install -y --no-install-recomments \
       openssh-client sshpass

# Install Ansible via PIP packages
RUN pip install ansible cryptography
 
# Set ZSH Config to use Oh-My-Zsh
COPY zshrc /root/.zshrc

# Clean APT
RUN rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean
#
WORKDIR /data
