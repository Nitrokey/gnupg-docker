#!/usr/bin/env bash

if [ "$EUID" != "0" ]; then
    echo "Running script with root privileges"
	exec sudo bash $0 $@
fi

echo === Closing working pcscd on host
killall pcscd scdaemon

DR="docker run -it  --privileged -v /dev:/dev --net=host -v `readlink -f .`:/app  gpg:latest"
if [ -z "$1" ]; then
    # no arguments - run shell
    ${DR} /bin/bash
else
    # run command and exit on completion
    ${DR} $@
fi
