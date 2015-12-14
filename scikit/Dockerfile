# Start with Ubuntu base image
FROM halo9pan/ubuntu
MAINTAINER Halo9Pan <halo9pan@gmail.com>

RUN apt-get install -y \
  bash-completion \
  build-essential \
  python3-dev python3-setuptools python3-pip \
  python3-numpy python3-scipy \
  python3-matplotlib python3-icu python3-pandas python3-pycurl python3-requests python3-urllib3 python3-flask \
  libatlas-dev libatlas3gf-base

RUN update-alternatives --set libblas.so.3 /usr/lib/atlas-base/atlas/libblas.so.3 && \
  update-alternatives --set liblapack.so.3 /usr/lib/atlas-base/atlas/liblapack.so.3

RUN pip3 install -U scikit-learn

