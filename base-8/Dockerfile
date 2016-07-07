FROM debian:8
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
  libltdl-dev \
  libtinyxml2-dev \
  libtool \
  mpi-default-bin \
  mpi-default-dev \
  openssh-client \
  pkg-config \
  python-dev \
  python3 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password --home /duneci duneci
USER duneci
WORKDIR /duneci
RUN mkdir -p /duneci/bin /duneci/modules
ENV DUNE_CONTROL_PATH=.:/duneci/modules
ENV PATH=/duneci/bin:$PATH
COPY opts.clang opts.gcc /duneci/
COPY duneci-ctest /duneci/bin/
