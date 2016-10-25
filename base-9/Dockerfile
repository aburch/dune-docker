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
  clang-3.8 \
  cmake \
  coinor-libipopt-dev \
  curl \
  flex \
  gfortran \
  git \
  gnuplot-nox \
  libadolc-dev \
  libboost-dev \
  libboost-program-options-dev \
  libboost-serialization-dev \
  libboost-system-dev \
  libgtest-dev \
  libltdl-dev \
  libsuitesparse-dev \
  libsuperlu-dev \
  libtinyxml2-dev \
  libtool \
  locales-all \
  mpi-default-bin \
  mpi-default-dev \
  openssh-client \
  pkg-config \
  python-dev \
  python3 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password --home /duneci --uid 50000 duneci
USER duneci
WORKDIR /duneci
RUN mkdir -p /duneci/bin /duneci/modules
ENV DUNE_CONTROL_PATH=.:/duneci/modules
ENV PATH=/duneci/bin:$PATH
COPY opts.clang opts.gcc /duneci/
COPY dune-ctest /duneci/bin/
RUN ln -s dune-ctest /duneci/bin/duneci-ctest
COPY duneci-install-module /duneci/bin/
COPY duneci-standard-test /duneci/bin/
