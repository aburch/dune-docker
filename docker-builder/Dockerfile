FROM ubuntu:16.04
MAINTAINER Ansgar.Burchardt@tu-dresden.de
RUN rm -f /etc/apt/apt.conf.d/docker-gzip-indexes \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get dist-upgrade --no-install-recommends --yes \
  && apt-get install --no-install-recommends --yes \
  docker.io
  && apt-get clean && rm -rf /var/lib/apt/lists/*
