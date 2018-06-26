FROM debian:stretch
MAINTAINER Ansgar.Burchardt@tu-dresden.de
RUN rm -f /etc/apt/apt.conf.d/docker-gzip-indexes \
  && rm -rf /var/lib/apt/lists/*
RUN export DEBIAN_FRONTEND=noninteractive; \
  apt-get update && apt-get dist-upgrade --no-install-recommends --yes \
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
  gnuplot-nox \
  libadolc-dev \
  libalberta-dev \
  libarpack++2-dev \
  libboost-dev \
  libboost-program-options-dev \
  libboost-serialization-dev \
  libboost-system-dev \
  libgtest-dev \
  libltdl-dev \
  libscotchmetis-dev \
  libscotchparmetis-dev \
  libsuitesparse-dev \
  libsuperlu-dev \
  libtinyxml2-dev \
  libtool \
  locales-all \
  mpi-default-bin \
  mpi-default-dev \
  ninja-build \
  openssh-client \
  pkg-config \
  python-dev \
  python-numpy \
  python-vtk6 \
  python3 \
  python3-dev \
  python3-matplotlib \
  python3-mpi4py \
  python3-numpy \
  python3-pip \
  python3-pytest \
  python3-scipy \
  libgmp-dev \
  libeigen3-dev \
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
