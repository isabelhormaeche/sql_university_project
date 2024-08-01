USE university_sql_project_schema;

-- 1) Average grade that is given by each profesor

SELECT p.professors_name AS "PROFESSOR" , ROUND(AVG(g.grades_grade)) AS 'AVERAGE GRADE'
FROM grades g
JOIN professors p 
ON g.grades_professors_id = p.professors_id
GROUP BY g.grades_professors_id;

-- 2) Top grades for each student

SELECT s.students_name AS "STUDENT", MAX(g.grades_grade) AS TOP_GRADE
FROM grades g
JOIN students s 
ON g.grades_students_id = s.students_id
GROUP BY g.grades_students_id;


-- 3) Sort students by the courses that they are enrolled in


SELECT s.students_name AS "STUDENT", c.courses_id, c.courses_title AS "COURSE"
FROM grades g
JOIN students s 
ON g.grades_students_id = s.students_id
JOIN courses c 
ON g.grades_courses_id = c.courses_id
ORDER BY g.grades_courses_id;



-- 4) Summary report of courses and their average grades, 
	-- sorted by the most challenging course (course with the lowest average grade) to the easiest course

		       
SELECT c.courses_title AS "COURSE", ROUND(AVG(g.grades_grade)) AS AVERAGE_GRADE
FROM grades g
JOIN courses c 
ON g.grades_courses_id = c.courses_id
GROUP BY g.grades_courses_id
ORDER BY AVERAGE_GRADE ASC; 


-- 5) Finding which student and professor have the most courses in common

	

SELECT s.students_name AS "STUDENT" , p.professors_name AS "PROFESSOR", COUNT(c.courses_id) AS COURSES_IN_COMMON
FROM grades g
JOIN students s 
ON g.grades_students_id = s.students_id
JOIN professors p 
ON g.grades_professors_id = p.professors_id
JOIN courses c 
ON g.grades_courses_id = c.courses_id
GROUP BY s.students_name, p.professors_name
ORDER BY COURSES_IN_COMMON DESC;

	









