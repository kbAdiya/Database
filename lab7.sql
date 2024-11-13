create database lab7;
create table countries (
    country_id serial primary key,
    name varchar(50) not null
);
insert into countries (name)
    values ('Kazakhstan'),
           ('Russia'),
           ('USA'),
           ('China');

create table employees (
    employee_id serial primary key,
    name varchar(50) ,
    surname varchar(50) ,
    salary integer,
    department_id INTEGER REFERENCES departments
);
insert into employees (name, surname, salary, department_id) values
('Rex', 'Doe', 40000, 1),
('Jane', 'Smith', 55000, 1),
('Sarah', 'Connor', 45000, 2),
('Jack', 'Sparrow', 65000, 3),
('Steve', 'Rogers', 90000, 2);

create table departments (
    department_id serial primary key,
    name varchar(50),
    budget integer
);
insert into departments (name, budget) values
('Engineering', 1000000),
('Finance', 3000000),
('Sales', 4500000);

--1
create index idx_countries_name on countries (name);
select * from countries where name = 'USA';

--2
SELECT * FROM employees WHERE name = 'Sarah'
AND surname = 'Connor';
CREATE INDEX employees_name_surname_index ON employees(name, surname);
/* до 1 row retrieved starting from 1 in 98 ms (execution: 6 ms, fetching: 92 ms)
   после 1 row retrieved starting from 1 in 44 ms (execution: 5 ms, fetching: 39 ms)
 */

--3
SELECT * FROM employees WHERE salary < 60000
AND salary > 40000;
CREATE UNIQUE INDEX employees_salary_index ON employees(salary);

--4
SELECT * FROM employees WHERE substring(name
from 1 for 2) = 'Ja';
CREATE INDEX employees_name_substr_index
ON employees((substring(name from 1 for 2)));
/*
Ja	Row 4
Ja	Row 2
Re	Row 1
Sa	Row 3
St	Row 5
 */
 --5
select * from employees e
join departments d on d.department_id = e.department_id
where d.budget > 2000000 and e.salary < 60000;

CREATE INDEX employees_salary_department_index ON employees(department_id, salary);
CREATE INDEX department_budget_index ON departments(department_id, budget);

