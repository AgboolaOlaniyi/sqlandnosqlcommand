create database inventory_management_db;
use inventory_management_db;

CREATE TABLE users(
userID INT,
username VARCHAR(25),
userpassword VARCHAR(25),
email VARCHAR (25),
phone_number BIGINT,
address VARCHAR(50),
gender ENUM ('male', 'female'),
PRIMARY KEY (userID)
);

CREATE TABLE customers(
customerID INT, 
firstName VARCHAR(50),
lastName VARCHAR(50),
country VARCHAR(50),
city VARCHAR(50),
region VARCHAR(50),
postal_code VARCHAR(50),
userID INT,
PRIMARY KEY (customerID),
FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE admin(
adminID INT,
firstName VARCHAR(50),
lastName VARCHAR(50),
userID INT,
PRIMARY KEY(adminID),
FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE sales_people (
sales_personID INT,
firstName VARCHAR(20),
lastName VARCHAR(8),
userID INT,
PRIMARY KEY (sales_personID),
FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE products(
productID INT,
product_name VARCHAR(255),
unit_price INT,
size VARCHAR(255),
product_description VARCHAR(255),
sales_personID INT,
PRIMARY KEY(productID),
FOREIGN KEY (sales_personID) REFERENCES sales_people(sales_personID)
);

CREATE TABLE orders(
orderID INT,
quantity_in_unit INT,
ship_country VARCHAR(255),
ship_region VARCHAR(255),
ship_city VARCHAR(255),
ship_address VARCHAR(255),
customerID INT,
sales_personID INT,
PRIMARY KEY (orderID),
FOREIGN KEY (customerID) REFERENCES customers(customerID),
FOREIGN KEY (sales_personID) REFERENCES Sales_people(sales_personID)
);

CREATE TABLE payment(
paymentID INT,
amount INT,
discount INT,
customerID INT,
orderID INT,
PRIMARY KEY (paymentID),
FOREIGN KEY (customerID) REFERENCES customers(customerID),
FOREIGN KEY (orderID) REFERENCES orders(orderID)
);

 CREATE TABLE feedback(
 feedbackID INT,
 compliants VARCHAR(255),
 customerID INT,
 PRIMARY KEY(feedbackID),
 FOREIGN KEY (customerID) REFERENCES customers(customerID)
   );

-- TO INSERT RECORDS INTO THE ENTITIES(TABLES)
 INSERT INTO users VALUES 
 ("1", "olaniyi123", "neyo4top69", "neyo4top@gmail.com", "07068271605", 
 "13, Olisa adeniyi st, Lagos, Nigeria", "male")

 ("2", "fajana123", "faja169", "fajananik@gmail.com", "07068271605", 
 "13, Olisa adeniyi st, Abule egba, Lagos, Nigeria", "female")

 ("3", "agbo123", "faja169", "fajananik@gmail.com", "07068271605", 
 "16, adejoke ayodeji st, Abule egba, Lagos, Nigeria", "female")

 ("4", "taiwo567", "taiwo123", "taiwoadeboye@gmail.com", "08033685767", 
 "15, Badmus Orioye st, Abule egba, Lagos, Nigeria", "female")

INSERT INTO customers VALUES 
 ("1", "Agboola", "Olaniyi", "Nigeria", "Lagos", 
 "Abule egba", "10001", 1)

 ("2", "Fajana", "adenike", "Nigeria", "Lagos", 
 "Pusola", "1003", 2)

  ("3", "Olayiwola", "Christiana", "Nigeria", "Ilorin", 
 "PostOffice", "1503", 3)

 INSERT INTO admin VALUES 
 ("1", "Agboola", "Ayobami", 3)

 ("2", "Kolade", "Kayode", 4)

INSERT INTO sales_people VALUES 
 ("1", "Adebayo", "Micheal", 1),

 ("2", "John", "Victor", 4)
 

  INSERT INTO products VALUES
 ("1", "spaghetti", "700", "small", "One packet of spagehetti", 1)

 ("2",  "flour", "1000", "medium",  "A bag of flour", 1)

 ("3", "Indomie", "1800", "large", "Two packet of Indomie", 2)

--TO GET RECORDS FROM ENTITIES(TABLES)
SELECT * FROM customers;

SELECT * FROM sales_people;

SELECT * FROM products;


-- --TO UPDATE RECORDS IN ENTITIES(TABLES)
UPDATE PRODUCTS
set product_name = 'Bean'
where productID = 1

UPDATE CUSTOMERS
set lastName = 'Agboola'
where customerID = 3

-- --TO DELETE RECORDS FROM ENTITIES(TABLES)
DELETE FROM products WHERE productID = 2;

DELETE FROM orders WHERE customerID = 3;
 