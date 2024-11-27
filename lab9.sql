create database lab9;

--1
CREATE FUNCTION increase_value(INOUT num INTEGER)
LANGUAGE plpgsql AS $$
BEGIN
    num := num + 10;
END;
$$;

SELECT * FROM increase_value(5);

--2------------------------------------
CREATE FUNCTION compare_numbers(a int, b int, out res varchar)
LANGUAGE plpgsql AS $$
begin
if a>b then res :='greater';
elseif a<b then  res:='lesser';
else res:= 'equal';
end if;
end;
$$;

select * from compare_numbers(5,6);
select * from compare_numbers(5,5);

--3----------------------------------------
create function number_series(n int)
returns text as $$
declare res text :='';
begin
for i in 1..n loop
    res := res || i || ' ';
            end loop;
        return res;
 end;
$$
language plpgsql;

SELECT * FROM number_series(6);

--4----------------------------------------------------
create table employees (
    emp_id integer,
    name varchar,
    city varchar(50)
);

insert into employees values (1234, 'Bob', 'New York');
insert into employees values (4321, 'Rex', 'Astana');

create or replace function find_employee(in emp_name varchar)
returns table(id integer, thisname varchar, thiscity varchar) as
$$
begin
    return query select emp_id, name, city from employees
    where name = emp_name;
end;
$$
language plpgsql;


select * from find_employee('Rex');

drop function find_employee(varchar);

--5--------------------------------------------
create table products (
    id integer,
    name varchar,
    category integer
);

insert into products values (456, 'doshirak', 1);
insert into products values (302, 'shipsi', 1);
insert into products values (111, 'apple', 2);

create or replace function list_products(category_name integer)
returns table(pr_id integer, pr_name varchar, pr_category integer) as
$$
begin
    return query select id, name, category from products
    where category = category_name;
end;
$$
language plpgsql;

select * from list_products(1);

--6--------------------------------------------

create table emp (
    emp_id integer,
    name varchar,
    salary int
);

insert into emp values (1234, 'Bob', 200);
insert into emp values (4321, 'Rex', 600);


CREATE FUNCTION calculate_bonus(employee_id INTEGER)
RETURNS INTEGER AS
$$
    DECLARE bonus INTEGER;
BEGIN
        SELECT salary*0.1 INTO bonus FROM emp
        WHERE emp_id = employee_id;
        RETURN bonus;
    end;
$$
LANGUAGE plpgsql;

CREATE FUNCTION update_salary(employee_id INTEGER)
RETURNS TABLE(id INTEGER, pname VARCHAR, psalary INTEGER) AS
$$
    DECLARE bonus INTEGER;
    BEGIN
        bonus := calculate_bonus(employee_id);
        RETURN QUERY UPDATE emp SET salary = salary + bonus
        WHERE emp_id = employee_id RETURNING *;
    end;
$$
LANGUAGE plpgsql;

SELECT * FROM update_salary(1234);

---7--------------------------------------------------
CREATE FUNCTION complex_calc(n int,str varchar)
returns varchar as
$$ <<outer_block>>
   DECLARE res VARCHAR;
   declare nfin int;
    declare strfin varchar;
    BEGIN
      <<inner_block1>>
       begin
          nfin:=n*n;
       end inner_block1;

      <<inner_block2>>
       begin
          strfin:='hello' || str;
       end inner_block2;

    res := strfin || nfin;
    return res;
    END outer_block;
$$
LANGUAGE plpgsql;

select complex_calc(5, 'world');


