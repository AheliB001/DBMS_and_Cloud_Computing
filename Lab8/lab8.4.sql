create database customer_order;

use customer_order;

CREATE TABLE Customers (
    ->     Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    ->     Customer_Name VARCHAR(50)
    -> );


CREATE TABLE Orders (
    ->     Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    ->     Customer_ID INT,
    ->     FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
    -> );


CREATE TABLE Order_Details (
    ->     Order_ID INT,
    ->     Product_Name VARCHAR(50),
    ->     Quantity INT,
    ->     FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
    -> );


INSERT INTO Customers (Customer_Name) VALUES
    ->  ('Kiran'),
    -> ('Meena');

INSERT INTO Orders (Customer_ID) VALUES (1),(2);

INSERT INTO Order_Details VALUES (1,'Pen',2), (1,'Pencil',3), (1,'Eraser',1), (2,'Notebook',5), (2,'Pen',1);