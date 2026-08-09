#!/bin/bash

set -e

echo "Kreiranje korisnika za replikaciju..."

psql \
  --username "$POSTGRES_USER" \
  --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE ROLE replicator
    WITH
        LOGIN
        REPLICATION
        PASSWORD 'replicator123';
EOSQL

echo "Dodavanje pravila u pg_hba.conf..."

cat >> "$PGDATA/pg_hba.conf" <<EOF

# Dozvoli replication konekcije iz Docker mreže
host replication replicator 0.0.0.0/0 scram-sha-256
EOF

echo "Primary konfiguracija završena."