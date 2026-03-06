show databases;

create database gene_protein;

USE gene_protein;

CREATE TABLE Gene (Gene_ID INT PRIMARY KEY, Gene_name VARCHAR(50), chr VARCHAR(10), start_pos INT, end_pos INT);

CREATE TABLE Protein ( Protein_ID INT PRIMARY KEY, Protein_name VARCHAR(20), Gene_ID INT, FOREIGN KEY (Gene_ID) REFERENCES Gene(Gene_ID));

DESC Gene;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Gene_ID   | int         | NO   | PRI | NULL    |       |
| Gene_name | varchar(50) | YES  |     | NULL    |       |
| chr       | varchar(10) | YES  |     | NULL    |       |
| start_pos | int         | YES  |     | NULL    |       |
| end_pos   | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+


DESC Protein;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Protein_ID   | int         | NO   | PRI | NULL    |       |
| Protein_name | varchar(20) | YES  |     | NULL    |       |
| Gene_ID      | int         | YES  | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+


INSERT INTO Gene VALUES (1,'TP53','17',7661779,7687546),(2,'CALCA','11',14966622,14972354);

select * from Gene;
+---------+-----------+------+-----------+----------+
| Gene_ID | Gene_name | chr  | start_pos | end_pos  |
+---------+-----------+------+-----------+----------+
|       1 | TP53      | 17   |   7661779 |  7687546 |
|       2 | CALCA     | 11   |  14966622 | 14972354 |
+---------+-----------+------+-----------+----------+

INSERT INTO Protein VALUES (101,'p53alpha',1),(102,'p53beta',1),(103,'p53gamma',1),(104,'Calcitonin',2),(105,'CGRP',2);

select * from Protein;
+------------+--------------+---------+
| Protein_ID | Protein_name | Gene_ID |
+------------+--------------+---------+
|        101 | p53alpha     |       1 |
|        102 | p53beta      |       1 |
|        103 | p53gamma     |       1 |
|        104 | Calcitonin   |       2 |
|        105 | CGRP         |       2 |
+------------+--------------+---------+


Is a relationship table needed here ? Why or why not ?
A relationship is not needed in this case because the cardinality is 1:N. We only need one foreign key to store Gene_id in the Protein table.