FROM duneci/base:8

USER root
WORKDIR /
RUN apt-get install --no-install-recommends --yes \
  libdune-common-dev \
  libdune-geometry-dev \
  libdune-grid-dev \
  libdune-localfunctions-dev \
  libdune-istl-dev \
  && apt-get clean

USER duneci
WORKDIR /duneci
