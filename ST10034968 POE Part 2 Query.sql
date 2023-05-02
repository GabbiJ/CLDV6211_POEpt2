/*Author: ST10034968*/
/*SQL Queries for POE Part 2*/

/*Creating database and tables*/
CREATE DATABASE ST10034968_TheRideYouRent;

USE ST10034968_TheRideYouRent;

CREATE TABLE ST10034968_Car (
CarNo VarChar(6) NOT NULL UNIQUE,
Car_Make VarChar(50) NOT NULL,
Car_Model VarChar(50) NOT NULL,
Body_Type VarChar(50) NOT NULL,
Km_Travelled DECIMAL(10, 2) NOT NULL,
Service_Km DECIMAL(10, 2) NOT NULL,
Available BIT NOT NULL, 
CONSTRAINT ST10034968_Car_PK PRIMARY KEY (CarNo)
);

CREATE TABLE ST10034968_Driver (
DriverID INT NOT NULL IDENTITY(1,1),
DName VarChar(100) NOT NULL,
DSurname VarChar(100) NOT NULL,
DEmail VarChar(255) NOT NULL,
DMobile VarChar(16) NOT NULL,
House_No VarChar(6) NOT NULL,
Street VarChar(100) NOT NULL,
City VarChar(100) NOT NULL,
Postal_Code INT NOT NULL,
Province VarChar(100) NOT NULL,
CONSTRAINT ST10034968_Driver_PK PRIMARY KEY (DriverID)
);

CREATE TABLE ST10034968_Inspector (
Inspector_no VarChar(4) NOT NULL UNIQUE,
InspName VarChar(100) NOT NULL,
InspSurname VarChar(100) NOT NULL,
InspEmail VarChar(255) NOT NULL,
InspMobile VarChar(16) NOT NULL
CONSTRAINT ST10034968_Inspector_PK PRIMARY KEY (Inspector_no)
);

CREATE TABLE ST10034968_Fine (
FineID INT NOT NULL IDENTITY(1,1),
Fine DECIMAL(10,2) NOT NULL,
CONSTRAINT ST10034968_Fine_PK PRIMARY KEY (FineID)
);

/*Lookup Tables*/
CREATE TABLE ST10034968_Rental (
RentalID INT NOT NULL IDENTITY(1,1),
CarNo VarChar(6) NOT NULL, 
Inspector_no VarChar(4) NOT NULL,
DriverID INT NOT NULL,
Rental_Fee Decimal(10,2) NOT NULL,
Start_Date DATE NOT NULL,
End_Date DATE NOT NULL,
CONSTRAINT ST10034968_Rental_PK PRIMARY KEY (RentalID),
CONSTRAINT FK_Car_Rental FOREIGN KEY (CarNo)
REFERENCES ST10034968_Car(CarNo),
CONSTRAINT FK_Inspector_Rental FOREIGN KEY (Inspector_no)
REFERENCES ST10034968_Inspector(Inspector_no),
CONSTRAINT FK_Driver_Rental FOREIGN KEY (DriverID)
REFERENCES ST10034968_Driver(DriverID),
);

CREATE TABLE ST10034968_Return (
ReturnID INT NOT NULL IDENTITY(1,1),
CarNo VarChar(6) NOT NULL,
DriverID INT NOT NULL,
Inspector_no VarChar(4) NOT NULL,
FineID INT,
Return_date DATE NOT NULL,
Elapsed_date INT,
CONSTRAINT ST10034968_Return_PK PRIMARY KEY (ReturnID),
CONSTRAINT FK_Car_Return FOREIGN KEY (CarNo)
REFERENCES ST10034968_Car(CarNo),
CONSTRAINT FK_Driver_Renturn FOREIGN KEY (DriverID)
REFERENCES ST10034968_Driver(DriverID),
CONSTRAINT FK_Inspector_Return FOREIGN KEY (Inspector_no)
REFERENCES ST10034968_Inspector(Inspector_no),
CONSTRAINT FK_Fine FOREIGN KEY (FineID)
REFERENCES ST10034968_Fine(FineID),
);

