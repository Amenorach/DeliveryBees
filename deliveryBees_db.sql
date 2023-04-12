CREATE DATABASE deliveryBees;

USE deliveryBees;
-- Create a new table called ‘Courier Details' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Courier', 'U') IS NOT NULL
DROP TABLE dbo.Courier 
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Courier (
   CourierId        INT    NOT NULL  PRIMARY KEY, 
   Rider_fname      VARCHAR (10)  NOT NULL,
   Rider_lname  VARCHAR(10)  NOT NULL,
   Rider_number   NVARCHAR(30)  NOT NULL
);

CREATE TABLE dbo.Sender (

CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID),
);


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
	recieptAddressID INT NOT NULL,
	pWeight DECIMAL(10,2) NOT NULL,
	price DECIMAL(10,2) NOT NULL
);

CREATE TABLE DeliveryInformation(
	deliveryID INT NOT NULL,
	deliveryDate DATE NOT NULL
);

CREATE TABLE recieptAddress(
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


INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (1,"lioness","North","130 kg","40 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (2,"tiger","South","246 kg","58 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (3,"lion","North","190 kg","40 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (4,"cheetah","East","65 kg","25 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (5,"leopard","East","31 kg","20 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (6,"jaguar","East","90 kg","30 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (7,"puma","West","93 kg","31 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (8,"tiger","South","246 kg","58 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (9,"panther","West","88 kg","29 kg"); 
INSERT INTO Package(packageID, deliveryID, courierID, recieptAddressID, pWeight, price) VALUES (10,"lion","North","190 kg","40 kg"); 


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


INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("Kwame Ato","+233554327586","Burma Camp - Accra","Speedy");  
INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("Lizbeth Cole","+233574827586","Awosie - Accra","Calcius");  
INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("Mary Otchere","+233248576586","Airport Residential Area - Accra","Kiera");  
INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("Yaw Kross","+233244327586","Spintex - Accra","Infinity");  
INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("Delilah Jones","+233234757586","Teshie Nungua - Accra","Amba");  
INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("Vera Akwei","+233559748328","Dansoman(SSNIT) - Accra","Bridge"); 
INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("John Kennedy","+23323982785","Tse-Addo - Accra", "Killer");  
INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("Eyram Adjovi","+233279823579","Trassaco-Valley(Plot 1) - Accra","Ariel");  
INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("Nii Amon Atukweifio","+233268794125","Ashongmang Estate - Accra","Aliki");  
INSERT INTO recieptAddress(recieptAddressID, street, houseNumber, city, country) VALUES ("Erica Sackey","+233279842578","East-Airport - Accra","Corvette"); 
 

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
 

GO
