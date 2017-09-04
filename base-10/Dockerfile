FROM debian:buster
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
  clang-4.0 \
  cmake \
  coinor-libipopt-dev \
  curl \
  flex \
  g++-7 \
  gcc-7 \
  gfortran \
  git \
  git-lfs \
  gnuplot-nox \
  libadolc-dev \
  libalberta-dev \
  libboost-dev \
  libboost-program-options-dev \
  libboost-serialization-dev \
  libboost-system-dev \
  libgtest-dev \
  libltdl-dev \
  libscotchmetis-dev \
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
  python3-numpy \
  && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password --home /duneci --uid 50000 duneci
USER duneci
WORKDIR /duneci
RUN mkdir -p /duneci/bin /duneci/modules
ENV DUNE_CONTROL_PATH=.:/duneci/modules
ENV PATH=/duneci/bin:$PATH
COPY opts.clang opts.gcc opts.gcc.c++17 /duneci/
COPY dune-ctest /duneci/bin/
RUN ln -s dune-ctest /duneci/bin/duneci-ctest
COPY duneci-install-module /duneci/bin/
COPY duneci-standard-test /duneci/bin/
