FROM php:8.2.0-apache

#php setup, install extensions, setup configs
RUN apt-get update && apt-get install --no-install-recommends -y \
    libzip-dev \
    libxml2-dev \
    mariadb-client \
    zip \
    unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pecl install zip pcov
RUN docker-php-ext-enable zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install soap \
    && docker-php-ext-install intl \
    && docker-php-source delete

#apache setup
RUN a2enmod rewrite

RUN echo "IncludeOptional v-host/*.conf" >> /etc/apache2/apache2.conf

WORKDIR /var/app/
