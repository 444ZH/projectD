FROM php:8.2-apache

RUN apt-get update && apt-get install -y adduser && rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password --gecos '' appuser

WORKDIR /var/www/html
COPY . /var/www/html

RUN chown -R appuser:appuser /var/www/html
RUN sed -i 's/www-data/appuser/g' /etc/apache2/apache2.conf

RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite

USER appuser