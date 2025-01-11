CREATE DATABASE Pharmacy;
SHOW DATABASES;
USE Pharmacy;

DROP TABLE Pharmacy.Customer;
DROP TABLE Pharmacy.Supplier; 
DROP TABLE Pharmacy.SalesRecord;
DROP TABLE Pharmacy.Manufacturer;
DROP TABLE Pharmacy.Medicine; 
DROP TABLE Pharmacy.CustMedPrescription;
DROP TABLE Pharmacy.SalesMedicine;

-- Customer table
CREATE TABLE Pharmacy.Customer (
    CustomerID VARCHAR(3) PRIMARY KEY,
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(15) NULL,
    Telephone VARCHAR(14) NOT NULL,
    Address VARCHAR(200) NULL,
    BirthDate DATE NULL
);

INSERT INTO Pharmacy.Customer (CustomerID, FirstName, LastName, Telephone, Address, BirthDate) VALUES
(1, 'Jackson', 'Wang', '(520) 599-5123', '345 South Street', '1967-03-02'),
(2, 'Yoonki', 'Min', '(580) 599-8760', '780 Avenue Town', '2002-01-23'),
(3, 'Milind', 'Ahire', '(334) 509-1990', '947 Down Town', '1987-09-05'),
(4, 'Aditi', 'Whagire', '(990) 665-1657', '486 Campus Crossing', '1997-09-01'),
(5, 'Ashley', 'Brown', '(230) 695-1123', '204 U at Park', '1987-09-05'),
(6, 'Peter', 'Johnson', '(590) 655-1008', '106 A Mid Town', '2006-11-01'),
(7, 'Namjun', NULL, '(483) 249-3420', '15 Long Ave', '1994-11-11'),
(8, 'John', NULL, '(920) 243-4530', '24 J M Road', '1975-05-03'),
(9, 'Sohail', 'Khan', '(492) 249-3950', '12 Marine Drive', '1976-02-12'),
(10, 'Rohit', 'Verma', '(478) 555-8822', '15 Highland market', '2001-12-31');

SELECT * FROM Pharmacy.Customer;

-- Supplier table
CREATE TABLE Pharmacy.Supplier (
    SupplierID VARCHAR(3) PRIMARY KEY,
    SupplierName VARCHAR(30) NOT NULL
);

INSERT INTO Pharmacy.Supplier (SupplierID, SupplierName) VALUES
('S1', 'Medicare'),
('S2', 'Medline'),
('S3', 'Cardinal Health'),
('S4', 'Lexicon'),
('S5', 'US Pharma'),
('S6', 'DSS Health');

SELECT * FROM Pharmacy.Supplier;

-- Manufacturer table
CREATE TABLE Pharmacy.Manufacturer (
    ManufacturerID VARCHAR(3) PRIMARY KEY,
    ManufacturerName VARCHAR(30) NOT NULL
);

INSERT INTO Pharmacy.Manufacturer (ManufacturerID, ManufacturerName) VALUES
('M1', 'Kaleo'),
('M2', 'Pfizer'),
('M3', 'Johnson & Johnson'),
('M4', 'Major Pharmaceuticals'),
('M5', 'Amphastar Pharmaceuticals'),
('M6', 'Amgen'),
('M7', 'Biovista');

SELECT * FROM Pharmacy.Manufacturer;

-- Medicine table
CREATE TABLE Pharmacy.Medicine (
    MedicineID VARCHAR(3) PRIMARY KEY,
    SupplierID VARCHAR(3) NOT NULL,
    ManufacturerID VARCHAR(3) NOT NULL,
    MedName VARCHAR(30) NOT NULL,
    ExpiryDate DATE NOT NULL,
    PurchasePrice NUMERIC(10, 2) NOT NULL,
    SellingPrice NUMERIC(10, 2) NOT NULL,
    QuantityAvailable INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Pharmacy.Supplier(SupplierID),
    FOREIGN KEY (ManufacturerID) REFERENCES Pharmacy.Manufacturer(ManufacturerID)
);

