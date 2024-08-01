USE university_sql_project_schema;

-- POPULATE COURSES TABLE:

BEGIN;
INSERT INTO courses(courses_title)
VALUES ( "HTML"); 
INSERT INTO courses(courses_title)
VALUES ( "CSS"); 
INSERT INTO courses(courses_title)
VALUES ( "JAVASCRIPT"); 
INSERT INTO courses(courses_title)
VALUES ( "PYTHON"); 
INSERT INTO courses(courses_title)
VALUES ( "REACT"); 
INSERT INTO courses(courses_title)
VALUES ( "SQL_DB"); 

SELECT *
FROM courses;

ROLLBACK;


-- POPULATE PROFESSORS TABLE:

BEGIN;
INSERT INTO professors (professors_name, professors_email_address)
VALUES ("Jordan", "jordan@demo.com"), ("Joaquín", "joaquin@demo.com"), ("Carlos", "carlos@demo.com");

SELECT *
FROM professors;
ROLLBACK;


-- POPULATE STUDENTS TABLE:

BEGIN;
INSERT INTO students(students_name, students_email_address)
VALUES ("Student_1", "student_1@demo.com");

INSERT INTO students(students_name, students_email_address)
VALUES ("Student_2", "student_2@demo.com");

INSERT INTO students(students_name, students_email_address)
VALUES ("Student_3", "student_3@demo.com");

INSERT INTO students(students_name, students_email_address)
VALUES ("Student_4", "student_4@demo.com");

INSERT INTO students(students_name, students_email_address)
VALUES ("Student_5", "student_5@demo.com");

INSERT INTO students(students_name, students_email_address)
VALUES ("Student_6", "student_6@demo.com");

INSERT INTO students(students_name, students_email_address)
VALUES ("Student_7", "student_7@demo.com");

INSERT INTO students(students_name, students_email_address)
VALUES ("Student_8", "student_8@demo.com");

INSERT INTO students(students_name, students_email_address)
VALUES ("Student_9", "student_9@demo.com");

INSERT INTO students(students_name, students_email_address)
VALUES ("Student_10", "student_10@demo.com");

ROLLBACK;

SELECT *
FROM students;

-- POPULATE GRADES TABLE:

-- (3) professors, (6) courses, (10) students 
-- 		Jordan (professor_id:1)-> courses_id: 1,5,6
-- 		Joaquin (professor_id:2) -> courses_id: 2, 4
-- 		Carlos (professor_id:3)-> courses_id: 3

-- 		NOTE: POPULATE grades_grade, further below, using RANDOM grades.

BEGIN;
INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 1, 1);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 1, 3);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 1, 5);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 1, 7);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 1, 8);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 1, 9);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 5, 1);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 5, 4);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 5, 6);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 5, 8);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 5, 10);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 6, 1);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 6, 2);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 6, 5);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(1, 6, 10);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(2,2,3);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(2,2,5);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(2,2,7);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(2,4,2);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(2,4,4);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(2,4,8);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(3,3,6);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(3,3,9);

INSERT INTO grades(grades_professors_id, grades_courses_id,  grades_students_id)
VALUES(3,3,10);

ROLLBACK;

SELECT *
FROM grades;

-- POPULATE grades_grade with RANDOM values from 0 to 100:

SET SQL_SAFE_UPDATES = 0;
BEGIN;
UPDATE grades
SET grades_grade = ROUND(RAND() * 100);
COMMIT;


ROLLBACK;


