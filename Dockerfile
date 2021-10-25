FROM ubuntu:latest
LABEL Description="Image for building gpg"

RUN apt update
RUN apt install -y libldap2-dev rng-tools libbz2-dev zlib1g-dev libsqlite3-dev libreadline-dev pcscd scdaemon
RUN apt install -y make wget file pinentry-tty ca-certificates lbzip2 bzip2 gcc
RUN apt clean

ARG GPG_VERSION=2.3.2
ENV GPG_VERSION "gnupg-$GPG_VERSION"

ADD ./download_and_compile.mk /app/
WORKDIR /app/

RUN make -f /app/download_and_compile.mk all

RUN gpg -K
ADD ./gpg-agent.conf ./scdaemon.conf /app/
COPY gpg-agent.conf /root/.gnupg/gpg-agent.conf
COPY scdaemon.conf /root/.gnupg/scdaemon.conf

CMD ["/bin/bash", "/app/start-within-container.sh"]
