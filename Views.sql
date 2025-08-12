create database vi;
use vi;

CREATE TABLE departments (
    department VARCHAR(50) PRIMARY KEY,
    manager VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    hire_date DATE,
    FOREIGN KEY (department) REFERENCES departments(department)
);


INSERT INTO departments (department, manager) VALUES
('HR', 'Susan'),
('IT', 'John'),
('Marketing', 'Carla');

INSERT INTO employees (emp_id, name, department, salary, city, hire_date) VALUES
(101, 'Alice', 'HR', 50000, 'New York', '2020-02-15'),
(102, 'Bob', 'IT', 70000, 'San Francisco', '2019-08-01'),
(103, 'Charlie', 'IT', 65000, 'New York', '2021-01-20'),
(104, 'Diana', 'Marketing', 55000, 'Chicago', '2022-05-10'),
(105, 'Edward', 'HR', 48000, 'New York', '2018-11-23');




#1. Simple View: Select name and salary only

CREATE VIEW emp_name_salary AS
SELECT name, salary
FROM employees;

#2. Filtered View: Employees in IT department
CREATE VIEW it_employees AS
SELECT *
FROM employees
WHERE department = 'IT';

#3. Join View: Add department manager info
CREATE VIEW emp_with_manager AS
SELECT e.emp_id, e.name, e.department, d.manager
FROM employees e
JOIN departments d ON e.department = d.department;

#4. Aggregation View: Average salary per department
CREATE VIEW avg_salary_dept AS
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

#5. Updatable View: Employees with salary > 50,000
CREATE VIEW high_salary_emps AS
SELECT emp_id, name, salary
FROM employees
WHERE salary > 50000;

#6. Security View: Show only employee names and cities (hide salary)
CREATE VIEW emp_names_cities AS
SELECT name, city
FROM employees;

#7. View with Calculated Column: Employee years of service
CREATE VIEW emp_years_service AS
SELECT name, department, YEAR(CURDATE()) - YEAR(hire_date) AS years_of_service
FROM employees;

#8. View with DISTINCT: Unique cities where employees work
CREATE VIEW unique_cities AS
SELECT DISTINCT city
FROM employees;

#9. View with ORDER BY
CREATE VIEW employees_by_salary AS
SELECT name, salary
FROM employees
ORDER BY salary DESC;

#10. Complex View with Subquery: Employees earning above dept average salary
CREATE VIEW above_avg_salary AS
SELECT e.emp_id, e.name, e.department, e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

SELECT * FROM emp_name_salary;
SELECT * FROM it_employees;
SELECT * FROM emp_with_manager;
SELECT * FROM avg_salary_dept;
SELECT * FROM high_salary_emps;
SELECT * FROM emp_names_cities;
SELECT * FROM emp_years_service;
SELECT * FROM unique_cities;
SELECT * FROM employees_by_salary;
SELECT * FROM above_avg_salary;

DROP VIEW IF EXISTS emp_name_salary;
DROP VIEW IF EXISTS it_employees;
DROP VIEW IF EXISTS emp_with_manager;
DROP VIEW IF EXISTS avg_salary_dept;
DROP VIEW IF EXISTS high_salary_emps;
DROP VIEW IF EXISTS emp_names_cities;
DROP VIEW IF EXISTS emp_years_service;
DROP VIEW IF EXISTS unique_cities;
DROP VIEW IF EXISTS employees_by_salary;
DROP VIEW IF EXISTS above_avg_salary;


UPDATE high_salary_emps
SET salary = salary + 5000
WHERE emp_id = 102;

SELECT * FROM high_salary_emps;

DELETE FROM high_salary_emps
WHERE emp_id = 105;











