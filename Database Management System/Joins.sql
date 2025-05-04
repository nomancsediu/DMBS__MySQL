create database sql_join;
show databases;
use sql_join;

create table cricket(cricket_id int auto_increment,
name varchar(25), primary key(cricket_id));

create table football(football_id int auto_increment,
name varchar(25), primary key(football_id));

insert into cricket(name)
values ("Noman"), ("Supan"), ("Tammam");
select * from cricket;

insert into football(name)
values ("Noman"), ("Supan"), ("Tammam");
select * from football;

select * from cricket as c inner join
football as f on c.name=f.name;

select c.cricket_id, c.name, f.football_id, f.name
from cricket as c inner join football as f on c.name = f.name;


#Accessing from classicmodels
#-----------------------------

use classicmodels;
show tables;
select * from products;
select * from productlines;
select productcode , productname, textdescription
from products
inner join productlines
using (productline);

select * from orders;
select * from orderdetails;

#Inner Join in SQL
#-----------------

SELECT 
    o.orderNumber, 
    o.status, 
    p.productName,
    SUM(od.quantityOrdered * od.priceEach) AS revenue
FROM 
    orders AS o
INNER JOIN 
    orderdetails AS od ON o.orderNumber = od.orderNumber
INNER JOIN 
    products AS p ON p.productCode = od.productCode
GROUP BY 
    o.orderNumber, o.status, p.productName;

#Left Join in SQL
#-----------------

select * from customers;
select * from orders;

SELECT
    c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.status
FROM 
    customers AS c
LEFT JOIN orders AS o 
    ON c.customerNumber = o.customerNumber
    where ordernumber is null;
    
    
#Right Join in SQL
#-------------------

select * from customers;
select * from employees;

SELECT 
    c.customerName,
    c.phone,
    e.employeeNumber,
    e.email
FROM
    customers AS c
RIGHT JOIN
    employees AS e
    ON e.employeeNumber = c.salesRepEmployeeNumber
ORDER BY 
    e.employeeNumber;
    
#End

#Self Join in SQL
#----------------
SELECT CONCAT(m.lastname, ',', m.firstname) AS manager,
       CONCAT(e.lastname, ',', m.firstname) AS employee
FROM employees AS e
INNER JOIN employees AS m 
    ON m.employeeNumber = e.reportsTo
ORDER BY manager;


#Full Join in SQL
#----------------

SELECT 
    c.customerName,
    o.orderNumber 
FROM
    customers AS c 
LEFT JOIN 
    orders AS o
ON 
    c.customerNumber = o.customerNumber

UNION

SELECT 
    c.customerName,
    o.orderNumber 
FROM
    customers AS c 
RIGHT JOIN 
    orders AS o
ON 
    c.customerNumber = o.customerNumber;

#End for today


