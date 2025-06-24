use practice_db;
-- 1. Basic SELECT Query
-- Fetch all columns from the students table
SELECT * 
FROM students;
SELECT * FROM university_students;
-- 2. SELECT Specific Columns
-- Fetch only first_name and email columns
SELECT first_name, email 
FROM students;

-- 3.WHERE Clause
-- Fetch students enrolled after a specific date
SELECT first_name, last_name, enrollment_date 
FROM students 
WHERE enrollment_date > '2024-01-01';

select * from students;

-- 4.Logical Operators
-- Fetch students enrolled in 2024 with a specific last name
SELECT first_name, last_name, enrollment_date 
FROM students 
WHERE enrollment_date BETWEEN '2024-01-01' AND '2024-12-31'
  AND last_name = 'Brown';

-- 5.OrderBy
-- Fetch students ordered by enrollment_date in descending order
SELECT first_name, last_name, enrollment_date 
FROM students 
ORDER BY enrollment_date DESC;

-- 6.Limit
-- Fetch the first 5 rows
SELECT first_name, last_name 
FROM students 
LIMIT 2;

-- 7. Aggregation with GROUP BY
-- Perform calculations on groups of rows using aggregate functions.
-- Common Aggregate Functions:
-- COUNT(): Counts the number of rows.
-- SUM(): Adds up values.
-- AVG(): Calculates the average.
-- MAX(): Finds the maximum value.
-- MIN(): Finds the minimum value.

-- Count the number of students by enrollment_date
SELECT enrollment_date, COUNT(*) AS total_students 
FROM students 
GROUP BY enrollment_date;

ALTER TABLE students 
ADD marks VARCHAR(3);

ALTER TABLE students 
MODIFY marks int ;

DELETE FROM students WHERE student_id is null;

select * from students;

UPDATE students
SET marks = CASE
    WHEN student_id = 2 THEN 35
    WHEN student_id = 3 THEN 45
    WHEN student_id = 4 THEN 75
    ELSE marks
END
WHERE student_id IN (2,3, 4);

-- Count the number of students by enrollment_date
SELECT sum(marks) AS total_sumofmarks
FROM students ;

SELECT avg(marks) AS avergeMark
FROM students ;

SELECT min(marks) AS minMark
FROM students ;

SELECT max(marks) AS maxMark
FROM students ;

-- Combined Aggregations
SELECT 
    SUM(marks) AS total_mark,
    AVG(marks) AS average_mark,
    MIN(marks) AS min_mark,
    MAX(marks) AS max_mark
FROM students;

SELECT 
    SUM(marks) AS total_sales,
    AVG(marks) AS average_order,
    MIN(marks) AS smallest_order,
    MAX(marks) AS largest_order
FROM students
GROUP BY student_id;

-- HAVING Clause
-- Fetch enrollment dates with more than 5 students
SELECT enrollment_date, COUNT(*) AS total_students 
FROM students 
GROUP BY enrollment_date 
HAVING total_students > 0;


INSERT INTO students (student_id, first_name, last_name, email) 
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Doe', 'jane.brown@example.com'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com'),
(4, 'Johni', 'Doei', 'johni.doei@example.com');

INSERT INTO courses (course_id, course_name, credits) 
VALUES 
(101, 'AI', 3),
(102, 'ML', 2),
(103, 'DL', 3),
(104, 'CV', 4);


INSERT INTO university_enrollments (enrollment_id, student_id, course_id, enrollment_date) 
VALUES 
(1, 1, 101, '2024-11-21'),
(2, 2, 102, '2024-10-21'),
(3, 3, 103, '2024-09-21'),
(4, 4, 104, '2024-11-20');


select * from courses;
select * from university_enrollments;
select * from students;



DELETE FROM enrollments;
DELETE FROM students;
DELETE FROM courses;

-- Insert students
INSERT INTO students (student_id, first_name, last_name, email) 
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Doe', 'jane.brown@example.com'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com'),
(4, 'Johni', 'Doei', 'johni.doei@example.com');

-- Insert courses
INSERT INTO courses (course_id, course_name, credits) 
VALUES 
(101, 'AI', 3),
(102, 'ML', 2),
(103, 'DL', 3),
(104, 'CV', 4);

-- Insert enrollments (correct table name)
INSERT INTO enrollments (enrollment_id, student_id, course_id) 
VALUES 
(1, 1, 101),
(2, 2, 102),
(3, 3, 103),
(4, 4, 104);
  

  
-- inner joins
-- Fetch students and their associated course names
SELECT students.first_name, students.last_name, courses.course_name ,courses.course_id,students.student_id
FROM students 
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id;

-- left joins
-- Fetch all students, including those not enrolled in any course
SELECT students.first_name, courses.course_name 
FROM students 
LEFT JOIN enrollments ON students.student_id = enrollments.student_id 
LEFT JOIN courses ON enrollments.course_id = courses.course_id;

-- Right Joins
SELECT students.student_id, first_name
FROM students
RIGHT JOIN enrollments
ON students.student_id = enrollments.student_id;
