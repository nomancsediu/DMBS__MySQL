create table emp_details (Name varchar(25), Age int, sex char(1), 
doj date, city varchar(15), salary float);
describe emp_details;

insert into emp_details (Name, Age, sex, doj, city, salary)
values
('Alice', 28, 'F', '2020-06-15', 'Dhaka', 55000.00),
('Noman', 22, 'M', '2023-01-10', 'Chittagong', 45000.00),
('Rahim', 30, 'M', '2019-09-01', 'Sylhet', 60000.00),
('Sumaiya', 25, 'F', '2021-11-20', 'Rajshahi', 52000.00);

select * from emp_details;
select distinct city from emp_details;

select count(name) as count_name from emp_details;
select sum(salary) from emp_details;
select avg(salary) from emp_details;

select name, age , city from emp_details;

select * from emp_details where age> 20;

select name, sex, city from emp_details where sex='F';

select * from emp_details where 
city = 'Dhaka' or city = 'Rajshahi'; 

select * from emp_details where 
city in ('Dhaka','Rajshahi');

select * from emp_details where
doj between '2020-06-15' and  '2021-11-19';

select * from emp_details where
age>20 and sex='F';

select sex, sum(salary) as total_salary from emp_details
group by sex;

select * from emp_details order by salary;
select * from emp_details order by salary desc;

select (10*20) as addition;

-- select length('India') as total_len;
-- select repeat('@', 10);

-- select upper('India');
-- select lower('BANGLADESH');

-- select curdate();
-- select curtime();
-- select day(curdate());

# String Functions

SELECT UPPER('india') AS upper_case;
select lower('INDIA') as lower_case;
select lcase('INDIA') as lower_case;

select character_length('Bangladesh') as total_len;
select concat('Bangladesh',' is',' in',' Asia');

select reverse('madam');
select replace('Orange is a vegetable',"vegetable","fruit");

select length("         Bangladesh       ");
select length(LTRIM("         Bangladesh       "));
select length(RTRIM("         Bangladesh       "));
select length(TRIM("         Bangladesh       "));

select position("fruit"  in "Orange is a fruit") as name;

select ascii("a");







