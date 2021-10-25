#!/bin/bash

if [ "$EUID" != "0" ]; then
    echo "Running script with root privileges"
	exec sudo bash $0 $@
fi


echo
echo ==== Building Docker image
echo

docker build -t gpg . $@
