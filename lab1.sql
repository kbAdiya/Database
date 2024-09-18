CREATE DATABASE lab1;

 CREATE TABLE users (
    id SERIAL,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

ALTER TABLE users ADD COLUMN isadmin INTEGER;
Alter table users alter column isadmin type boolean USING isadmin::boolean;
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;
ALTER TABLE USERS ADD PRIMARY KEY (id);

CREATE TABLE tasks (
    id SERIAL,
    name VARCHAR(50),
    user_id INTEGER
);
DROP TABLE tasks;

DROP DATABASE lab1