FROM duneci/base:8
MAINTAINER Ansgar.Burchardt@tu-dresden.de

USER root

RUN echo "deb http://httpredir.debian.org/debian jessie-backports main contrib non-free" > /etc/apt/sources.list.d/jessie-backports.list

RUN apt-get update && apt-get install --no-install-recommends --yes \
  clang-3.8 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

USER duneci
COPY opts.clang /duneci/
