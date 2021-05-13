FROM alpine:edge

LABEL version="0.0.0" \
      maintainer="mail@anrip.com"

ENV WBX_APPS="mysql nginx php8 redis"

ADD initfs /ifs
RUN sh /ifs/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
