FROM ubuntu:16.04
MAINTAINER Sai Vegasena

#apt-dependencies
RUN apt-get update && apt-get install -y \
    apt-utils \
    build-essential \
    git \
    vim \
    cmake \
    python2.7 python2.7-dev python-virtualenv \
    wget \
    gcc-multilib g++-multilib \
    libtinfo-dev \
    lsb-release \
    realpath \
    libssl-dev

#lib-dependencies
RUN dpkg --add-architecture i386 && apt-get -y update && \
    apt-get install -y \
    zip libc6-dev-i386 lib32z1 \
    python2.7-minimal:i386 \
    python2.7:i386 && \
    link /usr/bin/python2.7 /usr/bin/python

#pip-dependencies
RUN apt-get -y install python-pip && \
    pip2 install \ 
    --upgrade pip \
    google-cloud

#ida-dependencies
RUN apt-get -y install --fix-missing \
    lib32gcc1 \
    libc6-i686:i386 \
    libfontconfig:i386 \
    libfreetype6:i386 \
    libglib2.0-0:i386 \
    libpython2.7:i386 \
    libsm6:i386 \
    libssl-dev:i386 \
    libstdc++6:i386 \
    libxext6:i386 \
    libxrender1:i386 \
	lsb-core 

#Cloning McSema
RUN git clone --depth 1 https://github.com/trailofbits/mcsema.git && \
    export REMILL_VERSION=`cat ./mcsema/.remill_commit_id` && \
    git clone https://github.com/trailofbits/remill.git && \
    cd remill && \
    git checkout -b temp ${REMILL_VERSION} && \
    mv ../mcsema tools

ADD mcsema_build.sh /remill/

RUN chmod +x remill/mcsema_build.sh 

WORKDIR /remill

#building and installing mcsema and llvm

RUN ["./mcsema_build.sh"]

WORKDIR /home/mcsema
ENV HOME /home/mcsema

CMD /bin/bash