/*Populating tables*/
/*Car Table*/
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('HYU001', 'Hyundai', 'Grand i10 1.0 Motion', 'Hatchback', 1500, 15000, 1 );
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('HYU002', 'Hyundai', 'i20 1.2 Fluid', 'Hatchback', 3000, 15000, 1 );
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('BMW001', 'BMW', '320d 1.2', 'Sedan', 20000, 50000, 1 );
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('BMW002', 'BMW', '240d 1.4', 'Sedan', 9500, 15000, 1 );
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('TOY001', 'Toyota', 'Corolla 1.0', 'Sedan', 15000, 50000, 1 );
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('TOY002', 'Toyota', 'Avanza 1.0', 'SUV', 98000, 15000, 1 );
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('TOY003', 'Toyota', 'Corolla Quest 1.0', 'Sedan', 15000, 50000, 1 );
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('MER001', 'Mercedes Benz', 'c180', 'Sedan', 5200, 15000, 1 );
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('MER002', 'Mercedes Benz', 'A200 Sedan', 'Sedan', 4080, 15000, 1 );
INSERT INTO ST10034968_Car (CarNo, Car_Make, Car_Model, Body_Type, Km_Travelled, Service_Km, Available) 
VALUES ('FOR001', 'Ford', 'Fiesta 1.0', 'Sedan', 7600, 15000, 1 );

/*Checking data is correct*/
SELECT * 
FROM ST10034968_Car;

/*Inspector Table*/
INSERT INTO ST10034968_Inspector(Inspector_no, InspName, InspSurname, InspEmail, InspMobile) 
VALUES ('I101', 'Bud', 'Barnes', 'bud@therideyourent.com', '0821585359');
INSERT INTO ST10034968_Inspector(Inspector_no, InspName, InspSurname, InspEmail, InspMobile) 
VALUES ('I102', 'Tracy', 'Reeves', 'tracy@therideyourent.com', '0822889988');
INSERT INTO ST10034968_Inspector(Inspector_no, InspName, InspSurname, InspEmail, InspMobile) 
VALUES ('I103', 'Sandra', 'Goodwin', 'sandra@therideyourent.com', '0837695468');
INSERT INTO ST10034968_Inspector(Inspector_no, InspName, InspSurname, InspEmail, InspMobile) 
VALUES ('I104', 'Shannon', 'Burke', 'shannon@therideyourent.com', '0836802514');

/*Checking data is correct*/
SELECT * 
FROM ST10034968_Inspector;

/*Driver Table*/
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Gabrielle', 'Clarke', 'gorix10987@macauvpn.com', '0837113269', '917', 'Heuvel St', 'Botshabelo', 9781, 'Free State');
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Geoffrey', 'Franklin', 'noceti8743@drlatvia.com', '0847728052', '1114', 'Dorp St', 'Paarl', 7655, 'Western Cape');
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Fawn', 'Cooke', 'yegifav388@enamelme.com', '0821966584', '2158', 'Prospect St', 'Garsfontein', 0042, 'Gauteng');
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Darlene', 'Peters', 'mayeka4267@macauvpn.com', '0841221244', '2529', 'St. John Street', 'Somerset West', 7110, 'Western Cape');
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Vita', 'Soto', 'wegog55107@drlatvia.com', '0824567924', '1474', 'Wolmarans St', 'Sundra', 2200, 'Mpumalanga');
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Opal', 'Rehbein', 'yiyow34505@enpaypal.com', '0826864938', '697', 'Thutlwa St', 'Letaba', 0870, 'Limpopo');
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Vernon', 'Hodgson', 'gifeh11935@enamelme.com', '0855991446', '1935', 'Thutlwa St', 'Letsitele', 0885, 'Limpopo');
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Crispin', 'Wheatly', 'lilkon78255@macauvpn.com', '0838347945', '330', 'Sandown Rd', 'Cape Town', 8018, 'Western Cape');
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Melanie', 'Cunningham', 'sehapeb835@macauvpn.com', '0827329001', '616', 'Loop St', 'Atlantis', 7350, 'Western Cape');
INSERT INTO ST10034968_Driver(DName, DSurname, DEmail, DMobile, House_No, Street, City, Postal_Code, Province) 
VALUES ('Kevin', 'Peay', 'xajic53991@enpaypal.com', '0832077149', '814', 'Daffodil Dr', 'Elliotdale', 5118, 'Eastern Cape');

/*Checking data is correct*/
SELECT *
FROM ST10034968_Driver;

