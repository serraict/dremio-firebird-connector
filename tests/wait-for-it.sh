#!/bin/sh

TIMEOUT=15
QUIET=0

wait_for() {
    if ! command -v nc >/dev/null; then
        echo "nc command is missing!"
        exit 1
    fi

    until nc -z "$1" "$2"; do
        sleep 1
    done
    return 0
}

HOST=$(printf "%s\n" "$1"| cut -d : -f 1)
PORT=$(printf "%s\n" "$1"| cut -d : -f 2)
wait_for "$HOST" "$PORT"
shift

exec "$@"