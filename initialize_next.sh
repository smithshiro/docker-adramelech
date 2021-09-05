#!/bin/bash
# Nextをクリーンインストールするスクリプトです
if [ ! -d ./src/front ]; then
  mkdir -p ./src/front
fi
rm -rf ./src/front/.* 2>&1 > /dev/null
rm -rf ./src/front/* 2>&1 > /dev/null 

docker-compose run node npx create-next-app /var/www/front
docker-compose run node npm --cwd /var/www/front run dev

touch ./src/front/.gitkeep
# Gitのサブモジュールをインストールしたい
