#!/bin/bash
# Laravelをクリーンインストールするスクリプトです
if [ ! -d ./src/server ]; then
  mkdir -p ./src/server
fi
rm -rf ./src/server/.* 2>&1 > /dev/null
rm -rf ./src/server/* 2>&1 > /dev/null

docker-compose run php composer clear-cache
docker-compose run php composer global require "laravel/installer=~1.1"
docker-compose run php composer create-project --prefer-dist laravel/laravel /var/www/server "6.*"
touch ./src/server/.gitkeep
# Gitのサブモジュールをインストールしたい