/*Rental*/
INSERT INTO ST10034968_Rental(CarNo, Inspector_no, DriverID, Rental_Fee, Start_Date, End_Date) 
VALUES ('HYU001', 'I101', 1, 5000, '2021-08-30', '2021-08-31');
INSERT INTO ST10034968_Rental(CarNo, Inspector_no, DriverID, Rental_Fee, Start_Date, End_Date) 
VALUES ('HYU002', 'I101', 1, 5000, '2021-09-01', '2021-09-10');
INSERT INTO ST10034968_Rental(CarNo, Inspector_no, DriverID, Rental_Fee, Start_Date, End_Date) 
VALUES ('FOR001', 'I101', 2, 6500, '2021-09-01', '2021-09-10');
INSERT INTO ST10034968_Rental(CarNo, Inspector_no, DriverID, Rental_Fee, Start_Date, End_Date) 
VALUES ('BMW002', 'I102', 5, 7000, '2021-09-20', '2021-09-25');
INSERT INTO ST10034968_Rental(CarNo, Inspector_no, DriverID, Rental_Fee, Start_Date, End_Date) 
VALUES ('TOY002', 'I102', 4, 5000, '2021-10-03', '2021-10-31');
INSERT INTO ST10034968_Rental(CarNo, Inspector_no, DriverID, Rental_Fee, Start_Date, End_Date) 
VALUES ('MER001', 'I103', 4, 8000, '2021-10-05', '2021-10-15');
INSERT INTO ST10034968_Rental(CarNo, Inspector_no, DriverID, Rental_Fee, Start_Date, End_Date) 
VALUES ('HYU002', 'I104', 7, 5000, '2021-12-01', '2022-02-10');
INSERT INTO ST10034968_Rental(CarNo, Inspector_no, DriverID, Rental_Fee, Start_Date, End_Date) 
VALUES ('TOY003', 'I104', 9, 5000, '2021-08-10', '2021-08-31');

/*Checking values are correct*/
SELECT RentalID , ST10034968_Car.CarNo, Car_Make, 
	Car_Model, InspName, InspSurname, DName, DSurname, Rental_Fee, Start_Date, End_Date
FROM ST10034968_Rental
JOIN ST10034968_Car
ON ST10034968_Rental.CarNo = ST10034968_Car.CarNo
JOIN ST10034968_Inspector
ON ST10034968_Rental.Inspector_no = ST10034968_Inspector.Inspector_no
JOIN ST10034968_Driver
ON ST10034968_Rental.DriverID = ST10034968_Driver.DriverID;

/*Fine*/
INSERT INTO ST10034968_Fine(Fine)
VALUES (2500);
INSERT INTO ST10034968_Fine(Fine)
VALUES (1000);
INSERT INTO ST10034968_Fine(Fine)
VALUES (500);

/*Checking values are correct*/
SELECT * 
FROM ST10034968_Fine;

/*Return*/
INSERT INTO ST10034968_Return(CarNo, Inspector_no, DriverID, Return_date, Elapsed_date) 
VALUES ('HYU001', 'I101', 1, '2021-08-31', 0);
INSERT INTO ST10034968_Return(CarNo, Inspector_no, DriverID, Return_date, Elapsed_date) 
VALUES ('HYU002', 'I101', 1, '2021-09-10', 0);
INSERT INTO ST10034968_Return(CarNo, Inspector_no, DriverID, Return_date, Elapsed_date) 
VALUES ('FOR001', 'I101', 2, '2021-09-10', 0);
INSERT INTO ST10034968_Return(CarNo, Inspector_no, DriverID, Return_date, Elapsed_date, FineID) 
VALUES ('BMW002', 'I102', 5, '2021-09-30', 5, 1);
INSERT INTO ST10034968_Return(CarNo, Inspector_no, DriverID, Return_date, Elapsed_date, FineID) 
VALUES ('TOY002', 'I102', 4, '2021-10-31', 2, 2);
INSERT INTO ST10034968_Return(CarNo, Inspector_no, DriverID, Return_date, Elapsed_date, FineID) 
VALUES ('MER001', 'I103', 4, '2021-10-15', 1, 3);
INSERT INTO ST10034968_Return(CarNo, Inspector_no, DriverID, Return_date, Elapsed_date) 
VALUES ('HYU002', 'I104', 7, '2022-02-10', 0);
INSERT INTO ST10034968_Return(CarNo, Inspector_no, DriverID, Return_date, Elapsed_date) 
VALUES ('TOY003', 'I104', 9, '2021-08-31', 0);

