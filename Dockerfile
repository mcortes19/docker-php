FROM php:7.1-fpm-alpine
# Alpine packages
RUN apk --update add --no-cache \
  coreutils \
  freetype-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  zlib-dev \
  libzip-dev\
  && docker-php-ext-configure gd \
  --with-freetype-dir=/usr/include/ \
  --with-jpeg-dir=/usr/include/ \
  --with-png-dir=/usr/include/ \
  && docker-php-ext-configure zip \
  --with-libzip \
  && docker-php-ext-install -j "$(nproc)" \
  gd \
  opcache \
  pdo_mysql \
  zip
