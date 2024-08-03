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



-- SELECT s.students_name AS "STUDENT" , p.professors_name AS "PROFESSOR", COUNT(DISTINCT c.courses_id) AS COURSES_IN_COMMON
-- FROM grades g
-- JOIN students s 
-- ON g.grades_students_id = s.students_id
-- JOIN professors p 
-- ON g.grades_professors_id = p.professors_id
-- JOIN courses c 
-- ON g.grades_courses_id = c.courses_id
-- GROUP BY s.students_name, p.professors_name
-- ORDER BY COURSES_IN_COMMON DESC;   -- .......-> RESULT ---> We can see ALL the combinations in descend order 


-- BUT.......................We´re looking for ONLY ---> THE COMBINATIONS (students and teachers) 
-- that MEET THE CONDITION of having the MAXIMUM NUMBER of courses in common --->(MAX(CoursesInCommon))


-- TRYING OTHER SOLUTIONS: 
-- **********************

-- OPTION A) Using conditional "HAVING" 
-- ***********************************

-- allows us to apply conditions to the AGGREGATED results after GROUP BY, 
-- useful to filter specific groups based on certain conditions. 
-- similar to "WHERE" (BUT se usa  before applying GROUP BY)

-- The main query compares the actual number of courses in common in each combination with the maximum number:

SELECT student, professor, MAX(CoursesInCommon) AS "Max Courses in Common"
FROM (
    -- Subquery to calculate the number of courses in common between students and professors
    SELECT s.students_name AS student,
           p.professors_name AS professor,
           COUNT(DISTINCT c.courses_id) AS CoursesInCommon
    FROM grades g
    JOIN students s ON g.grades_students_id = s.students_id
    JOIN professors p ON g.grades_professors_id = p.professors_id
    JOIN courses c ON g.grades_courses_id = c.courses_id
    GROUP BY s.students_name, p.professors_name
) AS Subquery
GROUP BY student, professor

-- Filter to include ONLY combinations with the MAXIMUM NUMBER of courses in common
HAVING MAX(CoursesInCommon) = (
    -- Subquery to find the overall maximum number of courses in common
    SELECT MAX(CoursesInCommon) FROM (
        SELECT COUNT(DISTINCT c.courses_id) AS CoursesInCommon
        FROM grades g
        JOIN students s ON g.grades_students_id = s.students_id
        JOIN professors p ON g.grades_professors_id = p.professors_id
        JOIN courses c ON g.grades_courses_id = c.courses_id
        GROUP BY s.students_name, p.professors_name
    ) AS MaxCourses
);

-- OPTION B) Using "WHERE" and "Common Table Expression (CTE)"" -- https://learnsql.com/blog/cte-with-examples/
-- ************************************************************

-- Same result as OPTION A) using HAVING.

-- CTE --> to calculate the number of courses in common between students and professors
WITH cte AS (
    SELECT s.students_name AS student,
           p.professors_name AS professor,
           COUNT(DISTINCT c.courses_id) AS CoursesInCommon
    FROM grades g
    JOIN students s ON g.grades_students_id = s.students_id
    JOIN professors p ON g.grades_professors_id = p.professors_id
    JOIN courses c ON g.grades_courses_id = c.courses_id
    GROUP BY s.students_name, p.professors_name
)

SELECT student, professor, CoursesInCommon
FROM cte
-- Filter to include ONLY combinations with the MAXIMUM NUMBE of courses in common
WHERE CoursesInCommon = (SELECT MAX(CoursesInCommon) FROM cte);


-- In both solutions the result is the same:
-- It returns (3) student-professor combinations , all of them with the maximum number of courses in common 
-- which is 3 as well. 

-- RESULT: 3 columns with 3 rows: Student_1|Jordan|3, Student_11|Joaquín|3 and Student_12|Joaquín|3

-- I added two more students (Student_11, Student_12), one more course (REDIS), etc to have some more sample data to play with.
-- Before there was only (1) student-profeesor combination that has the maximum number (3), after adding the new data,
-- I have (3) pairs that match the maximum number of (3).


	









