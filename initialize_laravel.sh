#!/bin/bash
# Laravelをクリーンインストールするスクリプトです
if [ ! -d ./src/server ]; then
  mkdir -p ./src/server
fi
rm -rf ./src/server/.*
rm -rf ./src/server/*

docker-compose exec php composer clear-cache
docker-compose exec php composer global require "laravel/installer=~1.1"
docker-compose exec php composer create-project --prefer-dist laravel/laravel /var/www/server "6.*"
touch ./src/server/.gitkeep
# Gitのサブモジュールをインストールしたい
