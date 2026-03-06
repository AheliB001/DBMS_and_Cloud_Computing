create database student_course;
use student_course;

create table Student (Student_id INT PRIMARY KEY, Programme VARCHAR(10), DOB DATE, City VARCHAR(30));

create table Course (Course_ID INT PRIMARY KEY, Course_name VARCHAR(50), Course_coordinator VARCHAR(50));

insert into Student values (1,'MSc','2004-07-02','Kolkata'),(2,'MSc','2002-06-05','Mumbai'),(3,'PhD','2000-03-03','Delhi'),(4,'PhD','2000-02-02','Bangalore');

insert into Course values (101,'Data Science','Dr. Nithya Ramakrishnan'),(102,'Algorithms for Computational Biology','Dr. S.Thiyagarajan'),(103,'Machine Learning','Dr. Shyam G'),(104,'Mathematics for Data Science','Dr. R.Srivatsan'),(105,'Microbiology','Dr.Bibha Chaudhari');

create table Enroll (Student_id INT, Course_ID INT, PRIMARY KEY (Student_id, Course_ID), FOREIGN KEY (Student_id) REFERENCES Student(Student_id), FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID));
