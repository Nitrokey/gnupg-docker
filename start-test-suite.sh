cp /app/scdaemon.conf /root/.gnupg/scdaemon.conf -v
mv /app/scdaemon.log{,-old} --backup=numbered -v
gpg -K

gpg-connect-agent /bye
pcscd
cd nitrokey-test-suite-master || exit
# env GPG_TTY=$(tty) 
behave -s --no-capture --no-capture-stderr  -x

echo "File ./scdaemon.log contains the current log of GnuPG communication with the smart card device."

