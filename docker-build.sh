#!/bin/bash

if [ "$EUID" != "0" ]; then
    echo "Running script with root privileges"
	exec sudo bash $0 $@
fi


echo
echo ==== Building Production Tool Docker image
echo

echo $@
docker build $@ -t gpg . 

rm test-suite.zip -v
yes | wget -c -O test-suite.zip https://github.com/Nitrokey/nitrokey-test-suite/archive/master.zip
yes | unzip test-suite.zip

