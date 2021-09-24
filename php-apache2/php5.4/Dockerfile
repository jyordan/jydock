FROM php:5.4.45-apache

USER root

RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now archived

RUN docker-php-ext-install pdo pdo_mysql mysqli mysql

RUN yes | pecl install xdebug-2.4.1 \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN set -eux; apt-get update; apt-get install -y libzip-dev zlib1g-dev nano; docker-php-ext-install zip

# COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite