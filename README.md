# What is Webox?

Re sail from alpine !

Webox (`abbreviation for web-box`) is a customized LNMP server, which includes the following components: MariaDB, Nginx, PHP, Redis. And add some popular plug-ins.

This is a lightweight branch that contains only the following components:

- nginx 1.18.x

  - image-filter

- php 7.3.x

# Simple Usage

## The web server is listening on `your-ip:80`

```shell
docker run --name MYBOX -d -P \
    -v /MY/htdoc:/var/www/default \
    vmlu/webox
```

## Put your files to host's webroot

If the domain is `www.anrip.net`, the webroot will be `/MY/htdoc/net.anrip.www/`.

# Manual Control Services

```shell
docker run --name MYBOX -d -P \
    -v /MY/htdoc:/var/www/default \
    -v /MY/config:/var/config \
    -e 'TIMEZONE=Asia/Shanghai' \
    vmlu/webox
```

## ENV Variables

 - `WBX_APPS`, Set up automatically started services

- `TIMEZONE`, Set time zone

## Service management command

```shell
docker exec -it MYBOX wkit [start|stop|restart|reload]
```

## Configure the components you need

You can place additional config files in `/MY/config/*`, these files will be copied to `{MYBOX}/etc` and take effect.

For example, add some PHP extension modules:

```shell
    echo "#!/bin/sh" > /MY/config/init.d/s3-preload
    echo "apk add php7-pcntl php7-posix php7-saop" >> /MY/config/init.d/s3-preload
    echo "apk add php7-maxminddb php7-pecl-imagick" >> /MY/config/init.d/s3-preload
    docker restart MYBOX
```

# More Issues

See https://github.com/anrip/webox-docker/issues for more issues.
