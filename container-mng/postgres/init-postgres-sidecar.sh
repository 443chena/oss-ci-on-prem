#!/bin/sh
set -e

echo "[INIT] Setting permissions for Postgres volume"

mkdir -p /var/lib/postgresql/data
chown -R ${POSTGRES_USER_ID}:${POSTGRES_USER_ID} /var/lib/postgresql/data
chmod -R 700 /var/lib/postgresql/data
echo "[INIT] Done"

