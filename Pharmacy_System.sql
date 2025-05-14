
-- Use Case : Pharmacy Management System
-- Database: `pharmacy_system`
--
-- --------------------------------------------------------
CREATE DATABASE Pharmacy_System;
USE Pharmacy_System;

--
-- Table structure for table `Customer`
--
CREATE TABLE Customer(
    cust_ID INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(15),
    lname VARCHAR(15),
    gender VARCHAR(15),
    age INT,
    contact_add VARCHAR(100),
    cust_email  VARCHAR(20),
	cust_pass  VARCHAR(20)
);
 
 -- Inserting data into table `Customer`
--

INSERT INTO `Customer` (`cust_id`, `fname`, `lname`, `gender`, `age`, `contact_add`, `cust_email`,`cust_pass`) VALUES
(1, 'Mark', 'Hughes', 'male', '25', 'Kiambu', 'markHughes@yahoo.com', 'Hughes@123'),
(2, 'Beth', 'Onyango', 'female', '55', 'Bungoma', 'Beth254@gmail.com', 'Onyango_Beth200'),
(3, 'Franco', 'Juma', 'male', '25', 'Watamu', 'Juma01@yahoo.com', 'Juma-hub@123');
-- --------------------------------------------------------


--
-- Table structure for table `Medicines`
--

 CREATE TABLE Medicines(
 med_ID INT auto_increment primary Key,
 med_category VARCHAR(50),
 name VARCHAR(50),
 description VARCHAR(100),
 price INT
 );
 
 INSERT INTO `Medicines` (`med_id`, `med_category`, `name`, `description`, `price`) VALUES
(1, 'Antibiotics', 'Flagyl', 'Pain Reliever', '200'),
(2, 'PainKillers', 'Panadol', 'Cure for Headache', '120');

 -- --------------------------------------------------------
 
 -- Table structure for table `Purchasing`
 
  CREATE TABLE Purchasing(
 purchase_ID INT auto_increment primary Key,
 cust_ID INT,  -- Defines the customer Id column from customer table
 med_ID INT,
 amount INT,
 date TIMESTAMP,
 FOREIGN KEY(cust_ID) REFERENCES Customer(cust_ID),
 FOREIGN KEY(med_ID) REFERENCES Medicines(med_ID)
 );
 
 -- Inserting data into table `Pharmacist`
 
 CREATE TABLE Pharmacist(
 phar_ID INT auto_increment primary Key,
 fname VARCHAR(15),
 lname VARCHAR(15),
 gender VARCHAR(15),
 age INT,
 admin_add VARCHAR(100),
 admin_email  VARCHAR(20),
 admin_pass VARCHAR(20)
  );
  
  -- Inserting data into table `Sales`
  
  CREATE TABLE Sales(
 sales_ID INT auto_increment primary Key,
 phar_ID INT,
 cust_ID INT,
 med_ID INT,
 purchase_ID INT,
 date TIMESTAMP,
 total_amount INT,
 FOREIGN KEY(phar_ID) REFERENCES Pharmacist(phar_ID),
 FOREIGN KEY(cust_ID) REFERENCES Customer(cust_ID),
 FOREIGN KEY(med_ID) REFERENCES Medicines(med_ID),
 FOREIGN KEY(purchase_ID) REFERENCES Purchasing(purchase_ID)
 );
 
  -- Inserting data into table `Reports`
 
 CREATE TABLE Reports(
 report_ID INT auto_increment primary Key,
 purchase_ID INT,
 sales_ID INT,
 cust_ID INT,
 date TIMESTAMP,
 FOREIGN KEY(purchase_ID) REFERENCES Purchasing(purchase_ID),
 FOREIGN KEY(sales_ID) REFERENCES Sales(sales_ID),
 FOREIGN KEY(cust_ID) REFERENCES Customer(cust_ID)
 );
 
 -- Creating a user (Juma) 
 CREATE USER juma@localhost IDENTIFIED BY '1234';
 
 
 
