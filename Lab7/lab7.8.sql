SELECT s.StudentName, bi.Fine
    -> FROM Students s
    -> JOIN Book_Issues bi ON s.StudentID = bi.StudentID
    -> WHERE bi.Fine > 0
    -> AND bi.ReturnedBook = 0
    -> ORDER BY bi.Fine DESC;
+-------------+------+
| StudentName | Fine |
+-------------+------+
| Ritu        |  100 |
| Rohit       |  100 |
| Amit        |  100 |
| Kunal       |  100 |
+-------------+------+

