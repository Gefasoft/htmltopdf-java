FROM ubuntu:bionic as build

ENV  CFLAGS=-w CXXFLAGS=-w

RUN apt-get update && apt-get install -y -q --no-install-recommends \
    build-essential \
    libfontconfig1-dev \
    libfreetype6-dev \
    libjpeg-turbo8-dev \
    libpng-dev \
    libssl-dev \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    python \
    zlib1g-dev \
    software-properties-common \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*
RUN add-apt-repository -y ppa:openjdk-r/ppa && apt-get update && apt install -y -q --no-install-recommends openjdk-11-jdk
WORKDIR /app/
COPY . /app
RUN /app/gradle/install.sh
RUN /opt/gradle/gradle-5.5/bin/gradle build
CMD bash

 

