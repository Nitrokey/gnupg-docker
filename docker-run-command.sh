#!/usr/bin/env bash

if [ "$EUID" != "0" ]; then
    echo "Run docker image with production tool"
    echo === Disabling automounting on Ubuntu 16.04
    gsettings set org.gnome.desktop.media-handling automount false
    echo === To enable back automounting use:
    echo === gsettings set org.gnome.desktop.media-handling automount true
    echo

    echo "Running script with root privileges"
	exec sudo bash $0 $@
fi

echo === Enabling PC Speaker
modprobe pcspkr

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
