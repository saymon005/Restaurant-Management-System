SET serveroutput on;
SET verify off;
SET PAGESIZE 5000;
SET LINESIZE 500;
SET COLSEP '|';


drop TABLE Feedback1;
drop TABLE Tables1;
drop TABLE Orders1;
drop table MenuItems1;
drop TABLE Customers1;
drop TABLE Reservations;


CREATE TABLE Customers1 (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  address VARCHAR(200),
  gender VARCHAR(20)
);



INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (1, 'John Doe', '123 Main St', 'Male');
INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (2, 'Jane Doe', '456 Elm St', 'Female');
INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (3, 'Bob Smith', '789 Oak St',  'Male');
INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (4, 'Sally Johnson', '246 Pine St',  'Female');
INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (5, 'Tom Davis', '369 Cedar St', 'Male');
INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (6, 'Emily Brown', '159 Maple St',  'Female');
INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (7, 'Michael Jackson', '753 Cedar St',  'Male');
INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (8, 'Kim Kardashian', '951 Maple St',  'Female');
INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (9, 'David Beckham', '147 Cedar St', 'Male');
INSERT INTO Customers1 (customer_id, name, address, gender) VALUES (10, 'Jennifer Lopez', '753 Elm St', 'Female');


CREATE TABLE MenuItems1 (
  item_id INT PRIMARY KEY,
  name VARCHAR(100),
  description VARCHAR(200),
  price NUMBER(10, 2),
  category VARCHAR(50)
);


INSERT INTO MenuItems1 (item_id, name, description, price, category) VALUES (6, '6" Pizza', 'Bercelona Pizza', 275, 'Bangalee'); 
INSERT INTO MenuItems1 (item_id, name, description, price, category) VALUES (7, 'Item 7', 'Description 7', 300, 'Bangalee'); 
INSERT INTO MenuItems1 (item_id, name, description, price, category) VALUES (8, 'Item 8', 'Description 8', 325, 'Bangalee'); 
INSERT INTO MenuItems1 (item_id, name, description, price, category) VALUES (9, 'Item 9', 'Description 9', 350, 'Bangalee'); 
INSERT INTO MenuItems1 (item_id, name, description, price, category) VALUES (10, 'Item 10', 'Description 10', 400, 'Bangalee');



CREATE TABLE Orders1 (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  quantity NUMBER(10,2),
  total_amount NUMBER(10, 2),
  item_id INT
);
INSERT INTO Orders1 (order_id, customer_id, order_date, quantity, total_amount, item_id) VALUES (1, 1, '17-AUG-23', 1, 250, 11);
INSERT INTO Orders1 (order_id, customer_id, order_date, quantity, total_amount, item_id) VALUES (2, 1, '17-AUG-23', 1, 275, 11);
INSERT INTO Orders1 (order_id, customer_id, order_date, quantity, total_amount, item_id) VALUES (3, 1, '17-AUG-23', 1, 250, 11);
INSERT INTO Orders1 (order_id, customer_id, order_date, quantity, total_amount, item_id) VALUES (4, 1, '17-AUG-23', 2, 500, 11);
INSERT INTO Orders1 (order_id, customer_id, order_date, quantity, total_amount, item_id) VALUES (5, 1, '17-AUG-23', 1, 250, 11);


CREATE TABLE Tables1 (
  table_id INT PRIMARY KEY,
  seats INT,
  status VARCHAR(20)
);


INSERT INTO Tables1 (table_id, seats, status) VALUES (1, 4, 'Available');  
INSERT INTO Tables1 (table_id, seats, status) VALUES (2, 6, 'Available');  
INSERT INTO Tables1 (table_id, seats, status) VALUES (3, 8, 'Available'); 
INSERT INTO Tables1 (table_id, seats, status) VALUES (4, 4, 'Available');  
INSERT INTO Tables1 (table_id, seats, status) VALUES (5, 2, 'Available');



CREATE TABLE Reservations (
  reservation_id INT PRIMARY KEY,
  customer_id INT,
  table_id INT,
  reservation_date DATE,
  guests INT,
  FOREIGN KEY (customer_id) REFERENCES Customers1(customer_id),
  FOREIGN KEY (table_id) REFERENCES Tables1(table_id)
);

CREATE TABLE Feedback1 (
fid INT PRIMARY KEY,
item_id INT
);