FROM alpine:edge

LABEL version="0.0.0" \
      maintainer="mail@anrip.com"

ADD rootfs /deploy
RUN sh /deploy/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
