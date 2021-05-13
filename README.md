# What is Webox?

Re sail from alpine !

Webox (`abbreviation for web-box`) is a customized LNMP server, which includes the following components: MariaDB, Nginx, PHP, Redis. And add some popular plug-ins.

- mariadb 10.5.x

- nginx 1.20.x

  - image-filter

- php 8.0.x

  - redis

- redis 6.2.x

# Supported Tags

- [edge](https://github.com/anrip/webox-docker/tree/edge)

- [latest](https://github.com/anrip/webox-docker/tree/master)

- [nginx-php, nginx-php8, nginx-php8.4](https://github.com/anrip/webox-docker/tree/nginx-php8.4)

- [nginx-php8.3](https://github.com/anrip/webox-docker/tree/nginx-php8.3)

- [nginx-php5, nginx-php5.6](https://github.com/anrip/webox-docker/tree/nginx-php5.6)

# Simple Usage

## The web server is listening on `your-ip:80`

```shell
docker run --name MYBOX -d -P \
    -v /MY/htdoc:/var/www/default \
    -v /MY/mysql:/var/lib/mysql \
    vmlu/webox
```

## Put your files to host's webroot

If the domain is `www.example.org`, the webroot will be `/MY/htdoc/org.example.www/`.

# Manual Control Services

```shell
docker run --name MYBOX -d -P \
    -v /MY/htdoc:/var/www/default \
    -v /MY/config:/var/config \
    -e 'TIMEZONE=Asia/Shanghai' \
    -e 'WBX_APPS=nginx php8' \
    vmlu/webox
```

## ENV Variables

- `WBX_APPS`, Set up automatically started services

- `TIMEZONE`, Set time zone

## Service management command

```shell
docker exec -it MYBOX wkit [start|stop|restart|reload]
```

## Add some PHP extension modules

```shell
docker exec -it MYBOX apk add \
    php8-pcntl php8-posix php8-saop \
    php8-maxminddb php8-pecl-imagick
```

## Configure the components you need

You can place additional config files in `/MY/config/*`, these files will be copied to `{MYBOX}/etc` and take effect on next restart.

- Configure mariadb

  - /MY/config/mysql/conf.d/\*

- Configure virtual host

  - /MY/config/nginx/host.d/\*

- Configure php8

  - /MY/config/php8/conf.d/\*

- Configure redis

  - /MY/config/redis/redis.conf

- Scripts in the following locations will be run when `MYBOX` started:

  - /MY/config/rc.local
  - /MY/config/local.d/\*
  - /MY/config/local.d/s3-prewkit
  - /MY/config/local.d/s5-wkit
  - /MY/config/local.d/s6-postwkit

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
