FROM debian:stretch
MAINTAINER Ansgar.Burchardt@tu-dresden.de
RUN rm -f /etc/apt/apt.conf.d/docker-gzip-indexes \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get dist-upgrade --no-install-recommends --yes \
  && apt-get install --no-install-recommends --yes \
  autoconf \
  automake \
  bison \
  build-essential \
  ca-certificates \
  clang \
  cmake \
  coinor-libipopt-dev \
  curl \
  flex \
  gfortran \
  git \
  libadolc-dev \
  libboost-dev \
  libboost-program-options-dev \
  libboost-serialization-dev \
  libboost-system-dev \
  libgtest-dev \
  libtinyxml2-dev \
  libltdl-dev \
  libtool \
  mpi-default-bin \
  mpi-default-dev \
  openssh-client \
  python-dev \
  pkg-config \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password --home /duneci duneci
USER duneci
WORKDIR /duneci
RUN mkdir -p /duneci/modules
ENV DUNE_CONTROL_PATH=.:/duneci/modules
COPY opts.clang opts.gcc /duneci/
