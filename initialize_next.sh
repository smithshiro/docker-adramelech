#!/bin/bash
# Nextをクリーンインストールするスクリプトです
if [ ! -D ./src/front ]; then
  mkdir -p ./src/front
fi
rm -rf ./src/front/.*
rm -rf ./src/front/*

docker-compose exec node npx create-next-app .
docker-compose exec node npm run dev

touch ./src/front/.gitkeep
# Gitのサブモジュールをインストールしたい
