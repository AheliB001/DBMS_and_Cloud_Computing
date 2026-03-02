SELECT s.StudentName, b.BookName
    -> FROM Students s
    -> INNER JOIN Book_Issues i ON s.StudentID = i.StudentID
    -> INNER JOIN Books b ON i.BookID = b.BookID;

+-------------+--------------------------------------+
| StudentName | BookName                             |
+-------------+--------------------------------------+
| Aheli       | General Microbiology                 |
| Arun        | Principles of Genetics               |
| Ritu        | Animal Farm                          |
| Ananya      | Molecular Biology of the Cell        |
| Rohit       | Lehninger Principles of Biochemistry |
| Priya       | Introduction to Bioinformatics       |
| Amit        | Immunology                           |
| Sneha       | Cell and Molecular Biology           |
| Kunal       | Genetics: A Conceptual Approach      |
| Neha        | Microbial Physiology                 |
+-------------+--------------------------------------+