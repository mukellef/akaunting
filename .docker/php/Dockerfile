FROM php:8.2-fpm

RUN apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8 \
                          && locale-gen tr_TR.UTF-8 \
   && apt-get -y upgrade --no-install-recommends \
   && apt-get install -y \
   build-essential \
   imagemagick \
   libfreetype6-dev \
   libicu-dev \
   libjpeg62-turbo-dev \
   libjpeg-dev \
   libmcrypt-dev \
   libonig-dev \
   libpng-dev \
   libpq-dev \
   libssl-dev \
   libxml2-dev \
   libxrender1 \
   libzip-dev \
   locales \
   openssl \
   unzip \
   zip \
   zlib1g-dev \
   --no-install-recommends \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
        && php composer-setup.php --install-dir=/usr/bin/ --filename=composer \
        && rm composer-setup.php \
   && apt-get clean && rm -rf /var/lib/apt/lists/*


RUN docker-php-ext-configure gd \
   --with-freetype \
   --with-jpeg \
   && docker-php-ext-install -j$(nproc) \
   gd \
   bcmath \
   intl \
   mbstring \
   pcntl \
   pdo \
   pdo_mysql \
   zip

# Node.js, NPM, Yarn
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN npm install npm@latest -g
RUN npm install yarn -g

WORKDIR /var/www/workhy-books

EXPOSE 9000
CMD ["php-fpm"]

