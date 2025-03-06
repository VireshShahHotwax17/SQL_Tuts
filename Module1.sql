-- Select statement:
-- It is used to access records from one or more database tables and views.
-- The SELECT statement retrieves selected data based on specified conditions.
-- The result of a SELECT statement is stored in a result set or result table.
-- The SELECT statement can be used to access specific columns or all columns from a table.
-- It can be combined with clauses like WHERE, GROUP BY, HAVING, and ORDER BY for more refined data retrieval.
-- The SELECT statement is versatile and allows users to fetch data based on various criteria efficiently.

-- Selecting whole data from a table
SELECT
	*
FROM
	employees;

-- Selecting only few columns
SELECT
	e.firstName,
	e.lastName,
	e.email
FROM
	employees e;

-- Selecting data using certain conditions 
SELECT
	*
FROM
	employees
where
	officeCode = '1'
order by firstName;

-- To sort the data use order by clause by default ASCENDING order
-- syntax: select col1, col2....
-- 		   from table_name 
-- 		   where conditions 
-- 		   order by col_name DESC(optional for DESCENCDING );


-- Query-1: Give 10% discount to the prouducts
SELECT
	p.productCode,
	p.productName,
	p.buyPrice,
	p.MSRP sellingPrice,
	(p.MSRP * 0.9) discountPrice
FROM
	products p ;

-- Query-2: Orders that are not shipped
SELECT
	o.orderNumber,
	o.customerNumber,
	o.requiredDate,
	o.status,
	o.comments
FROM
	orders o
where
	o.status != 'SHIPPED';

-- Query-3: Get details of payment where the amount is greater than or equal to 40,000
SELECT
	*
FROM
	payments p
where
	p.amount >= 40000;


-- IN operator: It allows us to specify multiple values in where clause. It is shorthand operator of OR clause.
SELECT
	*
FROM
	employees e
where
	e.officeCode IN (1, 2, 4);

-- BETWEEN operator: Selects values within a given range. The values can be numbers, text, or dates.
--  It is inclusive: begin and end values are included. 
SELECT
	*
FROM
	orders o
where
	o.requiredDate BETWEEN '2003-02-01' and '2003-02-10';

-- LIKE operator: is used in a WHERE clause to search for a specified pattern in a column.
-- There are two wildcards often used in conjunction with the LIKE operator:
--  The percent sign % represents zero, one, or multiple characters
--  The underscore sign _ represents one, single character
SELECT
	*
FROM
	customers c
where
	c.contactFirstName like '%sh';

-- Handling the null values
SELECT
	*
from
	orders o
where
	o.comments is NULL;

SELECT
	*
from
	orders o
where
	o.comments is not NULL;



