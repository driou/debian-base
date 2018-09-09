# Dockerfile for Debian 9 (stretch) with Ansible .

# pull base image
FROM debian:9

MAINTAINER Adrien Bourroux  <a.bourroux@gmail.com>

# Copying APT sources.list
COPY sources.list /etc/apt/sources.list

# General Tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	build-essential apt-utils curl wget vim git htop nmap tcpdump iotop strace ipcalc zsh 

# Install Zsh 
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 
COPY zshrc /root/.zshrc
RUN chsh -s /bin/zsh

# Installing python, sudo, and supporting tools..."  && \
RUN apt-get install --fix-missing          && \
    DEBIAN_FRONTEND=noninteractive         \
    apt-get install -y                     \
        python python-yaml sudo            \
        curl gcc python-pip python-dev libffi-dev libssl-dev  && \
    apt-get -y --purge remove python-cffi          && \
    pip install --upgrade cffi pywinrm

# Installing Ansible...
RUN pip install ansible

# Installing handy tools (not absolutely required)..."  && \
RUN apt-get install -y sshpass openssh-client  
    
# Removing unused APT resources...
RUN apt-get -f -y --auto-remove remove \
         gcc python-pip python-dev libffi-dev libssl-dev  && \
    apt-get clean                                                 && \
    rm -rf /var/lib/apt/lists/*  /tmp/*                           
    
# Adding hosts for convenience...
RUN mkdir -p /etc/ansible                              && \
    echo 'localhost' > /etc/ansible/hosts

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
