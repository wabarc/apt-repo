FROM debian:stable-slim

RUN apt update && apt install -y --no-install-recommends \
    apache2 \
    apt-utils \
    dpkg-dev \
    dpkg-sig \
    gnupg2 \
    gpg-agent

WORKDIR /apt-repo

COPY . .

CMD ["/bin/sh", "entrypoint.sh"]
