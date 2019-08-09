#!/bin/bash

cp /app/scdaemon.conf /root/.gnupg/scdaemon.conf -v
mv /app/scdaemon.log{,-old} --backup=numbered -v
gpg -K

gpg-connect-agent /bye
killall pcscd scdaemon
pcscd
gpg-connect-agent /bye
#/usr/local/libexec/scdaemon --daemon
#gpg --card-edit
#gpg --card-status
cd nitroinit
echo "Please enter your commands"
echo "Enter ./nitroinit to run Nitroinit project"
bash

echo "File ./scdaemon.log contains the current log of GnuPG communication with the smart card device."