INSERT INTO Pharmacy.Medicine (MedicineID, MedName, ExpiryDate, PurchasePrice, SellingPrice, QuantityAvailable
, SupplierID, ManufacturerID) VALUES
('Q1', 'Auvi-Q', '2025-03-07', 30, 35, 13, 'S1', 'M1'),
('Q2', 'Advil', '2025-05-17', 13, 15, 50, 'S2', 'M2'),
('Q3', 'Banophen', '2024-08-15', 20, 22, 3, 'S1', 'M4'),
('Q4', 'Sudafed PE', '2025-03-12', 10, 12, 30, 'S3', 'M3'),
('Q5', 'Motrin', '2024-06-07', 11, 12, 25, 'S2', 'M3'),
('Q6', 'Arthrotec', '2027-02-20', 35, 38, 7, 'S4', 'M2'),
('Q7', 'Primatene Mist', '2025-08-15', 40, 42, 13, 'S3', 'M5'),
('Q8', 'Benadryl', '2024-12-11', 8, 11, 58, 'S2', 'M3');

SELECT * FROM Pharmacy.Medicine;

-- Prescription table
CREATE TABLE Pharmacy.CustMedPrescription (
    CustomerID VARCHAR(3) NOT NULL,
    MedicineID VARCHAR(3) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Pharmacy.Customer(CustomerID),
    FOREIGN KEY (MedicineID) REFERENCES Pharmacy.Medicine(MedicineID)
);

INSERT INTO Pharmacy.CustMedPrescription (CustomerID, MedicineID) VALUES
(1, 'Q4'),
(1, 'Q2'),
(2, 'Q3'),
(2, 'Q6'),
(3, 'Q2'),
(4, 'Q1'),
(5, 'Q4'),
(5, 'Q3'),
(5, 'Q5'),
(6, 'Q6'),
(6, 'Q2'),
(7, 'Q8'),
(8, 'Q5'),
(9, 'Q8'),
(9, 'Q3'),
(10, 'Q4'),
(10, 'Q5');

SELECT * FROM Pharmacy.CustMedPrescription;

-- sales data
CREATE TABLE Pharmacy.SalesRecord (
    SalesID VARCHAR(3) PRIMARY KEY,
    CustFirstName VARCHAR(15) NOT NULL,
    CustLastName VARCHAR(15)  NULL,
    SalesDate DATE NOT NULL
);

INSERT INTO Pharmacy.SalesRecord (SalesID, CustFirstName, CustLastName, SalesDate) VALUES
('1', 'Ashley', 'Brown', '2023-03-07'),
('2', 'Jackson', 'Wang', '2024-01-12'),
('3', 'Peter', 'Johnson', '2022-07-10'),
('4', 'Aditi', 'Whagire', '2022-07-10'),
('5', 'Yoonki', 'Min', '2023-05-17'),
('6', 'Sohail', 'Khan', '2022-01-25'),
('7', 'John', NULL, '2023-04-13'),
('8', 'Rohit', 'Verma', '2024-02-20'),
('9', 'Jackson', 'Wang', '2022-12-11'),
('10', 'Sohail', 'Khan', '2023-09-26'),
('11', 'Namjun', NULL, '2023-09-26'),
('12', 'Yoonki', 'Min', '2024-01-01'),
('13', 'Ashley', 'Brown', '2022-06-13'),
('14', 'Peter', 'Johnson', '2024-02-22'),
('15', 'Rohit', 'Verma', '2022-07-13'),
('16', 'Ashley', 'Brown', '2023-08-13'),
('17', 'Jackson', 'Wang', '2023-01-25');

SELECT * FROM Pharmacy.SalesRecord;

-- Medicine sales data
CREATE TABLE Pharmacy.SalesMedicine (
    SalesID VARCHAR(3) NOT NULL,
    MedicineID VARCHAR(3) NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (SalesID) REFERENCES Pharmacy.SalesRecord(SalesID),
    FOREIGN KEY (MedicineID) REFERENCES Pharmacy.Medicine(MedicineID)
);

INSERT INTO Pharmacy.SalesMedicine (SalesID, MedicineID, Quantity) VALUES
('1', 'Q3', 2),
('1', 'Q5', 4),
('2', 'Q2', 2),
('3', 'Q2', 5),
('4', 'Q1', 3),
('5', 'Q6', 1),
('6', 'Q8', 1),
('7', 'Q5', 5),
('8', 'Q5', 2),
('9', 'Q4', 1),
('9', 'Q2', 3),
('10', 'Q3', 2),
('11', 'Q8', 1),
('12', 'Q3', 3),
('12', 'Q6', 1),
('13', 'Q4', 1),
('14', 'Q6', 5),
('15', 'Q4', 1),
('15', 'Q5', 1),
('16', 'Q4', 1),
('16', 'Q3', 1),
('16', 'Q5', 1),
('17', 'Q2', 2);

SELECT * FROM Pharmacy.SalesMedicine;