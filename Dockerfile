# Используем официальный образ Apache с PHP
FROM php:8.2-apache

# Устанавливаем системные пакеты
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Копируем наши скрипты
COPY docker_monitor.sh /usr/local/bin/docker_monitor.sh
COPY docker-compose.yml /docker-compose.yml

# Делаем скрипт исполняемым
RUN chmod +x /usr/local/bin/docker_monitor.sh

# Открываем порт 80
EXPOSE 80

# Запускаем Apache
CMD ["apache2-foreground"]
