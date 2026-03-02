ALTER TABLE Book_Issues
    -> MODIFY Fine DECIMAL(10,0) NOT NULL;

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
| Fine           | decimal(10,0) | NO   |     | NULL    |       |
+----------------+---------------+------+-----+---------+-------+

