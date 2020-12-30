# What is Webox?

Re sail from alpine !

Webox (`abbreviation for web-box`) is a customized LNMP server, which includes the following components: MariaDB, Nginx, PHP, Redis. And add some popular plug-ins.

- mariadb 10.5.x

- nginx 1.18.x

  - image-filter

- php 7.4.x

  - redis

- redis 6.0.x

# Simple Usage

## The web server is listening on `your-ip:80`

```shell
docker run --name MYBOX -d -P \
    -v /MY/htdoc:/var/www/default \
    -v /MY/mysql:/var/lib/mysql \
    vmlu/webox
```

## Put your files to host's webroot

If the domain is `www.anrip.net`, the webroot will be `/MY/htdoc/net.anrip.www/`.

# Manual Control Services

## Set `WBX_APPS`, you can start some components you need

```shell
docker run --name MYBOX -d -P \
    -v /MY/htdoc:/var/www/default \
    -v /MY/config:/var/config \
    --env 'WBX_APPS=nginx php7' \
    vmlu/webox
```

## Service management command

```shell
docker exec -it MYBOX wkit [start|stop|restart|reload]
```

## Configure the components you need

You can place additional config files in `/MY/config/*`, these files will be copied to `{MYBOX}/etc` and take effect.

For example, add some PHP extension modules:

```shell
    echo "#!/bin/sh" > /MY/config/init.d/s3-apk-add
    echo "apk add php7-pcntl php7-posix php7-saop" >> /MY/config/init.d/s3-apk-add
    echo "apk add php7-maxminddb php7-pecl-imagick" >> /MY/config/init.d/s3-apk-add
    docker restart MYBOX
```

# Important Notice

## Don't forget to change mysql password

```shell
docker exec -it MYBOX mysqladmin -u root password abc345
```

You may also need to execute the following SQL statements.

```sql
DROP USER 'mysql'@'localhost';
```

# More Issues

See https://github.com/anrip/webox-docker/issues for more issues.
