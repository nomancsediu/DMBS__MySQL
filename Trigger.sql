CREATE DATABASE tri;
USE tri;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

drop table student_logs;

CREATE TABLE student_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(20),
    old_name VARCHAR(50),
    old_marks INT,
    new_name VARCHAR(50),
    new_marks INT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

##### BEFORE INSERT

DELIMITER //

CREATE TRIGGER before_student_insert
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF NEW.marks < 0 OR NEW.marks > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Marks must be between 0 and 100';
    END IF;
END //

DELIMITER ;


#### AFTER INSERT

DELIMITER //

CREATE TRIGGER after_student_insert
AFTER INSERT ON students
FOR EACH ROW
BEGIN
    INSERT INTO student_logs (action_type, old_name, old_marks, new_name, new_marks)
    VALUES ('INSERT', NULL, NULL, NEW.name, NEW.marks);
END //

DELIMITER ;


#### BEFORE UPDATE

DELIMITER //

CREATE TRIGGER before_student_update
BEFORE UPDATE ON students
FOR EACH ROW
BEGIN
    IF NEW.marks < 0 OR NEW.marks > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Marks must be between 0 and 100';
    END IF;
END //

DELIMITER ;


#### AFTER UPDATE

DELIMITER //

CREATE TRIGGER after_student_update
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
    INSERT INTO student_logs (action_type, old_name, old_marks, new_name, new_marks)
    VALUES ('UPDATE', OLD.name, OLD.marks, NEW.name, NEW.marks);
END //

DELIMITER ;

#### Before Delete

DELIMITER //

CREATE TRIGGER before_student_delete
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
    -- You can add validation here if needed
END //

DELIMITER ;

#### After Delete

DELIMITER //

CREATE TRIGGER after_student_delete
AFTER DELETE ON students
FOR EACH ROW
BEGIN
    INSERT INTO student_logs (action_type, old_name, old_marks, new_name, new_marks)
    VALUES ('DELETE', OLD.name, OLD.marks, NULL, NULL);
END //

DELIMITER ;



INSERT INTO students (name, marks) VALUES ('Sadia', 85);
INSERT INTO students (name, marks) VALUES ('Rafiq', 58);



SELECT * FROM students;
SELECT * FROM student_logs;



UPDATE students SET name = 'Sadia Akter', marks = 90 WHERE student_id = 1;
SELECT * FROM students WHERE student_id = 1;
SELECT * FROM student_logs ORDER BY log_id DESC LIMIT 1;



DELETE FROM students WHERE student_id = 2;
SELECT * FROM students;
SELECT * FROM student_logs ORDER BY log_id DESC LIMIT 1;









