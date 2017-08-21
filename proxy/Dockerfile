FROM debian:stretch
MAINTAINER Ansgar.Burchardt@tu-dresden.de
RUN \
  rm -f /etc/apt/apt.conf.d/docker-gzip-indexes \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get update && apt-get dist-upgrade --no-install-recommends --yes \
  && apt-get install --no-install-recommends --yes \
  squid \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 3128
USER proxy
ENTRYPOINT ["/usr/sbin/squid", "-N", "-f", "/srv/squid/squid.conf"]
