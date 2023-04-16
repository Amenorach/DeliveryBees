DROP DATABASE IF EXISTS deliveryBees;

CREATE DATABASE deliveryBees;

USE deliveryBees;
-- Create a new table called ‘Courier Details' in schema 'dbo' --
-- Drop the table if it already exists --

DROP TABLE IF EXISTS dboCourier;


CREATE TABLE dboCourier (
   CourierId        INT    NOT NULL  PRIMARY KEY, 
   Rider_fname      VARCHAR (10)  NOT NULL,
   Rider_lname  VARCHAR(10)  NOT NULL,
   Rider_number   NVARCHAR(30)  NOT NULL
);


-- Create the table in the specified schema--

CREATE TABLE customer (
  cust_id INT PRIMARY KEY,
  cust_fname VARCHAR(50) NOT NULL,
  cust_lname VARCHAR(50) NOT NULL,
  cust_email VARCHAR(100) NOT NULL,
  cust_phone VARCHAR(20),
  address VARCHAR (20)
);

DROP TABLE IF EXISTS dboSender;

CREATE TABLE dboSender (
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);


DROP TABLE IF EXISTS dboSenderAddress;

CREATE TABLE dboSenderAddress(
	Street VARCHAR (50)  NOT NULL,
	houseNumber TINYINT(10)  NOT NULL,
	City VARCHAR (50)  NOT NULL,
	Country   CHAR (50)  NOT NULL,
	customerID INT,
    FOREIGN KEY (customerID) REFERENCES customer(cust_id)
);



