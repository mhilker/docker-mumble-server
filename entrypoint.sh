#!/usr/bin/env bash
set -e

CERT="/etc/murmur/certs/$TLS_CERT_FILE"
KEY="/etc/murmur/certs/$TLS_KEY_FILE"

echo "Waiting for $CERT..."
echo "Waiting for $KEY..."

while [ ! -f "$CERT" ] && [ ! -f "$KEY" ]
do
    inotifywait -q -t 60 -e create -e moved_to "$(dirname $CERT)"
    inotifywait -q -t 60 -e create -e moved_to "$(dirname $KEY)"
done

ln -s "/etc/murmur/certs/fullchain.pem" "$CERT"
ln -s "/etc/murmur/certs/privkey.pem" "$KEY"

echo "EXEC"
exec "$@"
