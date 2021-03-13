FROM php:7.2-fpm

ENV LANG ja_JP.UTF-8
ENV LC_ALL C

RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer

RUN apt-get update && \
    apt-get install -y zip unzip vim git gpg locales wget zlib1g-dev && \
    docker-php-ext-install pdo_mysql mysqli mbstring zip
