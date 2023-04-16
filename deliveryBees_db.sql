DROP DATABASE IF EXISTS deliveryBees;

CREATE DATABASE deliveryBees;

USE deliveryBees;
-- Create a new table called ‘Courier Details' in schema 'dbo' --
-- Drop the table if it already exists --

DROP TABLE IF EXISTS Courier;


CREATE TABLE Courier (
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
  cust_pass VARCHAR (40) NOT NULL UNIQUE,
  user_role int(11) NOT NULL
);

DROP TABLE IF EXISTS Sender;

CREATE TABLE Sender (
	senderID INT NOT NULL PRIMARY KEY,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);


DROP TABLE IF EXISTS SenderAddress;

CREATE TABLE SenderAddress(
	Street VARCHAR (50)  NOT NULL,
	houseNumber TINYINT(10)  NOT NULL,
	City VARCHAR (50)  NOT NULL,
	senderID INT,
    FOREIGN KEY (senderID) REFERENCES Sender(senderID)
);



CREATE TABLE recipient (
  recipientID INT NOT NULL PRIMARY KEY,
  cust_id INT NOT NULL,
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
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
	deliveryDate DATE NOT NULL,
    deliverystatus enum ("at the warehouse","In transit", "Delivered"),
    CourierId INT,
    FOREIGN KEY (CourierId) REFERENCES Courier (CourierId)
);

CREATE TABLE recipientAddress(
	recipientID INT NOT NULL,
	street VARCHAR(100) NOT NULL,
	houseNumber VARCHAR(20) NOT NULL PRIMARY KEY,
	city VARCHAR(70) NOT NULL,
	FOREIGN KEY (recipientID) REFERENCES recipient(recipientID)
);