CREATE TABLE recipient (
  recipientID INT NOT NULL PRIMARY KEY,
  customerID INT NOT NULL,
  FOREIGN KEY (customerID) REFERENCES customer(cust_id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


  CREATE TABLE vehicle (
  id INT PRIMARY KEY,
  make VARCHAR(50),
  model VARCHAR(50),
  year INT,
  license_plate VARCHAR(20),
  type VARCHAR(50)
);

CREATE TABLE DeliveryInformation(
	deliveryID INT NOT NULL PRIMARY KEY,
	deliveryDate DATE NOT NULL
);

CREATE TABLE recipientAddress(
	recipientID INT NOT NULL,
	street VARCHAR(100) NOT NULL,
	houseNumber VARCHAR(20) NOT NULL PRIMARY KEY,
	city VARCHAR(70) NOT NULL,
	country VARCHAR(70) NOT NULL,
	FOREIGN KEY (recipientID) REFERENCES recipient(recipientID)
);

CREATE TABLE courier(
	vehicleID INT NOT NULL,
	courierId INT NOT NULL,
	licenseNumber VARCHAR(100) NOT NULL,
	FOREIGN KEY (vehicleID) REFERENCES vehicle(id),
    FOREIGN KEY (courierId) REFERENCES dboCourier(courierId)
);

CREATE TABLE Package(
	packageID INT NOT NULL PRIMARY KEY,
	deliveryID INT NOT NULL,
	courierID INT NOT NULL,
	recipientAddressID INT NOT NULL,
	pWeight DECIMAL(10,2) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
    cust_id INT
);

CREATE TABLE payment (
  id INT PRIMARY KEY,
  amount DECIMAL(10,2) NOT NULL,
  payment_date DATE NOT NULL,
  courier_id INT NOT NULL,
  recipient_id INT NOT NULL,
  package_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (courier_id) REFERENCES courier(CourierId),
  FOREIGN KEY (recipient_id) REFERENCES recipient(recipientID),
  FOREIGN KEY (package_id) REFERENCES package(packageID)
  on update cascade
  on delete cascade
);

-- CONSTRAINTS--

--
-- Constraints for table `customer`
--
ALTER TABLE customer
ADD CONSTRAINT UQ_cust_email UNIQUE (cust_email);
-- ADD CONSTRAINT CHK_cust_phone CHECK (cust_phone LIKE '[0-9]%');


ALTER TABLE dboSenderAddress
ADD CONSTRAINT FK_SenderAddress_Customer FOREIGN KEY (customerID)
    REFERENCES customer(cust_id);

--
-- Constraints for table `Package`
--
ALTER TABLE Package
ADD CONSTRAINT FK_Package_DeliveryInformation FOREIGN KEY (deliveryID)
        REFERENCES DeliveryInformation(deliveryID),
ADD CONSTRAINT FK_Package_Courier FOREIGN KEY (courierID)
        REFERENCES dboCourier(CourierId);


--
-- Constraints for table `recipient`
--

ALTER TABLE recipient
ADD CONSTRAINT FK_recipient_Customer FOREIGN KEY (customerID)
        REFERENCES customer(cust_id);


--
-- Constraints for table `payment`
--
ALTER TABLE payment
ADD CONSTRAINT NN_payment_amount CHECK (amount IS NOT NULL),
ADD CONSTRAINT NN_payment_date CHECK (payment_date IS NOT NULL);
-- ADD CONSTRAINT FK_payment_Courier FOREIGN KEY (courier_id) REFERENCES courier(id) ON UPDATE CASCADE ON DELETE CASCADE,
-- ADD CONSTRAINT FK_payment_Recipient FOREIGN KEY (recipient_id) REFERENCES recipient(id) ON UPDATE CASCADE ON DELETE CASCADE,
-- ADD CONSTRAINT FK_payment_Package FOREIGN KEY (package_id) REFERENCES package(packageID) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Constraints for table `courier`
--
ALTER TABLE courier
-- ADD CONSTRAINT PK_courier PRIMARY KEY (vehicleID, courierID),
ADD CONSTRAINT UQ_courier_licenseNumber UNIQUE (licenseNumber);

--
-- DATABASE POPULATION--

INSERT INTO customer (cust_id, cust_fname, cust_lname, cust_email, cust_phone, address)
VALUES
  (1, 'Kwame', 'Appiah', 'kwame.appiah@example.com', '0241234567', '123 Main St, Accra'),
  (2, 'Adjoa', 'Boateng', 'adjoa.boateng@example.com', '0272345678', '456 Oak St, Kumasi'),
  (3, 'Yaw', 'Kwakye', 'yaw.kwakye@example.com', '0203456789', '789 Elm St, Cape Coast'),
  (4, 'Akua', 'Owusu', 'akua.owusu@example.com', '0244567890', '234 Pine St, Tamale'),
  (5, 'Kofi', 'Addo', 'kofi.addo@example.com', '0545678901', '567 Maple St, Takoradi'),
  (6, 'Esi', 'Adu', 'esi.adu@example.com', '0246789012', '890 Cherry St, Accra'),
  (7, 'Yaw', 'Asante', 'yaw.asante@example.com', '0277890123', '1234 Elmwood Ave, Kumasi'),
  (8, 'Ama', 'Mensah', 'ama.mensah@example.com', '0209012345', '5678 Oakwood Blvd, Cape Coast'),
  (9, 'Kwesi', 'Addae', 'kwesi.addae@example.com', '0540123456', '9012 Pine St, Tamale'),
  (10, 'Abena', 'Osei', 'abena.osei@example.com', '0243456789', '3456 Maple Ave, Takoradi');

INSERT INTO recipient (recipientID, customerID) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);
  
  
-- Insert rows into table 'Courier'
INSERT INTO dboCourier (CourierId, Rider_fname, Rider_lname, Rider_number) VALUES
   ( 1, N'Orlando', N'August', N'+233507384211'),
   ( 2, N'Keith', N'Benson', N'+2332709405800'),
   ( 3, N'Donna', N'Carlos', N'+2332648329103'),
   ( 4, N'Judas', N'Nti', N'+2332423943320'),
   ( 5, N'Basil', N'Asamoah', N'+2332400567799'),
   ( 6, N'Mary', N'Smith', N'+2332709405500'),
   ( 7, N'John', N'Doe', N'+2332648329203'),
   ( 8, N'Jane', N'Doe', N'+2332423943321'),
   ( 9, N'James', N'Johnson', N'+2332400567790'),
   ( 10, N'Emily', N'Wilson', N'+2332648329107');
   
INSERT INTO dboSenderAddress (Street, houseNumber, City, Country, customerID)
VALUES ('Adabraka Road', 12, 'Accra', 'Ghana', 1),
       ('Cape Coast Highway', 23, 'Cape Coast', 'Ghana', 2),
       ('Sunyani-Accra Road', 9, 'Sunyani', 'Ghana', 3),
       ('Mampong Road', 7, 'Kumasi', 'Ghana', 4),
       ('Nima Street', 18, 'Accra', 'Ghana', 5),
       ('Kumasi-Accra Road', 13, 'Techiman', 'Ghana', 6),
       ('Wa Road', 10, 'Bolgatanga', 'Ghana', 7),
       ('Tema-Akosombo Road', 5, 'Akosombo', 'Ghana', 8),
       ('Tamale Road', 14, 'Navrongo', 'Ghana', 9),
       ('Adenta Street', 21, 'Accra', 'Ghana', 10);

-- INSERT INTO dboSenderAddress VALUES
   -- ( N'Outer Ring Road 1', N'OR1', N'Accra'),
    --  ( N'Ablekuma South', N'AS02', N'Tema'),
     -- ( N'1st Circular Road', N'645CR', N'Accra Central'),
    --  ( N'Apple Street', N'67ASJ', N'Community 23'),
    --  ( N'Abidjan Avenue', N'AA456', N'Accra'),
    --  ( N'Cocoa Street', N'9078CS', N'Accra'),
   --   ( N'4th Dade Street', N'67DS4', N'Ga West'),
    --  ( N'Link Road', N'1LR', N'Accral South'),
     -- ( N'Abele Street', N'AS89', N'Community 9'),
   --   ( N'Emmause Lane', N'78EL89', N'Community 25');
   
INSERT INTO DeliveryInformation (deliveryID, deliveryDate)
VALUES
(101, '2023-04-16'),
(102, '2023-04-17'),
(103, '2023-04-18'),
(104, '2023-04-19'),
(105, '2023-04-20'),
(106, '2023-04-21'),
(107, '2023-04-22'),
(108, '2023-04-23'),
(109, '2023-04-24'),
(110, '2023-04-25');

INSERT INTO Package (packageID, deliveryID, courierId, recipientAddressID, pWeight, price)
VALUES
(1, 101, 1, 301, 1.5, 25.99),
(2, 102, 2, 302, 2.3, 35.50),
(3, 103, 3, 303, 0.8, 20.00),
(4, 104, 4, 304, 3.6, 48.75),
(5, 105, 5, 305, 1.2, 22.00),
(6, 106, 6, 306, 4.1, 55.25),
(7, 107, 7, 307, 0.5, 15.99),
(8, 108, 8, 308, 2.5, 40.00),
(9, 109, 9, 309, 3.2, 45.75),
(10, 110, 10, 310, 1.8, 30.50);


INSERT INTO recipientAddress (recipientID, street, houseNumber, city, country)
VALUES 
(1, 'Oxford Street', '123', 'Accra', 'Ghana'),
(2, 'Labadi Road', '456', 'Tema', 'Ghana'),
(3, 'Ring Road Central', '789', 'Kumasi', 'Ghana'),
(4, 'Beach Road', '1011', 'Cape Coast', 'Ghana'),
(5, 'North Ridge', '1213', 'Tamale', 'Ghana'),
(6, 'Adenta-Frafraha', '1415', 'Adenta', 'Ghana'),
(7, 'Spintex Road', '1617', 'Teshie', 'Ghana'),
(8, 'Kwame Nkrumah Avenue', '1819', 'Sekondi-Takoradi', 'Ghana'),
(9, 'Kofi Annan Street', '2021', 'Sunyani', 'Ghana'),
(10, 'Asafo Roundabout', '2223', 'Koforidua', 'Ghana');

INSERT INTO vehicle (id, make, model, year, license_plate, type)
VALUES
  (1, 'Toyota', 'Corolla', 2018, 'ABC123', 'Sedan'),
  (2, 'Honda', 'Civic', 2020, 'DEF456', 'Sedan'),
  (3, 'Ford', 'F-150', 2015, 'GHI789', 'Truck'),
  (4, 'Chevrolet', 'Equinox', 2019, 'JKL012', 'SUV'),
  (5, 'Jeep', 'Wrangler', 2021, 'MNO345', 'SUV'),
  (6, 'BMW', 'X5', 2017, 'PQR678', 'SUV'),
  (7, 'Mercedes-Benz', 'E-Class', 2016, 'STU901', 'Sedan'),
  (8, 'Nissan', 'Altima', 2022, 'VWX234', 'Sedan'),
  (9, 'Audi', 'Q5', 2019, 'YZA567', 'SUV'),
  (10, 'Tesla', 'Model S', 2020, 'BCD890', 'Sedan');


INSERT INTO courier (vehicleID, courierId, licenseNumber)
VALUES 
(1, 1, 'GHA-1234567'),
(2, 2, 'GHA-9876543'),
(3, 3, 'GHA-4561237'),
(4, 4, 'GHA-7891234'),
(5, 5, 'GHA-5553332'),
(6, 6, 'GHA-7779991'),
(7, 7, 'GHA-1114445'),
(8, 8, 'GHA-3336668'),
(9, 9, 'GHA-2228883'),
(10, 10, 'GHA-4445559');




INSERT INTO payment (id, amount, payment_date, courier_id, recipient_id, package_id)
VALUES
  (1, 25.00, '2023-04-01', 1, 3, 5),
  (2, 20.00, '2023-04-02', 2, 4, 6),
  (3, 15.50, '2023-04-03', 1, 2, 3),
  (4, 18.75, '2023-04-04', 3, 1, 4),
  (5, 10.00, '2023-04-05', 2, 5, 2);


-- Query that keeps track of invoices and billings based on the delivery services rendered
CREATE PROCEDURE get_customer_package_info
    @start_date DATE
AS
BEGIN
    DECLARE @start_date DATE; -- Add this line to declare the variable

    SELECT c.cust_fname, c.cust_lname, COUNT(p.id) AS num_packages, SUM(p.price) AS total_price
    FROM customer c
    INNER JOIN recipient r ON c.cust_id = r.id
    LEFT OUTER JOIN payment pa ON r.id = pa.recipient_id
    LEFT OUTER JOIN package p ON pa.package_id = p.packageID
    WHERE pa.payment_date > @start_date
    GROUP BY c.cust_fname, c.cust_lname
    HAVING COUNT(p.id) > 0
    ORDER BY total_price DESC;
END


-- SELECT c.cust_fname, c.cust_lname, COUNT(p.id) AS num_packages, SUM(p.price) AS total_price
-- FROM customer c
-- INNER JOIN recipient r ON c.cust_id = r.id
-- LEFT OUTER JOIN payment pa ON r.id = pa.recipient_id
-- LEFT OUTER JOIN package p ON pa.package_id = p.packageID
-- WHERE pa.payment_date > '2022-01-01'
-- GROUP BY c.cust_fname, c.cust_lname
-- HAVING COUNT(p.id) > 0
-- ORDER BY total_price DESC;
-- SELECT 
--     c.cust_fname,
--     c.cust_lname,
--     p.price,
--     di.deliveryDate,
--     COUNT(DISTINCT pa.packageID) AS num_packages,
--     SUM(p.price) AS total_billing
-- FROM 
--     customer c
--     INNER JOIN sender s ON c.cust_id = s.CustomerID
--     INNER JOIN senderAddress sa ON c.cust_id = sa.CustomerID
--     INNER JOIN package pa ON s.CustomerID = pa.deliveryID
--     INNER JOIN courier co ON pa.courierID = co.courierID
--     INNER JOIN DeliveryInformation di ON pa.deliveryID = di.deliveryID
--     INNER JOIN payment p ON pa.packageID = p.package_id
-- GROUP BY 
--     c.cust_fname,
--     c.cust_lname,
--     p.price,
--     di.deliveryDate
-- ORDER BY 
--     total_billing DESC;

-- an sql query which manages the inventory packages such as the package type, the weight and size etc
SELECT Package.packageID, Package.pWeight, Package.price, Package.packageType, Package.packageSize
FROM Package
INNER JOIN Inventory ON Package.packageID = Inventory.packageID
WHERE Package.packageSize > 10 AND Inventory.quantity > 0
ORDER BY Package.price DESC;


GO




-- USE deliverybees;
-- -- Create a new table called ‘Courier Details' in schema 'dbo' --
-- -- Drop the table if it already exists --


-- DROP TABLE Couriers;
-- CREATE TABLE Couriers (
--    CourierId INT ,
--    FirstName VARCHAR(15),
--    LastName VARCHAR(15),
--    PhoneNumber VARCHAR(20)
-- );


-- -- Create the table in the specified schema--
-- DROP TABLE Customer;
-- CREATE TABLE Customer (
--   cust_id INT PRIMARY KEY,
--   cust_fname VARCHAR(50) NOT NULL,
--   cust_lname VARCHAR(50) NOT NULL,
--   cust_email VARCHAR(100) NOT NULL,
--   cust_phone VARCHAR(20),
-- );

-- DROP TABLE Sender;
-- CREATE TABLE Sender (

-- CustomerID int FOREIGN KEY REFERENCES Customer(cust_id),
-- );


-- DROP TABLE SenderAddress;
-- CREATE TABLE SenderAddress(
-- 	Street VARCHAR (50)  NOT NULL,
-- 	houseNumber TINYINT  NOT NULL,
-- 	City VARCHAR (50)  NOT NULL,
-- 	CustomerID int FOREIGN KEY REFERENCES Customer(cust_id),
-- );


-- DROP TABLE Package;
-- CREATE TABLE Package(
-- 	packageID INT NOT NULL PRIMARY KEY,
-- 	deliveryID INT NOT NULL,
-- 	courierID INT NOT NULL,
-- 	recipientAddressID INT NOT NULL,
-- 	pWeight DECIMAL(10,2) NOT NULL,
-- 	price DECIMAL(10,2) NOT NULL
-- );


-- DROP TABLE recipient;
-- CREATE TABLE recipient (
--   id INT PRIMARY KEY,
--   FOREIGN KEY (id) REFERENCES Customer(cust_id),
--   ---created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- DROP TABLE payment;
-- CREATE TABLE payment (
--   id INT PRIMARY KEY,
--   amount DECIMAL(10,2) NOT NULL,
--   payment_date DATE NOT NULL,
--   courier_id INT NOT NULL,
--   recipient_id INT NOT NULL,
--   package_id INT NOT NULL,
--   --created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   FOREIGN KEY (courier_id) REFERENCES Couriers(CourierId),
--   FOREIGN KEY (recipient_id) REFERENCES recipient(id),
--   FOREIGN KEY (package_id) REFERENCES Package(packageID)
--   on update cascade
--   on delete cascade
-- );


-- DROP TABLE vehicle;
--   CREATE TABLE vehicle (
--   id INT PRIMARY KEY,
--   make VARCHAR(50),
--   model VARCHAR(50),
--   year INT,
--   license_plate VARCHAR(20),
--   type VARCHAR(50)
-- );


-- DROP TABLE DeliveryInformation;
-- CREATE TABLE DeliveryInformation(
-- 	deliveryID INT NOT NULL,
-- 	deliveryDate DATE NOT NULL
-- );


-- DROP TABLE recipientAddress;
-- CREATE TABLE recipientAddress(
-- 	customerID INT NOT NULL,
-- 	street VARCHAR(100) NOT NULL,
-- 	houseNumber VARCHAR(20) NOT NULL,
-- 	city VARCHAR(70) NOT NULL,
-- 	country VARCHAR(70) NOT NULL
-- );


-- DROP TABLE courierRider;
-- CREATE TABLE courierRider(
-- 	vehicleID INT NOT NULL,
-- 	courierRiderID INT NOT NULL,
-- 	licenseNumber VARCHAR(100) NOT NULL
-- );



-- -- CONSTRAINTS--
-- --
-- -- Constraints for table `dbo.Courier`
-- --
-- ALTER TABLE Couriers
-- ADD CONSTRAINT PK_Courier PRIMARY KEY (CourierId);

-- --
-- -- Constraints for table `customer`
-- --
-- ALTER TABLE Customer
-- ADD CONSTRAINT PK_Customer PRIMARY KEY (cust_id),
--     CONSTRAINT UQ_cust_email UNIQUE (cust_email),
--     CONSTRAINT CHK_cust_phone CHECK (cust_phone LIKE '[0-9]%');

-- --
-- -- Constraints for table ` SenderAddress`
-- --
-- ALTER TABLE SenderAddress
-- ADD CONSTRAINT FK_SenderAddress_Customer FOREIGN KEY (CustomerID)
--     REFERENCES customer(cust_id);


-- --
-- -- Constraints for table `Package`
-- --
-- ALTER TABLE Package
-- ADD CONSTRAINT FK_Package_RecipientAddress FOREIGN KEY (customerID, street, houseNumber, city, country)
--     REFERENCES recipientAddress(customerID, street, houseNumber, city, country);


-- --
-- -- Constraints for table `recipient`
-- --
-- ALTER TABLE recipient
-- ADD CONSTRAINT PK_recipient PRIMARY KEY (id),
--     CONSTRAINT FK_recipient_Customer FOREIGN KEY (id)
--         REFERENCES customer(cust_id),
--     CONSTRAINT DF_recipient_created_at DEFAULT CURRENT_TIMESTAMP FOR created_at;




-- -- Constraints for table `payment`
-- --
-- ALTER TABLE payment
-- ADD CONSTRAINT PK_payment PRIMARY KEY (id),
--     CONSTRAINT NN_payment_amount CHECK (amount IS NOT NULL),
--     CONSTRAINT NN_payment_date CHECK (payment_date IS NOT NULL),
--     CONSTRAINT FK_payment_Courier FOREIGN KEY (courier_id)
--         REFERENCES courier(id) ON UPDATE CASCADE ON DELETE CASCADE,
--     CONSTRAINT FK_payment_Recipient FOREIGN KEY (recipient_id)
--         REFERENCES recipient(id) ON UPDATE CASCADE ON DELETE CASCADE,
--     CONSTRAINT FK_payment_Package FOREIGN KEY (package_id)
--         REFERENCES package(packageID) ON UPDATE CASCADE ON DELETE CASCADE,
--     CONSTRAINT DF_payment_created_at DEFAULT CURRENT_TIMESTAMP FOR created_at;


-- --
-- -- Constraints for table `vehicle`
-- --
-- ALTER TABLE vehicle
-- ADD CONSTRAINT PK_vehicle PRIMARY KEY (id);

-- --
-- -- Constraints for table `DeliveryInformation`
-- --
-- ALTER TABLE DeliveryInformation
-- ADD CONSTRAINT PK_DeliveryInformation PRIMARY KEY (deliveryID);


-- --
-- -- Constraints for table `recipientAddress`
-- --
-- ALTER TABLE recipientAddress
-- ADD CONSTRAINT PK_recipientAddress PRIMARY KEY (customerID, street, houseNumber, city, country);


-- --
-- -- Constraints for table `courier`
-- --
-- ALTER TABLE courierRider
-- ADD CONSTRAINT PK_courierRider PRIMARY KEY (vehicleID, courierRiderID),
--     CONSTRAINT UQ_courier_licenseNumber UNIQUE (licenseNumber);






--                             --DATABASE POPULATION--

-- -- Insert rows into table 'Courier'
-- INSERT INTO Couriers (CourierId, FirstName,LastName, PhoneNumber) VALUES 
--    ( 1, 'Orlando', 'August', '+233507384211'),
--    ( 2, 'Keith', 'Benson', '+2332709405800'),
--    ( 3, 'Donna', 'Carlos', '+2332648329103'),
--    ( 4, 'Judas', 'Nti', '+2332423943320'),
--    ( 5, 'Basil', 'Asamoah', '+2332400567799');

--    INSERT INTO SenderAddress (Street, houseNumber, City, CustomerID) VALUES
--    ( N'Outer Ring Road 1', N'OR1', N'Accra',1),
--    ( N'Ablekuma South', N'AS02', N'Tema',2),
--    ( N'1st Circular Road', N'645CR', N'Accra Central',3),
--    ( N'Apple Street', N'67ASJ', N'Community 23',4),
--    ( N'Abidjan Avenue', N'AA456', N'Accra',5),
--    ( N'Cocoa Street', N'9078CS', N'Accra',6),
--    ( N'4th Dade Street', N'67DS4', N'Ga West',7),
--    ( N'Link Road', N'1LR', N'Accral South',8),
--    ( N'Abele Street', N'AS89', N'Community 9',8),
--    ( N'Emmause Lane', N'78EL89', N'Community 25',9)


-- INSERT INTO Package 
-- VALUES
-- (1, 101, 201, 301, 1.5, 25.99),
-- (2, 102, 202, 302, 2.3, 35.50),
-- (3, 103, 203, 303, 0.8, 20.00),
-- (4, 104, 204, 304, 3.6, 48.75),
-- (5, 105, 205, 305, 1.2, 22.00),
-- (6, 106, 206, 306, 4.1, 55.25),
-- (7, 107, 207, 307, 0.5, 15.99),
-- (8, 108, 208, 308, 2.5, 40.00),
-- (9, 109, 209, 309, 3.2, 45.75),
-- (10, 110, 210, 310, 1.8, 30.50);

-- INSERT INTO DeliveryInformation (deliveryID, deliveryDate)
-- VALUES
-- (101, '2023-04-16'),
-- (102, '2023-04-17'),
-- (103, '2023-04-18'),
-- (104, '2023-04-19'),
-- (105, '2023-04-20'),
-- (106, '2023-04-21'),
-- (107, '2023-04-22'),
-- (108, '2023-04-23'),
-- (109, '2023-04-24'),
-- (110, '2023-04-25');


-- INSERT INTO recipientAddress (customerID, street, houseNumber, city, country)
-- VALUES 
-- (1001, 'Oxford Street', '123', 'Accra', 'Ghana'),
-- (1002, 'Labadi Road', '456', 'Tema', 'Ghana'),
-- (1003, 'Ring Road Central', '789', 'Kumasi', 'Ghana'),
-- (1004, 'Beach Road', '1011', 'Cape Coast', 'Ghana'),
-- (1005, 'North Ridge', '1213', 'Tamale', 'Ghana'),
-- (1006, 'Adenta-Frafraha', '1415', 'Adenta', 'Ghana'),
-- (1007, 'Spintex Road', '1617', 'Teshie', 'Ghana'),
-- (1008, 'Kwame Nkrumah Avenue', '1819', 'Sekondi-Takoradi', 'Ghana'),
-- (1009, 'Kofi Annan Street', '2021', 'Sunyani', 'Ghana'),
-- (1010, 'Asafo Roundabout', '2223', 'Koforidua', 'Ghana');


-- INSERT INTO courierRider
-- VALUES 
-- (301, 201, 'GHA-1234567'),
-- (302, 202, 'GHA-9876543'),
-- (303, 203, 'GHA-4561237'),
-- (304, 204, 'GHA-7891234'),
-- (305, 205, 'GHA-5553332'),
-- (306, 206, 'GHA-7779991'),
-- (307, 207, 'GHA-1114445'),
-- (308, 208, 'GHA-3336668'),
-- (309, 209, 'GHA-2228883'),
-- (310, 210, 'GHA-4445559');
 


-- INSERT INTO Customer
-- VALUES
--   (1, 'John', 'Doe', 'johndoe@example.com', '555-1234'),
--   (2, 'Jane', 'Smith', 'janesmith@example.com', '555-5678'),
--   (3, 'Bob', 'Johnson', 'bjohnson@example.com', '555-9012'),
--   (4, 'Mary', 'Brown', 'mbrown@example.com', '555-3456'),
--   (5, 'Tom', 'Jones', 'tjones@example.com', '555-7890'),
--   (6, 'Sara', 'Lee', 'slee@example.com', '555-2345'),
--   (7, 'David', 'Nguyen', 'davidnguyen@example.com', '555-6789'),
--   (8, 'Lisa', 'Kim', 'lisakim@example.com', '555-4321'),
--   (9, 'Emily', 'Garcia', 'emilygarcia@example.com', '555-8765'),
--   (10, 'Mark', 'Taylor', 'marktaylor@example.com', '555-2109');



-- INSERT INTO payment
-- VALUES
--   (1, 25.00, '2023-04-01', 1, 3, 5),
--   (2, 20.00, '2023-04-02', 2, 4, 6),
--   (3, 15.50, '2023-04-03', 1, 2, 3),
--   (4, 18.75, '2023-04-04', 3, 1, 4),
--   (5, 10.00, '2023-04-05', 2, 5, 2);


-- INSERT INTO vehicle
-- VALUES
--   (1, 'Toyota', 'Corolla', 2018, 'ABC123', 'Sedan'),
--   (2, 'Honda', 'Civic', 2020, 'DEF456', 'Sedan'),
--   (3, 'Ford', 'F-150', 2015, 'GHI789', 'Truck'),
--   (4, 'Chevrolet', 'Equinox', 2019, 'JKL012', 'SUV'),
--   (5, 'Jeep', 'Wrangler', 2021, 'MNO345', 'SUV'),
--   (6, 'BMW', 'X5', 2017, 'PQR678', 'SUV'),
--   (7, 'Mercedes-Benz', 'E-Class', 2016, 'STU901', 'Sedan'),
--   (8, 'Nissan', 'Altima', 2022, 'VWX234', 'Sedan'),
--   (9, 'Audi', 'Q5', 2019, 'YZA567', 'SUV'),
--   (10, 'Tesla', 'Model S', 2020, 'BCD890', 'Sedan');

-- -- Query that keeps track of invoices and billings based on the delivery services rendered
-- CREATE PROCEDURE get_customer_package_info;
--     @start_date DATE
-- AS
-- BEGIN
--     SELECT c.cust_fname, c.cust_lname, COUNT(p.id) AS num_packages, SUM(p.price) AS total_price
--     FROM customer c
--     INNER JOIN recipient r ON c.cust_id = r.id
--     LEFT OUTER JOIN payment pa ON r.id = pa.recipient_id
--     LEFT OUTER JOIN package p ON pa.package_id = p.packageID
--     WHERE pa.payment_date > @start_date
--     GROUP BY c.cust_fname, c.cust_lname
--     HAVING COUNT(p.id) > 0
--     ORDER BY total_price DESC;
-- END

-- -- SELECT c.cust_fname, c.cust_lname, COUNT(p.id) AS num_packages, SUM(p.price) AS total_price
-- -- FROM customer c
-- -- INNER JOIN recipient r ON c.cust_id = r.id
-- -- LEFT OUTER JOIN payment pa ON r.id = pa.recipient_id
-- -- LEFT OUTER JOIN package p ON pa.package_id = p.packageID
-- -- WHERE pa.payment_date > '2022-01-01'
-- -- GROUP BY c.cust_fname, c.cust_lname
-- -- HAVING COUNT(p.id) > 0
-- -- ORDER BY total_price DESC;
-- -- SELECT 
-- --     c.cust_fname,
-- --     c.cust_lname,
-- --     p.price,
-- --     di.deliveryDate,
-- --     COUNT(DISTINCT pa.packageID) AS num_packages,
-- --     SUM(p.price) AS total_billing
-- -- FROM 
-- --     customer c
-- --     INNER JOIN sender s ON c.cust_id = s.CustomerID
-- --     INNER JOIN senderAddress sa ON c.cust_id = sa.CustomerID
-- --     INNER JOIN package pa ON s.CustomerID = pa.deliveryID
-- --     INNER JOIN courier co ON pa.courierID = co.courierID
-- --     INNER JOIN DeliveryInformation di ON pa.deliveryID = di.deliveryID
-- --     INNER JOIN payment p ON pa.packageID = p.package_id
-- -- GROUP BY 
-- --     c.cust_fname,
-- --     c.cust_lname,
-- --     p.price,
-- --     di.deliveryDate
-- -- ORDER BY 
-- --     total_billing DESC;

-- -- an sql query which manages the inventory packages such as the package type, the weight and size etc
-- SELECT Package.packageID, Package.pWeight, Package.price, Package.packageType, Package.packageSize
-- FROM Package
-- INNER JOIN Inventory ON Package.packageID = Inventory.packageID
-- WHERE Package.packageSize > 10 AND Inventory.quantity > 0
-- ORDER BY Package.price DESC;


-- GO
