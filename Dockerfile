FROM alpine:3.8

LABEL version="10.5.0" \
      maintainer="mail@anrip.com"

ENV WBX_APPS="nginx php5"

ADD rootfs /bld
RUN sh /bld/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
