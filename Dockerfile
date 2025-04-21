FROM php:8.4-cli-alpine

RUN apk add --no-cache git zip unzip supervisor autoconf gcc cmake make g++ zlib-dev libzip-dev

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions zip pcntl pdo_mysql bcmath redis apcu intl opcache

RUN pecl install mongodb-1.21.0 \
    && docker-php-ext-enable mongodb
