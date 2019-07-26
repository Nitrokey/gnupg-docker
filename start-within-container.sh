gpg -K

gpg-connect-agent /bye
pcscd
#/usr/local/libexec/scdaemon --daemon
cp /app/scdaemon.conf /root/.gnupg/scdaemon.conf -v
gpg --card-edit
