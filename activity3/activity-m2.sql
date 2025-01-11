SET FOREIGN_KEY_CHECKS=0; -- Disable foreign key checks

DROP TABLE IF EXISTS InvoiceDetails;
DROP TABLE IF EXISTS Invoices;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS TermsCode;

SET FOREIGN_KEY_CHECKS=1; -- Re-enable foreign key checks

CREATE TABLE Customers (
    CustomerID INT(11) NOT NULL AUTO_INCREMENT,
    CustomerName VARCHAR(50) NOT NULL,
    AddressLine1 VARCHAR(50),
    AddressLine2 VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(50),
    YTDPurchases DECIMAL(19,2),
    PRIMARY KEY (CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, AddressLine1, AddressLine2, City, State, PostalCode, YTDPurchases)
VALUES 
(1, 'Seth Baker', '123 idk St', 'Apt 4', 'Corvallis', 'OR', '97330', 150.00),
(2, 'Billy Bob', '456 lol Blvd', NULL, 'Portland', 'OR', '97201', 300.00),
(3, 'Some Body', '789 database Ln', NULL, 'Bend', 'OR', '97701', 450.00);

CREATE TABLE TermsCode (
    TermsCodeID VARCHAR(50) NOT NULL,
    Description VARCHAR(50),
    PRIMARY KEY (TermsCodeID)
);

INSERT INTO TermsCode (TermsCodeID, Description)
VALUES 
('NET5', 'Payment due within 5 days'),
('NET30', 'Payment due within 30 days'),
('NET60', 'Payment due within 60 days');

CREATE TABLE Invoices (
    InvoiceID INT(11) NOT NULL AUTO_INCREMENT,
    CustomerID INT(11) NOT NULL,
    InvoiceDate DATETIME NOT NULL,
    TotalDue DECIMAL(19,2) NOT NULL,
    TermsCodeID VARCHAR(50) NOT NULL,
    PRIMARY KEY (InvoiceID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TermsCodeID) REFERENCES TermsCode(TermsCodeID)
);

INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, TotalDue, TermsCodeID)
VALUES 
(1, 1, '2024-10-01 12:00:00', 150.75, 'NET30'),
(2, 2, '2024-10-05 12:00:00', 300.50, 'NET60'),
(3, 3, '2024-10-10 12:00:00', 450.00, 'NET30');
