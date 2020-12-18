FROM alpine:3.12

LABEL version="14.0.0" \
      maintainer="mail@anrip.com"

ADD rootfs /deploy
RUN sh /deploy/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
