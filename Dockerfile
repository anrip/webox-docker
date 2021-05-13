FROM alpine:3.13

LABEL version="14.1.0" \
      maintainer="mail@anrip.com"

ENV WBX_APPS="nginx php7"

ADD initfs /ifs
RUN sh /ifs/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
