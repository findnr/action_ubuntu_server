#!/bin/bash
set -e
cd /mnt
git clone --recursive https://github.com/swoole/swoole-cli.git
cd swoole-cli
bash setup-php-runtime.sh
composer install
php prepare.php
php prepare.php +inotify +mongodb +xlswriter

# 定义基础镜像和容器名称
BASE_IMAGE="alpine:3.17"
CONTAINER_NAME="swoole-cli-main"

# 定义在容器内执行的命令
CONTAINER_COMMANDS="
cd /work &&
sh setup-php-runtime.sh &&
export PATH=\$PATH:/work/bin/runtime &&
sh sapi/quickstart/linux/alpine-init.sh &&
php prepare.php +inotify +mongodb +xlswriter &&
./make.sh all-library &&
./make.sh config &&
./make.sh build &&
./make.sh archive &&
exit
"

# 检查容器是否存在
if docker ps -a --format "{{.Names}}" | grep -q "^${CONTAINER_NAME}$"; then
  echo "容器 ${CONTAINER_NAME} 已存在，直接进入执行命令..."
  docker exec -it $CONTAINER_NAME /bin/sh -c "$CONTAINER_COMMANDS"
else
  echo "容器 ${CONTAINER_NAME} 不存在，创建新容器并执行命令..."
  docker pull $BASE_IMAGE
  docker run -dit --name $CONTAINER_NAME -v /mnt/swoole-cli:/work $BASE_IMAGE /bin/sh
  docker exec -it $CONTAINER_NAME /bin/sh -c "$CONTAINER_COMMANDS"
fi


