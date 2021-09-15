#!/usr/bin/env bash
set -e

aca-py start --inbound-transport http 127.0.0.1 11020 --outbound-transport http --admin 127.0.0.1  11021  --wallet-storage-config "{\"url\":\"10.15.80.3:5432\",\"wallet_scheme\":\"DatabasePerWallet\"}" --wallet-storage-creds "{\"account\":\"ssi-dev\",\"password\":\"Ssi@2021\",\"admin_account\":\"postgres\",\"admin_password\":\"Ssi@2021\"}"&

nginx -c "/etc/nginx/conf.d/default.conf" &

wait -n
