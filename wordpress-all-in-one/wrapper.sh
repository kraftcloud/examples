#!/bin/sh

echo " * Starting MariaDB server ..."
chown -R mysql:mysql /var/lib/mysql
chmod 1777 /tmp
/usr/bin/mysqld_safe &
sleep 15
mysql -u root -punikraft < /init.sql

echo " * Starting PHP FPM ..."
/usr/sbin/php-fpm8.2 --nodaemonize --fpm-config /etc/php/8.2/fpm/php-fpm.conf &
/usr/lib/php/php-fpm-socket-helper install /run/php/php-fpm.sock /etc/php/8.2/fpm/pool.d/www.conf 82

echo " * Starting Nginx ..."
/usr/sbin/nginx -c /etc/nginx/nginx.conf
