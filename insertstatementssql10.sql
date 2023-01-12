INSERT INTO Gender(Gender_identity)
VALUES ('female');
INSERT INTO Gender(Gender_identity)
VALUES ('male');
INSERT INTO Rectors(firstname,lastname,age,email,phonenumber)
VALUES ('Jaba','Samushia',53,'jaba.samushia@tsu.ge',599000000);
INSERT INTO Rectors(firstname,lastname,age,email,phonenumber)
VALUES ('Antonio ',' Díaz',59,'reitor@usc.gal',881811001);
INSERT INTO Lecturers(firstname,lastname,age)
VALUES ('María José  ', 'Domínguez Vázquez',59);
INSERT INTO Lecturers(firstname,lastname,age)
VALUES ('José Ramóm ', ' Pichel Campos',47),
		 ('Pablo ', ' Gamallo Otero',63);
INSERT INTO Students(Student_name,Student_surname,Student_email,age)
VALUES ('Karl', ' Benz','karlbenz@gmail.com',20),
		 ('Thomas Alva ', 'Edison','t.edison@yahoo.com',23),
         ('George B.','Grant','grant.george@gmail.com',22),
         ('Gustav de', 'Laval', 'gustav.laval21@yahoo.com',21),
         ('Elijah','McCoy','elijah18McCoy@edu.com',20),
         ('Osbourne','Reynolds','osbourne.reynolds@gmail.com',19),
         ('John','Tregoning','john.trego@edu.gr',22);
INSERT INTO School(School_name)
VALUES('Arts and Humanities'),('Engineering and Architecture'),('Health Sciences'),('Science'),('Social and Legal Sciences');
INSERT INTO Department(Department_title)
VALUES('English and German Philology'),('Electronics and Computing'),('Biochemistry and Molecular Biology'),('Mathematics'),('Applied Economics');
INSERT INTO Degree_level(Degree_level_title)
VALUES('Bachelor'),('Master'),('Doctorate');
  
  
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

SELECT Attendance.student_id , Students.Student_name
FROM Attendance
INNER JOIN Students ON Attendance.student_id = Students.Student_id;

SELECT COUNT(student_id), age
FROM Students
GROUP BY age;

SELECT COUNT(Student_id), age
FROM Students
GROUP BY age
HAVING COUNT(Student_id) > 6;

SELECT MAX(age) AS MaxAge
FROM Students;








-- DELETE FROM Gender WHERE Gender_id = 2;