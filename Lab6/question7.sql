INSERT INTO Students (StudentID, StudentName, Department, Email, DOB)
VALUES
(1, 'Aheli', 'Biochemistry', 'aheli@gmail.com', '2004-06-12'),
(2, 'Arun', 'Biology', 'arun@gmail.com', '2002-06-09'),
(3, 'Ritu', 'English', 'ritu@gmail.com', '2005-02-20'),
(4, 'Ananya', 'Microbiology', 'ananya@gmail.com', '2004-03-12'),
(5, 'Rohit', 'Genetics', 'rohit@gmail.com', '2003-11-25'),
(6, 'Priya', 'Biotechnology', 'priya@gmail.com', '2004-07-18'),
(7, 'Amit', 'Bioinformatics', 'amit@gmail.com', '2003-09-05'),
(8, 'Sneha', 'Psychology', 'sneha@gmail.com', '2004-01-30'),
(9, 'Kunal', 'Biochemistry', 'kunal@gmail.com', '2003-05-14'),
(10, 'Neha', 'Molecular Biology', 'neha@gmail.com', '2004-10-02');


INSERT INTO Books VALUES
(101, 'General Biochemistry', 'Pearson', 2012),
(102, 'Principles of Genetics', 'McGraw Hill', 2019),
(103, 'Animal Farm', 'Secker & Warburg', 2020),
(104, 'Molecular Biology of the Cell', 'Garland Science', 2014),
(105, 'Lehninger Principles of Biochemistry', 'W. H. Freeman', 2017),
(106, 'Introduction to Bioinformatics', 'Pearson', 2015),
(107, 'Immunology', 'Elsevier', 2018),
(108, 'Psychology Basics', 'Wiley', 2016),
(109, 'Genetics: A Conceptual Approach', 'Macmillan', 2020),
(110, 'Microbial Physiology', 'Academic Press', 2013);


INSERT INTO Book_Issues VALUES
(1, 102, 2, '2026-01-12', '2026-01-19', 1),
(2, 101, 1, '2026-01-25', '2026-01-31', 1),
(3, 103, 3, '2026-02-01', '2026-02-08', 0),
(4, 104, 4, '2026-02-10', '2026-02-17', 1),
(5, 105, 5, '2026-02-12', '2026-02-19', 0),
(6, 106, 6, '2026-02-15', '2026-02-22', 1),
(7, 107, 7, '2026-02-18', '2026-02-25', 0),
(8, 108, 8, '2026-02-20', '2026-02-27', 1),
(9, 109, 9, '2026-02-22', '2026-03-01', 0),
(10, 110, 10, '2026-02-24', '2026-03-03', 1);
