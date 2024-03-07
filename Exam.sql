CREATE DATABASE `Hotel`;
USE `Hotel`;

CREATE TABLE `Customers` (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
surname VARCHAR(100)NOT NULL,
first_name VARCHAR(100)NOT NULL,
email VARCHAR(150)NOT NULL UNIQUE,
phone_number VARCHAR(100),
booking_history VARCHAR(100)
); 
SELECT *FROM `Customers`;

CREATE TABLE `Rooms` (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
typess VARCHAR(100)NOT NULL,
statuss VARCHAR(100)NOT NULL,
price DECIMAL(10,2) NOT NULL,
Special_amenities VARCHAR(100) NOT NULL
); 
SELECT *FROM `Rooms`;

CREATE TABLE `Services` (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
hotel_services VARCHAR(100)NOT NULL,
descriptions VARCHAR(100)NOT NULL,
times TIME,
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES Customers(id)
); 
SELECT *FROM `Services`;

CREATE TABLE `Reservations` (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
dates DATE,
number_of_guest VARCHAR(50)NOT NULL,
special_prefernces VARCHAR(100),
statuss VARCHAR(100),
room_id INT,
customer_id INT,
FOREIGN KEY (room_id) REFERENCES Rooms(id),
FOREIGN KEY (customer_id) REFERENCES Customers(id)
); 
SELECT *FROM `Reservations`;

CREATE TABLE `Billings` (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
total_price VARCHAR(100)NOT NULL,
additional_services VARCHAR(100)NOT NULL,
taxes VARCHAR(150)NOT NULL UNIQUE,
payment_method VARCHAR(100),
payment_status VARCHAR(100),
reservation_id INT,
FOREIGN KEY (reservation_id) REFERENCES Reservations(id)
); 
SELECT *FROM `Billings`;

CREATE TABLE `Feedbacks` (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
rating VARCHAR(50),
comments VARCHAR(50)NOT NULL,
dates DATE,
room_id INT,
customer_id INT,
FOREIGN KEY (room_id) REFERENCES Rooms(id),
FOREIGN KEY (customer_id) REFERENCES Customers(id)
); 
SELECT *FROM `Feedbacks`;

INSERT INTO `Customers` values  (1, "Bless", "Tebi", "677480648", "laure@gmail.com", "Confirmed" ),
(2, "Laure", "Nanda", "654472427", "tebi@gmail.com", "Cancelled" ),
(3, "Jane", "Mary", "677368576", "jane@gmail.com", "Confirmed" ),
(4, "Andy", "Pouokam", "682547977", "andy@gmail.com", "Pending" ),
(5, "Ruth", "Seugneu", "683395468", "ruth@gmail.com", "Pending" );


INSERT INTO `Rooms` values (1, "single", "available", "20000", "none" ),
(2, "double", "occupied", "30000", "balcony" ),
(3, "suite", "occupied", "50000", "sea view" ),
(4, "double", "cleaning", "30000", "sea view" ),
(5, "single", "available", "20000", "none" );


INSERT INTO `Services` values (1, "spa", "One can relax to the fullest", '10:00:00', "5" ),
(2, "restaurant", "Variety of dishes served", '07:00:00', "1" ),
(3, "gym", "Any sport exercise available", '06:00:00', "4" ),
(4, "swimming pool", "One can aswell learn", '08:00:00', "2" ),
(5, "restaurant", "Variety of dishes served", '08:00:00', "3" );


INSERT INTO `Reservations` values (1, "2024-04-16", "2", "none", "Cancelled", "5", "2" ),
(2, "2024-04-20", "1", 'sea view', "Pending", "3", "5" ),
(3, "2024-05-25", "1", 'balcony', "Confirmed", "2", "1" ),
(4, "2024-06-15", "2", 'none', "Pending", "1", "4" ),
(5, "2024-07-10", "1", 'sea view', "Confirmed", "4", "3" );


INSERT INTO `Billings` values (1, "50000", "Yes", "10000", "Orange money", "Confirmed", "3" ),
(2, "25000", "None", "5000", 'mobile money', "Pending", "4" ),
(3, "50000", "Yes", "6000", 'mobile money', "Confirmed", "5" ),
(4, "55000", "None", "7000", 'orange money', "Pending", "2" ),
(5, "25000", "None", "8000", 'mobile money', "Cancelled", "1" );


INSERT INTO `Feedbacks` values (1, "4", "Very good", "2024-04-20", "5", "2" ),
(2, "3", "Partially good", "2024-04-26", "3", "5" ),
(3, "4", "It is good", "2024-05-30", "2", "1" ),
(4, "5", "Amazing", "2024-06-16", "1", "4" ),
(5, "5", "Excellent", "2024-07-15", "4", "3" );
