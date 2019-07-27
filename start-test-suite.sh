cp /app/scdaemon.conf /root/.gnupg/scdaemon.conf -v
gpg -K

gpg-connect-agent /bye
pcscd
env GPG_TTY=$(tty) behave -s --no-capture --no-capture-stderr 
