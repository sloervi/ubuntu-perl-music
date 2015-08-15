# Dockerfile perl-music
FROM acdaic4v/perl-base
MAINTAINER sloervi McMurphy <docker@sloervi.de>

# Pakete nachinstallieren
RUN apt-get update && apt-get install -y rtmpdump ffmpeg lame libid3-tools

