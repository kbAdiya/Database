Create database lab6;
--2
CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

--3
INSERT INTO locations(street_address, postal_code, city, state_province)
VALUES ('Dongjak', '1S5', 'Seoul', 'province1'),
       ('Buk-gu', 'F31', 'Daegu', 'province4'),
       ('BukDistrict', 'A71', 'Gwangju', 'province3');

INSERT INTO departments(department_name, budget, location_id)
VALUES ('Dep1', 10000, 1),
       ('Dep2', 20000, 2),
       ('Dep3', 30000, 3),
       ('Dep4', 10000, 2);



INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES ('Namjoon', 'Kim', 'Rm@gmail.com', '+8277777', 10000000, 1),
       ('Yoongi', 'Min', 'Suga@gmail.com', '+8273737', 3000000, 2),
       ('Hoseok', 'Jeon', 'jHope@gmail.com', '+82484547', 3000000, 3),
       ('Taehyung', 'Kim', 'V@gmail.com', '+8282134', 2000000, null);

--3
Select e.first_name, e.last_name ,d.department_id, d.department_name
from employees e join departments d on e.department_id = d.department_id;

--4
Select e.first_name, e.last_name ,d.department_id, d.department_name
from employees e join departments d on e.department_id = d.department_id
where d.department_id in(80,40);

--5
select e.first_name, e.last_name, d.department_name, l.city, l.state_province
from employees e
LEFT join departments d on e.department_id = d.department_id
LEFT join locations l on d.location_id = l.location_id;

--6
select department_name, d.department_id
from departments d
left join employees e on d.department_id = e.department_id
;

--7
SELECT first_name, last_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;