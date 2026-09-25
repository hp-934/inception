#!/bin/bash

set -e

envsubst < /config/init.sql > /config/parsed_init.sql

# Create necessary directories
mkdir -p /run/mysqld
mkdir -p /var/lib/mysql
mkdir -p /var/log/mysql/
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /var/run/mysqld
chown -R mysql:mysql /var/log/mysql/
# Initialize database if not already done
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database"
    mysqld --initialize-insecure --user=mysql
fi

# Execute the initialization SQL
exec mysqld --user=mysql --init-file=/config/parsed_init.sql