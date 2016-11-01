FROM php:5.6-fpm
# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        git \
        zlib1g-dev \
        libicu-dev \
        g++ \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_mysql mysqli mbstring zip bcmath \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl


RUN docker-php-ext-configure mbstring \
    && docker-php-ext-install mbstring zip intl bcmath pdo_mysql mcrypt \
    && pecl install mongo
    && echo extension=mongo.so > /usr/local/etc/php/conf.d/ext-mongo.ini \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && pecl install memcache \
    && ocker-php-ext-enable memcache

#COPY ./../ext-xdebug.ini /usr/local/etc/php/conf.d/ext-xdebug.ini
#COPY ./../ext-memcache.ini /usr/local/etc/php/conf.d/ext-memcache.ini
#COPY ./php.ini /usr/local/etc/php/php.ini

# Install SASS
#RUN apt-get install -y ruby-full rubygems-integration
#RUN gem install sass

EXPOSE 9000
EXPOSE 18999

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN composer global require "fxp/composer-asset-plugin:~1.1"

WORKDIR /var/www

env PATH "$PATH:/var/www/vendor/codeception/codeception"

CMD ["php-fpm"]

