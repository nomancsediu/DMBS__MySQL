#Procedure
#------------------------------------------------------
#First the INNER Query is executed                    |
#INNER Query gives following result                   |
#Output of inner query is substitued in outer query   |
#On execution, the outer query gives the result       |
#------------------------------------------------------

#Subqueries with the SELECT Statement
#-------------------------------------

CREATE DATABASE company;
USE company;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (name, department, salary) VALUES
('Noman', 'IT', 60000),
('Zabin', 'HR', 50000),
('Koli', 'IT', 70000),
('Lamia', 'Finance', 55000),
('Supan', 'IT', 65000);

select * from employees;


select name, department, salary from employees
where salary < (select avg(salary) from employees);


#Subqueries with the INSERT Statement
#-------------------------------------
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO products  ( name, category, price, stock)
values ("Airpods", "Electronics", 800.00, 15);

SELECT name, price
FROM products
WHERE price > (SELECT avg(price) FROM products);

#Subqueries with the UPDATE Statement
#-------------------------------------
create table customers(
 id int primary key auto_increment,
 name varchar(100),
 email varchar(100),
 reg_date date,
 country varchar(50)
 );
 
INSERT INTO customers (name, email, registration_date, country)
VALUES 
("Noman", "abd", "2025-05-10", "BD"),
("Lamia", "lam", "2025-05-20", "BD");

UPDATE customers
SET country = 'USA'
WHERE country = (
    SELECT country FROM customers WHERE name = 'Noman'
);

#Subqueries with the UPDATE Statement
#-------------------------------------

CREATE TEMPORARY TABLE temp_salaries AS
SELECT salary FROM employees WHERE salary < 50000;

DELETE FROM employees
WHERE salary IN (SELECT salary FROM temp_salaries);

DROP TEMPORARY TABLE temp_salaries;

#-------------------------End--------------------------#




 




