#!/bin/bash

############################################################
# core functions
############################################################
cd ~
apt-get install -q -y build-essential libfuse-dev fuse-utils libcurl4-openssl-dev libxml2-dev mime-support
apt-get install wget
wget http://s3fs.googlecode.com/files/s3fs-1.59.tar.gz
tar -vxf s3fs-1.59.tar.gz
cd s3fs-1.59
/root/s3fs-1.59/configure --prefix=/usr
make
make install