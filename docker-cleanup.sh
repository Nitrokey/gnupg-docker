#!/usr/bin/env bash

if [ "$EUID" != "0" ]; then
    echo "Running script with root privileges"
	exec sudo bash $0 $@
fi

echo
echo ==== Cleaning up unused Docker data
echo

echo ==== Remove earlier versions of prod1 images
docker images | grep "gpg" | awk '{print $1}' | xargs docker rm

echo ==== Cleaning up exited containers
docker rm $(docker ps -a -f status=exited -q)

echo ==== Cleaning up dangling images
docker rmi $(docker images -f dangling=true -q)

echo ==== Cleaning up dangling volumes
docker volume rm $(docker volume ls -f dangling=true -q)


