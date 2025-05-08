-- STUDENT MANAGEMENT SYSTEM PROJECT

CREATE TABLE Students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  gender CHAR(1),
  age INT
);

CREATE TABLE Courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100)
);

CREATE TABLE Marks (
  mark_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  marks INT,
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Attendance (
  attendance_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  date DATE,
  status VARCHAR(10),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- INSERT SAMPLE DATA

INSERT INTO Students VALUES (1, 'Ramesh', 'ramesh@email.com', 'M', 20);
INSERT INTO Courses VALUES (101, 'Mathematics');
INSERT INTO Marks VALUES (1, 1, 101, 85);
INSERT INTO Attendance VALUES (1, 1, 101, '2025-05-08', 'Present');

-- SAMPLE QUERIES

-- 1. Student Marks Report
SELECT s.name, c.course_name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Courses c ON m.course_id = c.course_id;

-- 2. Attendance Report
SELECT s.name, c.course_name, a.date, a.status
FROM Students s
JOIN Attendance a ON s.student_id = a.student_id
JOIN Courses c ON a.course_id = c.course_id;
