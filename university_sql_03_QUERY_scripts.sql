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
-- SELECT s.students_name, c.courses_id, c.courses_title

SELECT s.students_name AS "STUDENT", c.courses_id, c.courses_title AS "COURSE"
FROM grades g
JOIN students s 
ON g.grades_students_id = s.students_id
JOIN courses c 
ON g.grades_courses_id = c.courses_id
ORDER BY g.grades_courses_id;



-- 4) Summary report of courses and their average grades, 
	-- sorted by the most challenging course (course with the lowest average grade) to the easiest course

		-- Junto --> ( COURSES + GRADES + PROFESSORS )
		--  SELECT c.courses_title, p.professors_name, g.grades_grade 
		-- 	FROM grades g
		-- 	JOIN courses c 
		-- 	ON g.grades_courses_id = c.courses_id
		-- 	JOIN professors p 
		-- 	ON g.grades_professors_id = p.professors_id;
        
-- AVERAGE GRADE ASC:
SELECT c.courses_title AS "COURSE", ROUND(AVG(g.grades_grade)) AS AVERAGE_GRADE
FROM grades g
JOIN courses c 
ON g.grades_courses_id = c.courses_id
GROUP BY g.grades_courses_id
ORDER BY AVERAGE_GRADE ASC; 


-- 5) Finding which student and professor have the most courses in common

	-- Junto --> ( STUDENTS + PROFESSORS + COURSES )
    
		-- SELECT s.students_name AS "STUDENT",  p.professors_name AS "PROFESSOR",  c.courses_id AS "COURSE ID"
-- 		FROM grades g
-- 		JOIN students s 
-- 		ON g.grades_students_id = s.students_id
-- 		JOIN professors p 
-- 		ON g.grades_professors_id = p.professors_id
-- 		JOIN courses c 
-- 		ON g.grades_courses_id = c.courses_id
-- 		GROUP BY s.students_name, p.professors_name, c.courses_id, c.courses_title
-- 		ORDER BY s.students_name ASC;

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

	









