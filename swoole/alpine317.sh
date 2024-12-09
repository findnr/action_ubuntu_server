#!/bin/bash
docker pull alpine:3.17
cd /mnt
git clone --recursive https://github.com/swoole/swoole-cli.git
cd swoole-cli
bash setup-php-runtime.sh
composer install
php prepare.php
php prepare.php +inotify +mongodb +xlswriter
docker run -ti --name swoole-cli-mian -v /mnt/swoole-cli:/work alpine:3.17 /bin/sh
cd /work
sh setup-php-runtime.sh
export PATH=$PATH:/work/bin/runtime
sh  sapi/quickstart/linux/alpine-init.sh
php prepare.php +inotify +mongodb +xlswriter
./make.sh all-library
./make.sh config
./make.sh build
./make.sh archive
