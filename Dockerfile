FROM webdevops/php-nginx:7.4

# Set Laravel public directory
ENV WEB_DOCUMENT_ROOT=/app/public
ENV WEB_DOCUMENT_INDEX=index.php
ENV SERVICE_NGINX_CLIENT_MAX_BODY_SIZE=100m

# Copy application
COPY . /app
WORKDIR /app

# Install composer dependencies
RUN composer install --ignore-platform-reqs --no-dev --optimize-autoloader

# Set proper permissions
RUN chmod -R 777 /app/storage /app/bootstrap/cache

# Use default port 80
EXPOSE 80
