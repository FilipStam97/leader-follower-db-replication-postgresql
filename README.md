# leader-follower-db-replication-postgresql


## Cleanup volumes
docker compose down -v


## Start primary
docker compose up -d postgres-primary
docker compose logs postgres-primary

## Enter psql show config
docker exec -it postgres-primary psql -U admin -d bank


SHOW wal_level;

SELECT
    rolname,
    rolcanlogin,
    rolreplication
FROM pg_roles
WHERE rolname = 'replicator';