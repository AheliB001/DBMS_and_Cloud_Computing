create database cafeteria;

use cafeteria;

create table student_food_subscription (student_id INT PRIMARY KEY, food_subscribed BOOLEAN);

insert into student_food_subscription values (1, 0), (2,0),(3,1), (4,1),(5,0),(6,1),(7,0),(8,1),(9,1),(10,1);

CREATE VIEW student_library_cafetaria AS
SELECT b.StudentName, f.food_subscribed
FROM library.Students b
JOIN cafeteria.student_food_subscription f
ON b.StudentID = f.student_id;
    

SELECT * FROM student_library_cafetaria;




