USE UniversityGangoDB;
-- 10 statements --insert
INSERT INTO Academic_rank(Academic_rank_title) VALUES('Instructor'),('Assistant Professor'),('Associate Professor'),('Professor');
INSERT INTO Gender(Gender_identity)VALUES ('female'), ('male');
INSERT INTO Rectors(firstname,lastname,age,email,phonenumber)VALUES ('Jaba','Samushia',53,'jaba.samushia@tsu.ge',599000000),
																	('Antonio ',' Díaz',59,'reitor@usc.gal',881811001);


INSERT INTO Lecturers(firstname,lastname,age,Email)VALUES ('José Ramóm ', ' Pichel Campos',47,'jose@gamil.com'),
													('Rufus','Gouws',59,'rhg@sun.ac.za'),
													 ('Pablo ', ' Gamallo Otero',63,'gamallopablito@yahoo.com'),
													 ('María José  ', 'Domínguez Vázquez',59, 'majo@majo.gmail.com'),
                                                       ('Peter',' Meyer',59,'meyer@ids-mannheim.de'),
													  ('Stephanie','Evert',45,'stephanie.evert@fau.de');
         
INSERT INTO Students(Student_name,Student_surname,Student_email,age)VALUES ('Karl', ' Benz','karlbenz@gmail.com',20),
																			 ('Thomas Alva ', 'Edison','t.edison@yahoo.com',23),
																			 ('George B.','Grant','grant.george@gmail.com',22),
																			 ('Gustav de', 'Laval', 'gustav.laval21@yahoo.com',21),
																			 ('Elijah','McCoy','elijah18McCoy@edu.com',20),
																			 ('Osbourne','Reynolds','osbourne.reynolds@gmail.com',19),
																			 ('John','Tregoning','john.trego@edu.gr',22);
INSERT INTO Schools(School_name)VALUES('Arts and Humanities'),('Engineering and Architecture'),('Health Sciences'),('Science'),('Social and Legal Sciences');
INSERT INTO Department(Department_title)VALUES('English and German Philology'),('Electronics and Computing'),('Biochemistry and Molecular Biology'),('Mathematics'),('Applied Economics');
INSERT INTO Degree_level(Degree_level_title)VALUES('Bachelor'),('Master'),('Doctorate');
INSERT INTO Module(Module_title) VALUES('Basics of lexicography'),
										('Metalexicography'),
										('History of lexicography'),
										('Modeling and representing data in digital lexicography'),
										('Research into dictionary use'),
										('Special field lexicography and terminology'),
										('Computational lexicography'),
										('Dictionaries and translation'),
										('Lexicography and lexicology'),
										('Dictionary planning and production'),
										('Learner lexicography');
INSERT INTO Course(Course_title) VALUES('Lexicography'),('Psychology'),('Applied Linguistics');
INSERT INTO Attendance(Attendance.student_id,Attendance.session_id,Attendance.Attendance_record) VALUES (1,1,0),(2,2,'true'),(3,3,'true');
-- 10 statements update
  
UPDATE School 
SET School_name = 'Linguistics'
WHERE School_id = 3;

UPDATE Gender
SET Gender_id= 2
WHERE Gender_id=3;

UPDATE Students
SET Student_surname = 'James'
WHERE Student_id = 5;

UPDATE Students
SET Student_name = 'John'
WHERE Student_id  = 2;


UPDATE Students
SET Student_email = 'john.trego@edu.com'
WHERE Student_id  = 7;

UPDATE Students
SET Student_email = 'mareG@edu.com',Student_name='Maree'
WHERE Student_id  = 4;


UPDATE Rectors
SET phonenumber = 599234567
WHERE Rector_id  = 1;

UPDATE Lecturers
SET age = 53
WHERE Lecturer_id  = 1;

UPDATE Lecturers
SET age = 53
WHERE Lecturer_id  = 2;

UPDATE Lecturers
SET age = 54
WHERE Lecturer_id  =2;

