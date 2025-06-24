create database varsitylab;
use varsitylab;

#All about table create---------------------------------------
#-------------------------------------------------------------
create table student(
student_id int primary key auto_increment,
name varchar(255),
age int,
city varchar(255)
);

create table course(
course_id int primary key auto_increment,
course_name varchar(255),
credit int
);

create table enrollment(
enroll_id int primary key auto_increment,
student_id int,
course_id int,
semester varchar(255),
foreign key (student_id) references student(student_id),
foreign key (course_id) references  course(course_id)
);

create table instructor(
instructor_id int primary key auto_increment,
name varchar(255) not null,
department varchar(255)
);
show tables;
select * from student;
select * from course;
select * from enrollment;
select * from instructor;
drop table instructor;
#-------------------------------------------------------------


#All about alter ---------------------------------------------
#-------------------------------------------------------------
alter table student
add column email varchar(255) after city;

alter table student
drop column email;

alter table student
rename column city to town;

alter table student 
modify name varchar(255) not null;

alter table student
add column dept varchar(255);

alter table student
add column reg_time timestamp;
#-------------------------------------------------------------


#All about constraints----------------------------------------
#-------------------------------------------------------------
alter table student
modify column age int
check (age>18);

create index idx on student(student_id);

alter table student
modify column dept varchar(255) default 'CSE';

alter table student
modify column name varchar(255) unique;

#not null, unique, primary key, foreign key, check, index
#-------------------------------------------------------------


#All about DML(Insert,Delete,Update)--------------------------
#-------------------------------------------------------------
select * from student;
select * from course;
select * from enrollment;
select * from instructor;

-- ALTER TABLE Enrollment DROP FOREIGN KEY enrollment_ibfk_1;
-- truncate table student;
-- alter table student auto_increment=1;
-- alter table enrollment
-- add foreign key (student_id) references student(student_id);

#Insert
insert into student (name,age,town,reg_time) values
("Abdullah Al Noman",23,"Kushtia",current_timestamp());
insert into student (name,age,town,reg_time) values
("Lamia Aktar",22,"Kushtia",current_timestamp()),
("Supan Roy",24,"Bagerhat",current_timestamp()),
("Samira Haque Vabna",22,"Bogura",current_timestamp()),
("Halima Akter",24,"Dhaka",current_timestamp()),
("Saiful Islam",24,"Comilla",current_timestamp()),
("Fatema Akter ",23,"Dhaka",current_timestamp());


insert into course(course_name,credit) values
('Database',3),
('Computer Networks',3),
('System Analysis',3),
('Data Structure',3),
('Algorithms',3);

insert into enrollment (student_id, course_id, semester) values
(1, 1, 'Spring 2025'),
(2, 2, 'Fall 2024'),
(3, 3, 'Spring 2025'),
(4, 4, 'Summer 2024'),
(5, 5, 'Fall 2024');


#Update
update student 
set town = 'Chuadanaga'
where student_id = '2';

#Delete
delete from student
where name = 'Saiful Islam';
#-------------------------------------------------------------


#All about Select---------------------------------------------
#-------------------------------------------------------------

select * from student;
select distinct town from student;

select * from student
where age > 22;

select * from student
order by age desc;

select name from student
where town='Dhaka' and age>23;

select name from student
where town = 'Kushtia' or town ='Dhaka';

select * from student
where town!='Dhaka';

select name from student 
where name like 'S%';

select name from student 
where name like '%r';

select name from student 
where name like '%man%';

select * from student
where town in ('Dhaka','Kushtia');

select * from student
where age between 18 and 22;

select name as student_name from student;

#-------------------------------------------------------------


#All about aggregate---------------------------------------------
#----------------------------------------------------------------

select count(*) from student; #count of total student

select town, count(student_id) as student_cnt 
from student
group by town;

select student_id , count(course_id) as enroll_count
from enrollment
group by student_id;

select course_id , count(*) as total_course_enroll
from enrollment
group by course_id;

select min(credit) as min_credit , max(credit) as max_credit from course;

select town, count(student_id) as student_cnt 
from student
group by town
having student_cnt > 1;

select * from student
order by age desc limit 2;
#-------------------------------------------------------------
