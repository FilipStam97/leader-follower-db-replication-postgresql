-- BULK INSERT TEST
-- on primary
INSERT INTO users(name)
SELECT md5(random()::text)
FROM generate_series(1,10000);

SELECT COUNT(*)
FROM users;
-- on replica: SELECT COUNT(*) FROM users;