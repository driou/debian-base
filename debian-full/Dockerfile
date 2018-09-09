# Dockerfile for driou/debian-base with Ansible .

# pull base image
FROM driou/debian-base

MAINTAINER Adrien Bourroux  <a.bourroux@gmail.com>

# Installing python, sudo, and supporting tools..."  && \
RUN apt-get update 			&& \
    apt-get install --fix-missing          && \
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
