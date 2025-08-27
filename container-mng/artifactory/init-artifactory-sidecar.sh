#!/bin/sh
set -e

# ARTIFACTORY_USER_ID="${ARTIFACTORY_USER_ID:-1030}"
# ARTIFACTORY_GROUP_ID="${ARTIFACTORY_GROUP_ID:-1030}"

echo "[INIT] Setting permissions on Artifactory volume"
mkdir -p /var/opt/jfrog/artifactory
chown -R "${ARTIFACTORY_USER_ID}:${ARTIFACTORY_GROUP_ID}" /var/opt/jfrog/artifactory
chmod -R 750 /var/opt/jfrog/artifactory
echo "[INIT] Done"

