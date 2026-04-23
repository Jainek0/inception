#!/bin/sh
set -e

cd /var/www/html

if [ ! -f wp-config.php ]; then
    echo "Initial setup WordPress..."

    wp core download --allow-root

    wp config create \
      --dbname="$DB_NAME" \
      --dbuser="$DB_USER" \
      --dbpass="$DB_PASSWORD" \
      --dbhost="mariadb" \
      --allow-root

    wp core install \
      --url="$DOMAIN_NAME" \
      --title="inception" \
      --admin_user="$WP_ADMIN_USER" \
      --admin_password="$WP_ADMIN_PASS" \
      --admin_email="$WP_ADMIN_MAIL" \
      --allow-root

    wp user create "$WP_USER" "$WP_MAIL" \
      --role="contributor" \
      --user_pass="$WP_PASS" \
      --allow-root

else
    echo "WordPress already installed, skipping setup"
fi

exec "$@"