CREATE TABLE couriervehiclerider(
	vehicleID INT NOT NULL,
	courierId INT NOT NULL,
	licenseNumber VARCHAR(100) NOT NULL,
	FOREIGN KEY (vehicleID) REFERENCES vehicle(id),
    FOREIGN KEY (courierId) REFERENCES Courier(courierId)
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

CREATE TABLE courierAvailabilty(
	courierId INT NOT NULL,
    start_time TIME,
    start_date DATE,
     end_time TIME,
    end_date DATE,
    FOREIGN KEY (courierId) REFERENCES Courier(courierId)
);



-- CONSTRAINTS--

--
-- Constraints for table `customer`
--
ALTER TABLE customer
ADD CONSTRAINT UQ_cust_email UNIQUE (cust_email);
-- ADD CONSTRAINT CHK_cust_phone CHECK (cust_phone LIKE '[0-9]%');


ALTER TABLE SenderAddress
ADD CONSTRAINT FK_SenderAddress_Customer FOREIGN KEY (senderID)
    REFERENCES Sender(senderID);

--
-- Constraints for table `Package`
--
ALTER TABLE Package
ADD CONSTRAINT FK_Package_DeliveryInformation FOREIGN KEY (deliveryID)
        REFERENCES DeliveryInformation(deliveryID),
ADD CONSTRAINT FK_Package_Courier FOREIGN KEY (courierID)
        REFERENCES Courier(CourierId);


--
-- Constraints for table `recipient`
--

ALTER TABLE recipient
ADD CONSTRAINT FK_recipient_Customer FOREIGN KEY (cust_id)
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
ALTER TABLE couriervehiclerider
-- ADD CONSTRAINT PK_courier PRIMARY KEY (vehicleID, courierID),
ADD CONSTRAINT UQ_courier_licenseNumber UNIQUE (licenseNumber);

--
-- DATABASE POPULATION--

INSERT INTO customer (cust_id, cust_fname, cust_lname, cust_email, cust_phone,cust_pass, user_role)
VALUES
  (1, 'Kwame', 'Appiah', 'kwame.appiah@gmail.com', '0241234567', '1l0v3k3nk3y', 1),
  (2, 'Adjoa', 'Boateng', 'adjoa.boateng@gmail.com', '0272345678', 'hdsf848rgh', 1),
  (3, 'Yaw', 'Kwakye', 'yaw.kwakye@gmail.com', '0203456789','idhoayd2094',2),
  (4, 'Akua', 'Owusu', 'akua.owusu@gmail.com', '0244567890','7845bf834YGIG',1),
  (5, 'Kofi', 'Addo', 'kofi.addo@gmail.com', '0545678901','893GEU89Y9',2),
  (6, 'Esi', 'Adu', 'esi.adu@gmail.com', '0246789012','SIHF6gyig#',2),
  (7, 'Yaw', 'Asante', 'yaw.asante@gmail.com', '0277890123','he79y%^',2),
  (8, 'Ama', 'Mensah', 'ama.mensah@gmail.com', '0209012345','huGHU876',1),
  (9, 'Kwesi', 'Addae', 'kwesi.addae@gmail.com', '0540123456','HIUSAI^*%^',2),
  (10, 'Abena', 'Osei', 'abena.osei@gmail.com', '0243456789','#(#0iudgcsui(660',1);

INSERT INTO recipient (recipientID, cust_id) VALUES
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
INSERT INTO Courier (CourierId, Rider_fname, Rider_lname, Rider_number) VALUES
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
   
INSERT INTO Sender (senderID, cust_id) VALUES
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
  
INSERT INTO SenderAddress (Street, houseNumber, City, senderID)
VALUES ('Adabraka Road', 12, 'Accra', 1),
       ('Cape Coast Highway', 23, 'Cape Coast', 2),
       ('Sunyani-Accra Road', 9, 'Sunyani', 3),
       ('Mampong Road', 7, 'Kumasi', 4),
       ('Nima Street', 18, 'Accra', 5),
       ('Kumasi-Accra Road', 13, 'Techiman', 6),
       ('Wa Road', 10, 'Bolgatanga', 7),
       ('Tema-Akosombo Road', 5, 'Akosombo', 8),
       ('Tamale Road', 14, 'Navrongo', 9),
       ('Adenta Street', 21, 'Accra', 10);
       
	

-- INSERT INTO SenderAddress VALUES
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
   
INSERT INTO DeliveryInformation (deliveryID, deliveryDate, deliverystatus,courierId)
VALUES
(101, '2023-04-16','in transit', 1),
(102, '2023-04-17','at the warehouse', 2),
(103, '2023-04-18','in transit',3),
(104, '2023-04-19', 'delivered',4),
(105, '2023-04-20','delivered',5),
(106, '2023-04-21','in transit',6),
(107, '2023-04-22','at the warehouse',7),
(108, '2023-04-23','at the warehouse',8),
(109, '2023-04-24','at the warehouse',9),
(110, '2023-04-25','in transit', 10);

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


INSERT INTO recipientAddress (recipientID, street, houseNumber, city)
VALUES 
(1, 'Oxford Street', '123', 'Accra'),
(2, 'Labadi Road', '456', 'Tema'),
(3, 'Ring Road Central', '789', 'Kumasi'),
(4, 'Beach Road', '1011', 'Cape Coast'),
(5, 'North Ridge', '1213', 'Tamale'),
(6, 'Adenta-Frafraha', '1415', 'Adenta'),
(7, 'Spintex Road', '1617', 'Teshie'),
(8, 'Kwame Nkrumah Avenue', '1819', 'Sekondi-Takoradi'),
(9, 'Kofi Annan Street', '2021', 'Sunyani'),
(10, 'Asafo Roundabout', '2223', 'Koforidua');

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


INSERT INTO couriervehiclerider (vehicleID, courierId, licenseNumber)
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

  
  INSERT INTO courierAvailabilty (courierId, start_time,start_date,end_time,end_date) VALUES
  (1, '09:38:00', '2021-04-23','16:24:00', '2021-04-23'),
  (2, '08:15:00', '2021-04-25','12:40:00', '2021-04-25'),
  (3, '09:40:00', '2021-05-13','14:10:00', '2021-05-15'),
  (4, '09:38:00', '2021-05-14','19:02:00', '2021-05-16'),
  (5, '10:15:00', '2023-04-01','16:50:05', '2023-04-01'),
  (6, '11:00:00', '2022-10-10','18:38:08', '2022-10-10'),
  (7, '08:30:00', '2021-03-12','20:00:30', '2021-03-12'),
  (8, '09:10:00', '2022-11-23','11:13:10', '2022-11-23'),
  (9, '10:06:00', '2021-08-20','19:30:03', '2021-08-20'),
  (10, '09:08:00', '2021-01-30','12:40:10', '2021-01-30');
  

-- Query that keeps track of invoices and billings based on the delivery services rendered
SELECT 
  c.cust_fname,
  c.cust_lname,
  COUNT(p.packageID) as num_packages,
  SUM(p.price) as total_price,
  COUNT(DISTINCT d.deliveryID) as num_deliveries,
  SUM(IF(p.price > 50, p.price * 0.1, 0)) as discount
FROM 
  customer c
  LEFT JOIN recipient r ON c.cust_id = r.cust_id
  LEFT JOIN Package p ON r.recipientID = p.recipientAddressID
  LEFT JOIN DeliveryInformation d ON p.deliveryID = d.deliveryID
GROUP BY 
  c.cust_id
HAVING 
  num_deliveries > 5
ORDER BY 
  total_price DESC;

-- sql query which manages the inventory packages such as the package type, the weight and size etc .
  -- This query selects the package ID, weight, price, and customer ID from the Package table, as well as the make, model, 
  -- and type of vehicle being used to transport the package, and the delivery status from the DeliveryInformation table. 
  -- It uses an inner join to combine information from the Package, couriervehiclerider, vehicle, and DeliveryInformation tables. 
  -- The WHERE clause filters the results to only include packages with a weight greater than 0.05 kg. The results are sorted by 
  -- package weight in descending order.
SELECT Package.packageID, Package.pWeight, Package.price, Package.cust_id, vehicle.make, vehicle.model, vehicle.type, DeliveryInformation.deliverystatus
FROM Package
INNER JOIN couriervehiclerider ON Package.courierID = couriervehiclerider.courierID
INNER JOIN vehicle ON couriervehiclerider.vehicleID = vehicle.id
INNER JOIN DeliveryInformation ON Package.deliveryID = DeliveryInformation.deliveryID
WHERE Package.pWeight > 0.05
ORDER BY Package.pWeight DESC;
  
  
-- query for identifying vehicle lincense number for riders in Ga West (GW)
SELECT vehicle.id, courier.licenseNumber
FROM courier
INNER JOIN vehicle ON vehicle.id = courier.vehicleID
WHERE courier.licenseNumber LIKE 'GW%';
