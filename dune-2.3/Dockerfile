FROM debian:8
MAINTAINER Ansgar.Burchardt@tu-dresden.de
RUN apt-get update
RUN apt-get dist-upgrade --no-install-recommends --yes
RUN apt-get install --no-install-recommends --yes \
  autoconf \
  automake \
  build-essential \
  ca-certificates \
  clang \
  cmake \
  coinor-libipopt-dev \
  gfortran \
  git \
  libdune-common-dev \
  libdune-geometry-dev \
  libdune-grid-dev \
  libdune-localfunctions-dev \
  libdune-istl-dev \
  libtool \
  openssh-client
RUN apt-get clean
RUN adduser --disabled-password --home /dune dune
USER dune
WORKDIR /dune
