#!/bin/sh

sudo -u www-data /usr/bin/aria2c -D \
    --rpc-secret=${ARIA2_TOKEN} \
    --conf-path="/Aria_conf.d/aria2.conf" \
    && nginx -g "daemon off;"