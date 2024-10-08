CREATE DATABASE lab4;
--2
create table Warehouse(
    code serial,
    location varchar(255),
    capacity int
);
CREATE TABLE Boxes (
    code CHAR(4),
    contents VARCHAR(255),
    value REAL,
    warehouse INT
);
--3
INSERT INTO Warehouse(location, capacity) VALUES ('Chicago', 3),
        ('Chicago', 4),
        ('New York', 7),
        ('Los Angeles', 2),
        ('San Francisco', 8);

INSERT INTO Boxes VALUES ('0MN7', 'Rocks', 180, 3),
        ('4H8P', 'Rocks', 250, 1),
        ('4RT3', 'Scissors', 190, 4),
        ('7G3H', 'Rocks', 200, 1),
        ('8JN6', 'Papers', 75, 1),
        ('8Y6U', 'Papers', 50, 3),
        ('9J6F', 'Papers', 175, 2),
        ('LL08', 'Rocks', 140, 4),
        ('P0H6', 'Scissors', 125, 1),
        ('P2T6', 'Scissors', 150, 2),
        ('TU55', 'Papers', 90, 5);
---4
SELECT * FROM Warehouse;
--5
SELECT * FROM Boxes where value>150;
--6
Select distinct contents from Boxes;
--or
SELECT DISTINCT ON(contents) * FROM boxes;
--7
Select Warehouse, count(*) from Boxes group by Warehouse;
--8
Select warehouse from Boxes group by warehouse having count(*)>2;
--9
Insert into Warehouse(location,capacity) Values ('New york',3);
--10
Insert into Boxes values('H5RT','Papers','200','2');
--11
Update Boxes
set value=value*0.85
where value =(select value from Boxes order by value desc limit 1 offset 2 );
--12
Delete From Boxes Where Value<150
Returning *;
--13
Delete from Boxes where Warehouse=(select code from Warehouse where location ='New York')
Returning *;
