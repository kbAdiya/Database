create database lab8;

--2
CREATE TABLE salesman (
    salesman_id integer PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission REAL
);

;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INTEGER,
    salesman_id INT references salesman (salesman_id)
);

CREATE TABLE orders (
    ord_no INTEGER PRIMARY KEY,
    purch_amt REAL,
    ord_date DATE,
    customer_id INTEGER references customers (customer_id),
    salesman_id INTEGER references salesman (salesman_id));

INSERT INTO salesman(salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'MC Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', NULL, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davids', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);
--3
Create role junior_dev login;
--4
create view newyork_salesman as select * from salesman where city ='New York';
--5
Create view order_salesman_customer as
    select o.ord_no, o.purch_amt, o.ord_date, s.name , c.cust_name
    from orders o
    join customers c on o.customer_id=c.customer_id
    join salesman s on o.salesman_id = s.salesman_id;

Grant all privileges on order_salesman_customer to junior_dev;
--6
create view cus_high_grade as
    select * from customers where grade =(select Max(grade) from customers);

Grant Select on cus_high_grade to junior_dev;
--7
create view salesman_bycity as
    select city, count(*) as number_salesman
    from salesman group by city;
--8
create view salesamn_with_many_customers as
    select s.name, count(c.customer_id)
    from salesman s
    join customers c on s.salesman_id = c.salesman_id
    group by s.salesman_id
    having count(c.customer_id)>1;
--9
create role intern;
grant junior_dev to intern;