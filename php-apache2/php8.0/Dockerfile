FROM php:8.1-apache

USER root

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    unzip \
    curl \
    libpq-dev \
    libcurl4-gnutls-dev \
    libonig-dev \
    libzip-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libpng-dev \
    libmagickwand-dev \
    libssl-dev \
    bash \
    nano \
    git-crypt \
    supervisor \
    software-properties-common \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip mysqli pdo pdo_mysql bcmath curl opcache mbstring pcntl \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-source delete \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

# Copy composer executable.
COPY --from=composer:2.4.2 /usr/bin/composer /usr/bin/composer

# Adjust user permission & group.
RUN usermod --uid 1000 www-data
RUN groupmod --gid 1000  www-data

RUN chown -R www-data:www-data ./ \
    && chmod -R 775 ./ \
    && a2enmod rewrite

# CMD ["/usr/bin/supervisord"]