#!/usr/bin/env bash
set -e

aca-py start --inbound-transport http 127.0.0.1 11020 --outbound-transport http --admin 127.0.0.1  11021 &

nginx -c "/etc/nginx/conf.d/default.conf" &

wait -n
