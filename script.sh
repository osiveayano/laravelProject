apk update 
apk add git curl zip unzip
apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    curl-dev \
    imagemagick-dev \
    libtool \
    libxml2-dev \
    postgresql-dev \
    sqlite-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev
pecl install \
    xdebug
docker-php-ext-enable \
    xdebug
docker-php-ext-install pdo_mysql exif pcntl bcmath gd
#Install Composer
php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

/usr/bin/composer install
cp .env.example .env
php artisan key:generate
# php artisan migrate --seed
php artisan serve --host=0.0.0.0 --port=8000 
