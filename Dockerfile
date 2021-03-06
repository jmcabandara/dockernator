# ProTECT base Dockerfile for all images
#
# 
# Build with: sudo docker build --force-rm --no-cache -t aarjunrao/pimmuno - < Dockerfile

# Use ubuntu Trusty 14.04
FROM ubuntu:14.04

MAINTAINER Arjun Rao aarjunrao@soe.ucsc.edu

WORKDIR /home
# Get the essentials
RUN apt-get update && apt-get install -y \
        software-properties-common \
        wget \
        libgomp1 \
        curl \
        build-essential \
        checkinstall \
        git \
        openjdk-7-jre \
        maven \
        python-dev \
        libpng-dev \
        ncurses-dev

# Install zlib for samtools
RUN curl -L http://zlib.net/zlib-1.2.8.tar.gz > zlib-1.2.8.tar.gz 
RUN tar -zxvf zlib-1.2.8.tar.gz ; rm zlib-1.2.8.tar.gz
WORKDIR zlib-1.2.8
RUN ./configure ; make install; cd ../
WORKDIR /home
