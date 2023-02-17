#!/usr/bin/env sh

for f in /var/www/html/.fly/scripts/*.sh; do
    bash "$f" || break
done
chown -R www-data:www-data /var/www/html

if [ $# -gt 0 ]; then
    exec "$@"
else
    exec supervisord -c /etc/supervisor/supervisord.conf
fi
