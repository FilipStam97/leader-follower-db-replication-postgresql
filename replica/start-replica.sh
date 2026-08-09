#!/bin/bash

set -e

echo "Waiting for primary..."

until pg_isready -h postgres-primary -p 5432 -U replicator
do
    sleep 2
done

echo "Primary is ready."

export PGPASSWORD="replicator123"

if [ ! -f "$PGDATA/PG_VERSION" ]; then

    echo "Initializing replica..."

    rm -rf "${PGDATA:?}"/*

    mkdir -p "$PGDATA"
    chown -R postgres:postgres "$PGDATA"
    chmod 700 "$PGDATA"

    gosu postgres pg_basebackup \
        -h postgres-primary \
        -p 5432 \
        -U replicator \
        -D "$PGDATA" \
        -P \
        -R \
        -X stream \
        -C \
        -S replica_slot

    echo "Replica initialized."
fi

echo "Starting replica..."

exec gosu postgres postgres