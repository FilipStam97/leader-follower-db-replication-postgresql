-- GENERAL WORKING TEST
-- primary
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users(name)
VALUES ('Filip');

SELECT * FROM users;

-- on replica: SELECT * FROM users;
