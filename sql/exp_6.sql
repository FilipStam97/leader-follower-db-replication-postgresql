-- pg_stat_replication
-- on primary:
SELECT
    application_name,
    state,
    sync_state,
    client_addr,
    write_lag,
    flush_lag,
    replay_lag
FROM pg_stat_replication;
