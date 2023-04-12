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


GO
