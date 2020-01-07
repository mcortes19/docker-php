FROM php:7-fpm-alpine
# Alpine packages
RUN apk --update add --no-cache \
  coreutils \
  freetype-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  zlib-dev \
  libzip-dev \
  && docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd \
  opcache \
  pdo_mysql \
  zip

COPY ./docker-php.ini $PHP_INI_DIR/conf.d/
