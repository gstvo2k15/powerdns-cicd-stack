#!/bin/sh

while true; do
  echo "Updating DuckDNS..."
  curl -s "https://www.duckdns.org/update?domains=${DUCKDNS_DOMAIN}&token=${DUCKDNS_TOKEN}&ip=" > /var/log/duckdns.log
  sleep 300
done
