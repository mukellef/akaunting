#!/bin/bash
docker-compose exec php composer install
docker-compose exec php npm install
docker-compose exec php php php artisan migrate --force -n
docker-compose exec php php artisan module:migrate --force -n
docker-compose exec php php artisan queue:restart
docker-compose exec php php artisan config:clear
docker-compose exec php php artisan cache:clear
docker-compose exec php php artisan route:clear
