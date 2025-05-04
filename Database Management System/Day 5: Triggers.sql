#before insert trigger
#--------------------------------------------
CREATE DATABASE IF NOT EXISTS triggers;
USE triggers;

CREATE TABLE IF NOT EXISTS customers (
    cust_id INT PRIMARY KEY AUTO_INCREMENT,
    age INT,
    name VARCHAR(50)
);

SHOW TABLES;

DELIMITER //

CREATE TRIGGER age_verify
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    IF NEW.age < 0 THEN
        SET NEW.age = 0;
    END IF;
END //

DELIMITER ;

SHOW TABLES;

INSERT INTO customers (age, name)
VALUES 
    (-5, 'John Doe'), 
    (25, 'Jane Smith');

-- Step 7: Select all data from `customers` to see the result
SELECT * FROM customers;


#After insert trigger
#--------------------------------------------
CREATE DATABASE IF NOT EXISTS triggers;
USE triggers;


CREATE TABLE IF NOT EXISTS message (
    messegeId INT PRIMARY KEY AUTO_INCREMENT,
    messege VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS customer1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    bday DATE
);


DELIMITER //

CREATE TRIGGER check_null_bday
AFTER INSERT ON customer1
FOR EACH ROW
BEGIN
    IF NEW.bday IS NULL THEN
        INSERT INTO message (messege)
        VALUES (CONCAT('Birthday is missing for customer: ', NEW.name));
    END IF;
END //

DELIMITER ;


INSERT INTO customer1 (name, bday) VALUES ('John Doe', NULL);   -- Will insert a message
INSERT INTO customer1 (name, bday) VALUES ('Lamia Akter', '2002-09-05'); -- No message

SELECT * FROM message;

#--------------------------------------------


-- Use or create the database
CREATE DATABASE IF NOT EXISTS trigger_demo;
USE trigger_demo;

-- Create the employee table
CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    salary INT
);


-- Create a log table to track salary changes
CREATE TABLE salary_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    old_salary INT,
    new_salary INT,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

#BEFORE UPDATE
#--------------
DELIMITER //

CREATE TRIGGER before_salary_update
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 10000 THEN
        SET NEW.salary = 10000;
    END IF;
END //

DELIMITER ;


#AFTER UPDATE
#------------
DELIMITER //

CREATE TRIGGER after_salary_update
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
    IF OLD.salary != NEW.salary THEN
        INSERT INTO salary_log (employee_id, old_salary, new_salary)
        VALUES (OLD.id, OLD.salary, NEW.salary);
    END IF;
END //

DELIMITER ;

-- Insert an employee
INSERT INTO employee (name, salary) VALUES ('Noman', 9000); -- Will be adjusted to 10000

-- Update salary
UPDATE employee SET salary = 12000 WHERE name = 'Noman'; -- Logged

-- Check employee table
SELECT * FROM employee;

#------------------------------------------


#before delete
#-----------------
-- Create the salary table
create table salary(
    id int primary key,
    validform date not null,
    amount float not null
);

-- Insert some data
insert into salary(id, validform, amount)
values (101, '2005-05-01', 55000),
       (102, '2006-05-01', 68000);

-- Create the salarydel table
create table salarydel (
    id int primary key auto_increment,
    eid int,
    validform date not null,
    amount float not null,
    deletedat timestamp default now()
);

-- Create trigger
delimiter $$

create trigger salary_delete
before delete
on salary
for each row
begin
    insert into salarydel(eid, validform, amount)
    values (old.id, old.validform, old.amount);
end$$

delimiter ;

-- Delete the entry with id = 102
delete from salary
where id = 102;

select * from salarydel;
