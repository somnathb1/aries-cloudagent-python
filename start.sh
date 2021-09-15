#!/usr/bin/env bash
set -e

aca-py start --inbound-transport http 127.0.0.1 11020 --outbound-transport http --admin 127.0.0.1  11021  --wallet-storage-config "{\"url\":\"34.132.23.213:5432\",\"wallet_scheme\":\"DatabasePerWallet\"}" --wallet-storage-creds "{\"account\":\"postgres\",\"password\":\"mysecretpassword\",\"admin_account\":\"postgres\",\"admin_password\":\"mysecretpassword\"}" &

nginx -c "/etc/nginx/conf.d/default.conf" &

wait -n
