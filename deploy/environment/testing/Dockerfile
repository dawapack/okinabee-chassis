FROM php:8.1-alpine

# Create user and group
RUN addgroup --gid 1000 www
RUN adduser -s /bin/bash -u 1000 -G www -s /sbin/nologin -D www

# Container timezone will be UTC
RUN echo "UTC" > /etc/timezone

# Add requirements
RUN apk add --no-cache bash bash-doc bash-completion zip unzip curl openssh \
  zlib-dev libpng-dev gmp-dev icu-dev util-linux-dev linux-headers

# Add composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
  && php composer-setup.php --install-dir=/usr/bin --filename=composer \
  && rm -rf composer-setup.php

# Install docker php extensions
RUN docker-php-ext-install bcmath gd gmp intl pcntl sockets pdo pdo_mysql

# Install pnctl, sockets & parallel extensions via pecl
RUN apk add --update --no-cache --virtual .build-dependencies $PHPIZE_DEPS \
  && pecl install redis-6.0.2 uuid \
  && pecl clear-cache \
  && apk del .build-dependencies

# Remove auto generated extension ini files
RUN rm -rf /usr/local/etc/php/conf.d/docker-php-ext-*

# Copy mandatory sh scripts and conf files
COPY php/ /usr/local/etc/php/
COPY usr/ /usr/

# Set rights & execute flag
RUN chown -R www: /home/www
RUN chmod 644 /home/www/.bashrc
RUN chmod 755 /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/wait-for-it

# Set the work directory
WORKDIR /var/www

## switch to user without privileges
USER 1100:1100

ENTRYPOINT ["wait-for-it", "rabbitmq:5672", "--", "wait-for-it", "redis:6379", "--", "entrypoint.sh"]
