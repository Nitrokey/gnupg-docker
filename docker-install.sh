#!/bin/bash

if [ "$EUID" != "0" ]; then
    echo "Script to install latest version of Docker on Ubuntu 16.04+ through official Docker apt-get repository"
    echo "Running script with root privileges"
	exec sudo bash $0 $@
fi

apt-get remove docker docker-engine docker.io
apt-get install  apt-transport-https  ca-certificates  curl  software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88 | tee key.tmp
grep '9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88' key.tmp && echo -e "\n\n\n\n !!! Repository key seems to be incorrect \n\n\n\n"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce
docker run hello-world
