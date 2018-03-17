#!/usr/bin/env bash
set -e

CERT=/etc/murmur/certs/fullchain.pem
KEY=/etc/murmur/certs/privkey.pem

while [ ! -f "$CERT" ] && [ ! -f "$KEY" ]
do
    inotifywait -q -t 60 -e create -e moved_to "$(dirname $CERT)"
    inotifywait -q -t 60 -e create -e moved_to "$(dirname $KEY)"
done

echo "EXEC"
exec "$@"
