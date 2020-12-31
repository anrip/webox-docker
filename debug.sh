#!/bin/sh -ex
#

if [ ! -x /usr/bin/dos2unix ]; then
    apt install -y dos2unix
fi

find rootfs/ -type f -exec dos2unix {} \;

docker build -t dev/webox .
sleep 3

docker run --name tmp321 dev/webox &
sleep 9

docker exec -it tmp321 /bin/sh
docker rm -f tmp321
sleep 3

docker rmi -f dev/webox
docker image prune -f
