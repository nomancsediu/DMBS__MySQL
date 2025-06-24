#Database Level
#--------------
create database CollegeDB;
Drop database CollegeDB;

create database CollegeDB;
use CollegeDB;
show databases;
show databases like 'CollegeDB';

#Table Operations
#----------------
#Student Table
create table student (
      student_id int,
      name varchar(255),
      age int,
      city varchar(255)
);
show tables;
select * from student;

#Course Table
-- create table course(
--       course_id int,
--       course_name varchar(255),
--       credit int
-- );
-- select * from course;

#Enrollment table
create table enrollment(
enroll_id int,
student_id int,
course_id int,
semester varchar(255)
);
select * from enrollment;

#Instructor Table
create table instructor(
instructor_id int,
name varchar(255),
department varchar(255)
);
select * from instructor;

Drop table enrollment;
show tables;

Alter table student
add email varchar(255);
select * from student;

Alter table student
drop age;
select * from student;

Drop table course;

#Constraint apply
create table course(
      course_id int,
      course_name varchar(255),
      credit int,
      check (credit>0)
);

alter table student
modify column student_id int primary key;

create table enrollment(
enroll_id int,
student_id int,
course_id int,
semester varchar(255),
foreign key (student_id) references student(student_id)
);

alter table instructor
modify name varchar(255) not null unique;

alter table instructor
modify department varchar(255) default 'CSE';

create index idx on student (name);

alter table enrollment
modify enroll_id int primary key auto_increment;
select * from student;

alter table student
drop column email;
alter table student
add column age int after name;
#DML 
insert into student(student_id,name,age,city) values
(1,'Abdullah Al Noman',23,'Kushtia'),
(2,'Lamia Aktar',23,'Chuadanga'),
(3,'Supan Roy',23,'Bagerhat'),
(4,'Samira Haque Vabna',23,'Bogura'),
(5,'Halima Akter',23,'Dhaka');

select * from student;

#Update
update student
set city = 'Kushtia'
where student_id = '2';
select * from student;

#Delete
delete from student 
where name = 'Halima Akter';
select * from student;
select distinct city from student;
select age from student 
where age>22;

select * from student
order by name desc;

select name from student 
where city='Kushtia' and age >20;

select name from student
where not city='Kushtia';

select name from student
where name like 'A%';

select name from student 
where name like '%n';

select name from student
where name like '%na%';

select * from student
where city in ('Dhaka', 'Kushtia');

select name from student
where age between 18 and 22;
 
 select name as student_name from student where name like 'A%';
 
 #Aggregate Functions
 
 select count(*) as total_students
 from student;

select city, count(*) as student_count
from student
group by city;

INSERT INTO course (course_id, course_name, credit) VALUES
(101, 'Data Structures', 3),
(102, 'Database Systems', 4),
(103, 'Computer Networks', 3);

select * from enrollment;
drop table enrollment;

ALTER TABLE enrollment 
add primary key (course_id);
ALTER TABLE course
add primary key (course_id);

ALTER TABLE enrollment 
add foreign key (course_id) references course(course_id);

SELECT student_id, COUNT(course_id) AS total_courses
FROM Enrollment
GROUP BY student_id;


SELECT * FROM Enrollment;

INSERT INTO enrollment (enroll_id, student_id, course_id, semester) VALUES
(1, 1, 101, 'Spring 2025'),
(2, 2, 102, 'Spring 2025'),
(3, 1, 103, 'Fall 2024');

select course_id , count(student_id) as total_enroll
from enrollment
group by course_id;

select min(credit) as minimum , max(credit) as maximum
from course;

select avg(age) as avg_age from student;

select city, count(*) as student_count
from student
group by city
having count(*) > 1; 

select * from student
order by age desc
limit 3;






