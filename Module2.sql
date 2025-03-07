-- SQL JOIN - It is used to combine rows from two or more tables, based on a related column between them.
-- Different Types of SQL JOINs
-- Here are the different types of the JOINs in SQL:
-- 
-- (INNER) JOIN: Returns records that have matching values in both tables
-- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
-- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table


-- INNER JOIN
select
	c.customerNumber,
	c.customerName,
	p.checkNumber,
	p.paymentDate,
	p.amount
from
	customers c
join payments p on
	p.customerNumber = c.customerNumber;

-- Joining multiple tables
select
	o.orderNumber,
	o.orderDate,
	o.status,
	o.customerNumber ,
	c.customerName,
	c.city,
	e.employeeNumber,
	e.firstName,
	e.jobTitle
from
	orders o
join customers c on
	c.customerNumber = o.customerNumber
join employees e on
	e.employeeNumber = c.salesRepEmployeeNumber;


-- SELF JOIN: A self join is a regular join, but the table is joined with itself.
select
	e.employeeNumber,
	e.firstName,
	e2.firstName managerName
from
	employees e
join employees e2 on
	e.reportsTo = e2.employeeNumber ;


-- OUTER JOINS
-- 1. LEFT OUTER JOIN
select
	c.customerNumber ,
	c.customerName
from
	customers c
left join orders o on
	o.customerNumber = c.customerNumber
where o.orderNumber is null;