cp /app/scdaemon.conf /root/.gnupg/scdaemon.conf -v
gpg -K

gpg-connect-agent /bye
pcscd
cd nitrokey-test-suite-master || exit
# env GPG_TTY=$(tty) 
behave -s --no-capture --no-capture-stderr  -x
