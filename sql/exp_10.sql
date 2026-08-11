--Replica promotion
-- on replica do: SELECT pg_promote();
-- then: SELECT pg_is_in_recovery();
-- then run on replica to verify: 
INSERT INTO users(name)
VALUES ('New leader');
