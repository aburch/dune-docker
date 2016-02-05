FROM duneci/base:9

USER root
WORKDIR /
RUN apt-get update && apt-get install --no-install-recommends --yes \
  libdune-common-dev \
  libdune-geometry-dev \
  libdune-grid-dev \
  libdune-localfunctions-dev \
  libdune-istl-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# patch from commit 652c97d013df39f7192f2d5d54000c36e04fe0de
RUN sed -i -e '/check_include_files/ iinclude(CheckIncludeFiles)' /usr/share/dune/cmake/modules/FindAlberta.cmake

USER duneci
WORKDIR /duneci
