CREATE DATABASE deliveryBees;

USE deliveryBees;
-- Create a new table called ‘Courier Details' in schema 'dbo' --
-- Drop the table if it already exists --

IF OBJECT_ID('dbo.Courier', 'U') IS NOT NULL
DROP TABLE dbo.Courier 
GO

CREATE TABLE dbo.Courier (
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
);

IF OBJECT_ID('dbo.Sender', 'U') IS NOT NULL
DROP TABLE dbo.Sender 
GO

CREATE TABLE dbo.Sender (

CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID),
);


IF OBJECT_ID('dbo.SenderAddress', 'U') IS NOT NULL
DROP TABLE dbo.SenderAddress 
GO
CREATE TABLE dbo.SenderAddress(
	Street VARCHAR (50)  NOT NULL,
	houseNumber TINYINT(10)  NOT NULL,
	City VARCHAR (50)  NOT NULL,
	Country   CHAR (50)  NOT NULL,
	CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID),
);

CREATE TABLE Package(
	packageID INT NOT NULL,
	deliveryID INT NOT NULL,
	courierID INT NOT NULL,
	recipientAddressID INT NOT NULL,
	pWeight DECIMAL(10,2) NOT NULL,
	price DECIMAL(10,2) NOT NULL
);

CREATE TABLE recipient (
  id INT PRIMARY KEY,
  FOREIGN KEY (id) REFERENCES customer(cust_id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE payment (
  id INT PRIMARY KEY,
  amount DECIMAL(10,2) NOT NULL,
  payment_date DATE NOT NULL,
  courier_id INT NOT NULL,
  recipient_id INT NOT NULL,
  package_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (courier_id) REFERENCES courier(id),
  FOREIGN KEY (recipient_id) REFERENCES recipient(id),
  FOREIGN KEY (package_id) REFERENCES package(id)
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
	deliveryID INT NOT NULL,
	deliveryDate DATE NOT NULL
);

CREATE TABLE recipientAddress(
	customerID INT NOT NULL,
	street VARCHAR(100) NOT NULL,
	houseNumber VARCHAR(20) NOT NULL,
	city VARCHAR(70) NOT NULL,
	country VARCHAR(70) NOT NULL
);

CREATE TABLE courier(
	vehicleID INT NOT NULL,
	courierID INT NOT NULL,
	licenseNumber VARCHAR(100) NOT NULL
);


                            --DATABASE POPULATION--

-- Insert rows into table 'Courier'
INSERT INTO dbo.Courier VALUES
   ( 1, N'Orlando', N'August', N'+233507384211'),
   ( 2, N'Keith', N'Benson', N'+2332709405800'),
   ( 3, N'Donna', N'Carlos', N'+2332648329103'),
   ( 4, N'Judas', N'Nti', N'+2332423943320'),
   ( 5, N'Basil', N'Asamoah', N'+2332400567799');

   INSERT INTO dbo.SenderAddress VALUES
   ( N'Outer Ring Road 1', N'OR1', N'Accra'),
   ( N'Ablekuma South', N'AS02', N'Tema'),
   ( N'1st Circular Road', N'645CR', N'Accra Central'),
   ( N'Apple Street', N'67ASJ', N'Community 23'),
   ( N'Abidjan Avenue', N'AA456', N'Accra'),
   ( N'Cocoa Street', N'9078CS', N'Accra'),
   ( N'4th Dade Street', N'67DS4', N'Ga West'),
   ( N'Link Road', N'1LR', N'Accral South'),
   ( N'Abele Street', N'AS89', N'Community 9'),
   ( N'Emmause Lane', N'78EL89', N'Community 25')


INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (1,"lioness","North","130 kg","40 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (2,"tiger","South","246 kg","58 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (3,"lion","North","190 kg","40 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (4,"cheetah","East","65 kg","25 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (5,"leopard","East","31 kg","20 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (6,"jaguar","East","90 kg","30 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (7,"puma","West","93 kg","31 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (8,"tiger","South","246 kg","58 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (9,"panther","West","88 kg","29 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recipientAddressID, pWeight, price) VALUES (10,"lion","North","190 kg","40 kg"); 


INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (1,1,"Online");  
INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (2,2,"Online");  
INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (3,3,"In-person");  
INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (4,4,"Online");  
INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (5,5,"In-person");  
INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (6,6,"In-person");  
INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (7,7,"In-person");  
INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (8,8,"Online");  
INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (9,9,"In-person");  
INSERT INTO DeliveryInformation(deliveryID, deliveryDate) VALUES (10,10,"Online");  


INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("Kwame Ato","+233554327586","Burma Camp - Accra","Speedy");  
INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("Lizbeth Cole","+233574827586","Awosie - Accra","Calcius");  
INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("Mary Otchere","+233248576586","Airport Residential Area - Accra","Kiera");  
INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("Yaw Kross","+233244327586","Spintex - Accra","Infinity");  
INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("Delilah Jones","+233234757586","Teshie Nungua - Accra","Amba");  
INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("Vera Akwei","+233559748328","Dansoman(SSNIT) - Accra","Bridge"); 
INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("John Kennedy","+23323982785","Tse-Addo - Accra", "Killer");  
INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("Eyram Adjovi","+233279823579","Trassaco-Valley(Plot 1) - Accra","Ariel");  
INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("Nii Amon Atukweifio","+233268794125","Ashongmang Estate - Accra","Aliki");  
INSERT INTO recipientAddress(recipientAddressID, street, houseNumber, city, country) VALUES ("Erica Sackey","+233279842578","East-Airport - Accra","Corvette"); 
 

INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (1,1,"Online");  
INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (2,2,"Online");  
INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (3,3,"In-person");  
INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (4,4,"Online");  
INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (5,5,"In-person");  
INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (6,6,"In-person");  
INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (7,7,"In-person");  
INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (8,8,"Online");  
INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (9,9,"In-person");  
INSERT INTO courier(vehicleID, courierID, licenseNumber) VALUES (10,10,"Online");  
 


INSERT INTO customer (cust_id, cust_fname, cust_lname, cust_email, cust_phone, address)
VALUES
  (1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '123 Main St, Anytown USA'),
  (2, 'Jane', 'Smith', 'janesmith@example.com', '555-5678', '456 Oak St, Anytown USA'),
  (3, 'Bob', 'Johnson', 'bjohnson@example.com', '555-9012', '789 Elm St, Anytown USA'),
  (4, 'Mary', 'Brown', 'mbrown@example.com', '555-3456', '234 Pine St, Anytown USA'),
  (5, 'Tom', 'Jones', 'tjones@example.com', '555-7890', '567 Maple St, Anytown USA'),
  (6, 'Sara', 'Lee', 'slee@example.com', '555-2345', '890 Cherry St, Anytown USA'),
  (7, 'David', 'Nguyen', 'davidnguyen@example.com', '555-6789', '1234 Elmwood Ave, Anytown USA'),
  (8, 'Lisa', 'Kim', 'lisakim@example.com', '555-4321', '5678 Oakwood Blvd, Anytown USA'),
  (9, 'Emily', 'Garcia', 'emilygarcia@example.com', '555-8765', '9012 Pine St, Anytown USA'),
  (10, 'Mark', 'Taylor', 'marktaylor@example.com', '555-2109', '3456 Maple Ave, Anytown USA');



INSERT INTO payment (id, amount, payment_date, courier_id, recipient_id, package_id)
VALUES
  (1, 25.00, '2023-04-01', 1, 3, 5),
  (2, 20.00, '2023-04-02', 2, 4, 6),
  (3, 15.50, '2023-04-03', 1, 2, 3),
  (4, 18.75, '2023-04-04', 3, 1, 4),
  (5, 10.00, '2023-04-05', 2, 5, 2);


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



GO
