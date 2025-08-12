create database pro;
use pro;
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO Student (student_id, name, marks) VALUES
(1, 'Sadia', 85),
(2, 'Rafiq', 58),
(3, 'Lima', 40),
(4, 'Nadim', 75),
(5, 'Rina', 30);


#1. checkPassFail: Checks if mark is pass or fail, Parameters: IN (mark)
 delimiter //
 create procedure checkPassFail(in mark int)
 begin
 if mark>=40 then
 select 'Pass' as Result;
 else 
 select 'Fail' as Result;
 end if;
 end //
 delimiter ;
 
 call  checkPassFail(30);
 

#2. checkStudentPerformance: Checks performance level based on mark, Parameters: IN (mark) 
delimiter //
create procedure checkStudentPerformance(in mark int)
begin
if mark >= 80 then
select 'Excellent' as Performance;
elseif mark>= 60 then
select 'Good' as Performance;
elseif mark>= 40 then
select 'Avarage' as Performance;
else
select 'Poor' as Performance;
end if;
end //
delimiter ;

call checkStudentPerformance(90);
call checkStudentPerformance(30);

#3. istopper: Checks if student is topper, Parameters: IN (mark)  
delimiter //
create procedure istopper(in mark int)
begin
if mark>=90 then
select 'Topper' as Status;
else
select 'Not Topper' as Status;
end if;
end //
delimiter ;


call istopper(92);
call istopper(82);

#4. grade: Assigns grade based on mark (CASE statement), Parameters: IN (mark)  
delimiter //
create procedure grade(in mark int)
begin
 select case
 when mark>=80 then 'A+'
 when mark>=75 then 'A'
 when mark>=70 then 'A-'
 when mark>=40 then 'D'
 else 'F'
 end as Grade;
end //
delimiter ;
 
call grade(30);

#5. addStudentNotExist: Adds student if not already exists, Parameters: IN, IN, IN, IN (student_id, name, department, mark)  
delimiter //
create procedure addStudentNotExist(
in sid int,
in sname varchar(50),
in smark int )

begin
if not exists ( select * from student where student_id = sid) then
insert into student(student_id, name, marks) values (sid,sname,smark);
select 'Student Added' as Message;
else
select 'Student already exists' as Message;
end if;
end //
delimiter ;
drop procedure addStudentNotExist;
call addStudentNotExist(6,"Abdullah",90);
call addStudentNotExist(1,"Sadia",85);
select * from student;

#6. loopExample: Demonstrates LOOP statement counting 1 to 5, Parameters: None 
delimiter //
create procedure loopExample()
begin
declare counter int default 1;
loop_label: LOOP
if counter > 5 then
leave loop_label;
end if;
select counter as number;
set counter = counter + 1;
end LOOP loop_label;
end //
delimiter ;

call loopExample();

#7. whileExample: Demonstrates WHILE loop counting 1 to 5, Parameters: None 

delimiter //
create procedure whileExample()
begin
declare counter int default 1;
while counter <=5 do
select counter as number;
set counter = counter + 1;
end while;
end //
delimiter ;

call whileExample();

 
#8. repeatExample: Demonstrates REPEAT loop counting 1 to 5, Parameters: None  

delimiter //
create procedure repeatExample()
begin
declare counter int default 1;
repeat_label : REPEAT
select counter as number;
set counter = counter +1;
until counter > 5 
end REPEAT;
end //
delimiter ;

call repeatExample();


