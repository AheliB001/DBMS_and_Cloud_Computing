-- 0)
create database student_employee;
use student_employee;

create table STUDENT (student_id INT PRIMARY KEY, name VARCHAR(40), marks INT, department VARCHAR(50));

create table EMPLOYEE (emp_id INT PRIMARY KEY, name VARCHAR(40), salary INT, department VARCHAR(50));

create table ACCOUNT (acc_no INT PRIMARY KEY, holder_name VARCHAR(40), balance DECIMAL(10,2));

insert into EMPLOYEE values (1, "Ashish", 50000, "Sales"), (2, "Riyansh", 54000, "Junior Data Scientist"),(3, "Kabir", 67000, "Senior Data Scientist"), (4, "Priyam", 56000, "Junior Data Scientist"), (5, "Ahana", 60000, "Sales");

insert into ACCOUNT values (101, "Shabana", 20000), (102, "Naman", 47000);



-- 1)
delimiter //

create procedure insert_student(
    -> in n_student_id INT, n_name VARCHAR(40), n_marks INT, n_department VARCHAR(50)
    -> )
    -> begin
    -> insert into STUDENT(student_id, name, marks, department)
    -> values (n_student_id, n_name, n_marks, n_department);
    -> end //

delimiter ;

call insert_student(1, 'Aheli', 85, "Bioinformatics");
call insert_student(2, 'Diana', 82, "Data Science");
call insert_student(3, 'Kashish', 74, "Immunology");
call insert_student(4, 'Rishabh', 89, "Mathematics");
call insert_student(5, 'Kangana', 69, "Biostatistics");




-- 2)
delimiter //

create procedure salary_increase(in emp VARCHAR(50))
    -> begin
    -> update EMPLOYEE set salary = salary + salary*(0.10) where department = emp;
    -> end //

delimiter ;

call salary_increase("Junior Data Scientist");




-- 3.a)
delimiter //

create function check_result(marks int)
	-> returns varchar(10)
    -> deterministic
    -> begin
    -> if marks >= 40 then
    -> return 'pass';
    -> else
    -> return 'fail';
    -> end if;
    -> end //

delimiter ;




-- 3.b)
select *, check_result(marks) from STUDENT;




-- 4)
delimiter //

create function ceil_random()
returns int
deterministic
begin
    return ceil(rand() * 100);
end //

delimiter ;

select ceil_random();




-- 5)
delimiter //

create trigger emp_uppercase
before insert on EMPLOYEE
for each row
begin
    set new.name = upper(new.name);
end //

delimiter ;




-- 6)
delimiter //

create trigger physics_extra_marks
before insert on STUDENT
for each row
begin
    if new.department = 'Physics' then
        set new.marks = new.marks + 2;
    end if;
end //

delimiter ;




-- 7.a)
create table employee_log(emp_id INT PRIMARY KEY, log VARCHAR(50));


-- 7.b)
delimiter //

create trigger log_salary
after update on EMPLOYEE
for each row
begin
if OLD.salary <> NEW.salary then
insert into employee_log(emp_id, log)
values (new.emp_id, concat('Salary changed from ', OLD.salary, ' to ', new.salary));
end if;
end //

delimiter ;


-- 7.c)
update EMPLOYEE set salary = 50000 where emp_id = 5;

select * from employee_log;

-- +--------+------------------------------------+
-- | emp_id | log                                |
-- +--------+------------------------------------+
-- |      5 | Salary changed from 60000 to 50000 |
-- +--------+------------------------------------+




-- 8.a)
update ACCOUNT set balance = balance + 1000 where acc_no = 101;

update ACCOUNT set balance = balance - 1000 where acc_no = 102;

select * from ACCOUNT;
-- +--------+-------------+----------+
-- | acc_no | holder_name | balance  |
-- +--------+-------------+----------+
-- |    101 | Shabana     | 21000.00 |
-- |    102 | Naman       | 46000.00 |
-- +--------+-------------+----------+


-- 8.b)
start transaction;

update ACCOUNT set balance = balance - 1000 where acc_no = 102;

select * from ACCOUNT;
-- +--------+-------------+----------+
-- | acc_no | holder_name | balance  |
-- +--------+-------------+----------+
-- |    101 | Shabana     | 21000.00 |
-- |    102 | Naman       | 45000.00 |
-- +--------+-------------+----------+

rollback;

select * from ACCOUNT;
-- +--------+-------------+----------+
-- | acc_no | holder_name | balance  |
-- +--------+-------------+----------+
-- |    101 | Shabana     | 21000.00 |
-- |    102 | Naman       | 46000.00 |
-- +--------+-------------+----------+


-- 8.c)
start transaction;

update ACCOUNT set balance = balance + 1000 where acc_no = 101;

commit;

select * from ACCOUNT;
-- +--------+-------------+----------+
-- | acc_no | holder_name | balance  |
-- +--------+-------------+----------+
-- |    101 | Shabana     | 22000.00 |
-- |    102 | Naman       | 46000.00 |
-- +--------+-------------+----------+


rollback;

select * from ACCOUNT;
-- +--------+-------------+----------+
-- | acc_no | holder_name | balance  |
-- +--------+-------------+----------+
-- |    101 | Shabana     | 22000.00 |
-- |    102 | Naman       | 46000.00 |
-- +--------+-------------+----------+




-- 9)

SELECT ROUTINE_TYPE, ROUTINE_NAME
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE ROUTINE_SCHEMA='student_employee';
-- +--------------+-----------------+
-- | ROUTINE_TYPE | ROUTINE_NAME    |
-- +--------------+-----------------+
-- | FUNCTION     | ceil_random     |
-- | FUNCTION     | check_result    |
-- | PROCEDURE    | insert_student  |
-- | PROCEDURE    | salary_hike     |
-- | PROCEDURE    | salary_increase |
-- +--------------+-----------------+



-- 10)
 drop function ceil_random;
 drop procedure salary_hike;

 show procedure status where db = "student_employee";
-- +------------------+-----------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
-- | Db               | Name            | Type      | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
-- +------------------+-----------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
-- | student_employee | insert_student  | PROCEDURE | root@localhost | 2026-05-07 15:06:30 | 2026-05-07 15:06:30 | DEFINER       |         | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
-- | student_employee | salary_increase | PROCEDURE | root@localhost | 2026-05-07 15:31:08 | 2026-05-07 15:31:08 | DEFINER       |         | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
-- +------------------+-----------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
