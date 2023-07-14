use sql_store

-- order by
select first_name, city , points from customers
order by points;

-- order by desc
select first_name, city , points from customers
order by points desc;

-- order by field
select first_name, birth_date, points from customers order by points;


select first_name, birth_date, points*10 as new_points from customers ;

-- make operation on field and alias column
select product_id, name,unit_price, (unit_price* 0.05) as new_unit_price from products;


-- distict from duplicate values
select distinct state from customers;

-- conditional operator
select * from customers where points < 1000;



-- logical operators And - Or - Not

select * from customers where birth_date < '1990-01-01' or state = 'VA';

select * from customers where birth_date < '1990-01-01' and state = 'VA';

select * from customers where not state ='VA';

select * from customers where (birth_date < '1990-01-01' or state = 'VA') or (points > 1000);

-- select order_id, quantity, unit_price, (quantity * unit_price) as total_price from order_items ;

select * from customers;

-- In Operator

select * from customers where state in('VA', 'FL','TN');


-- Between Operator

select * from customers where points between 1000 and 3000;


-- like operator 
select * from customers where last_name like 'b%';


select * from customers where last_name like '%t';

select * from customers where last_name like '%b%';

select * from customers where address like '%trail%' or address like '%avenue%';


-- REGEXP 

-- select * from customers where last_name REGEXP '^b'; -- ^ start with

-- select * from customers where last_name REGEXP 'b$'; -- ^ end with

--- SELECT title FROM movies_tbl WHERE title REGEXP 'com?'; --  Match zero or one instance of the strings preceding it(?) 
-- SELECT name FROM student_tbl WHERE name REGEXP 'be|ae' ; -- matches any of the patterns p1, p2, or p3(p1|p2|p3)
-- SELECT name FROM student_tbl WHERE name REGEXP '[jz]' ;  -- Matches any character listed between the square brackets([abc]) 


-- Null Values

select * from customers where phone is null;

-- Not Nul 
select * from customers where phone is not null;



-- limit 

SELECT TOP 5 PERCENT * FROM customers;

select * from orders;
select * from order_statuses;

-- Joining Multiple Tables 
select * from orders as o join customers as c 
on o.customer_id = c.customer_id;



-- joins
use sql_store
select * from customers

select * from orders join customers 
on orders.customer_id = customers.customer_id

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;


-- inner join 

SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);


-- left join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

-- right join 
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

-- full join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;






-- views

CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

SELECT * FROM [Products Above Average Price];

----------------------------------------------------------------------------------
use sql_hr
select job_title from employees 
