FROM duneci/base:8

USER root
WORKDIR /
RUN apt-get update && apt-get install --no-install-recommends --yes \
  libdune-common-dev \
  libdune-geometry-dev \
  libdune-grid-dev \
  libdune-localfunctions-dev \
  libdune-istl-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

USER duneci
WORKDIR /duneci
