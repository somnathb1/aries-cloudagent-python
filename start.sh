#!/usr/bin/env bash
set -e

nginx -c "$PWD/nginx.conf" &
aca-py start --inbound-transport http 0.0.0.0 11020 --outbound-transport http --admin 0.0.0.0 11021

wait -n
