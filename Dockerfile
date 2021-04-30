FROM alpine:edge

LABEL version="15.0.0" \
      maintainer="mail@anrip.com"

ENV WBX_APPS="nginx php8"

ADD initfs /ifs
RUN sh /ifs/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
