CREATE TABLE Book_Issues (Issue_No INT PRIMARY KEY,BookID INT, StudentID INT, Date_of_Issue DATE,Date_of_Return DATE,ReturnedBook BOOLEAN,FOREIGN KEY (BookID) REFERENCES Books(BookID),FOREIGN KEY (StudentID) REFERENCES Students(StudentID) );
desc Book_Issues;
show tables;

