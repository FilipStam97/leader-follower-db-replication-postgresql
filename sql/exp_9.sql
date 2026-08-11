-- Primary down simulation
-- stop primary: docker stop postgres-primary
-- on replica run:
SELECT *
FROM users
LIMIT 5;
-- then try:  INSERT INTO users(name) VALUES ('test');