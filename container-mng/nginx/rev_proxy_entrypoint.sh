#!/usr/bin/env sh
set -eu
TPL=/usr/local/openresty/nginx/conf/nginx.conf.template
OUT=/usr/local/openresty/nginx/conf/nginx.conf

sed -e "s|\${SERVER_NAME_ARTI}|${SERVER_NAME_ARTI}|g" \
    -e "s|\${ENV_DOMAIN}|${ENV_DOMAIN}|g" \
    -e "s|\${ARTIFACTORY_ROUTER_PORT}|${ARTIFACTORY_ROUTER_PORT}|g" \
    -e "s|\${SERVER_NAME_JENKINS}|${SERVER_NAME_JENKINS}|g" \
    -e "s|\${JENKINS_PORT}|${JENKINS_PORT}|g" \
    -e "s|\${HTTPS_PORT}|${HTTPS_PORT}|g" \
    -e "s|\${HTTP_PORT}|${HTTP_PORT}|g" \
    < "$TPL" > "$OUT"

/usr/local/openresty/nginx/sbin/nginx -t -c "$OUT"
exec /usr/local/openresty/bin/openresty -g "daemon off;"
