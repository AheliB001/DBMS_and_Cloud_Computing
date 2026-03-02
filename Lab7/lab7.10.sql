select StudentName, Department from Students;
+-------------+-------------------+
| StudentName | Department        |
+-------------+-------------------+
| Aheli       | Biology           |
| Arun        | Biology           |
| Ritu        | English           |
| Ananya      | Microbiology      |
| Rohit       | Genetics          |
| Priya       | Biotechnology     |
| Amit        | Bioinformatics    |
| Sneha       | Life Sciences     |
| Kunal       | Biochemistry      |
| Neha        | Molecular Biology |
+-------------+-------------------+

select StudentName from Students s where s.Department in ('Biotechnology','Microbiology');
+-------------+
| StudentName |
+-------------+
| Ananya      |
| Priya       |
+-------------+

