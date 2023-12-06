FROM php:7.4.1-apache

USER root

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        libgmp-dev \
        zip \
        curl \
        unzip \
        nano \
        git-crypt \
        supervisor \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-ext-install gmp \
    && docker-php-source delete

RUN apt-get update && apt-get install -y \
    software-properties-common \
    npm
# RUN npm install npm@latest -g && \
#     npm install n -g && \
#     n latest

RUN pecl install redis && docker-php-ext-enable redis

# COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer config -g repo.packagist composer https://packagist.org
RUN composer config process-timeout 3600

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

# CMD ["/usr/bin/supervisord"]