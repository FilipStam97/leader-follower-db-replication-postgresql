-- DELETE TEST
-- on primary

DELETE
FROM users
WHERE id=1;

SELECT * FROM users;
-- on replica: SELECT * FROM users;