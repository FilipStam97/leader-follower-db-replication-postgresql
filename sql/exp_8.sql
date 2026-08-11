-- Replica down simulation
-- stop replica: docker stop postgres-replica
-- on primary run:
INSERT INTO users(name)
VALUES ('Replica down');
-- then: docker start postgres-replica

-- run on replica: SELECT * FROM users ORDER BY id DESC LIMIT 1;