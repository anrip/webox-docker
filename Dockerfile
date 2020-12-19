FROM alpine:3.8

LABEL version="10.5.0" \
      maintainer="mail@anrip.com"

ADD rootfs /deploy
RUN sh /deploy/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
