# Dockerfile perl-music
FROM acdaic4v/ubuntu-perl-base:v1
MAINTAINER sloervi McMurphy <docker@sloervi.de>

LABEL Description="Create Docker Image ffor downloading BBC Radio Shows with get_iplayer" Vendor="sloervi McMurphy" Version="1"

# Pakete nachinstallieren
RUN apt-get update && apt-get install -y rtmpdump ffmpeg lame libid3-tools

# Install get_iplayer
RUN mkdir -p /usr/local/bin && cd /usr/local/bin && git clone git://git.infradead.org/get_iplayer.git

# Create User and group
RUN groupadd -r bbc && useradd -r -g bbc bbc

VOLUME /data
VOLUME /config
VOLUME /usr/local/bin/bbc

ENTRYPOINT /usr/local/bin/bbc/bbc.sh
