# #!/bin/bash
# docker pull alpine:3.17
# cd /mnt
# git clone --recursive https://github.com/swoole/swoole-cli.git
# cd swoole-cli
# bash setup-php-runtime.sh
# composer install
# php prepare.php
# php prepare.php +inotify +mongodb +xlswriter
# docker run -ti --name swoole-cli-mian -v /mnt/swoole-cli:/work alpine:3.17 /bin/sh
# cd /work
# sh setup-php-runtime.sh
# export PATH=$PATH:/work/bin/runtime
# sh  sapi/quickstart/linux/alpine-init.sh
# php prepare.php +inotify +mongodb +xlswriter
# ./make.sh all-library
# ./make.sh config
# ./make.sh build
# ./make.sh archive
#!/bin/bash
set -e

# 定义基础镜像变量
BASE_IMAGE="alpine:3.17"

# 拉取基础镜像
docker pull $BASE_IMAGE

# 克隆仓库
cd /mnt
git clone --recursive https://github.com/swoole/swoole-cli.git
cd swoole-cli

# 准备运行时和依赖
bash setup-php-runtime.sh
composer install

# 添加扩展
php prepare.php +inotify +mongodb +xlswriter

# 启动容器并挂载代码
docker run -ti --name swoole-cli-main -v /mnt/swoole-cli:/work $BASE_IMAGE /bin/sh -c "
  apk add --no-cache git php php-cli php-mbstring composer bash make gcc musl-dev &&
  cd /work &&
  sh setup-php-runtime.sh &&
  export PATH=\$PATH:/work/bin/runtime &&
  sh sapi/quickstart/linux/alpine-init.sh &&
  php prepare.php +inotify +mongodb +xlswriter &&
  ./make.sh all-library &&
  ./make.sh config &&
  ./make.sh build &&
  ./make.sh archive
"
