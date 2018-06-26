FROM alpine:latest
MAINTAINER steffen.muething@iwr.uni-heidelberg.de
RUN apk update && apk add bash coreutils curl docker && addgroup -g 50000 duneci && adduser -D -u 50000 -G duneci -h duneci duneci && rm -f /var/cache/apk/*
USER duneci
