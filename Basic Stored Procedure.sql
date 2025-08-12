create database pro;
use pro;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO Employees (emp_id, name, salary) VALUES
(101, 'Joy', 60000.00),
(102, 'Habib', 55000.00),
(103, 'Rakib', 70000.00),
(104, 'Sadia', 48000.00),
(105, 'Shamim', 52000.00);


#1. get_all_employees: Selects all employees, Parameters: None

delimiter //
create procedure get_all_employees()
begin
select * from employees;
end //
delimiter ;

call get_all_employees();



  
#2. get_employee_by_id: Selects employee by given ID, Parameters: IN (Employee ID)

delimiter //
create procedure get_employee_by_id(in empid int)
begin
select * from employees where emp_id= empid;
end //
delimiter ;

call get_employee_by_id(112);



  
#3. get_total_employees: Returns total number of employees, Parameters: OUT (Total count)  

delimiter //
create procedure get_total_employees(out totalCount int)
begin
select count(*) into totalCount from employees;
end //
delimiter ;

set @cnt = 0;
call get_total_employees(@cnt);
select @cnt;

#4. double_input: Doubles the input number, Parameters: INOUT (Input and output number)

delimiter //
create procedure double_input(inout number int)
begin
set number = number *2;
end //
delimiter ;

set @num = 15;
call double_input(@num);
select @num;

#5. insert_employee: Inserts a new employee record, Parameters: IN, IN, IN (Employee ID, Name, Salary)

delimiter //
create procedure insert_employee(in empid int, in name varchar(50), in sal DECIMAL(10, 2))
begin
insert into employees (emp_id,name,salary) values (empid,name,sal);
end //
delimiter ;

call insert_employee(107,"Abdullah",80000.00);
select * from employees;

#6. update_salary: Updates salary of an employee, Parameters: IN, IN (Employee ID, New Salary)  
delimiter //
create procedure update_salary(in empid int, in sal decimal(10,2) )
begin
update employees 
set salary = sal where emp_id=empid;
end //
delimiter ;

call update_salary(102,70000.00);



#7. delete_employee: Deletes an employee by ID, Parameters: IN (Employee ID)  
delimiter //
create procedure delete_employee(in empid int)
begin
delete from employees where emp_id = empid;
end //
delimiter ;

call delete_employee(104);

select * from employees;

