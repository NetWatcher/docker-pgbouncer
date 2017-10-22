#!/bin/bash
set -e

: ${PG_LOG:="/var/log/postgresql/"}
: ${PG_CONFIG:="/etc/pgbouncer/pgbouncer.ini"}
: ${PG_USER:="postgres"}

mkdir -p ${PG_LOG}
chmod -R 755 ${PG_LOG}
chown -R ${PG_USER}:${PG_USER} ${PG_LOG}

mkdir -p /etc/keys/database
cp -LR /etc/keys/_database/* /etc/keys/database/
chown -R ${PG_USER}:${PG_USER} /etc/keys/database
chmod -R 0600 /etc/keys/database

echo "Starting pgbouncer..."
exec pgbouncer -u ${PG_USER} $PG_CONFIG
