-- 1
create database lab2;
-- 2
create table countries(
    country_id serial primary key,
    country_name varchar(50),
    region_id int,
    population int);
-- 3
INSERT INTO countries (region_id,country_name,population) VALUES (2345, 'america',333000000);
-- 4
INSERT INTO countries (country_id, country_name) VALUES (2, 'China');
--5
INSERT INTO countries (country_name, region_id, population) VALUES ('Korea', NULL, 500000);
--6
INSERT INTO countries (country_name, region_id, population)
VALUES
('Japan', 3956, 800000),
('Germany', 1111, 50000),
('Mexico', 4890, 1200000);
--7
ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
--8
INSERT INTO countries (region_id, population) VALUES (6600, 200000);
--9
INSERT INTO countries DEFAULT VALUES;
--10
CREATE TABLE countries_new (like countries including all);
--11
INSERT INTO countries_new
SELECT * FROM countries;
--12
UPDATE countries SET region_id = 1 WHERE region_id IS NULL;
--13
SELECT country_name,
       population * 1.10 AS "New Population"
FROM countries;
--14
INSERT INTO countries (region_id,country_name,population) VALUES (4000, 'somecountrytodelete',90000);
DELETE FROM countries WHERE population < 100000;
--15
DELETE FROM countries_new
USING countries
WHERE countries_new.country_id = countries.country_id
RETURNING countries_new.*;
--16
DELETE FROM countries
RETURNING *;