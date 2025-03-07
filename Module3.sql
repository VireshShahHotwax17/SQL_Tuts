-- Aggregate functions

-- 1. MIN and MAX - The MIN() function returns the smallest value of the selected column.
-- 					The MAX() function returns the largest value of the selected column
-- 2. SUM - The SUM() function returns the total sum of a numeric column.
-- 3. AVG - The AVG() function returns the average value of a numeric column.
select
	MAX(amount) maxAmount,
	MIN(amount) minAmount,
	SUM(amount) totalAmount,
	AVG(amount) avgAmount
from
	payments;

-- 4. COUNT - The COUNT() function returns the number of rows that matches a specified criterion.
select
	COUNT(o.orderNumber) totalOrders
from
	orders o ;

-- Query 1: Count the number of orders in progress
select
	count(o.orderNumber) underProcessing
from
	orders o
where
	o.status = 'IN PROCESS';

-- Group by - The GROUP BY statement groups rows that have the same values
-- 			 into summary rows, like "find the number of customers in each country".
-- The GROUP BY statement is often used with aggregate functions 
-- (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
select
	count(p.productCode) totalProducts,
	p.productLine
from
	products p
group by
	p.productLine ;

-- Query 2 - Count of employees that work in the same office
select
	e.officeCode,
	o.addressLine1 ,
	o.addressLine2 ,
	o.city ,
	o.postalCode ,
	o.state ,
	o.phone ,
	count(e.employeeNumber) totalEmployees
from
	employees e
join offices o on
	o.officeCode = e.officeCode
group by
	e.officeCode;

-- HAVING clause - The HAVING clause was added to SQL because the 
-- WHERE keyword cannot be used with aggregate functions.
select
	e.officeCode,
	o.addressLine1 ,
	o.addressLine2 ,
	o.city ,
	o.postalCode ,
	o.state ,
	o.phone ,
	count(e.employeeNumber) totalEmployees
from
	employees e
join offices o on
	o.officeCode = e.officeCode
group by
	e.officeCode
having
	totalEmployees > 4;	