/*Checking values are correct*/
SELECT ReturnID, ST10034968_Return.CarNo, Car_Make, Car_Model, 
	InspName, InspSurname, DName, DSurname, Return_date, Elapsed_date, Fine
FROM ST10034968_Return
JOIN ST10034968_Car
ON ST10034968_Return.CarNo = ST10034968_Car.CarNo
JOIN ST10034968_Inspector
ON ST10034968_Return.Inspector_no = ST10034968_Inspector.Inspector_no
JOIN ST10034968_Driver
ON ST10034968_Return.DriverID = ST10034968_Driver.DriverID
LEFT JOIN ST10034968_Fine
ON ST10034968_Return.FineID = ST10034968_Fine.FineID;

/*Select Statements*/
/*Task 5*/
SELECT *
FROM ST10034968_Rental
JOIN ST10034968_Car
ON ST10034968_Rental.CarNo = ST10034968_Car.CarNo
JOIN ST10034968_Inspector
ON ST10034968_Rental.Inspector_no = ST10034968_Inspector.Inspector_no
JOIN ST10034968_Driver
ON ST10034968_Rental.DriverID = ST10034968_Driver.DriverID
WHERE Start_Date BETWEEN '2021-08-01' AND '2021-10-30';

/*Task 6*/
SELECT *
FROM ST10034968_Rental
JOIN ST10034968_Car
ON ST10034968_Rental.CarNo = ST10034968_Car.CarNo
JOIN ST10034968_Inspector
ON ST10034968_Rental.Inspector_no = ST10034968_Inspector.Inspector_no
JOIN ST10034968_Driver
ON ST10034968_Rental.DriverID = ST10034968_Driver.DriverID
WHERE ST10034968_Inspector.InspName = 'Bud' AND ST10034968_Inspector.InspSurname = 'Barnes';

/*Task 7*/
SELECT *
FROM ST10034968_Return
JOIN ST10034968_Car
ON ST10034968_Return.CarNo = ST10034968_Car.CarNo
JOIN ST10034968_Inspector
ON ST10034968_Return.Inspector_no = ST10034968_Inspector.Inspector_no
JOIN ST10034968_Driver
ON ST10034968_Return.DriverID = ST10034968_Driver.DriverID
WHERE ST10034968_Car.Car_Make = 'Toyota';

/*Task 8*/
SELECT Hyundai_Count = COUNT(*)
FROM ST10034968_Rental
JOIN ST10034968_Car
ON ST10034968_Rental.CarNo = ST10034968_Car.CarNo
WHERE ST10034968_Car.Car_Make = 'Hyundai';

/*Task 9*/
UPDATE ST10034968_Car 
SET Car_Model = 'Focus 1.0'
WHERE CarNo = 'FOR001';

/*Checking values have been updated*/
SELECT *
FROM ST10034968_Car;

/*Task 10*/
SELECT ST10034968_Rental.CarNo, Driver_Name = DName, Rental_Fee, Start_Date, End_Date, Availability = Available
FROM ST10034968_Rental
JOIN ST10034968_Car
ON ST10034968_Rental.CarNo = ST10034968_Car.CarNo
JOIN ST10034968_Inspector
ON ST10034968_Rental.Inspector_no = ST10034968_Inspector.Inspector_no
JOIN ST10034968_Driver
ON ST10034968_Rental.DriverID = ST10034968_Driver.DriverID;

/*Task 11*/
SELECT DISTINCT Car_Make
FROM ST10034968_Car
WHERE Available = 1;

/*Task 12*/
SELECT ST10034968_Car.CarNo, Km_Travelled, Service_Km, 
	CASE
		WHEN (Service_Km - Km_Travelled) <= 9000 THEN 'Yes'
		ELSE 'No'
	END AS Service_Soon
FROM ST10034968_Car;

/*Task 13*/
SELECT 
	ReturnID,
	Return_date, 
	GETDATE() AS Todays_Date,
	DATEDIFF(day, Return_date, GETDATE()) AS Elapsed_Number_Of_Days,
	DATEDIFF(day, Return_date, GETDATE()) * 500 AS Total_Fine
FROM ST10034968_Return;


