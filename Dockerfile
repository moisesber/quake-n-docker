FROM ubuntu:16.04 as build
MAINTAINER Moises Rodrigues <moisesber@gmail.com>
ENV REFRESHED_AT 2020-07-07

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
  && apt-get install -y \
  curl \
  git \
  libc6-dev \
  unzip \
  wget \
  screen \
  && rm -rf /var/lib/apt/lists/* 

RUN curl -O -s https://raw.githubusercontent.com/nQuake/server-linux/master/src/install_nquakesv.sh \
&& chmod +x install_nquakesv.sh \
  && sleep 1 \
  && ./install_nquakesv.sh -n -q -d /nquakesv \
  && ln -s /root/.nquakesv /etc/nquakesv 

WORKDIR "/nquakesv"

RUN dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install --no-install-recommends gcc-6-base:i386 libc6:i386 libgcc1:i386 libx86-1:i386 curl -y \
  && curl -O -s http://archive.debian.org/debian/pool/main/s/svgalib/libsvga1_1.4.3-33_i386.deb \
  && dpkg -i --force-all libsvga1_1.4.3-33_i386.deb \
  && rm -rf libsvga1_1.4.3-33_i386.deb \
  && curl -O -s http://kauler.com/games/quake1/sqpro350.zip && unzip sqpro350.zip \ 
  && chmod +x sqpro \
  && rm -rf /var/lib/apt/lists/*

COPY scripts/* .

ENTRYPOINT "/nquakesv/quake-n-server.sh"
CMD ["mvdsv", "27500"]
