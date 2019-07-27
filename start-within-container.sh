cp /app/scdaemon.conf /root/.gnupg/scdaemon.conf -v
mv /app/scdaemon.log{,-old} --backup=numbered -v
gpg -K

gpg-connect-agent /bye
pcscd
#/usr/local/libexec/scdaemon --daemon
gpg --card-edit

echo "File ./scdaemon.log contains the current log of GnuPG communication with the smart card device."
