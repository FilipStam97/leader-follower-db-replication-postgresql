-- UPDATE TEST
-- on primary
UPDATE users
SET name='Marko'
WHERE id=1;

SELECT * FROM users;
-- on replica SELECT * FROM users;
