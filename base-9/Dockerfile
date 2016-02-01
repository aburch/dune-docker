FROM debian:stretch
MAINTAINER Ansgar.Burchardt@tu-dresden.de
RUN apt-get update && apt-get dist-upgrade --no-install-recommends --yes
RUN apt-get install --no-install-recommends --yes \
  autoconf \
  automake \
  bison \
  build-essential \
  ca-certificates \
  clang \
  cmake \
  coinor-libipopt-dev \
  flex \
  gfortran \
  git \
  libadolc-dev \
  libboost-dev \
  libtinyxml2-dev \
  libltdl-dev \
  libtool \
  mpi-default-bin \
  mpi-default-dev \
  openssh-client \
  python-dev \
  && apt-get clean
RUN adduser --disabled-password --home /duneci duneci
USER duneci
WORKDIR /duneci
