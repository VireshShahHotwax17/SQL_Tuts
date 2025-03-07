-- Query1- Total payments from each customer after a certain date
select
	p.customerNumber ,
	c.customerName ,
	SUM(p.amount) totalAmount
from
	payments p
join customers c on
	c.customerNumber = p.customerNumber
where
	p.paymentDate > '${yourDate}'
group by
	p.customerNumber;

-- Query2 - Value of each unique order sorted by total order value
select
	o.orderNumber,
	SUM(o.priceEach * o.quantityOrdered) totalAmount
from
	orderdetails o
group by
	o.orderNumber
order by
	totalAmount DESC;

-- Query3 - Value of each unique order and its customer details sorted by total order value
select
	o.orderNumber,
	c.customerNumber ,
	c.customerName ,
	c.phone ,
	SUM(o.priceEach * o.quantityOrdered) totalAmount
from
	orderdetails o
join orders o2 on
	o2.orderNumber = o.orderNumber
join customers c on
	c.customerNumber = o2.customerNumber
group by
	o.orderNumber
order by
	totalAmount DESC;

-- Query4 - Count of order by each customer, also fetch details of the sales person
select
	o.customerNumber,
	count(o.orderNumber) totalOrders,
	e.employeeNumber,
	e.firstName,
	e.lastName,
	e.jobTitle
from
	orders o
join customers c on
	c.customerNumber = o.customerNumber
join employees e on
	e.employeeNumber = c.salesRepEmployeeNumber
group by
	o.customerNumber
order by
	totalOrders DESC ;

-- Query5 - Number of order through each sales representative
select
	e.employeeNumber,
	e.firstName,
	e.lastName,
	e.jobTitle,
	count(o.orderNumber) totalOrders
from
	orders o
join customers c on
	c.customerNumber = o.customerNumber
join employees e on
	e.employeeNumber = c.salesRepEmployeeNumber
group by
	e.employeeNumber 
order by
	totalOrders DESC ;

-- Query6 - Customers whose total orders value > 35, 000
select
	o.customerNumber ,
	SUM(o2.priceEach * o2.quantityOrdered) totalAmountOfOrders
from
	orders o
join orderdetails o2 on
	o2.orderNumber = o.orderNumber
GROUP by
	o.orderNumber
having
	totalAmountOfOrders > 35000
order by
	totalAmountOfOrders DESC;