drop TABLE Feedback2;
drop TABLE Tables2;
drop TABLE Orders2;
drop table MenuItems2;
drop TABLE Customers2;
drop table Placed_Order;

SET PAGESIZE 2000
SET LINESIZE 500
SET COLSEP '|'

CREATE TABLE Customers2 (
  customer_id INT PRIMARY KEY ,
  phone_number VARCHAR(20),
  email VARCHAR(100),
  gender VARCHAR(20)
);

CREATE TABLE Placed_Order (
    placed_id INT PRIMARY KEY,
    address varchar(100),
    email varchar(100),
    customer_id INT,
    total_amount decimal(10,2)
);


INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (1,  '555-555-5555', 'johndoe@email.com', 'Male');
INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (2,  '555-555-5556', 'janedoe@email.com', 'Female');
INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (3,  '555-555-5557', 'bobsmith@email.com', 'Male');
INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (4,  '555-555-5558', 'sallyjohnson@email.com', 'Female');
INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (5,  '555-555-5559', 'tomdavis@email.com', 'Male');
INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (6, '555-555-5560', 'emilybrown@email.com', 'Female');
INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (7,  '555-555-5561', 'michaeljackson@email.com', 'Male');
INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (8,  '555-555-5562', 'kimkardashian@email.com', 'Female');
INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (9,  '555-555-5563', 'davidbeckham@email.com', 'Male');
INSERT INTO Customers2 (customer_id,  phone_number, email, gender) VALUES (10, '555-555-5564', 'jenniferlopez@email.com', 'Female');

CREATE TABLE MenuItems2 (
  item_id INT PRIMARY KEY,
  name VARCHAR(100),
  description VARCHAR(200),
  price NUMBER(10, 2),
  category VARCHAR(50)
);

INSERT INTO MenuItems2 (item_id, name, description, price, category) VALUES (1, 'Item 1', 'Description 1', 200, 'Chinese');
INSERT INTO MenuItems2 (item_id, name, description, price, category) VALUES (2, 'Item 2', 'Description 2', 150, 'Chinese');
INSERT INTO MenuItems2 (item_id, name, description, price, category) VALUES (3, 'Item 3', 'Description 3', 250, 'Chinese');
INSERT INTO MenuItems2 (item_id, name, description, price, category) VALUES (4, 'Item 4', 'Description 4', 175, 'Chinese');
INSERT INTO MenuItems2 (item_id, name, description, price, category) VALUES (5, 'Item 5', 'Description 5', 225, 'Chinese');


CREATE TABLE Orders2 (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  quantity NUMBER(10,2),
  total_amount NUMBER(10, 2),
  item_id INT
);


CREATE TABLE Tables2 (
  table_id INT PRIMARY KEY,
  seats INT,
  status VARCHAR(20)
);


INSERT INTO Tables2 (table_id, seats, status) VALUES (6, 8, 'Unavailable');
INSERT INTO Tables2 (table_id, seats, status) VALUES (7, 6, 'Unavailable');
INSERT INTO Tables2 (table_id, seats, status) VALUES (8, 4, 'Unavailable');
INSERT INTO Tables2 (table_id, seats, status) VALUES (9, 2, 'Unavailable');
INSERT INTO Tables2 (table_id, seats, status) VALUES (10, 10, 'Unavailable');

CREATE TABLE Feedback2 (
fid INT PRIMARY KEY,
message VARCHAR(50),
points int
);