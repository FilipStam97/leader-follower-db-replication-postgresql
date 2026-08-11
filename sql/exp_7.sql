-- Replication slot
-- on primary:
SELECT
    slot_name,
    slot_type,
    active
FROM pg_replication_slots;
