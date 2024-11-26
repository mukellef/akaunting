#!/bin/bash
composer install
npm install
php artisan migrate --force -n
php artisan module:migrate --force -n
php artisan queue:restart
php artisan config:clear
php artisan cache:clear
php artisan route:clear

