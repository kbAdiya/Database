Create database lab5;
--2
create table customers(
    customer_id int primary key,
    cust_name varchar(255),
    city varchar(255),
    grade int,
    salesman_id int references salesmans(salesman_id)
);
create table orders(
    ord_no int primary key,
    purch_amt real,
    ord_date date,
    customer_id int references customers(customer_id),
    salesman_id int  references salesmans(salesman_id)
);
create table salesmans(
    salesman_id int primary key,
    name varchar(225),
    city varchar(225),
    comission real
);
INSERT INTO salesmans
VALUES (5001, 'James Hoog', 'New York', 0.15),
       (5002, 'Nail Knite', 'Paris', 0.13),
       (5005, 'Pit Alex', 'London', 0.11),
       (5006, 'Mc Lyon', 'Paris', 0.14),
       (5003, 'Lauson Hen', null, 0.12),
       (5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers
VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
       (3005, 'Graham Zusi', 'California', 200, 5002),
       (3001, 'Brad Guzan', 'London', null, 5005),
       (3004, 'Fabian Johns', 'Paris', 300, 5006),
       (3007, 'Brad Davis', 'New York', 200, 5001),
       (3009, 'Geoff Camero', 'Berlin', 100, 5003),
       (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders
VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
       (70009, 270.65, '2012-09-10', 3001, 5005),
       (70002, 65.26, '2012-10-05', 3002, 5001),
       (70004, 110.5, '2012-08-17', 3009, 5003),
       (70007, 948.5, '2012-09-10', 3005, 5002),
       (70005, 2400.6, '2012-07-27', 3007, 5001),
       (70008, 5760, '2012-09-10', 3002, 5001);
--3
Select sum(purch_amt) from orders;
--4
Select  avg(purch_amt) from orders;
--5
Select count(cust_name) from customers;
--6
select min(purch_amt) from orders;
--7
Select * from customers where cust_name like '%b';
--8
select * from orders where customer_id in(select customer_id from customers where city='New York');
--9
select * from customers where customer_id in(select customer_id from orders where purch_amt>10);
--10
select sum(grade) from customers;
--11
select * from customers where cust_name is not null;
--12
select max(grade) from customers;
