FROM php:7.1-fpm-alpine

MAINTAINER Tommy Lau <tommy@gen-new.com>

LABEL Description="This image is PHP-FPM 7.1 running on Alpine" Vendor="Tommy Lau" Version="7.1-fpm-alpine"

# Install other needed extensions
RUN	set -x \
	&& apk add --no-cache git icu-libs \
	&& apk add --no-cache --virtual .php-ext-deps icu-dev \
	&& docker-php-ext-install intl mysqli pdo_mysql \
	&& apk del .php-ext-deps

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www
