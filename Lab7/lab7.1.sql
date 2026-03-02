show databases;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| lib                |
| library            |
| mysql              |
| performance_schema |
| sys                |
+--------------------+

use library;
show tables;

+-------------------+
| Tables_in_library |
+-------------------+
| Book_Issues       |
| Books             |
| Students          |
+-------------------+

desc Book_Issues;
ALTER TABLE Book_Issues ADD COLUMN Fine DEC;
desc Book_Issues;

+----------------+---------------+------+-----+---------+-------+
| Field          | Type          | Null | Key | Default | Extra |
+----------------+---------------+------+-----+---------+-------+
| Issue_No       | int           | NO   | PRI | NULL    |       |
| BookID         | int           | YES  | MUL | NULL    |       |
| StudentID      | int           | YES  | MUL | NULL    |       |
| Date_of_Issue  | date          | YES  |     | NULL    |       |
| Date_of_Return | date          | YES  |     | NULL    |       |
| ReturnedBook   | tinyint(1)    | YES  |     | NULL    |       |
| Fine           | decimal(10,0) | YES  |     | NULL    |       |
+----------------+---------------+------+-----+---------+-------+
