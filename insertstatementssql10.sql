SELECT Students.Student_name, Students.Student_surname, Lecturers.Lecturer_id
FROM Students
FULL JOIN Lecturers ON Students.Student_id=Lecturers.Lecturer_id
ORDER BY Students.Student_name;

-- SELECT *
-- FROM Students
-- FULL JOIN Lecturers  ON Students.Student_id = Lecturers.Lecturer_id;
SELECT * FROM Students 
LEFT JOIN Lecturers ON Students.Student_id = Lecturers.Lecturer_id
UNION
SELECT * FROM Students
RIGHT JOIN Lecturers ON Students.Student_id = Lecturers.Lecturer_id;

SELECT COUNT(Student_id), age
FROM Students
GROUP BY age
HAVING COUNT(Student_id) > 6;