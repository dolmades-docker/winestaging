FROM dolmades/base:1.2

MAINTAINER Stefan Kombrink

# staging recently needs new libfaudio
RUN add-apt-repository -y ppa:cybermax-dexter/sdl2-backport
# install wine staging
RUN apt-get update && apt-get install -y winehq-staging && apt-get clean && rm -rf /var/lib/apt/lists/*
# install & update winetricks
COPY winetricks.deb /winetricks.deb
RUN apt-get update && apt-get install -y binutils cabextract p7zip unzip && dpkg -i /winetricks.deb && winetricks --self-update && apt-get clean && rm -rf /var/lib/apt/lists/* && rm -f /winetricks.deb
