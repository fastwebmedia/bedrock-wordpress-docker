#
#	INIT SCRIPT INSPIRED/SNAGGED FROM https://github.com/beevelop/docker-directus/blob/master/init.sh
#
#!/bin/bash
set -ea

DB_PORT=${DB_PORT:-3306}

while ! nc -z ${DB_HOST} ${DB_PORT}; do
	echo "Waiting for Database ${DB_HOST}:${DB_PORT}..."
	sleep 2
done

su-exec www-data composer install --no-interaction
