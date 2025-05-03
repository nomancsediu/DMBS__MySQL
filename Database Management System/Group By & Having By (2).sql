show databases;
use sql_intro;
show tables;
create table employees(Emp_id int primary key, Emp_name varchar(25),
 Age int, Gender char(1), Doj date,Dept varchar(20), City varchar(20),
 Salary float);
describe employees;

INSERT INTO employees VALUES 
(101, 'Alice Smith', 30, 'F', '2020-01-15', 'HR', 'New York', 55000.0),
(102, 'Bob Johnson', 28, 'M', '2019-06-23', 'IT', 'Chicago', 60000.0),
(103, 'Charlie Brown', 35, 'M', '2018-03-12', 'Finance', 'Dallas', 75000.0),
(104, 'Diana Prince', 32, 'F', '2021-11-01', 'Marketing', 'Los Angeles', 58000.0),
(105, 'Ethan Hunt', 29, 'M', '2022-05-30', 'IT', 'San Francisco', 62000.0);

select * from employees;
select distinct city from employees;
select distinct dept from employees;
select avg(age) from employees;

#avg age in each dept
select dept, round(avg(age),1) as avarage_age from employees 
group by dept;

select dept, sum(salary) as total_salary from employees
group by dept;

select count(emp_id), city from employees
group by city
order by count(emp_id) desc;

select year(doj) as year, count(emp_id)
from employees
group by year(doj);


#Another Table 
create table sales (product_id int,sell_price float, quantity int,
state varchar(20));
INSERT INTO sales VALUES
(101, 500.0, 2, 'Dhaka'),
(102, 1200.0, 1, 'Chittagong'),
(103, 750.0, 5, 'Rajshahi'),
(104, 300.0, 10, 'Khulna'),
(105, 950.0, 3, 'Barisal');

select * from sales;
select product_id, sum(sell_price * quantity) as revenue
from sales 
group by product_id;

create table c_product ( product_id int, cost_price float);

insert into c_product values
(101,400.0),
(102,950.0),
(103,600.0),
(104,250.0),
(105,800.0);

select * from c_product;

select c.product_id, sum((s.sell_price - c.cost_price)* s.quantity) as
profit from sales as s inner join c_product as c
where s.product_id = c.product_id
group by c.product_id;

#Having Clause
select * from  employees;

select dept , avg(salary) as avarage_salary 
from employees 
group by dept
having avg(salary)>55000;

select city , sum(salary) as total
from employees 
group by city
having sum(salary)>55000;

select dept, count(*) as emp_count
from employees
group by dept
having count(*)>1;

select city , count(*) as emp_count 
from employees
where city !="Los Angeles"
group by city
having count(*)>0;