-- 5 statements alter
ALTER TABLE Lecturers
ADD Email varchar(255);

ALTER TABLE Degree_level
add Degree_descr varchar(255);
ALTER TABLE Degree_level
DROP Degree_descr;

ALTER TABLE Students
MODIFY Student_name VARCHAR(255);

ALTER TABLE University
  RENAME TO Universities;
ALTER TABLE School
  RENAME TO Schools;  
  
  
--  5 statements with left, right, inner, outer joins. 

SELECT * FROM Students 
LEFT JOIN Lecturers ON Students.Student_id = Lecturers.Lecturer_id
UNION
SELECT * FROM Students
RIGHT JOIN Lecturers ON Students.Student_id = Lecturers.Lecturer_id;


SELECT * FROM Schools 
LEFT JOIN Department on Schools.School_id=Department.Department_id;

SELECT * FROM Department
LEFT JOIN Schools on Schools.School_id=Department.Department_id;

SELECT * FROM Lecturers 
RIGHT JOIN Rectors on Lecturers.Lecturer_id = Rectors.Rector_id;

SELECT * FROM Rectors 
RIGHT JOIN Lecturers on Lecturers.Lecturer_id = Rectors.Rector_id;

SELECT Attendance.student_id , Students.Student_name, Student_surname, age
FROM Attendance
INNER JOIN Students ON Attendance.student_id = Students.Student_id;

-- self join
SELECT t1.Student_name, t2.Student_surname 
FROM Students t1 , Students t2 
WHERE t1.Student_id =t2.Student_id 
ORDER BY Student_surname;
-- 7 statements with aggregate functions and group by and without having.
SELECT COUNT(s.student_id), age
FROM Students s
GROUP BY age;

SELECT AVG(Lecturers.age), age
FROM Lecturers
GROUP BY age;

SELECT COUNT(Lecturer_id),lastname
FROM Lecturers 
GROUP BY lastname;

SELECT DISTINCT(Lecturers.age), lastname
FROM Lecturers
GROUP BY lastname;

SELECT MAX(age) AS MaxAge, Student_name
FROM Students
GROUP BY Student_name;

SELECT MIN(age),Student_surname
FROM Students 
WHERE Student_surname LIKE '%r%'
GROUP BY Student_surname;



SELECT COUNT(s.Student_id), age
FROM Students s
GROUP BY age
HAVING COUNT(s.Student_id) > 6;

SELECT COUNT(Student_surname)
FROM Students
GROUP BY Student_surname
HAVING COUNT(*) > 20;

-- 1 big statement to join all tables in the database.
SELECT *  FROM Students
join Lecturers on Student_id = Lecturer_id
join Rectors on Lecturer_id =Rector_id
join Campus on Rector_id =Campus_id
join Schools on  Campus_id =School_id 
join Module on School_id= Module_id
join Universities on Module_id =University_id
join Meeting_rooms on University_id=Meeting_room_id
join Semester on Meeting_room_id = Semester_id
join Gender on Semester_id = Gender_id
join Course on Gender_id= Course_id
join Department on Course_id = Department_id
join Degree_level on Department_id = Degree_level_id
join Academic_rank on Degree_level_id = Academic_rank_id
join Attendance on Academic_rank_id = Attendance.student_id;

DELETE FROM Gender WHERE Gender_id IN (1,2,4,5);
DELETE FROM Attendance WHERE Attendance.student_id IN (0,1,2,3);
DELETE FROM Lecturers WHERE Lecturer_id IN (1,2,3);
DELETE FROM Gender WHERE Gender_id = 2;
DELETE FROM Students WHERE Student_name = 'Maree';
DELETE FROM Rectors WHERE phonenumber LIKE '%8';
DELETE FROM Schools WHERE School_name LIKE 's%';
DELETE FROM Course WHERE Course_title = 'Lexicography';
DELETE FROM Department WHERE Department_id IN (1,2);
DELETE FROM Module WHERE Module_title = 'Metalexicography';